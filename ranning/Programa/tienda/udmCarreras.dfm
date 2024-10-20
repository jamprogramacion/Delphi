object dmCarreras: TdmCarreras
  OldCreateOrder = False
  Left = 229
  Top = 158
  Height = 480
  Width = 696
  object sqlCarreras: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    BeforePost = sqlCarrerasBeforePost
    BeforeDelete = sqlCarrerasBeforeDelete
    OnNewRecord = sqlCarrerasNewRecord
    SQL.Strings = (
      'select'
      '  c.*,'
      '  p.ds_provincia,'
      '  m.ds_municipio'
      'from '
      '  carreras c,'
      '  provincias p,'
      '  municipios m'
      'where'
      '  (c.id_provincia = p.id_provincia) and'
      '  (c.id_provincia = m.id_provincia) and'
      '  (c.id_municipio = m.id_municipio)'
      'order by'
      '  c.f_fecha,'
      '  c.nm_hora,'
      '  c.ds_carrera'
      'for update')
    Params = <>
    Left = 30
    Top = 19
    object sqlCarrerasid_carrera: TLargeintField
      FieldName = 'id_carrera'
    end
    object sqlCarrerasds_carrera: TStringField
      DisplayLabel = 'Carrera'
      FieldName = 'ds_carrera'
      Required = True
      Size = 80
    end
    object sqlCarrerasid_provincia: TStringField
      FieldName = 'id_provincia'
      Required = True
      Size = 2
    end
    object sqlCarrerasid_municipio: TStringField
      FieldName = 'id_municipio'
      Required = True
      Size = 5
    end
    object sqlCarrerasds_distancia: TStringField
      DisplayLabel = 'Distancia'
      FieldName = 'ds_distancia'
      Size = 15
    end
    object sqlCarrerasf_fecha: TDateField
      DisplayLabel = 'Fecha'
      FieldName = 'f_fecha'
    end
    object sqlCarrerasnm_hora: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'nm_hora'
    end
    object sqlCarrerasit_tenemos_inscripcion: TStringField
      DisplayLabel = 'Tenemos inscripci�n'
      FieldName = 'it_tenemos_inscripcion'
      Required = True
      Size = 1
    end
    object sqlCarrerasnm_precio: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'nm_precio'
    end
    object sqlCarrerasds_pagina_web: TStringField
      DisplayLabel = 'P�gina web'
      FieldName = 'ds_pagina_web'
      Size = 255
    end
    object sqlCarrerasobservaciones: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object sqlCarrerasds_provincia: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'ds_provincia'
      Size = 30
    end
    object sqlCarrerasds_municipio: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'ds_municipio'
      Size = 100
    end
  end
  object sqlCarrerasInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into carreras '
      '  (ds_carrera,'
      '  id_provincia,'
      '  id_municipio,'
      '  ds_distancia,'
      '  f_fecha,'
      '  nm_hora,'
      '  it_tenemos_inscripcion,'
      '  nm_precio,'
      '  ds_pagina_web,'
      '  observaciones)'
      'values'
      '  (:ds_carrera,'
      '  :id_provincia,'
      '  :id_municipio,'
      '  :ds_distancia,'
      '  :f_fecha,'
      '  :nm_hora,'
      '  :it_tenemos_inscripcion,'
      '  :nm_precio,'
      '  :ds_pagina_web,'
      '  :observaciones)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_carrera'
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
        Name = 'ds_distancia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_tenemos_inscripcion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_pagina_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end>
    DataSource = dsCarreras
    Left = 36
    Top = 86
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_carrera'
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
        Name = 'ds_distancia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_tenemos_inscripcion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_pagina_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end>
  end
  object sqlCarrerasUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update carreras set'
      '  ds_carrera = :ds_carrera,'
      '  id_provincia = :id_provincia,'
      '  id_municipio = :id_municipio,'
      '  ds_distancia = :ds_distancia,'
      '  f_fecha = :f_fecha,'
      '  nm_hora = :nm_hora,'
      '  it_tenemos_inscripcion = :it_tenemos_inscripcion,'
      '  nm_precio = :nm_precio,'
      '  ds_pagina_web = :ds_pagina_web,'
      '  observaciones = :observaciones'
      'where'
      '  id_carrera = :id_carrera')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_carrera'
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
        Name = 'ds_distancia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_tenemos_inscripcion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_pagina_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_carrera'
        ParamType = ptUnknown
      end>
    DataSource = dsCarreras
    Left = 155
    Top = 84
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_carrera'
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
        Name = 'ds_distancia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'it_tenemos_inscripcion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_pagina_web'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_carrera'
        ParamType = ptUnknown
      end>
  end
  object sqlCarrerasDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from carreras where id_carrera = :id_carrera')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_carrera'
        ParamType = ptUnknown
      end>
    DataSource = dsCarreras
    Left = 288
    Top = 86
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_carrera'
        ParamType = ptUnknown
      end>
  end
  object dsCarreras: TDataSource
    DataSet = sqlCarreras
    Left = 117
    Top = 23
  end
end
