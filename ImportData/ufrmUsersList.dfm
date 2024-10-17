object frmUsersList: TfrmUsersList
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Lista de ususarios de la aplicaci'#243'n'
  ClientHeight = 453
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 413
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 401
    object dbgUsersList: TDBGrid
      Left = 1
      Top = 24
      Width = 630
      Height = 388
      Hint = 'Haz doble click para seleccionar el usuario'
      Align = alClient
      DataSource = dmImportData.dsUsersList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnDblClick = dbgUsersListDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'users_username'
          Width = 218
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_email'
          Width = 207
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users_nickname'
          Width = 170
          Visible = True
        end>
    end
    object edtFilter: TEdit
      Left = 1
      Top = 1
      Width = 630
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
      OnChange = edtFilterChange
      ExplicitWidth = 622
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 413
    Width = 632
    Height = 40
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 401
    ExplicitWidth = 624
    object btnOK: TButton
      Left = 178
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object Button2: TButton
      Left = 378
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
