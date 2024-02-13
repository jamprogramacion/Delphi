inherited frmDirecciones: TfrmDirecciones
  Left = 210
  Top = 215
  Width = 778
  Height = 173
  ActiveControl = JAMPanel3
  Caption = 'Direcciones'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel3: TJAMPanel
    Left = 0
    Top = 112
    Width = 770
    Height = 27
    Align = alBottom
    TabOrder = 0
    object dbnDirecciones: TDBNavigator
      Left = 1
      Top = 1
      Width = 768
      Height = 25
      DataSource = dmDirecciones.dsDirecciones
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
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
      BeforeAction = dbnDireccionesBeforeAction
    end
  end
  object pnCombos: TJAMPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 112
    Align = alClient
    TabOrder = 1
    object btnProvinciaMunicipio: TSpeedButton
      Left = 346
      Top = 7
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
      OnClick = btnProvinciaMunicipioClick
    end
    object btnTipoVia: TSpeedButton
      Left = 186
      Top = 33
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
      OnClick = btnTipoViaClick
    end
    object dbeProvincia: TJAMDBLabelEdit
      Left = 52
      Top = 7
      Width = 293
      Height = 21
      Color = clBtnFace
      DataField = 'ds_provincia'
      DataSource = dmDirecciones.dsDirecciones
      ReadOnly = True
      TabOrder = 0
      OnEnter = dbeProvinciaEnter
      LabelCaption = 'Provincia'
      LabelVisible = True
    end
    object dbeMunicipio: TJAMDBLabelEdit
      Left = 449
      Top = 7
      Width = 309
      Height = 21
      Color = clBtnFace
      DataField = 'municipio'
      DataSource = dmDirecciones.dsDirecciones
      ReadOnly = True
      TabOrder = 1
      OnEnter = dbeMunicipioEnter
      LabelCaption = 'Municipio'
      LabelVisible = True
    end
    object dbeTipoVia: TJAMDBLabelEdit
      Left = 52
      Top = 33
      Width = 133
      Height = 21
      Color = clBtnFace
      DataField = 'ds_tipo_via'
      DataSource = dmDirecciones.dsDirecciones
      ReadOnly = True
      TabOrder = 2
      OnEnter = dbeTipoViaEnter
      LabelCaption = 'Tipo vía'
      LabelVisible = True
    end
    object JAMDBLabelEdit1: TJAMDBLabelEdit
      Left = 249
      Top = 33
      Width = 509
      Height = 21
      DataField = 'ds_nombre_via'
      DataSource = dmDirecciones.dsDirecciones
      TabOrder = 3
      LabelCaption = 'Vía'
      LabelVisible = True
    end
    object JAMDBLabelEdit2: TJAMDBLabelEdit
      Left = 52
      Top = 59
      Width = 121
      Height = 21
      DataField = 'ds_numero'
      DataSource = dmDirecciones.dsDirecciones
      TabOrder = 4
      LabelCaption = 'Número'
      LabelVisible = True
    end
    object JAMDBLabelEdit3: TJAMDBLabelEdit
      Left = 249
      Top = 59
      Width = 121
      Height = 21
      DataField = 'ds_cp'
      DataSource = dmDirecciones.dsDirecciones
      TabOrder = 5
      LabelCaption = 'CP'
      LabelVisible = True
    end
    object JAMDBLabelEdit4: TJAMDBLabelEdit
      Left = 81
      Top = 85
      Width = 677
      Height = 21
      DataField = 'ds_resto_direccion'
      DataSource = dmDirecciones.dsDirecciones
      TabOrder = 7
      LabelCaption = 'Resto dirección'
      LabelVisible = True
    end
    object JAMDBLabelEdit5: TJAMDBLabelEdit
      Left = 637
      Top = 59
      Width = 121
      Height = 21
      DataField = 'ds_cp_extranjero'
      DataSource = dmDirecciones.dsDirecciones
      TabOrder = 6
      LabelCaption = 'CP extranjero'
      LabelVisible = True
    end
  end
end
