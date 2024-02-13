unit udmPresupuestos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZAbstractRODataset, ZAbstractDataset, ZDataset, udmRanning, ADODB, uCommon;

const
  NA_NOMBRE = 0;
  NA_APELLIDO_1 = 1;
  NA_APELLIDO_2 = 2;
  A_NOMBRE_TITULOS: array[NA_NOMBRE..NA_APELLIDO_2] of string = ('Nombre',
    'Primer apellido','Segundo apellido');
  ID_FORMA_PAGO_TRANSFERENCIA = 3;

type
  TNombreArray = array[NA_NOMBRE..NA_APELLIDO_2] of string;

type
  TdmPresupuestos = class(TDataModule)
    sqlCarritoPresupuesto: TZQuery;
    dsCarritoPresupuesto: TDataSource;
    sqlCarritoPresupuestoUpdate: TZReadOnlyQuery;
    sqlCarrito: TZQuery;
    sqlCarritoUpdate: TZReadOnlyQuery;
    dsCarrito: TDataSource;
    sqlCarritoDelete: TZReadOnlyQuery;
    sqlCarritoInsert: TZReadOnlyQuery;
    sqlCarritoPresupuestoid_cliente_web: TStringField;
    sqlCarritoPresupuestof_fecha_compra: TDateTimeField;
    sqlCarritoPresupuestof_fecha_aceptacion: TDateTimeField;
    sqlCarritoPresupuestonm_pvp: TFloatField;
    sqlCarritoPresupuestonm_gastos_envio: TFloatField;
    sqlCarritoPresupuestods_email: TStringField;
    sqlCarritoid_cliente_web: TStringField;
    sqlCarritof_fecha_compra: TDateTimeField;
    sqlCarritoid_producto: TLargeintField;
    sqlCarritoid_talla: TLargeintField;
    sqlCarritonm_pvp: TFloatField;
    sqlCarritods_marca: TStringField;
    sqlCarritocd_marca: TStringField;
    sqlCarritocd_producto: TStringField;
    sqlCarritocd_producto_completo: TStringField;
    sqlCarritods_producto: TStringField;
    sqlCarritods_color_completo: TStringField;
    sqlCarritods_talla: TStringField;
    sqlCarritonm_precio_final: TFloatField;
    sqlCarritoWeb: TZReadOnlyQuery;
    dsCarritoWeb: TDataSource;
    sqlActualizaPresupuesto: TZReadOnlyQuery;
    dsActualizaPresupuesto: TDataSource;
    sqlActualizaPresupuestoInsert: TZReadOnlyQuery;
    sqlActualizaPresupuestoUpdate: TZReadOnlyQuery;
    sqlCarritoPresupuestoid_estado_pedido: TLargeintField;
    sqlCarritoPresupuestods_estado_pedido: TStringField;
    sqlSubirCarrito: TZReadOnlyQuery;
    sqlSubirCarritoPresupuesto: TZReadOnlyQuery;
    sqlCarritoid: TLargeintField;
    sqlProductoTallas: TZReadOnlyQuery;
    sqlTallas: TZReadOnlyQuery;
    sqlCarritoPresupuestods_primer_apellido: TStringField;
    sqlCarritoPresupuestods_segundo_apellido: TStringField;
    sqlCarritoPresupuestods_nombre: TStringField;
    sqlCarritoPresupuestods_nombre_completo: TStringField;
    sqlCarritoPresupuestoit_canarias: TStringField;
    sqlCarritonm_iva: TFloatField;
    sqlCarritoPresupuestoWeb: TZReadOnlyQuery;
    dsCarritoPresupuestoWeb: TDataSource;
    sqlCarritoPresupuestoInsert: TZReadOnlyQuery;
    sqlCarritoPresupuestof_fecha_envio: TDateTimeField;
    sqlCarritoPresupuestoid_provincia: TStringField;
    sqlCarritoPresupuestoid_municipio: TStringField;
    sqlCarritoPresupuestods_municipio: TStringField;
    sqlCarritoPresupuestoid_tipo_via: TStringField;
    sqlCarritoPresupuestods_nombre_via: TStringField;
    sqlCarritoPresupuestods_numero: TStringField;
    sqlCarritoPresupuestods_cp: TStringField;
    sqlCarritoPresupuestods_cp_extranjero: TStringField;
    sqlCarritoPresupuestods_resto_direccion: TStringField;
    sqlCarritoPresupuestods_provincia: TStringField;
    sqlClientesInsert: TADOQuery;
    sqlCarritoPresupuestods_dni: TStringField;
    sqlCarritoPresupuestods_telefono: TStringField;
    sqlUltCliente: TADOQuery;
    sqlCarritoPresupuestods_direcli: TStringField;
    sqlCarritoPresupuestods_ciudad: TStringField;
    sqlInsertClientes: TZReadOnlyQuery;
    sqlCarritocd_color: TStringField;
    sqlCarritoPresupuestoid_cliente: TLargeintField;
    sqlCarritoPresupuestoid_agencia_transporte: TLargeintField;
    sqlCarritoPresupuestoid_forma_pago: TLargeintField;
    sqlCarritoPresupuestods_agencia_transporte: TStringField;
    sqlCarritoPresupuestods_forma_pago: TStringField;
    sqlCarritoPresupuestoid_tipo_sexo: TStringField;
    sqlCarritoPresupuestocod_cliente_access: TIntegerField;
    sqlCarritoPresupuestonm_comision_reembolso: TFloatField;
    sqlCarritoPresupuestonm_fijo_reembolso: TFloatField;
    sqlCarritoPresupuestonm_minimo_comision: TFloatField;
    sqlDireccionesInsert: TZReadOnlyQuery;
    sqlCarritoPresupuestods_dir_comp: TStringField;
    sqlDirecciones: TZReadOnlyQuery;
    sqlDireccionesid_direccion: TLargeintField;
    sqlDireccionesid_provincia: TStringField;
    sqlDireccionesid_municipio: TStringField;
    sqlDireccionesds_municipio: TStringField;
    sqlDireccionesid_tipo_via: TStringField;
    sqlDireccionesds_nombre_via: TStringField;
    sqlDireccionesds_numero: TStringField;
    sqlDireccionesds_cp: TStringField;
    sqlDireccionesds_cp_extranjero: TStringField;
    sqlDireccionesds_resto_direccion: TStringField;
    sqlDireccionesds_provincia: TStringField;
    sqlDireccionesds_muni: TStringField;
    sqlDireccionesds_tipo_via: TStringField;
    sqlCarritoPresupuestods_observaciones: TMemoField;
    sqlCarritoPresupuestods_cod_post: TStringField;
    sqlDireccionesds_cod_post: TStringField;
    sqlCarritoit_devolucion: TStringField;
    sqlCarritonm_precio_final_total: TFloatField;
    sqlCarritoPresupuestonm_descuento_efectivo: TFloatField;
    sqlCarritods_tipo_talla_abr: TStringField;
    sqlCarritoPresupuestonm_orden: TSmallintField;
    sqlCarritonm_cantidad: TLargeintField;
    sqlCarritonm_orden_talla: TSmallintField;
    sqlDireccionCliente: TZReadOnlyQuery;
    LargeintField1: TLargeintField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    sqlCarritocd_color_fabricante: TStringField;
    sqlCarritonm_descuento: TFloatField;
    sqlCarritoPresupuestods_codigo_envio: TStringField;
    procedure sqlCarritoPresupuestoUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlCarritoPresupuestoBeforePost(DataSet: TDataSet);
    procedure sqlCarritoUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlCarritoBeforePost(DataSet: TDataSet);
    procedure sqlCarritoBeforeDelete(DataSet: TDataSet);
    procedure sqlCarritoWebBeforeOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqlCarritoCalcFields(DataSet: TDataSet);
    procedure sqlClientesAfterOpen(DataSet: TDataSet);
  private
    asNombreEsp: TNombreArray;

    function TotalReembolso: Extended;
    function CreateIDClient: string;
  public
    procedure FiltraActivos(lFiltrar: Boolean);
    procedure ActualizaPresupuesto(const sIdCliente: string);
    procedure ActualizaPresupuestoCanarias;
    procedure BorraPresupuesto(const sIdCliente: string);
    function DatosProductoToHTML: string;
    function DatosPresupuestoToHTML: string;
    procedure PresupuestoAceptado(const sIdCliente: string);
    procedure PresupuestoPagado(const sIdCliente: string);
    procedure PresupuestoAnulado(const sIdCliente: string);
    procedure PresupuestoRecogida(const sIdCliente: string);
    procedure PresupuestoEnviado(const sIdCliente: string; nFCompra: TDateTime);
    procedure CambiaFechaCompra(const sIdCliente: string; nFCompra: TDateTime);
    procedure PedidoEnviado(const sIdCliente: string);
    function BuscaPresupuesto(const sIdCliente: string): Boolean;
    function EsPresupuestoAceptado: Boolean;
    function EsPresupuestoCaducado: Boolean;
    function EsPresupuestoAnulado: Boolean;
    procedure SubirPedido(const sIdCliente: string);
    procedure CargaTallas;
    procedure InsertaProducto(Producto: TProductoVenta);
    procedure PedidoEstadoCero(const sIdCliente: string);
    function DatosEnvio(lObservaciones: Boolean): string;
    function DatosClientePresupuesto(lMostrarTelefono, lMostrarDNI,
      lMostrarEmail: Boolean): string;
    function DatosCliente(nIdCliente: Integer): string; overload;
    function DatosDireccionCliente(nIdDireccion: Integer): string; overload;
    procedure AltaClienteAccess;
    procedure AltaCliente(nCodClienteAccess: Integer);
    procedure AltaDireccion(nIdCliente: Integer);
    procedure NombreEspanolCliente(nIdCliente: Integer; asNombre: TNombreArray);
    procedure InputFormCallBack(asValues: array of string);
    function Reembolso: Extended;
    procedure ClienteDeParte(nCodClienteAccess: Integer);
    function DuplicaPresupuesto(nIdCarrito: Integer): Integer;
    function UnePresupuestos(nIdCarrito1, nIdCarrito2: Integer): Integer;
  end;

var
  dmPresupuestos: TdmPresupuestos = nil;

implementation

{$R *.DFM}

uses Math, uConst;

const
  ID_ESTADO_ENVIADO_RANNING = 1;
  ID_ESTADO_ACEPTADO = 3;
  ID_ESTADO_RECOGIDA = 7;
  NM_ESTADO_ACEPTADO = 10;
  NM_ESTADO_PAGADO = 11;
  ID_ESTADO_PEDIDO = 4;
  ID_ESTADO_CADUCADO = 5;
  ID_ESTADO_ANULADO = 6;
  ID_FORMA_PAGO_REEMBOLSO = 5;
  ID_ESTADO_PAGADO = 8;

procedure TdmPresupuestos.sqlCarritoPresupuestoUpdateRecord(
  DataSet: TDataSet; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmPresupuestos.sqlCarritoPresupuestoBeforePost(
  DataSet: TDataSet);
begin
  sqlCarritoPresupuestoUpdate.ExecSQL;
end;

procedure TdmPresupuestos.sqlCarritoUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmPresupuestos.sqlCarritoBeforePost(DataSet: TDataSet);
begin
  sqlCarritoUpdate.ExecSQL;
end;

procedure TdmPresupuestos.sqlCarritoBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('¿Estás seguro de borrar este registro?',mtWarning,[mbYes,mbNo],0) = mrYes then
    sqlCarritoDelete.ExecSQL
  else
    Abort;
end;

procedure TdmPresupuestos.FiltraActivos(lFiltrar: Boolean);
begin
  if sqlCarritoPresupuesto.Filtered and lFiltrar then Exit;
  if (not sqlCarritoPresupuesto.Filtered) and (not lFiltrar) then Exit;

  if lFiltrar then
    sqlCarritoPresupuesto.Filter := '(id_estado_pedido <> ' +
      IntToStr(ID_ESTADO_PEDIDO) + ') and (id_estado_pedido <> ' +
      IntToStr(ID_ESTADO_CADUCADO) + ')'
  else
    sqlCarritoPresupuesto.Filter := '';
  sqlCarritoPresupuesto.Filtered := lFiltrar;
end;

procedure TdmPresupuestos.ActualizaPresupuesto(const sIdCliente: string);

var
  sqlPres: TZReadOnlyQuery;
  lFiltrado: Boolean;
  sReg: string;

begin
  sReg := sqlCarritoPresupuesto.FieldByName('id_cliente_web').AsString;
  lFiltrado := sqlCarritoPresupuesto.Filtered;
  if not sqlCarritoWeb.Connection.Connected then sqlCarritoWeb.Connection.Connect;
  try
    sqlCarritoPresupuesto.DisableControls;
    try
      sqlCarritoPresupuesto.Filtered := False;
      if sIdCliente <> '' then begin
        sqlPres := dmRanning.ComandoSQL('select id_cliente_web from ' +
          'carrito_presupuesto where id_cliente_web = ' + QuotedStr(sIdCliente),
          csResultado);
        if not sqlPres.IsEmpty then begin
          ShowMessage('El presupuesto ' + sIdCliente + ' ya existe en la base de datos.' +
          #13 + #10 + 'No se puede actualizar desde la web');
          dmRanning.ComandoSQLFree(sqlPres);
          Exit;
        end;

        if sqlCarritoWeb.Active then sqlCarritoWeb.Close;
        sqlCarritoWeb.Params.ParamByName('id_cliente_web').AsString := sIdCliente;
        sqlCarritoWeb.Open;
        sqlCarritoWeb.First;
        sqlCarritoInsert.DataSource := dsCarritoWeb;
        try
          while not sqlCarritoWeb.Eof do begin
            sqlCarritoInsert.ExecSQL;
            sqlCarritoWeb.Next;
            Application.ProcessMessages;
          end;
        finally
          sqlCarritoInsert.DataSource := nil;
        end;

        if sqlCarritoPresupuestoWeb.Active then sqlCarritoPresupuestoWeb.Close;
        sqlCarritoPresupuestoWeb.ParamByName('id_cliente_web').AsString := sIdCliente;
        sqlCarritoPresupuestoWeb.Open;
        sqlCarritoPresupuestoInsert.ExecSQL;
      end;

      if sqlActualizaPresupuesto.Active then sqlActualizaPresupuesto.Close;
      sqlActualizaPresupuesto.Open;
      sqlActualizaPresupuesto.First;
      if sqlCarritoPresupuesto.Active then sqlCarritoPresupuesto.Close;
      sqlCarritoPresupuesto.Open;
      while not sqlActualizaPresupuesto.Eof do begin
        if not sqlCarritoPresupuesto.Locate('id_cliente_web',
           sqlActualizaPresupuesto.FieldByName('id_cliente_web').AsString,[]) then begin
          sqlPres := dmRanning.ComandoSQLWeb('select ds_primer_apellido,' +
            'ds_segundo_apellido,ds_nombre,ds_email,it_canarias,id_provincia,' +
            'id_municipio,ds_resto_direccion,ds_municipio,ds_cp,id_tipo_via,' +
            'ds_nombre_via,ds_numero,ds_dni,ds_telefono,id_cliente,' +
            'id_agencia_transporte,id_forma_pago,nm_gastos_envio,id_tipo_sexo,' +
            'ds_cp_extranjero,nm_descuento_efectivo from carrito_presupuesto ' +
            'where id_cliente_web = ' + QuotedStr(sIdCliente),csResultado);
          sqlActualizaPresupuestoInsert.ParamByName('ds_primer_apellido').AsString :=
            sqlPres.FieldByName('ds_primer_apellido').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_segundo_apellido').AsString :=
            sqlPres.FieldByName('ds_segundo_apellido').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_nombre').AsString :=
            sqlPres.FieldByName('ds_nombre').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_email').AsString :=
            sqlPres.FieldByName('ds_email').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('it_canarias').AsString :=
            sqlPres.FieldByName('it_canarias').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('id_provincia').AsString :=
            sqlPres.FieldByName('id_provincia').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('id_municipio').AsString :=
            sqlPres.FieldByName('id_municipio').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_resto_direccion').AsString :=
            sqlPres.FieldByName('ds_resto_direccion').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_municipio').AsString :=
            sqlPres.FieldByName('ds_municipio').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_cp').AsString :=
            sqlPres.FieldByName('ds_cp').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('id_tipo_via').AsString :=
            sqlPres.FieldByName('id_tipo_via').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_nombre_via').AsString :=
            sqlPres.FieldByName('ds_nombre_via').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_numero').AsString :=
            sqlPres.FieldByName('ds_numero').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_dni').AsString :=
            sqlPres.FieldByName('ds_dni').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('ds_telefono').AsString :=
            sqlPres.FieldByName('ds_telefono').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('id_cliente').AsInteger :=
            sqlPres.FieldByName('id_cliente').AsInteger;
          sqlActualizaPresupuestoInsert.ParamByName('id_agencia_transporte').AsInteger :=
            sqlPres.FieldByName('id_agencia_transporte').AsInteger;
          sqlActualizaPresupuestoInsert.ParamByName('id_forma_pago').AsInteger :=
            sqlPres.FieldByName('id_forma_pago').AsInteger;
          sqlActualizaPresupuestoInsert.ParamByName('nm_gastos_envio').AsFloat :=
            sqlPres.FieldByName('nm_gastos_envio').AsFloat;
          sqlActualizaPresupuestoInsert.ParamByName('id_tipo_sexo').AsInteger :=
            sqlPres.FieldByName('id_tipo_sexo').AsInteger;
          sqlActualizaPresupuestoInsert.ParamByName('ds_cp_extranjero').AsString :=
            sqlPres.FieldByName('ds_cp_extranjero').AsString;
          sqlActualizaPresupuestoInsert.ParamByName('nm_descuento_efectivo').AsFloat :=
            sqlPres.FieldByName('nm_descuento_efectivo').AsFloat;
          sqlActualizaPresupuestoInsert.ExecSQL;
          dmRanning.ComandoSQLFree(sqlPres);
        end
        else if sqlCarritoPresupuesto.FieldByName('nm_orden').AsInteger < NM_ESTADO_ACEPTADO then
          sqlActualizaPresupuestoUpdate.ExecSQL;
        sqlActualizaPresupuesto.Next;
        Application.ProcessMessages;
      end;
    finally
      sqlCarritoPresupuesto.Filtered := lFiltrado;
      sqlCarritoPresupuesto.Locate('id_cliente_web',sReg,[]);
      sqlCarritoPresupuesto.EnableControls;
    end;
  finally
    sqlCarritoWeb.Connection.disconnect;
  end;
end;

procedure TdmPresupuestos.sqlCarritoWebBeforeOpen(DataSet: TDataSet);
begin
  if not sqlCarritoWeb.Connection.Connected then
    sqlCarritoWeb.Connection.Connect;
end;

procedure TdmPresupuestos.DataModuleDestroy(Sender: TObject);
begin
  if sqlCarritoWeb.Connection.Connected then sqlCarritoWeb.Connection.Disconnect;
end;

procedure TdmPresupuestos.BorraPresupuesto(const sIdCliente: string);
begin
  dmRanning.ComandoSQL('delete from carrito where id_cliente_web = ' +
    QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQL('delete from carrito_presupuesto where ' +
    'id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

function TdmPresupuestos.DatosPresupuestoToHTML: string;

var
  sTabla: string;
  rDesc: Extended;

begin
  rDesc := sqlCarritoPresupuesto.FieldByName('nm_descuento_efectivo').AsFloat;
  sTabla := '';
  sqlCarrito.First;
  while not sqlCarrito.Eof do begin
    sTabla := sTabla + '<tr>' + DatosProductoToHtml + '</tr>';
    sqlCarrito.Next;
  end;
  if rDesc <> 0 then
    sTabla := sTabla + '<tr class="fuente_roja fuente_negrita"><td colspan="9">' +
    'Descuento</td><td class="precio">-' + dmRanning.FormateaPrecio(rDesc) +
    '</td></tr>';

  Result := sTabla;
end;

function TdmPresupuestos.DatosProductoToHTML: string;

var
  rPrecio: Extended;
  sHTML: string;
  sDevolucion: string;
  rIVA: Extended;

begin
  Result := '';
  sHTML := '<td>' + sqlCarrito.FieldByName('cd_producto_completo').AsString +
    '</td><td>' + sqlCarrito.FieldByName('ds_marca').AsString +
    '</td><td>' + sqlCarrito.FieldByName('ds_producto').AsString +
    '</td><td>' + sqlCarrito.FieldByName('cd_color_fabricante').AsString +
    '</td><td>' + dmRanning.DescColor(sqlCarrito.FieldByName('cd_color').AsString) +
    '</td><td>' + sqlCarrito.FieldByName('ds_talla').AsString + ' ' +
    sqlCarrito.FieldByName('ds_tipo_talla_abr').AsString + '</td>';

  if not dmRanning.ItFieldMarked(sqlCarrito.FieldByName('it_devolucion')) then begin
    sHTML := sHTML + '<td class="precio">' + sqlCarrito.FieldByName('nm_cantidad').AsString;
    sDevolucion := '';
  end
  else begin
    sHTML := sHTML + '<td class="fuente_roja precio">-' +
      sqlCarrito.FieldByName('nm_cantidad').AsString;
    sDevolucion := ' fuente_roja';
  end;
  sHTML := sHTML + '</td><td class="precio ' + sDevolucion + '">';

  if not dmRanning.ItFieldMarked(sqlCarritoPresupuesto.FieldByName('it_canarias')) then
    rPrecio := sqlCarrito.FieldByName('nm_pvp').AsFloat
  else begin
    rIVA := dmRanning.EquivalenciaIVA[FloatToStr(sqlCarrito.FieldByName('nm_iva').AsFloat * 100)];
    if rIVA = -1 then rIVA := sqlCarrito.FieldByName('nm_iva').AsFloat;
    rPrecio := sqlCarrito.FieldByName('nm_pvp').AsFloat / (1 + rIVA / 100);
  end;

  if dmRanning.ItFieldMarked(sqlCarrito.FieldByName('it_devolucion')) then
    rPrecio := -1 * rPrecio;

  sHTML := sHTML + dmRanning.FormateaPrecio(rPrecio) + '</td><td class="precio">' +
    dmRanning.FormateaPorcentaje(sqlCarrito.FieldByName('nm_descuento')) +
    '</td><td class="precio ' + sDevolucion + '">';

  if not dmRanning.ItFieldMarked(sqlCarritoPresupuesto.FieldByName('it_canarias')) then
    rPrecio := sqlCarrito.FieldByName('nm_precio_final_total').AsFloat
  else
    rPrecio := sqlCarrito.FieldByName('nm_precio_final_total').AsFloat / (1 +
      rIVA / 100);

  Result := sHTML + dmRanning.FormateaPrecio(rPrecio) + '</td>';
end;

procedure TdmPresupuestos.PresupuestoAceptado(const sIdCliente: string);

var
  sFAcept: string;

begin
  sFAcept := FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
  dmRanning.ComandoSQL('update carrito_presupuesto set f_fecha_aceptacion = ' +
    QuotedStr(sFAcept) + ', id_estado_pedido = ' + IntToStr(ID_ESTADO_ACEPTADO) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set f_fecha_aceptacion = ' +
    QuotedStr(sFAcept) + ' , id_estado_pedido = ' +  IntToStr(ID_ESTADO_ACEPTADO) +
    ' , nm_pvp = ' + sqlCarritoPresupuesto.FieldByName('nm_pvp').AsString +
    ' , nm_gastos_envio = ' +
    sqlCarritoPresupuesto.FieldByName('nm_gastos_envio').AsString + ' , ds_email = ' +
    QuotedStr(sqlCarritoPresupuesto.FieldByName('ds_email').AsString) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

function TdmPresupuestos.BuscaPresupuesto(const sIdCliente: string): Boolean;
begin
  Result := sqlCarritoPresupuesto.Locate('id_cliente_web',sIdCliente,[loPartialKey]);
end;

function TdmPresupuestos.EsPresupuestoAceptado: Boolean;

var
  nFormaPago: Integer;

begin
  nFormaPago := sqlCarritoPresupuesto.FieldByName('id_forma_pago').AsInteger;
  Result := (not sqlCarritoPresupuesto.FieldByName('f_fecha_aceptacion').IsNull) and
    ((nFormaPago <> ID_FORMA_PAGO_TRANSFERENCIA) or
    ((nFormaPago = ID_FORMA_PAGO_TRANSFERENCIA) and
    (sqlCarritoPresupuesto.FieldByName('nm_orden').AsInteger >= NM_ESTADO_PAGADO)));
end;

procedure TdmPresupuestos.PresupuestoEnviado(const sIdCliente: string;
  nFCompra: TDateTime);
begin
  dmRanning.ComandoSQL('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_ENVIADO_CLIENTE) + ', f_fecha_compra = ' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',nFCompra)) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_ENVIADO_CLIENTE) + ', f_fecha_compra = ' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',nFCompra)) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

procedure TdmPresupuestos.PedidoEnviado(const sIdCliente: string);
begin
  dmRanning.ComandoSQL('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_PEDIDO) + ' where id_cliente_web = ' +
    QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_PEDIDO) + ', ds_codigo_envio = ' +
    QuotedStr(sqlCarritoPresupuesto.FieldByName('ds_codigo_envio').AsString) +
    ', f_fecha_envio = ' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',
    sqlCarritoPresupuesto.FieldByName('f_fecha_envio').AsDateTime)) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

procedure TdmPresupuestos.SubirPedido(const sIdCliente: string);
begin
  dmRanning.ComandoSQLWeb('delete from carrito_presupuesto where id_cliente_web = ' +
    QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('delete from carrito where id_cliente_web = ' +
    QuotedStr(sIdCliente),csEjecutar);
  sqlCarritoPresupuesto.DisableControls;
  try
    if sqlCarritoPresupuesto.Locate('id_cliente_web',sIdCliente,[]) then
      sqlSubirCarritoPresupuesto.ExecSQL;
  finally
    sqlCarritoPresupuesto.EnableControls;
  end;
  sqlCarrito.DisableControls;
  try
    sqlCarrito.First;
    while not sqlCarrito.Eof do begin
      sqlSubirCarrito.ExecSQL;
      sqlCarrito.Next;
      Application.ProcessMessages;
    end;
  finally
    sqlCarrito.EnableControls;
  end;
end;

function TdmPresupuestos.EsPresupuestoCaducado: Boolean;
begin
  Result := sqlCarritoPresupuesto.FieldByName('id_estado_pedido').AsInteger =
    ID_ESTADO_CADUCADO;
end;

procedure TdmPresupuestos.CargaTallas;
begin
  if not sqlProductoTallas.Active then sqlProductoTallas.Open;
  dmRanning.CreaSQLTallas(sqlProductoTallas,sqlTallas);
end;

procedure TdmPresupuestos.InsertaProducto(Producto: TProductoVenta);
begin
  sqlCarritoInsert.ParamByName('id_cliente_web').AsString :=
    sqlCarritoPresupuesto.FieldByName('id_cliente_web').AsString;
  sqlCarritoInsert.ParamByName('f_fecha_compra').AsDateTime := Now;
  sqlCarritoInsert.ParamByName('id_producto').AsInteger := Producto.IdProducto;
  sqlCarritoInsert.ParamByName('cd_color').AsString := Producto.CdColor;
  sqlCarritoInsert.ParamByName('id_talla').AsInteger := Producto.IdTalla;
  sqlCarritoInsert.ParamByName('nm_descuento').AsFloat := Producto.Descuento;
  sqlCarritoInsert.ParamByName('nm_pvp').AsFloat := Producto.PVP;
  sqlCarritoInsert.ParamByName('nm_cantidad').AsInteger := 1;
  sqlCarritoInsert.ParamByName('nm_iva').AsFloat := Producto.IVA;
  sqlCarritoInsert.ParamByName('it_devolucion').AsString := CAMPO_NO_MARCADO;
  sqlCarritoInsert.ExecSQL;
end;

procedure TdmPresupuestos.CambiaFechaCompra(const sIdCliente: string;
  nFCompra: TDateTime);
begin
  dmRanning.ComandoSQL('update carrito_presupuesto set f_fecha_compra = ' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',nFCompra)) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set f_fecha_compra = ' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',nFCompra)) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

procedure TdmPresupuestos.ActualizaPresupuestoCanarias;
begin
  sqlCarritoPresupuesto.Edit;
  sqlCarritoPresupuesto.FieldByName('it_canarias').AsString := CAMPO_MARCADO;
  sqlCarritoPresupuesto.Post;

  ActualizaPresupuesto('');
end;

procedure TdmPresupuestos.PedidoEstadoCero(const sIdCliente: string);
begin
  dmRanning.ComandoSQL('update carrito_presupuesto set f_fecha_aceptacion = null, ' +
    'id_estado_pedido = ' + IntToStr(ID_ESTADO_ENVIADO_RANNING) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set f_fecha_aceptacion = null, ' +
    'id_estado_pedido = ' + IntToStr(ID_ESTADO_ENVIADO_RANNING) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

function TdmPresupuestos.DatosEnvio(lObservaciones: Boolean): string;

var
  sRestoDir: string;
  sObs: string;
  sNombre: string;
  sqlNombre: TZReadOnlyQuery;

begin
  sRestoDir := sqlCarritoPresupuesto.FieldByName('ds_resto_direccion').AsString;
  if sRestoDir <> '' then
    sRestoDir := ',&nbsp;' + sRestoDir;
  sObs := '';
  if lObservaciones then
    sObs := sqlCarritoPresupuesto.FieldByName('ds_observaciones').AsString;
  if sObs <> '' then
    sObs := '<br><b>Observaciones:</b> ' + sObs;

  sNombre := sqlCarritoPresupuesto.FieldByName('ds_nombre_completo').AsString;
  if sqlCarritoPresupuesto.FieldByName('id_cliente').AsInteger <> 0 then begin
    sqlNombre := dmRanning.ComandoSQL('select concat(ds_nombre_esp," ",' +
      'ds_primer_apellido_esp," ",ds_segundo_apellido_esp) ds_nombre from ' +
      'clientes where id_cliente = ' +
      sqlCarritoPresupuesto.FieldByName('id_cliente').AsString,csResultado);
    sNombre := sqlNombre.FieldByName('ds_nombre').AsString;
    dmRanning.ComandoSQLFree(sqlNombre);
  end;

  Result :=
    sNombre + '<br>' +
    sqlCarritoPresupuesto.FieldByName('id_tipo_via').AsString +
    '&nbsp;' + sqlCarritoPresupuesto.FieldByName('ds_nombre_via').AsString +
    '&nbsp;' + sqlCarritoPresupuesto.FieldByName('ds_numero').AsString + sRestoDir +
    '<br>' + sqlCarritoPresupuesto.FieldByName('ds_cod_post').AsString + ' ' +
    sqlCarritoPresupuesto.FieldByName('ds_municipio').AsString + ' (' +
    sqlCarritoPresupuesto.FieldByName('ds_provincia').AsString + ')' + '<br>' +
    'Teléfono: ' + sqlCarritoPresupuesto.FieldByName('ds_telefono').AsString +
    sObs;
end;

procedure TdmPresupuestos.AltaClienteAccess;

var
  nUltCli: Integer;

begin
  if not sqlUltCliente.Connection.Connected then sqlUltCliente.Connection.Open;
  try
    if sqlUltCliente.Active then sqlUltCliente.Close;
    try
      sqlUltCliente.Open;
    except
      on E: Exception do begin
        ShowMessage('Error en Access: ' + #13 + #10 + E.Message);
        Exit;
      end;
    end;

    nUltCli := sqlUltCliente.FieldByName('nUltCliente').AsInteger;
    sqlUltCliente.Close;
    sqlClientesInsert.Parameters.ParamByName('idecli').Value := nUltCli + 1;
    sqlClientesInsert.Parameters.ParamByName('descuento').Value := 0.1;
    sqlClientesInsert.Parameters.ParamByName('nombre_completo').Value :=
      UpperCaseSinAcentos(sqlCarritoPresupuesto.FieldByName('ds_nombre_completo').AsString);
    sqlClientesInsert.Parameters.ParamByName('direcli').Value :=
      UpperCaseSinAcentos(sqlCarritoPresupuesto.FieldByName('ds_direcli').AsString);
    if sqlCarritoPresupuesto.FieldByName('id_provincia').AsString <> '' then
      sqlClientesInsert.Parameters.ParamByName('ciudad').Value :=
        UpperCaseSinAcentos(sqlCarritoPresupuesto.FieldByName('ds_ciudad').AsString)
    else
      sqlClientesInsert.Parameters.ParamByName('ciudad').Value :=
        UpperCaseSinAcentos(sqlCarritoPresupuesto.FieldByName('ds_resto_direccion').AsString);
    try
      sqlClientesInsert.ExecSQL;
    except
      on E: Exception do begin
        ShowMessage('Error en el alta del cliente en Access: ' + #13 + #10 + E.Message);
        Exit;
      end;
    end;
  finally
    sqlUltCliente.Connection.Close;
  end;

  {
  ShowMessage('Cliente dado de alta en Access con código de cliente ' +
    IntToStr(nUltCli + 1));
  }
  if (sqlCarritoPresupuesto.FieldByName('id_cliente').AsInteger = 0) then
    AltaCliente(nUltCli + 1);
end;

procedure TdmPresupuestos.AltaCliente(nCodClienteAccess: Integer);

var
  sqlUltCli: TZReadOnlyQuery;
  nUltCli: Integer;
  nUltDir: Integer;
  sDir1: string;
  sDir2: string;
  lInsertDir: Boolean;
  lInsertCli: Boolean;
  sMsg: string;
  asNombre: TNombreArray;

begin
  sqlUltCli := nil;
  try
    sqlUltCli := dmRanning.ComandoSQL('select id_cliente from clientes' +
      ' where cod_cliente_access = ' + IntToStr(nCodClienteAccess),csResultado);
    lInsertCli := sqlUltCli.RecordCount = 0;
    lInsertDir := lInsertCli;
    nUltCli := 0;
    if not lInsertCli then begin
      nUltCli := sqlUltCli.FieldByName('id_cliente').AsInteger;
      dmRanning.ComandoSQLFree(sqlUltCli);
      sqlUltCli := dmRanning.ComandoSQL('select concat(d.id_tipo_via,d.ds_nombre_via,' +
      'd.ds_numero) ds_dir_comp from direcciones d,clientes_direcciones cd where ' +
      '(cd.id_cliente = ' + IntToStr(nUltCli) + ') and (cd.id_direccion = ' +
      'd.id_direccion) and (d.id_provincia = ' +
      QuotedStr(sqlCarritoPresupuesto.FieldByName('id_provincia').AsString) +
      ') and (d.id_municipio = ' +
      QuotedStr(sqlCarritoPresupuesto.FieldByName('id_municipio').AsString) + ')',
      csResultado);
      lInsertDir := sqlUltCli.RecordCount = 0;
    end;

    if not lInsertDir then begin
      sDir1 := OnlyChar(sqlCarritoPresupuesto.FieldByName('ds_dir_comp').AsString);
      sDir2 := OnlyChar(sqlUltCli.FieldByName('ds_dir_comp').AsString);
      dmRanning.ComandoSQLFree(sqlUltCli);
      lInsertDir := sDir1 <> sDir2;
      if lInsertDir then begin
        sMsg := 'La dirección del presupuesto es:' + #13 + #10 +
          DatosClientePresupuesto(True,False,False) + #13 + #10 + #13 + #10 +
          'y la(s) direccion(es) en la base de datos:' + #13 + #10  + #13 + #10 +
          DatosCliente(nUltCli) + #13 + #10 + '¿Quieres dar de alta la dirección ' +
          'del presupuesto para este cliente?';
        lInsertDir := MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes;
      end;
    end;
    if lInsertDir then begin
      if sqlCarritoPresupuesto.FieldByName('id_municipio').AsString <> '' then
        sqlDireccionesInsert.ParamByName('municipio').AsString := ''
      else
        sqlDireccionesInsert.ParamByName('municipio').AsString :=
          sqlCarritoPresupuesto.FieldByName('ds_municipio').AsString;
      sqlDireccionesInsert.ExecSQL;
      if Assigned(sqlUltCli) then dmRanning.ComandoSQLFree(sqlUltCli);
      sqlUltCli := dmRanning.ComandoSQL('select max(id_direccion) nUltDir from direcciones',
        csResultado);
      nUltDir := sqlUltCli.FieldByName('nUltDir').AsInteger;
      dmRanning.ComandoSQLFree(sqlUltCli);
      dmRanning.TablaModificada('direcciones','id_direccion',nUltDir,raInsert);
    end;

    if lInsertCli then begin
      sqlInsertClientes.ParamByName('cliente_access').AsInteger := nCodClienteAccess;
      sqlInsertClientes.ParamByName('nombre').AsString :=
        UpperCaseFirstAllSinAcentos(sqlCarritoPresupuesto.FieldByName('ds_nombre').AsString);
      sqlInsertClientes.ParamByName('primer_apellido').AsString :=
        UpperCaseFirstAllSinAcentos(sqlCarritoPresupuesto.FieldByName('ds_primer_apellido').AsString);
      sqlInsertClientes.ParamByName('segundo_apellido').AsString :=
        UpperCaseFirstAllSinAcentos(sqlCarritoPresupuesto.FieldByName('ds_segundo_apellido').AsString);
      sqlInsertClientes.ParamByName('f_ultima_actualizacion').AsDateTime := Now;
      sqlInsertClientes.ExecSQL;
      nUltCli := dmRanning.UltimoID;
      asNombre[NA_NOMBRE] := sqlCarritoPresupuesto.FieldByName('ds_nombre').AsString;
      asNombre[NA_APELLIDO_1] :=
        sqlCarritoPresupuesto.FieldByName('ds_primer_apellido').AsString;
      asNombre[NA_APELLIDO_2] :=
        sqlCarritoPresupuesto.FieldByName('ds_segundo_apellido').AsString;
      NombreEspanolCliente(nUltCli,asNombre);
      dmRanning.TablaModificada('clientes','id_cliente',nUltCli,raInsert);
    end;

    if lInsertDir then begin
      dmRanning.ComandoSQL('insert into clientes_direcciones (id_cliente,id_direccion)' +
        ' values (' + IntToStr(nUltCli) + ',' + IntToStr(nUltDir) + ')',csEjecutar);
      dmRanning.TablaModificada('clientes_direcciones','id',dmRanning.UltimoID,raInsert);
      if not lInsertCli then begin
        dmRanning.ComandoSQL('update clientes set f_ultima_actualizacion = ' +
          FormatDateTime('yyyymmddhhnnss',Now) + ' where id_cliente = ' +
          IntToStr(nUltCli),csEjecutar);
        dmRanning.TablaModificada('clientes','id_cliente',nUltCli,raModify);
      end;
    end;

    sqlCarritoPresupuesto.Edit;
    sqlCarritoPresupuesto.FieldByName('id_cliente').AsInteger := nUltCli;
    sqlCarritoPresupuesto.Post;
    dmRanning.ComandoSQLWeb('update carrito_presupuesto set id_cliente = ' +
      IntToStr(nUltCli) + ' where id_cliente_web = ' +
      QuotedStr(sqlCarritoPresupuesto.FieldByName('id_cliente_web').AsString),
      csEjecutar);
  except
    on E: Exception do begin
      ShowMessage('Error en alta de cliente: ' + #13 + #10 + E.Message);
    end;
  end;
end;

procedure TdmPresupuestos.InputFormCallBack(asValues: array of string);
begin
  dmPresupuestos.asNombreEsp[NA_NOMBRE] := asValues[NA_NOMBRE];
  dmPresupuestos.asNombreEsp[NA_APELLIDO_1] := asValues[NA_APELLIDO_1];
  dmPresupuestos.asNombreEsp[NA_APELLIDO_2] := asValues[NA_APELLIDO_2];
end;

procedure TdmPresupuestos.NombreEspanolCliente(nIdCliente: Integer;
  asNombre: TNombreArray);

var
  pCallBack: TInputFormCallBack;

begin
  pCallBack := InputFormCallBack;
  if not InputForm('Nombre del cliente con acentos',A_NOMBRE_TITULOS,asNombre,pCallBack) then
    Exit;

  dmRanning.ComandoSQL('update clientes set ds_nombre_esp = ' +
    QuotedStr(asNombreEsp[NA_NOMBRE]) + ', ds_primer_apellido_esp = ' +
    QuotedStr(asNombreesp[NA_APELLIDO_1]) + ', ds_segundo_apellido_esp = ' +
    QuotedStr(asNombreesp[NA_APELLIDO_2]) + ' where id_cliente = ' +
    IntToStr(nIdCliente),csEjecutar);
end;

procedure TdmPresupuestos.sqlCarritoCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ds_color_completo').AsString :=
    dmRanning.DescColor(DataSet.FieldByName('cd_color').AsString);
end;

function TdmPresupuestos.DatosClientePresupuesto(lMostrarTelefono, lMostrarDNI,
  lMostrarEmail: Boolean): string;

var
  sRestoDir: string;
  sNombre: string;
  sqlNombre: TZReadOnlyQuery;
  sTelefono: string;
  sDNI: string;
  sEmail: string;

begin
  sRestoDir := sqlCarritoPresupuesto.FieldByName('ds_resto_direccion').AsString;
  if sRestoDir <> '' then
    sRestoDir := ', ' + sRestoDir;

  sNombre := sqlCarritoPresupuesto.FieldByName('ds_nombre_completo').AsString;
  if sqlCarritoPresupuesto.FieldByName('id_cliente').AsInteger <> 0 then begin
    sqlNombre := dmRanning.ComandoSQL('select concat(ds_nombre_esp," ",' +
      'ds_primer_apellido_esp," ",ds_segundo_apellido_esp) ds_nombre from ' +
      'clientes where id_cliente = ' +
      sqlCarritoPresupuesto.FieldByName('id_cliente').AsString,csResultado);
    if UpperCaseSinAcentos(sqlNombre.FieldByName('ds_nombre').AsString) = UpperCaseSinAcentos(sNombre) then
      sNombre := sqlNombre.FieldByName('ds_nombre').AsString;
    dmRanning.ComandoSQLFree(sqlNombre);
  end;
  if lMostrarTelefono then
    sTelefono := #13 + #10 + 'Teléfono: ' +
      sqlCarritoPresupuesto.FieldByName('ds_telefono').AsString
  else
    sTelefono := '';
  if lMostrarDNI then
    sDNI := #13 + #10 + 'DNI: ' +
      sqlCarritoPresupuesto.FieldByName('ds_dni').AsString
  else
    sDNI := '';
  if lMostrarEmail then
    sEmail := #13 + #10 + 'e-mail: ' +
      sqlCarritoPresupuesto.FieldByName('ds_email').AsString
  else
    sEmail := '';

  Result :=
    sNombre + sDNI + #13 + #10 +
    UpperCaseFirst(sqlCarritoPresupuesto.FieldByName('id_tipo_via').AsString) +
    ' ' + sqlCarritoPresupuesto.FieldByName('ds_nombre_via').AsString +
    ' ' + sqlCarritoPresupuesto.FieldByName('ds_numero').AsString + sRestoDir +
    #13 + #10 + sqlCarritoPresupuesto.FieldByName('ds_cod_post').AsString + ' ' +
    sqlCarritoPresupuesto.FieldByName('ds_municipio').AsString + ' (' +
    sqlCarritoPresupuesto.FieldByName('ds_provincia').AsString + ')' + sTelefono +
    sEmail;
end;

function TdmPresupuestos.DatosCliente(nIdCliente: Integer): string;

var
  sDir: string;
  nCont: Integer;

begin
  if sqlDirecciones.Active then sqlDirecciones.Close;
  sqlDirecciones.ParamByName('id_cliente').AsInteger := nIdCliente;
  sqlDirecciones.Open;
  sDir := '';
  nCont := 1;
  while not sqlDirecciones.Eof do begin
    sDir := sDir + 'Dirección ' + IntToStr(nCont) + ':' + SALTO_LINEA +
      DatosDireccionCliente(sqlDirecciones.FieldByName('id_direccion').AsInteger);
    sqlDirecciones.Next;
    if not sqlDirecciones.Eof then sDir := sDir + SALTO_LINEA + SALTO_LINEA;
    Inc(nCont);
    Application.ProcessMessages;
  end;

  Result := sDir;
end;

procedure TdmPresupuestos.PresupuestoAnulado(const sIdCliente: string);
begin
  dmRanning.ComandoSQL('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_ANULADO) + ' where id_cliente_web = ' +
    QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_ANULADO) + ' , nm_pvp = ' +
    sqlCarritoPresupuesto.FieldByName('nm_pvp').AsString + ' , nm_gastos_envio = ' +
    sqlCarritoPresupuesto.FieldByName('nm_gastos_envio').AsString + ' , ds_email = ' +
    QuotedStr(sqlCarritoPresupuesto.FieldByName('ds_email').AsString) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

function TdmPresupuestos.EsPresupuestoAnulado: Boolean;
begin
  Result := sqlCarritoPresupuesto.FieldByName('id_estado_pedido').AsInteger =
    ID_ESTADO_ANULADO;
end;

procedure TdmPresupuestos.sqlClientesAfterOpen(DataSet: TDataSet);
begin
  sqlDirecciones.Open;
end;

function TdmPresupuestos.Reembolso: Extended;
begin
  Result := 0;
  if sqlCarritoPresupuesto.FieldByName('id_forma_pago').AsInteger <> ID_FORMA_PAGO_REEMBOLSO then
    Exit;

  Result := TotalReembolso;
end;

function TdmPresupuestos.TotalReembolso: Extended;

var
  rGastos: Extended;
  rTotal: Extended;
  rFijo: Extended;
  rComision: Extended;
  rMinComision: Extended;
  rDesc: Extended;

begin
  rGastos := sqlCarritoPresupuesto.FieldByName('nm_gastos_envio').AsFloat;
  rTotal := sqlCarritoPresupuesto.FieldByName('nm_pvp').AsFloat + rGastos;
  rFijo := sqlCarritoPresupuesto.FieldByName('nm_fijo_reembolso').AsFloat;
  rComision := sqlCarritoPresupuesto.FieldByName('nm_comision_reembolso').AsFloat;
  rMinComision := sqlCarritoPresupuesto.FieldByName('nm_minimo_comision').AsFloat;
  rDesc := sqlCarritoPresupuesto.FieldByName('nm_descuento_efectivo').AsFloat;

  Result := rTotal - rDesc + Max(rFijo + (rTotal - rDesc) * rComision / 100,rMinComision);
end;

procedure TdmPresupuestos.AltaDireccion(nIdCliente: Integer);

var
  sqlUltDir: TZReadOnlyQuery;
  nUltDir: Integer;
  sDir1: string;
  sDir2: string;
  lInsertDir: Boolean;
  sMsg: string;

begin
  sqlUltDir := dmRanning.ComandoSQL('select concat(d.id_tipo_via,d.ds_nombre_via,' +
    'd.ds_numero) ds_dir_comp from direcciones d,clientes_direcciones cd where ' +
    '(cd.id_cliente = ' + IntToStr(nIdCliente) + ') and (cd.id_direccion = ' +
    'd.id_direccion) and (d.id_provincia = ' +
    QuotedStr(sqlCarritoPresupuesto.FieldByName('id_provincia').AsString) +
    ') and (d.id_municipio = ' +
    QuotedStr(sqlCarritoPresupuesto.FieldByName('id_municipio').AsString) + ')',
    csResultado);
  sDir1 := OnlyChar(sqlCarritoPresupuesto.FieldByName('ds_dir_comp').AsString);
  sDir2 := OnlyChar(sqlUltDir.FieldByName('ds_dir_comp').AsString);
  dmRanning.ComandoSQLFree(sqlUltDir);
  lInsertDir := sDir1 <> sDir2;
  sMsg := 'La dirección del presupuesto es:' + SALTO_LINEA +
    DatosClientePresupuesto(True,False,False) + SALTO_LINEA + SALTO_LINEA +
    'y la(s) direccion(es) en la base de datos:' + SALTO_LINEA  + SALTO_LINEA +
    DatosCliente(nIdCliente);
  if lInsertDir then begin
    sMsg := sMsg + SALTO_LINEA + '¿Quieres dar de alta la dirección ' +
    'del presupuesto para este cliente?';
    lInsertDir := MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes;
    if not lInsertDir then Exit;
  end
  else begin
    sMsg := sMsg + SALTO_LINEA + 'La dirección del presupuesto ya existe en la ' +
      'base de datos.';
    ShowMessage(sMsg);
    Exit;
  end;

  if sqlCarritoPresupuesto.FieldByName('id_municipio').AsString <> '' then
    sqlDireccionesInsert.ParamByName('municipio').AsString := ''
  else
    sqlDireccionesInsert.ParamByName('municipio').AsString :=
      sqlCarritoPresupuesto.FieldByName('ds_municipio').AsString;
  sqlDireccionesInsert.ExecSQL;
  sqlUltDir := dmRanning.ComandoSQL('select max(id_direccion) nUltDir from direcciones',
    csResultado);
  nUltDir := sqlUltDir.FieldByName('nUltDir').AsInteger;
  dmRanning.ComandoSQLFree(sqlUltDir);
  dmRanning.ComandoSQL('insert into clientes_direcciones (id_cliente,id_direccion)' +
    ' values (' + IntToStr(nIdCliente) + ',' + IntToStr(nUltDir) + ')',csEjecutar);
  dmRanning.TablaModificada('clientes_direcciones','id',dmRanning.UltimoID,raInsert);
  dmRanning.TablaModificada('direcciones','id_direccion',nUltDir,raInsert);
end;

function TdmPresupuestos.DatosDireccionCliente(nIdDireccion: Integer): string;

var
  sDir: string;
  sRestoDir: string;

begin
  if sqlDireccionCliente.Active then sqlDireccionCliente.Close;
  sqlDireccionCliente.ParamByName('id_direccion').AsInteger := nIdDireccion;
  sqlDireccionCliente.Open;
  sDir := '';
  if sqlDireccionCliente.RecordCount <> 0 then begin
    sRestoDir := sqlDireccionCliente.FieldByName('ds_resto_direccion').AsString;
    if sRestoDir <> '' then
      sRestoDir := ', ' + sRestoDir;

    sDir := UpperCaseFirst(sqlDireccionCliente.FieldByName('id_tipo_via').AsString) +
      ' ' + sqlDireccionCliente.FieldByName('ds_nombre_via').AsString +
      ' ' + sqlDireccionCliente.FieldByName('ds_numero').AsString + sRestoDir +
      SALTO_LINEA + sqlDireccionCliente.FieldByName('ds_cod_post').AsString + ' ' +
      sqlDireccionCliente.FieldByName('ds_muni').AsString + ' (' +
      sqlDireccionCliente.FieldByName('ds_provincia').AsString + ')';
  end;

  Result := sDir;
end;

procedure TdmPresupuestos.ClienteDeParte(nCodClienteAccess: Integer);

var
  sqlUltCli: TZReadOnlyQuery;
  nCli: Integer;

begin
  sqlUltCli := dmRanning.ComandoSQL('select id_cliente from clientes' +
    ' where cod_cliente_access = ' + IntToStr(nCodClienteAccess),csResultado);
  nCli := sqlUltCli.FieldByName('id_cliente').AsInteger;
  dmRanning.ComandoSQLFree(sqlUltCli);

  sqlCarritoPresupuesto.Edit;
  sqlCarritoPresupuesto.FieldByName('id_cliente').AsInteger := nCli;
  sqlCarritoPresupuesto.Post;
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set id_cliente = ' +
    IntToStr(nCli) + ' where id_cliente_web = ' +
    QuotedStr(sqlCarritoPresupuesto.FieldByName('id_cliente_web').AsString),
    csEjecutar);
end;

function TdmPresupuestos.DuplicaPresupuesto(nIdCarrito: Integer): Integer;

var
  sGUID: string;
  sIdClienteOrigen: string;
  sqlCarrito: TZReadOnlyQuery;
  nFecha: TDateTime;

begin
  sqlCarrito := dmRanning.ComandoSQL('select id_cliente_web from carrito where id = ' +
    IntToStr(nIdCarrito),csResultado);
  sIdClienteOrigen := sqlCarrito.FieldByName('id_cliente_web').AsString;
  sGUID := CreateIDClient;
  nFecha := Now;
  dmRanning.ComandoSQLFree(sqlCarrito);

  dmRanning.ComandoSQL('insert into carrito (id_cliente_web, ' +
    'f_fecha_compra, id_producto, cd_color, id_talla, nm_descuento, nm_pvp, ' +
    'nm_iva, it_devolucion, nm_cantidad) select ' + QuotedStr(sGUID) + ', ' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',nFecha)) + ', id_producto, ' +
    'cd_color, id_talla, nm_descuento, nm_pvp, nm_iva, it_devolucion, ' +
    'nm_cantidad from carrito where id_cliente_web = ' + QuotedStr(sIdClienteOrigen),
    csEjecutar);

  dmRanning.ComandoSQL('insert into carrito_presupuesto (id_cliente_web, id_cliente, f_fecha_compra, ' +
    'id_estado_pedido, nm_descuento_efectivo, nm_pvp, nm_gastos_envio, ds_email, ' +
    'ds_dni, ds_primer_apellido, ds_segundo_apellido, ds_nombre, it_canarias, ' +
    'ds_codigo_envio, id_provincia, id_municipio, ds_municipio, id_tipo_via, ' +
    'ds_nombre_via, ds_numero, ds_cp, ds_cp_extranjero, ds_telefono, ' +
    'id_agencia_transporte, id_forma_pago, ds_resto_direccion, ds_observaciones, ' +
    'id_tipo_sexo) select ' + QuotedStr(sGUID) +
    ', id_cliente, ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',nFecha)) +
    ', ' + IntToStr(ID_ESTADO_ENVIADO_RANNING) + ', nm_descuento_efectivo, ' +
    'nm_pvp, nm_gastos_envio, ds_email, ds_dni, ds_primer_apellido, ' +
    'ds_segundo_apellido, ds_nombre, it_canarias, ' + QuotedStr('') + ', id_provincia, ' +
    'id_municipio, ds_municipio, id_tipo_via, ds_nombre_via, ds_numero, ds_cp, ' +
    'ds_cp_extranjero, ds_telefono, id_agencia_transporte, id_forma_pago, ' +
    'ds_resto_direccion, ds_observaciones, id_tipo_sexo from carrito_presupuesto ' +
    'where id_cliente_web = ' + QuotedStr(sIdClienteOrigen), csEjecutar);

  Result := dmRanning.UltimoID;
end;

procedure TdmPresupuestos.PresupuestoRecogida(const sIdCliente: string);
begin
  dmRanning.ComandoSQL('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_RECOGIDA) + ' where id_cliente_web = ' +
    QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_RECOGIDA) + ' where id_cliente_web = ' +
    QuotedStr(sIdCliente),csEjecutar);
end;

function TdmPresupuestos.UnePresupuestos(nIdCarrito1,
  nIdCarrito2: Integer): Integer;

var
  nIdNuevo1: Integer;
  nIdNuevo2: Integer;
  sIdCliente1: string;
  sIdCliente2: string;
  sqlIdCliente: TZReadOnlyQuery;

begin
  nIdNuevo1 := DuplicaPresupuesto(nIdCarrito1);
  sqlIdCliente := dmRanning.ComandoSQL('select id_cliente_web from ' +
    'carrito where id = ' + IntToStr(nIdNuevo1),csResultado);
  sIdCliente1 := sqlIdCliente.FieldByName('id_cliente_web').AsString;
  dmRanning.ComandoSQLFree(sqlIdCliente);

  nIdNuevo2 := DuplicaPresupuesto(nIdCarrito2);
  sqlIdCliente := dmRanning.ComandoSQL('select id_cliente_web from ' +
    'carrito where id = ' + IntToStr(nIdNuevo2),csResultado);
  sIdCliente2 := sqlIdCliente.FieldByName('id_cliente_web').AsString;
  dmRanning.ComandoSQLFree(sqlIdCliente);

  dmRanning.ComandoSQL('update carrito set id_cliente_web = ' +
    QuotedStr(sIdCliente1) + ' where id_cliente_web = ' + QuotedStr(sIdCliente2),
    csEjecutar);
  dmRanning.ComandoSQL('delete from carrito_presupuesto where id_cliente_web = ' +
    QuotedStr(sIdCliente2),csEjecutar);
end;

procedure TdmPresupuestos.PresupuestoPagado(const sIdCliente: string);

var
  sFAcept: string;

begin
  sFAcept := FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);
  dmRanning.ComandoSQL('update carrito_presupuesto set f_fecha_aceptacion = ' +
    QuotedStr(sFAcept) + ', id_estado_pedido = ' + IntToStr(ID_ESTADO_PAGADO) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
  dmRanning.ComandoSQLWeb('update carrito_presupuesto set f_fecha_aceptacion = ' +
    QuotedStr(sFAcept) + ' , id_estado_pedido = ' +  IntToStr(ID_ESTADO_PAGADO) +
    ' , nm_pvp = ' + sqlCarritoPresupuesto.FieldByName('nm_pvp').AsString +
    ' , nm_gastos_envio = ' +
    sqlCarritoPresupuesto.FieldByName('nm_gastos_envio').AsString + ' , ds_email = ' +
    QuotedStr(sqlCarritoPresupuesto.FieldByName('ds_email').AsString) +
    ' where id_cliente_web = ' + QuotedStr(sIdCliente),csEjecutar);
end;

function TdmPresupuestos.CreateIDClient: string;
begin
  //Result := CreateGUID62;

  Result := FormatDateTime('yyyymmddhhnnsszzz',Now) + '000000000000';
end;

end.

