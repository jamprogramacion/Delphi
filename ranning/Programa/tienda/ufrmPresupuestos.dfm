inherited frmPresupuestos: TfrmPresupuestos
  Left = 215
  Top = 156
  Width = 799
  Height = 559
  Caption = 'Presupuestos'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 119
    Height = 13
    Caption = 'Presupuestos disponibles'
  end
  object Label2: TLabel
    Left = 8
    Top = 272
    Width = 126
    Height = 13
    Caption = 'Productos del presupuesto'
  end
  object Label3: TLabel
    Left = 8
    Top = 455
    Width = 137
    Height = 13
    Caption = 'Anotaciones del presupuesto'
  end
  object lblGrabaObs: TLabel
    Left = 341
    Top = 455
    Width = 112
    Height = 13
    Cursor = crHandPoint
    Caption = 'Grabar anotaciones'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lblGrabaObsClick
  end
  object lblCancelaObs: TLabel
    Left = 470
    Top = 455
    Width = 192
    Height = 13
    Cursor = crHandPoint
    Caption = 'Cancelar cambios en anotaciones'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lblCancelaObsClick
  end
  object btnActualizar: TButton
    Left = 667
    Top = 65
    Width = 118
    Height = 25
    Caption = 'Descarga lista de web'
    TabOrder = 1
    OnClick = btnActualizarClick
  end
  object btnExportar: TButton
    Left = 667
    Top = 232
    Width = 118
    Height = 25
    Caption = 'Exportar a HTML'
    TabOrder = 6
    OnClick = btnExportarClick
  end
  object btnBorrar: TButton
    Left = 667
    Top = 196
    Width = 118
    Height = 25
    Caption = 'Borra presupuesto'
    TabOrder = 5
    OnClick = btnBorrarClick
  end
  object btnVerPdf: TButton
    Left = 729
    Top = 320
    Width = 56
    Height = 25
    Caption = 'Ver PDF'
    TabOrder = 9
    OnClick = btnVerPdfClick
  end
  object btnEmail: TButton
    Left = 667
    Top = 289
    Width = 118
    Height = 25
    Caption = 'Envia por e-mail'
    TabOrder = 7
    OnClick = btnEmailClick
  end
  object dbgCarritoPresupuesto: TDBGrid
    Left = 8
    Top = 29
    Width = 654
    Height = 228
    Hint = 'Pulsa el botón derecho del ratón para ver opciones...'
    DataSource = dmPresupuestos.dsCarritoPresupuesto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = mnuPresupuestos
    ShowHint = True
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgCarritoPresupuestoDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'id_cliente'
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
        FieldName = 'cod_cliente_access'
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
        FieldName = 'ds_estado_pedido'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'f_fecha_compra'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'f_fecha_aceptacion'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 107
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_descuento_efectivo'
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
        FieldName = 'ds_agencia_transporte'
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
        FieldName = 'ds_forma_pago'
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
        FieldName = 'nm_gastos_envio'
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
      end
      item
        Expanded = False
        FieldName = 'ds_codigo_envio'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'f_fecha_envio'
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
        FieldName = 'it_canarias'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object dbgCarrito: TDBGrid
    Left = 8
    Top = 289
    Width = 654
    Height = 154
    Hint = 'Pulsa el botón derecho del ratón para ver opciones...'
    DataSource = dmPresupuestos.dsCarrito
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = mnuProductos
    ShowHint = True
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgCarritoPresupuestoDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ds_marca'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cd_producto'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 97
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
        Width = 66
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
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_color_completo'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 110
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
        Width = 49
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
        Width = 52
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
        Width = 43
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
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_precio_final'
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
        FieldName = 'nm_precio_final_total'
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
        FieldName = 'nm_iva'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object cbSoloNoAceptados: TJAMCheckBox
    Left = 454
    Top = 259
    Width = 178
    Height = 17
    Caption = 'Mostrar sólo los pedidos activos'
    Checked = True
    State = cbChecked
    TabOrder = 11
    OnClick = cbSoloNoAceptadosClick
  end
  object edId: TJAMLabelEdit
    Left = 667
    Top = 42
    Width = 118
    Height = 21
    TabOrder = 0
    OnChange = edIdChange
    LabelPosition = lpUpSide
    LabelCaption = 'Código de cliente web:'
    LabelVisible = True
  end
  object btnBuscar: TButton
    Left = 667
    Top = 93
    Width = 118
    Height = 25
    Caption = 'Busca presupuesto'
    TabOrder = 2
    OnClick = btnBuscarClick
  end
  object btnVenta: TButton
    Left = 667
    Top = 169
    Width = 118
    Height = 25
    Caption = 'Vender'
    Enabled = False
    TabOrder = 4
    OnClick = btnVentaClick
  end
  object btnActualizar2: TButton
    Left = 667
    Top = 133
    Width = 118
    Height = 25
    Caption = 'Actualizar'
    TabOrder = 3
    OnClick = btnActualizar2Click
  end
  object btnVerHtml: TButton
    Left = 667
    Top = 320
    Width = 56
    Height = 25
    Caption = 'Ver HTML'
    TabOrder = 8
    OnClick = btnVerHtmlClick
  end
  object dbmObservaciones: TJAMDBMemo
    Left = 8
    Top = 471
    Width = 654
    Height = 46
    DataField = 'ds_observaciones'
    DataSource = dmPresupuestos.dsCarritoPresupuesto
    ScrollBars = ssVertical
    TabOrder = 14
  end
  object pnBotones: TJAMPanel
    Left = 665
    Top = 374
    Width = 125
    Height = 143
    TabOrder = 10
    object btnBorraProducto: TJAMButton
      Left = 4
      Top = 113
      Width = 118
      Height = 25
      Caption = 'Borra producto'
      PopupMenu = mnuTallas
      TabOrder = 7
      OnClick = btnBorraProductoClick
    end
    object btnCantidad: TJAMButton
      Left = 33
      Top = 86
      Width = 89
      Height = 25
      Caption = 'Cambia cantidad'
      PopupMenu = mnuTallas
      TabOrder = 6
      OnClick = btnCantidadClick
    end
    object edCantidad: TJAMNumberEdit
      Left = 4
      Top = 88
      Width = 26
      Height = 21
      TabOrder = 5
      Text = '1'
    end
    object btnCambiaTalla: TJAMButton
      Left = 4
      Top = 59
      Width = 118
      Height = 25
      Caption = 'Cambiar talla'
      PopupMenu = mnuTallas
      TabOrder = 4
      OnClick = btnCambiaTallaClick
    end
    object btnCambiaDescuento: TJAMButton
      Left = 31
      Top = 32
      Width = 91
      Height = 25
      Caption = 'Cambia descuento'
      TabOrder = 3
      OnClick = btnCambiaDescuentoClick
    end
    object edDescuento: TJAMNumberEdit
      Left = 4
      Top = 34
      Width = 24
      Height = 21
      TabOrder = 2
      Text = '10'
    end
    object btnCambiaPrecio: TJAMButton
      Left = 46
      Top = 5
      Width = 76
      Height = 25
      Caption = 'Cambia precio'
      TabOrder = 1
      OnClick = btnCambiaPrecioClick
    end
    object edPrecio: TJAMNumberEdit
      Left = 4
      Top = 7
      Width = 38
      Height = 21
      TabOrder = 0
      Text = '10'
    end
  end
  object mnuPresupuestos: TPopupMenu
    OnPopup = mnuPresupuestosPopup
    Left = 321
    Top = 69
    object mnuEditar: TMenuItem
      Caption = 'Editar presupuesto'
    end
    object mnuAceptado: TMenuItem
      Caption = 'Presupuesto aceptado'
      OnClick = mnuAceptadoClick
    end
    object mnuPagado: TMenuItem
      Caption = 'Pago del pedido realizado'
      OnClick = mnuPagadoClick
    end
    object mnuRecogida: TMenuItem
      Caption = 'Recogida solicitada a la agencia'
      OnClick = mnuRecogidaClick
    end
    object mnuEnviado: TMenuItem
      Caption = 'Pedido enviado al cliente'
      OnClick = mnuEnviadoClick
    end
    object mnuEstadoInicial: TMenuItem
      Caption = 'Pasar pedido al estado "Enviado a Ranning"'
      OnClick = mnuEstadoInicialClick
    end
    object mnuCopiarDNI: TMenuItem
      Caption = 'Copiar DNI al portapapeles'
      OnClick = mnuCopiarDNIClick
    end
    object mnuCopiarID: TMenuItem
      Caption = 'Copiar "ID cliente" al portapapeles'
      OnClick = mnuCopiarIDClick
    end
    object mnuCopiarCodigoEnvio: TMenuItem
      Caption = 'Copiar código envío al portapapeles'
      OnClick = mnuCopiarCodigoEnvioClick
    end
    object mnuCopiarEmail: TMenuItem
      Caption = 'Copiar dirección de e-mail al portapapeles'
      OnClick = mnuCopiarEmailClick
    end
    object mnuCopiaEnlacePedido: TMenuItem
      Caption = 'Copia enlace al pedido al portapapeles'
      OnClick = mnuCopiaEnlacePedidoClick
    end
    object mnuEnviarCorreo: TMenuItem
      Caption = 'Enviar un e-mail al cliente'
      OnClick = mnuEnviarCorreoClick
    end
    object mnuEnviarDatosCliente: TMenuItem
      Caption = 'Enviar un e-mail con los datos de cliente para la web'
      OnClick = mnuEnviarDatosClienteClick
    end
    object mnuSubirAWeb: TMenuItem
      Caption = 'Subir presupuesto a la web'
      OnClick = mnuSubirAWebClick
    end
    object mnuCodigoEnvio: TMenuItem
      Caption = 'Código de envío'
      OnClick = mnuCodigoEnvioClick
    end
    object mnuCanarias: TMenuItem
      Caption = 'Envío a Canarias sin IVA'
      OnClick = mnuCanariasClick
    end
    object mnuAltaClienteAccess: TMenuItem
      Caption = 'Dar de alta el cliente en Access'
      OnClick = mnuAltaClienteAccessClick
    end
    object mnuAltaCliente: TMenuItem
      Caption = 'Dar de alta el cliente'
      OnClick = mnuAltaClienteClick
    end
    object mnuClienteDeParte: TMenuItem
      Caption = 'Cliente de parte de otro'
      OnClick = mnuClienteDeParteClick
    end
    object mnuAltaDireccion: TMenuItem
      Caption = 'Dar de alta la dirección para este cliente'
      OnClick = mnuAltaDireccionClick
    end
    object mnuVerDatosCliente: TMenuItem
      Caption = 'Ver datos del cliente'
      OnClick = mnuVerDatosClienteClick
    end
    object mnuDuplicaPresupuesto: TMenuItem
      Caption = 'Duplica el presupuesto'
      OnClick = mnuDuplicaPresupuestoClick
    end
    object mnuPresupuestoAnulado: TMenuItem
      Caption = 'Pedido anulado'
      OnClick = mnuPresupuestoAnuladoClick
    end
    object mnuEtiquetaEnvio: TMenuItem
      Caption = 'Etiqueta para el envío'
      object mnuEtiquetaEnvioConTelefono: TMenuItem
        Caption = 'Con teléfono'
        OnClick = mnuEtiquetaEnvioConTelefonoClick
      end
      object mnuEtiquetaEnvioSinTelefono: TMenuItem
        Caption = 'Sin teléfono'
        OnClick = mnuEtiquetaEnvioSinTelefonoClick
      end
    end
    object mnuDescuentoEfectivo: TMenuItem
      Caption = 'Descuento en efectivo'
      OnClick = mnuDescuentoEfectivoClick
    end
    object mnuCambioEnvioPago: TMenuItem
      Caption = 'Cambiar forma de envío y pago'
    end
    object mnuUnir: TMenuItem
      Caption = 'Une este presupuesto a otro'
      OnClick = mnuUnirClick
    end
  end
  object mnuTallas: TPopupMenu
    AutoPopup = False
    MenuAnimation = [maBottomToTop]
    Left = 401
    Top = 380
  end
  object mnuProductos: TPopupMenu
    OnPopup = mnuProductosPopup
    Left = 236
    Top = 362
    object mnuDevolucion: TMenuItem
      Caption = 'Marcar producto como devolución'
      OnClick = mnuDevolucionClick
    end
  end
  object jvCorreo: TJvMail
    BlindCopy = <>
    CarbonCopy = <>
    LogonOptions = []
    Recipient = <>
    OnError = jvCorreoError
    Left = 331
    Top = 254
  end
  object mnuCambiaPrecio: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    Left = 543
    Top = 368
    object mnuCambiaPrecioSel: TMenuItem
      Caption = 'Artículo seleccionado'
      OnClick = mnuCambiaPrecioSelClick
    end
    object mnucambiaPrecioTodoEste: TMenuItem
      Caption = 'Todos los artículos como el seleccionado'
      OnClick = mnucambiaPrecioTodoEsteClick
    end
    object mnuCambiaPrecioTodos: TMenuItem
      Caption = 'Todos los artículos'
      OnClick = mnuCambiaPrecioTodosClick
    end
  end
  object mnuCambiaDescuento: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    Left = 470
    Top = 339
    object mnuCambiaDescuentoSel: TMenuItem
      Caption = 'Artículo seleccionado'
      OnClick = mnuCambiaDescuentoSelClick
    end
    object mnuCambiaDescuentoTodoEste: TMenuItem
      Caption = 'Todos los artículos como el seleccionado'
      OnClick = mnuCambiaDescuentoTodoEsteClick
    end
    object mnuCambiaDescuentoTodos: TMenuItem
      Caption = 'Todos los artículos'
      OnClick = mnuCambiaDescuentoTodosClick
    end
  end
end
