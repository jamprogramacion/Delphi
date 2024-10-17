object dmElements: TdmElements
  OnCreate = DataModuleCreate
  Height = 630
  Width = 902
  object tblElements: TFDTable
    AfterInsert = tblElementsAfterInsert
    BeforePost = tblElementsBeforePost
    AfterPost = tblElementsAfterPost
    IndexFieldNames = 'elements_code'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'elements'
    Left = 56
    Top = 16
    object tblElementselements_id: TFDAutoIncField
      FieldName = 'elements_id'
      Origin = 'elements_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblElementselements_objects_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'elements_objects_stela_id'
      Origin = 'elements_objects_stela_id'
    end
    object tblElementselements_objects_img_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'elements_objects_img_id'
      Origin = 'elements_objects_img_id'
    end
    object tblElementselements_objects_icon_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'elements_objects_icon_id'
      Origin = 'elements_objects_icon_id'
    end
    object tblElementselements_objects_poster_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'elements_objects_poster_id'
      Origin = 'elements_objects_poster_id'
    end
    object tblElementselements_code: TWideStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'elements_code'
      Origin = 'elements_code'
      Required = True
      OnChange = tblElementselements_codeChange
      Size = 66
    end
    object tblElementselements_name_tc: TWideStringField
      DisplayLabel = 'Nombre'
      FieldName = 'elements_name_tc'
      Origin = 'elements_name_tc'
      Required = True
      Size = 133
    end
    object tblElementselements_desc_tc: TWideStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'elements_desc_tc'
      Origin = 'elements_desc_tc'
      Required = True
      Size = 133
    end
    object tblElementselements_user_url_template: TWideStringField
      DisplayLabel = 'Plantilla URL usuario'
      FieldName = 'elements_user_url_template'
      Origin = 'elements_user_url_template'
      Required = True
      Size = 340
    end
    object tblElementselements_stamp: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'elements_stamp'
      Origin = 'elements_stamp'
    end
    object tblElementselements_name: TStringField
      DisplayLabel = 'Nombre'
      FieldKind = fkLookup
      FieldName = 'elements_name'
      LookupDataSet = sqlElementsTranslationsName
      LookupKeyFields = 'translations_code'
      LookupResultField = 'element_name'
      KeyFields = 'elements_name_tc'
      Size = 100
      Lookup = True
    end
    object tblElementselements_desc: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkLookup
      FieldName = 'elements_desc'
      LookupDataSet = sqlElementsTranslationsDesc
      LookupKeyFields = 'translations_code'
      LookupResultField = 'element_desc'
      KeyFields = 'elements_desc_tc'
      Size = 100
      Lookup = True
    end
  end
  object dsElements: TDataSource
    DataSet = tblElements
    Left = 144
    Top = 16
  end
  object sqlElementsTranslationsName: TFDQuery
    IndexFieldNames = 'translations_code'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      #9't.translations_code,'
      '        cast(t.translations_text as char(100)) as element_name'
      'from'
      #9'translations t'
      'order by'
      '  t.translations_code')
    Left = 72
    Top = 88
    object sqlElementsTranslationsNametranslations_code: TWideStringField
      FieldName = 'translations_code'
      Origin = 'translations_code'
      Required = True
      Size = 133
    end
    object sqlElementsTranslationsNameelement_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'element_name'
      Origin = 'element_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object sqlContentFormatsTranslations: TFDQuery
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '    cf.content_formats_id,'
      
        '    cast(tn.translations_text as char(100)) as content_formats_n' +
        'ame,'
      
        '    cast(td.translations_text as char(100)) as content_formats_d' +
        'esc'
      'from'
      #9'content_formats cf'
      'join translations tn'
      #9'on cf.content_formats_name_tc = tn.translations_code'
      'join translations td'
      #9'on cf.content_formats_desc_tc = td.translations_code'
      'order by'
      '       content_formats_name ')
    Left = 80
    Top = 232
    object sqlContentFormatsTranslationscontent_formats_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'content_formats_id'
      Origin = 'content_formats_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlContentFormatsTranslationscontent_formats_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nombre formato'
      FieldName = 'content_formats_name'
      Origin = 'content_formats_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
    object sqlContentFormatsTranslationscontent_formats_desc: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descripci'#243'n formato'
      FieldName = 'content_formats_desc'
      Origin = 'content_formats_desc'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsContentFormatsTranslations: TDataSource
    DataSet = sqlContentFormatsTranslations
    Left = 224
    Top = 256
  end
  object sqlElementsTypesTranslations: TFDQuery
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      #9'et.elements_types_id,'
      
        '    cast(tn.translations_text as char(100)) as elements_types_na' +
        'me,'
      
        '    cast(td.translations_text as char(100)) as elements_types_de' +
        'sc'
      'from'
      #9'elements_types et'
      'join translations tn'
      #9'on et.elements_types_name_tc = tn.translations_code'
      'join translations td'
      #9'on et.elements_types_desc_tc = td.translations_code'
      'order by'
      '    elements_types_name ')
    Left = 72
    Top = 312
    object sqlElementsTypesTranslationselements_types_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'elements_types_id'
      Origin = 'elements_types_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlElementsTypesTranslationselements_types_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nombre tipo elemento'
      FieldName = 'elements_types_name'
      Origin = 'elements_types_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
    object sqlElementsTypesTranslationselements_types_desc: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descripci'#243'n tipo elemento'
      FieldName = 'elements_types_desc'
      Origin = 'elements_types_desc'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsElementsTypesTranslations: TDataSource
    DataSet = sqlElementsTypesTranslations
    Left = 216
    Top = 336
  end
  object sqlElementsContentFormats: TFDQuery
    MasterSource = dsElements
    MasterFields = 'elements_id'
    DetailFields = 'elements_content_formats_elements_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '     ecf.elements_content_formats_id,'
      #9'ecf.elements_content_formats_elements_id,'
      '     ecf.elements_content_formats_content_formats_id,'
      
        '    cast(tn.translations_text as char(100)) as content_formats_n' +
        'ame,'
      
        '    cast(td.translations_text as char(100)) as content_formats_d' +
        'esc'
      'from'
      #9'elements_content_formats ecf'
      'join content_formats cf'
      
        #9'on ecf.elements_content_formats_content_formats_id = cf.content' +
        '_formats_id'
      'join translations tn'
      #9'on cf.content_formats_name_tc = tn.translations_code'
      'join translations td'
      #9'on cf.content_formats_desc_tc = td.translations_code'
      'where'
      '  ecf.elements_content_formats_elements_id = :elements_id'
      'order by'
      #9'ecf.elements_content_formats_elements_id,'
      '    content_formats_name')
    Left = 336
    Top = 24
    ParamData = <
      item
        Name = 'ELEMENTS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlElementsContentFormatselements_content_formats_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'elements_content_formats_id'
      Origin = 'elements_content_formats_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlElementsContentFormatselements_content_formats_elements_id: TLongWordField
      FieldName = 'elements_content_formats_elements_id'
      Origin = 'elements_content_formats_elements_id'
      Required = True
    end
    object sqlElementsContentFormatselements_content_formats_content_formats_id: TWordField
      FieldName = 'elements_content_formats_content_formats_id'
      Origin = 'elements_content_formats_content_formats_id'
      Required = True
    end
    object sqlElementsContentFormatscontent_formats_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nombre formato'
      FieldName = 'content_formats_name'
      Origin = 'content_formats_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
    object sqlElementsContentFormatscontent_formats_desc: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descripci'#243'n formato'
      FieldName = 'content_formats_desc'
      Origin = 'content_formats_desc'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsElementsContentFormats: TDataSource
    DataSet = sqlElementsContentFormats
    Left = 472
    Top = 40
  end
  object sqlElementsElementsTypes: TFDQuery
    MasterSource = dsElements
    MasterFields = 'elements_id'
    DetailFields = 'elements_elements_types_elements_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '     eet.elements_elements_types_id,'
      #9'eet.elements_elements_types_elements_id,'
      '     eet.elements_elements_types_elements_types_id,'
      
        '    cast(tn.translations_text as char(100)) as elements_types_na' +
        'me,'
      
        '    cast(td.translations_text as char(100)) as elements_types_de' +
        'sc'
      'from'
      #9'elements_elements_types eet'
      'join elements_types et'
      
        #9'on eet.elements_elements_types_elements_types_id = et.elements_' +
        'types_id'
      'join translations tn'
      #9'on et.elements_types_name_tc = tn.translations_code'
      'join translations td'
      #9'on et.elements_types_desc_tc = td.translations_code'
      'where'
      '  eet.elements_elements_types_elements_id = :elements_id'
      'order by'
      #9'eet.elements_elements_types_elements_id,'
      '    elements_types_name')
    Left = 376
    Top = 104
    ParamData = <
      item
        Name = 'ELEMENTS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlElementsElementsTypeselements_elements_types_id: TLongWordField
      FieldName = 'elements_elements_types_id'
      Origin = 'elements_elements_types_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlElementsElementsTypeselements_elements_types_elements_id: TLongWordField
      FieldName = 'elements_elements_types_elements_id'
      Origin = 'elements_elements_types_elements_id'
      Required = True
    end
    object sqlElementsElementsTypeselements_elements_types_elements_types_id: TWordField
      FieldName = 'elements_elements_types_elements_types_id'
      Origin = 'elements_elements_types_elements_types_id'
      Required = True
    end
    object sqlElementsElementsTypeselements_types_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nombre tipo elemento'
      FieldName = 'elements_types_name'
      Origin = 'elements_types_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
    object sqlElementsElementsTypeselements_types_desc: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descripci'#243'n tipo elemento'
      FieldName = 'elements_types_desc'
      Origin = 'elements_types_desc'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsElementsElementsTypes: TDataSource
    DataSet = sqlElementsElementsTypes
    Left = 512
    Top = 120
  end
  object sqlElementsContentFormatsInsert: TFDCommand
    Connection = dmImportData.connWhyuon
    CommandKind = skInsert
    CommandText.Strings = (
      'INSERT INTO elements_content_formats'
      '  (elements_content_formats_elements_id,'
      '  elements_content_formats_content_formats_id)'
      'VALUES'
      '  (:elements_id,'
      '  :content_formats_id);'
      '')
    ParamData = <
      item
        Name = 'elements_id'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CONTENT_FORMATS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 464
    Top = 336
  end
  object tblTranslations: TFDTable
    IndexName = 'translations_code_length'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'translations'
    Left = 80
    Top = 400
    object tblTranslationstranslations_id: TFDAutoIncField
      FieldName = 'translations_id'
      Origin = 'translations_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblTranslationstranslations_languages_id: TWordField
      FieldName = 'translations_languages_id'
      Origin = 'translations_languages_id'
      Required = True
    end
    object tblTranslationstranslations_code: TWideStringField
      FieldName = 'translations_code'
      Origin = 'translations_code'
      Required = True
      Size = 133
    end
    object tblTranslationstranslations_text: TWideMemoField
      FieldName = 'translations_text'
      Origin = 'translations_text'
      Required = True
      BlobType = ftWideMemo
    end
    object tblTranslationstranslations_objects_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'translations_objects_id'
      Origin = 'translations_objects_id'
    end
    object tblTranslationstranslations_max_length: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'translations_max_length'
      Origin = 'translations_max_length'
    end
  end
  object sqlElementsTranslationsDesc: TFDQuery
    IndexFieldNames = 'translations_code'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      #9't.translations_code,'
      '        cast(t.translations_text as char(100)) as element_desc'
      'from'
      #9'translations t'
      'order by'
      '     t.translations_code')
    Left = 72
    Top = 152
    object WideStringField4: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'element_desc'
      Origin = 'element_desc'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
    object sqlElementsTranslationsDesctranslations_code: TWideStringField
      FieldName = 'translations_code'
      Origin = 'translations_code'
      Required = True
      Size = 133
    end
  end
  object sqlElementsContentFormatsDelete: TFDCommand
    Connection = dmImportData.connWhyuon
    CommandKind = skDelete
    CommandText.Strings = (
      'DELETE FROM elements_content_formats'
      'WHERE elements_content_formats_id = :id'
      '')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 464
    Top = 400
  end
  object sqlElementsElementsTypesInsert: TFDCommand
    Connection = dmImportData.connWhyuon
    CommandKind = skInsert
    CommandText.Strings = (
      'INSERT INTO elements_elements_types'
      '  (elements_elements_types_elements_id,'
      '  elements_elements_types_elements_types_id)'
      'VALUES'
      '  (:elements_id,'
      '  :elements_types_id);'
      '')
    ParamData = <
      item
        Name = 'elements_id'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ELEMENTS_TYPES_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 712
    Top = 336
  end
  object sqlElementsElementsTypesDelete: TFDCommand
    Connection = dmImportData.connWhyuon
    CommandKind = skDelete
    CommandText.Strings = (
      'DELETE FROM elements_elements_types'
      'WHERE elements_elements_types_id = :id'
      '')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 712
    Top = 400
  end
  object sqlElementsObjects: TFDQuery
    IndexFieldNames = 'elements_id'
    MasterSource = dsElements
    MasterFields = 'elements_id'
    DetailFields = 'elements_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      #9'e.elements_id,'
      #9'img.objects_path as img_path,'
      '    img.objects_name as img_name,'
      #9'stela.objects_path as stela_path,'
      '    stela.objects_name as stela_name,    '
      #9'poster.objects_path as poster_path,'
      '    poster.objects_name as poster_name,    '
      #9'icon.objects_path as icon_path,'
      '    icon.objects_name as icon_name    '
      'from'
      #9'elements e'
      'join objects img'
      #9'on img.objects_id = e.elements_objects_img_id'
      'join objects stela'
      #9'on stela.objects_id = e.elements_objects_stela_id'
      'join objects poster'
      #9'on poster.objects_id = e.elements_objects_poster_id'
      'join objects icon'
      #9'on icon.objects_id = e.elements_objects_icon_id'
      'order by'
      '  e.elements_id')
    Left = 680
    Top = 24
    object sqlElementsObjectselements_id: TFDAutoIncField
      FieldName = 'elements_id'
      Origin = 'elements_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlElementsObjectsimg_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imagen'
      FieldName = 'img_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlElementsObjectsimg_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imagen'
      FieldName = 'img_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlElementsObjectsstela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlElementsObjectsstela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlElementsObjectsposter_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel'
      FieldName = 'poster_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlElementsObjectsposter_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel'
      FieldName = 'poster_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlElementsObjectsicon_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Icono'
      FieldName = 'icon_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlElementsObjectsicon_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Icono'
      FieldName = 'icon_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
  end
  object dsElementsObjects: TDataSource
    DataSet = sqlElementsObjects
    Left = 792
    Top = 40
  end
  object tblObjects: TFDTable
    IndexFieldNames = 'objects_id'
    Connection = dmImportData.connWhyuon
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'objects'
    Left = 80
    Top = 472
    object tblObjectsobjects_id: TFDAutoIncField
      FieldName = 'objects_id'
      Origin = 'objects_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblObjectsobjects_levels_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'objects_levels_id'
      Origin = 'objects_levels_id'
    end
    object tblObjectsobjects_languages_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'objects_languages_id'
      Origin = 'objects_languages_id'
    end
    object tblObjectsobjects_visibility: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'objects_visibility'
      Origin = 'objects_visibility'
    end
    object tblObjectsobjects_path: TWideStringField
      FieldName = 'objects_path'
      Origin = 'objects_path'
      Required = True
      Size = 340
    end
    object tblObjectsobjects_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'objects_name'
      Origin = 'objects_name'
      Size = 66
    end
    object tblObjectsobjects_long_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'objects_long_name'
      Origin = 'objects_long_name'
      Size = 133
    end
    object tblObjectsobjects_desc: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'objects_desc'
      Origin = 'objects_desc'
      Size = 340
    end
    object tblObjectsobjects_sha256: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'objects_sha256'
      Origin = 'objects_sha256'
      Size = 85
    end
    object tblObjectsobjects_last_mod: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'objects_last_mod'
      Origin = 'objects_last_mod'
    end
  end
end
