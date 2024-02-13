inherited frmEtiquetas: TfrmEtiquetas
  Left = 348
  Top = 146
  Width = 483
  Height = 570
  Caption = 'Etiquetas'
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 455
    Align = alClient
    TabOrder = 0
    object meEtiquetas: TJAMMemo
      Left = 1
      Top = 1
      Width = 473
      Height = 453
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      OnChange = meEtiquetasChange
    end
  end
  object pnCombos: TJAMPanel
    Left = 0
    Top = 455
    Width = 475
    Height = 81
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 197
      Top = 50
      Width = 89
      Height = 13
      Caption = 'Descuento mínimo'
    end
    object btnGrabar: TButton
      Left = 6
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Grabar'
      TabOrder = 0
      OnClick = btnGrabarClick
    end
    object btnCancelar: TButton
      Left = 92
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnImprimir: TButton
      Left = 371
      Top = 44
      Width = 97
      Height = 25
      Caption = 'Imprimir etiquetas'
      TabOrder = 2
      OnClick = btnImprimirClick
    end
    object btnActualizar: TButton
      Left = 178
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 3
      OnClick = btnActualizarClick
    end
    object cbDescuento: TJAMComboBox
      Left = 290
      Top = 46
      Width = 74
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
    object btnLimpiar: TButton
      Left = 393
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 5
      OnClick = btnLimpiarClick
    end
  end
end
