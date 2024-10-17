object frmElements: TfrmElements
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Elementos'
  ClientHeight = 650
  ClientWidth = 1027
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object dbnvEventsImport: TDBNavigator
    Left = 0
    Top = 0
    Width = 1027
    Height = 25
    DataSource = dmElements.dsElements
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
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
    ExplicitWidth = 1023
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 1027
    Height = 424
    Hint = 'Haz doble click para cambiar la descripci'#243'n...'
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1023
    object Label1: TLabel
      Left = 320
      Top = 8
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
      FocusControl = edtElementsCode
    end
    object Label2: TLabel
      Left = 320
      Top = 56
      Width = 108
      Height = 15
      Caption = 'Plantilla URL usuario'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 674
      Top = 8
      Width = 44
      Height = 15
      Caption = 'Nombre'
      FocusControl = edtElementsName
    end
    object Label4: TLabel
      Left = 674
      Top = 56
      Width = 62
      Height = 15
      Caption = 'Descripci'#243'n'
      FocusControl = edtElementsDesc
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 304
      Height = 422
      Align = alLeft
      DataSource = dmElements.dsElements
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'elements_name'
          Width = 270
          Visible = True
        end>
    end
    object edtElementsCode: TDBEdit
      Left = 320
      Top = 24
      Width = 348
      Height = 23
      CharCase = ecUpperCase
      DataField = 'elements_code'
      DataSource = dmElements.dsElements
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 320
      Top = 72
      Width = 348
      Height = 23
      DataField = 'elements_user_url_template'
      DataSource = dmElements.dsElements
      TabOrder = 2
    end
    object edtElementsName: TDBEdit
      Left = 674
      Top = 24
      Width = 348
      Height = 23
      Hint = 'Haz doble click para cambiar el nombre...'
      DataField = 'elements_name'
      DataSource = dmElements.dsElements
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnDblClick = edtElementsNameDblClick
    end
    object edtElementsDesc: TDBEdit
      Left = 674
      Top = 72
      Width = 348
      Height = 23
      Hint = 'Haz doble click para cambiar la descripci'#243'n...'
      DataField = 'elements_desc'
      DataSource = dmElements.dsElements
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnDblClick = edtElementsDescDblClick
    end
    object Panel7: TPanel
      Left = 320
      Top = 208
      Width = 350
      Height = 210
      TabOrder = 5
      object dbgElementsContentFormats: TDBGrid
        Left = 1
        Top = 1
        Width = 348
        Height = 178
        Align = alClient
        DataSource = dmElements.dsElementsContentFormats
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'content_formats_name'
            Width = 294
            Visible = True
          end>
      end
      object Panel9: TPanel
        Left = 1
        Top = 179
        Width = 348
        Height = 30
        Align = alBottom
        TabOrder = 1
        object Button3: TButton
          Left = 1
          Top = 1
          Width = 346
          Height = 28
          Action = actDeleteFormat
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Panel8: TPanel
      Left = 672
      Top = 208
      Width = 350
      Height = 210
      TabOrder = 6
      object dbgElementsElementsTypes: TDBGrid
        Left = 1
        Top = 1
        Width = 348
        Height = 178
        Align = alClient
        DataSource = dmElements.dsElementsElementsTypes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'elements_types_name'
            Width = 293
            Visible = True
          end>
      end
      object Panel10: TPanel
        Left = 1
        Top = 179
        Width = 348
        Height = 30
        Align = alBottom
        TabOrder = 1
        object Button4: TButton
          Left = 1
          Top = 1
          Width = 346
          Height = 28
          Action = actDeleteType
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Panel11: TPanel
      Left = 320
      Top = 101
      Width = 700
      Height = 101
      TabOrder = 7
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 698
        Height = 99
        Hint = 'Pincha en el t'#237'tulo para subir la imagen correspondiente...'
        Align = alClient
        DataSource = dmElements.dsElementsObjects
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnTitleClick = DBGrid2TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'img_path'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'stela_path'
            Width = 141
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'poster_path'
            Width = 168
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'icon_path'
            Width = 203
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 449
    Width = 512
    Height = 201
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 200
    object Panel4: TPanel
      Left = 1
      Top = 170
      Width = 510
      Height = 30
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 169
      object Button1: TButton
        Left = 1
        Top = 1
        Width = 508
        Height = 28
        Action = actAddFormat
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object dbgContentFormats: TDBGrid
      Left = 1
      Top = 1
      Width = 510
      Height = 169
      Align = alClient
      DataSource = dmElements.dsContentFormatsTranslations
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'content_formats_name'
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'content_formats_desc'
          Width = 279
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 516
    Top = 449
    Width = 511
    Height = 201
    Align = alRight
    TabOrder = 3
    ExplicitLeft = 512
    ExplicitHeight = 200
    object dbgElementTypes: TDBGrid
      Left = 1
      Top = 1
      Width = 509
      Height = 169
      Align = alClient
      DataSource = dmElements.dsElementsTypesTranslations
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'elements_types_name'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'elements_types_desc'
          Width = 269
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 1
      Top = 170
      Width = 509
      Height = 30
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 169
      object Panel6: TPanel
        Left = 1
        Top = -1
        Width = 507
        Height = 30
        Align = alBottom
        TabOrder = 0
        object Button2: TButton
          Left = 1
          Top = 1
          Width = 505
          Height = 28
          Action = actAddType
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 200
    Top = 137
    object actAddFormat: TAction
      Caption = 'A'#241'ade formato'
      OnExecute = actAddFormatExecute
    end
    object actAddType: TAction
      Caption = 'A'#241'ade tipo'
      OnExecute = actAddTypeExecute
    end
    object actDeleteFormat: TAction
      Caption = 'Borra formato'
      OnExecute = actDeleteFormatExecute
    end
    object actDeleteType: TAction
      Caption = 'Borra tipo'
      OnExecute = actDeleteTypeExecute
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
