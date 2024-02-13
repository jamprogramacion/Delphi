unit ufrmProductos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, ExtCtrls, DBCtrls, uJAMContainers,
  StdCtrls, uJAMDBControls, uJAMControls, ufrmFiltros, Menus, ComCtrls, db;

type
  TfrmProductos = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbgProductos: TDBGrid;
    dbnProductos: TDBNavigator;
    frmFiltros: TfrmFiltros;
    mnuProductos: TMainMenu;
    mnuAlta: TMenuItem;
    mnuStock: TMenuItem;
    mnuAtributos: TMenuItem;
    sbInfo: TStatusBar;
    mnuProducto: TPopupMenu;
    mnuProductoVenta: TMenuItem;
    mnuProductoBorrar: TMenuItem;
    mnuEtiquetas: TMenuItem;
    mnuEtiquetasProducto: TMenuItem;
    mnuEtiquetasTodos: TMenuItem;
    mnuProductoEtiquetasProducto: TMenuItem;
    mnuProductoEtiquetasTodos: TMenuItem;
    mnuEtiquetasOferta: TMenuItem;
    mnuProductoDetalles: TMenuItem;
    mnuEtiquetasArchivo: TMenuItem;
    pnNumReg: TJAMPanel;
    mnuCambiarDescuentoActual: TMenuItem;
    mnuCambiarDescuentoTodos: TMenuItem;
    mnuProductoPresupuesto: TMenuItem;
    cbSoloActivos: TCheckBox;
    mnuAltaAccess: TMenuItem;
    mnuDuplicar: TMenuItem;
    mnuCambiaPrecioActual: TMenuItem;
    mnuCambiarPrecioTodos: TMenuItem;
    procedure mnuAltaClick(Sender: TObject);
    procedure dbgProductosDblClick(Sender: TObject);
    procedure dbgProductosKeyPress(Sender: TObject; var Key: Char);
    procedure mnuStockClick(Sender: TObject);
    procedure dbgProductosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure mnuAtributosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuProductoPopup(Sender: TObject);
    procedure mnuProductoBorrarClick(Sender: TObject);
    procedure mnuEtiquetasProductoClick(Sender: TObject);
    procedure mnuEtiquetasTodosClick(Sender: TObject);
    //procedure mnuEtiquetasClick(Sender: TObject);
    procedure mnuProductoDetallesClick(Sender: TObject);
    procedure mnuEtiquetasArchivoClick(Sender: TObject);
    procedure mnuProductoVentaClick(Sender: TObject);
    procedure mnuProductoPresupuestoClick(Sender: TObject);
    procedure cbSoloActivosClick(Sender: TObject);
    procedure frmFiltrosbtnDelClick(Sender: TObject);
    procedure frmFiltrosbtnAddClick(Sender: TObject);
    procedure mnuAltaAccessClick(Sender: TObject);
    procedure frmFiltrosbtnBuscarClick(Sender: TObject);
    procedure mnuDuplicarClick(Sender: TObject);
    procedure mnuDescuentoActualClick(Sender: TObject);
    procedure mnuDescuentoTodosClick(Sender: TObject);
    procedure mnuCambiaPrecioActualClick(Sender: TObject);
    procedure mnuCambiarPrecioTodosClick(Sender: TObject);
  private
    slMenuProductoVenta: TStringList;
    slMenuProductoPresupuesto: TStringList;

    procedure ProductosAfterScroll(DataSet: TDataSet);
    procedure ActualizaBarraEstado;
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure CreaMenuProducto;
    procedure CreaMenuPresupuesto;
    procedure mnuEtiquetasOfertaDescClick(Sender: TObject);
    procedure ProductosFilterChange(Sender: TObject);
    function CantidadProductoStock(nIdProducto: Integer): Integer;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class procedure ShowForm; override;
  end;

implementation

uses udmProductos, ufrmAltaProductos, ufrmStock, udmRanning, uCommon,
  ufrmAtributos, ufrmEtiquetas, uqrpEtiquetasOferta, ZDataset,
  ufrmProductosAccess;

{$R *.DFM}

{ TfrmProductos }

var
  frmProductos: TfrmProductos = nil;

constructor TfrmProductos.Create(AOwner: TComponent);
begin
  inherited;

  slMenuProductoVenta := TStringList.Create;
  slMenuProductoPresupuesto := TStringList.Create;
  if not Assigned(dmProductos) then dmProductos := TdmProductos.Create(Self);
  dmProductos.ProductosAfterScrollEvent := ProductosAfterScroll;
  frmFiltros.DataSet := dmProductos.sqlProductos;
  frmFiltros.IdFieldName := 'id_producto';
  frmFiltros.DataSetFilterChange := ProductosFilterChange;
  DatasetList.Add(dbgProductos.DataSource.DataSet);
end;

class procedure TfrmProductos.ShowForm;
begin
  if not Assigned(frmProductos) then begin
    frmProductos := TfrmProductos.Create(Application);
    frmProductos.Id := nvProductos;
  end;

  frmProductos.RefreshData([frmProductos.Id]);
  frmProductos.WindowState := wsNormal;
  frmProductos.Show;
end;

procedure TfrmProductos.mnuAltaClick(Sender: TObject);
begin
  TfrmAltaProductos.ShowForm(
    dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger);
end;

procedure TfrmProductos.dbgProductosDblClick(Sender: TObject);
begin
  TfrmAltaProductos.ShowForm(
    dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger);
end;

procedure TfrmProductos.dbgProductosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    TfrmAltaProductos.ShowForm(
      dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger);
end;

procedure TfrmProductos.mnuStockClick(Sender: TObject);
begin
  TfrmStock.ShowForm;
end;

procedure TfrmProductos.dbgProductosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var
  sText: string;
  nTextH: Integer;
  nTextW: Integer;
  nX: Integer;
  nY: Integer;
  sSQL: string;
  sSQL2: string;

begin
  Exit;

  if (gdFixed in State) or Column.Field.DataSet.IsEmpty then Exit;

  sSQL := 'select count(id_producto) nm_stock from stock where id_producto = ' +
    Column.Field.DataSet.FieldByName('id_producto').AsString;
  sSQL2 := 'select count(id_producto) nm_atributos from productos_detalle ' +
    'where id_producto = ' + Column.Field.DataSet.FieldByName('id_producto').AsString;
  if (dmRanning.ComandoSQL(sSQL,csResultado).FieldByName('nm_stock').AsInteger <> 0) and
     (dmRanning.ComandoSQL(sSQL2,csResultado).FieldByName('nm_atributos').AsInteger <> 0) and
     dmRanning.ItFieldMarked(Column.Field.DataSet.FieldByName('it_activo')) then Exit;

  if dmRanning.ItFieldMarked(Column.Field.DataSet.FieldByName('it_activo')) then begin
    if dmRanning.ComandoSQL(sSQL,csResultado).FieldByName('nm_stock').AsInteger = 0 then
      dbgProductos.Canvas.Font.Color := clRed
    else
      dbgProductos.Canvas.Font.Color := clLime;
  end
  else
    dbgProductos.Canvas.Font.Color := clSilver;
  try
    sText := Column.Field.AsString;
    nTextH := dbgProductos.Canvas.TextHeight(sText);
    nTextW := dbgProductos.Canvas.TextWidth(sText);
    nY := Rect.Top + ((Rect.Bottom - Rect.Top - nTextH) div 2);
    nX := 0;
    case Column.Alignment of
      taLeftJustify : nX := Rect.Left + 2;
      taCenter : nX := Rect.Left + ((Rect.Right - Rect.Left - nTextW) div 2);
      taRightJustify : nX := Rect.Right - 3 - nTextW;
    end;
    dbgProductos.Canvas.TextOut(nX,nY,sText);
  finally
    dbgProductos.Canvas.Font.Color := dbgProductos.Font.Color;
  end;
  Application.ProcessMessages;
end;

procedure TfrmProductos.mnuAtributosClick(Sender: TObject);
begin
  TfrmAtributos.ShowForm;
end;

procedure TfrmProductos.ProductosAfterScroll(DataSet: TDataSet);
begin
  if not Active then Exit;

  ActualizaBarraEstado;
end;

procedure TfrmProductos.FormActivate(Sender: TObject);
begin
  if not Assigned(frmProductos) then Exit;

  RefreshData([Id]);
end;

procedure TfrmProductos.ActualizaBarraEstado;

var
  sMsg: string;
  sSQL: string;
  sqlPares: TZReadOnlyQuery;

begin
  if Application.Terminated then Exit;

  sMsg := '';
  if not dbgProductos.DataSource.DataSet.ControlsDisabled then begin
    if dmProductos.NumAtributos = 0 then
      sMsg := sMsg + ' - Producto sin características';
    if CantidadProductoStock(dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger) = 0 then
      sMsg := sMsg + ' - Producto sin stock'
    else begin
      sSQL := 'select cd_color,count(id_producto) nm_stock from stock ' +
        'where (id_producto = ' +
        dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsString +
        ') and (nm_cantidad <> 0) group by cd_color';
      sqlPares := dmRanning.ComandoSQL(sSQL,csResultado);
      while not sqlPares.Eof do begin
        sMsg := sMsg + ' - ' +
          dmRanning.DescColor(sqlPares.FieldByName('cd_color').AsString) + ': ' +
          sqlPares.FieldByName('nm_stock').AsString;
        sqlPares.Next;
      end;
      dmRanning.ComandoSQLFree(sqlPares);
    end;
    if not dmRanning.ItFieldMarked(dbgProductos.DataSource.DataSet.FieldByName('it_activo')) then
      sMsg := sMsg + ' - Producto dado de baja';
    if not dmProductos.ProductoConImagen(dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger) then
      sMsg := sMsg + ' - Producto sin imagen';
    if dmProductos.DescuentoOferta <> 0 then
      sMsg := sMsg + ' - ¡¡ OFERTA !!';
  end
  else
    sMsg := 'Buscando el producto...';

  if Copy(sMsg,1,3) = ' - ' then sMsg := ToEnd(sMsg,4);

  sbInfo.SimpleText := sMsg;

  pnNumReg.Caption := '  Se encontraron ' +
    IntToStr(dbgProductos.DataSource.DataSet.RecordCount) + ' productos';
end;

procedure TfrmProductos.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  dmProductos.FiltraActivos(cbSoloActivos.Checked);
  ActualizaBarraEstado;
end;

procedure TfrmProductos.mnuProductoVentaClick(Sender: TObject);

var
  pMenu: TMenuItem;
  pProducto: TProductoVenta;

begin
  pMenu := TMenuItem(Sender);
  pProducto := TProductoVenta(slMenuProductoVenta.Objects[pMenu.Tag]);
  PostMessage(GetWindowHandle(nvVentas),MSG_PRODUCTO_VENTA,Integer(pProducto),0);
end;

procedure TfrmProductos.CreaMenuProducto;

var
  nCont: Integer;
  pMenu: TMenuItem;

begin
  mnuProductoVenta.Clear;
  dmProductos.ListaTallasColores(dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    slMenuProductoVenta);
  for nCont := 0 to slMenuProductoVenta.Count - 1 do begin
    pMenu := TMenuItem.Create(mnuProductoVenta);
    pMenu.Tag := nCont;
    pMenu.Caption := slMenuProductoVenta[nCont];
    pMenu.OnClick := mnuProductoVentaClick;
    mnuProductoVenta.Add(pMenu);
  end;
end;

destructor TfrmProductos.Destroy;
begin
  slMenuProductoVenta.Free;
  slMenuProductoPresupuesto.Free;

  inherited;
end;

procedure TfrmProductos.mnuProductoPopup(Sender: TObject);
begin
  mnuProductoVenta.Enabled := WindowOpened(Id,nvVentas,True);
  if mnuProductoVenta.Enabled then CreaMenuProducto;
  mnuProductoPresupuesto.Enabled := WindowOpened(Id,nvPresupuesto,True);
  if mnuProductoPresupuesto.Enabled then CreaMenuPresupuesto;
  mnuProductoDetalles.Enabled := not dbgProductos.DataSource.DataSet.IsEmpty;
  mnuCambiarDescuentoActual.Enabled := (not dbgProductos.DataSource.DataSet.IsEmpty) and 
    (CantidadProductoStock(dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger) <> 0);
  {
  if mnuCambiarDescuentoActual.Enabled then
    dmRanning.CargaMenuDescuentos(mnuCambiarDescuentoActual,mnuDescuentoActualClick);
  }
  mnuCambiarDescuentoTodos.Enabled := (not dbgProductos.DataSource.DataSet.IsEmpty) and
    (CantidadProductoStock(dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger) <> 0);
  {
  if mnuCambiarDescuentoTodos.Enabled then
    dmRanning.CargaMenuDescuentos(mnuCambiarDescuentoTodos,mnuDescuentoTodosClick);
  }
end;

procedure TfrmProductos.mnuProductoBorrarClick(Sender: TObject);
begin
  if dmProductos.BorraProducto(dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger) then
    RefreshData([Id]);
end;

procedure TfrmProductos.mnuEtiquetasProductoClick(Sender: TObject);
begin
  TfrmEtiquetas.Add(dbgProductos.DataSource.DataSet,'id_producto',rpActual);
  RefreshData([nvEtiquetas]);
end;

procedure TfrmProductos.mnuEtiquetasTodosClick(Sender: TObject);
begin
  TfrmEtiquetas.Add(dbgProductos.DataSource.DataSet,'id_producto',rpTodos);
  RefreshData([nvEtiquetas]);
end;

{
procedure TfrmProductos.mnuEtiquetasClick(Sender: TObject);

var
  mnuDesc: TMenuItem;
  rDesc: Extended;

begin
  if not dmProductos.sqlDescuentos.Active then dmProductos.sqlDescuentos.Open;
  dmProductos.sqlDescuentos.First;
  mnuEtiquetasOferta.Clear;
  while not dmProductos.sqlDescuentos.Eof do begin
    rDesc := dmProductos.sqlDescuentos.FieldByName('nm_descuento').AsFloat;
    if (Trunc(rDesc) = rDesc) and ((Trunc(rDesc) mod 5) = 0) then begin
      mnuDesc := TMenuItem.Create(mnuEtiquetasOferta);
      mnuDesc.Caption :=
        dmProductos.sqlDescuentos.FieldByName('nm_descuento').AsString + '%';
      mnuDesc.Tag :=
        Trunc(dmProductos.sqlDescuentos.FieldByName('nm_descuento').AsFloat * 100);
      mnuDesc.OnClick := mnuEtiquetasOfertaDescClick;
      mnuEtiquetasOferta.Add(mnuDesc);
    end;
    Application.ProcessMessages;
    dmProductos.sqlDescuentos.Next;
  end;
end;
}

procedure TfrmProductos.mnuEtiquetasOfertaDescClick(Sender: TObject);
begin
  TqrpEtiquetasOferta.PrintLabels(TMenuItem(Sender).Tag / 100);
end;

procedure TfrmProductos.mnuProductoDetallesClick(Sender: TObject);
begin
  ShowMessage(dmProductos.DetalleProducto(
    dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger));
end;

procedure TfrmProductos.mnuEtiquetasArchivoClick(Sender: TObject);
begin
  TfrmEtiquetas.ShowForm;
end;

procedure TfrmProductos.ProductosFilterChange(Sender: TObject);
begin
  ActualizaBarraEstado;
end;

procedure TfrmProductos.mnuDescuentoActualClick(Sender: TObject);

var
  sDesc: string;

begin
  sDesc := '';
  if not InputQuery('Cambio de descuento del producto actual','Descuento',sDesc) then Exit;

  try
    dmProductos.CambiaDescuentoProducto(dbgProductos.DataSource.DataSet,rpActual,
      StrToFloat(sDesc));
  except
    Exit;
  end;

  ShowMessage('El descuento del producto actual se ha cambiado al ' + sDesc + '%');
end;

procedure TfrmProductos.mnuDescuentoTodosClick(Sender: TObject);

var
  sDesc: string;

begin
  sDesc := '';
  if not InputQuery('Cambio de descuento de productos seleccionados','Descuento',sDesc) then Exit;

  try
    dmProductos.CambiaDescuentoProducto(dbgProductos.DataSource.DataSet,rpTodos,
      StrToFloat(sDesc));
  except
    Exit;
  end;

  ShowMessage('El descuento de todos los productos mostados se ha cambiado al ' +
    sDesc + '%');
end;

function TfrmProductos.CantidadProductoStock(nIdProducto: Integer): Integer;

var
  sSQL: string;
  sqlComando: TZReadOnlyQuery;
  nCantidad: Integer;

begin
  sSQL := 'select count(id_producto) nm_stock from stock where id_producto = ' +
    IntToStr(nIdProducto);
  sqlComando := dmRanning.ComandoSQL(sSQL,csResultado);
  nCantidad := sqlComando.FieldByName('nm_stock').AsInteger;
  dmRanning.ComandoSQLFree(sqlComando);
  Result := nCantidad;
end;

procedure TfrmProductos.mnuProductoPresupuestoClick(Sender: TObject);

var
  pMenu: TMenuItem;
  pProducto: TProductoVenta;

begin
  pMenu := TMenuItem(Sender);
  pProducto := TProductoVenta(slMenuProductoPresupuesto.Objects[pMenu.Tag]);
  PostMessage(GetWindowHandle(nvPresupuesto),MSG_PRODUCTO_PRESUPUESTO,Integer(pProducto),0);
end;

procedure TfrmProductos.CreaMenuPresupuesto;

var
  nCont: Integer;
  pMenu: TMenuItem;

begin
  mnuProductoPresupuesto.Clear;
  dmProductos.ListaTallasColores(dbgProductos.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    slMenuProductoPresupuesto);
  for nCont := 0 to slMenuProductoPresupuesto.Count - 1 do begin
    pMenu := TMenuItem.Create(mnuProductoPresupuesto);
    pMenu.Tag := nCont;
    pMenu.Caption := slMenuProductoPresupuesto[nCont];
    pMenu.OnClick := mnuProductoPresupuestoClick;
    mnuProductoPresupuesto.Add(pMenu);
  end;
end;

procedure TfrmProductos.cbSoloActivosClick(Sender: TObject);
begin
  dmProductos.FiltraActivos(cbSoloActivos.Checked);
  ActualizaBarraEstado;
end;

procedure TfrmProductos.frmFiltrosbtnDelClick(Sender: TObject);
begin
  frmFiltros.btnDelClick(Sender);
  dmProductos.FiltraActivos(cbSoloActivos.Checked);
end;

procedure TfrmProductos.frmFiltrosbtnAddClick(Sender: TObject);
begin
  frmFiltros.btnAddClick(Sender);
  dmProductos.FiltraActivos(cbSoloActivos.Checked);
end;

procedure TfrmProductos.mnuAltaAccessClick(Sender: TObject);
begin
  TfrmProductosAccess.ShowForm;
end;

procedure TfrmProductos.frmFiltrosbtnBuscarClick(Sender: TObject);
begin
  frmFiltros.btnBuscarClick(Sender);
end;

procedure TfrmProductos.mnuDuplicarClick(Sender: TObject);

var
  sCdPro: string;
  sqlCod: TZReadOnlyQuery;
  DataSet: TDataSet;

begin
  sCdPro := '';
  if not InputQuery('Duplicar producto','Código del nuevo producto',sCdPro) then
    Exit;

  sCdPro := UpperCase(Trim(sCdPro));
  if sCdPro = '' then Exit;

  DataSet := dbgProductos.DataSource.DataSet;
  sqlCod := dmRanning.ComandoSQL('select id_marca,cd_producto from productos ' +
    'where (cd_producto = ' + QuotedStr(sCdPro) + ') and (id_marca = ' +
    DataSet.FieldByName('id_marca').AsString + ')',csResultado);
  if sqlCod.RecordCount <> 0 then begin
    ShowMessage('Ya existe un producto con ese código (' + sCdPro +
      ') en la misma marca');
    dmRanning.ComandoSQLFree(sqlCod);
    Exit;
  end;

  dmProductos.DuplicarProducto(DataSet.FieldByName('id_producto').AsInteger,sCdPro);
  RefreshData([Id]);
end;

procedure TfrmProductos.mnuCambiaPrecioActualClick(Sender: TObject);

var
  sPrecio: string;

begin
  sPrecio := '';
  if not InputQuery('Cambio de precio del producto actual','Precio',sPrecio) then Exit;

  try
    dmProductos.CambiaPrecioProducto(dbgProductos.DataSource.DataSet,rpActual,
      StrToFloat(sPrecio));
  except
    Exit;
  end;

  ShowMessage('El precio del producto actual se ha cambiado al ' +
    dmRanning.FormateaPrecio(STrToFloat(sPrecio)));
end;

procedure TfrmProductos.mnuCambiarPrecioTodosClick(Sender: TObject);

var
  sPrecio: string;

begin
  sPrecio := '';
  if not InputQuery('Cambio de precio del producto actual','Precio',sPrecio) then Exit;

  try
    dmProductos.CambiaPrecioProducto(dbgProductos.DataSource.DataSet,rpTodos,
      StrToFloat(sPrecio));
  except
    Exit;
  end;

  ShowMessage('El precio de los productos mostrados se ha cambiado al ' +
    dmRanning.FormateaPrecio(STrToFloat(sPrecio)));
end;

end.
