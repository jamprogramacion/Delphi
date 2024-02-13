object dmCarrito: TdmCarrito
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'wactCarrito'
      PathInfo = '/wcarrito'
      Producer = htmlwCarrito
      OnAction = dmCarritowactCarritoAction
    end>
  Left = 230
  Top = 169
  Height = 480
  Width = 696
  object dbRanning: TZConnection
    Protocol = 'mysql-4.1'
    HostName = 'despacho'
    Port = 3306
    Database = 'ranning'
    User = 'root'
    Password = 'apunto'
    AutoCommit = False
    BeforeConnect = dbRanningBeforeConnect
    Left = 111
    Top = 22
  end
  object htmlwCarrito: TPageProducer
    OnHTMLTag = htmlwCarritoHTMLTag
    Left = 49
    Top = 299
  end
  object sqlCarrito: TZReadOnlyQuery
    Connection = dbRanning
    AfterOpen = sqlCarritoAfterOpen
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
      '  round(nm_pvp * (1 - ca.nm_descuento / 100),2) nm_precio_final,'
      
        '  round(nm_pvp * (1 - ca.nm_descuento / 100),2) * ca.nm_cantidad' +
        ' nm_precio_final_total'
      'from'
      '  carrito ca,'
      '  marcas m,'
      '  productos p,'
      '  tallas t'
      'where'
      '  (ca.id_cliente_web = :id_cliente_web) and'
      '  (ca.id_talla = t.id_talla) and'
      '  (ca.id_producto = p.id_producto) and'
      '  (p.id_marca = m.id_marca)'
      'order by'
      '  m.ds_marca,cd_producto_completo,ca.cd_color,nm_orden_talla'
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    Left = 62
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
  end
  object dsCarrito: TDataSource
    DataSet = sqlCarrito
    Left = 151
    Top = 97
  end
  object sqlCarritoInsert: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'insert into carrito'
      '  (id_cliente_web,'
      '  f_fecha_compra,'
      '  id_producto,'
      '  cd_color,'
      '  id_talla,'
      '  nm_descuento,'
      '  nm_pvp,'
      '  nm_cantidad,'
      '  nm_iva)'
      'values'
      '  (:id_cliente_web,'
      '  :f_fecha_compra,'
      '  :id_producto,'
      '  :cd_color,'
      '  :id_talla,'
      '  :nm_desc,'
      '  :nm_pvp,'
      '  :cantidad,'
      '  :nm_iva)')
    Params = <
      item
        DataType = ftInteger
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
        Name = 'nm_desc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_pvp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cantidad'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_iva'
        ParamType = ptInput
      end>
    DataSource = dsStock
    Left = 62
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
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
        Name = 'nm_desc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_pvp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cantidad'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_iva'
        ParamType = ptInput
      end>
  end
  object sqlCarritoUpdate: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'update carrito set'
      '  f_fecha_compra = :fecha_compra,'
      '  nm_cantidad = :cantidad'
      'where'
      '  id = :id'
      ' ')
    Params = <
      item
        DataType = ftDateTime
        Name = 'fecha_compra'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'cantidad'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    DataSource = dsCarrito
    Left = 148
    Top = 153
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha_compra'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'cantidad'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sqlStock: TZReadOnlyQuery
    Connection = dbRanning
    AfterOpen = sqlStockAfterOpen
    SQL.Strings = (
      'select'
      '  s.id_producto,'
      '  s.cd_color,'
      '  s.id_talla,'
      '  s.nm_pvp,'
      '  s.nm_iva,'
      '  s.nm_descuento_oferta nm_descuento'
      'from'
      '  stock s'
      'where'
      '  (s.id_producto = :id_producto) and'
      '  (s.cd_color = :cd_color) and'
      '  (s.id_talla = :id_talla)')
    Params = <
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
      end>
    Left = 238
    Top = 68
    ParamData = <
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
      end>
  end
  object dsStock: TDataSource
    DataSet = sqlStock
    Left = 301
    Top = 76
  end
  object sqlCarritoDelete: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'delete from carrito where id = :id')
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    Left = 242
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sqlEstadoPedido: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  ep.ds_estado_pedido,'
      '  cp.ds_codigo_envio,'
      '  cp.f_fecha_envio,'
      
        '  concat(cp.ds_nombre,'#39' '#39',cp.ds_primer_apellido,'#39' '#39',cp.ds_segund' +
        'o_apellido) ds_nombre_completo,'
      
        '  concat(cp.id_tipo_via,'#39' '#39',cp.ds_nombre_via,'#39' '#39',cp.ds_numero,'#39',' +
        ' '#39',cp.ds_resto_direccion) ds_calle,'
      
        '  concat(cp.ds_cp,'#39' '#39',cp.ds_municipio,'#39' ('#39',p.ds_provincia,'#39')'#39') d' +
        's_muni,'
      '  cp.ds_observaciones'
      'from'
      '  estados_pedido ep,'
      '  carrito_presupuesto cp,'
      '  provincias p'
      'where'
      '  (cp.id_cliente_web = :id_cliente_web) and'
      '  (cp.id_estado_pedido = ep.id_estado_pedido) and'
      '  (cp.id_provincia = p.id_provincia)')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    DataSource = dsCarrito
    Left = 173
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
  end
  object sqlOfertas: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select distinct'
      '  c.id_producto,'
      '  c.cd_color,'
      '  c.id_talla,'
      
        '  round(c.nm_pvp * (1 - o.nm_descuento / 100),2) nm_precio_final' +
        ','
      
        '  round(c.nm_pvp * (1 - o.nm_descuento / 100),2) * c.nm_cantidad' +
        ' nm_precio_final_total,'
      '  o.*'
      'from'
      '  ofertas o,'
      '  productos p,'
      '  carrito c,'
      '  tallas t,'
      '  stock s'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_producto = c.id_producto) and'
      '  (c.cd_color = :cd_color) and'
      '  (c.id_talla = :id_talla) and'
      '  (c.id_talla = t.id_talla) and'
      '  (c.id_producto = s.id_producto) and'
      '  (c.cd_color = s.cd_color) and'
      '  (c.id_talla = s.id_talla) and'
      '  ((p.id_producto = o.id_producto) or (o.id_producto = 0)) and'
      
        '  ((p.id_tipo_producto = o.id_tipo_producto) or (o.id_tipo_produ' +
        'cto = 0)) and'
      
        '  ((p.id_tipo_complemento = o.id_tipo_complemento) or (o.id_tipo' +
        '_complemento = 0)) and'
      
        '  ((p.id_tipo_deporte = o.id_tipo_deporte) or (o.id_tipo_deporte' +
        ' = 0)) and'
      '  ((p.id_producto = o.id_producto) or (o.id_producto = 0)) and'
      '  ((p.id_marca = o.id_marca) or (o.id_marca = 0)) and'
      
        '  ((p.id_tipo_sexo = o.id_tipo_sexo) or (o.id_tipo_sexo = 0)) an' +
        'd'
      
        '  ((s.id_temporada = o.id_temporada) or (o.id_temporada = -1)) a' +
        'nd'
      '  ((curdate() between f_inicio and f_fin) or'
      '  ((f_inicio is null) and (f_fin is null)) or'
      '  ((f_inicio <= curdate()) and (f_fin is null)) or'
      '  ((f_fin >= curdate()) and (f_inicio is null)))'
      ' '
      ' '
      ' '
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
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
      end>
    DataSource = dsCarrito
    Left = 279
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
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
      end>
  end
  object sqlOfertasStock: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  o.nm_descuento'
      'from'
      '  ofertas o,'
      '  productos p,'
      '  tallas t,'
      '  stock s'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_producto = s.id_producto) and'
      '  (s.cd_color = :cd_color) and'
      '  (s.id_talla = :id_talla) and'
      '  (s.id_talla = t.id_talla) and'
      '  ((p.id_producto = o.id_producto) or (o.id_producto = 0)) and'
      
        '  ((p.id_tipo_producto = o.id_tipo_producto) or (o.id_tipo_produ' +
        'cto = 0)) and'
      
        '  ((p.id_tipo_complemento = o.id_tipo_complemento) or (o.id_tipo' +
        '_complemento = 0)) and'
      
        '  ((p.id_tipo_deporte = o.id_tipo_deporte) or (o.id_tipo_deporte' +
        ' = 0)) and'
      '  ((p.id_producto = o.id_producto) or (o.id_producto = 0)) and'
      '  ((p.id_marca = o.id_marca) or (o.id_marca = 0)) and'
      
        '  ((p.id_tipo_sexo = o.id_tipo_sexo) or (o.id_tipo_sexo = 0)) an' +
        'd'
      
        '  ((s.id_temporada = o.id_temporada) or (o.id_temporada = -1)) a' +
        'nd'
      '  ((curdate() between f_inicio and f_fin) or'
      '  ((f_inicio is null) and (f_fin is null)) or'
      '  ((f_inicio <= curdate()) and (f_fin is null)) or'
      '  ((f_fin >= curdate()) and (f_inicio is null)))'
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
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
      end>
    DataSource = dsStock
    Left = 361
    Top = 229
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
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
      end>
  end
end
