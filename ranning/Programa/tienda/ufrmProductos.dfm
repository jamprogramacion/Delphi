inherited frmProductos: TfrmProductos
  Left = 254
  Top = 146
  Height = 558
  ActiveControl = dbgProductos
  Caption = 'Productos'
  Menu = mnuProductos
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 159
    Width = 792
    Height = 326
    Align = alClient
    TabOrder = 0
    object dbgProductos: TDBGrid
      Left = 1
      Top = 40
      Width = 790
      Height = 285
      Hint = 'Pulsa el botón derecho para ver opciones...'
      Align = alClient
      DataSource = dmProductos.dsProductos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = mnuProducto
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgProductosDrawColumnCell
      OnDblClick = dbgProductosDblClick
      OnKeyPress = dbgProductosKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_marca'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_producto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 89
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
          Width = 208
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_producto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_complemento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_deporte'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_sexo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_peso'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object dbnProductos: TDBNavigator
      Left = 1
      Top = 1
      Width = 790
      Height = 21
      DataSource = dmProductos.dsProductos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      Hints.Strings = (
        'Primero'
        'Anterior'
        'Siguiente'
        'Último'
        'Nuevo'
        'Borrar'
        'Modificar'
        'Grabar'
        'Cancelar'
        'Refrescar')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object pnNumReg: TJAMPanel
      Left = 1
      Top = 22
      Width = 790
      Height = 18
      Align = alTop
      Alignment = taLeftJustify
      TabOrder = 2
      object cbSoloActivos: TCheckBox
        Left = 600
        Top = 1
        Width = 187
        Height = 17
        Caption = 'Mostrar sólo los productos activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = cbSoloActivosClick
      end
    end
  end
  inline frmFiltros: TfrmFiltros
    Width = 792
    Align = alTop
    TabOrder = 1
    inherited JAMPanel1: TJAMPanel
      Width = 792
      inherited JAMPanel2: TJAMPanel
        Width = 274
        inherited btnAdd: TButton
          OnClick = frmFiltrosbtnAddClick
        end
        inherited edFiltro: TJAMEdit
          Width = 263
        end
        inherited btnDel: TButton
          OnClick = frmFiltrosbtnDelClick
        end
        inherited Panel1: TPanel
          inherited btnBuscar: TButton
            OnClick = frmFiltrosbtnBuscarClick
          end
        end
      end
      inherited JAMPanel3: TJAMPanel
        Left = 495
        Width = 296
        inherited lbFiltros: TJAMListBox
          Width = 283
        end
      end
    end
  end
  object sbInfo: TStatusBar
    Left = 0
    Top = 485
    Width = 792
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object mnuProductos: TMainMenu
    Left = 264
    Top = 106
    object mnuAlta: TMenuItem
      Caption = 'Alta de productos (Ctrl+P)'
      ShortCut = 16464
      OnClick = mnuAltaClick
    end
    object mnuStock: TMenuItem
      Caption = 'Stock (Ctrl+S)'
      ShortCut = 16467
      OnClick = mnuStockClick
    end
    object mnuAtributos: TMenuItem
      Caption = 'Características (Ctrl+A)'
      ShortCut = 16449
      OnClick = mnuAtributosClick
    end
    object mnuEtiquetas: TMenuItem
      Caption = 'Etiquetas'
      GroupIndex = 253
      object mnuEtiquetasProducto: TMenuItem
        Caption = 'Etiqueta del producto actual'
        OnClick = mnuEtiquetasProductoClick
      end
      object mnuEtiquetasTodos: TMenuItem
        Caption = 'Etiqueta de todos los productos mostrados'
        OnClick = mnuEtiquetasTodosClick
      end
      object mnuEtiquetasOferta: TMenuItem
        Caption = 'Etiquetas de oferta'
      end
      object mnuEtiquetasArchivo: TMenuItem
        Caption = 'Ver/editar/imprimir etiquetas'
        OnClick = mnuEtiquetasArchivoClick
      end
    end
    object mnuAltaAccess: TMenuItem
      Caption = 'Dar de alta en Access'
      GroupIndex = 253
      OnClick = mnuAltaAccessClick
    end
  end
  object mnuProducto: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    OnPopup = mnuProductoPopup
    Left = 391
    Top = 245
    object mnuDuplicar: TMenuItem
      Caption = 'Duplicar producto'
      OnClick = mnuDuplicarClick
    end
    object mnuProductoDetalles: TMenuItem
      Caption = 'Precios'
      OnClick = mnuProductoDetallesClick
    end
    object mnuProductoBorrar: TMenuItem
      Caption = 'Borrar'
      OnClick = mnuProductoBorrarClick
    end
    object mnuProductoVenta: TMenuItem
      Caption = 'Añadir a venta'
    end
    object mnuProductoPresupuesto: TMenuItem
      Caption = 'Añadir a presupuesto'
    end
    object mnuProductoEtiquetasProducto: TMenuItem
      Caption = 'Etiqueta del producto actual'
      OnClick = mnuEtiquetasProductoClick
    end
    object mnuProductoEtiquetasTodos: TMenuItem
      Caption = 'Etiqueta de todos los productos mostrados'
      OnClick = mnuEtiquetasTodosClick
    end
    object mnuCambiarDescuentoActual: TMenuItem
      Caption = 'Cambiar descuento del producto actual'
      OnClick = mnuDescuentoActualClick
    end
    object mnuCambiarDescuentoTodos: TMenuItem
      Caption = 'Cambiar descuento de todos los productos mostrados'
      OnClick = mnuDescuentoTodosClick
    end
    object mnuCambiaPrecioActual: TMenuItem
      Caption = 'Cambiar el precio final del producto actual'
      OnClick = mnuCambiaPrecioActualClick
    end
    object mnuCambiarPrecioTodos: TMenuItem
      Caption = 'Cambiar el precio final de todos los productos mostrados'
      OnClick = mnuCambiarPrecioTodosClick
    end
  end
end
