unit ufrmAtributos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, ExtCtrls, uJAMContainers, StdCtrls, db,
  DBCtrls, Menus, JAMLabelEdit, Mask, JAMDBLabelEdit, uJAMDBControls,
  Buttons;

type
  TfrmAtributos = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbgProductosAtributos: TDBGrid;
    JAMPanel2: TJAMPanel;
    dbgAtributo: TDBGrid;
    JAMPanel3: TJAMPanel;
    dbgProductosDetalle: TDBGrid;
    JAMPanel4: TJAMPanel;
    btnAdd: TButton;
    btnDel: TButton;
    DBNavigator1: TDBNavigator;
    btnCopiaAtr: TButton;
    mnuValor: TPopupMenu;
    mnuValorNuevo: TMenuItem;
    edBuscar: TJAMLabelEdit;
    mnuAtributo: TPopupMenu;
    mnuNuevo: TMenuItem;
    pnCombos: TJAMPanel;
    dbCantidad: TJAMDBLabelEdit;
    dbcbUnidades: TJAMDBIdComboBox;
    btnGrabar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgAtributoDblClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnCopiaAtrClick(Sender: TObject);
    procedure mnuValorPopup(Sender: TObject);
    procedure mnuValorNuevoClick(Sender: TObject);
    procedure edBuscarChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mnuNuevoClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    nIdProducto: Integer;
    nAtributo: Integer;

    procedure AddAtributo; overload;
    procedure AddAtributo(nIdValor: Integer); overload;
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure ActualizaGridAtributo;
    procedure ProductosAtributosAfterScroll(DataSet: TDataSet);
  protected
    procedure RefreshData(nId: TIdVentanas); override;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; override;
  end;

implementation

uses udmProductos, ZDataset, udmRanning;

{$R *.DFM}

{ TfrmAtributos }

var
  frmAtributos: TfrmAtributos = nil;

procedure TfrmAtributos.ActualizaGridAtributo;
begin
  dbgAtributo.Columns[0].Title.Caption :=
    dbgProductosAtributos.DataSource.DataSet.FieldByName('ds_atributo').AsString
end;

constructor TfrmAtributos.Create(AOwner: TComponent);
begin
  inherited;

  dmProductos.ProductosAtributosAfterScrollEvent := ProductosAtributosAfterScroll;
  nAtributo := -1;
  DatasetList.Add(dbgProductosAtributos.DataSource.DataSet);
  DatasetList.Add(dbgAtributo.DataSource.DataSet);
  DatasetList.Add(dbgProductosDetalle.DataSource.DataSet);
  DatasetList.Add(dbcbUnidades.ListDataSource.DataSet);
  CombosPanelList.Add(pnCombos);
end;

procedure TfrmAtributos.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  Caption := 'Características. (' +
    dmProductos.sqlProductos.FieldByName('cd_producto').AsString + ') ' +
    dmProductos.sqlProductos.FieldByName('ds_producto').AsString;
  if nAtributo <> -1 then
    dbgProductosAtributos.DataSource.DataSet.Locate('id_atributo',nAtributo,[]);
  ActualizaGridAtributo;

  FillAllLists(pnCombos);
end;

class procedure TfrmAtributos.ShowForm;
begin
  if not Assigned(frmAtributos) then begin
    frmAtributos := TfrmAtributos.Create(Application);
    frmAtributos.Id := nvAtributos;
  end;

  if frmAtributos.nIdProducto <> dmProductos.sqlProductos.FieldByName('id_producto').AsInteger then
    frmAtributos.nAtributo:= -1;
  frmAtributos.nIdProducto := dmProductos.sqlProductos.FieldByName('id_producto').AsInteger;
  frmAtributos.RefreshData([frmAtributos.Id]);
  frmAtributos.WindowState := wsNormal;
  frmAtributos.Show;
end;

procedure TfrmAtributos.btnAddClick(Sender: TObject);
begin
  AddAtributo;
end;

procedure TfrmAtributos.btnDelClick(Sender: TObject);
begin
  dmProductos.BorraAtributo;
  RefreshData([Id]);
end;

procedure TfrmAtributos.RefreshData(nId: TIdVentanas);
begin
  nAtributo :=
    dbgProductosAtributos.DataSource.DataSet.FieldByName('id_atributo').AsInteger;
  nIdProducto := dmProductos.sqlProductos.FieldByName('id_producto').AsInteger;

  inherited;
end;

procedure TfrmAtributos.ProductosAtributosAfterScroll(DataSet: TDataSet);
begin
  if not Active then Exit;
  
  ActualizaGridAtributo;
  edBuscar.Clear;
end;

procedure TfrmAtributos.FormActivate(Sender: TObject);
begin
  if not Assigned(frmAtributos) then Exit;

  RefreshData([Id]);
end;

procedure TfrmAtributos.dbgAtributoDblClick(Sender: TObject);
begin
  AddAtributo;
end;

procedure TfrmAtributos.AddAtributo;
begin
  dmProductos.AnadeAtributo(dbgAtributo.SelectedRows);
  edBuscar.Clear;
  RefreshData([Id]);
end;

procedure TfrmAtributos.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  RefreshData([Id]);
end;

procedure TfrmAtributos.btnCopiaAtrClick(Sender: TObject);

var
  sCdProd: string;
  sqlCopia: TZReadOnlyQuery;
  sAtr: string;
  sMarca: string;

begin
  sCdProd := '';
  if not InputQuery('Copia de atributos desde el producto...','Código del producto:',sCdProd) then
    Exit;

  if sCdProd = '' then Exit;

  sAtr := '';
  sqlCopia := dmRanning.ComandoSQL('select concat(id_atributo,"-",id_valor) ' +
    'ds_atr from productos_detalle where id_producto = ' + IntToStr(nIdProducto),
    csResultado);
  sqlCopia.First;
  while not sqlCopia.Eof do begin
    sAtr := sAtr + ',' + sqlCopia.FieldByName('ds_atr').AsString;
    Application.ProcessMessages;
    sqlCopia.Next;
  end;
  dmRanning.ComandoSQLFree(sqlCopia);

  sqlCopia := dmRanning.ComandoSQL('select id_marca from productos where ' +
    'id_producto = ' + IntToStr(nIdProducto),
    csResultado);
  sMarca := sqlCopia.FieldByName('id_marca').AsString;
  dmRanning.ComandoSQLFree(sqlCopia);

  if dmProductos.sqlCopiaAtr.Active then dmProductos.sqlCopiaAtr.Close;
  dmProductos.sqlCopiaAtr.SQL.Text := 'select concat(pd.id_atributo,"-",pd.id_valor) ' +
    'ds_atr,pd.id_atributo,pd.id_valor,pd.nm_orden,pd.id_unidad,pd.nm_cantidad ' + 
    'from productos_detalle pd, productos p where (p.cd_producto = ' +
    QuotedStr(sCdProd) + ') and (p.id_marca = ' + sMarca + ') and '+
    '(p.id_producto = pd.id_producto)';
  dmProductos.sqlCopiaAtr.Open;
  dmProductos.sqlCopiaAtr.First;
  while not dmProductos.sqlCopiaAtr.Eof do begin
    if Pos(dmProductos.sqlCopiaAtr.FieldbyName('ds_atr').AsString,sAtr) = 0 then
      dmProductos.AnadeAtributo(dmProductos.sqlCopiaAtr.FieldByName('id_atributo').AsInteger,
        dmProductos.sqlCopiaAtr.FieldByName('id_valor').AsInteger,
        dmProductos.sqlCopiaAtr.FieldByName('nm_orden').AsInteger,
        dmProductos.sqlCopiaAtr.FieldByName('id_unidad').AsInteger,
        dmProductos.sqlCopiaAtr.FieldByName('nm_cantidad').AsFloat);
    Application.ProcessMessages;
    dmProductos.sqlCopiaAtr.Next;
  end;

  RefreshData([Id]);
end;

procedure TfrmAtributos.mnuValorPopup(Sender: TObject);
begin
  mnuValorNuevo.Caption := 'Nuevo valor para "' +
    dbgProductosAtributos.DataSource.DataSet.FieldByName('ds_atributo').AsString +
    '"';
end;

procedure TfrmAtributos.mnuValorNuevoClick(Sender: TObject);

var
  sValor: string;
  sTexto: string;
  sqlUltValor: TZReadOnlyQuery;
  nValor: Integer;
  nUltAtrib: Integer;

begin
  sValor := '';
  sTexto := 'Nuevo valor para "' +
    dbgProductosAtributos.DataSource.DataSet.FieldByName('ds_atributo').AsString +
    '"';
  if not InputQuery(sTexto,'Valor:',sValor) then Exit;

  if sValor = '' then Exit;

  sqlUltValor := dmRanning.ComandoSQL('select max(id_valor) id_max from ' +
    'atributos where id_atributo = ' +
    dbgProductosAtributos.DataSource.DataSet.FieldByName('id_atributo').AsString,
    csResultado);
  nValor := sqlUltValor.FieldByName('id_max').AsInteger + 1;
  dmRanning.ComandoSQLFree(sqlUltValor);
  dmRanning.ComandoSQL('insert into atributos (id_atributo,' +
    'id_valor,ds_valor) values (' +
    dbgProductosAtributos.DataSource.DataSet.FieldByName('id_atributo').AsString +
    ',' + IntToStr(nValor) + ',' + QuotedStr(sValor) + ')',csEjecutar);

  nUltAtrib := dmRanning.UltimoID;
  dmRanning.TablaModificada('atributos','id',nUltAtrib,raInsert);

  if MessageDlg('¿Quieres añadir el nuevo atributo al producto?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then begin
    RefreshData([Id]);
    Exit;
  end;

  AddAtributo(nValor);
  RefreshData([Id]);
end;

procedure TfrmAtributos.AddAtributo(nIdValor: Integer);
begin
  dmProductos.AnadeAtributo(dbgProductosAtributos.DataSource.DataSet.FieldByName('id_atributo').AsInteger,
      nIdValor,0,0,0);
end;

procedure TfrmAtributos.edBuscarChange(Sender: TObject);
begin
  if Trim(edBuscar.Text) = '' then Exit;

  if not dbgAtributo.DataSource.DataSet.Active then Exit;

  dbgAtributo.DataSource.DataSet.Locate('ds_valor',edBuscar.Text,
    [loCaseInsensitive,loPartialKey]);
end;

procedure TfrmAtributos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if edBuscar.Focused or dbCantidad.Focused or dbcbUnidades.Focused then Exit;

  case Ord(Key) of
    VK_BACK: edBuscar.Text := Copy(edBuscar.Text,1,Length(edBuscar.Text) - 1);
  else
    edBuscar.Text := edBuscar.Text + Key;
  end;
end;

procedure TfrmAtributos.mnuNuevoClick(Sender: TObject);

var
  sAtrib: string;
  nUltAtrib: Integer;

begin
  sAtrib := '';
  if not InputQuery('Nueva característica','Nombre:',sAtrib) then Exit;

  sAtrib := Trim(sAtrib);
  if sAtrib = '' then Exit;

  dmRanning.ComandoSQL('insert into productos_atributos (it_mostrar_busqueda,' +
    'it_campo_orden,ds_atributo) values (' + QuotedStr(CAMPO_MARCADO) + ',' +
    QuotedStr(CAMPO_NO_MARCADO) + ',' + QuotedStr(sAtrib) + ')',csEjecutar);
  nUltAtrib := dmRanning.UltimoID;
  dmRanning.TablaModificada('productos_atributos','id_atributo',nUltAtrib,raInsert);
  RefreshData([Id]);
end;

procedure TfrmAtributos.btnGrabarClick(Sender: TObject);
begin
  if not (dbCantidad.DataSource.State in dsEditModes) then Exit;

  dbCantidad.DataSource.DataSet.Post;
end;

procedure TfrmAtributos.btnCancelarClick(Sender: TObject);
begin
  dbCantidad.DataSource.DataSet.Cancel;
end;

end.
