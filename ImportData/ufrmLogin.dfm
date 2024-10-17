object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  ActiveControl = edtLogin
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Acceso de usuario'
  ClientHeight = 144
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 28
    Top = 24
    Width = 43
    Height = 15
    Caption = 'Usuario:'
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 63
    Height = 15
    Caption = 'Contrase'#241'a:'
  end
  object edtLogin: TEdit
    Left = 77
    Top = 21
    Width = 300
    Height = 23
    TabOrder = 0
    TextHint = 'Username o email'
    OnChange = edtLoginEditsChange
  end
  object edtPassword: TEdit
    Left = 77
    Top = 56
    Width = 300
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
    TextHint = 'Contrase'#241'a'
    OnChange = edtLoginEditsChange
  end
  object btnOK: TButton
    Left = 198
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 302
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
end
