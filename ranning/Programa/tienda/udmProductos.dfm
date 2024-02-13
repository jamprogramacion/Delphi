object dmProductos: TdmProductos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 238
  Top = 57
  Height = 696
  Width = 934
  object sqlProductos: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    AfterOpen = sqlProductosAfterOpen
    BeforeClose = sqlProductosBeforeClose
    AfterScroll = sqlProductosAfterScroll
    SQL.Strings = (
      'select'
      '  p.id_producto,'
      '  p.cd_producto cod_producto,'
      '  p.cd_producto,'
      '  p.ds_producto,'
      '  tp.ds_tipo_producto,'
      '  tc.ds_tipo_complemento,'
      '  td.ds_tipo_deporte,'
      '  ts.ds_tipo_sexo,'
      '  m.ds_marca,'
      '  p.it_activo,'
      '  p.id_marca,'
      '  p.id_tipo_deporte,'
      '  p.id_tipo_producto,'
      '  p.id_tipo_sexo,'
      '  p.nm_peso,'
      '  p.f_entrada,'
      '  p.it_novedad,'
      '  m.cd_marca,'
      '  p.f_actualizacion'
      'from'
      '  productos p,'
      '  tipos_producto tp,'
      '  tipos_complemento tc,'
      '  tipos_deporte td,'
      '  tipos_sexo ts,'
      '  marcas m'
      'where'
      '  (p.id_tipo_producto = tp.id_tipo_producto) and'
      '  (p.id_tipo_complemento = tc.id_tipo_complemento) and'
      '  (p.id_tipo_deporte = td.id_tipo_deporte) and'
      '  (p.id_tipo_sexo = ts.id_tipo_sexo) and'
      '  (p.id_marca = m.id_marca)'
      'order by'
      '  m.ds_marca,'
      '  cod_producto')
    Params = <>
    Left = 35
    Top = 16
    object sqlProductoscod_producto: TStringField
      DisplayLabel = 'Código'
      FieldName = 'cod_producto'
      Required = True
      Size = 25
    end
    object sqlProductoscd_producto: TStringField
      FieldName = 'cd_producto'
      Required = True
    end
    object sqlProductosds_producto: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'ds_producto'
      Required = True
      Size = 100
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
    object sqlProductosds_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
    object sqlProductosit_activo: TStringField
      DisplayLabel = 'Activo'
      FieldName = 'it_activo'
      Required = True
      Size = 1
    end
    object sqlProductosid_producto: TLargeintField
      FieldName = 'id_producto'
    end
    object sqlProductosid_marca: TLargeintField
      FieldName = 'id_marca'
      Required = True
    end
    object sqlProductosid_tipo_deporte: TLargeintField
      FieldName = 'id_tipo_deporte'
      Required = True
    end
    object sqlProductosid_tipo_producto: TLargeintField
      FieldName = 'id_tipo_producto'
      Required = True
    end
    object sqlProductosid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
      Required = True
    end
    object sqlProductosnm_peso: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'nm_peso'
    end
    object sqlProductosf_entrada: TDateField
      DisplayLabel = 'Fecha entrada'
      FieldName = 'f_entrada'
      Required = True
    end
    object sqlProductoscd_marca: TStringField
      FieldName = 'cd_marca'
      Required = True
      Size = 5
    end
    object sqlProductosit_novedad: TStringField
      DisplayLabel = 'Novedad'
      FieldName = 'it_novedad'
      Required = True
      Size = 1
    end
    object sqlProductosf_actualizacion: TDateField
      FieldName = 'f_actualizacion'
    end
  end
  object dsProductos: TDataSource
    DataSet = sqlProductos
    Left = 106
    Top = 17
  end
  object dsAltaProductos: TDataSource
    DataSet = sqlAltaProductos
    Left = 118
    Top = 80
  end
  object dsMarcas: TDataSource
    DataSet = sqlMarcas
    Left = 143
    Top = 374
  end
  object dsTiposSexo: TDataSource
    DataSet = sqlTiposSexo
    Left = 143
    Top = 277
  end
  object dsTiposDeporte: TDataSource
    DataSet = sqlTiposDeporte
    Left = 143
    Top = 231
  end
  object dsTiposComplemento: TDataSource
    DataSet = sqlTiposComplemento
    Left = 147
    Top = 185
  end
  object dsTiposProducto: TDataSource
    DataSet = sqlTiposProducto
    Left = 140
    Top = 134
  end
  object sqlTiposSexo: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from tipos_sexo order by id_tipo_sexo')
    Params = <>
    Left = 45
    Top = 275
    object sqlTiposSexoid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
    end
    object sqlTiposSexods_tipo_sexo: TStringField
      FieldName = 'ds_tipo_sexo'
      Required = True
      Size = 15
    end
  end
  object sqlTiposDeporte: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from tipos_deporte order by id_tipo_deporte')
    Params = <>
    Left = 43
    Top = 228
    object sqlTiposDeporteid_tipo_deporte: TLargeintField
      FieldName = 'id_tipo_deporte'
    end
    object sqlTiposDeporteds_imagen_cabecera: TStringField
      FieldName = 'ds_imagen_cabecera'
      Required = True
      Size = 255
    end
    object sqlTiposDeporteds_tipo_deporte: TStringField
      FieldName = 'ds_tipo_deporte'
      Required = True
      Size = 30
    end
    object sqlTiposDeporteit_activo: TStringField
      FieldName = 'it_activo'
      Required = True
      Size = 1
    end
  end
  object sqlTiposComplemento: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from tipos_complemento order by id_tipo_complemento')
    Params = <>
    Left = 41
    Top = 181
    object sqlTiposComplementoid_tipo_complemento: TLargeintField
      FieldName = 'id_tipo_complemento'
    end
    object sqlTiposComplementods_tipo_complemento: TStringField
      FieldName = 'ds_tipo_complemento'
      Required = True
      Size = 50
    end
  end
  object sqlTiposProducto: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from tipos_producto order by id_tipo_producto')
    Params = <>
    Left = 41
    Top = 131
    object sqlTiposProductoid_tipo_producto: TLargeintField
      FieldName = 'id_tipo_producto'
    end
    object sqlTiposProductods_tipo_producto: TStringField
      FieldName = 'ds_tipo_producto'
      Required = True
      Size = 30
    end
  end
  object sqlMarcas: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from marcas order by id_marca')
    Params = <>
    Left = 26
    Top = 375
    object sqlMarcasid_marca: TLargeintField
      FieldName = 'id_marca'
    end
    object sqlMarcascd_marca: TStringField
      FieldName = 'cd_marca'
      Required = True
      Size = 5
    end
    object sqlMarcasds_marca: TStringField
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
    object sqlMarcasid_pais: TLargeintField
      FieldName = 'id_pais'
      Required = True
    end
    object sqlMarcasds_web: TStringField
      FieldName = 'ds_web'
      Size = 255
    end
  end
  object sqlAltaProductosInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into productos'
      '  (cd_producto,'
      '  ds_producto,'
      '  id_tipo_producto,'
      '  id_tipo_complemento,'
      '  id_tipo_deporte,'
      '  id_tipo_sexo,'
      '  id_marca,'
      '  it_activo,'
      '  f_entrada,'
      '  it_novedad,'
      '  nm_peso,'
      '  observaciones,'
      '  cd_barras,'
      '  f_actualizacion)'
      'values'
      '  (:cd_producto,'
      '  :ds_producto,'
      '  :id_tipo_producto,'
      '  :id_tipo_complemento,'
      '  :id_tipo_deporte,'
      '  :id_tipo_sexo,'
      '  :id_marca,'
      '  :it_activo,'
      '  :f_entrada,'
      '  :it_novedad,'
      '  :nm_peso,'
      '  :observaciones,'
      '  :cd_barras,'
      '  :f_actualizacion);'
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_deporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_marca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_activo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_novedad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_peso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_barras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_actualizacion'
        ParamType = ptUnknown
      end>
    DataSource = dsAltaProductos
    Left = 225
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_deporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_marca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_activo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_novedad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_peso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_barras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_actualizacion'
        ParamType = ptUnknown
      end>
  end
  object sqlAltaProductosUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update productos set'
      '  cd_producto = :cd_producto,'
      '  ds_producto = :ds_producto,'
      '  id_tipo_producto = :id_tipo_producto,'
      '  id_tipo_complemento = :id_tipo_complemento,'
      '  id_tipo_deporte = :id_tipo_deporte,'
      '  id_tipo_sexo = :id_tipo_sexo,'
      '  id_marca = :id_marca,'
      '  it_activo = :it_activo,'
      '  f_entrada = :f_entrada,'
      '  it_novedad = :it_novedad,'
      '  nm_peso = :nm_peso,'
      '  observaciones = :observaciones,'
      '  cd_barras = :cd_barras,'
      '  f_actualizacion = now()'
      'where'
      '  id_producto = :id_producto;'
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_deporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_marca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_activo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_novedad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_peso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_barras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsAltaProductos
    Left = 309
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_deporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_marca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_activo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_novedad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_peso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_barras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
  end
  object sqlAltaProductos: TZQuery
    Connection = dmRanning.dbRanning
    AfterOpen = sqlAltaProductosAfterOpen
    CachedUpdates = True
    BeforePost = sqlAltaProductosBeforePost
    OnNewRecord = sqlAltaProductosNewRecord
    SQL.Strings = (
      'select'
      '  p.*,'
      '  tp.ds_tipo_producto,'
      '  tc.ds_tipo_complemento,'
      '  td.ds_tipo_deporte,'
      '  ts.ds_tipo_sexo,'
      '  m.ds_marca'
      'from'
      '  productos p,'
      '  tipos_producto tp,'
      '  tipos_complemento tc,'
      '  tipos_deporte td,'
      '  tipos_sexo ts,'
      '  marcas m'
      'where'
      '  (p.id_tipo_producto = tp.id_tipo_producto) and'
      '  (p.id_tipo_complemento = tc.id_tipo_complemento) and'
      '  (p.id_tipo_deporte = td.id_tipo_deporte) and'
      '  (p.id_tipo_sexo = ts.id_tipo_sexo) and'
      '  (p.id_marca = m.id_marca)'
      'for update')
    Params = <>
    Left = 35
    Top = 68
    object sqlAltaProductosid_producto: TLargeintField
      FieldName = 'id_producto'
    end
    object sqlAltaProductoscd_producto: TStringField
      DisplayLabel = 'Código'
      FieldName = 'cd_producto'
      Required = True
    end
    object sqlAltaProductosds_producto: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'ds_producto'
      Required = True
      Size = 100
    end
    object sqlAltaProductosid_tipo_producto: TLargeintField
      FieldName = 'id_tipo_producto'
      Required = True
    end
    object sqlAltaProductosid_tipo_deporte: TLargeintField
      FieldName = 'id_tipo_deporte'
      Required = True
    end
    object sqlAltaProductosid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
      Required = True
    end
    object sqlAltaProductosid_marca: TLargeintField
      FieldName = 'id_marca'
      Required = True
    end
    object sqlAltaProductosit_activo: TStringField
      DisplayLabel = 'Activo'
      FieldName = 'it_activo'
      Required = True
      Size = 1
    end
    object sqlAltaProductosf_entrada: TDateField
      DisplayLabel = 'Fecha entrada'
      FieldName = 'f_entrada'
      Required = True
    end
    object sqlAltaProductosobservaciones: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object sqlAltaProductoscd_barras: TStringField
      DisplayLabel = 'Código de barras'
      FieldName = 'cd_barras'
    end
    object sqlAltaProductosds_tipo_producto: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'ds_tipo_producto'
      Required = True
      Size = 30
    end
    object sqlAltaProductosds_tipo_complemento: TStringField
      DisplayLabel = 'Tipo complemento'
      FieldName = 'ds_tipo_complemento'
      Required = True
      Size = 50
    end
    object sqlAltaProductosds_tipo_deporte: TStringField
      DisplayLabel = 'Deporte'
      FieldName = 'ds_tipo_deporte'
      Required = True
      Size = 30
    end
    object sqlAltaProductosds_tipo_sexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'ds_tipo_sexo'
      Required = True
      Size = 15
    end
    object sqlAltaProductosds_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
    object sqlAltaProductosid_tipo_complemento: TLargeintField
      FieldName = 'id_tipo_complemento'
      Required = True
    end
    object sqlAltaProductosnm_peso: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'nm_peso'
    end
    object sqlAltaProductosit_novedad: TStringField
      DisplayLabel = 'Novedad'
      FieldName = 'it_novedad'
      Required = True
      Visible = False
      Size = 1
    end
    object sqlAltaProductosf_actualizacion: TDateTimeField
      DisplayLabel = 'Fecha actualización stock'
      FieldName = 'f_actualizacion'
    end
    object sqlAltaProductosnm_mult_puntos: TFloatField
      DisplayLabel = 'Multiplicador de puntos'
      FieldName = 'nm_mult_puntos'
      Required = True
    end
  end
  object sqlStock: TZQuery
    Connection = dmRanning.dbRanning
    AfterOpen = sqlStockAfterOpen
    AfterScroll = sqlStockAfterScroll
    OnCalcFields = sqlStockCalcFields
    CachedUpdates = True
    OnUpdateRecord = sqlStockUpdateRecord
    AfterInsert = sqlStockAfterInsert
    BeforePost = sqlStockBeforePost
    AfterPost = sqlStockAfterPost
    BeforeDelete = sqlStockBeforeDelete
    OnNewRecord = sqlStockNewRecord
    SQL.Strings = (
      'select distinct'
      '  s.*,'
      '  t.ds_talla,'
      '  t.nm_orden nm_orden_talla,'
      '  p.id_marca,'
      '  p.ds_producto,'
      '  p.f_actualizacion,'
      '  m.cd_marca,'
      '  p.cd_producto,'
      '  te.ds_temporada'
      'from'
      '  stock s,'
      '  tallas t,'
      '  productos p,'
      '  marcas m,'
      '  temporadas te'
      'where'
      '  (s.id_producto = :id_producto) and'
      '  (s.id_producto = p.id_producto) and'
      '  (s.id_talla = t.id_talla) and'
      '  (p.id_marca = m.id_marca) and'
      '  (s.id_temporada = te.id_temporada)'
      'order by'
      '  te.nm_orden,'
      '  s.cd_color,'
      '  nm_orden_talla'
      'for update'
      ''
      ''
      '')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    DataSource = dsProductos
    Left = 238
    Top = 138
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    object sqlStockid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlStockid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlStockf_entrada: TDateField
      DisplayLabel = 'Fecha entrada'
      FieldName = 'f_entrada'
      Required = True
    end
    object sqlStocknm_coste: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'nm_coste'
      Required = True
    end
    object sqlStocknm_iva: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlStocknm_pvp: TFloatField
      DisplayLabel = 'PVP'
      FieldName = 'nm_pvp'
      Required = True
    end
    object sqlStocknm_descuento_coste: TFloatField
      DisplayLabel = 'Desc coste'
      FieldName = 'nm_descuento_coste'
      Required = True
    end
    object sqlStocknm_portes: TFloatField
      DisplayLabel = 'Portes'
      FieldName = 'nm_portes'
      Required = True
    end
    object sqlStockds_talla: TStringField
      DisplayLabel = 'Talla'
      FieldName = 'ds_talla'
      Required = True
    end
    object sqlStockid_marca: TLargeintField
      FieldName = 'id_marca'
    end
    object sqlStockds_producto: TStringField
      FieldName = 'ds_producto'
      Size = 100
    end
    object sqlStockid: TLargeintField
      FieldName = 'id'
    end
    object sqlStockcd_color: TStringField
      DisplayLabel = 'Cod color'
      FieldName = 'cd_color'
      Size = 30
    end
    object sqlStockf_actualizacion: TDateField
      DisplayLabel = 'Fecha última actualización'
      FieldName = 'f_actualizacion'
    end
    object sqlStockcd_color_fabricante: TStringField
      DisplayLabel = 'Cod color marca'
      FieldName = 'cd_color_fabricante'
      Size = 50
    end
    object sqlStockcd_marca: TStringField
      FieldName = 'cd_marca'
      Size = 5
    end
    object sqlStockcd_producto: TStringField
      FieldName = 'cd_producto'
    end
    object sqlStocknm_orden_talla: TSmallintField
      FieldName = 'nm_orden_talla'
    end
    object sqlStockid_temporada: TLargeintField
      FieldName = 'id_temporada'
      Required = True
    end
    object sqlStockds_temporada: TStringField
      DisplayLabel = 'Temporada'
      FieldName = 'ds_temporada'
      Size = 50
    end
    object sqlStockds_color: TStringField
      DisplayLabel = 'Color'
      FieldKind = fkCalculated
      FieldName = 'ds_color'
      Size = 255
      Calculated = True
    end
    object sqlStocknm_cantidad: TLargeintField
      DisplayLabel = 'Cantidad'
      FieldName = 'nm_cantidad'
      Required = True
    end
    object sqlStockit_descuento_temporada: TStringField
      FieldName = 'it_descuento_temporada'
      Required = True
      Size = 1
    end
    object sqlStocknm_descuento_oferta: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'nm_descuento_oferta'
    end
  end
  object dsStock: TDataSource
    DataSet = sqlStock
    Left = 312
    Top = 142
  end
  object sqlProductosDetalle: TZQuery
    Connection = dmRanning.dbRanning
    BeforeOpen = sqlProductosDetalleBeforeOpen
    CachedUpdates = True
    OnUpdateRecord = sqlProductosDetalleUpdateRecord
    BeforePost = sqlProductosDetalleBeforePost
    SQL.Strings = (
      'select'
      '  pd.*,'
      '  a.ds_valor,'
      '  u.ds_unidad,'
      '  u.ds_simbolo'
      'from'
      '  atributos a,'
      '  productos_detalle pd'
      '  left join unidades u on pd.id_unidad = u.id_unidad'
      'where'
      '  (pd.id_producto = :id_producto) and'
      '  (pd.id_atributo = :id_atributo) and'
      '  (pd.id_atributo = a.id_atributo) and'
      '  (pd.id_valor = a.id_valor)'
      'order by'
      '  a.ds_valor'
      'for update'
      ' '
      ' ')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'id_atributo'
        ParamType = ptInput
      end>
    Left = 253
    Top = 190
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'id_atributo'
        ParamType = ptInput
      end>
    object sqlProductosDetalleid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlProductosDetalleid_atributo: TLargeintField
      FieldName = 'id_atributo'
      Required = True
    end
    object sqlProductosDetalleid_valor: TLargeintField
      FieldName = 'id_valor'
      Required = True
    end
    object sqlProductosDetalleid: TLargeintField
      FieldName = 'id'
    end
    object sqlProductosDetalleds_valor: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'ds_valor'
      Size = 100
    end
    object sqlProductosDetallenm_cantidad: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'nm_cantidad'
    end
    object sqlProductosDetalleid_unidad: TLargeintField
      FieldName = 'id_unidad'
    end
    object sqlProductosDetallenm_orden: TLargeintField
      FieldName = 'nm_orden'
      Required = True
    end
    object sqlProductosDetalleds_unidad: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ds_unidad'
      Size = 50
    end
    object sqlProductosDetalleds_simbolo: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ds_simbolo'
      Size = 10
    end
  end
  object dsProductosDetalle: TDataSource
    DataSet = sqlProductosDetalle
    Left = 346
    Top = 194
  end
  object dsDescuentos: TDataSource
    Left = 120
    Top = 424
  end
  object sqlStockInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into stock'
      '  (id_producto,'
      '  cd_color,'
      '  id_talla,'
      '  f_entrada,'
      '  nm_coste,'
      '  nm_iva,'
      '  nm_pvp,'
      '  nm_cantidad,'
      '  cd_color_fabricante,'
      '  nm_descuento_coste,'
      '  nm_portes,'
      '  nm_descuento_oferta,'
      '  id_temporada)'
      'values'
      '  (:id_producto,'
      '  :cd_color,'
      '  :id_talla,'
      '  :f_entrada,'
      '  :nm_coste,'
      '  :nm_iva,'
      '  :nm_pvp,'
      '  :nm_cantidad,'
      '  :cd_color_fabricante,'
      '  :nm_descuento_coste,'
      '  :nm_portes,'
      '  :nm_descuento_oferta,'
      '  :id_temporada);'
      ''
      ''
      ' ')
    Params = <
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
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_coste'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
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
        Name = 'cd_color_fabricante'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_coste'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_portes'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_oferta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_temporada'
        ParamType = ptUnknown
      end>
    DataSource = dsStock
    Left = 243
    Top = 283
    ParamData = <
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
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_coste'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
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
        Name = 'cd_color_fabricante'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_coste'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_portes'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_oferta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_temporada'
        ParamType = ptUnknown
      end>
  end
  object sqlStockUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update stock set'
      '  cd_color = :cd_color,'
      '  id_talla = :id_talla,'
      '  f_entrada = :f_entrada,'
      '  nm_coste = :nm_coste,'
      '  nm_iva = :nm_iva,'
      '  nm_pvp = :nm_pvp,'
      '  nm_cantidad = :nm_cantidad,'
      '  cd_color_fabricante = :cd_color_fabricante,'
      '  nm_descuento_coste = :nm_descuento_coste,'
      '  nm_portes = :nm_portes,'
      '  nm_descuento_oferta = :nm_descuento_oferta,'
      '  id_temporada = :id_temporada'
      'where'
      '  (id_producto = :id_producto) and'
      '  (cd_color = :cd_color_ant) and'
      '  (id_talla = :id_talla_ant) and'
      '  (f_entrada = :f_entrada_ant);'
      ''
      ''
      '')
    Params = <
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
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_coste'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
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
        Name = 'cd_color_fabricante'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_coste'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_portes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_oferta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_temporada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_color_ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'id_talla_ant'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'f_entrada_ant'
        ParamType = ptInput
      end>
    DataSource = dsStock
    Left = 323
    Top = 282
    ParamData = <
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
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_coste'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_iva'
        ParamType = ptUnknown
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
        Name = 'cd_color_fabricante'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento_coste'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nm_portes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_descuento_oferta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_temporada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_color_ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'id_talla_ant'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'f_entrada_ant'
        ParamType = ptInput
      end>
  end
  object sqlStockDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from stock'
      'where  '
      '  (id_producto = :id_producto) and'
      '  (cd_color = :cd_color) and'
      '  (id_talla = :id_talla) and'
      '  (f_entrada = :f_entrada);'
      ''
      '')
    Params = <
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
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end>
    DataSource = dsStock
    Left = 408
    Top = 256
    ParamData = <
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
        DataType = ftUnknown
        Name = 'f_entrada'
        ParamType = ptUnknown
      end>
  end
  object sqlTallas: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select t.*,tt.ds_tipo_talla from '
      'tallas t,tipos_tallas tt'
      'where (t.id_tipo_talla = tt.id_tipo_talla) and'
      '#where'
      
        'order by id_marca,id_tipo_producto,id_tipo_deporte,id_tipo_sexo,' +
        'nm_orden')
    Params = <>
    Left = 214
    Top = 324
  end
  object dsTallas: TDataSource
    DataSet = sqlTallas
    Left = 293
    Top = 324
  end
  object sqlColores: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from colores order by ds_color')
    Params = <>
    Left = 216
    Top = 373
    object sqlColoresid_color: TLargeintField
      FieldName = 'id_color'
    end
    object sqlColoresds_color: TStringField
      DisplayLabel = 'Color'
      FieldName = 'ds_color'
      Required = True
      Size = 50
    end
  end
  object dsColores: TDataSource
    DataSet = sqlColores
    Left = 292
    Top = 374
  end
  object sqlUltStock: TZQuery
    Connection = dmRanning.dbRanning
    OnCalcFields = sqlUltStockCalcFields
    CachedUpdates = True
    SQL.Strings = (
      'select'
      '  s.*,'
      '  t.ds_talla,'
      '  d.nm_descuento,'
      '  p.id_marca'
      'from'
      '  stock s,'
      '  tallas t,'
      '  descuentos d,'
      '  productos p'
      'where'
      '  (s.id_producto = :id_producto) and'
      '  (s.id_producto = p.id_producto) and'
      '  (s.id_talla = t.id_talla) and'
      '  (s.id_descuento_oferta = d.id_descuento)'
      'for update'
      ' ')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 400
    Top = 143
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    object LargeintField1: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object LargeintField3: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object DateField1: TDateField
      DisplayLabel = 'Fecha entrada'
      FieldName = 'f_entrada'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Albarán'
      FieldName = 'cd_albaran'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Precio coste'
      FieldName = 'nm_coste'
      Required = True
    end
    object FloatField2: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'nm_iva'
      Required = True
    end
    object FloatField3: TFloatField
      DisplayLabel = 'PVP'
      FieldName = 'nm_pvp'
      Required = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'nm_cantidad'
      Required = True
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Desc coste'
      FieldName = 'nm_descuento_coste'
      Required = True
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Portes'
      FieldName = 'nm_portes'
      Required = True
    end
    object LargeintField4: TLargeintField
      DisplayLabel = 'Desc oferta'
      FieldName = 'id_descuento_oferta'
      Required = True
    end
    object StringField2: TStringField
      DisplayLabel = 'Cod color'
      FieldName = 'cd_color_fabricante'
      Required = True
      Size = 10
    end
    object StringField3: TStringField
      DisplayLabel = 'Color'
      FieldKind = fkCalculated
      FieldName = 'ds_color'
      Required = True
      Size = 255
      Calculated = True
    end
    object StringField4: TStringField
      DisplayLabel = 'Talla'
      FieldName = 'ds_talla'
      Required = True
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Desc oferta'
      FieldName = 'nm_descuento'
      Required = True
    end
    object LargeintField5: TLargeintField
      FieldName = 'id_marca'
    end
    object sqlUltStockid: TLargeintField
      FieldName = 'id'
    end
    object sqlUltStockcd_color: TStringField
      FieldName = 'cd_color'
      Required = True
      Size = 30
    end
    object sqlUltStockid_temporada: TLargeintField
      FieldName = 'id_temporada'
      Required = True
    end
  end
  object sqlImagenProducto: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      
        '  concat(m.cd_marca,'#39'\\'#39',m.cd_marca,'#39'_'#39',p.cd_producto,'#39'_'#39',:cd_co' +
        'lor,'#39'.gif'#39') ds_imagen'
      'from'
      '  marcas m,'
      '  productos p'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (m.id_marca = p.id_marca)'
      '  ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 308
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    object sqlImagenProductods_imagen: TStringField
      FieldName = 'ds_imagen'
      Required = True
      Size = 41
    end
  end
  object sqlMarcasTipoProductoMargen: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      
        'select * from marcas_tipo_producto_margen order by id_marca,id_t' +
        'ipo_producto')
    Params = <>
    Left = 394
    Top = 307
    object sqlMarcasTipoProductoMargenid_marca: TLargeintField
      FieldName = 'id_marca'
      Required = True
    end
    object sqlMarcasTipoProductoMargenid_tipo_producto: TLargeintField
      FieldName = 'id_tipo_producto'
      Required = True
    end
    object sqlMarcasTipoProductoMargenid_margen: TFloatField
      FieldName = 'nm_margen'
      Required = True
    end
  end
  object sqlAltaProductosDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from '
      '  productos '
      'where'
      '  id_producto = :id_producto;'
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsAltaProductos
    Left = 386
    Top = 95
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
  end
  object sqlProductosAtributos: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    AfterScroll = sqlProductosAtributosAfterScroll
    SQL.Strings = (
      'select * from productos_atributos order by ds_atributo')
    Params = <>
    Left = 221
    Top = 421
    object sqlProductosAtributosid_atributo: TLargeintField
      FieldName = 'id_atributo'
    end
    object sqlProductosAtributosds_atributo: TStringField
      DisplayLabel = 'Característica'
      FieldName = 'ds_atributo'
      Required = True
      Size = 50
    end
  end
  object dsProductosAtributos: TDataSource
    DataSet = sqlProductosAtributos
    Left = 319
    Top = 432
  end
  object dsAtributo: TDataSource
    DataSet = sqlAtributo
    Left = 421
    Top = 368
  end
  object sqlAtributo: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from atributos'
      'where id_atributo = :id_atributo'
      'order by ds_valor')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_atributo'
        ParamType = ptUnknown
      end>
    DataSource = dsProductosAtributos
    Left = 361
    Top = 347
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_atributo'
        ParamType = ptUnknown
      end>
    object sqlAtributoid_atributo: TLargeintField
      FieldName = 'id_atributo'
    end
    object sqlAtributoid_valor: TLargeintField
      FieldName = 'id_valor'
      Required = True
    end
    object sqlAtributods_valor: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'ds_valor'
      Required = True
      Size = 100
    end
  end
  object sqlNumAtributos: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select '
      '  count(id_producto) nm_atributos '
      'from '
      '  productos_detalle'
      'where'
      '  id_producto = :id_producto')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    DataSource = dsProductos
    Left = 462
    Top = 155
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    object sqlNumAtributosnm_atributos: TLargeintField
      FieldName = 'nm_atributos'
      Required = True
    end
  end
  object sqlDatosProducto: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    AfterOpen = sqlProductosAfterOpen
    BeforeClose = sqlProductosBeforeClose
    AfterScroll = sqlProductosAfterScroll
    OnCalcFields = sqlDatosProductoCalcFields
    SQL.Strings = (
      'select distinct'
      '  p.id_producto,'
      '  s.id_talla,'
      '  s.nm_pvp,'
      '  s.nm_iva,'
      
        '  round(s.nm_pvp * (1 - s.nm_descuento_oferta / 100),2) nm_pvp_f' +
        'inal,'
      '  s.cd_color,'
      '  t.ds_talla,'
      '  t.nm_orden nm_orden_talla,'
      '  m.ds_marca,'
      '  concat(m.cd_marca,p.cd_producto) cod_producto,'
      '  p.ds_producto,'
      '  s.nm_descuento_oferta nm_descuento'
      'from'
      '  stock s,'
      '  tallas t,'
      '  productos p,'
      '  marcas m'
      'where'
      '  (s.id_producto = :id_producto) and'
      '  (s.id_producto = p.id_producto) and'
      '  (s.id_talla = t.id_talla) and'
      '  (m.id_marca = p.id_marca)'
      'order by'
      '  p.id_producto,'
      '  s.cd_color,'
      '  nm_orden_talla'
      ''
      ' ')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 205
    Top = 16
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    object sqlDatosProductoid_producto: TLargeintField
      FieldName = 'id_producto'
    end
    object sqlDatosProductoid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlDatosProductonm_pvp_final: TFloatField
      FieldName = 'nm_pvp_final'
    end
    object sqlDatosProductods_talla: TStringField
      FieldName = 'ds_talla'
      Required = True
    end
    object sqlDatosProductonm_descuento: TFloatField
      FieldName = 'nm_descuento'
      Required = True
    end
    object sqlDatosProductods_producto: TStringField
      FieldName = 'ds_producto'
      Required = True
      Size = 100
    end
    object sqlDatosProductocod_producto: TStringField
      FieldName = 'cod_producto'
      Required = True
      Size = 25
    end
    object sqlDatosProductonm_pvp: TFloatField
      FieldName = 'nm_pvp'
      Required = True
    end
    object sqlDatosProductods_marca: TStringField
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
    object sqlDatosProductocd_color: TStringField
      FieldName = 'cd_color'
      Required = True
      Size = 30
    end
    object sqlDatosProductonm_orden_talla: TSmallintField
      FieldName = 'nm_orden_talla'
      Required = True
    end
    object sqlDatosProductonm_iva: TFloatField
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlDatosProductods_color: TStringField
      DisplayLabel = 'Color'
      FieldKind = fkCalculated
      FieldName = 'ds_color'
      Size = 255
      Calculated = True
    end
    object sqlDatosProductods_color_completo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_color_completo'
      Size = 255
      Calculated = True
    end
  end
  object sqlEtiquetas: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select distinct'
      '  cd_color,'
      '  cd_color_fabricante'
      'from'
      '  stock'
      'where'
      '  id_producto = :id_producto'
      ' '
      ' ')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
    Left = 381
    Top = 6
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_producto'
        ParamType = ptInput
      end>
  end
  object sqlActualizaFActualizacion: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update productos set'
      '  f_actualizacion = curdate()'
      'where'
      '  id_producto = :id_producto'
      ''
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsStock
    Left = 452
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
  end
  object sqlFActualizacion: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      
        'select f_actualizacion from productos where id_producto = :id_pr' +
        'oducto')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsStock
    Left = 442
    Top = 414
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
  end
  object sqlTemporadas: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from temporadas order by nm_orden')
    Params = <>
    Left = 25
    Top = 329
    object sqlTemporadasid_temporada: TLargeintField
      FieldName = 'id_temporada'
    end
    object sqlTemporadasds_temporada: TStringField
      FieldName = 'ds_temporada'
      Required = True
      Size = 50
    end
    object sqlTemporadasnm_orden: TLargeintField
      FieldName = 'nm_orden'
      Required = True
    end
  end
  object dsTemporadas: TDataSource
    DataSet = sqlTemporadas
    Left = 102
    Top = 333
  end
  object sqlCopiaAtr: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    Params = <>
    Left = 480
    Top = 369
  end
  object sqlProductosAccess: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  m.cd_marca,'
      '  p.cd_producto,'
      '  ucase(p.ds_producto) ds_producto,'
      '  ucase(s.cd_color_fabricante) cd_color_fabricante,'
      '  curdate() f_entrada,'
      '  s.nm_coste,'
      '  s.id_talla,'
      '  t.ds_talla,'
      '  s.nm_cantidad,'
      '  s.nm_iva,'
      '  s.nm_iva nm_iva2,'
      '  round(s.nm_pvp / s.nm_coste - 1,2) nm_margen_real,'
      '  s.nm_pvp,'
      '  s.cd_color,'
      '  p.nm_mult_puntos'
      'from'
      '  marcas m,'
      '  productos p,'
      '  stock s,'
      '  tallas t'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_marca = m.id_marca) and'
      '  (p.id_producto = s.id_producto) and'
      '  (s.id_talla = t.id_talla)'
      'order by'
      '  s.cd_color_fabricante,'
      '  t.nm_orden')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsProductos
    Left = 38
    Top = 489
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    object sqlProductosAccesscd_marca: TStringField
      FieldName = 'cd_marca'
      Required = True
      Size = 5
    end
    object sqlProductosAccesscd_producto: TStringField
      DisplayLabel = 'Código'
      FieldName = 'cd_producto'
      Required = True
    end
    object sqlProductosAccessds_producto: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'ds_producto'
      Required = True
      Size = 100
    end
    object sqlProductosAccesscd_color_fabricante: TStringField
      DisplayLabel = 'Color'
      FieldName = 'cd_color_fabricante'
      Size = 50
    end
    object sqlProductosAccessf_entrada: TDateField
      FieldName = 'f_entrada'
      Required = True
    end
    object sqlProductosAccessnm_coste: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'nm_coste'
      Required = True
    end
    object sqlProductosAccessid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlProductosAccessds_talla: TStringField
      DisplayLabel = 'Talla'
      FieldName = 'ds_talla'
      Required = True
    end
    object sqlProductosAccessnm_iva: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlProductosAccessnm_margen_real: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'nm_margen_real'
    end
    object sqlProductosAccessnm_pvp: TFloatField
      DisplayLabel = 'PVP'
      FieldName = 'nm_pvp'
      Required = True
    end
    object sqlProductosAccessnm_iva2: TFloatField
      FieldName = 'nm_iva2'
      Required = True
    end
    object sqlProductosAccesscd_color: TStringField
      FieldName = 'cd_color'
      Required = True
      Size = 30
    end
    object sqlProductosAccessnm_cantidad: TLargeintField
      DisplayLabel = 'Uds.'
      FieldName = 'nm_cantidad'
      Required = True
    end
    object sqlProductosAccessnm_mult_puntos: TFloatField
      FieldName = 'nm_mult_puntos'
      Required = True
    end
  end
  object dsProductosAccess: TDataSource
    DataSet = sqlProductosAccess
    Left = 136
    Top = 492
  end
  object sqlTipoProducto: TADOQuery
    Connection = dmRanning.dbAccess
    Parameters = <>
    SQL.Strings = (
      'select'
      '  tipopro,'
      '  descripcion'
      'from'
      '  [tipo producto]'
      'order by'
      '  descripcion')
    Left = 231
    Top = 492
    object sqlTipoProductotipopro: TIntegerField
      FieldName = 'tipopro'
    end
    object sqlTipoProductodescripcion: TWideStringField
      FieldName = 'descripcion'
      Size = 100
    end
  end
  object sqlSexo: TADOQuery
    Connection = dmRanning.dbAccess
    Parameters = <>
    SQL.Strings = (
      'select * from sexo order by sexo_prod')
    Left = 363
    Top = 493
    object sqlSexoSEXO_PROD: TFloatField
      FieldName = 'SEXO_PROD'
    end
    object sqlSexoSEXO_DES: TWideStringField
      FieldName = 'SEXO_DES'
      Size = 50
    end
  end
  object sqlProveedor: TADOQuery
    Connection = dmRanning.dbAccess
    Parameters = <>
    SQL.Strings = (
      'select'
      '  ideprov,'
      '  proveedor'
      'from'
      '  proveedor'
      'order by'
      '  proveedor')
    Left = 484
    Top = 494
    object sqlProveedorideprov: TIntegerField
      FieldName = 'ideprov'
    end
    object sqlProveedorproveedor: TWideStringField
      FieldName = 'proveedor'
      Size = 50
    end
  end
  object dsTipoProducto: TDataSource
    DataSet = sqlTipoProducto
    Left = 301
    Top = 483
  end
  object dsSexo: TDataSource
    DataSet = sqlSexo
    Left = 407
    Top = 488
  end
  object dsProveedor: TDataSource
    DataSet = sqlProveedor
    Left = 546
    Top = 487
  end
  object sqlCodigosAccess: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select distinct'
      
        '  if(:color = 0,concat(:prefijo,p.cd_producto),concat(:prefijo,p' +
        '.cd_producto,:prefijo_color,ucase(s.cd_color_fabricante))) idepr' +
        'o,'
      '  s.cd_color,'
      '  s.id_talla'
      'from'
      '  productos p,'
      '  stock s'
      'where'
      '  (p.id_producto = :id_producto) and'
      '  (p.id_producto = s.id_producto)'
      'order by'
      '  p.cd_producto,'
      '  s.cd_color_fabricante')
    Params = <
      item
        DataType = ftInteger
        Name = 'color'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'prefijo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'prefijo_color'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsProductos
    Left = 534
    Top = 428
    ParamData = <
      item
        DataType = ftInteger
        Name = 'color'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'prefijo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'prefijo_color'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    object sqlCodigosAccessidepro: TStringField
      FieldName = 'idepro'
      Size = 70
    end
    object sqlCodigosAccesscd_color: TStringField
      FieldName = 'cd_color'
      Required = True
      Size = 30
    end
    object sqlCodigosAccessid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
  end
  object sqlStockinInsert: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsProductosAccess
    Parameters = <
      item
        Name = 'idepro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'cd_color_fabricante'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'f_entrada'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nm_coste'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'talla'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'cantidad'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'insert into stockin'
      '  (idepro,'
      '  color,'
      '  fechain,'
      '  costebru,'
      '  talla,'
      '  cantidad)'
      'values'
      '  (:idepro,'
      '  :cd_color_fabricante,'
      '  :f_entrada,'
      '  :nm_coste,'
      '  :talla,'
      '  :cantidad)')
    Left = 535
    Top = 290
  end
  object sqlProductosAccessInsert: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsProductosAccess
    Parameters = <
      item
        Name = 'idepro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ds_producto'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'tipopro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'sex_prod'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nm_iva'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nm_iva2'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ideprov'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'f_entrada'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nm_mult_puntos'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'insert into productos'
      '  (idepro,'
      '  producto,'
      '  tipopro,'
      '  sex_prod,'
      '  iva,'
      '  ivacobrado,'
      '  ideprov,'
      '  [fecha entrada],'
      '  puntos)'
      'values'
      '  (:idepro,'
      '  :ds_producto,'
      '  :tipopro,'
      '  :sex_prod,'
      '  :nm_iva / 100,'
      '  :nm_iva2 / 100,'
      '  :ideprov,'
      '  :f_entrada,'
      '  :nm_mult_puntos)')
    Left = 537
    Top = 241
  end
  object sqlPreciosInsert: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsProductosAccess
    Parameters = <
      item
        Name = 'idepro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nm_margen_real'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'f_entrada'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nm_pvp'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'insert into precios'
      '  (idepro,'
      '  margen,'
      '  fechactu,'
      '  pvprec)'
      'values'
      '  (:idepro,'
      '  :nm_margen_real,'
      '  :f_entrada,'
      '  :nm_pvp)')
    Left = 547
    Top = 337
  end
  object sqlProductoAccessExiste: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsProductosAccess
    Parameters = <
      item
        Name = 'idepro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select'
      '  count(idepro) as nm_idepro'
      'from'
      '  productos'
      'where'
      '  idepro = :idepro'
      'group by'
      '  idepro')
    Left = 537
    Top = 188
  end
  object sqlPrecioAccessOK: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsProductosAccess
    Parameters = <
      item
        Name = 'idepro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'f_entrada'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select'
      '  count(idepro) as nm_idepro'
      'from'
      '  precios'
      'where'
      '  (idepro = :idepro) and'
      '  (fechactu >= :f_entrada)'
      'group by'
      '  idepro')
    Left = 539
    Top = 140
  end
  object sqlPreciosUpdate: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsProductosAccess
    Parameters = <
      item
        Name = 'nm_margen_real'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'f_entrada'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'nm_pvp'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idepro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'update precios set'
      '  margen = :nm_margen_real,'
      '  fechactu = :f_entrada,'
      '  pvprec = :nm_pvp'
      'where'
      '  idepro = :idepro')
    Left = 550
    Top = 383
  end
  object sqlOfertas: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
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
      '  t.nm_orden')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    DataSource = dsProductos
    Left = 396
    Top = 53
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_producto'
        ParamType = ptUnknown
      end>
    object sqlOfertasid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlOfertascd_color: TStringField
      FieldName = 'cd_color'
      Required = True
      Size = 30
    end
    object sqlOfertasid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlOfertasnm_descuento_stock: TFloatField
      FieldName = 'nm_descuento_stock'
      Required = True
    end
    object sqlOfertasnm_descuento_oferta: TFloatField
      FieldName = 'nm_descuento_oferta'
      Required = True
    end
    object sqlOfertasnm_precio_final_stock: TFloatField
      FieldName = 'nm_precio_final_stock'
    end
    object sqlOfertasnm_precio_final_oferta: TFloatField
      FieldName = 'nm_precio_final_oferta'
    end
    object sqlOfertasnm_precio_kg_stock: TFloatField
      FieldName = 'nm_precio_kg_stock'
    end
    object sqlOfertasnm_precio_kg_oferta: TFloatField
      FieldName = 'nm_precio_kg_oferta'
    end
    object sqlOfertasid_oferta: TLargeintField
      FieldName = 'id_oferta'
    end
    object sqlOfertasid_producto_1: TLargeintField
      FieldName = 'id_producto_1'
      Required = True
    end
    object sqlOfertasid_tipo_producto: TLargeintField
      FieldName = 'id_tipo_producto'
      Required = True
    end
    object sqlOfertasid_tipo_complemento: TLargeintField
      FieldName = 'id_tipo_complemento'
      Required = True
    end
    object sqlOfertasid_tipo_deporte: TLargeintField
      FieldName = 'id_tipo_deporte'
      Required = True
    end
    object sqlOfertasid_temporada: TIntegerField
      FieldName = 'id_temporada'
      Required = True
    end
    object sqlOfertasid_marca: TLargeintField
      FieldName = 'id_marca'
      Required = True
    end
    object sqlOfertasid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
      Required = True
    end
    object sqlOfertasf_inicio: TDateField
      FieldName = 'f_inicio'
    end
    object sqlOfertasf_fin: TDateField
      FieldName = 'f_fin'
    end
    object sqlOfertasds_oferta: TStringField
      FieldName = 'ds_oferta'
      Size = 255
    end
    object sqlOfertasnm_descuento: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'nm_descuento'
    end
  end
  object sqlTipoComplemento: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    BeforePost = sqlTipoComplementoBeforePost
    SQL.Strings = (
      'select * from tipos_complemento'
      'order by ds_tipo_complemento'
      'for update')
    Params = <>
    Left = 463
    Top = 7
    object sqlTipoComplementoid_tipo_complemento: TLargeintField
      FieldName = 'id_tipo_complemento'
    end
    object sqlTipoComplementods_tipo_complemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'ds_tipo_complemento'
      Required = True
      Size = 50
    end
  end
  object dsTipoComplemento: TDataSource
    DataSet = sqlTipoComplemento
    Left = 558
    Top = 20
  end
  object sqlTipoComplementoInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into tipos_complemento'
      '  (ds_tipo_complemento)'
      'values'
      '  (:ds_tipo_complemento)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_tipo_complemento'
        ParamType = ptUnknown
      end>
    DataSource = dsTipoComplemento
    Left = 470
    Top = 69
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_tipo_complemento'
        ParamType = ptUnknown
      end>
  end
  object sqlTipoComplementoUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update tipos_complemento set '
      '  ds_tipo_complemento = :ds_tipo_complemento'
      'where'
      '  id_tipo_complemento = :id_tipo_complemento')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_tipo_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_complemento'
        ParamType = ptUnknown
      end>
    DataSource = dsTipoComplemento
    Left = 557
    Top = 81
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_tipo_complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_complemento'
        ParamType = ptUnknown
      end>
  end
  object sqlUnidades: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    SQL.Strings = (
      'select * from unidades order by ds_unidad')
    Params = <>
    Left = 199
    Top = 245
    object sqlUnidadesid_unidad: TLargeintField
      FieldName = 'id_unidad'
    end
    object sqlUnidadesds_unidad: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ds_unidad'
      Required = True
      Size = 50
    end
    object sqlUnidadesds_simbolo: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ds_simbolo'
      Required = True
      Size = 10
    end
    object sqlUnidadesid_unidad_principal: TLargeintField
      FieldName = 'id_unidad_principal'
      Required = True
    end
    object sqlUnidadesnm_multiplicador: TFloatField
      FieldName = 'nm_multiplicador'
      Required = True
    end
  end
  object dsUnidades: TDataSource
    DataSet = sqlUnidades
    Left = 258
    Top = 240
  end
  object sqlProductosDetalleUpdate: TZQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update productos_detalle set'
      '  nm_cantidad = :nm_cantidad,'
      '  id_unidad = :id_unidad'
      'where'
      '  id = :id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_unidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = dsProductosDetalle
    Left = 320
    Top = 238
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nm_cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_unidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object LargeintField2: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object LargeintField6: TLargeintField
      FieldName = 'id_atributo'
      Required = True
    end
    object LargeintField7: TLargeintField
      FieldName = 'id_valor'
      Required = True
    end
    object LargeintField8: TLargeintField
      FieldName = 'id'
    end
    object StringField5: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'ds_valor'
      Size = 100
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'nm_cantidad'
    end
    object LargeintField9: TLargeintField
      FieldName = 'id_unidad'
    end
    object LargeintField10: TLargeintField
      FieldName = 'nm_orden'
      Required = True
    end
    object StringField6: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ds_unidad'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ds_simbolo'
      Size = 10
    end
  end
  object sqlPedidosMarca: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  p.*,'
      '  t.ds_temporada,'
      '  m.ds_marca'
      'from'
      '  pedidos p,'
      '  temporadas t,'
      '  marcas m'
      'where'
      '  (p.id_marca = m.id_marca) and'
      '  (p.id_temporada = t.id_temporada) and'
      '  (p.id_temporada = :id_temporada) and'
      '  (p.id_marca = :id_marca)'
      'order by'
      '  t.nm_orden')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_temporada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_marca'
        ParamType = ptUnknown
      end>
    DataSource = dsStock
    Left = 41
    Top = 543
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_temporada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_marca'
        ParamType = ptUnknown
      end>
    object sqlPedidosMarcaid_pedido: TLargeintField
      FieldName = 'id_pedido'
    end
    object sqlPedidosMarcads_pedido: TStringField
      DisplayLabel = 'Pedido'
      FieldName = 'ds_pedido'
      Required = True
      Size = 100
    end
    object sqlPedidosMarcaid_temporada: TLargeintField
      FieldName = 'id_temporada'
      Required = True
    end
    object sqlPedidosMarcaid_marca: TLargeintField
      FieldName = 'id_marca'
      Required = True
    end
    object sqlPedidosMarcaf_entrada: TDateField
      DisplayLabel = 'F. Entrada'
      FieldName = 'f_entrada'
      Required = True
    end
    object sqlPedidosMarcaobservaciones: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object sqlPedidosMarcads_temporada: TStringField
      DisplayLabel = 'Temporada'
      FieldName = 'ds_temporada'
      Required = True
      Size = 50
    end
    object sqlPedidosMarcads_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
  end
  object sqlPuntosUpdate: TADOQuery
    Connection = dmRanning.dbAccess
    DataSource = dsProductosAccess
    Parameters = <
      item
        Name = 'nm_mult_puntos'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idepro'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'update productos set'
      '  puntos = :nm_mult_puntos'
      'where'
      '  idepro = :idepro')
    Left = 620
    Top = 408
  end
end
