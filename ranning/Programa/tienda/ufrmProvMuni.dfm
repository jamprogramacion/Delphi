inherited frmProvMuni: TfrmProvMuni
  Left = 305
  Top = 160
  Width = 462
  Height = 517
  Caption = 'Selección de provincia y municipio'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 177
    Align = alTop
    TabOrder = 0
    object dbgProvincias: TDBGrid
      Left = 1
      Top = 1
      Width = 452
      Height = 175
      Align = alClient
      DataSource = dmDirecciones.dsProvincias
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dbgProvinciasKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'id_provincia'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_provincia'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end>
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 0
    Top = 197
    Width = 454
    Height = 233
    Align = alClient
    TabOrder = 1
    object dbgMunicipios: TDBGrid
      Left = 1
      Top = 1
      Width = 452
      Height = 231
      Hint = 'Pulsa el botón derecho del ratón para ver opciones...'
      Align = alClient
      DataSource = dmDirecciones.dsMunicipios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = mnuMunicipios
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dbgMunicipiosKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'id_municipio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_municipio'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 296
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_cp'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end>
    end
  end
  object JAMPanel3: TJAMPanel
    Left = 0
    Top = 177
    Width = 454
    Height = 20
    Align = alTop
    TabOrder = 2
    object dbnCarreras: TDBNavigator
      Left = 1
      Top = 1
      Width = 452
      Height = 18
      DataSource = dmDirecciones.dsProvincias
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
  object JAMPanel4: TJAMPanel
    Left = 0
    Top = 430
    Width = 454
    Height = 20
    Align = alBottom
    TabOrder = 3
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 452
      Height = 18
      DataSource = dmDirecciones.dsMunicipios
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
    Top = 450
    Width = 454
    Height = 33
    Align = alBottom
    TabOrder = 4
    object btnAceptar: TBitBtn
      Left = 126
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
      Kind = bkOK
    end
    object btnCancelar: TBitBtn
      Left = 252
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object mnuMunicipios: TPopupMenu
    Left = 149
    Top = 260
    object mnuCambiaCP: TMenuItem
      Caption = 'Cambiar CP'
      OnClick = mnuCambiaCPClick
    end
  end
end
