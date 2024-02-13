unit ufrmFiltros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uJAMContainers, StdCtrls, uJAMControls, ZDataSet, ExtCtrls, DBCtrls,
  uJAMDBControls;

type
  TfrmFiltros = class(TFrame)
    JAMPanel1: TJAMPanel;
    JAMPanel2: TJAMPanel;
    btnAdd: TButton;
    edFiltro: TJAMEdit;
    btnDel: TButton;
    JAMPanel3: TJAMPanel;
    Label2: TLabel;
    lbFiltros: TJAMListBox;
    JAMPanel4: TJAMPanel;
    Label1: TLabel;
    lbCampos: TJAMListBox;
    Panel1: TPanel;
    edBuscar: TJAMEdit;
    btnBuscar: TButton;
    cbFiltro: TJAMComboBox;
    procedure btnAddClick(Sender: TObject);
    procedure lbCamposClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure lbFiltrosClick(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarClick(Sender: TObject);
    procedure edBuscarChange(Sender: TObject);
    procedure edBuscarKeyPress(Sender: TObject; var Key: Char);
  private
    FDataSet: TZReadOnlyQuery;
    sqlDataSetCopy: TZReadOnlyQuery;
    FIdFieldName: string;
    FDataSetFilterChange: TNotifyEvent;

    function GetDataSet: TZReadOnlyQuery;
    procedure SetDataSet(const Value: TZReadOnlyQuery);
    procedure RellenaCampos;
    procedure ActualizaControles;
    procedure NuevoFiltro(const sFiltro: string);
    //procedure BorraCampo(nCampo: Integer);
    procedure BorraFiltros;
    procedure EliminaFiltros;
    procedure BuscaProducto;
    procedure CargaListaValoresFiltro;
    procedure CopyDataSet;
    function GetIdFieldName: string;
    procedure SetIdFieldName(const Value: string);
  public
    procedure AplicaFiltros;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property DataSet: TZReadOnlyQuery read GetDataSet write SetDataSet;
    property IdFieldName: string read GetIdFieldName write SetIdFieldName;
    property DataSetFilterChange: TNotifyEvent read FDataSetFilterChange
      write FDataSetFilterChange;
  end;

implementation

{$R *.DFM}

uses uJAMIntf, DB, udmRanning;

{ TfrmFiltros }

procedure TfrmFiltros.ActualizaControles;
begin
  btnAdd.Enabled := lbCampos.ItemIndex <> -1;
  btnDel.Enabled := lbFiltros.ItemIndex <> -1;
  btnBuscar.Enabled := Trim(edBuscar.Text) <> '';
  SetControlReadOnly(edFiltro as IJAMWinControl,lbCampos.ItemIndex = -1);
  SetControlReadOnly(edBuscar as IJAMWinControl,lbCampos.ItemIndex = -1);
end;

procedure TfrmFiltros.AplicaFiltros;

var
  nCont: Integer;
  sFiltro: string;
  sFiltroAnt: string;

begin
  if FDataSet.Filtered then
    sFiltroAnt := FDataSet.Filter
  else
    sFiltroAnt := '';
  sFiltro := '';
  FDataSet.Filtered := False;
  try
    for nCont := 0 to lbFiltros.Items.Count - 1 do
      sFiltro := sFiltro + '(' + lbFiltros.Items[nCont] + ') and ';
    if sFiltro <> '' then sFiltro := Copy(sFiltro,1,Length(sFiltro) - 5);
  finally
    try
      FDataSet.Filter := sFiltro;
      FDataSet.Filtered := True;
    except
      FDataSet.Filter := sFiltroAnt;
      FDataSet.Filtered := sFiltroAnt <> '';
      lbFiltros.Items.Delete(lbFiltros.Items.Count - 1);
    end;
  end;

  if Assigned(FDataSetFilterChange) then FDataSetFilterChange(Self);
end;

constructor TfrmFiltros.Create(AOwner: TComponent);
begin
  inherited;

  DataSet := nil;
  SetControlReadOnly(edFiltro as IJAMWinControl,True);
  ActualizaControles;
  sqlDataSetCopy := TZReadOnlyQuery.Create(Self);
end;

function TfrmFiltros.GetDataSet: TZReadOnlyQuery;
begin
  Result := FDataSet;
end;

procedure TfrmFiltros.NuevoFiltro(const sFiltro: string);
begin
  lbFiltros.Items.Add(TField(lbCampos.Items.Objects[lbCampos.ItemIndex]).FieldName +
    ' ' + Trim(sFiltro));
end;

procedure TfrmFiltros.RellenaCampos;

var
  nCont: Integer;
  nObj: Integer;

begin
  lbCampos.Clear;
  if not Assigned(FDataSet) then Exit;

  for nCont := 0 to FDataSet.Fields.Count - 1 do begin
    if FDataSet.Fields[nCont].FieldName <> FDataSet.Fields[nCont].DisplayName then begin
      nObj := lbCampos.Items.Add(FDataSet.Fields[nCont].DisplayName);
      lbCampos.Items.Objects[nObj] := FDataSet.Fields[nCont];
    end;
  end;
end;

procedure TfrmFiltros.SetDataSet(const Value: TZReadOnlyQuery);
begin
  FDataSet := Value;
  if not Assigned(FDataSet) then Exit;
  
  FDataSet.FilterOptions := [foCaseInsensitive];
  RellenaCampos;
end;

procedure TfrmFiltros.btnAddClick(Sender: TObject);
begin
  if cbFiltro.Text <> '' then begin
    NuevoFiltro('= ' + QuotedStr(cbFiltro.Text));
    cbFiltro.ItemIndex := -1;
  end
  else
    NuevoFiltro(edFiltro.Text);
  ActualizaControles;
  AplicaFiltros;
  CargaListaValoresFiltro;
end;

procedure TfrmFiltros.lbCamposClick(Sender: TObject);
begin
  edFiltro.Clear;
  edBuscar.Clear;
  ActualizaControles;
  edFiltro.SetFocus;
  CargaListaValoresFiltro;
end;

{
procedure TfrmFiltros.BorraCampo(nCampo: Integer);
begin
  lbCampos.Items.Delete(nCampo);
end;
}

procedure TfrmFiltros.btnDelClick(Sender: TObject);
begin
  BorraFiltros;
  ActualizaControles;
  AplicaFiltros;
  CargaListaValoresFiltro;
end;

procedure TfrmFiltros.BorraFiltros;

var
  nCont: Integer;
  nItem: Integer;

begin
  nCont := lbFiltros.SelCount;
  nItem := lbFiltros.Items.Count - 1;
  while nCont <> 0  do begin
    if lbFiltros.Selected[nItem] then begin
      lbFiltros.Items.Delete(nItem);
      Dec(nCont);
    end;
    Dec(nItem);
  end;
end;

procedure TfrmFiltros.lbFiltrosClick(Sender: TObject);
begin
  ActualizaControles;
end;

procedure TfrmFiltros.edFiltroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    NuevoFiltro(edFiltro.Text);
    ActualizaControles;
    AplicaFiltros;
    CargaListaValoresFiltro;
  end;
end;

procedure TfrmFiltros.EliminaFiltros;
begin
  lbFiltros.Clear;
end;

destructor TfrmFiltros.Destroy;
begin
  EliminaFiltros;

  inherited;
end;

procedure TfrmFiltros.btnBuscarClick(Sender: TObject);
begin
  BuscaProducto;
end;

procedure TfrmFiltros.BuscaProducto;

var
  sId: string;
  sValor: string;
  sCampo: string;

begin
  sId := FDataSet.FieldByName(FIdFieldName).AsString;
  sCampo := TField(lbCampos.Items.Objects[lbCampos.ItemIndex]).FieldName;
  CopyDataSet;
  sqlDataSetCopy.Open;
  sqlDataSetCopy.Locate(FIdFieldName,sId,[]);
  sqlDataSetCopy.Next;
  if sqlDataSetCopy.Eof then sqlDataSetCopy.First;
  sValor := sqlDataSetCopy.FieldByName(sCampo).AsString;
  while (sqlDataSetCopy.FieldByName(FIdFieldName).AsString <> sId) and
        (Pos(LowerCase(edBuscar.Text),LowerCase(sValor)) = 0) do begin
    sqlDataSetCopy.Next;
    if sqlDataSetCopy.Eof then sqlDataSetCopy.First;
    sValor := sqlDataSetCopy.FieldByName(sCampo).AsString;
  end;
  {
  FDataSet.DisableControls;
  try
    FDataSet.Next;
    sValor := FDataSet.FieldByName(sCampo).AsString;
    while (FDataSet.FieldByName(FIdFieldName).AsString <> sId) and
          (Pos(LowerCase(Trim(edBuscar.Text)),LowerCase(sValor)) = 0) do begin
      FDataSet.Next;
      if FDataSet.Eof then FDataSet.First;
      sValor := FDataSet.FieldByName(sCampo).AsString;
      Application.ProcessMessages;
    end;
  finally
    FDataSet.EnableControls;
  end;
  }

  Application.ProcessMessages;
  if sqlDataSetCopy.FieldByName(FIdFieldName).AsString <> sId then
    FDataSet.Locate(FIdFieldName,sqlDataSetCopy.FieldByName(FIdFieldName).AsString,[])
  else
    ShowMessage('No se encontró ningún producto');
end;

procedure TfrmFiltros.edBuscarChange(Sender: TObject);
begin
  ActualizaControles;
end;

procedure TfrmFiltros.edBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then BuscaProducto;
end;

procedure TfrmFiltros.CargaListaValoresFiltro;

var
  sCampo: string;

begin
  sCampo := TField(lbCampos.Items.Objects[lbCampos.ItemIndex]).FieldName;
  cbFiltro.Clear;
  cbFiltro.Enabled := False;
  try
    if TField(lbCampos.Items.Objects[lbCampos.ItemIndex]).DataType in [ftMemo,ftDate,ftDateTime] then
      Exit;

    CopyDataSet;
    sqlDataSetCopy.Open;
    sqlDataSetCopy.First;
    while not sqlDataSetCopy.Eof do begin
      if cbFiltro.Items.IndexOf(sqlDataSetCopy.FieldByName(sCampo).AsString) = -1 then
        cbFiltro.Items.Add(sqlDataSetCopy.FieldByName(sCampo).AsString);
      sqlDataSetCopy.Next;
      Application.ProcessMessages;
    end;
  finally
    cbFiltro.Enabled := True;
  end;
end;

procedure TfrmFiltros.CopyDataSet;
begin
  if sqlDataSetCopy.Active then sqlDataSetCopy.Close;
  sqlDataSetCopy.Connection := FDataSet.Connection;
  sqlDataSetCopy.SQL.Assign(FDataSet.SQL);
  sqlDataSetCopy.Filter := FDataSet.Filter;
  sqlDataSetCopy.Filtered := FDataSet.Filtered;
  sqlDataSetCopy.DisableControls;
end;

function TfrmFiltros.GetIdFieldName: string;
begin
  Result := FIdFieldName;
end;

procedure TfrmFiltros.SetIdFieldName(const Value: string);
begin
  FIdFieldName := Value; 
end;

end.
