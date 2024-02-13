unit udmClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdmClientes = class(TDataModule)
    sqlClientes: TZQuery;
    dsClientes: TDataSource;
    sqlClientesInsert: TZReadOnlyQuery;
    sqlClientesUpdate: TZReadOnlyQuery;
    sqlClientesDelete: TZReadOnlyQuery;
    sqlTiposSexo: TZReadOnlyQuery;
    dsTiposSexo: TDataSource;
    sqlClubes: TZReadOnlyQuery;
    dsClubes: TDataSource;
    sqlTiposSexoid_tipo_sexo: TLargeintField;
    sqlTiposSexods_tipo_sexo: TStringField;
    sqlFacturas: TZQuery;
    dsFacturas: TDataSource;
    sqlFacturasid_factura: TLargeintField;
    sqlFacturasf_factura: TDateField;
    sqlFacturascd_factura: TStringField;
    sqlFacturasid_cliente: TLargeintField;
    sqlFacturasds_primer_apellido: TStringField;
    sqlFacturasds_segundo_apellido: TStringField;
    sqlFacturasds_nombre: TStringField;
    sqlFacturasds_dni: TStringField;
    sqlFacturasds_direccion: TStringField;
    sqlFacturasds_cliente: TStringField;
    sqlFacturasid_factura_anulada: TLargeintField;
    sqlFacturasid_factura_nueva: TLargeintField;
    sqlFacturasInsert: TZReadOnlyQuery;
    sqlFacturasUpdate: TZReadOnlyQuery;
    sqlImpresionFactura: TZReadOnlyQuery;
    sqlImpresionFacturaid_factura: TLargeintField;
    sqlImpresionFacturaf_factura: TDateField;
    sqlImpresionFacturacd_factura: TStringField;
    sqlImpresionFacturaid_cliente: TLargeintField;
    sqlImpresionFacturaid_factura_anulada: TLargeintField;
    sqlImpresionFacturaid_factura_nueva: TLargeintField;
    sqlImpresionFacturads_primer_apellido: TStringField;
    sqlImpresionFacturads_segundo_apellido: TStringField;
    sqlImpresionFacturads_nombre: TStringField;
    sqlImpresionFacturads_dni: TStringField;
    sqlImpresionFacturaid_direccion: TLargeintField;
    sqlImpresionFacturaid_factura_1: TLargeintField;
    sqlImpresionFacturaid_producto: TLargeintField;
    sqlImpresionFacturaid_color: TLargeintField;
    sqlImpresionFacturaid_talla: TLargeintField;
    sqlImpresionFacturanm_cantidad: TIntegerField;
    sqlImpresionFacturanm_precio_unitario: TFloatField;
    sqlImpresionFacturanm_precio_total: TFloatField;
    sqlImpresionFacturanm_descuento: TFloatField;
    sqlImpresionFacturanm_descuento_total: TFloatField;
    sqlImpresionFacturanm_precio_pagado: TFloatField;
    sqlImpresionFacturanm_iva: TFloatField;
    sqlImpresionFacturanm_iva_total: TFloatField;
    sqlImpresionFacturads_producto: TStringField;
    sqlImpresionFacturacolor: TStringField;
    sqlImpresionFacturads_talla: TStringField;
    sqlImpresionFacturanm_orden_talla: TLargeintField;
    sqlImpresionFacturads_direccion: TStringField;
    sqlImpresionFacturads_cliente: TStringField;
    dsImpresionFactura: TDataSource;
    sqlImpresionFacturacod_prod: TStringField;
    sqlFacturasnm_gastos_envio: TFloatField;
    sqlImpresionFacturanm_gastos_envio: TFloatField;
    sqlFacturasDetalle: TZQuery;
    dsFacturasDetalle: TDataSource;
    sqlFacturasDetalleid_factura: TLargeintField;
    sqlFacturasDetalleid_producto: TLargeintField;
    sqlFacturasDetalleid_color: TLargeintField;
    sqlFacturasDetalleid_talla: TLargeintField;
    sqlFacturasDetallenm_cantidad: TIntegerField;
    sqlFacturasDetallenm_precio_unitario: TFloatField;
    sqlFacturasDetallenm_precio_total: TFloatField;
    sqlFacturasDetallenm_descuento: TFloatField;
    sqlFacturasDetallenm_descuento_total: TFloatField;
    sqlFacturasDetallenm_precio_pagado: TFloatField;
    sqlFacturasDetallenm_iva: TFloatField;
    sqlFacturasDetallenm_iva_total: TFloatField;
    sqlFacturasDetalleds_marca: TStringField;
    sqlFacturasDetallecd_producto: TStringField;
    sqlFacturasDetalleds_producto: TStringField;
    sqlFacturasDetalleds_color: TStringField;
    sqlFacturasDetalleds_talla: TStringField;
    sqlFacturasDetallenm_orden_talla: TLargeintField;
    dsProvincias: TDataSource;
    dsMunicipios: TDataSource;
    sqlProvincias: TZReadOnlyQuery;
    sqlProvinciasid_autonomia: TStringField;
    sqlProvinciasid_provincia: TStringField;
    sqlProvinciasds_provincia: TStringField;
    sqlProvinciasds_matricula: TStringField;
    sqlMunicipios: TZReadOnlyQuery;
    sqlMunicipiosid_provincia: TStringField;
    sqlMunicipiosid_municipio: TStringField;
    sqlMunicipiosds_municipio: TStringField;
    sqlTiposVia: TZReadOnlyQuery;
    sqlTiposViaid_tipo_via: TStringField;
    sqlTiposViads_tipo_via: TStringField;
    dsTiposVia: TDataSource;
    sqlClientesAccess: TZReadOnlyQuery;
    dsClientesAccess: TDataSource;
    sqlClientesAccessid_cliente: TLargeintField;
    sqlClientesAccesscod_cliente: TSmallintField;
    sqlClientesAccessds_nombre_completo: TStringField;
    sqlClientesAccessds_nif: TStringField;
    sqlClientesAccessf_nacimiento: TDateField;
    sqlClientesAccessds_direccion_completa: TStringField;
    sqlClientesAccessds_cp: TStringField;
    sqlClientesAccessds_ciudad: TStringField;
    sqlClientesAccessds_telefono: TStringField;
    sqlClientesAccessnm_descuento_inicial: TFloatField;
    sqlClientesAccessds_email: TStringField;
    sqlClientesAccessnm_compras: TFloatField;
    sqlClientesAccessnm_compra_inicial: TFloatField;
    sqlClientesAccessnm_compra_total: TFloatField;
    sqlClientesAccessnm_descuento: TFloatField;
    sqlClientesid_cliente: TLargeintField;
    sqlClientescod_cliente_access: TIntegerField;
    sqlClientesds_primer_apellido: TStringField;
    sqlClientesds_segundo_apellido: TStringField;
    sqlClientesds_nombre: TStringField;
    sqlClientesds_dni: TStringField;
    sqlClientesid_tipo_sexo: TLargeintField;
    sqlClientesf_nacimiento: TDateField;
    sqlClientesid_club: TLargeintField;
    sqlClientesds_email: TStringField;
    sqlClientesds_telefono: TStringField;
    sqlClientesds_fax: TStringField;
    sqlClientesf_ultima_actualizacion: TDateTimeField;
    sqlClientesnm_compras_inicial: TFloatField;
    sqlClientesobservaciones: TMemoField;
    sqlClientesds_primer_apellido_esp: TStringField;
    sqlClientesds_segundo_apellido_esp: TStringField;
    sqlClientesds_nombre_esp: TStringField;
    sqlClientesds_tipo_sexo: TStringField;
    sqlClientesds_club: TStringField;
    sqlClientesnm_descuento: TFloatField;
    sqlDireccionesClientes: TZReadOnlyQuery;
    sqlDireccionesClientesid_direccion: TLargeintField;
    sqlDireccionesClientesid_provincia: TStringField;
    sqlDireccionesClientesid_municipio: TStringField;
    sqlDireccionesClientesds_municipio: TStringField;
    sqlDireccionesClientesid_tipo_via: TStringField;
    sqlDireccionesClientesds_nombre_via: TStringField;
    sqlDireccionesClientesds_numero: TStringField;
    sqlDireccionesClientesds_cp: TStringField;
    sqlDireccionesClientesds_cp_extranjero: TStringField;
    sqlDireccionesClientesds_resto_direccion: TStringField;
    sqlDireccionesClientesds_provincia: TStringField;
    sqlDireccionesClientesmunicipio: TStringField;
    sqlDireccionesClientesds_tipo_via: TStringField;
    dsDireccionesClientes: TDataSource;
    sqlClubesid_club: TLargeintField;
    sqlClubesid_tipo_club: TLargeintField;
    sqlClubesds_club: TStringField;
    sqlClubesid_direccion: TLargeintField;
    sqlClubesds_telefono: TStringField;
    sqlClubesds_fax: TStringField;
    sqlClubesid_descuento_club: TLargeintField;
    sqlClubesid_descuento_socios: TLargeintField;
    sqlClubesid_contacto: TLargeintField;
    sqlClientesds_nombre_completo: TStringField;
    sqlBusquedaClientes: TZReadOnlyQuery;
    sqlClientesds_nombre_completo_esp: TStringField;
    sqlCopiaDirAPresupuesto: TZReadOnlyQuery;
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
    procedure sqlClientesUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlClientesBeforeDelete(DataSet: TDataSet);
    procedure sqlClientesBeforePost(DataSet: TDataSet);
    procedure sqlClientesNewRecord(DataSet: TDataSet);
    procedure sqlFacturasBeforePost(DataSet: TDataSet);
    procedure sqlFacturasUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlFacturasNewRecord(DataSet: TDataSet);
    procedure sqlFacturasAfterPost(DataSet: TDataSet);
    procedure sqlClientesNombreEspChange(Sender: TField);
    procedure SincronizaClientesBusqueda(const sBusqueda: string);
  private
  public
    function IVAGastosEnvio: Extended;
    class function SiguienteFactura: string;
    class function VentaFacturada(nIdVenta: Integer): Boolean;
    class function ComprasTotalesCliente(nIdCliente: Integer): Extended;
    class function NombreCompletoCliente(nIdCliente: Integer): string;
    class function NombreCompletoClienteEsp(nIdCliente: Integer): string;
    procedure BusquedaClientesAccess(const sBusq: string);
    procedure CopiaDireccionAPresupuesto;
    function DatosCliente(lMostrarTelefono, lMostrarDNI,
      lMostrarEmail: Boolean): string;
  end;

var
  dmClientes: TdmClientes = nil;

implementation

uses udmRanning, ufrmDirecciones, uCommon, udmPresupuestos, uConst;

{$R *.DFM}

const
  // De clubes.id_club
  ID_CLUB_0 = 0;
  DS_CLUB_0 = 'Persona';
  NM_DESCUENTO_10 = 10;
  // De tipos_sexo.id_tipo_sexo
  ID_SEXO_HOMBRE = 1;

procedure TdmClientes.sqlClientesUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmClientes.sqlClientesBeforeDelete(DataSet: TDataSet);

var
  sCliente: string;

begin
  sCliente := SALTO_LINEA + 'Cliente: ' +
    DataSet.FieldByName('ds_nombre').AsString + ' ' +
    DataSet.FieldByName('ds_primer_apellido').AsString + ' ' +
    DataSet.FieldByName('ds_segundo_apellido').AsString;
  if MessageDlg('¿Estás seguro de borrar este registro?' + sCliente,mtWarning,[mbYes,mbNo],0) = mrYes then begin
      sqlClientesDelete.ExecSQL;
      dmRanning.TablaModificada('clientes','id_cliente',
        DataSet.FieldByName('id_cliente').AsInteger,raDelete);
  end
  else
    Abort;
end;

procedure TdmClientes.sqlClientesBeforePost(DataSet: TDataSet);
begin
  case DataSet.State of
    dsEdit: begin
      DataSet.FieldByName('f_ultima_actualizacion').AsDateTime := Now;
      sqlClientesUpdate.ExecSQL;
      dmRanning.TablaModificada('clientes','id_cliente',
        DataSet.FieldByName('id_cliente').AsInteger,raModify);
    end;
    dsInsert: begin
      sqlClientesInsert.ExecSQL;
      dmRanning.TablaModificada('clientes','id_cliente',dmRanning.UltimoID,
        raInsert);
    end;
  end;
end;

procedure TdmClientes.sqlClientesNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('nm_descuento').AsInteger := NM_DESCUENTO_10;
  DataSet.FieldByName('f_ultima_actualizacion').AsDateTime := Now;
  DataSet.FieldByName('id_tipo_sexo').AsInteger := ID_SEXO_HOMBRE;
  DataSet.FieldByName('nm_compras_inicial').AsFloat := 0;
end;

procedure TdmClientes.sqlFacturasBeforePost(DataSet: TDataSet);
begin
  case DataSet.State of
    dsEdit: sqlFacturasUpdate.ExecSQL;
    dsInsert: sqlFacturasInsert.ExecSQL;
  end;
end;

procedure TdmClientes.sqlFacturasUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmClientes.sqlFacturasNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('f_factura').AsDateTime := Date;
  DataSet.FieldByName('cd_factura').AsString := SiguienteFactura;
end;

class function TdmClientes.SiguienteFactura: string;

var
  sCdFactura: string;
  nAno: Word;
  nMes: Word;
  nDia: Word;

begin
  DecodeDate(Date,nAno,nMes,nDia);
  Result := '00001/' + IntToStr(nAno);
  sCdFactura :=
    dmRanning.ComandoSQL('select max(cd_factura) max_cd_factura from facturas',
    csResultado).FieldByName('max_cd_factura').AsString;

  if sCdFactura = '' then Exit;

  Result := PadLeft(IntToStr(StrToInt(Copy(sCdFactura,1,5)) + 1),'0',5) + '/' +
    IntToStr(nAno);
end;

function TdmClientes.IVAGastosEnvio: Extended;
begin
  Result := 16;
end;

procedure TdmClientes.sqlFacturasAfterPost(DataSet: TDataSet);
begin
  //dmRannning.TablaModificada('facturas',False);
end;

class function TdmClientes.ComprasTotalesCliente(nIdCliente: Integer): Extended;
begin
  Result := dmRanning.ComandoSQL('select sum(nm_precio_pagado) nm_total from ' +
    'ventas where id_cliente = ' + IntToStr(nIdCliente),
    csResultado).FieldByName('nm_total').AsFloat;
end;

class function TdmClientes.VentaFacturada(nIdVenta: Integer): Boolean;
begin
  Result := dmRanning.ComandoSQL('select count(id_venta) nm_ventas from facturas ' +
    'where id_venta = ' + IntToStr(nIdVenta),
    csResultado).FieldByName('nm_ventas').AsInteger <> 0;
end;

procedure TdmClientes.BusquedaClientesAccess(const sBusq: string);
begin
  sqlClientesAccess.DisableControls;
  try
    if sqlClientesAccess.Active then sqlClientesAccess.Close;
    if Trim(sBusq) <> '' then
      sqlClientesAccess.ParamByName('busqueda').AsString := sBusq
    else
      sqlClientesAccess.ParamByName('busqueda').AsString := '.*';
    sqlClientesAccess.Open;
  finally
    sqlClientesAccess.EnableControls;
  end;
end;

class function TdmClientes.NombreCompletoCliente(nIdCliente: Integer): string;

var
  sqlCliente: TZReadOnlyQuery;
  sCliente: string;

begin
  sqlCliente := dmRanning.ComandoSQL('select concat(trim(ds_nombre)," ",' +
    'trim(ds_primer_apellido)," ",trim(ds_segundo_apellido)) nombre from clientes ' +
    'where id_cliente = ' + IntToStr(nIdCliente),csResultado);
  sCliente := sqlCliente.FieldByName('nombre').AsString;
  dmRanning.ComandoSQLFree(sqlCliente);

  Result := sCliente;
end;

class function TdmClientes.NombreCompletoClienteEsp(nIdCliente: Integer): string;

var
  sqlCliente: TZReadOnlyQuery;
  sCliente: string;

begin
  sqlCliente := dmRanning.ComandoSQL('select concat(trim(ds_nombre_esp)," ",' +
    'trim(ds_primer_apellido_esp)," ",ifnull(trim(ds_segundo_apellido_esp),"")) nombre ' +
    'from clientes where id_cliente = ' + IntToStr(nIdCliente),csResultado);
  sCliente := sqlCliente.FieldByName('nombre').AsString;
  dmRanning.ComandoSQLFree(sqlCliente);

  Result := sCliente;
end;

procedure TdmClientes.sqlClientesNombreEspChange(Sender: TField);

var
  sCampo: string;

begin
  sCampo := Sender.FieldName;
  SetLength(sCampo,Length(sCampo) - Length('_esp'));
  Sender.DataSet.FieldByName(sCampo).AsString := SinAcentos(Sender.AsString); 
end;

procedure TdmClientes.SincronizaClientesBusqueda(const sBusqueda: string);
begin
  if sqlBusquedaClientes.Active then sqlBusquedaClientes.Close;
  sqlBusquedaClientes.ParamByName('ds_nombre').AsString := '%' + sBusqueda + '%';
  sqlBusquedaClientes.Open;
  sqlClientes.Locate('id_cliente',
    sqlBusquedaClientes.FieldByName('id_cliente').AsInteger,[]);
end;

procedure TdmClientes.CopiaDireccionAPresupuesto;
begin
  sqlCopiaDirAPresupuesto.ParamByName('id_cliente_web').AsString :=
    dmPresupuestos.sqlCarritoPresupuesto.FieldByName('id_cliente_web').AsString;

  sqlCopiaDirAPresupuesto.ExecSQL;
end;

function TdmClientes.DatosCliente(lMostrarTelefono, lMostrarDNI,
  lMostrarEmail: Boolean): string;

var
  sRestoDir: string;
  sNombre: string;
  sqlNombre: TZReadOnlyQuery;
  sTelefono: string;
  sDNI: string;
  sEmail: string;

begin
  sRestoDir := sqlDireccionesClientes.FieldByName('ds_resto_direccion').AsString;
  if sRestoDir <> '' then
    sRestoDir := ', ' + sRestoDir;

  sNombre := NombreCompletoClienteEsp(sqlClientes.FieldByName('id_cliente').AsInteger);
  if lMostrarTelefono then
    sTelefono := SALTO_LINEA + 'Teléfono: ' +
      sqlClientes.FieldByName('ds_telefono').AsString
  else
    sTelefono := '';
  if lMostrarDNI then
    sDNI := SALTO_LINEA + 'DNI: ' +
      sqlClientes.FieldByName('ds_dni').AsString
  else
    sDNI := '';
  if lMostrarEmail then
    sEmail := SALTO_LINEA + 'e-mail: ' +
      sqlClientes.FieldByName('ds_email').AsString
  else
    sEmail := '';

  Result :=
    sNombre + sDNI + SALTO_LINEA +
    UpperCaseFirst(sqlDireccionesClientes.FieldByName('id_tipo_via').AsString) +
    ' ' + sqlDireccionesClientes.FieldByName('ds_nombre_via').AsString +
    ' ' + sqlDireccionesClientes.FieldByName('ds_numero').AsString + sRestoDir +
    SALTO_LINEA + sqlDireccionesClientes.FieldByName('ds_cp').AsString + ' ' +
    sqlDireccionesClientes.FieldByName('municipio').AsString + ' (' +
    sqlDireccionesClientes.FieldByName('ds_provincia').AsString + ')' + sTelefono +
    sEmail;
end;

end.
