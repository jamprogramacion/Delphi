unit ufrmProductosAccess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, ExtCtrls, uJAMContainers, DBCtrls,
  StdCtrls, uJAMDBControls, uJAMControls, Buttons, JAMLabelEdit, Mask,
  JAMDBLabelEdit, Menus;

type
  TfrmProductosAccess = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbgProductosAccess: TDBGrid;
    DBNavigator1: TDBNavigator;
    JAMPanel2: TJAMPanel;
    Label1: TLabel;
    cbTipoProducto: TJAMComboBox;
    Label2: TLabel;
    cbSexo: TJAMComboBox;
    Label3: TLabel;
    cbProveedor: TJAMComboBox;
    edTipoProducto: TJAMEdit;
    edSexo: TJAMEdit;
    edProveedor: TJAMEdit;
    cbCodigoColor: TJAMCheckBox;
    lbCodigos: TJAMListBox;
    JAMPanel3: TJAMPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    lbTallas: TJAMListBox;
    dbedTallas: TJAMDBLabelEdit;
    edTallas: TJAMEdit;
    Label5: TLabel;
    btnAddEqTallas: TButton;
    mnuTallas: TPopupMenu;
    mnuBorraEqTallas: TMenuItem;
    Label6: TLabel;
    cbPrefijo: TJAMCheckBox;
    edPrefijo: TJAMEdit;
    edPrefColor: TJAMLabelEdit;
    Panel1: TPanel;
    cbUnColor: TJAMCheckBox;
    cbUnaTalla: TJAMCheckBox;
    Label7: TLabel;
    edUnidades: TJAMNumberEdit;
    btnSiguienteTalla: TButton;
    procedure FormActivate(Sender: TObject);
    procedure cbTipoProductoChange(Sender: TObject);
    procedure cbSexoChange(Sender: TObject);
    procedure cbProveedorChange(Sender: TObject);
    procedure cbCodigoColorClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dbedTallasChange(Sender: TObject);
    procedure mnuBorraEqTallasClick(Sender: TObject);
    procedure btnAddEqTallasClick(Sender: TObject);
    procedure mnuTallasPopup(Sender: TObject);
    procedure edTallasKeyPress(Sender: TObject; var Key: Char);
    procedure cbPrefijoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edPrefColorExit(Sender: TObject);
    procedure edPrefijoExit(Sender: TObject);
    procedure cbUnColorClick(Sender: TObject);
    procedure cbUnaTallaClick(Sender: TObject);
    procedure btnSiguienteTallaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    lUnColorAnt: Boolean;

    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure ActualizaCodigosAccess;
    procedure ActualizaFiltroColor;
    procedure ActualizaTitulo;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; override;
  end;

implementation

uses udmProductos;

{$R *.DFM}

var
  frmProductosAccess: TfrmProductosAccess = nil;

constructor TfrmProductosAccess.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmProductos) then dmProductos := TdmProductos.Create(Self);
  DatasetList.Add(dbgProductosAccess.DataSource.DataSet);
  DatasetList.Add(dmProductos.sqlTipoProducto);
  DatasetList.Add(dmProductos.sqlSexo);
  DatasetList.Add(dmProductos.sqlProveedor);
  DatasetList.Add(dmProductos.sqlCodigosAccess);
  cbTipoProducto.FillList(dmProductos.sqlTipoProducto,'descripcion');
  cbSexo.FillList(dmProductos.sqlSexo,'sexo_des');
  cbProveedor.FillList(dmProductos.sqlProveedor,'proveedor');
  lUnColorAnt := cbUnColor.Checked;
end;

procedure TfrmProductosAccess.FormActivate(Sender: TObject);
begin
  if not Assigned(frmProductosAccess) then Exit;

  RefreshData([Id]);
end;

procedure TfrmProductosAccess.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  ActualizaTitulo;
  edPrefijo.Text :=
    dbgProductosAccess.DataSource.DataSet.FieldByName('cd_marca').AsString;
  ActualizaCodigosAccess;
end;

class procedure TfrmProductosAccess.ShowForm;
begin
  if not Assigned(frmProductosAccess) then begin
    frmProductosAccess := TfrmProductosAccess.Create(Application);
    frmProductosAccess.Id := nvProductosAccess;
  end;

  frmProductosAccess.RefreshData([frmProductosAccess.Id]);
  frmProductosAccess.WindowState := wsNormal;
  frmProductosAccess.Show;
end;

procedure TfrmProductosAccess.cbTipoProductoChange(Sender: TObject);
begin
  if not dmProductos.sqlTipoProducto.Locate('descripcion',cbTipoProducto.Text,[]) then Exit;

  edTipoProducto.Text := dmProductos.sqlTipoProducto.FieldByName('tipopro').AsString;
end;

procedure TfrmProductosAccess.cbSexoChange(Sender: TObject);
begin
  if not dmProductos.sqlSexo.Locate('sexo_des',cbSexo.Text,[]) then Exit;

  edSexo.Text := dmProductos.sqlSexo.FieldByName('sexo_prod').AsString;
end;

procedure TfrmProductosAccess.cbProveedorChange(Sender: TObject);
begin
  if not dmProductos.sqlProveedor.Locate('proveedor',cbProveedor.Text,[]) then Exit;

  edProveedor.Text := dmProductos.sqlProveedor.FieldByName('ideprov').AsString;
end;

procedure TfrmProductosAccess.cbCodigoColorClick(Sender: TObject);
begin
  ActualizaCodigosAccess;
end;

procedure TfrmProductosAccess.ActualizaCodigosAccess;

var
 nCont: Integer;

begin
  edPrefijo.Enabled := cbPrefijo.Checked;
  edPrefColor.Enabled := cbCodigoColor.Checked;
  if dmProductos.sqlCodigosAccess.Active then dmProductos.sqlCodigosAccess.Close;
  dmProductos.sqlCodigosAccess.ParamByName('color').AsInteger :=
    Integer(cbCodigoColor.Checked);
  if cbPrefijo.Checked then
    dmProductos.sqlCodigosAccess.ParamByName('prefijo').AsString := edPrefijo.Text
  else
    dmProductos.sqlCodigosAccess.ParamByName('prefijo').AsString := '';
  if cbCodigoColor.Checked then
    dmProductos.sqlCodigosAccess.ParamByName('prefijo_color').AsString :=
      edPrefColor.Text
  else
    dmProductos.sqlCodigosAccess.ParamByName('prefijo_color').AsString := '';

  lbCodigos.FillList(dmProductos.sqlCodigosAccess,'idepro');
  for nCont := 0 to lbCodigos.Items.Count - 1 do
    if dmProductos.ProductoAccessExiste(lbCodigos.Items[nCont]) then
      lbCodigos.Items[nCont] := lbCodigos.Items[nCont] + ' (Ya existe en Access)';
end;

procedure TfrmProductosAccess.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  cbUnColor.Checked := False;
  cbUnaTalla.Checked := False;
  ActualizaTitulo;
  ActualizaFiltroColor;
  ActualizaCodigosAccess;
  Application.ProcessMessages;
end;

procedure TfrmProductosAccess.dbedTallasChange(Sender: TObject);
begin
  edTallas.Text := dbedTallas.DataSource.DataSet.FieldByName('ds_talla').AsString;
end;

procedure TfrmProductosAccess.mnuBorraEqTallasClick(Sender: TObject);
begin
  lbTallas.Items.Delete(lbTallas.ItemIndex);
end;

procedure TfrmProductosAccess.btnAddEqTallasClick(Sender: TObject);
begin
  lbTallas.Items.Add(dbedTallas.Text + '=' + edTallas.Text);
end;

procedure TfrmProductosAccess.mnuTallasPopup(Sender: TObject);
begin
  mnuBorraEqTallas.Enabled := lbTallas.ItemIndex <> -1;
end;

procedure TfrmProductosAccess.edTallasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then btnAddEqTallasClick(Sender);
end;

procedure TfrmProductosAccess.cbPrefijoClick(Sender: TObject);
begin
 ActualizaCodigosAccess;
end;

procedure TfrmProductosAccess.BitBtn2Click(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TfrmProductosAccess.BitBtn1Click(Sender: TObject);

var
  sPref: string;
  sPrefColor: string;
  nUnidades: Integer;

begin
  sPref := '';
  sPrefColor := '';
  if cbPrefijo.Checked then sPref := edPrefijo.Text;
  if cbCodigoColor.Checked then sPrefColor := edPrefColor.Text;
  dmProductos.AltaProductoAccess(StrToInt(edTipoProducto.Text),
    StrToInt(edSexo.Text),StrToInt(edProveedor.Text),StrToInt(edUnidades.Text),
    cbCodigoColor.Checked,sPref,sPrefColor,lbTallas.Items);
  ShowMessage('Alta del producto en Access terminado');
end;

procedure TfrmProductosAccess.edPrefColorExit(Sender: TObject);
begin
  ActualizaCodigosAccess;
end;

procedure TfrmProductosAccess.edPrefijoExit(Sender: TObject);
begin
  ActualizaCodigosAccess;
end;

procedure TfrmProductosAccess.cbUnColorClick(Sender: TObject);
begin
  ActualizaFiltroColor;
  ActualizaCodigosAccess;
end;

procedure TfrmProductosAccess.ActualizaFiltroColor;
begin
  if cbUnaTalla.Checked then
    dmProductos.FiltraProductosAccess(
      dbgProductosAccess.DataSource.DataSet.FieldByName('cd_color').AsString,
      dbgProductosAccess.DataSource.DataSet.FieldByName('id_talla').AsInteger)
  else if cbUnColor.Checked then
    dmProductos.FiltraProductosAccess(
      dbgProductosAccess.DataSource.DataSet.FieldByName('cd_color').AsString)
  else
    dmProductos.FiltraProductosAccess('');
end;


procedure TfrmProductosAccess.cbUnaTallaClick(Sender: TObject);
begin
  cbUnColor.Enabled := not cbUnaTalla.Checked;
  edUnidades.Enabled := cbUnaTalla.Checked;
  if cbUnaTalla.Checked then begin
    lUnColorAnt := cbUnColor.Checked;
    cbUnColor.Checked := True;
    edUnidades.Text :=
      dbgProductosAccess.DataSource.DataSet.FieldByName('nm_cantidad').AsString;
  end
  else begin
    cbUnColor.Checked := lUnColorAnt;
    edUnidades.Text := '0';
  end;
  ActualizaFiltroColor;
  ActualizaCodigosAccess;
  if cbUnaTalla.Checked then edUnidades.SetFocus;
end;

procedure TfrmProductosAccess.ActualizaTitulo;
begin
  Caption := 'Alta del producto [' +
    dmProductos.sqlProductos.FieldByName('cd_producto').AsString + ' - ' +
    dmProductos.sqlProductos.FieldByName('ds_producto').AsString + ' - ' +
    dmProductos.sqlProductos.FieldByName('ds_tipo_sexo').AsString + '] en Access';
end;

procedure TfrmProductosAccess.btnSiguienteTallaClick(Sender: TObject);
begin
  cbUnaTalla.Checked := False;
  dbgProductosAccess.DataSource.DataSet.Next;
  cbUnaTalla.Checked := True;
end;

procedure TfrmProductosAccess.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  dmProductos.CloseAccessConnection;
end;

end.
