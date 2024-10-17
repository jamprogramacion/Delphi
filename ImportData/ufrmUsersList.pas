unit ufrmUsersList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, udmImportData;

type
  TfrmUsersList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgUsersList: TDBGrid;
    btnOK: TButton;
    Button2: TButton;
    edtFilter: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgUsersListDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
  private
    FUsername: String;
    FUserId: Int64;

    function GetUsername: String;
    procedure SetUsername(const Value: String);
    function GetUserId: Int64;
    procedure SetUserId(const Value: Int64);
  public
     property Username: String read GetUsername write SetUsername;
     property UserId: Int64 read GetUserId write SetUserId;
  end;

var
  frmUsersList: TfrmUsersList;

implementation

{$R *.dfm}

procedure TfrmUsersList.BitBtn2Click(Sender: TObject);
begin
  FUsername := '';
end;

procedure TfrmUsersList.btnOKClick(Sender: TObject);
begin
  SetUsername(dbgUsersList.DataSource.DataSet.FieldByName('users_username').AsString);
  SetUserId(dbgUsersList.DataSource.DataSet.FieldByName('users_id').AsLargeInt);
end;

procedure TfrmUsersList.dbgUsersListDblClick(Sender: TObject);
begin
  SetUsername(dbgUsersList.DataSource.DataSet.FieldByName('users_username').AsString);
  SetUserId(dbgUsersList.DataSource.DataSet.FieldByName('users_id').AsLargeInt);
  ModalResult := mrOk;
end;

procedure TfrmUsersList.edtFilterChange(Sender: TObject);
begin
  dmImportData.sqlUsersList.Close;
  if edtFilter.Text <> '' then begin
    dmImportData.sqlUsersList.ParamByName('filter').AsString := '%' + edtFilter.Text + '%';
  end else begin
    dmImportData.sqlUsersList.ParamByName('filter').AsString := edtFilter.Text + '%';
  end;
  dmImportData.sqlUsersList.Open;
end;

procedure TfrmUsersList.FormActivate(Sender: TObject);
begin
  FUsername := '';
  FUserId := -1;
  dmImportData.sqlUsersList.Prepare;
  dmImportData.sqlUsersList.ParamByName('filter').AsString := '%';
  dmImportData.sqlUsersList.Open;
end;

procedure TfrmUsersList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmImportData.sqlUsersList.Close;
end;

function TfrmUsersList.GetUserId: Int64;
begin
  Result := FUserId;
end;

function TfrmUsersList.GetUsername: String;
begin
  Result := FUsername;
end;

procedure TfrmUsersList.SetUserId(const Value: Int64);
begin
  FUserId := Value;
end;

procedure TfrmUsersList.SetUsername(const Value: String);
begin
  FUsername := Value;
end;

end.
