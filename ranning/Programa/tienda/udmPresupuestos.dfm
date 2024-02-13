object dmPresupuestos: TdmPresupuestos
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 208
  Top = 159
  Height = 553
  Width = 749
  object sqlCarritoPresupuesto: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    OnUpdateRecord = sqlCarritoPresupuestoUpdateRecord
    BeforePost = sqlCarritoPresupuestoBeforePost
    SQL.Strings = (
      'select distinct'
      '  c.*,'
      '  if(c.ds_cp <> '#39#39',c.ds_cp,c.ds_cp_extranjero) ds_cod_post,'
      '  e.nm_orden,'
      '  e.ds_estado_pedido,'
      
        '  concat(trim(c.ds_nombre),'#39' '#39',trim(c.ds_primer_apellido),'#39' '#39',tr' +
        'im(c.ds_segundo_apellido)) ds_nombre_completo,'
      '  p.ds_provincia,'
      
        '  concat(c.id_tipo_via,'#39' '#39',c.ds_nombre_via,'#39' '#39',c.ds_numero,'#39', '#39',' +
        'c.ds_resto_direccion) ds_direcli,'
      
        '  concat(c.ds_municipio,if(p.ds_provincia is not null,concat('#39' (' +
        #39',p.ds_provincia,'#39')'#39'),'#39#39')) ds_ciudad,'
      '  a.ds_agencia_transporte,'
      '  a.nm_comision_reembolso,'
      '  a.nm_fijo_reembolso,'
      '  a.nm_minimo_comision,'
      '  fp.ds_forma_pago,'
      '  cl.cod_cliente_access,'
      '  concat(c.id_tipo_via,c.ds_nombre_via,c.ds_numero) ds_dir_comp'
      'from'
      '  carrito_presupuesto c'
      
        '  left join estados_pedido e on c.id_estado_pedido = e.id_estado' +
        '_pedido'
      '  left join provincias p on c.id_provincia = p.id_provincia'
      
        '  left join agencias_transporte a on (c.id_agencia_transporte = ' +
        'a.id_agencia_transporte) and (c.id_forma_pago = a.id_forma_pago)'
      '  left join formas_pago fp on c.id_forma_pago = fp.id_forma_pago'
      '  left join clientes cl on c.id_cliente = cl.id_cliente'
      
        '  left join clientes_access ca on cl.cod_cliente_access = ca.cod' +
        '_cliente'
      'order by'
      '  e.nm_orden,'
      '  c.f_fecha_compra'
      ''
      ' '
      ' '
      ' '
      ' ')
    Params = <>
    Left = 46
    Top = 15
    object sqlCarritoPresupuestoid_cliente_web: TStringField
      DisplayLabel = 'ID cliente'
      DisplayWidth = 50
      FieldName = 'id_cliente_web'
      Required = True
      Size = 50
    end
    object sqlCarritoPresupuestof_fecha_compra: TDateTimeField
      DisplayLabel = 'F. compra'
      FieldName = 'f_fecha_compra'
      Required = True
    end
    object sqlCarritoPresupuestof_fecha_aceptacion: TDateTimeField
      DisplayLabel = 'F. aceptación'
      FieldName = 'f_fecha_aceptacion'
    end
    object sqlCarritoPresupuestonm_pvp: TFloatField
      DisplayLabel = 'PVP total'
      FieldName = 'nm_pvp'
    end
    object sqlCarritoPresupuestonm_gastos_envio: TFloatField
      DisplayLabel = 'Gastos envío'
      FieldName = 'nm_gastos_envio'
    end
    object sqlCarritoPresupuestods_email: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'ds_email'
      Size = 255
    end
    object sqlCarritoPresupuestoid_estado_pedido: TLargeintField
      FieldName = 'id_estado_pedido'
    end
    object sqlCarritoPresupuestods_estado_pedido: TStringField
      DisplayLabel = 'Estado pedido'
      FieldName = 'ds_estado_pedido'
      Required = True
      Size = 30
    end
    object sqlCarritoPresupuestods_primer_apellido: TStringField
      DisplayLabel = 'Primer apellido'
      FieldName = 'ds_primer_apellido'
      Size = 30
    end
    object sqlCarritoPresupuestods_segundo_apellido: TStringField
      DisplayLabel = 'Segudo apellido'
      FieldName = 'ds_segundo_apellido'
      Size = 30
    end
    object sqlCarritoPresupuestods_nombre: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'ds_nombre'
      Size = 30
    end
    object sqlCarritoPresupuestods_nombre_completo: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'ds_nombre_completo'
      Size = 92
    end
    object sqlCarritoPresupuestoit_canarias: TStringField
      DisplayLabel = 'Canarias'
      FieldName = 'it_canarias'
      Required = True
      Size = 1
    end
    object sqlCarritoPresupuestof_fecha_envio: TDateTimeField
      DisplayLabel = 'F. envío'
      FieldName = 'f_fecha_envio'
    end
    object sqlCarritoPresupuestoid_provincia: TStringField
      FieldName = 'id_provincia'
      Size = 2
    end
    object sqlCarritoPresupuestoid_municipio: TStringField
      FieldName = 'id_municipio'
      Size = 5
    end
    object sqlCarritoPresupuestods_municipio: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'ds_municipio'
      Size = 100
    end
    object sqlCarritoPresupuestoid_tipo_via: TStringField
      DisplayLabel = 'Tipo vía'
      FieldName = 'id_tipo_via'
      Size = 5
    end
    object sqlCarritoPresupuestods_nombre_via: TStringField
      DisplayLabel = 'Nombre vía'
      FieldName = 'ds_nombre_via'
      Size = 50
    end
    object sqlCarritoPresupuestods_numero: TStringField
      DisplayLabel = 'Número'
      FieldName = 'ds_numero'
      Size = 5
    end
    object sqlCarritoPresupuestods_cp: TStringField
      DisplayLabel = 'CP'
      FieldName = 'ds_cp'
      Size = 5
    end
    object sqlCarritoPresupuestods_cp_extranjero: TStringField
      FieldName = 'ds_cp_extranjero'
      Size = 10
    end
    object sqlCarritoPresupuestods_resto_direccion: TStringField
      DisplayLabel = 'Resto dirección'
      FieldName = 'ds_resto_direccion'
      Size = 100
    end
    object sqlCarritoPresupuestods_provincia: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'ds_provincia'
      Size = 30
    end
    object sqlCarritoPresupuestods_dni: TStringField
      DisplayLabel = 'DNI'
      FieldName = 'ds_dni'
      Required = True
      Size = 15
    end
    object sqlCarritoPresupuestods_telefono: TStringField
      DisplayLabel = 'Teléfono'
      FieldName = 'ds_telefono'
      Size = 30
    end
    object sqlCarritoPresupuestods_direcli: TStringField
      FieldName = 'ds_direcli'
      Size = 164
    end
    object sqlCarritoPresupuestods_ciudad: TStringField
      FieldName = 'ds_ciudad'
      Size = 133
    end
    object sqlCarritoPresupuestoid_cliente: TLargeintField
      DisplayLabel = 'Cliente'
      FieldName = 'id_cliente'
      Required = True
    end
    object sqlCarritoPresupuestoid_agencia_transporte: TLargeintField
      FieldName = 'id_agencia_transporte'
      Required = True
    end
    object sqlCarritoPresupuestoid_forma_pago: TLargeintField
      FieldName = 'id_forma_pago'
      Required = True
    end
    object sqlCarritoPresupuestods_agencia_transporte: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'ds_agencia_transporte'
      Size = 50
    end
    object sqlCarritoPresupuestods_forma_pago: TStringField
      DisplayLabel = 'Pago'
      FieldName = 'ds_forma_pago'
      Size = 30
    end
    object sqlCarritoPresupuestoid_tipo_sexo: TStringField
      FieldName = 'id_tipo_sexo'
      Required = True
      Size = 1
    end
    object sqlCarritoPresupuestocod_cliente_access: TIntegerField
      DisplayLabel = 'Cliente Access'
      FieldName = 'cod_cliente_access'
    end
    object sqlCarritoPresupuestonm_comision_reembolso: TFloatField
      FieldName = 'nm_comision_reembolso'
    end
    object sqlCarritoPresupuestonm_fijo_reembolso: TFloatField
      FieldName = 'nm_fijo_reembolso'
    end
    object sqlCarritoPresupuestonm_minimo_comision: TFloatField
      FieldName = 'nm_minimo_comision'
    end
    object sqlCarritoPresupuestods_dir_comp: TStringField
      FieldName = 'ds_dir_comp'
      Size = 60
    end
    object sqlCarritoPresupuestods_observaciones: TMemoField
      FieldName = 'ds_observaciones'
      BlobType = ftMemo
    end
    object sqlCarritoPresupuestods_cod_post: TStringField
      FieldName = 'ds_cod_post'
      Size = 10
    end
    object sqlCarritoPresupuestonm_descuento_efectivo: TFloatField
      DisplayLabel = 'Desc. efec.'
      FieldName = 'nm_descuento_efectivo'
    end
    object sqlCarritoPresupuestonm_orden: TSmallintField
      FieldName = 'nm_orden'
      Required = True
    end
    object sqlCarritoPresupuestods_codigo_envio: TStringField
      DisplayLabel = 'Cod. envío'
      DisplayWidth = 20
      FieldName = 'ds_codigo_envio'
      Size = 255
    end
  end
  object dsCarritoPresupuesto: TDataSource
    DataSet = sqlCarritoPresupuesto
    Left = 159
    Top = 19
  end
  object sqlCarritoPresupuestoUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update carrito_presupuesto set'
      '  id_cliente = :id_cliente,'
      '  ds_email = :ds_email,'
      '  nm_gastos_envio = :nm_gastos_envio,'
      '  ds_codigo_envio = :ds_codigo_envio,'
      '  it_canarias = :it_canarias,'
      '  f_fecha_envio = :f_fecha_envio,'
      '  ds_email = :ds_email,'
      '  ds_dni = :ds_dni,'
      '  ds_primer_apellido = :ds_primer_apellido,'
      '  ds_segundo_apellido = :ds_segundo_apellido,'
      '  ds_nombre = :ds_nombre,'
      '  id_provincia = :id_provincia,'
      '  id_municipio = :id_municipio,'
      '  ds_municipio = :ds_municipio,'
      '  id_tipo_via = :id_tipo_via,'
      '  ds_nombre_via = :ds_nombre_via,'
      '  ds_numero = :ds_numero,'
      '  ds_cp = :ds_cp,'
      '  ds_cp_extranjero = :ds_cp_extranjero,'
      '  ds_telefono = :ds_telefono,'
      '  id_agencia_transporte = :id_agencia_transporte,'
      '  id_forma_pago = :id_forma_pago,'
      '  ds_resto_direccion = :ds_resto_direccion,'
      '  id_tipo_sexo = :id_tipo_sexo,'
      '  ds_observaciones = :ds_observaciones,'
      '  nm_descuento_efectivo = :nm_descuento_efectivo'
      'where'
      '  id_cliente_web = :id_cliente_web'
      ' '
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_codigo_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_efectivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end>
    DataSource = dsCarritoPresupuesto
    Left = 59
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_codigo_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_efectivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end>
  end
  object sqlCarrito: TZQuery
    Connection = dmRanning.dbRanning
    OnCalcFields = sqlCarritoCalcFields
    CachedUpdates = True
    OnUpdateRecord = sqlCarritoUpdateRecord
    BeforePost = sqlCarritoBeforePost
    BeforeDelete = sqlCarritoBeforeDelete
    SQL.Strings = (
      'select distinct'
      '  ca.*,'
      '  m.ds_marca,'
      '  m.cd_marca,'
      '  p.cd_producto,'
      '  concat(m.cd_marca,p.cd_producto) cd_producto_completo,'
      '  p.ds_producto,'
      '  t.ds_talla,'
      '  t.nm_orden nm_orden_talla,'
      '  tt.ds_tipo_talla_abr,'
      
        '  round(ca.nm_pvp * (1 - ca.nm_descuento / 100),2) nm_precio_fin' +
        'al,'
      
        '  round(ca.nm_pvp * (1 - ca.nm_descuento / 100) * if(ca.it_devol' +
        'ucion <> '#39'X'#39',ca.nm_cantidad,-ca.nm_cantidad),2) nm_precio_final_' +
        'total,'
      '  s.cd_color_fabricante'
      'from'
      '  marcas m,'
      '  productos p,'
      '  tallas t,'
      '  tipos_tallas tt,'
      '  carrito ca'
      
        '  left join stock s on (ca.id_talla = s.id_talla) and (ca.cd_col' +
        'or = s.cd_color) and (ca.id_producto = s.id_producto)'
      'where'
      '  (ca.id_cliente_web = :id_cliente_web) and'
      '  (ca.id_talla = t.id_talla) and'
      '  (t.id_tipo_talla = tt.id_tipo_talla) and'
      '  (ca.id_producto = p.id_producto) and'
      '  (p.id_marca = m.id_marca)'
      'order by'
      '  m.ds_marca,cd_producto_completo,ca.cd_color,nm_orden_talla'
      ''
      ''
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end>
    DataSource = dsCarritoPresupuesto
    Left = 58
    Top = 134
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end>
    object sqlCarritoid_cliente_web: TStringField
      DisplayWidth = 50
      FieldName = 'id_cliente_web'
      Required = True
      Size = 50
    end
    object sqlCarritof_fecha_compra: TDateTimeField
      FieldName = 'f_fecha_compra'
    end
    object sqlCarritoid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlCarritoid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlCarritonm_pvp: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'nm_pvp'
      Required = True
    end
    object sqlCarritods_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
    object sqlCarritocd_marca: TStringField
      FieldName = 'cd_marca'
      Required = True
      Size = 5
    end
    object sqlCarritocd_producto: TStringField
      DisplayLabel = 'Cod. producto'
      FieldName = 'cd_producto'
      Required = True
    end
    object sqlCarritocd_producto_completo: TStringField
      FieldName = 'cd_producto_completo'
      Required = True
      Size = 25
    end
    object sqlCarritods_producto: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'ds_producto'
      Required = True
      Size = 100
    end
    object sqlCarritods_color_completo: TStringField
      DisplayLabel = 'Color'
      FieldKind = fkCalculated
      FieldName = 'ds_color_completo'
      Required = True
      Size = 255
      Calculated = True
    end
    object sqlCarritods_talla: TStringField
      DisplayLabel = 'Talla'
      FieldName = 'ds_talla'
      Required = True
    end
    object sqlCarritonm_precio_final: TFloatField
      DisplayLabel = 'PVP unit.'
      FieldName = 'nm_precio_final'
    end
    object sqlCarritoid: TLargeintField
      FieldName = 'id'
    end
    object sqlCarritonm_iva: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlCarritocd_color: TStringField
      FieldName = 'cd_color'
      Required = True
      Size = 30
    end
    object sqlCarritoit_devolucion: TStringField
      DisplayLabel = 'Devolución'
      FieldName = 'it_devolucion'
      Size = 1
    end
    object sqlCarritonm_precio_final_total: TFloatField
      DisplayLabel = 'PVP total'
      FieldName = 'nm_precio_final_total'
    end
    object sqlCarritods_tipo_talla_abr: TStringField
      FieldName = 'ds_tipo_talla_abr'
      Required = True
      Size = 10
    end
    object sqlCarritonm_cantidad: TLargeintField
      DisplayLabel = 'Unid.'
      FieldName = 'nm_cantidad'
      Required = True
    end
    object sqlCarritonm_orden_talla: TSmallintField
      FieldName = 'nm_orden_talla'
      Required = True
    end
    object sqlCarritocd_color_fabricante: TStringField
      DisplayLabel = 'Cod. color'
      FieldName = 'cd_color_fabricante'
      Size = 50
    end
    object sqlCarritonm_descuento: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'nm_descuento'
    end
  end
  object sqlCarritoUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update carrito set'
      '  nm_descuento = :nm_descuento,'
      '  nm_pvp = :nm_pvp,'
      '  nm_cantidad = :nm_cantidad,'
      '  id_talla = :id_talla,'
      '  it_devolucion = :it_devolucion '
      'where'
      '  id = :id'
      ' ')
    Params = <
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_pvp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_devolucion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = dsCarrito
    Left = 76
    Top = 199
    ParamData = <
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_pvp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_devolucion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object dsCarrito: TDataSource
    DataSet = sqlCarrito
    Left = 145
    Top = 135
  end
  object sqlCarritoDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from carrito'
      'where id = :id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = dsCarrito
    Left = 190
    Top = 199
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object sqlCarritoInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into carrito ('
      '  id_cliente_web,'
      '  f_fecha_compra,'
      '  id_producto,'
      '  cd_color,'
      '  id_talla,'
      '  nm_descuento,'
      '  nm_pvp,'
      '  nm_cantidad,'
      '  nm_iva,'
      '  it_devolucion)'
      'values ('
      '  :id_cliente_web,'
      '  :f_fecha_compra,'
      '  :id_producto,'
      '  :cd_color,'
      '  :id_talla,'
      '  :nm_descuento,'
      '  :nm_pvp,'
      '  :nm_cantidad,'
      '  :nm_iva,'
      '  :it_devolucion)')
    Params = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'f_fecha_compra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_color'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_talla'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_pvp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nm_cantidad'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'it_devolucion'
        ParamType = ptInput
      end>
    Left = 298
    Top = 199
    ParamData = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'f_fecha_compra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_color'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_talla'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_pvp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nm_cantidad'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'it_devolucion'
        ParamType = ptInput
      end>
  end
  object sqlCarritoWeb: TZReadOnlyQuery
    Connection = dmRanning.dbWeb
    BeforeOpen = sqlCarritoWebBeforeOpen
    SQL.Strings = (
      'select * from carrito'
      'where id_cliente_web = :id_cliente_web '
      ' ')
    Params = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    Left = 176
    Top = 75
    ParamData = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
  end
  object dsCarritoWeb: TDataSource
    DataSet = sqlCarritoWeb
    Left = 263
    Top = 74
  end
  object sqlActualizaPresupuesto: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  c.id_cliente_web,'
      '  min(c.f_fecha_compra) f_fecha_compra_min,'
      
        '  if(cp.it_canarias <> '#39'X'#39',sum(round(c.nm_pvp * (1 - c.nm_descue' +
        'nto / 100) * if(c.it_devolucion <> '#39'X'#39',c.nm_cantidad,-c.nm_canti' +
        'dad),2)),'
      
        '    sum(round(c.nm_pvp * (1 - c.nm_descuento / 100) * if(c.it_de' +
        'volucion <> '#39'X'#39',c.nm_cantidad,-c.nm_cantidad) / (1 + ci.nm_iva_n' +
        'uevo / 100),2))) nm_precio,'
      '  1 id_estado_pedido,'
      '  cp.ds_observaciones'
      'from'
      '  carrito c,'
      '  carrito_presupuesto cp,'
      '  cambio_iva ci'
      'where'
      '  (c.id_cliente_web = cp.id_cliente_web) and'
      '  (cp.f_fecha_aceptacion is null) and'
      '  (c.nm_iva = ci.nm_iva_antiguo)'
      'group by'
      '  c.id_cliente_web'
      ''
      ' '
      ' '
      ' '
      ' ')
    Params = <>
    Left = 75
    Top = 272
  end
  object dsActualizaPresupuesto: TDataSource
    DataSet = sqlActualizaPresupuesto
    Left = 194
    Top = 291
  end
  object sqlActualizaPresupuestoInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into carrito_presupuesto ('
      '  id_cliente_web,'
      '  f_fecha_compra,'
      '  nm_pvp,'
      '  id_estado_pedido,'
      '  ds_primer_apellido,'
      '  ds_segundo_apellido,'
      '  ds_nombre,'
      '  ds_email,'
      '  it_canarias,'
      '  id_provincia,'
      '  id_municipio,'
      '  ds_resto_direccion,'
      '  ds_municipio,'
      '  ds_cp,'
      '  id_tipo_via,'
      '  ds_nombre_via,'
      '  ds_numero,'
      '  ds_dni,'
      '  ds_telefono,'
      '  id_cliente,'
      '  id_agencia_transporte,'
      '  id_forma_pago,'
      '  nm_gastos_envio,'
      '  id_tipo_sexo,'
      '  ds_observaciones,'
      '  ds_cp_extranjero,'
      '  nm_descuento_efectivo)'
      'values ('
      '  :id_cliente_web,'
      '  :f_fecha_compra_min,'
      '  :nm_precio,'
      '  :id_estado_pedido,'
      '  :ds_primer_apellido,'
      '  :ds_segundo_apellido,'
      '  :ds_nombre,'
      '  :ds_email,'
      '  :it_canarias,'
      '  :id_provincia,'
      '  :id_municipio,'
      '  :ds_resto_direccion,'
      '  :ds_municipio,'
      '  :ds_cp,'
      '  :id_tipo_via,'
      '  :ds_nombre_via,'
      '  :ds_numero,'
      '  :ds_dni,'
      '  :ds_telefono,'
      '  :id_cliente,'
      '  :id_agencia_transporte,'
      '  :id_forma_pago,'
      '  :nm_gastos_envio,'
      '  :id_tipo_sexo,'
      '  :ds_observaciones,'
      '  :ds_cp_extranjero,'
      '  :nm_descuento_efectivo)'
      ''
      ''
      ' ')
    Params = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra_min'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_estado_pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ds_primer_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_segundo_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_email'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_gastos_envio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ds_cp_extranjero'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_efectivo'
        ParamType = ptInput
      end>
    DataSource = dsActualizaPresupuesto
    Left = 84
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra_min'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_estado_pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ds_primer_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_segundo_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_email'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_gastos_envio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ds_cp_extranjero'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_efectivo'
        ParamType = ptInput
      end>
  end
  object sqlActualizaPresupuestoUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update carrito_presupuesto set'
      '  nm_pvp = :nm_precio'
      'where'
      '  (id_cliente_web = :id_cliente_web) and'
      '  (nm_pvp <> :nm_precio)'
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    DataSource = dsActualizaPresupuesto
    Left = 244
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
  end
  object sqlSubirCarrito: TZReadOnlyQuery
    Connection = dmRanning.dbWeb
    BeforeOpen = sqlCarritoWebBeforeOpen
    SQL.Strings = (
      'insert into carrito ('
      '  id_cliente_web,'
      '  f_fecha_compra,'
      '  id_producto,'
      '  cd_color,'
      '  id_talla,'
      '  nm_descuento,'
      '  nm_pvp,'
      '  nm_cantidad,'
      '  nm_iva,'
      '  it_devolucion)'
      'values ('
      '  :id_cliente_web,'
      '  :f_fecha_compra,'
      '  :id_producto,'
      '  :cd_color,'
      '  :id_talla,'
      '  :nm_descuento,'
      '  :nm_pvp,'
      '  :nm_cantidad,'
      '  :nm_iva,'
      '  :it_devolucion)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_pvp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_devolucion'
        ParamType = ptUnknown
      end>
    DataSource = dsCarrito
    Left = 397
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_talla'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_pvp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_devolucion'
        ParamType = ptUnknown
      end>
  end
  object sqlSubirCarritoPresupuesto: TZReadOnlyQuery
    Connection = dmRanning.dbWeb
    BeforeOpen = sqlCarritoWebBeforeOpen
    SQL.Strings = (
      'insert into carrito_presupuesto ('
      '  id_cliente_web,'
      '  f_fecha_compra,'
      '  f_fecha_aceptacion,'
      '  f_fecha_envio,'
      '  id_estado_pedido,'
      '  nm_pvp,'
      '  nm_gastos_envio,'
      '  ds_email,'
      '  ds_codigo_envio,'
      '  ds_primer_apellido,'
      '  ds_segundo_apellido,'
      '  ds_nombre,'
      '  it_canarias,'
      '  id_provincia,'
      '  id_municipio,'
      '  ds_resto_direccion,'
      '  ds_municipio,'
      '  ds_cp,'
      '  id_tipo_via,'
      '  ds_nombre_via,'
      '  ds_numero,'
      '  ds_dni,'
      '  ds_telefono,'
      '  id_cliente,'
      '  id_agencia_transporte,'
      '  id_forma_pago,'
      '  id_tipo_sexo,'
      '  ds_observaciones,'
      '  ds_cp_extranjero,'
      '  nm_descuento_efectivo)'
      'values ('
      '  :id_cliente_web,'
      '  :f_fecha_compra,'
      '  :f_fecha_aceptacion,'
      '  :f_fecha_envio,'
      '  :id_estado_pedido,'
      '  :nm_pvp,'
      '  :nm_gastos_envio,'
      '  :ds_email,'
      '  :ds_codigo_envio,'
      '  :ds_primer_apellido,'
      '  :ds_segundo_apellido,'
      '  :ds_nombre,'
      '  :it_canarias,'
      '  :id_provincia,'
      '  :id_municipio,'
      '  :ds_resto_direccion,'
      '  :ds_municipio,'
      '  :ds_cp,'
      '  :id_tipo_via,'
      '  :ds_nombre_via,'
      '  :ds_numero,'
      '  :ds_dni,'
      '  :ds_telefono,'
      '  :id_cliente,'
      '  :id_agencia_transporte,'
      '  :id_forma_pago,'
      '  :id_tipo_sexo,'
      '  :ds_observaciones,'
      '  :ds_cp_extranjero,'
      '  :nm_descuento_efectivo)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_aceptacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_estado_pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_pvp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_codigo_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_efectivo'
        ParamType = ptUnknown
      end>
    DataSource = dsCarritoPresupuesto
    Left = 395
    Top = 125
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_aceptacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_estado_pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_pvp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_codigo_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_efectivo'
        ParamType = ptUnknown
      end>
  end
  object sqlProductoTallas: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  id_tipo_producto,'
      '  id_marca,'
      '  id_tipo_deporte,'
      '  id_tipo_sexo'
      'from'
      '  productos'
      'where'
      '  id_producto = :id_producto')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsCarrito
    Left = 221
    Top = 139
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
  end
  object sqlTallas: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    Params = <>
    Left = 294
    Top = 139
  end
  object sqlCarritoPresupuestoWeb: TZReadOnlyQuery
    Connection = dmRanning.dbWeb
    BeforeOpen = sqlCarritoWebBeforeOpen
    SQL.Strings = (
      'select'
      '  *'
      'from'
      '  carrito_presupuesto'
      'where'
      '  id_cliente_web = :id_cliente_web'
      ' '
      ' '
      ' '
      ' ')
    Params = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    Left = 282
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
  end
  object dsCarritoPresupuestoWeb: TDataSource
    DataSet = sqlCarritoPresupuestoWeb
    Left = 380
    Top = 3
  end
  object sqlCarritoPresupuestoInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into carrito_presupuesto'
      '  (id_cliente_web,'
      '  f_fecha_compra,'
      '  id_estado_pedido,'
      '  it_canarias,'
      '  ds_primer_apellido,'
      '  ds_segundo_apellido,'
      '  ds_nombre,'
      '  ds_email,'
      '  id_provincia,'
      '  id_municipio,'
      '  ds_resto_direccion,'
      '  ds_municipio,'
      '  ds_cp,'
      '  id_tipo_via,'
      '  ds_nombre_via,'
      '  ds_numero,'
      '  ds_dni,'
      '  ds_telefono,'
      '  id_cliente,'
      '  id_agencia_transporte,'
      '  id_forma_pago,'
      '  nm_gastos_envio,'
      '  id_tipo_sexo,'
      '  ds_observaciones,'
      '  ds_cp_extranjero,'
      '  nm_descuento_efectivo)'
      'values'
      '  (:id_cliente_web,'
      '  :f_fecha_compra,'
      '  :id_estado_pedido,'
      '  :it_canarias,'
      '  :ds_primer_apellido,'
      '  :ds_segundo_apellido,'
      '  :ds_nombre,'
      '  :ds_email,'
      '  :id_provincia,'
      '  :id_municipio,'
      '  :ds_resto_direccion,'
      '  :ds_municipio,'
      '  :ds_cp,'
      '  :id_tipo_via,'
      '  :ds_nombre_via,'
      '  :ds_numero,'
      '  :ds_dni,'
      '  :ds_telefono,'
      '  :id_cliente,'
      '  :id_agencia_transporte,'
      '  :id_forma_pago,'
      '  :nm_gastos_envio,'
      '  :id_tipo_sexo,'
      '  :ds_observaciones,'
      '  :ds_cp_extranjero,'
      '  :nm_descuento_efectivo)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_estado_pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_efectivo'
        ParamType = ptUnknown
      end>
    DataSource = dsCarritoPresupuestoWeb
    Left = 380
    Top = 61
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha_compra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_estado_pedido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_canarias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_efectivo'
        ParamType = ptUnknown
      end>
  end
  object sqlClientesInsert: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsCarritoPresupuesto
    Parameters = <
      item
        Name = 'idecli'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nombre_completo'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ds_dni'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'direcli'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ds_cod_post'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ciudad'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ds_telefono'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'descuento'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ds_email'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into clientes'
      '  (idecli,'
      '  cliente,'
      '  nif,'
      '  direcli,'
      '  codigop,'
      '  ciudad,'
      '  telecli,'
      '  descuento,'
      '  email,'
      '  comprainicial,'
      '  cl_tipo)'
      'values'
      '  (:idecli,'
      '  :nombre_completo,'
      '  :ds_dni,'
      '  :direcli,'
      '  :ds_cod_post,'
      '  :ciudad,'
      '  :ds_telefono,'
      '  :descuento,'
      '  :ds_email,'
      '  0,'
      '  '#39'INTERNET'#39')'
      ' '
      ' '
      ' ')
    Left = 377
    Top = 260
  end
  object sqlUltCliente: TADOQuery
    Connection = dmRanning.dbAccess
    Parameters = <>
    SQL.Strings = (
      'select max(idecli) as nUltCliente from clientes')
    Left = 439
    Top = 271
  end
  object sqlInsertClientes: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into clientes'
      '  (cod_cliente_access,'
      '  ds_primer_apellido,'
      '  ds_segundo_apellido,'
      '  ds_nombre,'
      '  ds_dni,'
      '  id_tipo_sexo,'
      '  nm_descuento,'
      '  ds_email,'
      '  ds_telefono,'
      '  f_ultima_actualizacion,'
      '  nm_compras_inicial,'
      '  ds_primer_apellido_esp,'
      '  ds_segundo_apellido_esp,'
      '  ds_nombre_esp)'
      'values'
      '  (:cliente_access,'
      '  :primer_apellido,'
      '  :segundo_apellido,'
      '  :nombre,'
      '  :ds_dni,'
      '  :id_tipo_sexo,'
      '  10,'
      '  :ds_email,'
      '  :ds_telefono,'
      '  :f_ultima_actualizacion,'
      '  0,'
      '  :ds_primer_apellido,'
      '  :ds_segundo_apellido,'
      '  :ds_nombre)'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'cliente_access'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'primer_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'segundo_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'f_ultima_actualizacion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end>
    DataSource = dsCarritoPresupuesto
    Left = 387
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cliente_access'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'primer_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'segundo_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'f_ultima_actualizacion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end>
  end
  object sqlDireccionesInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into direcciones'
      '  (id_provincia,'
      '  id_municipio,'
      '  ds_municipio,'
      '  id_tipo_via,'
      '  ds_nombre_via,'
      '  ds_numero,'
      '  ds_cp,'
      '  ds_resto_direccion,'
      '  ds_cp_extranjero)'
      'values'
      '  (:id_provincia,'
      '  :id_municipio,'
      '  :municipio,'
      '  :id_tipo_via,'
      '  :ds_nombre_via,'
      '  :ds_numero,'
      '  :ds_cp,'
      '  :ds_resto_direccion,'
      '  :ds_cp_extranjero)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'municipio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end>
    DataSource = dsCarritoPresupuesto
    Left = 310
    Top = 301
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'municipio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end>
  end
  object sqlDirecciones: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  d.*,'
      '  p.ds_provincia,'
      
        '  if(d.id_municipio <> '#39#39',m.ds_municipio,d.ds_municipio) ds_muni' +
        ','
      '  tv.ds_tipo_via,'
      '  if(d.ds_cp <> '#39#39',d.ds_cp,d.ds_cp_extranjero) ds_cod_post'
      'from'
      '  clientes_direcciones cd'
      '  left join direcciones d on cd.id_direccion = d.id_direccion'
      '  left join provincias p on d.id_provincia = p.id_provincia'
      
        '  left join municipios m on (d.id_provincia = m.id_provincia) an' +
        'd (d.id_municipio = m.id_municipio)'
      '  left join tipos_vial tv on d.id_tipo_via = tv.id_tipo_via'
      'where'
      '  cd.id_cliente = :id_cliente'
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_cliente'
        ParamType = ptInput
      end>
    Left = 352
    Top = 372
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_cliente'
        ParamType = ptInput
      end>
    object sqlDireccionesid_direccion: TLargeintField
      FieldName = 'id_direccion'
    end
    object sqlDireccionesid_provincia: TStringField
      FieldName = 'id_provincia'
      Size = 2
    end
    object sqlDireccionesid_municipio: TStringField
      FieldName = 'id_municipio'
      Size = 5
    end
    object sqlDireccionesds_municipio: TStringField
      FieldName = 'ds_municipio'
      Size = 100
    end
    object sqlDireccionesid_tipo_via: TStringField
      FieldName = 'id_tipo_via'
      Size = 5
    end
    object sqlDireccionesds_nombre_via: TStringField
      FieldName = 'ds_nombre_via'
      Size = 50
    end
    object sqlDireccionesds_numero: TStringField
      FieldName = 'ds_numero'
      Size = 5
    end
    object sqlDireccionesds_cp: TStringField
      FieldName = 'ds_cp'
      Size = 5
    end
    object sqlDireccionesds_cp_extranjero: TStringField
      FieldName = 'ds_cp_extranjero'
      Size = 10
    end
    object sqlDireccionesds_resto_direccion: TStringField
      FieldName = 'ds_resto_direccion'
      Size = 100
    end
    object sqlDireccionesds_provincia: TStringField
      FieldName = 'ds_provincia'
      Required = True
      Size = 30
    end
    object sqlDireccionesds_muni: TStringField
      FieldName = 'ds_muni'
      Size = 100
    end
    object sqlDireccionesds_tipo_via: TStringField
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
    object sqlDireccionesds_cod_post: TStringField
      FieldName = 'ds_cod_post'
      Size = 10
    end
  end
  object sqlDireccionCliente: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  d.*,'
      '  p.ds_provincia,'
      
        '  if(d.id_municipio <> '#39#39',m.ds_municipio,d.ds_municipio) ds_muni' +
        ','
      '  tv.ds_tipo_via,'
      '  if(d.ds_cp <> '#39#39',d.ds_cp,d.ds_cp_extranjero) ds_cod_post'
      'from'
      '  direcciones d'
      '  left join provincias p on d.id_provincia = p.id_provincia'
      
        '  left join municipios m on (d.id_provincia = m.id_provincia) an' +
        'd (d.id_municipio = m.id_municipio)'
      '  left join tipos_vial tv on d.id_tipo_via = tv.id_tipo_via'
      'where'
      '  d.id_direccion = :id_direccion')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_direccion'
        ParamType = ptInput
      end>
    Left = 354
    Top = 417
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_direccion'
        ParamType = ptInput
      end>
    object LargeintField1: TLargeintField
      FieldName = 'id_direccion'
    end
    object StringField1: TStringField
      FieldName = 'id_provincia'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'id_municipio'
      Size = 5
    end
    object StringField3: TStringField
      FieldName = 'ds_municipio'
      Size = 100
    end
    object StringField4: TStringField
      FieldName = 'id_tipo_via'
      Size = 5
    end
    object StringField5: TStringField
      FieldName = 'ds_nombre_via'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'ds_numero'
      Size = 5
    end
    object StringField7: TStringField
      FieldName = 'ds_cp'
      Size = 5
    end
    object StringField8: TStringField
      FieldName = 'ds_cp_extranjero'
      Size = 10
    end
    object StringField9: TStringField
      FieldName = 'ds_resto_direccion'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'ds_provincia'
      Required = True
      Size = 30
    end
    object StringField11: TStringField
      FieldName = 'ds_muni'
      Size = 100
    end
    object StringField12: TStringField
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
    object StringField13: TStringField
      FieldName = 'ds_cod_post'
      Size = 10
    end
  end
end
