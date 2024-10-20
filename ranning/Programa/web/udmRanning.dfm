object dmRanning: TdmRanning
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Name = 'wactProductos'
      PathInfo = '/wproductos'
      Producer = htmlwProductos
      OnAction = dmRanningwactProductosAction
    end
    item
      Name = 'wactImagenProducto'
      PathInfo = '/Wimagen_producto'
      Producer = htmlImagenProducto
      OnAction = dmRanningwactImagenProductoAction
    end
    item
      Name = 'wactEntrada'
      PathInfo = '/wentrada'
    end
    item
      Name = 'wactConsulta'
      PathInfo = '/wconsulta'
      Producer = htmlwProductos
      OnAction = dmRanningwactConsultaAction
    end
    item
      Name = 'wactBusquedaAvanzada'
      PathInfo = '/wbusqueda_avanzada'
      Producer = htmlwBusquedaAvanzada
      OnAction = dmRanningwactBusquedaAvanzadaAction
    end
    item
      Name = 'wactProductosOfertas'
      PathInfo = '/wproductos_ofertas'
      Producer = htmlwProductosOfertas
      OnAction = dmRanningwactProductosOfertasAction
    end
    item
      Name = 'wactProductosNovedades'
      PathInfo = '/wproductos_novedades'
      Producer = htmlwProductosNovedades
      OnAction = dmRanningwactProductosNovedadesAction
    end
    item
      Name = 'wactCarrito'
      PathInfo = '/wcarrito'
    end
    item
      Name = 'wactIndexConsulta'
      PathInfo = '/windex_consulta'
      Producer = htmlwIndexConsulta
      OnAction = dmRanningwactIndexConsultaAction
    end>
  Left = 192
  Top = 139
  Height = 595
  Width = 830
  object DCP_twofish: TDCP_twofish
    Id = 6
    Algorithm = 'Twofish'
    MaxKeySize = 256
    BlockSize = 128
    Left = 32
    Top = 21
  end
  object dbRanning: TZConnection
    Protocol = 'mysql-5'
    HostName = 'localhost'
    Port = 3306
    Database = 'ranning'
    User = 'root'
    Password = 'apunto'
    AutoCommit = False
    BeforeConnect = dbRanningBeforeConnect
    Left = 113
    Top = 22
  end
  object sqlProductos: TZReadOnlyQuery
    Connection = dbRanning
    OnCalcFields = sqlProductosCalcFields
    SQL.Strings = (
      'select'
      '  p.*,'
      '  tp.ds_tipo_producto,'
      '  tc.ds_tipo_complemento,'
      '  td.ds_tipo_deporte,'
      '  ts.ds_tipo_sexo,'
      '  m.cd_marca,'
      '  m.ds_marca,'
      '  floor(max(s.nm_descuento_oferta)) nm_descuento_max'
      'from'
      '  productos p,'
      '  tipos_producto tp,'
      '  tipos_complemento tc,'
      '  tipos_deporte td,'
      '  tipos_sexo ts,'
      '  marcas m,'
      '  stock s'
      'where'
      '  (p.id_tipo_producto = tp.id_tipo_producto) and'
      '  (p.id_tipo_complemento = tc.id_tipo_complemento) and'
      '  (p.id_tipo_deporte = td.id_tipo_deporte) and'
      '  (p.id_tipo_sexo = ts.id_tipo_sexo) and'
      '  (p.it_activo = '#39'X'#39') and'
      '  (p.id_marca = m.id_marca) and'
      '  (p.id_producto = s.id_producto) '
      '#where'
      'group by'
      '  m.ds_marca,'
      '  p.ds_producto,'
      '  p.cd_producto'
      '#limit'
      ' ')
    Params = <>
    Left = 26
    Top = 75
    object sqlProductosds_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
    object sqlProductosds_producto: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'ds_producto'
      Required = True
      Size = 100
    end
    object sqlProductoscd_producto: TStringField
      DisplayLabel = 'Código'
      FieldName = 'cd_producto'
      Required = True
    end
    object sqlProductosds_tipo_producto: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'ds_tipo_producto'
      Required = True
      Size = 30
    end
    object sqlProductosds_tipo_complemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'ds_tipo_complemento'
      Required = True
      Size = 50
    end
    object sqlProductosds_tipo_deporte: TStringField
      DisplayLabel = 'Deporte'
      FieldName = 'ds_tipo_deporte'
      Required = True
      Size = 30
    end
    object sqlProductosds_tipo_sexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'ds_tipo_sexo'
      Required = True
      Size = 15
    end
    object sqlProductosid_producto: TLargeintField
      FieldName = 'id_producto'
      Visible = False
    end
    object sqlProductosid_tipo_producto: TLargeintField
      FieldName = 'id_tipo_producto'
      Required = True
      Visible = False
    end
    object sqlProductosid_tipo_complemento: TLargeintField
      FieldName = 'id_tipo_complemento'
      Required = True
      Visible = False
    end
    object sqlProductosid_tipo_deporte: TLargeintField
      FieldName = 'id_tipo_deporte'
      Required = True
      Visible = False
    end
    object sqlProductosid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
      Required = True
      Visible = False
    end
    object sqlProductosid_marca: TLargeintField
      FieldName = 'id_marca'
      Required = True
      Visible = False
    end
    object sqlProductosit_activo: TStringField
      FieldName = 'it_activo'
      Required = True
      Visible = False
      Size = 1
    end
    object sqlProductosf_entrada: TDateField
      FieldName = 'f_entrada'
      Required = True
      Visible = False
    end
    object sqlProductosobservaciones: TMemoField
      FieldName = 'observaciones'
      Visible = False
      BlobType = ftMemo
    end
    object sqlProductoscd_barras: TStringField
      FieldName = 'cd_barras'
      Visible = False
    end
    object sqlProductoscd_marca: TStringField
      DisplayLabel = 'Cod marca'
      FieldName = 'cd_marca'
      Required = True
      Visible = False
      Size = 5
    end
    object sqlProductosnm_peso: TIntegerField
      FieldName = 'nm_peso'
      Visible = False
    end
    object sqlProductosit_novedad: TStringField
      FieldName = 'it_novedad'
      Required = True
      Visible = False
      Size = 1
    end
    object sqlProductosf_actualizacion: TDateField
      FieldName = 'f_actualizacion'
      Visible = False
    end
    object sqlProductosds_caracteristicas: TStringField
      DisplayLabel = 'Características'
      FieldKind = fkCalculated
      FieldName = 'ds_caracteristicas'
      Size = 5000
      Calculated = True
    end
    object sqlProductosnm_mult_puntos: TFloatField
      FieldName = 'nm_mult_puntos'
      Required = True
      Visible = False
    end
    object sqlProductosnm_descuento_max: TFloatField
      FieldName = 'nm_descuento_max'
      ReadOnly = True
      Visible = False
    end
  end
  object htmlwProductos: TPageProducer
    OnHTMLTag = htmlwProductosHTMLTag
    Left = 168
    Top = 74
  end
  object sqlFiltros: TZReadOnlyQuery
    Connection = dbRanning
    Params = <>
    Left = 521
    Top = 269
  end
  object sqlTiposSexo: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from tipos_sexo order by id_tipo_sexo')
    Params = <>
    Left = 572
    Top = 145
  end
  object sqlColoresProducto: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select distinct'
      '  cd_color'
      'from'
      '  stock'
      'where'
      '  id_producto = :id_producto'
      'order by'
      '  cd_color')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 265
    Top = 109
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object htmlImagenProducto: TPageProducer
    OnHTMLTag = htmlImagenProductoHTMLTag
    Left = 37
    Top = 243
  end
  object sqlMarcas: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from marcas where it_activa = '#39'X'#39' order by ds_marca')
    Params = <>
    Left = 349
    Top = 120
  end
  object sqlPrecioProducto: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      
        '  round(s.nm_pvp * (1 - s.nm_descuento_oferta / 100),2) nm_preci' +
        'o_final,'
      
        '  if(p.nm_peso = 0,0,round(s.nm_pvp * (1 - s.nm_descuento_oferta' +
        ' / 100) * 1000 / p.nm_peso,2)) nm_precio_kg'
      'from'
      '  stock s,'
      '  productos p'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_producto = s.id_producto)'
      'order by'
      '  nm_precio_final')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 429
    Top = 94
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object sqlDeportes: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from tipos_deporte order by id_tipo_deporte')
    Params = <>
    Left = 505
    Top = 91
  end
  object sqlProductosAtributos: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  pd.id_producto,'
      '  pa.ds_atributo,'
      '  pd.id_valor,'
      '  a.ds_valor,'
      '  p.observaciones,'
      '  p.nm_peso,'
      '  p.id_tipo_producto,'
      '  a.ds_web'
      'FROM'
      
        '  productos p left join productos_detalle pd on p.id_producto = ' +
        'pd.id_producto'
      
        '  left join productos_atributos pa on pd.id_atributo = pa.id_atr' +
        'ibuto'
      
        '  left join atributos a on (pd.id_atributo = a.id_atributo) and ' +
        '(pd.id_valor = a.id_valor)'
      'where'
      '  p.id_producto = :id_producto'
      'order by'
      '  pa.ds_atributo,'
      '  a.ds_valor,'
      '  pd.id_valor'
      ''
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 291
    Top = 153
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object dsProductos: TDataSource
    DataSet = sqlProductos
    Left = 92
    Top = 78
  end
  object sqlIdProducto: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select p.id_producto'
      'from productos p, marcas m'
      'where (m.cd_marca = :cd_marca) and (m.id_marca = p.id_marca) and'
      '  (p.cd_producto = :cd_producto)')
    Params = <
      item
        DataType = ftString
        Name = 'cd_marca'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_producto'
        ParamType = ptInput
      end>
    Left = 397
    Top = 150
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_marca'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_producto'
        ParamType = ptInput
      end>
  end
  object sqlProductosOferta: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'SELECT distinct'
      '  s.id,'
      '  s.id_producto,'
      '  s.cd_color,'
      '  s.id_talla,'
      '  t.ds_talla,  '
      '  tt.ds_tipo_talla,'
      '  s.nm_pvp,'
      '  t.nm_orden,'
      '  s.nm_descuento_oferta nm_descuento,'
      
        '  round(s.nm_pvp * (1 - s.nm_descuento_oferta / 100),2) nm_preci' +
        'o_final,'
      '  p.f_actualizacion,'
      '  p.id_tipo_complemento,'
      
        '  if(p.nm_peso = 0,0,round(s.nm_pvp * (1 - s.nm_descuento_oferta' +
        ' / 100) * 1000 / p.nm_peso,2)) nm_precio_kg,'
      '  te.ds_temporada,'
      '  s.cd_color_fabricante'
      'FROM '
      '  stock s,'
      '  colores c,'
      '  tallas t,'
      '  tipos_tallas tt,'
      '  productos p,'
      '  temporadas te'
      'where '
      '  (s.id_producto = :id_producto) and'
      '  (s.nm_cantidad > 0) and'
      '  (s.id_talla = t.id_talla) and'
      '  (t.id_tipo_talla = tt.id_tipo_talla) and'
      '  (s.id_producto = p.id_producto) and'
      '  (s.id_temporada = te.id_temporada)'
      'order by nm_precio_final,te.nm_orden,s.cd_color,t.nm_orden'
      ''
      ''
      ' '
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 74
    Top = 335
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object sqlProductoEnOferta: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'SELECT id_producto'
      'FROM stock'
      'where (id_producto = :id_producto) and '
      '(nm_descuento_oferta >= :nm_descuento_oferta)')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_oferta'
        ParamType = ptInput
      end>
    Left = 385
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_oferta'
        ParamType = ptInput
      end>
  end
  object sqlTiposProducto: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from tipos_producto order by id_tipo_producto')
    Params = <>
    Left = 504
    Top = 219
  end
  object sqlTiposComplemento: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from tipos_complemento order by ds_tipo_complemento')
    Params = <>
    Left = 413
    Top = 279
  end
  object sqlMarcasTipoComplemento: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'SELECT distinct id_marca,id_tipo_complemento'
      'FROM productos'
      'order by id_marca,id_tipo_complemento')
    Params = <>
    Left = 317
    Top = 5
  end
  object htmlwBusquedaAvanzada: TPageProducer
    OnHTMLTag = htmlwBusquedaAvanzadaHTMLTag
    Left = 154
    Top = 243
  end
  object sqlTiposProdTiposComp: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'SELECT distinct id_tipo_producto,id_tipo_complemento'
      'FROM productos'
      'order by id_tipo_producto,id_tipo_complemento')
    Params = <>
    Left = 533
    Top = 18
  end
  object sqlTiposDepTiposComp: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'SELECT distinct id_tipo_deporte,id_tipo_complemento'
      'FROM productos'
      'order by id_tipo_deporte,id_tipo_complemento')
    Params = <>
    Left = 440
    Top = 46
  end
  object sqlTiposSexoTiposComp: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'SELECT distinct id_tipo_sexo,id_tipo_complemento'
      'FROM productos'
      'order by id_tipo_sexo,id_tipo_complemento')
    Params = <>
    Left = 336
    Top = 57
  end
  object sqlSexoProducto: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  ts.ds_tipo_sexo'
      'from'
      '  tipos_sexo ts,'
      '  productos p'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_tipo_sexo = ts.id_tipo_sexo)')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 155
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object htmlwProductosOfertas: TPageProducer
    OnHTMLTag = htmlwProductosOfertasHTMLTag
    Left = 158
    Top = 133
  end
  object htmlwProductosNovedades: TPageProducer
    OnHTMLTag = htmlwProductosNovedadesHTMLTag
    Left = 154
    Top = 196
  end
  object dsProductosOferta: TDataSource
    DataSet = sqlProductosOferta
    Left = 71
    Top = 386
  end
  object sqlCarrito: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select distinct'
      '  id_producto,'
      '  cd_color,'
      '  id_talla,'
      '  nm_cantidad'
      'from'
      '  carrito'
      'where'
      '  (id_cliente_web = :id_cliente_web) and'
      '  (id_producto = :id_producto) and'
      '  (cd_color = :id_color) and'
      '  (id_talla = :id_talla)'
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
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
    DataSource = dsProductosOferta
    Left = 165
    Top = 386
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
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
  object sqlAtributos: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  *'
      'from'
      '  atributos'
      'where'
      '  id_atributo = :id_atributo'
      'order by '
      '  ds_valor ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_atributo'
        ParamType = ptUnknown
      end>
    DataSource = dsProductosAtributosSolo
    Left = 298
    Top = 421
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_atributo'
        ParamType = ptUnknown
      end>
  end
  object sqlProductosAtributosSolo: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  *'
      'from'
      '  productos_atributos'
      'where'
      '  it_mostrar_busqueda = '#39'X'#39
      'order by'
      '  ds_atributo')
    Params = <>
    DataSource = dsProductosOferta
    Left = 294
    Top = 370
  end
  object dsProductosAtributosSolo: TDataSource
    DataSet = sqlProductosAtributosSolo
    Left = 399
    Top = 385
  end
  object sqlProductosDetalle: TZReadOnlyQuery
    Connection = dbRanning
    OnCalcFields = sqlProductosCalcFields
    SQL.Strings = (
      'select'
      '  concat('#39'cbAtr_'#39',id_atributo,'#39'_'#39',id_valor) as ds_avanzada'
      'from'
      '  productos_detalle'
      'where'
      '  id_producto = :id_producto'
      'order by'
      '  id_atributo,'
      '  id_valor')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsProductos
    Left = 78
    Top = 447
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
  end
  object sqlOpciones: TZReadOnlyQuery
    Connection = dbRanning
    Params = <>
    Left = 215
    Top = 17
  end
  object sqlFechaActualizacion: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      
        'select f_actualizacion from productos where id_producto = :id_pr' +
        'oducto')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 185
    Top = 447
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object sqlUltimosPares: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select cd_color,count(id_producto) nm_producto from stock'
      'where id_producto = :id_producto'
      'group by cd_color ')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 524
    Top = 362
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object sqlOfertas: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  p.it_novedad,'
      '  s.id_producto,'
      '  s.cd_color,'
      '  s.id_talla,'
      '  s.nm_descuento_oferta nm_descuento_stock,'
      '  o.nm_descuento nm_descuento_oferta,'
      
        '  round(s.nm_pvp * (1 - s.nm_descuento_oferta / 100),2) nm_preci' +
        'o_final_stock,'
      
        '  round(s.nm_pvp * (1 - o.nm_descuento / 100),2) nm_precio_final' +
        '_oferta,'
      
        '  if(p.nm_peso = 0,0,round(s.nm_pvp * (1 - s.nm_descuento_oferta' +
        ' / 100) * 1000 / p.nm_peso,2)) nm_precio_kg_stock,'
      
        '  if(p.nm_peso = 0,0,round(s.nm_pvp * (1 - o.nm_descuento / 100)' +
        ' * 1000 / p.nm_peso,2)) nm_precio_kg_oferta,'
      '  o.*'
      'from'
      '  ofertas o,'
      '  productos p,'
      '  stock s,'
      '  tallas t'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_producto = s.id_producto) and'
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
      '  ((curdate() between o.f_inicio and o.f_fin) or'
      '  ((o.f_inicio is null) and (o.f_fin is null)) or'
      '  ((o.f_inicio <= curdate()) and (o.f_fin is null)) or'
      '  ((o.f_fin >= curdate()) and (o.f_inicio is null)))'
      'order by'
      '  nm_precio_final_stock,'
      '  s.cd_color,'
      '  t.nm_orden'
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 282
    Top = 273
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object sqlDescuentoMaxOferta: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  max(o.nm_descuento) nm_desc_max'
      'from'
      '  ofertas o,'
      '  productos p,'
      '  stock s'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_producto = s.id_producto) and'
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
      '  ((curdate() between f_inicio and f_fin) or '
      '  ((f_inicio is null) and (f_fin is null)) or '
      '  ((f_inicio <= curdate()) and (f_fin is null)) or '
      '  ((f_fin >= curdate()) and (f_inicio is null)))')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 290
    Top = 318
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object dsOfertas: TDataSource
    DataSet = sqlOfertas
    Left = 340
    Top = 262
  end
  object htmlwIndexConsulta: TPageProducer
    OnHTMLTag = htmlwIndexConsultaHTMLTag
    Left = 33
    Top = 292
  end
  object sqlOfertaLanzamiento: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  p.it_novedad,'
      '  o.f_fin'
      'from'
      '  ofertas o,'
      '  productos p'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (o.id_producto = p.id_producto) and'
      '  (curdate() between o.f_inicio and o.f_fin)')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 279
    Top = 218
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
end
