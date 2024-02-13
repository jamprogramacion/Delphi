unit ufrmExplorer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, OleCtrls, SHDocVw, StdCtrls, ExtCtrls, uJAMContainers,
  MOZILLACONTROLLib_TLB;

type
  TfrmExplorer = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    pnPdf: TJAMPanel;
    btnImprimir: TButton;
    pnStatus: TPanel;
    tmStatus: TTimer;
    wbIExplorer: TWebBrowser;
    wbMozilla: TMozillaBrowser;
    procedure wbExplorer_NavigateComplete2(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure wbExplorer_BeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure btnImprimirClick(Sender: TObject);
    procedure tmStatusTimer(Sender: TObject);
  private
    lErrorMozilla: Boolean;

  public
    class procedure ShowForm; overload; override;
    class procedure ExploreFile(const sFile: TFileName; lReload: Boolean);
    class procedure HtmlToPdf(const sFile: TFileName; lAceptado: Boolean;
      lPdf: Boolean = False);
    class procedure ImprimirPdf;
  end;

implementation

uses ShellApi, Registry, Printers, uCommon;

var
  frmExplorer: TfrmExplorer = nil;
  sPdfFile: TFileName;

{$R *.DFM}

{ TfrmExplorer }

const
  REG_WIN2PDF = '\Software\Dane Prairie Systems\Win2PDF';

class procedure TfrmExplorer.ExploreFile(const sFile: TFileName; lReload: Boolean);

var
  vFile: OleVariant;

begin
  vFile := sFile;
  ShowForm;
  if (not lReload) and (frmExplorer.Caption = sFile) then Exit;
  
  frmExplorer.Caption := sFile;
  frmExplorer.pnPdf.Hide;
  sPdfFile := sFile;
  frmExplorer.pnStatus.Caption := 'Cargando presupuesto';
  frmExplorer.tmStatus.Enabled := True;
  frmExplorer.pnStatus.Show;
  Application.ProcessMessages;
  if not frmExplorer.lErrorMozilla then begin
    try
      frmExplorer.wbMozilla.Navigate2(vFile)
    except
      frmExplorer.lErrorMozilla := True;
    end;
  end;
  if frmExplorer.lErrorMozilla then frmExplorer.wbIExplorer.Navigate2(vFile);
end;

class procedure TfrmExplorer.ShowForm;
begin
  if not Assigned(frmExplorer) then begin
    try
      frmExplorer := TfrmExplorer.Create(Application);
      frmExplorer.lErrorMozilla := False;
    except
      frmExplorer.lErrorMozilla := True;
    end;
    frmExplorer.Id := nvExplorer;
  end;

  frmExplorer.RefreshData([frmExplorer.Id]);
  frmExplorer.WindowState := wsNormal;
  frmExplorer.Show;
end;

procedure TfrmExplorer.wbExplorer_NavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  btnImprimir.Enabled := True;
  if not lErrorMozilla then
    wbIExplorer.SendToBack
  else
    wbMozilla.SendToBack;
  pnStatus.Hide;
  tmStatus.Enabled := False;
  Application.ProcessMessages;
end;

procedure TfrmExplorer.wbExplorer_BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  btnImprimir.Enabled := False;
end;

procedure TfrmExplorer.btnImprimirClick(Sender: TObject);
begin
  ImprimirPdf;
end;

class procedure TfrmExplorer.ImprimirPdf;

var
  Reg: TRegistry;

begin
  try
    frmExplorer.btnImprimir.Enabled := False;
    if FileExists(ChangeFileExt(sPdfFile,'.pdf')) then
      DeleteFile(ChangeFileExt(sPdfFile,'.pdf'));

    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if not Reg.OpenKey(REG_WIN2PDF,False) then begin
        ShowMessage('Falta la información del registro para Win2PDF');
        Exit;
      end;

      Reg.WriteInteger('file options',32);
      Reg.WriteString('PDFFileName',ChangeFileExt(sPdfFile,'.pdf'));
      Reg.WriteString('PDFAuthor','RanningSport S.L.');
    finally
      Reg.Free;
    end;

    ShellExecute(Application.Handle,'print',PChar(sPdfFile),nil,
      PChar(ExtractFilePath(sPdfFile)),SW_SHOWNORMAL);
  finally
    frmExplorer.btnImprimir.Enabled := True;
  end;
end;

class procedure TfrmExplorer.HtmlToPdf(const sFile: TFileName; lAceptado,
  lPdf: Boolean);
begin
  ExploreFile(sFile,True);
  frmExplorer.pnPdf.Visible := (not lAceptado) or lPdf;
  if lAceptado and lPdf then ImprimirPdf;
end;

procedure TfrmExplorer.tmStatusTimer(Sender: TObject);
begin
  pnStatus.Caption := pnStatus.Caption + '.';
  Application.ProcessMessages;
end;

end.
