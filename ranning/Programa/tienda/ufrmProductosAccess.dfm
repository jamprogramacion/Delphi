inherited frmProductosAccess: TfrmProductosAccess
  Left = 214
  Top = 157
  Width = 721
  Height = 482
  Caption = 'Alta de productos en Access'
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 252
    Align = alBottom
    TabOrder = 0
    object dbgProductosAccess: TDBGrid
      Left = 1
      Top = 20
      Width = 711
      Height = 203
      Align = alClient
      DataSource = dmProductos.dsProductosAccess
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_producto'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_producto'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cd_color_fabricante'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_talla'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_cantidad'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_coste'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_pvp'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_iva'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_margen_real'
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
          FieldName = 'f_entrada'
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
      Top = 1
      Width = 711
      Height = 19
      DataSource = dmProductos.dsProductos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      Hints.Strings = (
        'Primer producto'
        'Producto anterior'
        'Producto siguiente'
        'Último producto'
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = DBNavigator1Click
    end
    object Panel1: TPanel
      Left = 1
      Top = 223
      Width = 711
      Height = 28
      Align = alBottom
      TabOrder = 2
      object Label7: TLabel
        Left = 414
        Top = 8
        Width = 110
        Height = 13
        Caption = 'Unidades a dar de alta:'
      end
      object cbUnColor: TJAMCheckBox
        Left = 9
        Top = 6
        Width = 199
        Height = 17
        Caption = 'Dar de alta sólo el color seleccionado'
        TabOrder = 0
        OnClick = cbUnColorClick
      end
      object cbUnaTalla: TJAMCheckBox
        Left = 213
        Top = 6
        Width = 199
        Height = 17
        Caption = 'Dar de alta sólo la talla seleccionada'
        TabOrder = 1
        OnClick = cbUnaTallaClick
      end
      object edUnidades: TJAMNumberEdit
        Left = 526
        Top = 4
        Width = 30
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = '0'
      end
      object btnSiguienteTalla: TButton
        Left = 580
        Top = 4
        Width = 92
        Height = 21
        Caption = 'Siguiente talla >>'
        TabOrder = 3
        OnClick = btnSiguienteTallaClick
      end
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 0
    Top = 252
    Width = 713
    Height = 159
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 4
      Width = 84
      Height = 13
      Caption = 'Tipo de producto:'
    end
    object Label2: TLabel
      Left = 233
      Top = 4
      Width = 89
      Height = 13
      Caption = 'Sexo del producto:'
    end
    object Label3: TLabel
      Left = 377
      Top = 4
      Width = 52
      Height = 13
      Caption = 'Proveedor:'
    end
    object Label4: TLabel
      Left = 272
      Top = 51
      Width = 189
      Height = 13
      Caption = 'Equivalencias para las tallas en Access:'
    end
    object Label5: TLabel
      Left = 466
      Top = 68
      Width = 60
      Height = 26
      Alignment = taCenter
      Caption = 'Añade equivalencia'
      Visible = False
      WordWrap = True
    end
    object Label6: TLabel
      Left = 533
      Top = 117
      Width = 79
      Height = 13
      Caption = 'Talla en Access:'
    end
    object cbTipoProducto: TJAMComboBox
      Left = 9
      Top = 20
      Width = 166
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbTipoProductoChange
    end
    object cbSexo: TJAMComboBox
      Left = 233
      Top = 20
      Width = 86
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = cbSexoChange
    end
    object cbProveedor: TJAMComboBox
      Left = 377
      Top = 20
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cbProveedorChange
    end
    object edTipoProducto: TJAMEdit
      Left = 175
      Top = 20
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edSexo: TJAMEdit
      Left = 320
      Top = 20
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object edProveedor: TJAMEdit
      Left = 523
      Top = 20
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object cbCodigoColor: TJAMCheckBox
      Left = 9
      Top = 51
      Width = 249
      Height = 17
      Caption = 'Dar de alta un producto por cada color diferente'
      Checked = True
      State = cbChecked
      TabOrder = 8
      OnClick = cbCodigoColorClick
    end
    object lbCodigos: TJAMListBox
      Left = 9
      Top = 92
      Width = 249
      Height = 61
      Hint = 'Selecciona un código para ver si el producto ya existe en Access'
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object lbTallas: TJAMListBox
      Left = 272
      Top = 70
      Width = 189
      Height = 83
      Hint = 'Pulsa el botón derecho del ratón para ver opciones...'
      ItemHeight = 13
      ParentShowHint = False
      PopupMenu = mnuTallas
      ShowHint = True
      TabOrder = 11
      Visible = False
    end
    object dbedTallas: TJAMDBLabelEdit
      Left = 534
      Top = 68
      Width = 112
      Height = 21
      DataField = 'id_talla'
      DataSource = dmProductos.dsProductosAccess
      Enabled = False
      TabOrder = 12
      Visible = False
      OnChange = dbedTallasChange
      LabelPosition = lpUpSide
      LabelCaption = 'Código de talla:'
      LabelVisible = True
    end
    object edTallas: TJAMEdit
      Left = 533
      Top = 132
      Width = 112
      Height = 21
      TabOrder = 13
      Text = 'edTallas'
      Visible = False
      OnKeyPress = edTallasKeyPress
    end
    object btnAddEqTallas: TButton
      Left = 466
      Top = 128
      Width = 62
      Height = 25
      Caption = '<<'
      TabOrder = 14
      Visible = False
      OnClick = btnAddEqTallasClick
    end
    object cbPrefijo: TJAMCheckBox
      Left = 582
      Top = 2
      Width = 104
      Height = 21
      Caption = 'Prefijo del código:'
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = cbPrefijoClick
    end
    object edPrefijo: TJAMEdit
      Left = 582
      Top = 20
      Width = 104
      Height = 21
      TabOrder = 7
      Text = 'edPrefijo'
      OnExit = edPrefijoExit
    end
    object edPrefColor: TJAMLabelEdit
      Left = 88
      Top = 69
      Width = 170
      Height = 21
      TabOrder = 9
      OnExit = edPrefColorExit
      LabelCaption = 'Prefijo del color:'
      LabelVisible = True
    end
  end
  object JAMPanel3: TJAMPanel
    Left = 0
    Top = 411
    Width = 713
    Height = 37
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 262
      Top = 6
      Width = 82
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 369
      Top = 6
      Width = 82
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object mnuTallas: TPopupMenu
    MenuAnimation = [maLeftToRight, maBottomToTop]
    OnPopup = mnuTallasPopup
    Left = 411
    Top = 358
    object mnuBorraEqTallas: TMenuItem
      Caption = 'Borrar equivalencia'
      OnClick = mnuBorraEqTallasClick
    end
  end
end
