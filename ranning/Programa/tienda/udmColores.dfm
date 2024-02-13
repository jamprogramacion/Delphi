object dmColores: TdmColores
  OldCreateOrder = False
  Left = 254
  Top = 152
  Height = 480
  Width = 696
  object sqlColores: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    OnUpdateRecord = sqlColoresUpdateRecord
    BeforePost = sqlColoresBeforePost
    BeforeDelete = sqlColoresBeforeDelete
    SQL.Strings = (
      'select * from colores order by id_color'
      'for update')
    Params = <>
    Left = 24
    Top = 27
    object sqlColoresid_color: TLargeintField
      DisplayLabel = 'Id. color'
      FieldName = 'id_color'
    end
    object sqlColoresds_color: TStringField
      DisplayLabel = 'Color'
      FieldName = 'ds_color'
      Required = True
      Size = 50
    end
  end
  object sqlColoresUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update colores set'
      '  ds_color = :ds_color'
      'where'
      '  id_color = :id_color')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end>
    DataSource = dsColores
    Left = 345
    Top = 30
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end>
  end
  object sqlColoresInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into colores'
      '  (ds_color)'
      'values'
      '  (:ds_color)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_color'
        ParamType = ptUnknown
      end>
    DataSource = dsColores
    Left = 225
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_color'
        ParamType = ptUnknown
      end>
  end
  object sqlColoresDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from colores where id_color = :id_color')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end>
    DataSource = dsColores
    Left = 122
    Top = 30
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_color'
        ParamType = ptUnknown
      end>
  end
  object dsColores: TDataSource
    DataSet = sqlColores
    Left = 35
    Top = 83
  end
  object sqlColorStock: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      
        'select count(id_producto) nm_producto from stock where id_color ' +
        '= :id_color')
    Params = <
      item
        DataType = ftLargeint
        Name = 'id_color'
        ParamType = ptInput
      end>
    DataSource = dsColores
    Left = 159
    Top = 110
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id_color'
        ParamType = ptInput
      end>
  end
  object sqlHuecoCdColor: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select distinct cd_color'
      'from colores '
      'order by cd_color')
    Params = <>
    Left = 342
    Top = 110
    object sqlHuecoCdColorcd_color: TStringField
      FieldName = 'cd_color'
      Required = True
      Size = 10
    end
  end
end
