inherited frmClientes: TfrmClientes
  Left = 294
  Top = 133
  Height = 568
  ActiveControl = edBusqueda
  Caption = 'Clientes'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 190
    Align = alClient
    TabOrder = 0
    object dbgClientes: TDBGrid
      Left = 1
      Top = 24
      Width = 790
      Height = 165
      Hint = 'Pulsa el botón derecho del ratón para ver opciones...'
      Align = alClient
      DataSource = dmClientes.dsClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = mnuClientes
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
          FieldName = 'id_cliente'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 42
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
          FieldName = 'ds_primer_apellido_esp'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_segundo_apellido_esp'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_nombre_esp'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 100
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
          FieldName = 'ds_dni'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 70
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
          Width = 176
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
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_sexo'
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
          FieldName = 'ds_club'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 393
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'f_nacimiento'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object JAMPanel2: TJAMPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 23
      Align = alTop
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 743
        Top = 1
        Width = 45
        Height = 21
        Caption = 'Borrar'
        OnClick = SpeedButton1Click
      end
      object edBusqueda: TJAMLabelEdit
        Left = 95
        Top = 1
        Width = 645
        Height = 21
        AutoSize = False
        TabOrder = 0
        OnChange = edBusquedaChange
        LabelCaption = 'Nombre y apellidos'
        LabelVisible = True
      end
    end
  end
  object JAMPanel3: TJAMPanel
    Left = 0
    Top = 190
    Width = 792
    Height = 27
    Align = alBottom
    TabOrder = 1
    object dbnClientes: TDBNavigator
      Left = 1
      Top = 1
      Width = 790
      Height = 25
      DataSource = dmClientes.dsClientes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
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
      BeforeAction = dbnClientesBeforeAction
      OnClick = dbnClientesClick
    end
  end
  object pnCombos: TJAMPanel
    Left = 0
    Top = 217
    Width = 792
    Height = 284
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 96
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label2: TLabel
      Left = 249
      Top = 54
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label3: TLabel
      Left = 22
      Top = 78
      Width = 21
      Height = 13
      Caption = 'Club'
    end
    object Label5: TLabel
      Left = 7
      Top = 189
      Width = 56
      Height = 13
      Caption = 'Direcciones'
    end
    object dbePrimerApellido: TJAMDBLabelEdit
      Left = 74
      Top = 4
      Width = 190
      Height = 21
      DataField = 'ds_primer_apellido_esp'
      DataSource = dmClientes.dsClientes
      TabOrder = 0
      LabelCaption = 'Primer apellido'
      LabelVisible = True
    end
    object JAMDBLabelEdit2: TJAMDBLabelEdit
      Left = 356
      Top = 3
      Width = 190
      Height = 21
      DataField = 'ds_segundo_apellido_esp'
      DataSource = dmClientes.dsClientes
      TabOrder = 1
      LabelCaption = 'Segundo apellido'
      LabelVisible = True
    end
    object JAMDBLabelEdit3: TJAMDBLabelEdit
      Left = 594
      Top = 3
      Width = 190
      Height = 21
      DataField = 'ds_nombre_esp'
      DataSource = dmClientes.dsClientes
      TabOrder = 2
      LabelCaption = 'Nombre'
      LabelVisible = True
    end
    object JAMDBNIFLabelEdit4: TJAMDBNIFLabelEdit
      Left = 48
      Top = 27
      Width = 120
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ds_dni'
      DataSource = dmClientes.dsClientes
      TabOrder = 3
      LabelCaption = 'DNI'
      LabelVisible = True
    end
    object JAMDBLabelEdit5: TJAMDBLabelEdit
      Left = 247
      Top = 27
      Width = 94
      Height = 21
      DataField = 'f_nacimiento'
      DataSource = dmClientes.dsClientes
      TabOrder = 4
      LabelCaption = 'F nacimiento'
      LabelVisible = True
    end
    object JAMDBLabelEdit6: TJAMDBLabelEdit
      Left = 383
      Top = 27
      Width = 401
      Height = 21
      DataField = 'ds_email'
      DataSource = dmClientes.dsClientes
      TabOrder = 5
      LabelCaption = 'e-mail'
      LabelVisible = True
    end
    object JAMDBLabelEdit7: TJAMDBLabelEdit
      Left = 48
      Top = 50
      Width = 193
      Height = 21
      DataField = 'ds_telefono'
      DataSource = dmClientes.dsClientes
      TabOrder = 6
      LabelCaption = 'Teléfono'
      LabelVisible = True
    end
    object JAMDBMemo1: TJAMDBMemo
      Left = 7
      Top = 110
      Width = 777
      Height = 48
      DataSource = dmClientes.dsClientes
      ScrollBars = ssVertical
      TabOrder = 10
    end
    object JAMDBLabelEdit10: TJAMDBLabelEdit
      Left = 586
      Top = 161
      Width = 198
      Height = 21
      Color = clBtnFace
      DataField = 'f_ultima_actualizacion'
      DataSource = dmClientes.dsClientes
      ReadOnly = True
      TabOrder = 12
      LabelCaption = 'Última actualización'
      LabelVisible = True
    end
    object dbcbSexo: TJAMDBIdComboBox
      Left = 278
      Top = 50
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'ds_tipo_sexo'
      DataSource = dmClientes.dsClientes
      ItemHeight = 13
      TabOrder = 7
      ListDataSource = dmClientes.dsTiposSexo
      ListFieldId = 'id_tipo_sexo'
      ListFieldDs = 'ds_tipo_sexo'
      FieldId = 'id_tipo_sexo'
    end
    object dbcbClub: TJAMDBIdComboBox
      Left = 47
      Top = 74
      Width = 737
      Height = 21
      Style = csDropDownList
      DataField = 'ds_club'
      DataSource = dmClientes.dsClientes
      ItemHeight = 13
      TabOrder = 9
      ListDataSource = dmClientes.dsClubes
      ListFieldId = 'id_club'
      ListFieldDs = 'ds_club'
      FieldId = 'id_club'
    end
    object JAMDBLabelEdit11: TJAMDBLabelEdit
      Left = 391
      Top = 161
      Width = 89
      Height = 21
      Color = clBtnFace
      DataField = 'nm_compras_inicial'
      DataSource = dmClientes.dsClientes
      ReadOnly = True
      TabOrder = 13
      LabelCaption = 'Compras iniciales'
      LabelVisible = True
    end
    object dbgDirecciones: TDBGrid
      Left = 7
      Top = 185
      Width = 777
      Height = 93
      Hint = 'Haz doble click en la dirección para editarla...'
      DataSource = dmClientes.dsDireccionesClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = mnuDirecciones
      ShowHint = True
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgDireccionesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id_tipo_via'
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
          FieldName = 'ds_nombre_via'
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
          FieldName = 'ds_numero'
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
          FieldName = 'ds_resto_direccion'
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
          FieldName = 'municipio'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_tipo_via'
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
          FieldName = 'ds_cp_extranjero'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object JAMDBLabelEdit1: TJAMDBLabelEdit
      Left = 496
      Top = 50
      Width = 121
      Height = 21
      DataField = 'nm_descuento'
      DataSource = dmClientes.dsClientes
      TabOrder = 8
      LabelCaption = 'Descuento'
      LabelVisible = True
    end
  end
  object pnSelect: TJAMPanel
    Left = 0
    Top = 501
    Width = 792
    Height = 33
    Align = alBottom
    TabOrder = 3
    Visible = False
    object btnAceptar: TBitBtn
      Left = 295
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
      Kind = bkOK
    end
    object btnCancelar: TBitBtn
      Left = 421
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object mnuClientes: TPopupMenu
    Left = 201
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
  object mnuDirecciones: TPopupMenu
    OnPopup = mnuDireccionesPopup
    Left = 353
    Top = 441
    object mnuCopiaAPresupuesto: TMenuItem
      Caption = 'Copia la dirección al presupuesto'
      OnClick = mnuCopiaAPresupuestoClick
    end
    object mnuEtiquetaDireccion: TMenuItem
      Caption = 'Etiqueta para envío'
      object mnuEtiquetaDireccionConTelefono: TMenuItem
        Caption = 'Con teléfono'
        OnClick = mnuEtiquetaDireccionConTelefonoClick
      end
      object mnuEtiquetaDireccionSinTelefono: TMenuItem
        Caption = 'Sin teléfono'
        OnClick = mnuEtiquetaDireccionSinTelefonoClick
      end
    end
  end
end
