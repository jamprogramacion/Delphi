object dmEventsImport: TdmEventsImport
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 809
  Width = 1121
  object tblEventsImport: TFDTable
    AfterInsert = tblEventsImportAfterInsert
    AfterPost = tblEventsImportAfterPost
    AfterCancel = tblEventsImportAfterCancel
    BeforeDelete = tblEventsImportBeforeDelete
    AfterScroll = tblEventsImportAfterScroll
    AfterRefresh = tblEventsImportAfterRefresh
    IndexFieldNames = 'events_import_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.KeyFields = 'events_import_id'
    TableName = 'events_import'
    Left = 296
    Top = 144
    object tblEventsImportevents_import_id: TFDAutoIncField
      FieldName = 'events_import_id'
      Origin = 'events_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblEventsImportevents_import_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'events_import_username'
      Origin = 'events_import_username'
      Required = True
      OnChange = tblEventsImportevents_import_usernameChange
      Size = 200
    end
    object tblEventsImportevents_import_elements_id: TLongWordField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = 'Elemento'
      FieldName = 'events_import_elements_id'
      Origin = 'events_import_elements_id'
      OnChange = tblEventsImportevents_import_elements_idChange
    end
    object tblEventsImportevents_import_users_elements_id: TLongWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Username en elemento'
      FieldName = 'events_import_users_elements_id'
      Origin = 'events_import_users_elements_id'
      OnChange = tblEventsImportevents_import_users_elements_idChange
    end
    object tblEventsImportevents_import_content_formats_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Formato'
      FieldName = 'events_import_content_formats_id'
      Origin = 'events_import_content_formats_id'
      OnChange = tblEventsImportevents_import_content_formats_idChange
    end
    object tblEventsImportevents_import_categories_id: TWideStringField
      DisplayLabel = 'Categor'#237'as'
      FieldName = 'events_import_categories_id'
      Origin = 'events_import_categories_id'
      Required = True
      OnChange = tblEventsImportevents_import_categories_idChange
      Size = 340
    end
    object tblEventsImportevents_import_title: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'events_import_title'
      Origin = 'events_import_title'
      Size = 200
    end
    object tblEventsImportevents_import_profile: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'events_import_profile'
      Origin = 'events_import_profile'
      Size = 340
    end
    object tblEventsImportevents_import_addresses_desc: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descripci'#243'n direcci'#243'n'
      FieldName = 'events_import_addresses_desc'
      Origin = 'events_import_addresses_desc'
      Size = 340
    end
    object tblEventsImportevents_import_objects_poster_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_objects_poster_id'
      Origin = 'events_import_objects_poster_id'
    end
    object tblEventsImportevents_import_objects_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_objects_stela_id'
      Origin = 'events_import_objects_stela_id'
    end
    object tblEventsImportevents_import_objects_import_poster_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_objects_import_poster_id'
      Origin = 'events_import_objects_import_poster_id'
    end
    object tblEventsImportevents_import_objects_import_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_objects_import_stela_id'
      Origin = 'events_import_objects_import_stela_id'
    end
    object tblEventsImportevents_import_url: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'URL'
      FieldName = 'events_import_url'
      Origin = 'events_import_url'
      Size = 340
    end
    object tblEventsImportevents_import_url_info: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Informaci'#243'n URL'
      FieldName = 'events_import_url_info'
      Origin = 'events_import_url_info'
      Size = 340
    end
    object tblEventsImportevents_import_start: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fecha y hora de comienzo'
      FieldName = 'events_import_start'
      Origin = 'events_import_start'
      OnChange = tblEventsImportevents_import_startChange
    end
    object tblEventsImportevents_import_end: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fecha y hora de fin'
      FieldName = 'events_import_end'
      Origin = 'events_import_end'
      OnChange = tblEventsImportevents_import_endChange
    end
    object tblEventsImportevents_import_hashtags: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Etiquetas'
      FieldName = 'events_import_hashtags'
      Origin = 'events_import_hashtags'
      Size = 340
    end
    object tblEventsImportevents_import_languages_id: TWordField
      DisplayLabel = 'Idioma'
      FieldName = 'events_import_languages_id'
      Origin = 'events_import_languages_id'
      Required = True
      OnChange = tblEventsImportevents_import_languages_idChange
    end
    object tblEventsImportevents_import_countries_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Pa'#237's'
      FieldName = 'events_import_countries_id'
      Origin = 'events_import_countries_id'
      OnChange = tblEventsImportevents_import_countries_idChange
    end
    object tblEventsImportevents_import_regions_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Regi'#243'n'
      FieldName = 'events_import_regions_id'
      Origin = 'events_import_regions_id'
      OnChange = tblEventsImportevents_import_regions_idChange
    end
    object tblEventsImportevents_import_provinces_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Provincia'
      FieldName = 'events_import_provinces_id'
      Origin = 'events_import_provinces_id'
      OnChange = tblEventsImportevents_import_provinces_idChange
    end
    object tblEventsImportevents_import_cities_id: TLongWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ciudad'
      FieldName = 'events_import_cities_id'
      Origin = 'events_import_cities_id'
      OnChange = tblEventsImportevents_import_cities_idChange
    end
    object tblEventsImportevents_import_cities_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ciudad (si no aparece en la lista)'
      FieldName = 'events_import_cities_name'
      Origin = 'events_import_cities_name'
      Size = 133
    end
    object tblEventsImportevents_import_road_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tipo y nombre de la v'#237'a'
      FieldName = 'events_import_road_name'
      Origin = 'events_import_road_name'
      Size = 340
    end
    object tblEventsImportevents_import_number: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N'#250'mero'
      FieldName = 'events_import_number'
      Origin = 'events_import_number'
      Size = 26
    end
    object tblEventsImportevents_import_extended: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Resto direcci'#243'n'
      FieldName = 'events_import_extended'
      Origin = 'events_import_extended'
      Size = 133
    end
    object tblEventsImportevents_import_postal_code: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo postal'
      FieldName = 'events_import_postal_code'
      Origin = 'events_import_postal_code'
      Size = 26
    end
    object tblEventsImportevents_import_imported: TByteField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = 'Importado'
      FieldName = 'events_import_imported'
      Origin = 'events_import_imported'
    end
    object tblEventsImportevents_import_eventstbl_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_eventstbl_id'
      Origin = 'events_import_eventstbl_id'
    end
    object tblEventsImportevents_import_stamp: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_stamp'
      Origin = 'events_import_stamp'
    end
    object tblEventsImportevents_import_last_mod: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_last_mod'
      Origin = 'events_import_last_mod'
    end
    object tblEventsImportevents_import_elements_name: TStringField
      DisplayLabel = 'Elemento'
      FieldKind = fkLookup
      FieldName = 'events_import_elements_name'
      LookupDataSet = sqlElements
      LookupKeyFields = 'elements_id'
      LookupResultField = 'element'
      KeyFields = 'events_import_elements_id'
      Size = 100
      Lookup = True
    end
    object tblEventsImportevents_import_format_name: TStringField
      DisplayLabel = 'Formato'
      FieldKind = fkLookup
      FieldName = 'events_import_format_name'
      LookupDataSet = sqlContentFormats
      LookupKeyFields = 'content_formats_id'
      LookupResultField = 'content_format'
      KeyFields = 'events_import_content_formats_id'
      Size = 100
      Lookup = True
    end
  end
  object dsEventsImport: TDataSource
    DataSet = tblEventsImport
    OnStateChange = dsEventsImportStateChange
    OnDataChange = dsEventsImportDataChange
    Left = 392
    Top = 152
  end
  object tblCountries: TFDTable
    IndexName = 'countries_name'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'countries'
    Left = 296
    Top = 296
    object tblCountriescountries_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'countries_id'
      Origin = 'countries_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblCountriescountries_name: TWideStringField
      FieldName = 'countries_name'
      Origin = 'countries_name'
      Required = True
      Size = 66
    end
    object tblCountriescountries_code_alpha2: TWideStringField
      FieldName = 'countries_code_alpha2'
      Origin = 'countries_code_alpha2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblCountriescountries_code_alpha3: TWideStringField
      FieldName = 'countries_code_alpha3'
      Origin = 'countries_code_alpha3'
      Required = True
      FixedChar = True
      Size = 4
    end
    object tblCountriescountries_code_onu: TWideStringField
      FieldName = 'countries_code_onu'
      Origin = 'countries_code_onu'
      Required = True
      FixedChar = True
      Size = 4
    end
    object tblCountriescountries_phone_prefix: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'countries_phone_prefix'
      Origin = 'countries_phone_prefix'
      Size = 6
    end
  end
  object dsCountries: TDataSource
    DataSet = tblCountries
    Left = 376
    Top = 288
  end
  object dsRegions: TDataSource
    DataSet = tblRegions
    Left = 368
    Top = 416
  end
  object dsProvinces: TDataSource
    DataSet = tblProvinces
    Left = 368
    Top = 360
  end
  object dsCities: TDataSource
    DataSet = tblCities
    Left = 392
    Top = 480
  end
  object tblRegions: TFDTable
    IndexFieldNames = 'regions_id'
    MasterSource = dsEventsImport
    MasterFields = 'events_import_regions_id'
    DetailFields = 'regions_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'regions'
    Left = 296
    Top = 424
    object tblRegionsregions_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'regions_id'
      Origin = 'regions_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblRegionsregions_countries_id: TWordField
      FieldName = 'regions_countries_id'
      Origin = 'regions_countries_id'
      Required = True
    end
    object tblRegionsregions_code: TWideStringField
      FieldName = 'regions_code'
      Origin = 'regions_code'
      Required = True
      FixedChar = True
      Size = 26
    end
    object tblRegionsregions_name: TWideStringField
      FieldName = 'regions_name'
      Origin = 'regions_name'
      Required = True
      Size = 106
    end
  end
  object tblProvinces: TFDTable
    IndexFieldNames = 'provinces_countries_id'
    MasterSource = dsEventsImport
    MasterFields = 'events_import_countries_id'
    DetailFields = 'provinces_countries_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'provinces'
    Left = 288
    Top = 360
    object tblProvincesprovinces_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'provinces_id'
      Origin = 'provinces_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblProvincesprovinces_countries_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'provinces_countries_id'
      Origin = 'provinces_countries_id'
    end
    object tblProvincesprovinces_regions_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'provinces_regions_id'
      Origin = 'provinces_regions_id'
    end
    object tblProvincesprovinces_code: TWideStringField
      FieldName = 'provinces_code'
      Origin = 'provinces_code'
      Required = True
      FixedChar = True
      Size = 42
    end
    object tblProvincesprovinces_name: TWideStringField
      FieldName = 'provinces_name'
      Origin = 'provinces_name'
      Required = True
      Size = 106
    end
  end
  object tblCities: TFDTable
    IndexFieldNames = 'cities_provinces_id'
    MasterSource = dsEventsImport
    MasterFields = 'events_import_provinces_id'
    DetailFields = 'cities_provinces_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'cities'
    Left = 296
    Top = 488
    object tblCitiescities_id: TFDAutoIncField
      FieldName = 'cities_id'
      Origin = 'cities_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblCitiescities_countries_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'cities_countries_id'
      Origin = 'cities_countries_id'
    end
    object tblCitiescities_regions_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'cities_regions_id'
      Origin = 'cities_regions_id'
    end
    object tblCitiescities_provinces_id: TWordField
      FieldName = 'cities_provinces_id'
      Origin = 'cities_provinces_id'
      Required = True
    end
    object tblCitiescities_code: TWideStringField
      FieldName = 'cities_code'
      Origin = 'cities_code'
      Required = True
      FixedChar = True
      Size = 42
    end
    object tblCitiescities_name: TWideStringField
      FieldName = 'cities_name'
      Origin = 'cities_name'
      Required = True
      Size = 106
    end
    object tblCitiescities_postal_code: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cities_postal_code'
      Origin = 'cities_postal_code'
      FixedChar = True
      Size = 6
    end
  end
  object bmvEventsImport: TFDBatchMove
    Reader = bmvEventsImportReader
    Writer = bmvEventsImportWriter
    Mappings = <
      item
        SourceFieldName = '*username'
        DestinationFieldName = 'events_import_username'
      end
      item
        SourceFieldName = 'elemento'
        DestinationFieldName = 'events_import_elements_id'
      end
      item
        SourceFieldName = 'username_elemento'
        DestinationFieldName = 'events_import_users_elements_id'
      end
      item
        SourceFieldName = 'formato'
        DestinationFieldName = 'events_import_content_formats_id'
      end
      item
        SourceFieldName = '*categoria'
        DestinationFieldName = 'events_import_categories_id'
      end
      item
        SourceFieldName = 'titulo'
        DestinationFieldName = 'events_import_title'
      end
      item
        SourceFieldName = 'perfil'
        DestinationFieldName = 'events_import_profile'
      end
      item
        SourceFieldName = 'desc_direccion'
        DestinationFieldName = 'events_import_addresses_desc'
      end
      item
        SourceFieldName = 'url'
        DestinationFieldName = 'events_import_url'
      end
      item
        SourceFieldName = 'url_info'
        DestinationFieldName = 'events_import_url_info'
      end
      item
        SourceFieldName = '*inicio'
        DestinationFieldName = 'events_import_start'
      end
      item
        SourceFieldName = '*final'
        DestinationFieldName = 'events_import_end'
      end
      item
        SourceFieldName = 'etiquetas'
        DestinationFieldName = 'events_import_hashtags'
      end
      item
        SourceFieldName = '*idioma'
        DestinationFieldName = 'events_import_languages_id'
      end
      item
        SourceFieldName = 'pais'
        DestinationFieldName = 'events_import_countries_id'
      end
      item
        SourceFieldName = 'provincia'
        DestinationFieldName = 'events_import_provinces_id'
      end
      item
        SourceFieldName = 'ciudad'
        DestinationFieldName = 'events_import_cities_id'
      end
      item
        SourceFieldName = 'nombre_ciudad'
        DestinationFieldName = 'events_import_cities_name'
      end
      item
        SourceFieldName = 'calle'
        DestinationFieldName = 'events_import_road_name'
      end
      item
        SourceFieldName = 'numero'
        DestinationFieldName = 'events_import_number'
      end
      item
        SourceFieldName = 'resto_direccion'
        DestinationFieldName = 'events_import_extended'
      end
      item
        SourceFieldName = 'codigo_postal'
        DestinationFieldName = 'events_import_postal_code'
      end>
    LogFileAction = laCreate
    LogFileName = 'Data.log'
    LogFileEncoding = ecUTF8
    CommitCount = 10
    StatisticsInterval = 10
    Analyze = [taDelimSep, taFormatSet, taHeader, taFields]
    MaxErrors = -1
    OnProgress = bmvEventsImportProgress
    OnError = bmvEventsImportError
    Left = 576
    Top = 312
  end
  object bmvEventsImportReader: TFDBatchMoveTextReader
    DataDef.Fields = <
      item
        FieldName = '*username'
        DataType = atString
      end
      item
        FieldName = 'elemento'
        DataType = atString
      end
      item
        FieldName = 'username_elemento'
        DataType = atString
      end
      item
        FieldName = 'formato'
        DataType = atLongInt
      end
      item
        FieldName = '*categoria'
        DataType = atDateTime
      end
      item
        FieldName = 'titulo'
        DataType = atString
      end
      item
        FieldName = 'perfil'
        DataType = atString
      end
      item
        FieldName = 'desc_direccion'
        DataType = atString
      end
      item
        FieldName = 'url'
        DataType = atString
      end
      item
        FieldName = 'url_info'
        DataType = atNumber
        FieldSize = 1
      end
      item
        FieldName = '*inicio'
        DataType = atString
      end
      item
        FieldName = '*final'
        DataType = atString
      end
      item
        FieldName = 'etiquetas'
        DataType = atNumber
        FieldSize = 1
      end
      item
        FieldName = '*idioma'
        DataType = atLongInt
      end
      item
        FieldName = 'pais'
        DataType = atLongInt
      end
      item
        FieldName = 'provincia'
        DataType = atLongInt
      end
      item
        FieldName = 'ciudad'
        DataType = atLongInt
      end
      item
        FieldName = 'nombre_ciudad'
        DataType = atString
      end
      item
        FieldName = 'calle'
        DataType = atString
      end
      item
        FieldName = 'numero'
        DataType = atString
      end
      item
        FieldName = 'resto_direccion'
        DataType = atString
      end
      item
        FieldName = 'codigo_postal'
        DataType = atString
      end
      item
        FieldName = 'imagen'
        DataType = atString
      end
      item
        FieldName = 'estela'
        DataType = atString
      end>
    DataDef.WithFieldNames = True
    DataDef.FormatSettings.ThousandSeparator = #0
    DataDef.FormatSettings.DecimalSeparator = '.'
    Encoding = ecUTF8
    Left = 584
    Top = 368
  end
  object bmvEventsImportWriter: TFDBatchMoveDataSetWriter
    DataSet = tblEventsImport
    Optimise = False
    Left = 592
    Top = 432
  end
  object dsUsersElements: TDataSource
    DataSet = sqlUsersElements
    Left = 152
    Top = 120
  end
  object sqlUsersElements: TFDQuery
    IndexFieldNames = 'users_elements_id'
    MasterSource = dsEventsImport
    MasterFields = 'events_import_users_elements_id'
    DetailFields = 'users_elements_username'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  users_elements_id,'
      '  users_elements_username'
      'from  '
      '  users_elements'
      'where'
      '  users_elements_id = :events_import_users_elements_id'
      '  ')
    Left = 48
    Top = 120
    ParamData = <
      item
        Name = 'EVENTS_IMPORT_USERS_ELEMENTS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlUsersElementsusers_elements_id: TFDAutoIncField
      FieldName = 'users_elements_id'
      Origin = 'users_elements_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlUsersElementsusers_elements_username: TWideStringField
      DisplayLabel = 'Username en elemento'
      FieldName = 'users_elements_username'
      Origin = 'users_elements_username'
      ReadOnly = True
      Required = True
      Size = 340
    end
  end
  object sqlContentFormats: TFDQuery
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  c.content_formats_id,'
      '  cast(t.translations_text as char(100)) as content_format'
      'from  '
      '  content_formats as c'
      'join translations as t'
      '  on c.content_formats_name_tc = t.translations_code '
      'order by'
      '  content_format  ')
    Left = 48
    Top = 208
    object sqlContentFormatscontent_formats_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'content_formats_id'
      Origin = 'content_formats_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlContentFormatscontent_format: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'content_format'
      Origin = 'content_format'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsContentFormats: TDataSource
    DataSet = sqlContentFormats
    Left = 168
    Top = 208
  end
  object sqlCategories: TFDQuery
    BeforeOpen = sqlCategoriesBeforeOpen
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  c.categories_id,'
      '  cast(t.translations_text as char(100)) as category'
      'from  '
      '  categories as c'
      'join translations as t'
      '  on c.categories_name_tc = t.translations_code '
      'order by'
      '  category  ')
    Left = 48
    Top = 288
    object sqlCategoriescategory: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'category'
      Origin = 'category'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsCategories: TDataSource
    DataSet = sqlCategories
    Left = 152
    Top = 280
  end
  object sqlEventsImportCategories: TFDQuery
    BeforeOpen = sqlEventsImportCategoriesBeforeOpen
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  c.categories_id,'
      '  cast(t.translations_text as char(100)) as category'
      'from  '
      '  categories as c'
      'join translations as t'
      '  on c.categories_name_tc = t.translations_code '
      'order by'
      '  category  ')
    Left = 64
    Top = 368
    object sqlEventsImportCategoriescategory: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'category'
      Origin = 'category'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object dsEventsImportCategories: TDataSource
    DataSet = sqlEventsImportCategories
    Left = 168
    Top = 392
  end
  object sqlCategoriesList: TFDQuery
    BeforeOpen = sqlCategoriesBeforeOpen
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  c.categories_id,'
      '  cast(t.translations_text as char(100)) as category'
      'from  '
      '  categories as c'
      'join translations as t'
      '  on c.categories_name_tc = t.translations_code '
      'order by'
      '  category  ')
    Left = 64
    Top = 496
    object sqlCategoriesListcategories_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'categories_id'
      Origin = 'categories_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCategoriesListcategory: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'category'
      Origin = 'category'
      ProviderFlags = []
      ReadOnly = True
      Size = 133
    end
  end
  object sqlDuplicateEventImport: TFDQuery
    MasterSource = dsEventsImport
    MasterFields = 
      'events_import_username;events_import_elements_id;events_import_u' +
      'sers_elements_id;events_import_content_formats_id;events_import_' +
      'categories_id;events_import_title;events_import_profile;events_i' +
      'mport_addresses_desc;events_import_objects_poster_id;events_impo' +
      'rt_objects_stela_id;events_import_url;events_import_url_info;eve' +
      'nts_import_start;events_import_end;events_import_hashtags;events' +
      '_import_languages_id;events_import_countries_id;events_import_re' +
      'gions_id;events_import_provinces_id;events_import_cities_id;even' +
      'ts_import_cities_name;events_import_road_name;events_import_numb' +
      'er;events_import_extended;events_import_postal_code'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'INSERT INTO events_import'
      '(events_import_username,'
      'events_import_elements_id,'
      'events_import_users_elements_id,'
      'events_import_content_formats_id,'
      'events_import_categories_id,'
      'events_import_title,'
      'events_import_profile,'
      'events_import_addresses_desc,'
      'events_import_objects_poster_id,'
      'events_import_objects_stela_id,'
      'events_import_objects_import_poster_id,'
      'events_import_objects_import_stela_id,'
      'events_import_url,'
      'events_import_url_info,'
      'events_import_start,'
      'events_import_end,'
      'events_import_hashtags,'
      'events_import_languages_id,'
      'events_import_countries_id,'
      'events_import_regions_id,'
      'events_import_provinces_id,'
      'events_import_cities_id,'
      'events_import_cities_name,'
      'events_import_road_name,'
      'events_import_number,'
      'events_import_extended,'
      'events_import_postal_code)'
      'VALUES'
      '(:events_import_username,'
      ':events_import_elements_id,'
      ':events_import_users_elements_id,'
      ':events_import_content_formats_id,'
      ':events_import_categories_id,'
      ':events_import_title,'
      ':events_import_profile,'
      ':events_import_addresses_desc,'
      ':events_import_objects_poster_id,'
      ':events_import_objects_stela_id,'
      ':events_import_objects_import_poster_id,'
      ':events_import_objects_import_stela_id,'
      ':events_import_url,'
      ':events_import_url_info,'
      'date_add(:events_import_start, interval 1 minute),'
      'date_add(:events_import_end, interval 1 minute),'
      ':events_import_hashtags,'
      ':events_import_languages_id,'
      ':events_import_countries_id,'
      ':events_import_regions_id,'
      ':events_import_provinces_id,'
      ':events_import_cities_id,'
      ':events_import_cities_name,'
      ':events_import_road_name,'
      ':events_import_number,'
      ':events_import_extended,'
      ':events_import_postal_code)')
    Left = 376
    Top = 56
    ParamData = <
      item
        Name = 'EVENTS_IMPORT_USERNAME'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_ELEMENTS_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_USERS_ELEMENTS_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_CONTENT_FORMATS_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_CATEGORIES_ID'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_TITLE'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_PROFILE'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_ADDRESSES_DESC'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_OBJECTS_POSTER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_OBJECTS_STELA_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_OBJECTS_IMPORT_POSTER_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EVENTS_IMPORT_OBJECTS_IMPORT_STELA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EVENTS_IMPORT_URL'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_URL_INFO'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_START'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_END'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_HASHTAGS'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_LANGUAGES_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_COUNTRIES_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_REGIONS_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_PROVINCES_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_CITIES_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_CITIES_NAME'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_ROAD_NAME'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_NUMBER'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_EXTENDED'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'EVENTS_IMPORT_POSTAL_CODE'
        DataType = ftWideString
        ParamType = ptInput
      end>
  end
  object sqlEventsImportObjects: TFDQuery
    IndexFieldNames = 'events_import_id'
    MasterSource = dsEventsImport
    MasterFields = 'events_import_id'
    DetailFields = 'events_import_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '        e.events_import_id,'
      #9'e.events_import_username,'
      #9'stela.objects_path as stela_path,'
      '    stela.objects_name as stela_name,    '
      #9'poster.objects_path as poster_path,'
      '    poster.objects_name as poster_name,    '
      #9'import_stela.objects_import_path as import_stela_path,'
      '    import_stela.objects_import_name as import_stela_name,    '
      #9'import_poster.objects_import_path as import_poster_path,'
      '    import_poster.objects_import_name as import_poster_name'
      'from'
      #9'events_import e'
      'left join objects stela'
      #9'on stela.objects_id = e.events_import_objects_stela_id'
      'left join objects poster'
      #9'on poster.objects_id = e.events_import_objects_poster_id'
      'left join objects_import import_stela'
      
        #9'on import_stela.objects_import_id = e.events_import_objects_imp' +
        'ort_stela_id'
      'left join objects_import import_poster'
      
        #9'on import_poster.objects_import_id = e.events_import_objects_im' +
        'port_poster_id'
      'order by'
      '  e.events_import_id'
      '  ')
    Left = 736
    Top = 240
    object sqlEventsImportObjectsevents_import_id: TFDAutoIncField
      FieldName = 'events_import_id'
      Origin = 'events_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlEventsImportObjectsevents_import_username: TWideStringField
      FieldName = 'events_import_username'
      Origin = 'events_import_username'
      Required = True
      Size = 200
    end
    object sqlEventsImportObjectsstela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlEventsImportObjectsstela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlEventsImportObjectsposter_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel'
      FieldName = 'poster_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlEventsImportObjectsposter_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel'
      FieldName = 'poster_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlEventsImportObjectsimport_stela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela importada'
      FieldName = 'import_stela_path'
      Origin = 'objects_import_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlEventsImportObjectsimport_stela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela importada'
      FieldName = 'import_stela_name'
      Origin = 'objects_import_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlEventsImportObjectsimport_poster_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel importado'
      FieldName = 'import_poster_path'
      Origin = 'objects_import_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlEventsImportObjectsimport_poster_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel importado'
      FieldName = 'import_poster_name'
      Origin = 'objects_import_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
  end
  object dsEventsImportObjects: TDataSource
    DataSet = sqlEventsImportObjects
    Left = 848
    Top = 256
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
    Left = 128
    Top = 576
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
    Left = 216
    Top = 576
  end
end
