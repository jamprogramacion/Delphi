object dmUsersImport: TdmUsersImport
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 807
  Width = 1100
  object bmvUsersImport: TFDBatchMove
    Reader = bmvUsersImportReader
    Writer = bmvUsersImportWriter
    Mappings = <
      item
        SourceFieldName = '*username'
        DestinationFieldName = 'users_import_username'
      end
      item
        SourceFieldName = '*email'
        DestinationFieldName = 'users_import_email'
      end
      item
        SourceFieldName = '*nickname'
        DestinationFieldName = 'users_import_nickname'
      end
      item
        SourceFieldName = '*idioma'
        DestinationFieldName = 'users_import_languages_id'
      end
      item
        SourceFieldName = '*genero'
        DestinationFieldName = 'users_import_genders_id'
      end
      item
        SourceFieldName = '*fecha_nacimiento'
        DestinationFieldName = 'users_import_birth_date'
      end
      item
        SourceFieldName = '*pais'
        DestinationFieldName = 'users_import_countries_id'
      end
      item
        SourceFieldName = '*provincia'
        DestinationFieldName = 'users_import_provinces_id'
      end
      item
        SourceFieldName = 'url'
        DestinationFieldName = 'users_import_url'
      end
      item
        SourceFieldName = 'estado'
        DestinationFieldName = 'users_import_status'
      end
      item
        SourceFieldName = 'perfil'
        DestinationFieldName = 'users_import_profile'
      end
      item
        SourceFieldName = 'contacto'
        DestinationFieldName = 'users_import_contact'
      end
      item
        SourceFieldName = 'es_marca'
        DestinationFieldName = 'users_import_brand'
      end
      item
        SourceFieldName = 'nombre'
        DestinationFieldName = 'users_import_name'
      end
      item
        SourceFieldName = 'apellidos'
        DestinationFieldName = 'users_import_surname'
      end
      item
        SourceFieldName = 'es_empresa'
        DestinationFieldName = 'users_import_company'
      end
      item
        SourceFieldName = 'ciudad'
        DestinationFieldName = 'users_import_cities_id'
      end
      item
        SourceFieldName = 'nombre_ciudad'
        DestinationFieldName = 'users_import_cities_name'
      end
      item
        SourceFieldName = 'calle'
        DestinationFieldName = 'users_import_road_name'
      end
      item
        SourceFieldName = 'numero'
        DestinationFieldName = 'users_import_number'
      end
      item
        SourceFieldName = 'resto_direccion'
        DestinationFieldName = 'users_import_extended'
      end
      item
        SourceFieldName = 'codigo_postal'
        DestinationFieldName = 'users_import_postal_code'
      end
      item
        SourceFieldName = 'prefijo_telefono'
        DestinationFieldName = 'users_import_mobile_pref'
      end
      item
        SourceFieldName = 'numero_telefono'
        DestinationFieldName = 'users_import_mobile_num'
      end
      item
        SourceFieldName = 'tipo_documento'
        DestinationFieldName = 'users_import_ident_documents_id'
      end
      item
        SourceFieldName = 'numero_documento'
        DestinationFieldName = 'users_import_ident_documents_number'
      end>
    LogFileAction = laCreate
    LogFileName = 'Data.log'
    LogFileEncoding = ecUTF8
    CommitCount = 10
    StatisticsInterval = 10
    Analyze = [taDelimSep, taFormatSet, taHeader, taFields]
    MaxErrors = -1
    OnProgress = bmvUsersImportProgress
    OnError = bmvUsersImportError
    Left = 512
    Top = 464
  end
  object bmvUsersImportReader: TFDBatchMoveTextReader
    DataDef.Fields = <
      item
        FieldName = '*username'
        DataType = atString
      end
      item
        FieldName = '*email'
        DataType = atString
      end
      item
        FieldName = '*nickname'
        DataType = atString
      end
      item
        FieldName = '*idioma'
        DataType = atLongInt
      end
      item
        FieldName = '*genero'
        DataType = atLongInt
      end
      item
        FieldName = '*fecha_nacimiento'
        DataType = atDateTime
      end
      item
        FieldName = '*pais'
        DataType = atLongInt
      end
      item
        FieldName = '*provincia'
        DataType = atLongInt
      end
      item
        FieldName = 'url'
        DataType = atString
      end
      item
        FieldName = 'estado'
        DataType = atString
      end
      item
        FieldName = 'perfil'
        DataType = atString
      end
      item
        FieldName = 'contacto'
        DataType = atString
      end
      item
        FieldName = 'es_marca'
        DataType = atNumber
        FieldSize = 1
      end
      item
        FieldName = 'nombre'
        DataType = atString
      end
      item
        FieldName = 'apellidos'
        DataType = atString
      end
      item
        FieldName = 'es_empresa'
        DataType = atNumber
        FieldSize = 1
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
        FieldName = 'prefijo_telefono'
        DataType = atString
      end
      item
        FieldName = 'numero_telefono'
        DataType = atString
      end
      item
        FieldName = 'tipo_documento'
        DataType = atLongInt
      end
      item
        FieldName = 'numero_documento'
        DataType = atString
      end
      item
        FieldName = 'imagen'
        DataType = atString
      end
      item
        FieldName = 'estela'
        DataType = atString
      end
      item
        FieldName = 'estela_publica'
        DataType = atString
      end
      item
        FieldName = 'cartel'
        DataType = atString
      end>
    DataDef.WithFieldNames = True
    DataDef.FormatSettings.ThousandSeparator = #0
    DataDef.FormatSettings.DecimalSeparator = '.'
    Encoding = ecUTF8
    Left = 520
    Top = 520
  end
  object bmvUsersImportWriter: TFDBatchMoveDataSetWriter
    DataSet = tblUsersImport
    Optimise = False
    Left = 528
    Top = 584
  end
  object tblUsersImport: TFDTable
    AfterInsert = tblUsersImportAfterInsert
    BeforePost = tblUsersImportBeforePost
    AfterPost = tblUsersImportAfterPost
    BeforeDelete = tblUsersImportBeforeDelete
    AfterScroll = tblUsersImportAfterScroll
    IndexName = 'PRIMARY'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.KeyFields = 'users_import_id'
    TableName = 'users_import'
    Left = 192
    Top = 40
    object tblUsersImportusers_import_id: TFDAutoIncField
      FieldName = 'users_import_id'
      Origin = 'users_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblUsersImportusers_import_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'users_import_username'
      Origin = 'users_import_username'
      Required = True
      OnChange = tblUsersImportusers_import_usernameChange
      Size = 200
    end
    object tblUsersImportusers_import_email: TWideStringField
      DisplayLabel = 'Email'
      FieldName = 'users_import_email'
      Origin = 'users_import_email'
      Required = True
      OnChange = tblUsersImportusers_import_emailChange
      Size = 340
    end
    object tblUsersImportusers_import_url: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'URL'
      FieldName = 'users_import_url'
      Origin = 'users_import_url'
      Size = 340
    end
    object tblUsersImportusers_import_nickname: TWideStringField
      DisplayLabel = 'Nickname'
      FieldName = 'users_import_nickname'
      Origin = 'users_import_nickname'
      Required = True
      OnChange = tblUsersImportusers_import_nicknameChange
      Size = 200
    end
    object tblUsersImportusers_import_status: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_status'
      Origin = 'users_import_status'
      Size = 340
    end
    object tblUsersImportusers_import_profile: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_profile'
      Origin = 'users_import_profile'
      Size = 666
    end
    object tblUsersImportusers_import_contact: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Contacto'
      FieldName = 'users_import_contact'
      Origin = 'users_import_contact'
      Size = 340
    end
    object tblUsersImportusers_import_genders_id: TByteField
      DisplayLabel = 'G'#233'nero'
      FieldName = 'users_import_genders_id'
      Origin = 'users_import_genders_id'
      Required = True
      OnChange = tblUsersImportusers_import_genders_idChange
    end
    object tblUsersImportusers_import_levels_id: TWordField
      AutoGenerateValue = arDefault
      DefaultExpression = '2'
      DisplayLabel = 'Nivel'
      FieldName = 'users_import_levels_id'
      Origin = 'users_import_levels_id'
      Required = True
    end
    object tblUsersImportusers_import_birth_date: TDateField
      DefaultExpression = 'current_date'
      DisplayLabel = 'Fecha nacimiento'
      FieldName = 'users_import_birth_date'
      Origin = 'users_import_birth_date'
      Required = True
      OnChange = tblUsersImportusers_import_birth_dateChange
    end
    object tblUsersImportusers_import_languages_id: TWordField
      DefaultExpression = '43'
      FieldName = 'users_import_languages_id'
      Origin = 'users_import_languages_id'
      Required = True
      OnChange = tblUsersImportusers_import_languages_idChange
    end
    object tblUsersImportusers_import_brand: TShortintField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #191'Es marca?'
      FieldName = 'users_import_brand'
      Origin = 'users_import_brand'
      MaxValue = 1
    end
    object tblUsersImportusers_import_objects_img_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_img_id'
      Origin = 'users_import_objects_img_id'
    end
    object tblUsersImportusers_import_objects_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_stela_id'
      Origin = 'users_import_objects_stela_id'
    end
    object tblUsersImportusers_import_objects_public_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_public_stela_id'
      Origin = 'users_import_objects_public_stela_id'
    end
    object tblUsersImportusers_import_objects_poster_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_poster_id'
      Origin = 'users_import_objects_poster_id'
    end
    object tblUsersImportusers_import_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nombre'
      FieldName = 'users_import_name'
      Origin = 'users_import_name'
      Size = 340
    end
    object tblUsersImportusers_import_objects_import_img_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_import_img_id'
      Origin = 'users_import_objects_import_img_id'
    end
    object tblUsersImportusers_import_objects_import_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_import_stela_id'
      Origin = 'users_import_objects_import_stela_id'
    end
    object tblUsersImportusers_import_objects_import_public_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_import_public_stela_id'
      Origin = 'users_import_objects_import_public_stela_id'
    end
    object tblUsersImportusers_import_objects_import_poster_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_objects_import_poster_id'
      Origin = 'users_import_objects_import_poster_id'
    end
    object tblUsersImportusers_import_surname: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Apellido(s)'
      FieldName = 'users_import_surname'
      Origin = 'users_import_surname'
      Size = 340
    end
    object tblUsersImportusers_import_company: TByteField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #191'Es una compa'#241#237'a?'
      FieldName = 'users_import_company'
      Origin = 'users_import_company'
      MaxValue = 1
    end
    object tblUsersImportusers_import_ident_documents_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tipo de documento'
      FieldName = 'users_import_ident_documents_id'
      Origin = 'users_import_ident_documents_id'
      OnChange = tblUsersImportusers_import_ident_documents_idChange
    end
    object tblUsersImportusers_import_ident_documents_number: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N'#250'mero del documento'
      FieldName = 'users_import_ident_documents_number'
      Origin = 'users_import_ident_documents_number'
      OnChange = tblUsersImportusers_import_ident_documents_numberChange
      Size = 66
    end
    object tblUsersImportusers_import_mobile_pref: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Prefijo telef'#243'nico'
      FieldName = 'users_import_mobile_pref'
      Origin = 'users_import_mobile_pref'
      OnChange = tblUsersImportusers_import_mobile_prefChange
      Size = 13
    end
    object tblUsersImportusers_import_mobile_num: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N'#250'mero de tel'#233'fono'
      FieldName = 'users_import_mobile_num'
      Origin = 'users_import_mobile_num'
      Size = 26
    end
    object tblUsersImportusers_import_countries_id: TWordField
      AutoGenerateValue = arDefault
      DefaultExpression = '208'
      FieldName = 'users_import_countries_id'
      Origin = 'users_import_countries_id'
      Required = True
      OnChange = tblUsersImportusers_import_countries_idChange
    end
    object tblUsersImportusers_import_regions_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_regions_id'
      Origin = 'users_import_regions_id'
      OnChange = tblUsersImportusers_import_regions_idChange
    end
    object tblUsersImportusers_import_provinces_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_provinces_id'
      Origin = 'users_import_provinces_id'
      Required = True
      OnChange = tblUsersImportusers_import_provinces_idChange
    end
    object tblUsersImportusers_import_cities_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_cities_id'
      Origin = 'users_import_cities_id'
      OnChange = tblUsersImportusers_import_cities_idChange
    end
    object tblUsersImportusers_import_cities_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ciudad (si no aparece en la lista)'
      FieldName = 'users_import_cities_name'
      Origin = 'users_import_cities_name'
      Size = 133
    end
    object tblUsersImportusers_import_road_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tipo y nombre de la v'#237'a'
      FieldName = 'users_import_road_name'
      Origin = 'users_import_road_name'
      Size = 340
    end
    object tblUsersImportusers_import_number: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N'#250'mero'
      FieldName = 'users_import_number'
      Origin = 'users_import_number'
      Size = 26
    end
    object tblUsersImportusers_import_extended: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Resto direcci'#243'n'
      FieldName = 'users_import_extended'
      Origin = 'users_import_extended'
      Size = 133
    end
    object tblUsersImportusers_import_postal_code: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo postal'
      FieldName = 'users_import_postal_code'
      Origin = 'users_import_postal_code'
      Size = 26
    end
    object tblUsersImportusers_import_legal_id: TLongWordField
      DefaultExpression = '1'
      FieldName = 'users_import_legal_id'
      Origin = 'users_import_legal_id'
      Required = True
      OnChange = tblUsersImportusers_import_legal_idChange
    end
    object tblUsersImportusers_import_imported: TByteField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = 'Importado'
      FieldName = 'users_import_imported'
      Origin = 'users_import_imported'
    end
    object tblUsersImportusers_import_users_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_users_id'
      Origin = 'users_import_users_id'
    end
    object tblUsersImportusers_import_delete: TByteField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = 'Borrar tras importar'
      FieldName = 'users_import_delete'
      Origin = 'users_import_delete'
    end
    object tblUsersImportusers_import_stamp: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_stamp'
      Origin = 'users_import_stamp'
    end
    object tblUsersImportusers_import_last_mod: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_last_mod'
      Origin = 'users_import_last_mod'
    end
  end
  object dsUsersImport: TDataSource
    DataSet = tblUsersImport
    OnStateChange = dsUsersImportStateChange
    OnDataChange = dsUsersImportDataChange
    Left = 280
    Top = 40
  end
  object sqlUsernameUnique: TFDQuery
    MasterSource = dsUsersImport
    MasterFields = 'users_import_username;users_import_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  users_username as username'
      'from'
      '  users'
      'where'
      '  users_username = :users_import_username'
      ''
      'union'
      ''
      'select'
      '  users_temps_username as username'
      'from'
      '  users_temps'
      'where'
      '  users_temps_username = :users_import_username'
      ''
      'union'
      ''
      'select'
      '  users_import_username as username'
      'from'
      '  users_import'
      'where'
      '  (users_import_id <> :users_import_id)'
      '  and (users_import_username = :users_import_username)'
      '')
    Left = 624
    Top = 48
    ParamData = <
      item
        Name = 'USERS_IMPORT_USERNAME'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USERS_IMPORT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object tblCountries: TFDTable
    IndexName = 'countries_name'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'countries'
    Left = 200
    Top = 152
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
    Left = 280
    Top = 144
  end
  object dsRegions: TDataSource
    DataSet = tblRegions
    Left = 272
    Top = 272
  end
  object dsProvinces: TDataSource
    DataSet = tblProvinces
    Left = 272
    Top = 216
  end
  object dsCities: TDataSource
    DataSet = tblCities
    Left = 296
    Top = 336
  end
  object tblRegions: TFDTable
    IndexFieldNames = 'regions_id'
    MasterSource = dsUsersImport
    MasterFields = 'users_import_regions_id'
    DetailFields = 'regions_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'regions'
    Left = 200
    Top = 280
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
    MasterSource = dsUsersImport
    MasterFields = 'users_import_countries_id'
    DetailFields = 'provinces_countries_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'provinces'
    Left = 192
    Top = 216
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
    MasterSource = dsUsersImport
    MasterFields = 'users_import_provinces_id'
    DetailFields = 'cities_provinces_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'cities'
    Left = 200
    Top = 344
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
  object sqlPhonePrefix: TFDQuery
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  countries_id,'
      '  countries_name,'
      '  countries_phone_prefix,'
      
        '  concat(countries_name,'#39' ('#39',countries_phone_prefix,'#39')'#39') as coun' +
        'try_prefix'
      'from'
      '  countries'
      'order by'
      '  countries_name  ')
    Left = 208
    Top = 416
    object sqlPhonePrefixcountries_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'countries_id'
      Origin = 'countries_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlPhonePrefixcountries_name: TWideStringField
      FieldName = 'countries_name'
      Origin = 'countries_name'
      Required = True
      Size = 66
    end
    object sqlPhonePrefixcountries_phone_prefix: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'countries_phone_prefix'
      Origin = 'countries_phone_prefix'
      Size = 6
    end
    object sqlPhonePrefixcountry_prefix: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'country_prefix'
      Origin = 'country_prefix'
      ProviderFlags = []
      ReadOnly = True
      Size = 77
    end
  end
  object dsPhonePrefix: TDataSource
    DataSet = sqlPhonePrefix
    Left = 320
    Top = 424
  end
  object sqlGenders: TFDQuery
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  g.genders_id,'
      '  cast(t.translations_text as char(50)) as gender'
      'from  '
      '  genders as g'
      'join translations as t'
      '  on g.genders_desc_tc = t.translations_code '
      'order by'
      '  gender  ')
    Left = 448
    Top = 144
    object sqlGendersgenders_id: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'genders_id'
      Origin = 'genders_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlGendersgender: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'gender'
      Origin = 'gender'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
  end
  object dsGenders: TDataSource
    DataSet = sqlGenders
    Left = 536
    Top = 144
  end
  object sqlIdentDocuments: TFDQuery
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  i.ident_documents_id,'
      '  cast(t.translations_text as char(50)) as ident_document'
      'from  '
      '  ident_documents as i'
      'join translations as t'
      '  on i.ident_documents_desc_tc = t.translations_code '
      'order by'
      '  ident_document  ')
    Left = 448
    Top = 216
    object sqlIdentDocumentsident_documents_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'ident_documents_id'
      Origin = 'ident_documents_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlIdentDocumentsident_document: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ident_document'
      Origin = 'ident_document'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
  end
  object dsIdentDocuments: TDataSource
    DataSet = sqlIdentDocuments
    Left = 560
    Top = 224
  end
  object sqlEmailUnique: TFDQuery
    MasterSource = dsUsersImport
    MasterFields = 'users_import_email;users_import_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    SQL.Strings = (
      'select'
      '  users_email as email'
      'from'
      '  users'
      'where'
      '  users_email = :users_import_email'
      ''
      'union'
      ''
      'select'
      '  users_temps_email as email'
      'from'
      '  users_temps'
      'where'
      '  users_temps_email = :users_import_email'
      ''
      'union'
      ''
      'select'
      '  users_import_email as email'
      'from'
      '  users_import'
      'where'
      '  (users_import_id <> :users_import_id)'
      '  and (users_import_email = :users_import_email)')
    Left = 704
    Top = 120
    ParamData = <
      item
        Name = 'USERS_IMPORT_EMAIL'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USERS_IMPORT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sqlDuplicateUserImport: TFDQuery
    MasterSource = dsUsersImport
    MasterFields = 
      'users_import_url;users_import_nickname;users_import_status;users' +
      '_import_profile;users_import_contact;users_import_genders_id;use' +
      'rs_import_birth_date;users_import_languages_id;users_import_bran' +
      'd;users_import_objects_img_id;users_import_objects_stela_id;user' +
      's_import_objects_public_stela_id;users_import_objects_poster_id;' +
      'users_import_name;users_import_surname;users_import_company;user' +
      's_import_ident_documents_id;users_import_ident_documents_number;' +
      'users_import_mobile_pref;users_import_mobile_num;users_import_co' +
      'untries_id;users_import_regions_id;users_import_provinces_id;use' +
      'rs_import_cities_id;users_import_cities_name;users_import_road_n' +
      'ame;users_import_number;users_import_extended;users_import_posta' +
      'l_code;users_import_legal_id'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'INSERT INTO users_import'
      '(users_import_username,'
      'users_import_email,'
      'users_import_url,'
      'users_import_nickname,'
      'users_import_status,'
      'users_import_profile,'
      'users_import_contact,'
      'users_import_genders_id,'
      'users_import_birth_date,'
      'users_import_languages_id,'
      'users_import_brand,'
      'users_import_objects_img_id,'
      'users_import_objects_stela_id,'
      'users_import_objects_public_stela_id,'
      'users_import_objects_poster_id,'
      'users_import_objects_import_img_id,'
      'users_import_objects_import_stela_id,'
      'users_import_objects_import_public_stela_id,'
      'users_import_objects_import_poster_id,'
      'users_import_name,'
      'users_import_surname,'
      'users_import_company,'
      'users_import_ident_documents_id,'
      'users_import_ident_documents_number,'
      'users_import_mobile_pref,'
      'users_import_mobile_num,'
      'users_import_countries_id,'
      'users_import_regions_id,'
      'users_import_provinces_id,'
      'users_import_cities_id,'
      'users_import_cities_name,'
      'users_import_road_name,'
      'users_import_number,'
      'users_import_extended,'
      'users_import_postal_code,'
      'users_import_legal_id)'
      'VALUES'
      '(hex(uuid_short()),'
      'concat(hex(uuid_short()), "@whyuon.com"),'
      ':users_import_url,'
      'hex(uuid_short()),'
      ':users_import_status,'
      ':users_import_profile,'
      ':users_import_contact,'
      ':users_import_genders_id,'
      ':users_import_birth_date,'
      ':users_import_languages_id,'
      ':users_import_brand,'
      ':users_import_objects_img_id,'
      ':users_import_objects_stela_id,'
      ':users_import_objects_public_stela_id,'
      ':users_import_objects_poster_id,'
      ':users_import_objects_import_img_id,'
      ':users_import_objects_import_stela_id,'
      ':users_import_objects_import_public_stela_id,'
      ':users_import_objects_import_poster_id,'
      ':users_import_name,'
      ':users_import_surname,'
      ':users_import_company,'
      ':users_import_ident_documents_id,'
      ':users_import_ident_documents_number,'
      ':users_import_mobile_pref,'
      ':users_import_mobile_num,'
      ':users_import_countries_id,'
      ':users_import_regions_id,'
      ':users_import_provinces_id,'
      ':users_import_cities_id,'
      ':users_import_cities_name,'
      ':users_import_road_name,'
      ':users_import_number,'
      ':users_import_extended,'
      ':users_import_postal_code,'
      ':users_import_legal_id)'
      '')
    Left = 416
    Top = 48
    ParamData = <
      item
        Name = 'USERS_IMPORT_URL'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_STATUS'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_PROFILE'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_CONTACT'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_GENDERS_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_BIRTH_DATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_LANGUAGES_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_BRAND'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_IMG_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_STELA_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_PUBLIC_STELA_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_POSTER_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_IMPORT_IMG_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_IMPORT_STELA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_IMPORT_PUBLIC_STELA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USERS_IMPORT_OBJECTS_IMPORT_POSTER_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USERS_IMPORT_NAME'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_SURNAME'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_COMPANY'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_IDENT_DOCUMENTS_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_IDENT_DOCUMENTS_NUMBER'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_MOBILE_PREF'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_MOBILE_NUM'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_COUNTRIES_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_REGIONS_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_PROVINCES_ID'
        DataType = ftWord
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_CITIES_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_CITIES_NAME'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_ROAD_NAME'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_NUMBER'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_EXTENDED'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_POSTAL_CODE'
        DataType = ftWideString
        ParamType = ptInput
      end
      item
        Name = 'USERS_IMPORT_LEGAL_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sqlUsersImportObjects: TFDQuery
    IndexFieldNames = 'users_import_username'
    MasterSource = dsUsersImport
    MasterFields = 'users_import_username'
    DetailFields = 'users_import_username'
    Connection = dmImportData.connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      #9'u.users_import_username,'
      #9'img.objects_path as img_path,'
      '    img.objects_name as img_name,'
      #9'stela.objects_path as stela_path,'
      '    stela.objects_name as stela_name,    '
      #9'poster.objects_path as poster_path,'
      '    poster.objects_name as poster_name,    '
      #9'public_stela.objects_path as public_stela_path,'
      '    public_stela.objects_name as public_stela_name,    '
      #9'import_img.objects_import_path as import_img_path,'
      '    import_img.objects_import_name as import_img_name,'
      #9'import_stela.objects_import_path as import_stela_path,'
      '    import_stela.objects_import_name as import_stela_name,    '
      #9'import_poster.objects_import_path as import_poster_path,'
      '    import_poster.objects_import_name as import_poster_name,    '
      
        #9'import_public_stela.objects_import_path as import_public_stela_' +
        'path,'
      
        '    import_public_stela.objects_import_name as import_public_ste' +
        'la_name'
      'from'
      #9'users_import u'
      'left join objects img'
      #9'on img.objects_id = u.users_import_objects_img_id'
      'left join objects stela'
      #9'on stela.objects_id = u.users_import_objects_stela_id'
      'left join objects poster'
      #9'on poster.objects_id = u.users_import_objects_poster_id'
      'left join objects public_stela'
      
        #9'on public_stela.objects_id = u.users_import_objects_public_stel' +
        'a_id'
      'left join objects_import import_img'
      
        #9'on import_img.objects_import_id = u.users_import_objects_import' +
        '_img_id'
      'left join objects_import import_stela'
      
        #9'on import_stela.objects_import_id = u.users_import_objects_impo' +
        'rt_stela_id'
      'left join objects_import import_poster'
      
        #9'on import_poster.objects_import_id = u.users_import_objects_imp' +
        'ort_poster_id'
      'left join objects_import import_public_stela'
      
        #9'on import_public_stela.objects_import_id = u.users_import_objec' +
        'ts_import_public_stela_id'
      'order by'
      '  u.users_import_username'
      '  ')
    Left = 736
    Top = 240
    object sqlUsersImportObjectsusers_import_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'users_import_username'
      Origin = 'users_import_username'
      Required = True
      Size = 200
    end
    object sqlUsersImportObjectsimg_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imagen'
      FieldName = 'img_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectsimg_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imagen'
      FieldName = 'img_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersImportObjectsstela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectsstela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela'
      FieldName = 'stela_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersImportObjectsposter_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel'
      FieldName = 'poster_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectsposter_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel'
      FieldName = 'poster_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersImportObjectspublic_stela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela p'#250'blica'
      FieldName = 'public_stela_path'
      Origin = 'objects_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectspublic_stela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela p'#250'blica'
      FieldName = 'public_stela_name'
      Origin = 'objects_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersImportObjectsimport_img_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imagen importada'
      FieldName = 'import_img_path'
      Origin = 'objects_import_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectsimport_img_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imagen importada'
      FieldName = 'import_img_name'
      Origin = 'objects_import_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersImportObjectsimport_stela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela importada'
      FieldName = 'import_stela_path'
      Origin = 'objects_import_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectsimport_stela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela importada'
      FieldName = 'import_stela_name'
      Origin = 'objects_import_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersImportObjectsimport_poster_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel  importado'
      FieldName = 'import_poster_path'
      Origin = 'objects_import_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectsimport_poster_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cartel  importado'
      FieldName = 'import_poster_name'
      Origin = 'objects_import_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUsersImportObjectsimport_public_stela_path: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela p'#250'blica importada'
      FieldName = 'import_public_stela_path'
      Origin = 'objects_import_path'
      ProviderFlags = []
      ReadOnly = True
      Size = 340
    end
    object sqlUsersImportObjectsimport_public_stela_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estela p'#250'blica importada'
      FieldName = 'import_public_stela_name'
      Origin = 'objects_import_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
  end
  object dsUsersImportObjects: TDataSource
    DataSet = sqlUsersImportObjects
    Left = 848
    Top = 256
  end
  object tblUsers: TFDTable
    IndexName = 'users_username'
    MasterSource = dsUsersImport
    MasterFields = 'users_import_username'
    DetailFields = 'users_username'
    Connection = dmImportData.connWhyuon
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'users'
    Left = 736
    Top = 360
    object tblUsersusers_id: TFDAutoIncField
      FieldName = 'users_id'
      Origin = 'users_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblUsersusers_password_desc: TWideStringField
      FieldName = 'users_password_desc'
      Origin = 'users_password_desc'
      Required = True
      Size = 340
    end
    object tblUsersusers_password_reset: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_password_reset'
      Origin = 'users_password_reset'
      FixedChar = True
      Size = 42
    end
    object tblUsersusers_password_reset_expire: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_password_reset_expire'
      Origin = 'users_password_reset_expire'
    end
    object tblUsersusers_owncode: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_owncode'
      Origin = 'users_owncode'
    end
    object tblUsersusers_username: TWideStringField
      FieldName = 'users_username'
      Origin = 'users_username'
      Required = True
      Size = 200
    end
    object tblUsersusers_email: TWideStringField
      FieldName = 'users_email'
      Origin = 'users_email'
      Required = True
      Size = 340
    end
    object tblUsersusers_nickname: TWideStringField
      FieldName = 'users_nickname'
      Origin = 'users_nickname'
      Required = True
      Size = 200
    end
    object tblUsersusers_profile: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_profile'
      Origin = 'users_profile'
      Size = 666
    end
    object tblUsersusers_genders_id: TByteField
      FieldName = 'users_genders_id'
      Origin = 'users_genders_id'
      Required = True
    end
    object tblUsersusers_birth_date: TDateField
      FieldName = 'users_birth_date'
      Origin = 'users_birth_date'
      Required = True
    end
    object tblUsersusers_languages_id: TWordField
      FieldName = 'users_languages_id'
      Origin = 'users_languages_id'
      Required = True
    end
    object tblUsersusers_brand: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'users_brand'
      Origin = 'users_brand'
    end
    object tblUsersusers_public: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'users_public'
      Origin = 'users_public'
    end
    object tblUsersusers_levels_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_levels_id'
      Origin = 'users_levels_id'
    end
    object tblUsersusers_stamp: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_stamp'
      Origin = 'users_stamp'
    end
    object tblUsersusers_objects_img_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_img_id'
      Origin = 'users_objects_img_id'
    end
    object tblUsersusers_objects_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_stela_id'
      Origin = 'users_objects_stela_id'
    end
    object tblUsersusers_objects_public_stela_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_public_stela_id'
      Origin = 'users_objects_public_stela_id'
    end
    object tblUsersusers_last_conn: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_last_conn'
      Origin = 'users_last_conn'
    end
    object tblUsersusers_last_mod: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_last_mod'
      Origin = 'users_last_mod'
    end
    object tblUsersusers_url: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_url'
      Origin = 'users_url'
      Size = 340
    end
    object tblUsersusers_status: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_status'
      Origin = 'users_status'
      Size = 340
    end
    object tblUsersusers_objects_poster_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_poster_id'
      Origin = 'users_objects_poster_id'
    end
    object tblUsersusers_contact: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_contact'
      Origin = 'users_contact'
      Size = 340
    end
  end
  object sqlViewEditUsersImport: TFDQuery
    Connection = dmImportData.connWhyuon
    SQL.Strings = (
      'select count(users_id) as users_count'
      'from view_edit_users_import'
      'where'
      '  (users_username = :users_import_username)'
      '  and (users_email = :users_import_email)'
      '  and ((users_last_mod > users_import_last_mod)'
      '    or (users_details_last_mod > users_import_last_mod)'
      '    or (addresses_last_mod > users_import_last_mod))')
    Left = 72
    Top = 448
    ParamData = <
      item
        Name = 'USERS_IMPORT_USERNAME'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USERS_IMPORT_EMAIL'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
    object sqlViewEditUsersImportusers_count: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'users_count'
      Origin = 'users_count'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object sqlLevels: TFDQuery
    Connection = dmImportData.connWhyuon
    SQL.Strings = (
      'select'
      '  l.levels_id,'
      '  cast(t.translations_text as char(50)) as levels'
      'from  '
      '  levels as l'
      'join translations as t'
      '  on l.levels_desc_tc = t.translations_code '
      'order by'
      '  levels ')
    Left = 448
    Top = 296
    object sqlLevelslevels_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'levels_id'
      Origin = 'levels_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlLevelslevels: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'levels'
      Origin = 'levels'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
  end
  object dsLevels: TDataSource
    DataSet = sqlLevels
    Left = 520
    Top = 296
  end
  object sqlCopyUserToImport: TFDQuery
    Connection = dmImportData.connWhyuon
    SQL.Strings = (
      'call CopyUserToImport(:user_id);')
    Left = 232
    Top = 528
    ParamData = <
      item
        Name = 'USER_ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlAddressIncomplete: TFDQuery
    Connection = dmImportData.connWhyuon
    SQL.Strings = (
      'select'
      '  users_import_countries_id *'
      '  users_import_regions_id *'
      '  users_import_provinces_id as address_id'
      'from'
      '  users_import'
      'where'
      '  users_import_username = :users_import_username ')
    Left = 232
    Top = 592
    ParamData = <
      item
        Name = 'USERS_IMPORT_USERNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object sqlAddressIncompleteaddress_id: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'address_id'
      Origin = 'address_id'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
