object frmEventsImport: TfrmEventsImport
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Datos de eventos'
  ClientHeight = 650
  ClientWidth = 1027
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  TextHeight = 15
  object lblEventImported: TLabel
    Left = 0
    Top = 25
    Width = 1027
    Height = 21
    Align = alTop
    Alignment = taCenter
    Caption = 'No se puede modificar este evento porque ya ha sido importado'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 490
  end
  object dbnvEventsImport: TDBNavigator
    Left = 0
    Top = 0
    Width = 1027
    Height = 25
    DataSource = dmEventsImport.dsEventsImport
    Align = alTop
    Hints.Strings = (
      'Primero'
      'Anterior'
      'Siguiente'
      #218'ltimo'
      'A'#241'adir'
      'Borrar'
      'Editar'
      'Grabar'
      'Cancelar'
      'Actualizar'
      'Apply updates'
      'Cancelar'
      '')
    ParentShowHint = False
    ConfirmDelete = False
    ShowHint = True
    TabOrder = 0
    OnClick = dbnvEventsImportClick
    ExplicitWidth = 1023
  end
  object pnlAddress: TPanel
    Left = 0
    Top = 416
    Width = 1027
    Height = 234
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = 415
    ExplicitWidth = 1023
    object Label15: TLabel
      Left = 6
      Top = 139
      Width = 170
      Height = 15
      Caption = 'Ciudad (si no aparece en la lista)'
      FocusControl = DBEdit15
    end
    object Label16: TLabel
      Left = 518
      Top = 139
      Width = 123
      Height = 15
      Caption = 'Tipo y nombre de la v'#237'a'
      FocusControl = DBEdit16
    end
    object Label17: TLabel
      Left = 518
      Top = 185
      Width = 44
      Height = 15
      Caption = 'N'#250'mero'
      FocusControl = DBEdit17
    end
    object Label18: TLabel
      Left = 6
      Top = 185
      Width = 81
      Height = 15
      Caption = 'Resto direcci'#243'n'
      FocusControl = DBEdit18
    end
    object Label19: TLabel
      Left = 865
      Top = 185
      Width = 74
      Height = 15
      Caption = 'C'#243'digo postal'
      FocusControl = DBEdit19
    end
    object Label21: TLabel
      Left = 6
      Top = 46
      Width = 21
      Height = 15
      Caption = 'Pa'#237's'
      FocusControl = DBLookupComboBox3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 518
      Top = 46
      Width = 37
      Height = 15
      Caption = 'Regi'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 6
      Top = 96
      Width = 49
      Height = 15
      Caption = 'Provincia'
      FocusControl = DBLookupComboBox5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 518
      Top = 96
      Width = 38
      Height = 15
      Hint = 'Doble click en la fila para editar los datos'
      Caption = 'Ciudad'
      FocusControl = DBLookupComboBox6
    end
    object Label8: TLabel
      Left = 6
      Top = 3
      Width = 114
      Height = 15
      Caption = 'Descripci'#243'n direcci'#243'n'
      FocusControl = DBEdit9
    end
    object DBEdit15: TDBEdit
      Left = 6
      Top = 156
      Width = 500
      Height = 23
      DataField = 'events_import_cities_name'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 5
    end
    object DBEdit16: TDBEdit
      Left = 518
      Top = 156
      Width = 500
      Height = 23
      DataField = 'events_import_road_name'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 6
    end
    object DBEdit17: TDBEdit
      Left = 518
      Top = 200
      Width = 153
      Height = 23
      DataField = 'events_import_number'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 8
    end
    object DBEdit18: TDBEdit
      Left = 6
      Top = 200
      Width = 500
      Height = 23
      DataField = 'events_import_extended'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 7
    end
    object DBEdit19: TDBEdit
      Left = 865
      Top = 200
      Width = 153
      Height = 23
      DataField = 'events_import_postal_code'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 9
    end
    object DBEdit8: TDBEdit
      Left = 518
      Top = 63
      Width = 500
      Height = 23
      TabStop = False
      DataField = 'regions_name'
      DataSource = dmEventsImport.dsRegions
      Enabled = False
      TabOrder = 2
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 6
      Top = 63
      Width = 500
      Height = 23
      Hint = 'Pulsa el bot'#243'n derecho para ver opciones...'
      DataField = 'events_import_countries_id'
      DataSource = dmEventsImport.dsEventsImport
      KeyField = 'countries_id'
      ListField = 'countries_name'
      ListSource = dmEventsImport.dsCountries
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 1
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 6
      Top = 111
      Width = 500
      Height = 23
      Hint = 'Pulsa el bot'#243'n derecho para ver opciones...'
      DataField = 'events_import_provinces_id'
      DataSource = dmEventsImport.dsEventsImport
      KeyField = 'provinces_id'
      ListField = 'provinces_name'
      ListSource = dmEventsImport.dsProvinces
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 3
    end
    object DBLookupComboBox6: TDBLookupComboBox
      Left = 518
      Top = 111
      Width = 500
      Height = 23
      Hint = 'Pulsa el bot'#243'n derecho para ver opciones...'
      DataField = 'events_import_cities_id'
      DataSource = dmEventsImport.dsEventsImport
      KeyField = 'cities_id'
      ListField = 'cities_name'
      ListSource = dmEventsImport.dsCities
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 4
      OnContextPopup = DBLookupComboBox6ContextPopup
    end
    object DBEdit9: TDBEdit
      Left = 6
      Top = 19
      Width = 1012
      Height = 23
      DataField = 'events_import_addresses_desc'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 0
    end
    object dbgImages: TDBGrid
      Left = 6
      Top = 48
      Width = 1015
      Height = 97
      Hint = 'Pincha en el t'#237'tulo para subir la imagen correspondiente...'
      DataSource = dmEventsImport.dsEventsImportObjects
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Visible = False
      OnTitleClick = dbgImagesTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'stela_name'
          Width = 193
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'poster_name'
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'import_stela_name'
          Width = 296
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'import_poster_name'
          Width = 242
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 1027
    Height = 229
    Hint = 'Elige un usuario dado de alta en la aplicaci'#243'n'
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitWidth = 1023
    ExplicitHeight = 228
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 57
      Height = 15
      Caption = 'Username'
      FocusControl = edtUsername
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 6
      Top = 48
      Width = 53
      Height = 15
      Caption = 'Elemento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 352
      Top = 48
      Width = 47
      Height = 15
      Caption = 'Formato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 783
      Top = 48
      Width = 58
      Height = 15
      Caption = 'Categor'#237'as'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 6
      Top = 90
      Width = 38
      Height = 15
      Caption = 'Idioma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 6
      Top = 134
      Width = 143
      Height = 15
      Caption = 'Fecha y hora de comienzo'
      FocusControl = edtStart
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 6
      Top = 182
      Width = 104
      Height = 15
      Caption = 'Fecha y hora de fin'
      FocusControl = edtEnd
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 518
      Top = 6
      Width = 122
      Height = 15
      Caption = 'Username en elemento'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 518
      Top = 48
      Width = 122
      Height = 15
      Caption = 'Categor'#237'as disponibles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUsername: TDBEdit
      Left = 6
      Top = 22
      Width = 393
      Height = 23
      DataField = 'events_import_username'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 6
      Top = 106
      Width = 500
      Height = 23
      DataField = 'events_import_languages_id'
      DataSource = dmEventsImport.dsEventsImport
      KeyField = 'languages_id'
      ListField = 'languages_name'
      ListSource = dmImportData.dsLanguages
      TabOrder = 5
    end
    object edtStart: TDBEdit
      Left = 6
      Top = 150
      Width = 150
      Height = 23
      DataField = 'events_import_start'
      DataSource = dmEventsImport.dsEventsImport
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtEnd: TDBEdit
      Left = 6
      Top = 198
      Width = 150
      Height = 23
      DataField = 'events_import_end'
      DataSource = dmEventsImport.dsEventsImport
      Enabled = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtStartCalendar: TDateTimePicker
      Left = 156
      Top = 150
      Width = 150
      Height = 23
      Date = 45182.000000000000000000
      Format = 'dd/MM/yyyy HH:mm'
      Time = 45182.000000000000000000
      Kind = dtkDateTime
      TabOrder = 7
    end
    object edtEndCalendar: TDateTimePicker
      Left = 156
      Top = 198
      Width = 150
      Height = 23
      Date = 45182.000000000000000000
      Format = 'dd/MM/yyyy HH:mm'
      Time = 45182.000000000000000000
      Kind = dtkDateTime
      TabOrder = 9
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 6
      Top = 64
      Width = 154
      Height = 23
      DataField = 'events_import_elements_id'
      DataSource = dmEventsImport.dsEventsImport
      KeyField = 'elements_id'
      ListField = 'element'
      ListSource = dmEventsImport.dsElements
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 518
      Top = 22
      Width = 500
      Height = 23
      DataField = 'users_elements_username'
      DataSource = dmEventsImport.dsUsersElements
      Enabled = False
      TabOrder = 2
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 352
      Top = 64
      Width = 154
      Height = 23
      DataField = 'events_import_content_formats_id'
      DataSource = dmEventsImport.dsEventsImport
      KeyField = 'content_formats_id'
      ListField = 'content_format'
      ListSource = dmEventsImport.dsContentFormats
      TabOrder = 4
    end
    object lbCategories: TListBox
      Left = 783
      Top = 64
      Width = 235
      Height = 133
      TabStop = False
      ItemHeight = 15
      MultiSelect = True
      ParentShowHint = False
      ShowHint = False
      TabOrder = 13
      OnClick = lbCategoriesClick
    end
    object btnCategoriesDelete: TButton
      Left = 783
      Top = 198
      Width = 235
      Height = 25
      Action = actCategoriesDelete
      TabOrder = 11
    end
    object btnCategoriesAdd: TButton
      Left = 518
      Top = 198
      Width = 235
      Height = 25
      Action = actCategoriesAdd
      TabOrder = 10
    end
    object lbCategoriesSelect: TListBox
      Left = 518
      Top = 64
      Width = 235
      Height = 133
      TabStop = False
      ItemHeight = 15
      MultiSelect = True
      ParentShowHint = False
      ShowHint = False
      TabOrder = 12
      OnClick = lbCategoriesSelectClick
    end
    object btnUsersList: TButton
      Left = 405
      Top = 21
      Width = 101
      Height = 25
      Hint = 'Elige un usuario dado de alta en la aplicaci'#243'n'
      Caption = 'Lista de usuarios'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnUsersListClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 275
    Width = 1027
    Height = 141
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 274
    ExplicitWidth = 1023
    object Label6: TLabel
      Left = 6
      Top = 5
      Width = 30
      Height = 15
      Caption = 'T'#237'tulo'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 518
      Top = 5
      Width = 62
      Height = 15
      Caption = 'Descripci'#243'n'
      FocusControl = DBEdit7
    end
    object Label9: TLabel
      Left = 6
      Top = 49
      Width = 21
      Height = 15
      Caption = 'URL'
      FocusControl = DBEdit10
    end
    object Label10: TLabel
      Left = 518
      Top = 49
      Width = 89
      Height = 15
      Caption = 'Informaci'#243'n URL'
      FocusControl = DBEdit11
    end
    object Label13: TLabel
      Left = 6
      Top = 93
      Width = 48
      Height = 15
      Caption = 'Etiquetas'
      FocusControl = DBEdit14
    end
    object DBEdit6: TDBEdit
      Left = 6
      Top = 21
      Width = 500
      Height = 23
      DataField = 'events_import_title'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 518
      Top = 21
      Width = 500
      Height = 23
      DataField = 'events_import_profile'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 1
    end
    object DBEdit10: TDBEdit
      Left = 6
      Top = 65
      Width = 500
      Height = 23
      DataField = 'events_import_url'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 2
    end
    object DBEdit11: TDBEdit
      Left = 518
      Top = 65
      Width = 500
      Height = 23
      DataField = 'events_import_url_info'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 3
    end
    object DBEdit14: TDBEdit
      Left = 6
      Top = 109
      Width = 1012
      Height = 23
      DataField = 'events_import_hashtags'
      DataSource = dmEventsImport.dsEventsImport
      TabOrder = 4
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 384
    Top = 369
    object Borrarlaseleccin1: TMenuItem
      Action = actLookupCombosDelete
    end
  end
  object ActionList1: TActionList
    Left = 504
    Top = 360
    object actLookupCombosDelete: TAction
      Caption = 'Borrar la selecci'#243'n'
      OnExecute = actLookupCombosDeleteExecute
    end
    object actCategoriesDelete: TAction
      Caption = 'Borrar la selecci'#243'n'
      OnExecute = actCategoriesDeleteExecute
    end
    object actCategoriesAdd: TAction
      Caption = 'A'#241'adir categor'#237'as seleccionadas'
      OnExecute = actCategoriesAddExecute
    end
    object actShowImages: TAction
      Caption = 'Ver/ocultar im'#225'genes'
      OnExecute = actShowImagesExecute
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dmEventsImport.sqlEventsImportCategories
    ScopeMappings = <>
    Left = 656
    Top = 136
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 556
    Top = 125
    object LinkFillControlToField1: TLinkFillControlToField
      Category = 'Quick Bindings'
      Control = lbCategories
      Track = True
      FillDataSource = BindSourceDB1
      FillDisplayFieldName = 'category'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkFillControlToField2: TLinkFillControlToField
      Category = 'Quick Bindings'
      Control = lbCategoriesSelect
      Track = False
      FillDataSource = BindSourceDB2
      FillDisplayFieldName = 'category'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB3
      FieldName = 'events_import_start'
      Control = edtStartCalendar
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB3
      FieldName = 'events_import_end'
      Control = edtEndCalendar
      Track = True
    end
  end
  object BindSourceDB2: TBindSourceDB
    DataSet = dmEventsImport.sqlCategories
    ScopeMappings = <>
    Left = 824
    Top = 144
  end
  object BindSourceDB3: TBindSourceDB
    DataSet = dmEventsImport.tblEventsImport
    ScopeMappings = <>
    Left = 368
    Top = 192
  end
  object dlgImages: TOpenDialog
    Filter = 
      'All (*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.ti' +
      'ff)|*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tif' +
      'f|GIF Image (*.gif)|*.gif|JPEG Image File (*.jpg)|*.jpg|JPEG Ima' +
      'ge File (*.jpeg)|*.jpeg|Portable Network Graphics (*.png)|*.png|' +
      'Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.' +
      'emf)|*.emf|Metafiles (*.wmf)|*.wmf|TIFF Images (*.tif)|*.tif|TIF' +
      'F Images (*.tiff)|*.tiff'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 480
    Top = 198
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 105
    object Verocultarimgenes1: TMenuItem
      Action = actShowImages
    end
  end
end
