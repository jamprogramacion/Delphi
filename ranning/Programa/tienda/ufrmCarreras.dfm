inherited frmCarreras: TfrmCarreras
  Left = 238
  Top = 177
  Width = 764
  Height = 481
  Caption = 'Carreras'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 180
    Align = alClient
    TabOrder = 0
    object dbgCarreras: TDBGrid
      Left = 1
      Top = 1
      Width = 754
      Height = 178
      Align = alClient
      DataSource = dmCarreras.dsCarreras
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
          FieldName = 'f_fecha'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nm_hora'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_carrera'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 289
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_provincia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_municipio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_distancia'
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
          FieldName = 'nm_precio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ds_pagina_web'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = True
        end>
    end
  end
  object pnCombos: TJAMPanel
    Left = 0
    Top = 214
    Width = 756
    Height = 233
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 131
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btnProvinciaMunicipio: TSpeedButton
      Left = 357
      Top = 59
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
    object dbeFFecha: TJAMDBLabelEdit
      Left = 63
      Top = 7
      Width = 121
      Height = 21
      DataField = 'f_fecha'
      DataSource = dmCarreras.dsCarreras
      TabOrder = 0
      OnChange = dbeFFechaChange
      OnExit = dbeFFechaExit
      LabelCaption = 'Fecha'
      LabelVisible = True
    end
    object JAMDBLabelEdit2: TJAMDBLabelEdit
      Left = 235
      Top = 7
      Width = 121
      Height = 21
      DataField = 'nm_hora'
      DataSource = dmCarreras.dsCarreras
      TabOrder = 1
      LabelCaption = 'Hora'
      LabelVisible = True
    end
    object JAMDBLabelEdit3: TJAMDBLabelEdit
      Left = 63
      Top = 33
      Width = 683
      Height = 21
      DataField = 'ds_carrera'
      DataSource = dmCarreras.dsCarreras
      TabOrder = 4
      LabelCaption = 'Carrera'
      LabelVisible = True
    end
    object JAMDBLabelEdit4: TJAMDBLabelEdit
      Left = 435
      Top = 7
      Width = 121
      Height = 21
      DataField = 'ds_distancia'
      DataSource = dmCarreras.dsCarreras
      TabOrder = 2
      LabelCaption = 'Distancia'
      LabelVisible = True
    end
    object JAMDBLabelEdit5: TJAMDBLabelEdit
      Left = 63
      Top = 85
      Width = 683
      Height = 21
      DataField = 'ds_pagina_web'
      DataSource = dmCarreras.dsCarreras
      TabOrder = 7
      LabelCaption = 'Página web'
      LabelVisible = True
    end
    object JAMDBLabelEdit6: TJAMDBLabelEdit
      Left = 625
      Top = 7
      Width = 121
      Height = 21
      DataField = 'nm_precio'
      DataSource = dmCarreras.dsCarreras
      TabOrder = 3
      LabelCaption = 'Precio'
      LabelVisible = True
    end
    object JAMDBMemo1: TJAMDBMemo
      Left = 12
      Top = 148
      Width = 734
      Height = 76
      DataField = 'observaciones'
      DataSource = dmCarreras.dsCarreras
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object JAMDBCheckBox1: TJAMDBCheckBox
      Left = 63
      Top = 109
      Width = 125
      Height = 17
      Caption = 'Tenemos incripciones'
      DataField = 'it_tenemos_inscripcion'
      DataSource = dmCarreras.dsCarreras
      TabOrder = 8
      ValueChecked = 'X'
      ValueUnchecked = '-'
    end
    object dbeProvincia: TJAMDBLabelEdit
      Left = 63
      Top = 59
      Width = 293
      Height = 21
      Color = clBtnFace
      DataField = 'ds_provincia'
      DataSource = dmCarreras.dsCarreras
      ReadOnly = True
      TabOrder = 5
      OnEnter = dbeProvinciaEnter
      LabelCaption = 'Provincia'
      LabelVisible = True
    end
    object dbeMunicipio: TJAMDBLabelEdit
      Left = 435
      Top = 59
      Width = 309
      Height = 21
      Color = clBtnFace
      DataField = 'ds_municipio'
      DataSource = dmCarreras.dsCarreras
      ReadOnly = True
      TabOrder = 6
      OnEnter = dbeMunicipioEnter
      LabelCaption = 'Municipio'
      LabelVisible = True
    end
    object dtFFecha: TDateTimePicker
      Left = 63
      Top = 29
      Width = 142
      Height = 21
      CalAlignment = dtaLeft
      Date = 38642.8083980556
      Time = 38642.8083980556
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 10
      OnCloseUp = dtFFechaCloseUp
    end
  end
  object JAMPanel3: TJAMPanel
    Left = 0
    Top = 180
    Width = 756
    Height = 34
    Align = alBottom
    TabOrder = 2
    object dbnCarreras: TDBNavigator
      Left = 1
      Top = 1
      Width = 754
      Height = 32
      DataSource = dmCarreras.dsCarreras
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
      OnClick = dbnCarrerasClick
    end
  end
end
