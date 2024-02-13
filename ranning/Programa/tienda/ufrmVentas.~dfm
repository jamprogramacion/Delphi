inherited frmVentas: TfrmVentas
  Left = 207
  Top = 164
  Height = 551
  ActiveControl = JAMDBLabelEdit1
  Caption = 'Ventas'
  Menu = mnuVentas
  OldCreateOrder = True
  OnActivate = dbcbFormaPagoChange
  PixelsPerInch = 96
  TextHeight = 13
  object pnCombos1: TJAMPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 329
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 192
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object Label2: TLabel
      Left = 211
      Top = 192
      Width = 71
      Height = 13
      Caption = 'Forma de pago'
    end
    object SpeedButton1: TSpeedButton
      Left = 759
      Top = 214
      Width = 23
      Height = 21
      Hint = 'Cambiar provincia y municipio'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 6
      Top = 270
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label4: TLabel
      Left = 771
      Top = 245
      Width = 11
      Height = 13
      Caption = ' %'
    end
    object SpeedButton2: TSpeedButton
      Left = 381
      Top = 161
      Width = 47
      Height = 21
      Caption = 'Pagado'
      OnClick = SpeedButton2Click
    end
    object Label5: TLabel
      Left = 653
      Top = 165
      Width = 8
      Height = 13
      Caption = '%'
    end
    object dbnVentas: TDBNavigator
      Left = 1
      Top = 128
      Width = 790
      Height = 25
      DataSource = dmVentas.dsVentas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
      Align = alTop
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
      TabOrder = 1
      BeforeAction = dbnVentasBeforeAction
      OnClick = dbnVentasClick
    end
    object dbgVentas: TDBGrid
      Left = 1
      Top = 1
      Width = 790
      Height = 127
      Align = alTop
      DataSource = dmVentas.dsVentas
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
          FieldName = 'f_venta'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'f_pago'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_precio_pagado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_iva_pagado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_descuento_total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_comision_pago'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_comision_total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_gastos_envio'
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
          FieldName = 'ds_vendedor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_forma_pago'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end>
    end
    object JAMDBLabelEdit1: TJAMDBLabelEdit
      Left = 39
      Top = 161
      Width = 166
      Height = 21
      DataField = 'f_venta'
      DataSource = dmVentas.dsVentas
      TabOrder = 2
      LabelCaption = 'Fecha'
      LabelVisible = True
    end
    object dbeFPago: TJAMDBLabelEdit
      Left = 273
      Top = 161
      Width = 107
      Height = 21
      DataField = 'f_pago'
      DataSource = dmVentas.dsVentas
      TabOrder = 3
      OnExit = dbeFPagoExit
      LabelCaption = 'Fecha pago'
      LabelVisible = True
    end
    object JAMDBLabelEdit3: TJAMDBLabelEdit
      Left = 505
      Top = 161
      Width = 56
      Height = 21
      DataField = 'nm_gastos_envio'
      DataSource = dmVentas.dsVentas
      TabOrder = 4
      OnExit = JAMDBLabelEdit3Exit
      LabelCaption = 'Gastos envío'
      LabelVisible = True
    end
    object dbcbVendedor: TJAMDBIdComboBox
      Left = 57
      Top = 188
      Width = 148
      Height = 21
      Style = csDropDownList
      DataField = 'ds_vendedor'
      DataSource = dmVentas.dsVentas
      ItemHeight = 13
      TabOrder = 7
      ListDataSource = dmVentas.dsVendedores
      ListFieldId = 'id_vendedor'
      ListFieldDs = 'ds_vendedor'
      FieldId = 'id_vendedor'
    end
    object dbcbFormaPago: TJAMDBIdComboBox
      Left = 288
      Top = 188
      Width = 174
      Height = 21
      Style = csDropDownList
      DataField = 'ds_forma_pago'
      DataSource = dmVentas.dsVentas
      ItemHeight = 13
      TabOrder = 8
      OnChange = dbcbFormaPagoChange
      ListDataSource = dmVentas.dsFormasPago
      ListFieldId = 'id_forma_pago'
      ListFieldDs = 'ds_forma_pago'
      FieldId = 'id_forma_pago'
    end
    object dbeCliente: TJAMDBLabelEdit
      Left = 40
      Top = 214
      Width = 715
      Height = 21
      Color = clBtnFace
      DataField = 'ds_cliente'
      DataSource = dmVentas.dsVentas
      ReadOnly = True
      TabOrder = 9
      LabelCaption = 'Cliente'
      LabelVisible = True
    end
    object JAMDBMemo1: TJAMDBMemo
      Left = 6
      Top = 283
      Width = 780
      Height = 38
      DataField = 'observaciones'
      DataSource = dmVentas.dsVentas
      ScrollBars = ssVertical
      TabOrder = 12
    end
    object JAMDBLabelEdit7: TJAMDBLabelEdit
      Left = 724
      Top = 241
      Width = 47
      Height = 21
      Color = clBtnFace
      DataField = 'nm_descuento_cliente'
      DataSource = dmVentas.dsVentas
      ReadOnly = True
      TabOrder = 11
      LabelCaption = 'Descuento cliente'
      LabelVisible = True
    end
    object JAMDBCheckBox1: TJAMDBCheckBox
      Left = 679
      Top = 190
      Width = 103
      Height = 17
      Caption = 'Venta terminada'
      DataField = 'it_terminada'
      DataSource = dmVentas.dsVentas
      Enabled = False
      TabOrder = 6
      ValueChecked = 'X'
      ValueUnchecked = '-'
    end
    object JAMDBLabelEdit2: TJAMDBLabelEdit
      Left = 622
      Top = 161
      Width = 28
      Height = 21
      DataField = 'nm_iva_gastos_envio'
      DataSource = dmVentas.dsVentas
      TabOrder = 5
      OnExit = JAMDBLabelEdit2Exit
      LabelCaption = 'IVA envío'
      LabelVisible = True
    end
    object JAMDBLabelEdit10: TJAMDBLabelEdit
      Left = 87
      Top = 241
      Width = 336
      Height = 21
      DataField = 'ds_codigo_envio'
      DataSource = dmVentas.dsVentas
      TabOrder = 10
      LabelCaption = 'Código de envío'
      LabelVisible = True
    end
    object JAMDBEdit1: TJAMDBEdit
      Left = 680
      Top = 161
      Width = 102
      Height = 21
      Color = clBtnFace
      DataField = 'nm_iva_gastos_envio_total'
      DataSource = dmVentas.dsVentas
      ReadOnly = True
      TabOrder = 13
    end
    object JAMDBCheckBox2: TJAMDBCheckBox
      Left = 679
      Top = 264
      Width = 103
      Height = 17
      Caption = 'Devolución'
      DataField = 'it_devolucion'
      DataSource = dmVentas.dsVentas
      Enabled = False
      TabOrder = 14
      ValueChecked = 'X'
      ValueUnchecked = '-'
    end
  end
  object pnCombos2: TJAMPanel
    Left = 0
    Top = 460
    Width = 792
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object JAMDBLabelEdit4: TJAMDBLabelEdit
      Left = 50
      Top = 8
      Width = 53
      Height = 21
      DataField = 'nm_cantidad'
      DataSource = dmVentas.dsVentasDetalle
      TabOrder = 0
      OnExit = JAMDBLabelEdit4Exit
      LabelCaption = 'Cantidad'
      LabelVisible = True
    end
    object JAMDBLabelEdit5: TJAMDBLabelEdit
      Left = 159
      Top = 8
      Width = 64
      Height = 21
      DataField = 'nm_precio_unitario'
      DataSource = dmVentas.dsVentasDetalle
      TabOrder = 1
      OnExit = JAMDBLabelEdit5Exit
      LabelCaption = 'PVP c/u'
      LabelVisible = True
    end
    object JAMDBLabelEdit6: TJAMDBLabelEdit
      Left = 434
      Top = 8
      Width = 53
      Height = 21
      DataField = 'nm_descuento'
      DataSource = dmVentas.dsVentasDetalle
      TabOrder = 3
      OnExit = JAMDBLabelEdit6Exit
      LabelCaption = '% Descuento'
      LabelVisible = True
    end
    object JAMDBLabelEdit8: TJAMDBLabelEdit
      Left = 709
      Top = 8
      Width = 76
      Height = 21
      DataField = 'nm_precio_pagado'
      DataSource = dmVentas.dsVentasDetalle
      TabOrder = 4
      LabelCaption = 'A pagar'
      LabelVisible = True
    end
    object JAMDBLabelEdit9: TJAMDBLabelEdit
      Left = 269
      Top = 8
      Width = 80
      Height = 21
      Color = clBtnFace
      DataField = 'nm_precio_total'
      DataSource = dmVentas.dsVentasDetalle
      ReadOnly = True
      TabOrder = 2
      LabelCaption = 'PVP'
      LabelVisible = True
    end
  end
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 329
    Width = 792
    Height = 131
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object dbgVentasDetalle: TDBGrid
      Left = 1
      Top = 1
      Width = 790
      Height = 104
      Align = alClient
      DataSource = dmVentas.dsVentasDetalle
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
          FieldName = 'ds_marca'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cd_producto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_producto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 174
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
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_talla'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_cantidad'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_precio_unitario'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_precio_total'
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_descuento_total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_precio_pagado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_iva'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_iva_total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object dbnVentasDetalle: TDBNavigator
      Left = 1
      Top = 105
      Width = 790
      Height = 25
      DataSource = dmVentas.dsVentasDetalle
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel]
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
      TabOrder = 1
      OnClick = dbnVentasDetalleClick
    end
  end
  object mnuVentas: TMainMenu
    Left = 349
    Top = 47
    object mnuFacturar: TMenuItem
      Caption = 'Facturar'
      OnClick = mnuFacturarClick
    end
  end
end
