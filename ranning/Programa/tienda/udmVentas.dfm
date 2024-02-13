object dmVentas: TdmVentas
  OldCreateOrder = False
  Left = 255
  Top = 162
  Height = 480
  Width = 696
  object dsVentas: TDataSource
    DataSet = sqlVentas
    Left = 97
    Top = 23
  end
  object sqlVentas: TZQuery
    Connection = dmRanning.dbRanning
    OnCalcFields = sqlVentasCalcFields
    CachedUpdates = True
    OnUpdateRecord = sqlVentasUpdateRecord
    BeforePost = sqlVentasBeforePost
    OnNewRecord = sqlVentasNewRecord
    SQL.Strings = (
      'select'
      '  v.*,'
      '  c.ds_primer_apellido,'
      '  c.ds_segundo_apellido,'
      '  c.ds_nombre,'
      '  d.nm_descuento nm_descuento_cliente,'
      '  ve.ds_vendedor,'
      '  fp.ds_forma_pago,'
      '  fp.nm_comision'
      'from'
      '  ventas v,'
      '  clientes c,'
      '  vendedores ve,'
      '  formas_pago fp,'
      '  descuentos d'
      'where'
      '  (v.id_cliente = c.id_cliente) and'
      '  (v.id_vendedor = ve.id_vendedor) and'
      '  (v.id_forma_pago = fp.id_forma_pago) and'
      '  (c.id_descuento = d.id_descuento)'
      'order by'
      '  v.f_venta'
      'for update'
      ' '
      ' ')
    Params = <>
    Left = 23
    Top = 20
    object sqlVentasid_venta: TLargeintField
      FieldName = 'id_venta'
    end
    object sqlVentasid_cliente: TLargeintField
      FieldName = 'id_cliente'
      Required = True
    end
    object sqlVentasf_venta: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'f_venta'
      Required = True
    end
    object sqlVentasf_pago: TDateField
      DisplayLabel = 'Fecha pago'
      FieldName = 'f_pago'
    end
    object sqlVentasid_vendedor: TLargeintField
      FieldName = 'id_vendedor'
      Required = True
    end
    object sqlVentasnm_descuento_total: TFloatField
      DisplayLabel = 'Descuento tot'
      FieldName = 'nm_descuento_total'
    end
    object sqlVentasid_forma_pago: TLargeintField
      FieldName = 'id_forma_pago'
      Required = True
    end
    object sqlVentasnm_precio_pagado: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'nm_precio_pagado'
    end
    object sqlVentasnm_iva_pagado: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'nm_iva_pagado'
    end
    object sqlVentasnm_comision_pago: TFloatField
      DisplayLabel = '% Comisión'
      FieldName = 'nm_comision_pago'
    end
    object sqlVentasnm_gastos_envio: TFloatField
      DisplayLabel = 'Gastos envío'
      FieldName = 'nm_gastos_envio'
    end
    object sqlVentasobservaciones: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object sqlVentasds_primer_apellido: TStringField
      DisplayLabel = 'Primer apellido'
      FieldName = 'ds_primer_apellido'
      Size = 30
    end
    object sqlVentasds_segundo_apellido: TStringField
      DisplayLabel = 'Segundo apellido'
      FieldName = 'ds_segundo_apellido'
      Size = 30
    end
    object sqlVentasds_nombre: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'ds_nombre'
      Size = 30
    end
    object sqlVentasds_vendedor: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'ds_vendedor'
      Size = 30
    end
    object sqlVentasds_forma_pago: TStringField
      DisplayLabel = 'Forma pago'
      FieldName = 'ds_forma_pago'
      Size = 30
    end
    object sqlVentasds_cliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkCalculated
      FieldName = 'ds_cliente'
      Size = 90
      Calculated = True
    end
    object sqlVentasnm_descuento_cliente: TFloatField
      DisplayLabel = 'Descuento cliente'
      FieldName = 'nm_descuento_cliente'
    end
    object sqlVentasit_terminada: TStringField
      DisplayLabel = 'Venta terminada'
      FieldName = 'it_terminada'
      Required = True
      Size = 1
    end
    object sqlVentasnm_comision_total: TFloatField
      DisplayLabel = 'Comisión'
      FieldName = 'nm_comision_total'
    end
    object sqlVentasnm_iva_gastos_envio: TFloatField
      DisplayLabel = 'IVA envío'
      FieldName = 'nm_iva_gastos_envio'
    end
    object sqlVentasnm_iva_gastos_envio_total: TFloatField
      FieldName = 'nm_iva_gastos_envio_total'
    end
    object sqlVentasds_codigo_envio: TStringField
      DisplayLabel = 'Código de envío'
      FieldName = 'ds_codigo_envio'
    end
    object sqlVentasit_devolucion: TStringField
      DisplayLabel = 'Devolución'
      FieldName = 'it_devolucion'
      Required = True
      Size = 1
    end
    object sqlVentasnm_comision: TFloatField
      FieldName = 'nm_comision'
      Required = True
    end
  end
  object sqlVendedores: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from vendedores order by ds_vendedor')
    Params = <>
    Left = 37
    Top = 154
    object sqlVendedoresid_vendedor: TLargeintField
      FieldName = 'id_vendedor'
    end
    object sqlVendedoresds_vendedor: TStringField
      FieldName = 'ds_vendedor'
      Required = True
      Size = 30
    end
  end
  object dsVendedores: TDataSource
    DataSet = sqlVendedores
    Left = 111
    Top = 152
  end
  object sqlFormasPago: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from formas_pago order by ds_forma_pago')
    Params = <>
    Left = 39
    Top = 218
    object sqlFormasPagoid_forma_pago: TLargeintField
      FieldName = 'id_forma_pago'
    end
    object sqlFormasPagonm_comision: TFloatField
      FieldName = 'nm_comision'
      Required = True
    end
    object sqlFormasPagods_forma_pago: TStringField
      FieldName = 'ds_forma_pago'
      Required = True
      Size = 30
    end
  end
  object dsFormasPago: TDataSource
    DataSet = sqlFormasPago
    Left = 113
    Top = 216
  end
  object sqlTotales: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  sum(nm_descuento_total) nm_de_to,'
      '  sum(nm_precio_pagado) nm_pr_pa,'
      '  sum(nm_iva_total) nm_iv_pa'
      'from'
      '  ventas_detalle'
      'where'
      '  id_venta = :id_venta'
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end>
    DataSource = dsVentas
    Left = 172
    Top = 22
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end>
    object sqlTotalesnm_de_to: TFloatField
      FieldName = 'nm_de_to'
    end
    object sqlTotalesnm_pr_pa: TFloatField
      FieldName = 'nm_pr_pa'
    end
    object sqlTotalesnm_iv_pa: TFloatField
      FieldName = 'nm_iv_pa'
    end
  end
  object sqlVentasInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into ventas'
      '  (id_cliente,'
      '  f_venta,'
      '  f_pago,'
      '  id_vendedor,'
      '  nm_descuento_total,'
      '  id_forma_pago,'
      '  nm_precio_pagado,'
      '  nm_iva_pagado,'
      '  nm_comision_pago,'
      '  nm_gastos_envio,'
      '  id_devolucion,'
      '  observaciones,'
      '  it_terminada)'
      'values'
      '  (:id_cliente,'
      '  :f_venta,'
      '  :f_pago,'
      '  :id_vendedor,'
      '  :nm_descuento_total,'
      '  :id_forma_pago,'
      '  :nm_precio_pagado,'
      '  :nm_iva_pagado,'
      '  :nm_comision_pago,'
      '  :nm_gastos_envio,'
      '  :id_devolucion,'
      '  :observaciones,'
      '  :it_terminada)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_comision_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_devolucion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_terminada'
        ParamType = ptUnknown
      end>
    DataSource = dsVentas
    Left = 37
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_comision_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_devolucion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_terminada'
        ParamType = ptUnknown
      end>
  end
  object sqlVentasUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update ventas set'
      '  id_cliente = :id_cliente,'
      '  f_venta = :f_venta,'
      '  f_pago = :f_pago,'
      '  id_vendedor = :id_vendedor,'
      '  nm_descuento_total = :nm_descuento_total,'
      '  id_forma_pago = :id_forma_pago,'
      '  nm_precio_pagado = :nm_precio_pagado,'
      '  nm_iva_pagado = :nm_iva_pagado,'
      '  nm_comision_pago = :nm_comision_pago,'
      '  nm_gastos_envio = :nm_gastos_envio,'
      '  id_devolucion = :id_devolucion,'
      '  observaciones = :observaciones,'
      '  it_terminada = :it_terminada'
      'where'
      '  id_venta = :id_venta'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_comision_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_devolucion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_terminada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end>
    DataSource = dsVentas
    Left = 135
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_comision_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_devolucion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_terminada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end>
  end
  object dsVentasDetalle: TDataSource
    DataSet = sqlVentasDetalle
    Left = 389
    Top = 92
  end
  object sqlVentasDetalle: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    OnUpdateRecord = sqlVentasDetalleUpdateRecord
    BeforePost = sqlVentasDetalleBeforePost
    AfterPost = sqlVentasDetalleAfterPost
    BeforeDelete = sqlVentasDetalleBeforeDelete
    AfterDelete = sqlVentasDetalleAfterDelete
    OnNewRecord = sqlVentasDetalleNewRecord
    SQL.Strings = (
      'select distinct'
      '  vd.*,'
      '  m.ds_marca,'
      '  p.cd_producto,'
      '  p.ds_producto,'
      '  c.ds_color,'
      '  t.ds_talla,'
      '  t.nm_orden nm_orden_talla'
      'from'
      '  ventas_detalle vd,'
      '  marcas m,'
      '  productos p,'
      '  colores c,'
      '  tallas t'
      'where'
      '  (vd.id_venta = :id_venta) and'
      '  (vd.id_producto = p.id_producto) and'
      '  (p.id_marca = m.id_marca) and'
      '  (vd.id_color = c.id_color) and'
      '  vd.id_talla = t.id_talla)'
      'order by'
      '  m.ds_marca,'
      '  p.cd_producto,'
      '  c.ds_color,'
      '  nm_orden_talla'
      'for update'
      ' '
      ' '
      ' '
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end>
    DataSource = dsVentas
    Left = 285
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end>
    object sqlVentasDetalleid_venta: TLargeintField
      FieldName = 'id_venta'
      Required = True
    end
    object sqlVentasDetalleid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlVentasDetalleid_color: TLargeintField
      FieldName = 'id_color'
      Required = True
    end
    object sqlVentasDetalleid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlVentasDetallenm_cantidad: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'nm_cantidad'
      Required = True
    end
    object sqlVentasDetallenm_precio_unitario: TFloatField
      DisplayLabel = 'PVP c/u'
      FieldName = 'nm_precio_unitario'
      Required = True
    end
    object sqlVentasDetallenm_precio_total: TFloatField
      DisplayLabel = 'PVP'
      FieldName = 'nm_precio_total'
    end
    object sqlVentasDetallenm_descuento: TFloatField
      DisplayLabel = '% Descuento'
      FieldName = 'nm_descuento'
      Required = True
    end
    object sqlVentasDetallenm_descuento_total: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'nm_descuento_total'
    end
    object sqlVentasDetallenm_precio_pagado: TFloatField
      DisplayLabel = 'A pagar'
      FieldName = 'nm_precio_pagado'
    end
    object sqlVentasDetallenm_iva: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlVentasDetallenm_iva_total: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'nm_iva_total'
    end
    object sqlVentasDetalleds_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'ds_marca'
      Size = 50
    end
    object sqlVentasDetallecd_producto: TStringField
      DisplayLabel = 'Código'
      FieldName = 'cd_producto'
    end
    object sqlVentasDetalleds_producto: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'ds_producto'
      Size = 100
    end
    object sqlVentasDetalleds_color: TStringField
      DisplayLabel = 'Color'
      FieldName = 'ds_color'
      Size = 50
    end
    object sqlVentasDetalleds_talla: TStringField
      DisplayLabel = 'Talla'
      FieldName = 'ds_talla'
    end
    object sqlVentasDetallenm_orden_talla: TLargeintField
      FieldName = 'nm_orden_talla'
    end
  end
  object sqlVentasDetalleInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into ventas_detalle'
      '  (id_venta,'
      '  id_producto,'
      '  id_color,'
      '  id_talla,'
      '  nm_cantidad,'
      '  nm_precio_unitario,'
      '  nm_precio_total,'
      '  nm_descuento,'
      '  nm_descuento_total,'
      '  nm_precio_pagado,'
      '  nm_iva,'
      '  nm_iva_total)'
      'values'
      '  (:id_venta,'
      '  :id_producto,'
      '  :id_color,'
      '  :id_talla,'
      '  :nm_cantidad,'
      '  :nm_precio_unitario,'
      '  :nm_cantidad * :nm_precio_unitario,'
      '  :nm_descuento,'
      '  :nm_cantidad * :nm_precio_unitario * :nm_descuento / 100,'
      
        '  :nm_cantidad * :nm_precio_unitario * (1 - :nm_descuento / 100)' +
        ','
      '  :nm_iva,'
      
        '  :nm_cantidad * :nm_precio_unitario * (1 - :nm_descuento / 100)' +
        ' * (1 - 1 / (1 + :nm_iva / 100)))'
      ''
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_unitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end>
    DataSource = dsVentasDetalle
    Left = 281
    Top = 154
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_unitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end>
  end
  object sqlVentasDetalleUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update ventas_detalle set'
      '  id_venta = :id_venta,'
      '  id_producto = :id_producto,'
      '  id_color = :id_color,'
      '  id_talla = :id_talla,'
      '  nm_cantidad = :nm_cantidad,'
      '  nm_precio_unitario = :nm_precio_unitario,'
      '  nm_precio_total = :nm_cantidad * :nm_precio_unitario,'
      '  nm_descuento = :nm_descuento,'
      
        '  nm_descuento_total = :nm_cantidad * :nm_precio_unitario * :nm_' +
        'descuento / 100,'
      
        '  nm_precio_pagado = :nm_cantidad * :nm_precio_unitario * (1 - :' +
        'nm_descuento / 100),'
      '  nm_iva = :nm_iva,'
      
        '  nm_iva_total = :nm_cantidad * :nm_precio_unitario * (1 - :nm_d' +
        'escuento / 100) * (1 - 1 / (1 + :nm_iva / 100))'
      'where'
      '  (id_venta = :id_venta) and'
      '  (id_producto = :id_producto) and'
      '  (id_color = :id_color) and'
      '  (id_talla = :id_talla)'
      ''
      ' '
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_unitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end>
    DataSource = dsVentasDetalle
    Left = 400
    Top = 155
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_unitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end>
  end
  object sqlVentasDetalleDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from ventas_detalle'
      'where'
      '  (id_venta = :id_venta) and'
      '  (id_producto = :id_producto) and'
      '  (id_color = :id_color) and'
      '  (id_talla = :id_talla)'
      ''
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end>
    DataSource = dsVentasDetalle
    Left = 382
    Top = 203
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end>
  end
  object sqlProducto: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  s.nm_iva,'
      '  s.nm_pvp,'
      '  d.nm_descuento'
      'from'
      '  stock s,'
      '  descuentos d'
      'where'
      '  (id_producto = :id_producto) and'
      '  (cd_color = :cd_color) and'
      '  (id_talla = :id_talla) and'
      '  (s.id_descuento_oferta = d.id_descuento)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_color'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end>
    Left = 223
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cd_color'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end>
    object sqlProductonm_iva: TFloatField
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlProductonm_pvp: TFloatField
      FieldName = 'nm_pvp'
      Required = True
    end
    object sqlProductonm_descuento: TFloatField
      FieldName = 'nm_descuento'
      Required = True
    end
  end
  object sqlFacturar: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into facturas'
      '  (id_venta,'
      '  f_factura,'
      '  cd_factura,'
      '  id_cliente,'
      '  nm_gastos_envio,'
      '  id_factura_anulada,'
      '  id_factura_nueva)'
      'values'
      '  (:id_venta,'
      '  :f_pago,'
      '  :cd_factura,'
      '  :id_cliente,'
      '  :nm_gastos_envio,'
      '  0,'
      '  0)'
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end>
    DataSource = dsVentas
    Left = 279
    Top = 18
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_venta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end>
  end
  object sqlFacturarDetalle: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into facturas_detalle'
      '  (id_factura,'
      '  id_producto,'
      '  id_color,'
      '  id_talla,'
      '  nm_cantidad,'
      '  nm_precio_unitario,'
      '  nm_precio_total,'
      '  nm_descuento,'
      '  nm_descuento_total,'
      '  nm_precio_pagado,'
      '  nm_iva,'
      '  nm_iva_total)'
      'values'
      '  (:id_factura,'
      '  :id_producto,'
      '  :id_color,'
      '  :id_talla,'
      '  :nm_cantidad,'
      '  :nm_precio_unitario,'
      '  :nm_precio_total,'
      '  :nm_descuento,'
      '  :nm_descuento_total,'
      '  :nm_precio_pagado,'
      '  :nm_iva,'
      '  :nm_iva_total)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_unitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva_total'
        ParamType = ptUnknown
      end>
    DataSource = dsVentasDetalle
    Left = 372
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_unitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio_pagado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva_total'
        ParamType = ptUnknown
      end>
  end
end
