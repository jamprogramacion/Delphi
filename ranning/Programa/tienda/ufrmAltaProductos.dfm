inherited frmAltaProductos: TfrmAltaProductos
  Left = 223
  Top = 210
  Width = 759
  Height = 395
  ActiveControl = dbleCdProducto
  Caption = 'Alta y modificación de productos'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 20
    Width = 751
    Height = 207
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 103
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object dbleCdProducto: TJAMDBLabelEdit
      Left = 44
      Top = 10
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'cd_producto'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 0
      LabelCaption = 'Código'
      LabelVisible = True
    end
    object JAMDBLabelEdit2: TJAMDBLabelEdit
      Left = 226
      Top = 10
      Width = 515
      Height = 21
      DataField = 'ds_producto'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 1
      LabelCaption = 'Producto'
      LabelVisible = True
    end
    object JAMDBLabelEdit3: TJAMDBLabelEdit
      Left = 80
      Top = 38
      Width = 121
      Height = 21
      DataField = 'f_entrada'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 2
      LabelCaption = 'Fecha entrada'
      LabelVisible = True
    end
    object JAMDBLabelEdit4: TJAMDBLabelEdit
      Left = 295
      Top = 38
      Width = 378
      Height = 21
      DataField = 'cd_barras'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 3
      LabelCaption = 'Código de barras'
      LabelVisible = True
    end
    object JAMDBCheckBox1: TJAMDBCheckBox
      Left = 690
      Top = 41
      Width = 51
      Height = 17
      Caption = 'Activo'
      DataField = 'it_activo'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 4
      ValueChecked = 'X'
      ValueUnchecked = '-'
    end
    object JAMDBMemo1: TJAMDBMemo
      Left = 8
      Top = 119
      Width = 732
      Height = 81
      DataField = 'observaciones'
      DataSource = dmProductos.dsAltaProductos
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object JAMDBLabelEdit1: TJAMDBLabelEdit
      Left = 34
      Top = 69
      Width = 85
      Height = 21
      DataField = 'nm_peso'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 5
      LabelCaption = 'Peso'
      LabelVisible = True
    end
    object JAMDBCheckBox2: TJAMDBCheckBox
      Left = 676
      Top = 71
      Width = 65
      Height = 17
      Caption = 'Novedad'
      DataField = 'it_novedad'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 8
      ValueChecked = 'X'
      ValueUnchecked = '-'
    end
    object dbeFActualizacion: TJAMDBLabelEdit
      Left = 256
      Top = 69
      Width = 149
      Height = 21
      Color = clBtnFace
      DataField = 'f_actualizacion'
      DataSource = dmProductos.dsAltaProductos
      ReadOnly = True
      TabOrder = 6
      LabelCaption = 'Fecha actualización stock'
      LabelVisible = True
    end
    object Button1: TButton
      Left = 406
      Top = 69
      Width = 78
      Height = 21
      Caption = 'Fecha de hoy'
      TabOrder = 7
      OnClick = Button1Click
    end
  end
  object JAMPanel3: TJAMPanel
    Left = 0
    Top = 327
    Width = 751
    Height = 34
    Align = alBottom
    TabOrder = 2
    object dbnAltaProductos: TDBNavigator
      Left = 1
      Top = 1
      Width = 749
      Height = 32
      DataSource = dmProductos.dsAltaProductos
      VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel]
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
      BeforeAction = dbnAltaProductosBeforeAction
      OnClick = dbnAltaProductosClick
    end
  end
  object pnCombos: TJAMPanel
    Left = 0
    Top = 227
    Width = 751
    Height = 100
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 9
      Top = 15
      Width = 30
      Height = 13
      Caption = 'Marca'
    end
    object Label4: TLabel
      Left = 384
      Top = 45
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label5: TLabel
      Left = 9
      Top = 75
      Width = 38
      Height = 13
      Caption = 'Deporte'
    end
    object Label6: TLabel
      Left = 9
      Top = 45
      Width = 102
      Height = 13
      Caption = 'Tipo de complemento'
    end
    object Label7: TLabel
      Left = 384
      Top = 15
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object dbcbMarca: TJAMDBIdComboBox
      Left = 44
      Top = 13
      Width = 333
      Height = 21
      Style = csDropDownList
      DataField = 'ds_marca'
      DataSource = dmProductos.dsAltaProductos
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      ListDataSource = dmProductos.dsMarcas
      ListFieldId = 'id_marca'
      ListFieldDs = 'ds_marca'
      FieldId = 'id_marca'
    end
    object dbcbTipoComplemento: TJAMDBIdComboBox
      Left = 116
      Top = 41
      Width = 261
      Height = 21
      Style = csDropDownList
      DataField = 'ds_tipo_complemento'
      DataSource = dmProductos.dsAltaProductos
      ItemHeight = 13
      Sorted = True
      TabOrder = 2
      ListDataSource = dmProductos.dsTiposComplemento
      ListFieldId = 'id_tipo_complemento'
      ListFieldDs = 'ds_tipo_complemento'
      FieldId = 'id_tipo_complemento'
    end
    object dbcbTipoDeporte: TJAMDBIdComboBox
      Left = 51
      Top = 71
      Width = 324
      Height = 21
      Style = csDropDownList
      DataField = 'ds_tipo_deporte'
      DataSource = dmProductos.dsAltaProductos
      ItemHeight = 13
      Sorted = True
      TabOrder = 4
      ListDataSource = dmProductos.dsTiposDeporte
      ListFieldId = 'id_tipo_deporte'
      ListFieldDs = 'ds_tipo_deporte'
      FieldId = 'id_tipo_deporte'
    end
    object dbcbTipoProducto: TJAMDBIdComboBox
      Left = 416
      Top = 11
      Width = 324
      Height = 21
      Style = csDropDownList
      DataField = 'ds_tipo_producto'
      DataSource = dmProductos.dsAltaProductos
      ItemHeight = 13
      Sorted = True
      TabOrder = 1
      ListDataSource = dmProductos.dsTiposProducto
      ListFieldId = 'id_tipo_producto'
      ListFieldDs = 'ds_tipo_producto'
      FieldId = 'id_tipo_producto'
    end
    object dbcbTipoSexo: TJAMDBIdComboBox
      Left = 413
      Top = 41
      Width = 326
      Height = 21
      Style = csDropDownList
      DataField = 'ds_tipo_sexo'
      DataSource = dmProductos.dsAltaProductos
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
      ListDataSource = dmProductos.dsTiposSexo
      ListFieldId = 'id_tipo_sexo'
      ListFieldDs = 'ds_tipo_sexo'
      FieldId = 'id_tipo_sexo'
    end
    object JAMDBLabelEdit5: TJAMDBLabelEdit
      Left = 665
      Top = 68
      Width = 74
      Height = 21
      DataField = 'nm_mult_puntos'
      DataSource = dmProductos.dsAltaProductos
      TabOrder = 5
      LabelCaption = 'Multiplicador de puntos'
      LabelVisible = True
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 0
    Top = 0
    Width = 751
    Height = 20
    Align = alTop
    TabOrder = 3
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 749
      Height = 18
      DataSource = dmProductos.dsProductos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alClient
      Flat = True
      Hints.Strings = (
        'Primer producto'
        'Producto anterior'
        'Producto siguiente'
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
      TabOrder = 0
    end
  end
end
