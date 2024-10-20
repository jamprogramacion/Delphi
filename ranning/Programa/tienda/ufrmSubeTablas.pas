unit ufrmSubeTablas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, ExtCtrls, uJAMContainers, ComCtrls, StdCtrls,
  uJAMControls, Buttons;

type
  TfrmSubeTablas = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    JAMPanel2: TJAMPanel;
    lbTablas: TJAMListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblTabla: TStaticText;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    lCancelar: Boolean;

    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure ActualizaTablas;
    procedure SubeTablas;
    procedure SubeTabla(const sTabla: string);
    procedure SubeTablaEntera(const sTabla: string);
    procedure VaciaTabla(const sTabla: string);
    procedure ActualizaListaTablasSubir;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; override;
  end;

implementation

uses udmRanning, uCommon;

{$R *.DFM}

{ TfrmSubeTablas }

var
  frmSubeTablas: TfrmSubeTablas;

procedure TfrmSubeTablas.ActualizaTablas;
begin
  lbTablas.Clear;
  dmRanning.Metadata.Open;
  while not dmRanning.Metadata.Eof do begin
    lbTablas.Items.Add(dmRanning.Metadata.FieldByName('table_name').AsString);
    dmRanning.Metadata.Next;
  end;
end;

constructor TfrmSubeTablas.Create(AOwner: TComponent);
begin
  inherited;

  lblTabla.Caption := '';
  ActualizaTablas;
end;

class procedure TfrmSubeTablas.ShowForm;
begin
  if not Assigned(frmSubeTablas) then
    frmSubeTablas := TfrmSubeTablas.Create(Application);

  frmSubeTablas.RefreshData([frmSubeTablas.Id]);  
  frmSubeTablas.WindowState := wsNormal;
  frmSubeTablas.Show;
end;

procedure TfrmSubeTablas.BitBtn1Click(Sender: TObject);
begin
  lCancelar := False;
  SubeTablas;
  dmRanning.BorraStockCero;
  ActualizaListaTablasSubir;
  SubeTablas;
  ShowMessage('Proceso terminado');
  ActualizaListaTablasSubir;
end;

procedure TfrmSubeTablas.BitBtn2Click(Sender: TObject);
begin
  lCancelar := True;
  Application.ProcessMessages;
  lblTabla.Caption := 'Desconectado de la base de datos...';
  if dmRanning.dbWeb.Connected then dmRanning.dbWeb.Disconnect;
  WindowState := wsMinimized;
end;

procedure TfrmSubeTablas.SubeTablas;

var
  nCont: Integer;
  nItem: Integer;

begin
  lblTabla.Caption := 'Conectando con la base de datos...';
  if not dmRanning.dbWeb.Connected then dmRanning.dbWeb.Connect;
  try
    nCont := 0;
    nItem := 0;
    while (not lCancelar) and (nCont < lbTablas.SelCount) do begin
      if lbTablas.Selected[nItem] then begin
        lblTabla.Caption := lbTablas.Items[nItem];
        SubeTabla(lbTablas.Items[nItem]);
        Inc(nCont);
      end;
      Inc(nItem);
    end;
  finally
    dmRanning.dbWeb.Disconnect;
  end;

  dmRanning.SubeImagenes(True);
end;

procedure TfrmSubeTablas.SubeTabla(const sTabla: string);

var
  nCont: Integer;
  sCampos: string;
  sValores: string;
  sUpdate: string;
  sWhere: string;
  Accion: TRecordAction;
  pStep: TProgressStepProc;
  nTotal: Integer;

begin
  if dmRanning.sqlSubirTablas.Active then dmRanning.sqlSubirTablas.Close;
  dmRanning.sqlSubirTablas.ParamByName('ds_tabla').AsString := sTabla;
  dmRanning.sqlSubirTablas.Open;
  if dmRanning.sqlSubirTablas.RecordCount = 0 then begin
    SubeTablaEntera(sTabla);
    Exit;
  end;

  dmRanning.sqlRanning.SQL.Text := 'select * from ' + sTabla + ' where ' +
    dmRanning.sqlSubirTablas.FieldByName('ds_campo_id').AsString + ' = :' +
    dmRanning.sqlSubirTablas.FieldByName('ds_campo_id').AsString;
  dmRanning.sqlSubirTablas.First;
  nTotal := 0;
  Accion := CHAR_RECORD_ACTION[dmRanning.sqlSubirTablas.FieldByName('it_accion').AsString[1]];
  if Accion = raDelete then 
    nTotal := 1
  else
    while not dmRanning.sqlSubirTablas.Eof do begin
      dmRanning.sqlRanning.ParamByName(
        dmRanning.sqlSubirTablas.FieldByName('ds_campo_id').AsString).AsString :=
        dmRanning.sqlSubirTablas.FieldByName('id').AsString;
      dmRanning.sqlRanning.Open;
      nTotal := nTotal + dmRanning.sqlRanning.RecordCount;
      dmRanning.sqlRanning.Close;
      dmRanning.sqlSubirTablas.Next;
    end;

  dmRanning.sqlSubirTablas.First;
  if dmRanning.sqlRanning.Active then dmRanning.sqlRanning.Close;
  dmRanning.sqlRanning.ParamByName(
    dmRanning.sqlSubirTablas.FieldByName('ds_campo_id').AsString).AsString :=
    dmRanning.sqlSubirTablas.FieldByName('id').AsString;
  dmRanning.sqlRanning.Open;
  dmRanning.sqlRanning.First;
  pStep := ShowProgress('Subiendo tabla ' + sTabla,0,nTotal);
  sCampos := '(';
  sValores := '(';
  sUpdate := '';
  for nCont := 0 to dmRanning.sqlRanning.FieldCount - 1 do begin
    sCampos := sCampos + dmRanning.sqlRanning.Fields[nCont].FieldName + ',';
    sValores := sValores + ':' + dmRanning.sqlRanning.Fields[nCont].FieldName + ',';
    sUpdate := sUpdate + dmRanning.sqlRanning.Fields[nCont].FieldName + ' = :' +
      dmRanning.sqlRanning.Fields[nCont].FieldName + ',';
  end;
  dmRanning.sqlWebInsert.SQL.Text := 'insert into ' + sTabla + ' ' +
    Copy(sCampos,1,Length(sCampos) - 1) + ') values ' +
    Copy(sValores,1,Length(sValores) - 1) + ')';
  sWhere := ' where ' +
    dmRanning.sqlSubirTablas.FieldByName('ds_campo_id').AsString + ' = :' +
    dmRanning.sqlSubirTablas.FieldByName('ds_campo_id').AsString;
  dmRanning.sqlWebDelete.SQL.Text := 'delete from ' + sTabla + sWhere;
  dmRanning.sqlWebUpdate.SQL.Text := 'update ' + sTabla + ' set ' +
    Copy(sUpdate,1,Length(sUpdate) - 1) + sWhere;
  while not dmRanning.sqlSubirTablas.Eof do begin
    if dmRanning.sqlRanning.Active then dmRanning.sqlRanning.Close;
      dmRanning.sqlRanning.ParamByName(
        dmRanning.sqlSubirTablas.FieldByName('ds_campo_id').AsString).AsString :=
        dmRanning.sqlSubirTablas.FieldByName('id').AsString;
      dmRanning.sqlRanning.Open;
      dmRanning.sqlRanning.First;
    while not dmRanning.sqlRanning.Eof do begin
      Accion := CHAR_RECORD_ACTION[dmRanning.sqlSubirTablas.FieldByName('it_accion').AsString[1]];
      case Accion of
        raInsert: dmRanning.sqlWebInsert.ExecSQL;
        raModify: dmRanning.sqlWebUpdate.ExecSQL;
        raDelete: dmRanning.sqlWebDelete.ExecSQL;
      end;
      dmRanning.sqlRanning.Next;
    end;
    dmRanning.sqlSubirTablas.Next;
    pStep;
  end;
  dmRanning.ComandoSQL('delete from subir_tablas where ds_tabla = ' +
    QuotedStr(sTabla),csEjecutar);
end;

procedure TfrmSubeTablas.VaciaTabla(const sTabla: string);
begin
  dmRanning.ComandoSQLWeb('delete from ' + sTabla,csEjecutar);
end;

procedure TfrmSubeTablas.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  ActualizaListaTablasSubir;
end;

procedure TfrmSubeTablas.ActualizaListaTablasSubir;

var
  slTablas: TStringList;
  nCont: Integer;

begin
  slTablas := TStringList.Create;
  try
    dmRanning.TablasASubir(slTablas);
    for nCont := 0 to lbTablas.Items.Count - 1 do
      lbTablas.Selected[nCont] := slTablas.IndexOf(lbTablas.Items[nCont]) <> -1;
  finally
    slTablas.Free;
  end;
end;

procedure TfrmSubeTablas.SpeedButton1Click(Sender: TObject);
begin
  ActualizaListaTablasSubir;
end;

procedure TfrmSubeTablas.SubeTablaEntera(const sTabla: string);

var
  nCont: Integer;
  sCampos: string;
  sValores: string;
  pStep: TProgressStepProc;

begin
  dmRanning.sqlRanning.SQL.Text := 'select * from ' + sTabla;
  dmRanning.sqlRanning.Open;
  dmRanning.sqlRanning.First;
  pStep := ShowProgress('Subiendo tabla ' + sTabla,0,dmRanning.sqlRanning.RecordCount);
  sCampos := '(';
  sValores := '(';
  for nCont := 0 to dmRanning.sqlRanning.FieldCount - 1 do begin
    sCampos := sCampos + dmRanning.sqlRanning.Fields[nCont].FieldName + ',';
    sValores := sValores + ':' + dmRanning.sqlRanning.Fields[nCont].FieldName + ',';
  end;
  dmRanning.sqlWebInsert.SQL.Text := 'insert into ' + sTabla + ' ' +
    Copy(sCampos,1,Length(sCampos) - 1) + ') values ' +
    Copy(sValores,1,Length(sValores) - 1) + ')';
  VaciaTabla(sTabla);
  while not dmRanning.sqlRanning.Eof do begin
    dmRanning.sqlWebInsert.ExecSQL;
    dmRanning.sqlRanning.Next;
    pStep;
  end;
end;

end.
