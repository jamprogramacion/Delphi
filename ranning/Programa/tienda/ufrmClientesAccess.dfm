inherited frmClientesAccess: TfrmClientesAccess
  Left = 337
  Top = 169
  Height = 418
  ActiveControl = edBusqueda
  Caption = 'Clientes de Access'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 35
    Width = 792
    Height = 349
    Align = alClient
    TabOrder = 0
    object dbgClientesAccess: TDBGrid
      Left = 1
      Top = 1
      Width = 790
      Height = 347
      Hint = 'Pulsa el botón derecho del ratón para ver opciones...'
      Align = alClient
      DataSource = dmClientes.dsClientesAccess
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = mnuClientesAccess
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_cliente'
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
          FieldName = 'nm_compra_total'
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
          FieldName = 'nm_descuento_inicial'
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
          FieldName = 'nm_descuento'
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
          FieldName = 'ds_nombre_completo'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 267
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_nif'
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
          FieldName = 'ds_direccion_completa'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 273
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_ciudad'
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
          FieldName = 'ds_telefono'
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
          FieldName = 'ds_email'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 35
    Align = alTop
    TabOrder = 1
    object btnBorrarBusqueda: TSpeedButton
      Left = 734
      Top = 6
      Width = 43
      Height = 22
      Caption = 'Borrar'
      OnClick = btnBorrarBusquedaClick
    end
    object edBusqueda: TJAMLabelEdit
      Left = 141
      Top = 7
      Width = 592
      Height = 21
      TabOrder = 0
      OnChange = edBusquedaChange
      LabelCaption = 'Código o nombre a buscar: '
      LabelVisible = True
    end
  end
  object mnuClientesAccess: TPopupMenu
    OnPopup = mnuClientesAccessPopup
    Left = 205
    Top = 111
    object mnuCopiaEmail: TMenuItem
      Caption = 'Copia dirección de email al portapapeles'
      OnClick = mnuCopiaEmailClick
    end
    object mnuCopiarDNI: TMenuItem
      Caption = 'Copiar DNI al portapapeles'
      OnClick = mnuCopiarDNIClick
    end
  end
end
