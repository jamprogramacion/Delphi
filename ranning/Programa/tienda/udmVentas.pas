unit udmVentas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdmVentas = class(TDataModule)
    dsVentas: TDataSource;
    sqlVentas: TZQuery;
    sqlVentasid_venta: TLargeintField;
    sqlVentasid_cliente: TLargeintField;
    sqlVentasf_venta: TDateTimeField;
    sqlVentasf_pago: TDateField;
    sqlVentasid_vendedor: TLargeintField;
    sqlVentasnm_descuento_total: TFloatField;
    sqlVentasid_forma_pago: TLargeintField;
    sqlVentasnm_precio_pagado: TFloatField;
    sqlVentasnm_iva_pagado: TFloatField;
    sqlVentasnm_comision_pago: TFloatField;
    sqlVentasnm_gastos_envio: TFloatField;
    sqlVentasobservaciones: TMemoField;
    sqlVentasds_primer_apellido: TStringField;
    sqlVentasds_segundo_apellido: TStringField;
    sqlVentasds_nombre: TStringField;
    sqlVentasds_vendedor: TStringField;
    sqlVentasds_forma_pago: TStringField;
    sqlVentasds_cliente: TStringField;
    sqlVendedores: TZReadOnlyQuery;
    sqlVendedoresid_vendedor: TLargeintField;
    sqlVendedoresds_vendedor: TStringField;
    dsVendedores: TDataSource;
    sqlFormasPago: TZReadOnlyQuery;
    dsFormasPago: TDataSource;
    sqlFormasPagoid_forma_pago: TLargeintField;
    sqlFormasPagonm_comision: TFloatField;
    sqlFormasPagods_forma_pago: TStringField;
    sqlTotales: TZReadOnlyQuery;
    sqlTotalesnm_de_to: TFloatField;
    sqlTotalesnm_pr_pa: TFloatField;
    sqlTotalesnm_iv_pa: TFloatField;
    sqlVentasInsert: TZReadOnlyQuery;
    sqlVentasUpdate: TZReadOnlyQuery;
    dsVentasDetalle: TDataSource;
    sqlVentasDetalle: TZQuery;
    sqlVentasDetalleid_venta: TLargeintField;
    sqlVentasDetalleid_producto: TLargeintField;
    sqlVentasDetalleid_color: TLargeintField;
    sqlVentasDetalleid_talla: TLargeintField;
    sqlVentasDetallenm_cantidad: TIntegerField;
    sqlVentasDetallenm_precio_unitario: TFloatField;
    sqlVentasDetallenm_precio_total: TFloatField;
    sqlVentasDetallenm_descuento: TFloatField;
    sqlVentasDetallenm_descuento_total: TFloatField;
    sqlVentasDetallenm_precio_pagado: TFloatField;
    sqlVentasDetallenm_iva: TFloatField;
    sqlVentasDetallenm_iva_total: TFloatField;
    sqlVentasDetalleds_marca: TStringField;
    sqlVentasDetallecd_producto: TStringField;
    sqlVentasDetalleds_producto: TStringField;
    sqlVentasDetalleds_color: TStringField;
    sqlVentasDetalleds_talla: TStringField;
    sqlVentasDetallenm_orden_talla: TLargeintField;
    sqlVentasnm_descuento_cliente: TFloatField;
    sqlVentasDetalleInsert: TZReadOnlyQuery;
    sqlVentasDetalleUpdate: TZReadOnlyQuery;
    sqlVentasDetalleDelete: TZReadOnlyQuery;
    sqlVentasit_terminada: TStringField;
    sqlProducto: TZReadOnlyQuery;
    sqlProductonm_iva: TFloatField;
    sqlProductonm_pvp: TFloatField;
    sqlProductonm_descuento: TFloatField;
    sqlFacturar: TZReadOnlyQuery;
    sqlFacturarDetalle: TZReadOnlyQuery;
    sqlVentasnm_comision_total: TFloatField;
    sqlVentasnm_iva_gastos_envio: TFloatField;
    sqlVentasnm_iva_gastos_envio_total: TFloatField;
    sqlVentasds_codigo_envio: TStringField;
    sqlVentasit_devolucion: TStringField;
    sqlVentasnm_comision: TFloatField;
    procedure sqlVentasCalcFields(DataSet: TDataSet);
    procedure sqlVentasUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlVentasBeforePost(DataSet: TDataSet);
    procedure sqlVentasDetalleUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlVentasDetalleBeforePost(DataSet: TDataSet);
    procedure sqlVentasDetalleBeforeDelete(DataSet: TDataSet);
    procedure sqlVentasNewRecord(DataSet: TDataSet);
    procedure sqlVentasDetalleNewRecord(DataSet: TDataSet);
    procedure sqlVentasDetalleAfterDelete(DataSet: TDataSet);
    procedure sqlVentasDetalleAfterPost(DataSet: TDataSet);
  private
    procedure ActualizaTotales;
    procedure ActualizaDevolucion;
  public
    procedure InsertaProducto(nIdProducto, nIdTalla: Integer;
      const sCdColor: string);
    function ComisionPago(nIdFormaPago: Integer): Extended;
    procedure FacturarVenta(nIdVenta: Integer; const sCdFactura: string);
    procedure ActualizaPrecios;
    procedure ActualizaVentaTerminada;
    procedure ActualizaGastosEnvio;
  end;

var
  dmVentas: TdmVentas = nil;

implementation

uses udmRanning;

{$R *.DFM}

procedure TdmVentas.ActualizaTotales;
begin
  if not sqlTotales.Active then sqlTotales.Open;
  if not (sqlVentas.State in dsEditModes) then sqlVentas.Edit;
  sqlVentas.FieldByName('nm_descuento_total').AsFloat :=
    sqlTotales.FieldByName('nm_de_to').AsFloat;
  sqlVentas.FieldByName('nm_precio_pagado').AsFloat :=
    sqlTotales.FieldByName('nm_pr_pa').AsFloat;
  sqlVentas.FieldByName('nm_iva_pagado').AsFloat :=
    sqlTotales.FieldByName('nm_iv_pa').AsFloat;
  sqlVentas.FieldByName('nm_comision_pago').AsFloat :=
    sqlVentas.FieldByName('nm_precio_pagado').AsFloat *
    sqlVentas.FieldByName('nm_comision').AsFloat / 100;
  sqlVentas.Post;
end;

procedure TdmVentas.sqlVentasCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ds_cliente').AsString :=
    Trim(DataSet.FieldByName('ds_nombre').AsString) + ' ' +
    Trim(DataSet.FieldByName('ds_primer_apellido').AsString) + ' ' +
    Trim(DataSet.FieldByName('ds_segundo_apellido').AsString);
end;

procedure TdmVentas.sqlVentasUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmVentas.sqlVentasBeforePost(DataSet: TDataSet);
begin
  case DataSet.State of
    dsEdit: sqlVentasUpdate.ExecSQL;
    dsInsert: sqlVentasInsert.ExecSQL;
  end;
end;

procedure TdmVentas.sqlVentasDetalleUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmVentas.sqlVentasDetalleBeforePost(DataSet: TDataSet);
begin
  case DataSet.State of
    dsEdit: sqlVentasDetalleUpdate.ExecSQL;
    dsInsert: sqlVentasDetalleInsert.ExecSQL;
  end;
  ActualizaTotales;
end;

procedure TdmVentas.sqlVentasDetalleBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('¿Estás seguro de borrar este artículo?',mtWarning,[mbYes,mbNo],0) = mrYes then
    sqlVentasDetalleDelete.ExecSQL
  else
    Abort;
  ActualizaTotales;
end;

procedure TdmVentas.sqlVentasNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('f_venta').AsDateTime := Now;
  DataSet.FieldByName('it_terminada').AsString := CAMPO_NO_MARCADO;
  DataSet.FieldByName('it_devolucion').AsString := CAMPO_NO_MARCADO;
  DataSet.FieldByName('it_devolucion').AsString := CAMPO_NO_MARCADO;
  DataSet.FieldByName('id_cliente').AsInteger := 0;
  DataSet.FieldByName('nm_gastos_envio').AsFloat := 0;
  DataSet.FieldByName('nm_iva_gastos_envio').AsFloat := 0;
  DataSet.FieldByName('nm_iva_gastos_envio_total').AsFloat := 0;
end;

procedure TdmVentas.sqlVentasDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_venta').AsInteger :=
    sqlVentas.FieldByName('id_venta').AsInteger;
  DataSet.FieldByName('nm_cantidad').AsInteger := 1;
  if sqlVentas.FieldByName('id_cliente').AsInteger <> 0 then
    DataSet.FieldByName('nm_descuento').AsFloat :=
      sqlVentas.FieldByName('nm_descuento_cliente').AsFloat
  else
    DataSet.FieldByName('nm_descuento').AsFloat := 0;
end;

procedure TdmVentas.InsertaProducto(nIdProducto, nIdTalla: Integer;
  const sCdColor: string);

var
  rDescCliente: Extended;

begin
  if sqlProducto.Active then sqlProducto.Close;
  sqlProducto.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlProducto.ParamByName('cd_color').AsString := sCdColor;
  sqlProducto.ParamByName('id_talla').AsInteger := nIdTalla;
  sqlProducto.Open;

  sqlVentasDetalle.Insert;
  sqlVentasDetalle.FieldByName('id_producto').AsInteger := nIdProducto;
  sqlVentasDetalle.FieldByName('id_color').AsString := sCdColor;
  sqlVentasDetalle.FieldByName('id_talla').AsInteger := nIdTalla;
  sqlVentasDetalle.FieldByName('nm_precio_unitario').AsFloat :=
    sqlProducto.FieldByName('nm_pvp').AsFloat;
  rDescCliente := sqlVentas.FieldByName('nm_descuento_cliente').AsFloat;
  if rDescCliente < sqlProducto.FieldByName('nm_descuento').AsFloat then
    sqlVentasDetalle.FieldByName('nm_descuento').AsFloat :=
     sqlProducto.FieldByName('nm_descuento').AsFloat;
  sqlVentasDetalle.FieldByName('nm_iva').AsFloat :=
    sqlProducto.FieldByName('nm_iva').AsFloat;
  sqlVentasDetalle.Post;
end;

function TdmVentas.ComisionPago(nIdFormaPago: Integer): Extended;
begin
  Result := dmRanning.ComandoSQL('select nm_comision from formas_pago where ' +
    'id_forma_pago = ' + IntToStr(nIdFormaPago),
    csResultado).FieldByName('nm_comision').AsFloat;
end;

procedure TdmVentas.FacturarVenta(nIdVenta: Integer; const sCdFactura: string);
begin
  sqlFacturar.ParamByName('cd_factura').AsString := sCdFactura;
  sqlFacturar.ExecSQL;
  sqlFacturarDetalle.ParamByName('id_factura').AsInteger :=
    dmRanning.ComandoSQL('select max(id_factura) nm_factura from ' +
    'facturas',csResultado).FieldByName('nm_factura').AsInteger;
  sqlVentasDetalle.DisableControls;
  try
    sqlVentasDetalle.First;
    while not sqlVentasDetalle.Eof do begin
      sqlFacturarDetalle.ExecSQL;
      sqlVentasDetalle.Next;
    end;
  finally
    sqlVentasDetalle.EnableControls;
  end;
end;

procedure TdmVentas.ActualizaPrecios;
begin
  if not (sqlVentasDetalle.State in dsEditModes) then Exit;

  sqlVentasDetalle.FieldByName('nm_precio_total').AsFloat :=
    sqlVentasDetalle.FieldByName('nm_cantidad').AsFloat *
    sqlVentasDetalle.FieldByName('nm_precio_unitario').AsFloat;
  sqlVentasDetalle.FieldByName('nm_precio_pagado').AsFloat :=
    sqlVentasDetalle.FieldByName('nm_precio_total').AsFloat *
    (1 - sqlVentasDetalle.FieldByName('nm_descuento').AsFloat / 100);
end;

procedure TdmVentas.ActualizaVentaTerminada;
begin
  sqlVentas.Edit;
  if sqlVentas.FieldByName('f_pago').IsNull then
    sqlVentas.FieldByName('it_terminada').AsString := CAMPO_NO_MARCADO
  else
    sqlVentas.FieldByName('it_terminada').AsString := CAMPO_MARCADO;
end;

procedure TdmVentas.ActualizaGastosEnvio;

var
  rGastos: Extended;

begin
  rGastos := sqlVentas.FieldByName('nm_gastos_envio').AsFloat;
  if (not (sqlVentas.State in dsEditModes)) or (rGastos = 0) then Exit;

  sqlVentas.FieldByName('nm_iva_gastos_envio_total').AsFloat :=
    (rGastos * sqlVentas.FieldByName('nm_iva_gastos_envio').AsFloat / 100) /
    (1 + sqlVentas.FieldByName('nm_iva_gastos_envio').AsFloat / 100);
end;

procedure TdmVentas.sqlVentasDetalleAfterDelete(DataSet: TDataSet);
begin
  ActualizaDevolucion;
end;

procedure TdmVentas.sqlVentasDetalleAfterPost(DataSet: TDataSet);
begin
  ActualizaDevolucion;
end;

procedure TdmVentas.ActualizaDevolucion;

var
  sqlDev: TZReadOnlyQuery;
  sDev: string;

begin
  sqlDev := dmRanning.ComandoSQL('select count(id_venta) nm_dev from ' +
    'ventas_detalle where (id_venta = ' +
    sqlVentas.FieldByName('id_venta').AsString + ') and (nm_cantidad < 0)',
    csResultado);
  if sqlDev.FieldByName('nm_dev').AsInteger = 0 then
    sDev := CAMPO_NO_MARCADO
  else
    sDev := CAMPO_MARCADO;
  dmRanning.ComandoSQL('update ventas set it_devolucion = ' + QuotedStr(sDev) +
    ' where id_venta = ' + sqlVentas.FieldByName('id_venta').AsString,csEjecutar);
end;

end.
