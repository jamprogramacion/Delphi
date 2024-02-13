inherited frmTallas: TfrmTallas
  Left = 449
  Top = 230
  ActiveControl = lbTallas
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selección de tallas'
  ClientHeight = 302
  ClientWidth = 217
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TBitBtn
    Left = 26
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 115
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
  object lbTallas: TJAMIdListBox
    Left = 15
    Top = 32
    Width = 187
    Height = 226
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    MultiSelect = True
    ParentFont = False
    TabOrder = 0
    ListDataSource = dmProductos.dsTallas
    ListFieldId = 'id_talla'
    ListFieldDs = 'ds_talla'
  end
  object lblTalla: TStaticText
    Left = 15
    Top = 11
    Width = 187
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'lblTalla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end
