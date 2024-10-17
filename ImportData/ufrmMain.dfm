object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Whyuon'
  ClientHeight = 692
  ClientWidth = 1121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mnuMain
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblImportProgress: TLabel
    Left = 0
    Top = 660
    Width = 1121
    Height = 15
    Align = alBottom
    Alignment = taCenter
    Visible = False
    ExplicitWidth = 3
  end
  object pnlUsers: TPanel
    Left = 0
    Top = 0
    Width = 1121
    Height = 300
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 0
    Visible = False
    ExplicitWidth = 1117
    object Label1: TLabel
      Left = 4
      Top = 4
      Width = 1113
      Height = 15
      Hint = 'Pulsa para actualizar los datos'
      Align = alTop
      Alignment = taCenter
      Caption = 'Usuarios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      ExplicitWidth = 47
    end
    object dbgUsersImport: TDBGrid
      Left = 4
      Top = 60
      Width = 1113
      Height = 236
      Hint = 
        'Doble click en la fila para editar los datos. Bot'#243'n derecho para' +
        ' m'#225's opciones...'
      Align = alClient
      DataSource = dmImportData.dsUsersImport
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleHotTrack]
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgUsersImportDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'users_import_username'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 192
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_import_nickname'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_import_email'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_import_name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_import_surname'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_import_imported'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 63
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 19
      Width = 1113
      Height = 18
      DataSource = dmImportData.dsUsersImport
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      ShowHint = True
      TabOrder = 0
      ExplicitWidth = 1109
    end
    object edtUsersFilter: TEdit
      Left = 4
      Top = 37
      Width = 1113
      Height = 23
      Hint = 
        'Escribe aqu'#237' para filtrar los usuarios por username, email o nic' +
        'kname'
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = 
        'Escribe aqu'#237' para filtrar los usuarios por username, email o nic' +
        'kname'
      OnChange = edtUsersFilterChange
      ExplicitWidth = 1109
    end
  end
  object pnlEvents: TPanel
    Left = 0
    Top = 300
    Width = 1121
    Height = 360
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 1
    Visible = False
    ExplicitWidth = 1117
    ExplicitHeight = 359
    object Label2: TLabel
      Left = 4
      Top = 4
      Width = 1113
      Height = 15
      Hint = 'Pulsa para actualizar los datos'
      Align = alTop
      Alignment = taCenter
      Caption = 'Eventos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      ExplicitWidth = 44
    end
    object dbgEventsImport: TDBGrid
      Left = 4
      Top = 37
      Width = 1113
      Height = 319
      Hint = 
        'Doble click en la fila para editar los datos. Bot'#243'n derecho para' +
        ' m'#225's opciones...'
      Align = alClient
      DataSource = dmImportData.dsEventsImport
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleHotTrack]
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgEventsImportDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'events_import_username'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 190
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'events_import_elements_name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'events_import_format_name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'events_import_title'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 342
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'events_import_start'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'events_import_end'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'events_import_imported'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 63
          Visible = True
        end>
    end
    object DBNavigator2: TDBNavigator
      Left = 4
      Top = 19
      Width = 1113
      Height = 18
      DataSource = dmImportData.dsEventsImport
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      ShowHint = True
      TabOrder = 1
      ExplicitWidth = 1109
    end
  end
  object pbImport: TProgressBar
    Left = 0
    Top = 675
    Width = 1121
    Height = 17
    Align = alBottom
    ParentShowHint = False
    Smooth = True
    Step = 1
    ShowHint = False
    TabOrder = 2
    Visible = False
    ExplicitTop = 674
    ExplicitWidth = 1117
  end
  object memImportLog: TMemo
    Left = 576
    Top = 181
    Width = 185
    Height = 89
    Hint = 'Haz doble click para ocultar el panel de errores...'
    Lines.Strings = (
      'memImportLog')
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssBoth
    ShowHint = True
    TabOrder = 3
    Visible = False
    OnDblClick = memImportLogDblClick
  end
  object pnlUsersElements: TPanel
    Left = 96
    Top = 317
    Width = 921
    Height = 325
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 4
      Top = 4
      Width = 913
      Height = 15
      Hint = 'Pulsa para actualizar los datos'
      Align = alTop
      Alignment = taCenter
      Caption = 'Elementos de usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      ExplicitWidth = 118
    end
    object dbgUsersElementsImport: TDBGrid
      Left = 4
      Top = 37
      Width = 913
      Height = 284
      Hint = 'Doble click en la fila para editar los datos...'
      Align = alClient
      DataSource = dmUsersElementsImport.dsUsersElementsImport
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleHotTrack]
      ParentShowHint = False
      PopupMenu = PopupMenu3
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgUsersElementsImportDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'users_elements_import_username'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 278
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'element_name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 390
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_elements_import_element_username'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 342
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_elements_import_imported'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object DBNavigator3: TDBNavigator
      Left = 4
      Top = 19
      Width = 913
      Height = 18
      DataSource = dmUsersElementsImport.dsUsersElementsImport
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      ShowHint = True
      TabOrder = 1
    end
  end
  object mnuMain: TMainMenu
    Left = 120
    Top = 144
    object Mostrar1: TMenuItem
      Caption = 'Ver'
      object Eventosdelusuarioseleccionado1: TMenuItem
        Action = actLinkEventsToUser
        AutoCheck = True
      end
      object Paneldeusuarios1: TMenuItem
        Action = actUsersPanelView
        AutoCheck = True
      end
      object Paneldeeventos1: TMenuItem
        Action = actEventsPanelView
        AutoCheck = True
      end
      object Paneldeelementosdeusuario1: TMenuItem
        Action = actUsersElementsPanelView
        AutoCheck = True
      end
    end
    object Introducirdatos1: TMenuItem
      Caption = 'Editar y a'#241'adir datos'
      object Usuarios1: TMenuItem
        Action = actUsersData
      end
      object Duplicaelusuarioseleccionado2: TMenuItem
        Action = actDuplicateUser
      end
      object Descargarusuarioyadadodealta1: TMenuItem
        Action = actDownloadUser
      end
      object Eventos1: TMenuItem
        Action = actEventsData
      end
      object Duplicaeleventoseleccionado2: TMenuItem
        Action = actDuplicateEvent
      end
      object Elementos1: TMenuItem
        Action = actElements
      end
      object Elementosdeusuario1: TMenuItem
        Action = actUsersElementData
      end
      object Descargarelementosdeusuarioyadadodealta1: TMenuItem
        Action = actDownloadUserElements
      end
    end
    object Importardatos1: TMenuItem
      Caption = 'Importar datos'
      OnClick = Importardatos1Click
      object UsuariosCSV1: TMenuItem
        Action = actUsersImportCSV
      end
      object ErroresdeusuariosCSV1: TMenuItem
        Action = actShowUsersImportCSVErrors
      end
      object UsuariosaadirelseleccionadoalaBBDD1: TMenuItem
        Action = actAddImportedUser
      end
      object UsuariosaadirlosseleccionadosalaBBDD1: TMenuItem
        Action = actAddImportedUsers
      end
      object EventosCSV1: TMenuItem
        Action = actEventsImportCSV
      end
      object ErroresdeeventosCSV1: TMenuItem
        Action = actShowEventsImportCSVErrors
      end
      object EventosaadirelseleccionadoalaBBDD1: TMenuItem
        Action = actAddImportedEvent
      end
      object EventosaadirlosseleccionadosalaBBDD1: TMenuItem
        Action = actAddImportedEvents
      end
      object ElementosdeusuarioaadirelactualalaBBDD1: TMenuItem
        Action = actAddImportedUserElement
      end
      object ElementosdeusuarioaadirlosseleccionadosalaBBDD1: TMenuItem
        Action = actAddImportedUsersElements
      end
    end
    object ConectaralaapideWhyuon1: TMenuItem
      Action = actConnectToWhyuonApi
    end
    object Acercade1: TMenuItem
      Action = actAbout
    end
    object Configuracin1: TMenuItem
      Caption = 'Configuraci'#243'n'
      object Cargarconfiguracindeinicio1: TMenuItem
        Action = actIniConfigLoad
      end
    end
    object Salir1: TMenuItem
      Action = actExit
    end
  end
  object ActionList1: TActionList
    OnExecute = ActionList1Execute
    Left = 240
    Top = 96
    object actExit: TAction
      Caption = '&Salir'
      OnExecute = actExitExecute
    end
    object actEventsData: TAction
      Caption = '&Eventos'
      OnExecute = actEventsDataExecute
    end
    object actEventsImportCSV: TAction
      Caption = 'Eventos (CSV)'
      OnExecute = actEventsImportCSVExecute
    end
    object actEventImportCSVSelection: TAction
      Caption = 'actEventImportCSVSelection'
      OnExecute = actEventImportCSVSelectionExecute
    end
    object actAddImportedEvent: TAction
      Caption = 'Eventos (a'#241'adir el actual a la BBDD)'
      Enabled = False
      OnExecute = actAddImportedEventExecute
    end
    object actAddImportedEvents: TAction
      Caption = 'Eventos (a'#241'adir los seleccionados a la BBDD)'
      Enabled = False
      Visible = False
      OnExecute = actAddImportedEventsExecute
    end
    object actShowEventsImportCSVErrors: TAction
      Caption = 'Errores de eventos (CSV)'
      Enabled = False
      OnExecute = actShowEventsImportCSVErrorsExecute
    end
    object actEventsPanelView: TAction
      AutoCheck = True
      Caption = 'Panel de eventos'
      OnExecute = actEventsPanelViewExecute
    end
    object actDuplicateEvent: TAction
      Caption = 'Duplica el evento seleccionado'
      OnExecute = actDuplicateEventExecute
    end
    object actEventsSelectAll: TAction
      Caption = 'Seleccionar todos'
      ShortCut = 16449
      OnExecute = actEventsSelectAllExecute
    end
    object actLinkEventsToUser: TAction
      AutoCheck = True
      Caption = 'S'#243'lo eventos y elementos del usuario seleccionado'
      OnExecute = actLinkEventsToUserExecute
    end
    object actUsersData: TAction
      Caption = '&Usuarios'
      OnExecute = actUsersDataExecute
    end
    object actUsersImportCSV: TAction
      Caption = 'Usuarios (CSV)'
      OnExecute = actUsersImportCSVExecute
    end
    object actUserImportCSVSelection: TAction
      Caption = 'actUserImportCSVSelection'
      OnExecute = actUserImportCSVSelectionExecute
    end
    object actAddImportedUser: TAction
      Caption = 'Usuarios (a'#241'adir el actual a la BBDD)'
      Enabled = False
      OnExecute = actAddImportedUserExecute
    end
    object actAddImportedUsers: TAction
      Caption = 'Usuarios (a'#241'adir los seleccionados a la BBDD)'
      Enabled = False
      Visible = False
      OnExecute = actAddImportedUsersExecute
    end
    object actShowUsersImportCSVErrors: TAction
      Caption = 'Errores de usuarios (CSV)'
      Enabled = False
      OnExecute = actShowUsersImportCSVErrorsExecute
    end
    object actUsersPanelView: TAction
      AutoCheck = True
      Caption = 'Panel de usuarios'
      OnExecute = actUsersPanelViewExecute
    end
    object actDuplicateUser: TAction
      Caption = 'Duplica el usuario seleccionado'
      OnExecute = actDuplicateUserExecute
    end
    object actUsersSelectAll: TAction
      Caption = 'Seleccionar todos'
      ShortCut = 16449
      OnExecute = actUsersSelectAllExecute
    end
    object actDownloadUser: TAction
      Caption = 'Descargar usuario ya dado de alta'
      OnExecute = actDownloadUserExecute
    end
    object actConnectToWhyuonApi: TAction
      Caption = 'Identificarme'
      OnExecute = actConnectToWhyuonApiExecute
    end
    object actAbout: TAction
      Caption = 'Acerca de'
      OnExecute = actAboutExecute
    end
    object actElements: TAction
      Caption = 'Elementos'
      Enabled = False
      OnExecute = actElementsExecute
    end
    object actUsersElementData: TAction
      Caption = 'E&lementos de usuario'
      OnExecute = actUsersElementDataExecute
    end
    object actUsersElementsPanelView: TAction
      AutoCheck = True
      Caption = 'Panel de elementos de usuario'
      OnExecute = actUsersElementsPanelViewExecute
    end
    object actDownloadUserElements: TAction
      Caption = 'Descargar elementos de usuario ya dado de alta'
      OnExecute = actDownloadUserElementsExecute
    end
    object actAddImportedUserElement: TAction
      Caption = 'Elementos de usuario (a'#241'adir el actual a la BBDD)'
      OnExecute = actAddImportedUserElementExecute
    end
    object actAddImportedUsersElements: TAction
      Caption = 'Elementos de usuario (a'#241'adir los seleccionados a la BBDD)'
      Visible = False
      OnExecute = actAddImportedUsersElementsExecute
    end
    object actUsersElementsSelectAll: TAction
      Caption = 'Seleccionar todos'
      ShortCut = 16449
      OnExecute = actUsersElementsSelectAllExecute
    end
    object actIniConfigLoad: TAction
      Caption = 'Cargar configuraci'#243'n de inicio'
      OnExecute = actIniConfigLoadExecute
    end
  end
  object dlgImportCSV: TOpenTextFileDialog
    Filter = 'Texto separado por comas (*.CSV)|*.csv'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Selecciona un archivo para importar los datos'
    ShowEncodingList = False
    Left = 352
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 32
    Top = 436
    object Duplicaeleventoseleccionado1: TMenuItem
      Action = actDuplicateEvent
    end
    object Seleccionartodos2: TMenuItem
      Action = actEventsSelectAll
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 480
    Top = 144
    object Duplicaelusuarioseleccionado1: TMenuItem
      Action = actDuplicateUser
    end
    object Seleccionartodos1: TMenuItem
      Action = actUsersSelectAll
    end
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 376
    Top = 469
    object Seleccionartodos3: TMenuItem
      Action = actUsersElementsSelectAll
    end
  end
end
