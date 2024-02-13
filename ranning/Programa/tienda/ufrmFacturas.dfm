inherited frmFacturas: TfrmFacturas
  Left = 228
  Top = 193
  Width = 744
  Height = 468
  ActiveControl = dbeCdFactura
  Caption = 'Facturas'
  Menu = mnFacturas
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 179
    Align = alTop
    TabOrder = 0
    object dbgFacturas: TDBGrid
      Left = 1
      Top = 1
      Width = 734
      Height = 153
      Align = alClient
      DataSource = dmClientes.dsFacturas
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
          FieldName = 'cd_factura'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'f_factura'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
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
          Width = 320
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_direccion'
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
          Visible = True
        end>
    end
    object dbnFacturas: TDBNavigator
      Left = 1
      Top = 154
      Width = 734
      Height = 24
      DataSource = dmClientes.dsFacturas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel]
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
      OnClick = dbnFacturasClick
    end
  end
  object pnCombos: TPanel
    Left = 0
    Top = 179
    Width = 736
    Height = 69
    Align = alTop
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 705
      Top = 36
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
    object dbeCdFactura: TJAMDBLabelEdit
      Left = 64
      Top = 10
      Width = 121
      Height = 21
      DataField = 'cd_factura'
      DataSource = dmClientes.dsFacturas
      TabOrder = 0
      OnExit = dbeCdFacturaExit
      LabelCaption = 'Num factura'
      LabelVisible = True
    end
    object JAMDBLabelEdit2: TJAMDBLabelEdit
      Left = 247
      Top = 10
      Width = 121
      Height = 21
      DataField = 'f_factura'
      DataSource = dmClientes.dsFacturas
      TabOrder = 1
      LabelCaption = 'Fecha'
      LabelVisible = True
    end
    object dbeCliente: TJAMDBLabelEdit
      Left = 40
      Top = 36
      Width = 663
      Height = 21
      Color = clBtnFace
      DataField = 'ds_cliente'
      DataSource = dmClientes.dsFacturas
      ReadOnly = True
      TabOrder = 3
      LabelCaption = 'Cliente'
      LabelVisible = True
    end
    object JAMDBLabelEdit1: TJAMDBLabelEdit
      Left = 454
      Top = 10
      Width = 66
      Height = 21
      DataField = 'nm_gastos_envio'
      DataSource = dmClientes.dsFacturas
      TabOrder = 2
      LabelCaption = 'Gastos envío'
      LabelVisible = True
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 0
    Top = 248
    Width = 736
    Height = 166
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object dbgFacturasDetalle: TDBGrid
      Left = 1
      Top = 1
      Width = 734
      Height = 139
      Align = alClient
      DataSource = dmClientes.dsFacturasDetalle
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
      Top = 140
      Width = 734
      Height = 25
      DataSource = dmClientes.dsFacturasDetalle
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
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
    end
  end
  object mnFacturas: TMainMenu
    Left = 457
    Top = 85
    object mnImprimir: TMenuItem
      Caption = 'Imprimir factura'
      OnClick = mnImprimirClick
    end
  end
end
