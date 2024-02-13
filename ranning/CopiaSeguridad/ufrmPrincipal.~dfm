object frmPrincipal: TfrmPrincipal
  Left = 240
  Top = 160
  Width = 587
  Height = 417
  Caption = 'Copia de seguridad'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 579
    Height = 304
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 10
      Top = 128
      Width = 96
      Height = 13
      Caption = 'Directorios a copiar:'
    end
    object Label1: TLabel
      Left = 10
      Top = 7
      Width = 101
      Height = 13
      Caption = 'Copias de seguridad:'
    end
    object lbPath: TListBox
      Left = 7
      Top = 143
      Width = 566
      Height = 155
      ItemHeight = 13
      TabOrder = 0
    end
    object lbCopias: TJAMListBox
      Left = 10
      Top = 22
      Width = 206
      Height = 97
      ItemHeight = 13
      MultiSelect = True
      PopupMenu = mnuCopias
      Sorted = True
      TabOrder = 1
      OnClick = lbCopiasClick
    end
    object edUltCopia: TJAMLabelEdit
      Left = 220
      Top = 67
      Width = 353
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'edUltCopia'
      LabelPosition = lpUpSide
      LabelCaption = 'Fecha de la última copia'
      LabelVisible = True
    end
    object edPathDestino: TJAMLabelEdit
      Left = 220
      Top = 22
      Width = 353
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'edPathDestino'
      LabelPosition = lpUpSide
      LabelCaption = 'Directorio de destino:'
      LabelVisible = True
    end
  end
  object pnProgreso: TJAMPanel
    Left = 0
    Top = 304
    Width = 579
    Height = 79
    Align = alClient
    TabOrder = 1
    Visible = False
    object lblCopia: TStaticText
      Left = 7
      Top = 7
      Width = 566
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'lblCopia'
      TabOrder = 0
    end
    object lblArchivo: TStaticText
      Left = 7
      Top = 28
      Width = 566
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'lblArchivo'
      TabOrder = 1
    end
    object pbCopia: TProgressBar
      Left = 7
      Top = 50
      Width = 566
      Height = 17
      Min = 0
      Max = 100
      Smooth = True
      TabOrder = 2
    end
  end
  object mnuCopias: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    OnPopup = mnuCopiasPopup
    Left = 107
    Top = 66
    object mnuEjecutar: TMenuItem
      Caption = 'Ejecutar las copias seleccionadas'
      OnClick = mnuEjecutarClick
    end
  end
end
