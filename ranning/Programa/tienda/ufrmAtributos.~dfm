inherited frmAtributos: TfrmAtributos
  Left = 314
  Top = 149
  Width = 622
  Height = 575
  ActiveControl = edBuscar
  Caption = 'Características'
  KeyPreview = True
  OldCreateOrder = True
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 18
    Width = 310
    Height = 300
    Align = alLeft
    TabOrder = 0
    object dbgProductosAtributos: TDBGrid
      Left = 1
      Top = 1
      Width = 308
      Height = 298
      Hint = 'Pulsa el botón derecho del ratón para más opciones...'
      Align = alClient
      DataSource = dmProductos.dsProductosAtributos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = mnuAtributo
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
          FieldName = 'ds_atributo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 271
          Visible = True
        end>
    end
  end
  object JAMPanel2: TJAMPanel
    Left = 310
    Top = 18
    Width = 304
    Height = 300
    Align = alClient
    TabOrder = 1
    object dbgAtributo: TDBGrid
      Left = 1
      Top = 19
      Width = 302
      Height = 280
      Hint = 
        'Haz doble click con el ratón para añadir los atributos seleccion' +
        'ados o pulsa el botón derecho para más opciones...'
      Align = alBottom
      DataSource = dmProductos.dsAtributo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentShowHint = False
      PopupMenu = mnuValor
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgAtributoDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ds_valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 268
          Visible = True
        end>
    end
    object edBuscar: TJAMLabelEdit
      Left = 39
      Top = 1
      Width = 262
      Height = 16
      AutoSize = False
      TabOrder = 1
      OnChange = edBuscarChange
      LabelCaption = 'Buscar'
      LabelVisible = True
    end
  end
  object JAMPanel3: TJAMPanel
    Left = 0
    Top = 354
    Width = 614
    Height = 187
    Align = alBottom
    TabOrder = 2
    object dbgProductosDetalle: TDBGrid
      Left = 1
      Top = 1
      Width = 612
      Height = 150
      Align = alClient
      DataSource = dmProductos.dsProductosDetalle
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
          FieldName = 'ds_valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object pnCombos: TJAMPanel
      Left = 1
      Top = 151
      Width = 612
      Height = 35
      Align = alBottom
      TabOrder = 1
      object dbCantidad: TJAMDBLabelEdit
        Left = 51
        Top = 7
        Width = 121
        Height = 21
        DataField = 'nm_cantidad'
        DataSource = dmProductos.dsProductosDetalle
        TabOrder = 0
        LabelCaption = 'Cantidad'
        LabelVisible = True
      end
      object dbcbUnidades: TJAMDBIdComboBox
        Left = 178
        Top = 7
        Width = 259
        Height = 21
        Style = csDropDownList
        DataField = 'ds_unidad'
        DataSource = dmProductos.dsProductosDetalle
        ItemHeight = 13
        TabOrder = 1
        ListDataSource = dmProductos.dsUnidades
        ListFieldId = 'id_unidad'
        ListFieldDs = 'ds_unidad'
        FieldId = 'id_unidad'
      end
      object btnGrabar: TBitBtn
        Left = 452
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Grabar'
        TabOrder = 2
        OnClick = btnGrabarClick
        Kind = bkOK
      end
      object btnCancelar: TBitBtn
        Left = 532
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = btnCancelarClick
        Kind = bkCancel
      end
    end
  end
  object JAMPanel4: TJAMPanel
    Left = 0
    Top = 318
    Width = 614
    Height = 36
    Align = alBottom
    TabOrder = 3
    object btnAdd: TButton
      Left = 8
      Top = 6
      Width = 113
      Height = 25
      Caption = 'Añade característica'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnDel: TButton
      Left = 494
      Top = 6
      Width = 113
      Height = 25
      Caption = 'Borra característica'
      TabOrder = 1
      OnClick = btnDelClick
    end
    object btnCopiaAtr: TButton
      Left = 127
      Top = 6
      Width = 127
      Height = 25
      Caption = 'Copiar atributos desde...'
      TabOrder = 2
      OnClick = btnCopiaAtrClick
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 614
    Height = 18
    DataSource = dmProductos.dsProductos
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alTop
    Hints.Strings = (
      'Primer producto'
      'Producto anterior'
      'Producto siguiente'
      'Último producto'
      'Nuevo'
      'Borrar'
      'Modificar'
      'Grabar'
      'Cancelar'
      'Refrescar')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = DBNavigator1Click
  end
  object mnuValor: TPopupMenu
    MenuAnimation = [maRightToLeft, maTopToBottom]
    OnPopup = mnuValorPopup
    Left = 414
    Top = 103
    object mnuValorNuevo: TMenuItem
      Caption = 'Nuevo valor para "#"'
      OnClick = mnuValorNuevoClick
    end
  end
  object mnuAtributo: TPopupMenu
    Left = 111
    Top = 118
    object mnuNuevo: TMenuItem
      Caption = 'Nueva característica'
      OnClick = mnuNuevoClick
    end
  end
end
