object frmUsersElementsImport: TfrmUsersElementsImport
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Datos de elementos de usuario'
  ClientHeight = 405
  ClientWidth = 1027
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 15
  object lblUserElementsImported: TLabel
    Left = 0
    Top = 25
    Width = 1027
    Height = 21
    Align = alTop
    Alignment = taCenter
    Caption = 
      'No se puede modificar este elemento de usuario porque ya ha sido' +
      ' importado'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 594
  end
  object dbnvUsersElementsImport: TDBNavigator
    Left = 0
    Top = 0
    Width = 1027
    Height = 25
    DataSource = dmUsersElementsImport.dsUsersElementsImport
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
    ExplicitWidth = 1023
  end
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 1027
    Height = 197
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 1023
    ExplicitHeight = 196
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 15
      Caption = 'Username'
      FocusControl = edtUsername
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 50
      Height = 15
      Caption = 'Elemento'
    end
    object Label3: TLabel
      Left = 514
      Top = 69
      Width = 122
      Height = 15
      Caption = 'Username de elemento'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 8
      Top = 128
      Width = 62
      Height = 15
      Caption = 'Descripci'#243'n'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 514
      Top = 128
      Width = 21
      Height = 15
      Caption = 'URL'
      FocusControl = DBEdit5
    end
    object edtUsername: TDBEdit
      Left = 8
      Top = 24
      Width = 500
      Height = 23
      DataField = 'users_elements_import_username'
      DataSource = dmUsersElementsImport.dsUsersElementsImport
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 514
      Top = 85
      Width = 500
      Height = 23
      DataField = 'users_elements_import_element_username'
      DataSource = dmUsersElementsImport.dsUsersElementsImport
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 144
      Width = 500
      Height = 23
      DataField = 'users_elements_import_desc'
      DataSource = dmUsersElementsImport.dsUsersElementsImport
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 514
      Top = 144
      Width = 500
      Height = 23
      DataField = 'users_elements_import_url'
      DataSource = dmUsersElementsImport.dsUsersElementsImport
      TabOrder = 5
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 8
      Top = 85
      Width = 500
      Height = 23
      DataField = 'users_elements_import_elements_id'
      DataSource = dmUsersElementsImport.dsUsersElementsImport
      KeyField = 'elements_id'
      ListField = 'element'
      ListSource = dmUsersElementsImport.dsElements
      TabOrder = 2
    end
    object btnUsersList: TButton
      Left = 514
      Top = 23
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
    Top = 243
    Width = 1027
    Height = 162
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitTop = 242
    ExplicitWidth = 1023
    object dbgImages: TDBGrid
      Left = 2
      Top = 2
      Width = 1023
      Height = 158
      Align = alClient
      DataSource = dmUsersElementsImport.dsUsersElementsImportObjects
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnTitleClick = dbgImagesTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'stela_name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 501
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'import_stela_name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 485
          Visible = True
        end>
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
