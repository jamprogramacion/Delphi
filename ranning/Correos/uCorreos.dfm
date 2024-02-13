object frmCorreos: TfrmCorreos
  Left = 354
  Top = 246
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cálculo de reembolso para correos'
  ClientHeight = 152
  ClientWidth = 343
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
  object Label2: TLabel
    Left = 37
    Top = 21
    Width = 125
    Height = 13
    Caption = 'Importe a cobrar al cliente:'
  end
  object Label3: TLabel
    Left = 60
    Top = 53
    Width = 102
    Height = 13
    Caption = 'Derechos de correos:'
  end
  object Label4: TLabel
    Left = 261
    Top = 53
    Width = 23
    Height = 13
    Caption = ' % = '
  end
  object Label1: TLabel
    Left = 87
    Top = 85
    Width = 75
    Height = 13
    Caption = 'Importe del giro:'
  end
  object Label5: TLabel
    Left = 206
    Top = 53
    Width = 12
    Height = 13
    Caption = ' + '
  end
  object nedImporteCliente: TJAMNumberEdit
    Left = 168
    Top = 17
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 0
    Text = '0'
  end
  object nedDerechosCorreos: TJAMNumberEdit
    Left = 221
    Top = 49
    Width = 37
    Height = 21
    MaxLength = 6
    TabOrder = 2
    Text = '0.7'
  end
  object nedImporteGiro: TJAMNumberEdit
    Left = 168
    Top = 81
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 3
    Text = '0'
  end
  object btnCalcular: TButton
    Left = 29
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Calcular'
    Default = True
    TabOrder = 4
    OnClick = btnCalcularClick
  end
  object btnBorrar: TButton
    Left = 238
    Top = 119
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Borrar'
    TabOrder = 5
    OnClick = btnBorrarClick
  end
  object nedFijoCorreos: TJAMNumberEdit
    Left = 168
    Top = 49
    Width = 37
    Height = 21
    MaxLength = 6
    TabOrder = 1
    Text = '1.34'
  end
  object nedTotalDerechos: TJAMNumberEdit
    Left = 289
    Top = 49
    Width = 37
    Height = 21
    MaxLength = 6
    TabOrder = 6
    Text = '0'
  end
end
