inherited frmSelColores: TfrmSelColores
  Left = 320
  Top = 152
  ActiveControl = lbColores
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selección de colores'
  ClientHeight = 498
  ClientWidth = 458
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TBitBtn
    Left = 148
    Top = 468
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 0
    OnClick = btnAceptarClick
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 235
    Top = 468
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
  object lbColores: TJAMIdListBox
    Left = 8
    Top = 27
    Width = 218
    Height = 435
    Hint = 'Haz doble click para añadir el color seleccionado...'
    ExtendedSelect = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnDblClick = lbColoresDblClick
    ListDataSource = dmProductos.dsColores
    ListFieldId = 'id_color'
    ListFieldDs = 'ds_color'
  end
  object lbSelColores: TListBox
    Left = 232
    Top = 27
    Width = 218
    Height = 328
    Hint = 'Haz doble click para borrar el color seleccionado...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    MultiSelect = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnDblClick = lbSelColoresDblClick
  end
  object lblColores: TStaticText
    Left = 8
    Top = 8
    Width = 218
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'Colores disponibles'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object StaticText1: TStaticText
    Left = 232
    Top = 8
    Width = 218
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'Colores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object btnBorra: TButton
    Left = 232
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Borra color'
    TabOrder = 6
    OnClick = btnBorraClick
  end
  object btnSube: TButton
    Left = 364
    Top = 360
    Width = 41
    Height = 25
    Caption = 'Sube'
    TabOrder = 7
    OnClick = btnSubeClick
  end
  object btnBaja: TButton
    Left = 409
    Top = 360
    Width = 41
    Height = 25
    Caption = 'Baja'
    TabOrder = 8
    OnClick = btnBajaClick
  end
end
