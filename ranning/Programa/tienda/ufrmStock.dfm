inherited frmStock: TfrmStock
  Left = 295
  Top = 153
  Width = 823
  Height = 499
  ActiveControl = dbgStock
  Caption = 'Stock'
  Menu = mnuProductos
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 290
    Align = alClient
    TabOrder = 0
    object dbnStock: TDBNavigator
      Left = 1
      Top = 245
      Width = 813
      Height = 25
      DataSource = dmProductos.dsStock
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
      BeforeAction = dbnStockBeforeAction
      OnClick = dbnStockClick
    end
    object dbgStock: TDBGrid
      Left = 1
      Top = 19
      Width = 813
      Height = 226
      Hint = 'Pulsa + o - para cambiar la cantidad'
      Align = alClient
      DataSource = dmProductos.dsStock
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentShowHint = False
      PopupMenu = mnuStock
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = dbgStockKeyDown
      OnTitleClick = dbgStockTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_temporada'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 161
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
          Width = 54
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
          Width = 55
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
          Width = 37
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
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_descuento_oferta'
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
          FieldName = 'ds_talla'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_color'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 171
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
          Width = 120
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
    object dbnProductos: TDBNavigator
      Left = 1
      Top = 1
      Width = 813
      Height = 18
      DataSource = dmProductos.dsProductos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      Flat = True
      Hints.Strings = (
        'Primer producto'
        'Producto anterior'
        'producto siguiente'
        'Último producto'
        'Insertar'
        'Borrar'
        'Modificar'
        'Grabar'
        'Cancelar'
        'Actualizar')
      ParentShowHint = False
      ConfirmDelete = False
      ShowHint = True
      TabOrder = 2
      OnClick = dbnProductosClick
    end
    object JAMPanel2: TJAMPanel
      Left = 1
      Top = 270
      Width = 813
      Height = 19
      Align = alBottom
      TabOrder = 3
      object JAMDBLabelEdit2: TJAMDBLabelEdit
        Left = 131
        Top = 1
        Width = 91
        Height = 16
        TabStop = False
        AutoSize = False
        Color = clBtnFace
        DataField = 'f_actualizacion'
        DataSource = dmProductos.dsStock
        ReadOnly = True
        TabOrder = 0
        LabelCaption = 'Fecha última actualización'
        LabelVisible = True
      end
    end
  end
  object pnCombos: TJAMPanel
    Left = 0
    Top = 290
    Width = 815
    Height = 155
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblTalla: TLabel
      Left = 469
      Top = 111
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Talla'
    end
    object Label4: TLabel
      Left = 136
      Top = 62
      Width = 43
      Height = 13
      Caption = 'Margen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 425
      Top = 62
      Width = 65
      Height = 13
      Caption = 'Precio final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 354
      Top = 33
      Width = 31
      Height = 21
      Caption = 'Cero'
      OnClick = SpeedButton1Click
    end
    object Label6: TLabel
      Left = 557
      Top = 10
      Width = 55
      Height = 13
      Caption = 'Ganancia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 426
      Top = 87
      Width = 64
      Height = 13
      Caption = 'Desc. máx.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblImagen: TLabel
      Left = 676
      Top = 137
      Width = 130
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblImagen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object imgProducto: TImage
      Left = 676
      Top = 4
      Width = 130
      Height = 130
      Hint = 'Pulsa el botón derecho del ratón para ver opciones...'
      ParentShowHint = False
      PopupMenu = mnuImagen
      ShowHint = True
      Stretch = True
    end
    object Label8: TLabel
      Left = 19
      Top = 10
      Width = 54
      Height = 13
      Caption = 'Temporada'
    end
    object DBText1: TDBText
      Left = 308
      Top = 134
      Width = 267
      Height = 14
      Hint = 'Haz doble click aquí para cambiar el color...'
      Color = clBtnFace
      DataField = 'ds_color'
      DataSource = dmProductos.dsStock
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object DBText2: TDBText
      Left = 577
      Top = 134
      Width = 98
      Height = 14
      Hint = 'Haz doble click aquí para cambiar el color...'
      Color = clBtnFace
      DataField = 'cd_color'
      DataSource = dmProductos.dsStock
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblPrecioOfertaLbl: TLabel
      Left = 416
      Top = 37
      Width = 74
      Height = 13
      Caption = 'Precio oferta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOferta: TSpeedButton
      Left = 487
      Top = 6
      Width = 68
      Height = 21
      Caption = 'Oferta lanz.'
      OnClick = btnOfertaClick
    end
    object btnTallas: TButton
      Left = 598
      Top = 107
      Width = 69
      Height = 21
      Caption = 'Varias tallas'
      TabOrder = 10
      TabStop = False
      OnClick = btnTallasClick
    end
    object dbeFEntrada: TJAMDBLabelEdit
      Left = 392
      Top = 6
      Width = 93
      Height = 21
      DataField = 'f_entrada'
      DataSource = dmProductos.dsStock
      TabOrder = 1
      OnKeyDown = dbeFEntradaKeyDown
      LabelCaption = 'Fecha entrada'
      LabelVisible = True
    end
    object dbeNmCoste: TJAMDBLabelEdit
      Left = 78
      Top = 33
      Width = 95
      Height = 21
      DataField = 'nm_coste'
      DataSource = dmProductos.dsStock
      TabOrder = 2
      OnExit = dbeNmCosteExit
      LabelCaption = 'Precio coste'
      LabelVisible = True
    end
    object dbeNmIVA: TJAMDBLabelEdit
      Left = 78
      Top = 58
      Width = 54
      Height = 21
      DataField = 'nm_iva'
      DataSource = dmProductos.dsStock
      TabOrder = 4
      LabelCaption = 'IVA'
      LabelVisible = True
    end
    object dbeNmPVP: TJAMDBLabelEdit
      Left = 299
      Top = 58
      Width = 95
      Height = 21
      DataField = 'nm_pvp'
      DataSource = dmProductos.dsStock
      TabOrder = 5
      OnChange = dbeNmPVPChange
      LabelCaption = 'PVP'
      LabelVisible = True
    end
    object dbeNmCantidad: TJAMDBLabelEdit
      Left = 299
      Top = 33
      Width = 53
      Height = 21
      Hint = 'Pulsa los cursores para cambiar la cantidad'
      DataField = 'nm_cantidad'
      DataSource = dmProductos.dsStock
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      LabelCaption = 'Cantidad'
      LabelVisible = True
    end
    object dbeNmPortes: TJAMDBLabelEdit
      Left = 299
      Top = 83
      Width = 121
      Height = 21
      DataField = 'nm_portes'
      DataSource = dmProductos.dsStock
      TabOrder = 7
      LabelCaption = 'Portes'
      LabelVisible = True
    end
    object dbeNmDescuentoCoste: TJAMDBLabelEdit
      Left = 78
      Top = 83
      Width = 121
      Height = 21
      DataField = 'nm_descuento_coste'
      DataSource = dmProductos.dsStock
      TabOrder = 6
      LabelCaption = 'Desc coste'
      LabelVisible = True
    end
    object dbcbTalla: TJAMDBIdComboBox
      Left = 496
      Top = 107
      Width = 98
      Height = 21
      Style = csDropDownList
      DataField = 'ds_talla'
      DataSource = dmProductos.dsStock
      ItemHeight = 13
      TabOrder = 9
      ListDataSource = dmProductos.dsTallas
      ListFieldId = 'id_talla'
      ListFieldDs = 'ds_talla'
      FieldId = 'id_talla'
    end
    object lblMargen: TStaticText
      Left = 182
      Top = 60
      Width = 57
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'lblMargen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object lblPVPFinal: TStaticText
      Left = 496
      Top = 60
      Width = 69
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'lblPVPFinal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object lblGanancia: TStaticText
      Left = 616
      Top = 8
      Width = 58
      Height = 17
      Alignment = taRightJustify
      BorderStyle = sbsSunken
      Caption = 'Ganancia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object lblDescMaximo: TStaticText
      Left = 496
      Top = 85
      Width = 110
      Height = 17
      Alignment = taRightJustify
      BorderStyle = sbsSunken
      Caption = 'Descuento máximo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
    end
    object JAMDBLabelEdit1: TJAMDBLabelEdit
      Left = 85
      Top = 129
      Width = 173
      Height = 21
      DataField = 'cd_color_fabricante'
      DataSource = dmProductos.dsStock
      TabOrder = 11
      LabelCaption = 'Cod color marca'
      LabelVisible = True
    end
    object dbcbTemporada: TJAMDBIdComboBox
      Left = 78
      Top = 6
      Width = 237
      Height = 21
      Style = csDropDownList
      DataField = 'ds_temporada'
      DataSource = dmProductos.dsStock
      ItemHeight = 13
      TabOrder = 0
      ListDataSource = dmProductos.dsTemporadas
      ListFieldId = 'id_temporada'
      ListFieldDs = 'ds_temporada'
      FieldId = 'id_temporada'
    end
    object btnColores: TButton
      Left = 262
      Top = 129
      Width = 42
      Height = 21
      Caption = 'Colores'
      TabOrder = 16
      OnClick = btnColoresClick
    end
    object lblPrecioOferta: TStaticText
      Left = 496
      Top = 35
      Width = 77
      Height = 17
      Alignment = taRightJustify
      BorderStyle = sbsSunken
      Caption = 'Precio oferta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
    end
    object btnVariosColores: TButton
      Left = 262
      Top = 106
      Width = 75
      Height = 21
      Caption = 'Varios colores'
      TabOrder = 17
      OnClick = btnVariosColoresClick
    end
    object dbeNmDescuentoOferta: TJAMDBLabelEdit
      Left = 79
      Top = 104
      Width = 121
      Height = 21
      DataField = 'nm_descuento_oferta'
      DataSource = dmProductos.dsStock
      TabOrder = 8
      LabelCaption = 'Descuento'
      LabelVisible = True
    end
  end
  object mnuImagen: TPopupMenu
    OnPopup = mnuImagenPopup
    Left = 711
    Top = 292
    object mnuImagenActualizar: TMenuItem
      Caption = 'Actualizar imagen'
      OnClick = mnuImagenActualizarClick
    end
    object mnuImagenDetalle: TMenuItem
      Caption = 'Ampliar imagen'
      OnClick = mnuImagenDetalleClick
    end
    object mnuImagenSeleccionar: TMenuItem
      Caption = 'Seleccionar imagen'
      OnClick = mnuImagenSeleccionarClick
    end
    object mnuImagenBorrar: TMenuItem
      Caption = 'Borrar imagen'
      OnClick = mnuImagenBorrarClick
    end
  end
  object dlgImagenProducto: TOpenPictureDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Imagen del producto'
    Left = 728
    Top = 339
  end
  object mnuProductos: TMainMenu
    Left = 264
    Top = 106
    object mnuPresupuestos: TMenuItem
      Caption = 'Presupuestos'
      OnClick = mnuPresupuestosClick
      object mnuInsertaProducto: TMenuItem
        Caption = 'Añade este producto al presupuesto'
        OnClick = mnuInsertaProductoClick
      end
    end
    object mnuEtiquetas: TMenuItem
      Caption = 'Etiquetas'
      GroupIndex = 253
      object mnuEtiquetasProducto: TMenuItem
        Caption = 'Etiqueta del producto actual'
        OnClick = mnuEtiquetasProductoClick
      end
      object mnuEtiquetasOferta: TMenuItem
        Caption = 'Etiquetas de oferta'
      end
      object mnuEtiquetasArchivo: TMenuItem
        Caption = 'Ver/editar/imprimir etiquetas'
        OnClick = mnuEtiquetasArchivoClick
      end
    end
    object mnuUtilidades: TMenuItem
      Caption = 'Utilidades'
      GroupIndex = 253
      object mnuUtilidadesEnlaceImagen: TMenuItem
        Caption = 'Enlace a la imagen'
        OnClick = mnuUtilidadesEnlaceImagenClick
      end
    end
  end
  object mnuStock: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    Left = 488
    Top = 127
    object mnuInsertaPedido: TMenuItem
      Caption = 'Dar de alta el producto en pedidos'
      OnClick = mnuInsertaPedidoClick
    end
    object mnuInsertaTallaPedido: TMenuItem
      Caption = 'Dar de alta esta talla en pedidos'
      OnClick = mnuInsertaTallaPedidoClick
    end
  end
end
