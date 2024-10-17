object dmImportData: TdmImportData
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 804
  Width = 1091
  object lnkMariaDB: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Program Files (x86)\MariaDB\MariaDB Connector C\lib\libmariad' +
      'b.dll'
    Left = 64
    Top = 16
  end
  object connWhyuon: TFDConnection
    Params.Strings = (
      'Server=whyuon.com'
      'User_Name=develop'
      'UseSSL=True'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 64
    Top = 80
  end
  object tblLanguages: TFDTable
    IndexFieldNames = 'languages_id'
    Connection = connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'languages'
    Left = 224
    Top = 32
    object tblLanguageslanguages_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'languages_id'
      Origin = 'languages_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblLanguageslanguages_code: TWideStringField
      FieldName = 'languages_code'
      Origin = 'languages_code'
      Required = True
      Size = 26
    end
    object tblLanguageslanguages_name: TWideStringField
      FieldName = 'languages_name'
      Origin = 'languages_name'
      Required = True
      Size = 40
    end
    object tblLanguageslanguages_active: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'languages_active'
      Origin = 'languages_active'
    end
  end
  object tblUsersObjects: TFDTable
    IndexFieldNames = 'users_objects_id'
    MasterFields = 'users_id'
    DetailFields = 'users_objects_users_id'
    Connection = connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'users_objects'
    Left = 368
    Top = 232
    object tblUsersObjectsusers_objects_id: TFDAutoIncField
      FieldName = 'users_objects_id'
      Origin = 'users_objects_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblUsersObjectsusers_objects_users_id: TLongWordField
      FieldName = 'users_objects_users_id'
      Origin = 'users_objects_users_id'
      Required = True
    end
    object tblUsersObjectsusers_objects_objects_id: TLongWordField
      FieldName = 'users_objects_objects_id'
      Origin = 'users_objects_objects_id'
      Required = True
    end
    object tblUsersObjectsusers_objects_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_name'
      Origin = 'users_objects_name'
      Size = 66
    end
    object tblUsersObjectsusers_objects_long_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_long_name'
      Origin = 'users_objects_long_name'
      Size = 133
    end
    object tblUsersObjectsusers_objects_desc: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_desc'
      Origin = 'users_objects_desc'
      Size = 340
    end
    object tblUsersObjectsusers_objects_last_mod: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'users_objects_last_mod'
      Origin = 'users_objects_last_mod'
    end
  end
  object dsLanguages: TDataSource
    DataSet = tblLanguages
    Left = 312
    Top = 32
  end
  object sqlRegionOfProvince: TFDQuery
    Connection = connWhyuon
    SQL.Strings = (
      'select provinces_regions_id'
      'from provinces'
      'where provinces_id = :users_import_provinces_id')
    Left = 328
    Top = 128
    ParamData = <
      item
        Name = 'USERS_IMPORT_PROVINCES_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlRegionOfProvinceprovinces_regions_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'provinces_regions_id'
      Origin = 'provinces_regions_id'
    end
  end
  object rcliWhyuonApi: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    AcceptEncoding = 'utf-8'
    AutoCreateParams = False
    BaseURL = 'https://api.whyuon.com/api'
    Params = <
      item
        Name = 'token'
      end>
    RedirectsWithGET = [Put303, Delete303]
    SecureProtocols = [TLS12, TLS13]
    SynchronizedEvents = False
    Left = 600
    Top = 24
  end
  object reqWhyuonApiAddImportedUser: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <
      item
        Name = 'import_id'
      end>
    Resource = 'imports/user/addImportedUser'
    Response = respWhyuonApiAddImportedUser
    OnAfterExecute = reqWhyuonApiAddImportedUserAfterExecute
    SynchronizedEvents = False
    Left = 888
    Top = 112
  end
  object respWhyuonApiLogin: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'authorisation.token'
    Left = 840
    Top = 24
  end
  object reqWhyuonApiLogin: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <
      item
        Name = 'password'
        Value = 'P@ssw0rd'
      end
      item
        Name = 'login'
        Value = 'whyuon'
      end>
    Resource = 'login'
    Response = respWhyuonApiLogin
    OnAfterExecute = reqWhyuonApiLoginAfterExecute
    SynchronizedEvents = False
    Left = 712
    Top = 24
  end
  object respWhyuonApiAddImportedUser: TRESTResponse
    ContentType = 'application/json'
    Left = 896
    Top = 184
  end
  object reqWhyuonApiAddImportedEvent: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <
      item
        Name = 'import_id'
      end>
    Resource = 'imports/event/addImportedEvent'
    Response = respWhyuonApiAddImportedEvent
    OnAfterExecute = reqWhyuonApiAddImportedEventAfterExecute
    SynchronizedEvents = False
    Left = 888
    Top = 256
  end
  object respWhyuonApiAddImportedEvent: TRESTResponse
    ContentType = 'application/json'
    Left = 896
    Top = 328
  end
  object tblUsersImport: TFDTable
    IndexName = 'PRIMARY'
    Connection = connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.KeyFields = 'users_import_id'
    TableName = 'users_import'
    Left = 120
    Top = 169
    object tblUsersImportusers_import_id: TFDAutoIncField
      FieldName = 'users_import_id'
      Origin = 'users_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblUsersImportusers_import_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'users_import_username'
      Origin = 'users_import_username'
      Required = True
      Size = 200
    end
    object tblUsersImportusers_import_email: TWideStringField
      DisplayLabel = 'Email'
      FieldName = 'users_import_email'
      Origin = 'users_import_email'
      Required = True
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
    end
    object tblUsersImportusers_import_birth_date: TDateField
      DefaultExpression = 'current_date'
      DisplayLabel = 'Fecha nacimiento'
      FieldName = 'users_import_birth_date'
      Origin = 'users_import_birth_date'
      Required = True
    end
    object tblUsersImportusers_import_languages_id: TWordField
      DefaultExpression = '43'
      FieldName = 'users_import_languages_id'
      Origin = 'users_import_languages_id'
      Required = True
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
    object tblUsersImportusers_import_name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nombre'
      FieldName = 'users_import_name'
      Origin = 'users_import_name'
      Size = 340
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
    end
    object tblUsersImportusers_import_ident_documents_number: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'N'#250'mero del documento'
      FieldName = 'users_import_ident_documents_number'
      Origin = 'users_import_ident_documents_number'
      Size = 66
    end
    object tblUsersImportusers_import_mobile_pref: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Prefijo telef'#243'nico'
      FieldName = 'users_import_mobile_pref'
      Origin = 'users_import_mobile_pref'
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
    end
    object tblUsersImportusers_import_regions_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_regions_id'
      Origin = 'users_import_regions_id'
    end
    object tblUsersImportusers_import_provinces_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_provinces_id'
      Origin = 'users_import_provinces_id'
      Required = True
    end
    object tblUsersImportusers_import_cities_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_import_cities_id'
      Origin = 'users_import_cities_id'
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
    end
    object tblUsersImportusers_import_imported: TByteField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = 'Importado'
      FieldName = 'users_import_imported'
      Origin = 'users_import_imported'
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
    Left = 208
    Top = 169
  end
  object tblEventsImport: TFDTable
    IndexFieldNames = 'events_import_id'
    Connection = connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.KeyFields = 'events_import_id'
    TableName = 'events_import'
    Left = 112
    Top = 248
    object tblEventsImportevents_import_id: TFDAutoIncField
      FieldName = 'events_import_id'
      Origin = 'events_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblEventsImportevents_import_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'events_import_username'
      Origin = 'events_import_username'
      Required = True
      Size = 200
    end
    object tblEventsImportevents_import_elements_id: TLongWordField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = 'Elemento'
      FieldName = 'events_import_elements_id'
      Origin = 'events_import_elements_id'
    end
    object tblEventsImportevents_import_users_elements_id: TLongWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Username en elemento'
      FieldName = 'events_import_users_elements_id'
      Origin = 'events_import_users_elements_id'
    end
    object tblEventsImportevents_import_content_formats_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Formato'
      FieldName = 'events_import_content_formats_id'
      Origin = 'events_import_content_formats_id'
    end
    object tblEventsImportevents_import_categories_id: TWideStringField
      DisplayLabel = 'Categor'#237'as'
      FieldName = 'events_import_categories_id'
      Origin = 'events_import_categories_id'
      Required = True
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
      DisplayLabel = 'Perfil'
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
    end
    object tblEventsImportevents_import_end: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fecha y hora de fin'
      FieldName = 'events_import_end'
      Origin = 'events_import_end'
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
    end
    object tblEventsImportevents_import_countries_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Pa'#237's'
      FieldName = 'events_import_countries_id'
      Origin = 'events_import_countries_id'
    end
    object tblEventsImportevents_import_regions_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Regi'#243'n'
      FieldName = 'events_import_regions_id'
      Origin = 'events_import_regions_id'
    end
    object tblEventsImportevents_import_provinces_id: TWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Provincia'
      FieldName = 'events_import_provinces_id'
      Origin = 'events_import_provinces_id'
    end
    object tblEventsImportevents_import_cities_id: TLongWordField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ciudad'
      FieldName = 'events_import_cities_id'
      Origin = 'events_import_cities_id'
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
    object tblEventsImportevents_import_stamp: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'events_import_stamp'
      Origin = 'events_import_stamp'
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
    Left = 216
    Top = 248
  end
  object sqlContentFormats: TFDQuery
    Connection = connWhyuon
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
    Left = 56
    Top = 392
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
    Left = 176
    Top = 392
  end
  object reqWhyuonApiAddImportedUsers: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <>
    Resource = 'imports/user/addImportedUsers'
    Response = respWhyuonApiAddImportedUsers
    OnAfterExecute = reqWhyuonApiAddImportedUserAfterExecute
    SynchronizedEvents = False
    Left = 848
    Top = 400
  end
  object respWhyuonApiAddImportedUsers: TRESTResponse
    ContentType = 'application/json'
    Left = 856
    Top = 472
  end
  object reqWhyuonApiAddImportedEvents: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <
      item
        Name = 'import_id'
      end>
    Resource = 'imports/event/addImportedEvents'
    Response = respWhyuonApiAddImportedEvents
    OnAfterExecute = reqWhyuonApiAddImportedEventAfterExecute
    SynchronizedEvents = False
    Left = 848
    Top = 544
  end
  object respWhyuonApiAddImportedEvents: TRESTResponse
    ContentType = 'application/json'
    Left = 856
    Top = 616
  end
  object ftpWhyuon: TIdFTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    Host = 'whyuon.com'
    Passive = True
    ConnectTimeout = 0
    TransferType = ftBinary
    NATKeepAlive.UseKeepAlive = True
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    UseTLS = utUseExplicitTLS
    Left = 496
    Top = 40
  end
  object sqlImportedImageExists: TFDQuery
    Connection = connWhyuon
    SQL.Strings = (
      'SELECT '
      #9'objects_import_id'
      'FROM '
      #9'objects_import'
      'JOIN objects_categories oc1'
      
        #9'ON oc1.objects_categories_id = objects_import_objects_categorie' +
        's_1_id'
      'JOIN objects_categories oc2'
      
        #9'ON oc2.objects_categories_id = objects_import_objects_categorie' +
        's_2_id'
      'WHERE'
      #9'(objects_import_username = :objects_import_username)'
      
        #9'and (oc1.objects_categories_code in (:objects_categories_code_1' +
        ', :objects_categories_code_2))'
      
        '    and (oc2.objects_categories_code in (:objects_categories_cod' +
        'e_1, :objects_categories_code_2))'
      '    and (objects_import_sha256 = :objects_import_sha256) ')
    Left = 224
    Top = 496
    ParamData = <
      item
        Name = 'OBJECTS_IMPORT_USERNAME'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'OBJECTS_CATEGORIES_CODE_1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'OBJECTS_CATEGORIES_CODE_2'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'OBJECTS_IMPORT_SHA256'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object sqlImportedImageExistsobjects_import_id: TFDAutoIncField
      FieldName = 'objects_import_id'
      Origin = 'objects_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object tblObjectsImport: TFDTable
    IndexFieldNames = 'objects_import_id'
    Connection = connWhyuon
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'objects_import'
    Left = 72
    Top = 480
    object tblObjectsImportobjects_import_id: TFDAutoIncField
      FieldName = 'objects_import_id'
      Origin = 'objects_import_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblObjectsImportobjects_import_username: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'objects_import_username'
      Origin = 'objects_import_username'
      Size = 200
    end
    object tblObjectsImportobjects_import_sha256: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'objects_import_sha256'
      Origin = 'objects_import_sha256'
      FixedChar = True
      Size = 85
    end
    object tblObjectsImportobjects_import_path: TWideStringField
      FieldName = 'objects_import_path'
      Origin = 'objects_import_path'
      Required = True
      Size = 340
    end
    object tblObjectsImportobjects_import_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'objects_import_name'
      Origin = 'objects_import_name'
      Size = 66
    end
    object tblObjectsImportobjects_import_objects_categories_1_id: TWordField
      FieldName = 'objects_import_objects_categories_1_id'
      Origin = 'objects_import_objects_categories_1_id'
      Required = True
    end
    object tblObjectsImportobjects_import_objects_categories_2_id: TWordField
      FieldName = 'objects_import_objects_categories_2_id'
      Origin = 'objects_import_objects_categories_2_id'
      Required = True
    end
    object tblObjectsImportobjects_import_objects_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'objects_import_objects_id'
      Origin = 'objects_import_objects_id'
    end
    object tblObjectsImportobjects_import_stamp: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'objects_import_stamp'
      Origin = 'objects_import_stamp'
    end
  end
  object tblObjectsCategories: TFDTable
    IndexName = 'objects_categories_code'
    Connection = connWhyuon
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'objects_categories'
    Left = 72
    Top = 544
    object tblObjectsCategoriesobjects_categories_id: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'objects_categories_id'
      Origin = 'objects_categories_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tblObjectsCategoriesobjects_categories_code: TWideStringField
      FieldName = 'objects_categories_code'
      Origin = 'objects_categories_code'
      Required = True
      Size = 66
    end
    object tblObjectsCategoriesobjects_categories_name_tc: TWideStringField
      FieldName = 'objects_categories_name_tc'
      Origin = 'objects_categories_name_tc'
      Required = True
      Size = 133
    end
    object tblObjectsCategoriesobjects_categories_long_name_tc: TWideStringField
      FieldName = 'objects_categories_long_name_tc'
      Origin = 'objects_categories_long_name_tc'
      Required = True
      Size = 133
    end
    object tblObjectsCategoriesobjects_categories_desc_tc: TWideStringField
      FieldName = 'objects_categories_desc_tc'
      Origin = 'objects_categories_desc_tc'
      Required = True
      Size = 133
    end
    object tblObjectsCategoriesobjects_categories_last_mod: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'objects_categories_last_mod'
      Origin = 'objects_categories_last_mod'
    end
  end
  object sqlUsersList: TFDQuery
    Connection = connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'select'
      '  users_id,'
      '  users_username,'
      '  users_email,'
      '  users_nickname'
      'from'
      '  users'
      'where'
      '  (users_username like :filter)'
      '  or (users_email like :filter)'
      '  or (users_nickname like :filter)'
      'order by  '
      '  users_username')
    Left = 176
    Top = 640
    ParamData = <
      item
        Name = 'FILTER'
        DataType = ftWideString
        ParamType = ptInput
        Value = Null
      end>
    object sqlUsersListusers_id: TFDAutoIncField
      FieldName = 'users_id'
      Origin = 'users_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object sqlUsersListusers_username: TWideStringField
      DisplayLabel = 'Username'
      FieldName = 'users_username'
      Origin = 'users_username'
      Required = True
      Size = 200
    end
    object sqlUsersListusers_email: TWideStringField
      DisplayLabel = 'email'
      FieldName = 'users_email'
      Origin = 'users_email'
      Required = True
      Size = 340
    end
    object sqlUsersListusers_nickname: TWideStringField
      DisplayLabel = 'Nickname'
      FieldName = 'users_nickname'
      Origin = 'users_nickname'
      Required = True
      Size = 200
    end
  end
  object dsUsersList: TDataSource
    DataSet = sqlUsersList
    Left = 272
    Top = 648
  end
  object sqlUserActions: TFDQuery
    Connection = connWhyuon
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortOptions = [soNoCase, soNoSymbols]
    SQL.Strings = (
      'SELECT '
      #9'`all_actions`.`users_id`,'
      #9'`all_actions`.`actions_id`,'
      '    `all_actions`.`actions_code`,'
      '    `all_actions`.`actions_grant`'
      'FROM'
      '(SELECT'
      #9'`users`.`users_id`,'
      #9'`actions`.`actions_id`,'
      '    `actions`.`actions_code`,'
      '    `users_actions`.`users_actions_grant` AS `actions_grant`'
      'FROM'
      #9'`actions`'
      'JOIN `users_actions`'
      
        #9'ON `users_actions`.`users_actions_actions_id` = `actions`.`acti' +
        'ons_id`'
      'JOIN `users`'
      
        #9'ON `users`.`users_id` = `users_actions`.`users_actions_users_id' +
        '`'
      'WHERE'
      #9'`users`.`users_id` = :user_id'
      #9
      'UNION'
      ''
      'SELECT'
      #9'`users`.`users_id`,'
      #9'`actions`.`actions_id`,'
      '    `actions`.`actions_code`,'
      '    1 AS `actions_grant`'
      'FROM'
      #9'`actions`'
      'JOIN `levels_actions`'
      
        #9'ON `levels_actions`.`levels_actions_actions_id` = `actions`.`ac' +
        'tions_id`'
      'JOIN `users`'
      
        #9'ON `users`.`users_levels_id` = `levels_actions`.`levels_actions' +
        '_levels_id`'
      'WHERE'
      #9'`users`.`users_id` = :user_id) AS `all_actions`'
      #9
      'ORDER BY'
      '    `all_actions`.`actions_code`;')
    Left = 176
    Top = 712
    ParamData = <
      item
        Name = 'USER_ID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object sqlUserActionsusers_id: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'users_id'
      Origin = 'users_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object sqlUserActionsactions_id: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'actions_id'
      Origin = 'actions_id'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object sqlUserActionsactions_code: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'actions_code'
      Origin = 'actions_code'
      ProviderFlags = []
      ReadOnly = True
      Size = 66
    end
    object sqlUserActionsactions_grant: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'actions_grant'
      Origin = 'actions_grant'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object sqlElements: TFDQuery
    Connection = connWhyuon
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
  object reqWhyuonApiAddImportedUserElement: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <
      item
        Name = 'import_id'
      end>
    Resource = 'imports/userElement/addImportedUserElement'
    Response = respWhyuonApiAddImportedUserElement
    OnAfterExecute = reqWhyuonApiAddImportedUserElementAfterExecute
    SynchronizedEvents = False
    Left = 648
    Top = 112
  end
  object respWhyuonApiAddImportedUserElement: TRESTResponse
    ContentType = 'application/json'
    Left = 656
    Top = 184
  end
  object reqWhyuonApiAddImportedUsersElements: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <>
    Resource = 'imports/userElement/addImportedUsersElements'
    Response = respWhyuonApiAddImportedUsersElements
    OnAfterExecute = reqWhyuonApiAddImportedUsersElementsAfterExecute
    SynchronizedEvents = False
    Left = 656
    Top = 264
  end
  object respWhyuonApiAddImportedUsersElements: TRESTResponse
    ContentType = 'application/json'
    Left = 648
    Top = 344
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'whyuon.com:21'
    Host = 'whyuon.com'
    MaxLineAction = maException
    Port = 21
    DefaultPort = 0
    ReadTimeout = 60000
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 440
    Top = 64
  end
  object reqWhyuonApiLogout: TRESTRequest
    Client = rcliWhyuonApi
    Method = rmPOST
    Params = <>
    Resource = 'logout'
    Response = respWhyuonApiLogout
    OnAfterExecute = reqWhyuonApiLogoutAfterExecute
    SynchronizedEvents = False
    Left = 576
    Top = 456
  end
  object respWhyuonApiLogout: TRESTResponse
    ContentType = 'application/json'
    Left = 568
    Top = 544
  end
end
