object dmDirecciones: TdmDirecciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 219
  Top = 157
  Height = 480
  Width = 696
  object dsProvincias: TDataSource
    DataSet = sqlProvincias
    Left = 24
    Top = 64
  end
  object dsMunicipios: TDataSource
    DataSet = sqlMunicipios
    Left = 135
    Top = 60
  end
  object sqlProvincias: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from provincias order by ds_provincia')
    Params = <>
    Left = 30
    Top = 13
    object sqlProvinciasid_autonomia: TStringField
      FieldName = 'id_autonomia'
      Required = True
      Size = 2
    end
    object sqlProvinciasid_provincia: TStringField
      DisplayLabel = 'Cod provincia'
      FieldName = 'id_provincia'
      Required = True
      Size = 2
    end
    object sqlProvinciasds_provincia: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'ds_provincia'
      Required = True
      Size = 30
    end
    object sqlProvinciasds_matricula: TStringField
      DisplayLabel = 'Matrícula'
      FieldName = 'ds_matricula'
      Required = True
      Size = 2
    end
  end
  object sqlMunicipios: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      
        'select * from municipios where id_provincia = :id_provincia orde' +
        'r by ds_municipio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end>
    DataSource = dsProvincias
    Left = 133
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end>
    object sqlMunicipiosid_provincia: TStringField
      FieldName = 'id_provincia'
      Required = True
      Size = 2
    end
    object sqlMunicipiosid_municipio: TStringField
      DisplayLabel = 'Cod municipio'
      FieldName = 'id_municipio'
      Required = True
      Size = 5
    end
    object sqlMunicipiosds_municipio: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'ds_municipio'
      Required = True
      Size = 100
    end
    object sqlMunicipiosds_cp: TStringField
      DisplayLabel = 'CP'
      FieldName = 'ds_cp'
      Size = 5
    end
    object sqlMunicipiosid: TLargeintField
      FieldName = 'id'
    end
  end
  object sqlTiposVia: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from tipos_vial order by ds_tipo_via')
    Params = <>
    Left = 263
    Top = 17
    object sqlTiposViaid_tipo_via: TStringField
      DisplayLabel = 'Cod tipo vía'
      FieldName = 'id_tipo_via'
      Required = True
      Size = 5
    end
    object sqlTiposViads_tipo_via: TStringField
      DisplayLabel = 'Tipo vía'
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
  end
  object dsTiposVia: TDataSource
    DataSet = sqlTiposVia
    Left = 255
    Top = 68
  end
  object sqlMunicipiosUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update municipios'
      '  set ds_cp = :cp'
      'where '
      '  (id_provincia = :id_provincia) and'
      '  (id_municipio = :id_municipio)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cp'
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
      end>
    DataSource = dsMunicipios
    Left = 139
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cp'
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
      end>
  end
  object dsDirecciones: TDataSource
    DataSet = sqlDirecciones
    Left = 352
    Top = 69
  end
  object sqlDirecciones: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    OnUpdateRecord = sqlDireccionesUpdateRecord
    BeforePost = sqlDireccionesBeforePost
    BeforeDelete = sqlDireccionesBeforeDelete
    SQL.Strings = (
      'select'
      '  d.*,'
      '  p.ds_provincia,'
      '  ifnull(m.ds_municipio,d.ds_municipio) municipio,'
      '  tv.ds_tipo_via,'
      
        '  concat(d.id_tipo_via,'#39' '#39',d.ds_nombre_via,'#39' '#39',d.ds_numero,'#39', '#39',' +
        'd.ds_resto_direccion,'#39'. '#39',d.ds_cp,'#39' - '#39',ifnull(m.ds_municipio,d.' +
        'ds_municipio),'#39' ('#39',p.ds_provincia,'#39')'#39') ds_direccion'
      'from'
      '  direcciones d'
      '  left join provincias p on d.id_provincia = p.id_provincia'
      
        '  left join municipios m on (d.id_provincia = m.id_provincia) an' +
        'd (d.id_municipio = m.id_municipio)'
      '  left join tipos_vial tv on d.id_tipo_via = tv.id_tipo_via'
      'for update'
      ' '
      ' ')
    Params = <>
    Left = 353
    Top = 24
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
      DisplayLabel = 'Municipio'
      FieldName = 'ds_municipio'
      Size = 100
    end
    object sqlDireccionesid_tipo_via: TStringField
      DisplayLabel = 'Tipo vía'
      FieldName = 'id_tipo_via'
      Size = 5
    end
    object sqlDireccionesds_nombre_via: TStringField
      DisplayLabel = 'Vía'
      FieldName = 'ds_nombre_via'
      Size = 50
    end
    object sqlDireccionesds_numero: TStringField
      DisplayLabel = 'Número'
      FieldName = 'ds_numero'
      Size = 5
    end
    object sqlDireccionesds_cp: TStringField
      DisplayLabel = 'CP'
      FieldName = 'ds_cp'
      Size = 5
    end
    object sqlDireccionesds_cp_extranjero: TStringField
      DisplayLabel = 'CP extranjero'
      FieldName = 'ds_cp_extranjero'
      Size = 10
    end
    object sqlDireccionesds_resto_direccion: TStringField
      DisplayLabel = 'Resto dirección'
      FieldName = 'ds_resto_direccion'
      Size = 100
    end
    object sqlDireccionesds_provincia: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'ds_provincia'
      Required = True
      Size = 30
    end
    object sqlDireccionesmunicipio: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'municipio'
      Size = 100
    end
    object sqlDireccionesds_tipo_via: TStringField
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
    object sqlDireccionesds_direccion: TStringField
      DisplayLabel = 'Dirección completa'
      FieldName = 'ds_direccion'
      Size = 307
    end
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
      '  ds_cp_extranjero,'
      '  ds_resto_direccion)'
      'values'
      '  (:id_provincia,'
      '  :id_municipio,'
      '  :ds_municipio,'
      '  :id_tipo_via,'
      '  :ds_nombre_via,'
      '  :ds_numero,'
      '  :ds_cp,'
      '  :ds_cp_extranjero,'
      '  :ds_resto_direccion)'
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
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end>
    DataSource = dsDirecciones
    Left = 365
    Top = 205
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
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Cod tipo vía'
      FieldName = 'id_tipo_via'
      Required = True
      Size = 5
    end
    object StringField2: TStringField
      DisplayLabel = 'Tipo vía'
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
  end
  object sqlDireccionesUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update direcciones set'
      '  id_provincia = :id_provincia,'
      '  id_municipio = :id_municipio,'
      '  ds_municipio = :ds_municipio,'
      '  id_tipo_via = :id_tipo_via,'
      '  ds_nombre_via = :ds_nombre_via,'
      '  ds_numero = :ds_numero,'
      '  ds_cp = :ds_cp,'
      '  ds_cp_extranjero = :ds_cp_extranjero,'
      '  ds_resto_direccion = :ds_resto_direccion'
      'where'
      '  id_direccion = :id_direccion')
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
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_direccion'
        ParamType = ptUnknown
      end>
    DataSource = dsDirecciones
    Left = 361
    Top = 143
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
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_direccion'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      DisplayLabel = 'Cod tipo vía'
      FieldName = 'id_tipo_via'
      Required = True
      Size = 5
    end
    object StringField4: TStringField
      DisplayLabel = 'Tipo vía'
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
  end
  object sqlDireccionesDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from direcciones'
      'where id_direccion = :id_direccion')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_direccion'
        ParamType = ptUnknown
      end>
    DataSource = dsDirecciones
    Left = 357
    Top = 269
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_direccion'
        ParamType = ptUnknown
      end>
    object StringField5: TStringField
      DisplayLabel = 'Cod tipo vía'
      FieldName = 'id_tipo_via'
      Required = True
      Size = 5
    end
    object StringField6: TStringField
      DisplayLabel = 'Tipo vía'
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
  end
end
