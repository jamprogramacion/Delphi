inherited frmExplorer: TfrmExplorer
  Left = 236
  Top = 168
  Width = 737
  Height = 511
  Caption = 'Explorer'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 436
    Align = alClient
    TabOrder = 0
    object wbIExplorer: TWebBrowser
      Left = 1
      Top = 1
      Width = 727
      Height = 434
      TabStop = False
      Align = alClient
      TabOrder = 0
      OnBeforeNavigate2 = wbExplorer_BeforeNavigate2
      OnNavigateComplete2 = wbExplorer_NavigateComplete2
      ControlData = {
        4C000000234B0000DB2C00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126200000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object pnStatus: TPanel
      Left = 1
      Top = 1
      Width = 727
      Height = 434
      Align = alClient
      Caption = 'Cargando presupuesto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnPdf: TJAMPanel
    Left = 0
    Top = 436
    Width = 729
    Height = 41
    Align = alBottom
    TabOrder = 1
    Visible = False
    object btnImprimir: TButton
      Left = 327
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pasar a PDF'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  object wbMozilla: TMozillaBrowser
    Left = 0
    Top = 0
    Width = 729
    Height = 436
    Align = alClient
    TabOrder = 2
    OnBeforeNavigate2 = wbExplorer_BeforeNavigate2
    OnNavigateComplete2 = wbExplorer_NavigateComplete2
    ControlData = {00030000584B0000102D0000}
  end
  object tmStatus: TTimer
    Interval = 500
    OnTimer = tmStatusTimer
    Left = 305
    Top = 83
  end
end
