object dmUsersElementsImport: TdmUsersElementsImport
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object tblUsersElementsImport: TFDTable
    AfterPost = tblUsersElementsImportAfterPost
    BeforeDelete = tblUsersElementsImportBeforeDelete
    IndexFieldNames = 'users_elements_import_id'
    Connection = dmImportData.connWhyuon
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'users_elements_import'
    Left = 72
    Top = 32
    object tblUsersElementsImportusers_elements_import_id: TFDAutoIncField
      FieldName = 'users_elements_import_id'
      Origin = 'users_elements_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblUsersElementsImportusers_elements_import_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'users_elements_import_username'
      Origin = 'users_elements_import_username'
      Required = True
      Size = 200
    end
    object tblUsersElementsImportusers_elements_import_elements_id: TLongWordField
      FieldName = 'users_elements_import_elements_id'
      Origin = 'users_elements_import_elements_id'
      Required = True
    end
    object tblUsersElementsImportusers_elements_import_objects_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_elements_import_objects_stela_id'
      Origin = 'users_elements_import_objects_stela_id'
    end
    object tblUsersElementsImportusers_elements_import_objects_import_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_elements_import_objects_import_stela_id'
      Origin = 'users_elements_import_objects_import_stela_id'
    end
    object tblUsersElementsImportusers_elements_import_element_username: TWideStringField
      DisplayLabel = 'Username de elemento'
      FieldName = 'users_elements_import_element_username'
      Origin = 'users_elements_import_element_username'
      Required = True
      Size = 340
    end
    object tblUsersElementsImportusers_elements_import_desc: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'users_elements_import_desc'
      Origin = 'users_elements_import_desc'
      Size = 340
    end
    object tblUsersElementsImportusers_elements_import_url: TWideStringField
      DisplayLabel = 'URL'
      FieldName = 'users_elements_import_url'
      Origin = 'users_elements_import_url'
      Required = True
      Size = 340
    end
    object tblUsersElementsImportusers_elements_import_imported: TByteField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Importado'
      FieldName = 'users_elements_import_imported'
      Origin = 'users_elements_import_imported'
    end
    object tblUsersElementsImportusers_elements_import_stamp: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_elements_import_stamp'
      Origin = 'users_elements_import_stamp'
    end
    object tblUsersElementsImportusers_elements_import_last_mod: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_elements_import_last_mod'
      Origin = 'users_elements_import_last_mod'
    end
    object tblUsersElementsImportelement_name: TStringField
      DisplayLabel = 'Elemento'
      FieldKind = fkLookup
      FieldName = 'element_name'
      LookupDataSet = sqlElements
      LookupKeyFields = 'elements_id'
      LookupResultField = 'element'
      KeyFields = 'users_elements_import_elements_id'
      Size = 100
      Lookup = True
    end
  end
  object dsUsersElementsImport: TDataSource
    DataSet = tblUsersElementsImport
    OnStateChange = dsUsersElementsImportStateChange
    OnDataChange = dsUsersElementsImportDataChange
    Left = 216
    Top = 32
  end
  object sqlUsersElementsImportObjects: TFDQuery
    IndexFieldNames = 
      'users_elements_import_elements_id;users_elements_import_element_' +
      'username'
    MasterSource = dsUsersElementsImport
    MasterFields = 
      'users_elements_import_elements_id;users_elements_import_element_' +
      'username'
    DetailFields = 
      'users_elements_import_elements_id;users_elements_import_element_' +
      'username'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      #9'u.users_elements_import_element_username,'
      '    u.users_elements_import_elements_id,'
      '    u.users_elements_import_username,'
      #9'stela.objects_path as stela_path,'
      '    stela.objects_name as stela_name,    '
      #9'import_stela.objects_import_path as import_stela_path,'
      '    import_stela.objects_import_name as import_stela_name'
      'from'
      #9'users_elements_import u'
      'left join objects stela'
      #9'on stela.objects_id = u.users_elements_import_objects_stela_id'
      'left join objects_import import_stela'
      
        #9'on import_stela.objects_import_id = u.users_elements_import_obj' +
        'ects_import_stela_id'
      'order by'
      '  u.users_elements_import_element_username')
    Left = 144
    Top = 216
    object sqlUsersElementsImportObjectsusers_elements_import_element_username: TWideStringField
      DisplayLabel = 'Username de elemento'
      FieldName = 'users_elements_import_element_username'
      Origin = 'users_elements_import_element_username'
      Required = True
      Size = 340
    end
    object sqlUsersElementsImportObjectsusers_elements_import_elements_id: TLongWordField
      DisplayLabel = 'Elemento'
      FieldName = 'users_elements_import_elements_id'
      Origin = 'users_elements_import_elements_id'
      Required = True
    end
    object sqlUsersElementsImportObjectsstela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersElementsImportObjectsstela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersElementsImportObjectsimport_stela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela importada'
      FieldName = 'import_stela_path'
      Origin = 'objects_import_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersElementsImportObjectsimport_stela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela importada'
      FieldName = 'import_stela_name'
      Origin = 'objects_import_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersElementsImportObjectsusers_elements_import_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'users_elements_import_username'
      Origin = 'users_elements_import_username'
      Required = True
      Size = 200
    end
  end
  object dsUsersElementsImportObjects: TDataSource
    DataSet = sqlUsersElementsImportObjects
    Left = 264
    Top = 240
  end
  object sqlElements: TFDQuery
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  e.elements_id,'
      '  cast(t.translations_text as char(100)) as element'
      'from  '
      '  elements as e'
      'join translations as t'
      '  on e.elements_name_tc = t.translations_code '
      'order by'
      '  element  ')
    Left = 56
    Top = 312
    object sqlElementselements_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'elements_id'
      Origin = 'elements_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlElementselement: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Elemento'
      FieldName = 'element'
      Origin = 'element'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsElements: TDataSource
    DataSet = sqlElements
    Left = 144
    Top = 312
  end
  object sqlCopyUserElementsToImport: TFDQuery
    SQL.Strings = (
      'call CopyUserElementsToImport(:user_id);')
    Left = 104
    Top = 120
    ParamData = <
      item
        Name = 'USER_ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlUserElementExists: TFDQuery
    Connection = dmImportData.connWhyuon
    SQL.Strings = (
      'select'
      '  count(ue.users_elements_id) as user_element_id'
      'from'
      '  users_elements as ue'
      'join users as u'
      '  on u.users_id = ue.users_elements_users_id'
      'where'
      '  (u.users_username = :username)'
      '  and (users_elements_elements_id = :element_id)'
      '  and (users_elements_username = :element_username)')
    Left = 272
    Top = 336
    ParamData = <
      item
        Name = 'USERNAME'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ELEMENT_ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ELEMENT_USERNAME'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
    object sqlUserElementExistsuser_element_id: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'user_element_id'
      Origin = 'user_element_id'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
