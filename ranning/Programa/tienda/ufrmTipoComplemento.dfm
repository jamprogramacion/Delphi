inherited frmTipoComplemento: TfrmTipoComplemento
  Left = 345
  Top = 133
  Width = 495
  Height = 570
  Caption = 'Tipos de complementos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 505
    Align = alClient
    TabOrder = 0
    object dbgTipoComplemento: TDBGrid
      Left = 1
      Top = 1
      Width = 485
      Height = 478
      Align = alClient
      DataSource = dmProductos.dsTipoComplemento
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dbgTipoComplementoKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_tipo_complemento'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 479
      Width = 485
      Height = 25
      DataSource = dmProductos.dsTipoComplemento
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbPost, nbCancel]
      Align = alBottom
      Hints.Strings = (
        'Primero'
        'Anterior'
        'Siguiente'
        'Último'
        'Insertar'
        'Borrar'
        'Modificar'
        'Grabar'
        'Cancelar'
        'Actualizar')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      BeforeAction = DBNavigator1BeforeAction
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 0
    Top = 505
    Width = 487
    Height = 31
    Align = alBottom
    TabOrder = 1
    object dbeDsTipoComplemento: TJAMDBLabelEdit
      Left = 72
      Top = 4
      Width = 410
      Height = 21
      DataField = 'ds_tipo_complemento'
      DataSource = dmProductos.dsTipoComplemento
      TabOrder = 0
      LabelCaption = 'Complemento'
      LabelVisible = True
    end
  end
end
