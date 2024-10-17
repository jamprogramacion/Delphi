object frmUsersImport: TfrmUsersImport
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Datos de usuarios'
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
  object lblUserImported: TLabel
    Left = 0
    Top = 25
    Width = 1027
    Height = 21
    Align = alTop
    Alignment = taCenter
    Caption = 
      'Este usuario ya ha sido importado, las modificaciones sobreescri' +
      'bir'#225'n los datos del usuario cuando se importe de nuevo'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 911
  end
  object dbnvUsersImport: TDBNavigator
    Left = 0
    Top = 0
    Width = 1027
    Height = 25
    DataSource = dmUsersImport.dsUsersImport
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
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
      'Cancelar')
    ParentShowHint = False
    ConfirmDelete = False
    ShowHint = True
    TabOrder = 0
    OnClick = dbnvUsersImportClick
    ExplicitWidth = 1023
  end
  object pnlAddress: TPanel
    Left = 0
    Top = 471
    Width = 1027
    Height = 179
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    ExplicitTop = 470
    ExplicitWidth = 1023
    object Label15: TLabel
      Left = 6
      Top = 89
      Width = 170
      Height = 15
      Caption = 'Ciudad (si no aparece en la lista)'
      FocusControl = DBEdit15
    end
    object Label16: TLabel
      Left = 518
      Top = 89
      Width = 123
      Height = 15
      Caption = 'Tipo y nombre de la v'#237'a'
      FocusControl = DBEdit16
    end
    object Label17: TLabel
      Left = 518
      Top = 131
      Width = 44
      Height = 15
      Caption = 'N'#250'mero'
      FocusControl = DBEdit17
    end
    object Label18: TLabel
      Left = 6
      Top = 131
      Width = 81
      Height = 15
      Caption = 'Resto direcci'#243'n'
      FocusControl = DBEdit18
    end
    object Label19: TLabel
      Left = 865
      Top = 131
      Width = 74
      Height = 15
      Caption = 'C'#243'digo postal'
      FocusControl = DBEdit19
    end
    object Label21: TLabel
      Left = 6
      Top = 2
      Width = 21
      Height = 15
      Caption = 'Pa'#237's'
      FocusControl = DBLookupComboBox3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 518
      Top = 2
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
      Top = 48
      Width = 51
      Height = 15
      Caption = 'Provincia'
      FocusControl = DBLookupComboBox5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 518
      Top = 48
      Width = 38
      Height = 15
      Hint = 'Doble click en la fila para editar los datos'
      Caption = 'Ciudad'
      FocusControl = DBLookupComboBox6
    end
    object DBEdit15: TDBEdit
      Left = 6
      Top = 106
      Width = 500
      Height = 23
      DataField = 'users_import_cities_name'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 4
    end
    object DBEdit16: TDBEdit
      Left = 518
      Top = 106
      Width = 500
      Height = 23
      DataField = 'users_import_road_name'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 5
    end
    object DBEdit17: TDBEdit
      Left = 518
      Top = 146
      Width = 153
      Height = 23
      DataField = 'users_import_number'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 7
    end
    object DBEdit18: TDBEdit
      Left = 6
      Top = 146
      Width = 500
      Height = 23
      DataField = 'users_import_extended'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 6
    end
    object DBEdit19: TDBEdit
      Left = 865
      Top = 146
      Width = 153
      Height = 23
      DataField = 'users_import_postal_code'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 8
    end
    object DBEdit8: TDBEdit
      Left = 518
      Top = 19
      Width = 500
      Height = 23
      TabStop = False
      DataField = 'regions_name'
      DataSource = dmUsersImport.dsRegions
      Enabled = False
      TabOrder = 1
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 6
      Top = 19
      Width = 500
      Height = 23
      DataField = 'users_import_countries_id'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'countries_id'
      ListField = 'countries_name'
      ListSource = dmUsersImport.dsCountries
      TabOrder = 0
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 6
      Top = 63
      Width = 500
      Height = 23
      DataField = 'users_import_provinces_id'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'provinces_id'
      ListField = 'provinces_name'
      ListSource = dmUsersImport.dsProvinces
      TabOrder = 2
    end
    object DBLookupComboBox6: TDBLookupComboBox
      Left = 518
      Top = 63
      Width = 500
      Height = 23
      Hint = 'Pulsa el bot'#243'n derecho para ver opciones...'
      DataField = 'users_import_cities_id'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'cities_id'
      ListField = 'cities_name'
      ListSource = dmUsersImport.dsCities
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 3
    end
    object dbgImages: TDBGrid
      Left = 3
      Top = 28
      Width = 1015
      Height = 97
      Hint = 'Pincha en el t'#237'tulo para subir la imagen correspondiente...'
      DataSource = dmUsersImport.dsUsersImportObjects
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
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
          FieldName = 'img_name'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'stela_name'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'poster_name'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'public_stela_name'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'import_img_name'
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'import_stela_name'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'import_poster_name'
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'import_public_stela_name'
          Width = 160
          Visible = True
        end>
    end
  end
  object pnlUserData: TPanel
    Left = 0
    Top = 225
    Width = 1027
    Height = 188
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitWidth = 1023
    ExplicitHeight = 187
    object Label20: TLabel
      Left = 9
      Top = 6
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
    object Label9: TLabel
      Left = 518
      Top = 6
      Width = 42
      Height = 15
      Caption = 'G'#233'nero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 9
      Top = 51
      Width = 44
      Height = 15
      Caption = 'Nombre'
    end
    object Label11: TLabel
      Left = 518
      Top = 51
      Width = 57
      Height = 15
      Caption = 'Apellido(s)'
    end
    object Label13: TLabel
      Left = 9
      Top = 96
      Width = 90
      Height = 15
      Caption = 'Prefijo telef'#243'nico'
    end
    object Label14: TLabel
      Left = 319
      Top = 96
      Width = 107
      Height = 15
      Caption = 'N'#250'mero de tel'#233'fono'
    end
    object Label8: TLabel
      Left = 518
      Top = 96
      Width = 97
      Height = 15
      Caption = 'Fecha nacimiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 9
      Top = 141
      Width = 104
      Height = 15
      Caption = 'Tipo de documento'
    end
    object Label25: TLabel
      Left = 313
      Top = 141
      Width = 128
      Height = 15
      Caption = 'N'#250'mero del documento'
      FocusControl = DBEdit12
    end
    object Label26: TLabel
      Left = 518
      Top = 141
      Width = 29
      Height = 15
      Caption = 'Nivel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 9
      Top = 22
      Width = 500
      Height = 23
      DataField = 'users_import_languages_id'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'languages_id'
      ListField = 'languages_name'
      ListSource = dmImportData.dsLanguages
      TabOrder = 0
    end
    object DBLookupComboBox7: TDBLookupComboBox
      Left = 518
      Top = 22
      Width = 500
      Height = 23
      DataField = 'users_import_genders_id'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'genders_id'
      ListField = 'gender'
      ListSource = dmUsersImport.dsGenders
      TabOrder = 1
    end
    object DBEdit10: TDBEdit
      Left = 9
      Top = 68
      Width = 500
      Height = 23
      DataField = 'users_import_name'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 2
    end
    object DBEdit11: TDBEdit
      Left = 518
      Top = 68
      Width = 500
      Height = 23
      DataField = 'users_import_surname'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 3
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 9
      Top = 112
      Width = 298
      Height = 23
      Hint = 'Pulsa el bot'#243'n derecho para ver opciones...'
      DataField = 'users_import_mobile_pref'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'countries_phone_prefix'
      ListField = 'country_prefix'
      ListSource = dmUsersImport.dsPhonePrefix
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 4
      OnContextPopup = DBLookupComboBoxContextPopup
    end
    object DBEdit14: TDBEdit
      Left = 313
      Top = 112
      Width = 196
      Height = 23
      DataField = 'users_import_mobile_num'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 5
    end
    object edtBirthDate: TDBEdit
      Left = 518
      Top = 112
      Width = 100
      Height = 23
      TabStop = False
      DataField = 'users_import_birth_date'
      DataSource = dmUsersImport.dsUsersImport
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtBirthDateCalendar: TDateTimePicker
      Left = 618
      Top = 112
      Width = 100
      Height = 23
      Date = 45315.000000000000000000
      Time = 0.675196678239444700
      TabOrder = 7
    end
    object DBEdit12: TDBEdit
      Left = 313
      Top = 157
      Width = 196
      Height = 23
      CharCase = ecUpperCase
      DataField = 'users_import_ident_documents_number'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 9
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 9
      Top = 157
      Width = 298
      Height = 23
      Hint = 'Pulsa el bot'#243'n derecho para ver opciones...'
      DataField = 'users_import_ident_documents_id'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'ident_documents_id'
      ListField = 'ident_document'
      ListSource = dmUsersImport.dsIdentDocuments
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 8
      OnContextPopup = DBLookupComboBoxContextPopup
    end
    object DBRadioGroup3: TDBRadioGroup
      Left = 833
      Top = 134
      Width = 185
      Height = 48
      Caption = 'Borrar tras importar'
      Columns = 2
      DataField = 'users_import_delete'
      DataSource = dmUsersImport.dsUsersImport
      Items.Strings = (
        'NO'
        'S'#205)
      TabOrder = 11
      Values.Strings = (
        '0'
        '1')
    end
    object DBLookupComboBox8: TDBLookupComboBox
      Left = 518
      Top = 157
      Width = 299
      Height = 23
      DataField = 'users_import_levels_id'
      DataSource = dmUsersImport.dsUsersImport
      KeyField = 'levels_id'
      ListField = 'levels'
      ListSource = dmUsersImport.dsLevels
      TabOrder = 10
    end
  end
  object pnlBrandCompany: TPanel
    Left = 0
    Top = 413
    Width = 1027
    Height = 58
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    ExplicitTop = 412
    ExplicitWidth = 1023
    object Label7: TLabel
      Left = 9
      Top = 4
      Width = 49
      Height = 15
      Caption = 'Contacto'
    end
    object DBEdit7: TDBEdit
      Left = 9
      Top = 19
      Width = 500
      Height = 23
      DataField = 'users_import_contact'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 0
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 518
      Top = 4
      Width = 185
      Height = 48
      Caption = #191'Es marca?'
      Columns = 2
      DataField = 'users_import_brand'
      DataSource = dmUsersImport.dsUsersImport
      Items.Strings = (
        'NO'
        'S'#205)
      TabOrder = 1
      Values.Strings = (
        '0'
        '1')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 833
      Top = 4
      Width = 185
      Height = 48
      Caption = #191'Es empresa?'
      Columns = 2
      DataField = 'users_import_company'
      DataSource = dmUsersImport.dsUsersImport
      Items.Strings = (
        'NO'
        'S'#205)
      TabOrder = 2
      Values.Strings = (
        '0'
        '1')
    end
  end
  object pnlUserApp: TPanel
    Left = 0
    Top = 46
    Width = 1027
    Height = 179
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 1023
    object Label1: TLabel
      Left = 9
      Top = 5
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
      Left = 518
      Top = 5
      Width = 29
      Height = 15
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 48
      Width = 21
      Height = 15
      Caption = 'URL'
    end
    object Label4: TLabel
      Left = 518
      Top = 48
      Width = 56
      Height = 15
      Caption = 'Nickname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 9
      Top = 90
      Width = 35
      Height = 15
      Caption = 'Estado'
    end
    object Label6: TLabel
      Left = 9
      Top = 134
      Width = 27
      Height = 15
      Caption = 'Perfil'
    end
    object edtUsername: TDBEdit
      Left = 9
      Top = 21
      Width = 500
      Height = 23
      Hint = 
        'No se puede modificar este campo porque el usuario ya ha sido im' +
        'portado'
      DataField = 'users_import_username'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 0
    end
    object edtEmail: TDBEdit
      Left = 518
      Top = 21
      Width = 500
      Height = 23
      Hint = 
        'No se puede modificar este campo porque el usuario ya ha sido im' +
        'portado'
      DataField = 'users_import_email'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 9
      Top = 64
      Width = 500
      Height = 23
      DataField = 'users_import_url'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 518
      Top = 64
      Width = 500
      Height = 23
      DataField = 'users_import_nickname'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 9
      Top = 106
      Width = 1012
      Height = 23
      DataField = 'users_import_status'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 9
      Top = 149
      Width = 1012
      Height = 23
      DataField = 'users_import_profile'
      DataSource = dmUsersImport.dsUsersImport
      TabOrder = 5
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 736
    Top = 265
    object Borrarlaseleccin1: TMenuItem
      Action = actLookupCombosDelete
    end
  end
  object ActionList1: TActionList
    Left = 848
    Top = 264
    object actLookupCombosDelete: TAction
      Caption = 'Borrar la selecci'#243'n'
      OnExecute = actLookupCombosDeleteExecute
    end
    object actShowImages: TAction
      Caption = 'Ver/ocultar im'#225'genes'
      OnExecute = actShowImagesExecute
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dmUsersImport.tblUsersImport
    ScopeMappings = <>
    Left = 408
    Top = 128
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 316
    Top = 133
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'users_import_birth_date'
      Control = edtBirthDateCalendar
      Track = True
    end
  end
  object MainMenu1: TMainMenu
    Left = 608
    Top = 233
    object Verocultarimgenes1: TMenuItem
      Action = actShowImages
    end
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
    Left = 656
    Top = 158
  end
end
