inherited frmTiposVia: TfrmTiposVia
  Left = 305
  Top = 162
  Width = 274
  Height = 514
  ActiveControl = dbgTiposVia
  Caption = 'Tipos de vía'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel4: TJAMPanel
    Left = 0
    Top = 427
    Width = 266
    Height = 20
    Align = alBottom
    TabOrder = 0
    object dbnTiposVia: TDBNavigator
      Left = 1
      Top = 1
      Width = 264
      Height = 18
      DataSource = dmDirecciones.dsTiposVia
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alClient
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
    end
  end
  object JAMPanel5: TJAMPanel
    Left = 0
    Top = 447
    Width = 266
    Height = 33
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 33
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
      Kind = bkOK
    end
    object btnCancelar: TBitBtn
      Left = 159
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 0
    Top = 0
    Width = 266
    Height = 427
    Align = alClient
    TabOrder = 2
    object dbgTiposVia: TDBGrid
      Left = 1
      Top = 1
      Width = 264
      Height = 425
      Align = alClient
      DataSource = dmDirecciones.dsTiposVia
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dbgTiposViaKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'id_tipo_via'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_via'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
end
