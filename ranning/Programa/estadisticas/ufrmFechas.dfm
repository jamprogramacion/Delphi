object frmFechas: TfrmFechas
  Left = 379
  Top = 306
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Fechas'
  ClientHeight = 170
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 38
    Top = 36
    Width = 75
    Height = 13
    Caption = 'Fecha de inicio:'
  end
  object Label2: TLabel
    Left = 38
    Top = 77
    Width = 62
    Height = 13
    Caption = 'Fecha de fin:'
  end
  object Label3: TLabel
    Left = 232
    Top = 2
    Width = 92
    Height = 13
    Caption = 'D�as de la semana:'
  end
  object edFechaIni: TJAMMaskEdit
    Left = 119
    Top = 32
    Width = 70
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object edFechaFin: TJAMMaskEdit
    Left = 119
    Top = 73
    Width = 70
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object BitBtn1: TBitBtn
    Left = 25
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object lbDiasSemana: TJAMListBox
    Left = 232
    Top = 19
    Width = 121
    Height = 146
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 4
  end
end
