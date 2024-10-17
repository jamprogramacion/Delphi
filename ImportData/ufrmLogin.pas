unit ufrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmImportData, Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    edtPassword: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure edtLoginEditsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    class function ShowLogin: TModalResult;
  end;

implementation

{$R *.dfm}

uses
  System.UITypes;

{ TfrmLogin }

procedure TfrmLogin.btnOKClick(Sender: TObject);

var
  crAntCursor: TCursor;

begin
  crAntCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    dmImportData.WhyuonApiLogin(Trim(edtLogin.Text), Trim(edtPassword.Text));
  finally
    Screen.Cursor := crAntCursor;
  end;
end;

procedure TfrmLogin.edtLoginEditsChange(Sender: TObject);
begin
  btnOK.Enabled := (Trim(edtLogin.Text) <> '') and (Trim(edtPassword.Text) <> '');
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  edtLogin.SetFocus;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  btnCancel.SetFocus;
end;

class function TfrmLogin.ShowLogin: TModalResult;

var
  frmLogin: TfrmLogin;

begin
  frmLogin := TfrmLogin.Create(nil);
  try
    Result := frmLogin.ShowModal;
  finally
    frmLogin.Free;
  end;
end;

end.
