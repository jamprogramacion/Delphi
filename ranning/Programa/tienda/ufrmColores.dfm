inherited frmColores: TfrmColores
  Left = 256
  Top = 175
  Width = 690
  Height = 401
  Caption = 'Colores'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 328
    Align = alClient
    TabOrder = 0
    object dbnColores: TDBNavigator
      Left = 1
      Top = 302
      Width = 680
      Height = 25
      DataSource = dmColores.dsColores
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Align = alBottom
      Flat = True
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
      ConfirmDelete = False
      ShowHint = True
      TabOrder = 0
      BeforeAction = dbnColoresBeforeAction
      OnClick = dbnColoresClick
    end
    object dbgColores: TDBGrid
      Left = 1
      Top = 1
      Width = 680
      Height = 301
      Hint = 'Pulsa en la cabecera para cambiar el orden'
      Align = alClient
      DataSource = dmColores.dsColores
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dbgColoresKeyPress
      OnTitleClick = dbgColoresTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id_color'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_color'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 553
          Visible = True
        end>
    end
  end
  object pnCombos: TJAMPanel
    Left = 0
    Top = 328
    Width = 682
    Height = 39
    Align = alBottom
    TabOrder = 1
    object dbeDsColor: TJAMDBLabelEdit
      Left = 32
      Top = 11
      Width = 645
      Height = 21
      DataField = 'ds_color'
      DataSource = dmColores.dsColores
      TabOrder = 0
      LabelCaption = 'Color'
      LabelVisible = True
    end
  end
end
