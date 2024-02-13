unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uJAMControls, JAMLabelEdit, Menus, ExtCtrls, uJAMContainers,
  ComCtrls;

type
  TfrmPrincipal = class(TForm)
    mnuCopias: TPopupMenu;
    mnuEjecutar: TMenuItem;
    JAMPanel1: TJAMPanel;
    lbPath: TListBox;
    lbCopias: TJAMListBox;
    edUltCopia: TJAMLabelEdit;
    edPathDestino: TJAMLabelEdit;
    Label2: TLabel;
    Label1: TLabel;
    pnProgreso: TJAMPanel;
    lblCopia: TStaticText;
    lblArchivo: TStaticText;
    pbCopia: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure lbCopiasClick(Sender: TObject);
    procedure mnuEjecutarClick(Sender: TObject);
    procedure mnuCopiasPopup(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    slLog: TStringList;
    slArchivos: TStringList;
    sLogName: TFileName;
    sExtExclComp: string;
    lComprimir: Boolean;

    procedure CargaDatosIni;
    procedure ActualizaDatosCopia;
    procedure EjecutarCopias;
    procedure EjecutarCopia(nCopia: Integer);
    procedure CopiaArchivo(const sOrigen, sDestino: string);
    function ArchivosDiferentes(const sArchivo1, sArchivo2: TFileName): Boolean;
    procedure IniciaProgreso(const sCopia: string; nMax: Integer);
    procedure CierraProgreso;
    procedure ActualizaProgreso(const sArchivo: string; nActual: Integer);
    procedure WriteLog(const sLog: string);
    procedure SaveLog;
    procedure MarcaBorrados(slIndice, slOrigen: TStrings);
    procedure CopiaTerminada(sCopia: string);
    procedure ComprimeArchivo(sOrigen, sDestino: TFileName);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses IniFiles, uCommon, FileCtrl, JRZip;

const
  FILE_INI = 'Copias.ini';
  FILE_INDEX = 'index.txt';
  FILE_INDEX_BORRADOS = 'index_borrados.txt';
  SECCION_PARAMS = 'Params';

{$R *.DFM}

{ TfrmPrincipal }

procedure TfrmPrincipal.ActualizaDatosCopia;

var
  sPath: string;

begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + FILE_INI) do
    try
      edPathDestino.Text := ReadString(lbCopias.Items[lbCopias.ItemIndex],'path_destino','');
      edUltCopia.Text := ReadString(lbCopias.Items[lbCopias.ItemIndex],'ult_copia','');
      lComprimir := ReadString(lbCopias.Items[lbCopias.ItemIndex],'compresion','0') = '1';
      lbPath.Clear;
      sPath := ReadString(lbCopias.Items[lbCopias.ItemIndex],'path_' +
        IntToStr(lbPath.Items.Count + 1),'#');
      while sPath <> '#' do begin
        lbPath.Items.Add(sPath);
        sPath := ReadString(lbCopias.Items[lbCopias.ItemIndex],'path_' +
          IntToStr(lbPath.Items.Count + 1),'#');
      end;
      sExtExclComp := ReadString(SECCION_PARAMS,'ext_excl_comp','');
    finally
      Free;
    end;

  Application.ProcessMessages;
end;

procedure TfrmPrincipal.CargaDatosIni;

var
  nCont: Integer;

begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + FILE_INI) do
    try
      ReadSections(lbCopias.Items);
      for nCont := lbCopias.Items.Count - 1 downto 0 do
        if lbCopias.Items[nCont] = SECCION_PARAMS then
          lbCopias.Items.Delete(nCont);
      lbCopias.ItemIndex := 0;
    finally
      Free;
    end;

  ActualizaDatosCopia;
end;

procedure TfrmPrincipal.EjecutarCopias;

var
  nCont: Integer;

begin
  WriteLog('Inicio de la copia de seguridad');
  try
    if not Assigned(slArchivos) then slArchivos := TStringList.Create;
    for nCont := 0 to lbCopias.Items.Count - 1 do
      if lbCopias.Selected[nCont] then EjecutarCopia(nCont);
  finally
    SaveLog;
    ShowMessage('Copias de seguridad terminadas');
    CierraProgreso;
  end;
end;

procedure TfrmPrincipal.EjecutarCopia(nCopia: Integer);

var
  nCont: Integer;
  slIndex: TStringList;
  nPos: TLinePos;
  lCopiar: Boolean;
  sNombreCopia: TFileName;
  nCopiados: Integer;
  nIguales: Integer;
  nErrores: Integer;
  sExtCopia: string;
  sUltName: string;
  nPosExt: Integer;
  nUltInd: Int64;

begin
  lbCopias.ItemIndex := nCopia;
  ActualizaDatosCopia;
  if not DirectoryExists(edPathDestino.Text) then
    if not ForceDirectories(edPathDestino.Text) then begin
      WriteLog('!! No se pudo crear el directorio de destino [' + edPathDestino.Text + ']');
      WriteLog('** Copia [' + lbCopias.Items[nCopia] + '] terminada');
      Exit;
    end;

  slIndex := TStringList.Create;
  try
    if FileExists(edPathDestino.Text + FILE_INDEX) then begin
      slIndex.LoadFromFile(edPathDestino.Text + FILE_INDEX);
      slIndex.Sort;
      nPosExt := Pos('.',ExtractFileName(slIndex.Names[slIndex.Count - 1]));
      sUltName := Copy(ExtractFileName(slIndex.Names[slIndex.Count - 1]),1,nPosExt - 1);
      nUltInd := ToDecimal(sUltName,36);
    end
    else
      nUltInd := 0;

    slArchivos.Clear;
    for nCont := 0 to lbPath.Items.Count - 1 do
      ListDirectoryFiles(lbPath.Items[nCont] + '*.*',slArchivos);
    IniciaProgreso(lbCopias.Items[nCopia],slArchivos.Count);
    nCopiados := 0;
    nIguales := 0;
    nErrores := 0;
    for nCont := 0 to slArchivos.Count - 1 do begin
      ActualizaProgreso(slArchivos[nCont],nCont + 1);
      lCopiar := False;
      nPos := LinePos(slArchivos[nCont],slIndex,True);
      lCopiar := not LinePosToBoolean(nPos);
      if lCopiar then begin
        sExtCopia := ExtractFileExt(slArchivos[nCont]);
        sNombreCopia := ToBase(IntToStr(nUltInd + 1),10,36,8) + sExtCopia;
        if lComprimir and (Pos(sExtCopia,sExtExclComp) = 0) then
          sNombreCopia := sNombreCopia + '.zip';
      end
      else
        sNombreCopia := slIndex.Names[nPos.nLine];
      if not lCopiar then
        lCopiar := ArchivosDiferentes(edPathDestino.Text + slIndex.Names[nPos.nLine],
          slArchivos[nCont]);
      if lCopiar then begin
        try
          if lComprimir and (Pos(sExtCopia,sExtExclComp) = 0) then begin
            ActualizaProgreso('Comprimiendo ' + slArchivos[nCont],nCont + 1);
            ComprimeArchivo(slArchivos[nCont],edPathDestino.Text + sNombreCopia);
            ActualizaProgreso(slArchivos[nCont],nCont + 1);
          end
          else
            CopiaArchivo(slArchivos[nCont],edPathDestino.Text + sNombreCopia);
          Inc(nCopiados);
          Inc(nUltInd);
        except
          on E: EWin32Error do begin
            Inc(nErrores);
            WriteLog(E.Message);
          end;
          on E: Exception do WriteLog(E.Message);
        end;
      end
      else
        Inc(nIguales);
      if not LinePosToBoolean(nPos) then begin
        slIndex.Add(sNombreCopia + '=' + slArchivos[nCont]);
        WriteLog('Archivo nuevo [' + sNombreCopia + '=' + slArchivos[nCont] + ']');
      end;
    end;
    MarcaBorrados(slIndex,slArchivos);
    WriteLog('** Copia [' + lbCopias.Items[nCopia] + '] terminada');
    WriteLog('Se copiaron ' + IntToStr(nCopiados) + ' archivos');
    WriteLog('Hubo ' + IntToStr(nIguales) + ' archivos iguales a la copia anterior');
    WriteLog('Hubo ' + IntToStr(nErrores) + ' archivos en los que falló la copia');
  finally
    ActualizaProgreso('Grabando archivos índice',0);
    slIndex.SaveToFile(edPathDestino.Text + FILE_INDEX);
    CopiaTerminada(lbCopias.Items[lbCopias.ItemIndex]);
    slIndex.Free;
  end;
end;

procedure TfrmPrincipal.CopiaArchivo(const sOrigen, sDestino: string);
begin
  if not CopyFile(PChar(sOrigen),PChar(sDestino),False) then begin
    WriteLog('!! La copia del archivo [' + sOrigen + '] ha fallado.');
    RaiseLastWin32Error;
  end;
end;

function TfrmPrincipal.ArchivosDiferentes(const sArchivo1,
  sArchivo2: TFileName): Boolean;

var
  fArchivo1: TFileStream;
  fArchivo2: TFileStream;
  pArchivo1: PChar;
  pArchivo2: PChar;
  nCont: LongInt;
  lIgual: Boolean;

begin
  Result := True;

  if FileAge(sArchivo1) <> FileAge(sArchivo2) then Exit;

  fArchivo1 := TFileStream.Create(sArchivo1,fmOpenRead + fmShareDenyNone);
  try
    fArchivo2 := nil;
    fArchivo2 := TFileStream.Create(sArchivo2,fmOpenRead + fmShareDenyNone);
    if fArchivo1.Size <> fArchivo2.Size then Exit;

    lIgual := True;
    {
    fArchivo1.Seek(0,soFromBeginning);
    fArchivo2.Seek(0,soFromBeginning);
    try
      GetMem(pArchivo1,4);
      GetMem(pArchivo2,4);
      nCont := fArchivo1.Read(pArchivo1,4);
      fArchivo2.Read(pArchivo2,4);
      lIgual := CompareMem(pArchivo1,pArchivo2,4);
      while (nCont = 4) and lIgual do begin
        nCont := fArchivo1.Read(pArchivo1,4);
        fArchivo2.Read(pArchivo2,4);
        lIgual := CompareMem(pArchivo1,pArchivo2,nCont);
      end;
    finally
      FreeMem(pArchivo1,4);
      FreeMem(pArchivo2,4);
    end;
    }
  finally
    fArchivo1.Free;
    if Assigned(fArchivo2) then fArchivo2.Free;
  end;
  Result := not lIgual;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CargaDatosIni;
  slLog := nil;
  slArchivos := nil;
  sLogName := '';
end;

procedure TfrmPrincipal.lbCopiasClick(Sender: TObject);
begin
  ActualizaDatosCopia;
end;

procedure TfrmPrincipal.mnuEjecutarClick(Sender: TObject);
begin
  EjecutarCopias;
end;

procedure TfrmPrincipal.mnuCopiasPopup(Sender: TObject);
begin
  mnuEjecutar.Enabled := lbCopias.SelCount > 0;
end;

procedure TfrmPrincipal.ActualizaProgreso(const sArchivo: string; nActual: Integer);
begin
  lblArchivo.Caption := sArchivo;
  pbCopia.Position := nActual;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.IniciaProgreso(const sCopia: string;
  nMax: Integer);
begin
  WriteLog('** Iniciando copia [' + sCopia + ']. ' + IntToStr(nMax) + ' archivos.');
  lblCopia.Caption := sCopia;
  pbCopia.Max := nMax;
  pbCopia.Position := 0;
  if not pnProgreso.Visible then pnProgreso.Show;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.CierraProgreso;
begin
  if pnProgreso.Visible then pnProgreso.Hide;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.WriteLog(const sLog: string);
begin
 if sLogName = '' then begin
   sLogName := FormatDateTime('yyyymmdd',Date) + '.log';
   if FileExists(sLogName) then begin
     if not Assigned(slLog) then slLog := TStringList.Create;
     slLog.LoadFromFile(sLogName);
     slLog.Add('----------------------------------');
   end;
 end;
 if not Assigned(slLog) then slLog := TStringList.Create;
 slLog.Add(FormatDateTime('dd/mm/yyyy hh:nn:ss',Now) + ' ' + sLog);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  if Assigned(slArchivos) then slArchivos.Free;
  if Assigned(slLog) then slLog.Free;
end;

procedure TfrmPrincipal.SaveLog;
begin
  slLog.SaveToFile(sLogName);
  sLogName := '';
end;

procedure TfrmPrincipal.MarcaBorrados(slIndice, slOrigen: TStrings);

var
  Pos: TLinePos;
  nCont: Integer;
  slIndBor: TStringList;
  nBorrados: Integer;
  nTotal: Integer;
  sRenAnt: TFileName;
  sRenNuevo: TFileName;
  lRen: Boolean;

begin
  slIndBor := TStringList.Create;
  try
    if FileExists(edPathDestino.Text + FILE_INDEX_BORRADOS) then
      slIndBor.LoadFromFile(edPathDestino.Text + FILE_INDEX_BORRADOS);
    nBorrados := 0;
    nTotal := slIndice.Count;
    IniciaProgreso(lbCopias.Items[lbCopias.ItemIndex],nTotal);
    for nCont := nTotal - 1 downto 0 do begin
      Pos := LinePos(slIndice.Values[slIndice.Names[nCont]],slOrigen,True);
      if not LinePosToBoolean(Pos) then begin
        Inc(nBorrados);
        sRenAnt := edPathDestino.Text + slIndice.Names[nCont];
        sRenNuevo := edPathDestino.Text + '_' + slIndice.Names[nCont];
        if RenameFile(sRenAnt,sRenNuevo) then begin
          slIndBor.Add('_' + slIndice[nCont]);
          slIndice.Delete(nCont);
          WriteLog('Borrado el archivo [' + sRenAnt + ']');
        end
        else
          WriteLog('No se pudo renombrar el archivo [' + sRenAnt + ']');
      end;
      ActualizaProgreso('Marcando archivos borrados del origen...',nTotal - nCont);
    end;
  finally
    WriteLog('Se borraron ' + IntToStr(nBorrados) + ' archivos.');
    slIndBor.SaveToFile(edPathDestino.Text + FILE_INDEX_BORRADOS);
    slIndBor.Free;
  end;
end;

procedure TfrmPrincipal.CopiaTerminada(sCopia: string);
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + FILE_INI) do
    try
      WriteString(sCopia,'ult_copia',FormatDateTime('mm/dd/yyyy hh:nn',Now));
    finally
      Free;
    end;
end;

procedure TfrmPrincipal.ComprimeArchivo(sOrigen, sDestino: TFileName);
begin
  MakeZip(sDestino,sOrigen);
  AddZip(sOrigen);
  CloseZip;
end;

end.
