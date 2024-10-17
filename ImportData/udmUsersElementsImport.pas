unit udmUsersElementsImport;

interface

uses
  System.SysUtils, System.Classes, udmImportData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmUsersElementsImport = class(TDataModule)
    tblUsersElementsImport: TFDTable;
    tblUsersElementsImportusers_elements_import_id: TFDAutoIncField;
    tblUsersElementsImportusers_elements_import_username: TWideStringField;
    tblUsersElementsImportusers_elements_import_elements_id: TLongWordField;
    tblUsersElementsImportusers_elements_import_objects_stela_id: TLongWordField;
    tblUsersElementsImportusers_elements_import_objects_import_stela_id: TLongWordField;
    tblUsersElementsImportusers_elements_import_element_username: TWideStringField;
    tblUsersElementsImportusers_elements_import_desc: TWideStringField;
    tblUsersElementsImportusers_elements_import_url: TWideStringField;
    tblUsersElementsImportusers_elements_import_imported: TByteField;
    tblUsersElementsImportusers_elements_import_stamp: TDateTimeField;
    tblUsersElementsImportusers_elements_import_last_mod: TDateTimeField;
    dsUsersElementsImport: TDataSource;
    sqlUsersElementsImportObjects: TFDQuery;
    dsUsersElementsImportObjects: TDataSource;
    sqlUsersElementsImportObjectsusers_elements_import_element_username: TWideStringField;
    sqlUsersElementsImportObjectsusers_elements_import_elements_id: TLongWordField;
    sqlUsersElementsImportObjectsstela_path: TWideStringField;
    sqlUsersElementsImportObjectsstela_name: TWideStringField;
    sqlUsersElementsImportObjectsimport_stela_path: TWideStringField;
    sqlUsersElementsImportObjectsimport_stela_name: TWideStringField;
    sqlUsersElementsImportObjectsusers_elements_import_username: TWideStringField;
    sqlElements: TFDQuery;
    sqlElementselements_id: TLongWordField;
    sqlElementselement: TWideStringField;
    dsElements: TDataSource;
    tblUsersElementsImportelement_name: TStringField;
    sqlCopyUserElementsToImport: TFDQuery;
    sqlUserElementExists: TFDQuery;
    sqlUserElementExistsuser_element_id: TLargeintField;
    procedure dsUsersElementsImportStateChange(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure tblUsersElementsImportAfterPost(DataSet: TDataSet);
    procedure dsUsersElementsImportDataChange(Sender: TObject; Field: TField);
    procedure tblUsersElementsImportBeforeDelete(DataSet: TDataSet);
  private
    FCanEditImported: Boolean;
    FOnUsersElementsImportDataChange: TDataChangeEvent;

    function GetCanEditImported: Boolean;
    procedure SetCanEditImported(const Value: Boolean);
    function GetOnUsersElementsImportDataChange: TDataChangeEvent;
    procedure SetOnUsersElementsImportDataChange(
      const Value: TDataChangeEvent);
    function UserElementExists(const sUsername: String; nElementId: Int64; const sElementUsername: String): Boolean;
  public
    property evntOnUsersElementsImportDataChange: TDataChangeEvent
      read GetOnUsersElementsImportDataChange write SetOnUsersElementsImportDataChange;
    property CanEditImported: Boolean read GetCanEditImported write SetCanEditImported;

    function UserElementImported: TImportedState;
    function DownloadUserElements(nUserId: Int64): String;
    function AddImportedUserElement(nUserImportId: Integer): Integer;
    procedure AddImportedUsersElements(slUserElementImportIdList: TStrings);
  end;

var
  dmUsersElementsImport: TdmUsersElementsImport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Vcl.Dialogs, FireDAC.Phys.MySQLWrapper, Vcl.Controls;

function TdmUsersElementsImport.AddImportedUserElement(
  nUserImportId: Integer): Integer;

var
  bookUser: TBookmark;

begin
  bookUser := tblUsersElementsImport.GetBookmark;
  try
    tblUsersElementsImport.DisableControls;
    if tblUsersElementsImport.Locate('users_elements_import_id', nUserImportId, []) and (UserElementImported <> TImportedState.isImported) then begin
      Result := dmImportData.WhyuonApiAddImportedUserElement(nUserImportId);
    end else begin
      Result := -1;
    end;
  finally
    tblUsersElementsImport.GotoBookmark(bookUser);
    tblUsersElementsImport.EnableControls;
  end;
end;

procedure TdmUsersElementsImport.AddImportedUsersElements(
  slUserElementImportIdList: TStrings);

var
  sServerRes: String;

begin
  sServerRes := dmImportData.WhyuonApiAddImportedUsersElements(slUserElementImportIdList);
  if dmImportData.WhyuonApiError = '' then begin
    slUserElementImportIdList.CommaText := sServerRes;
  end else begin
    slUserElementImportIdList.Clear;
  end;
end;

procedure TdmUsersElementsImport.DataModuleCreate(Sender: TObject);
begin
  FCanEditImported := False;
  sqlElements.Open;
  tblUsersElementsImport.Open;
  sqlUsersElementsImportObjects.Open;
end;

function TdmUsersElementsImport.DownloadUserElements(nUserId: Int64): String;
begin
  sqlCopyUserElementsToImport.Prepare;
  sqlCopyUserElementsToImport.ParamByName('user_id').Value := nUserId;
  try
    sqlCopyUserElementsToImport.ExecSQL;
  except
    on E: EMySQLNativeException do begin
      Result := E.Message;
      Exit;
    end;
  end;

  Result := '';
end;

procedure TdmUsersElementsImport.dsUsersElementsImportDataChange(
  Sender: TObject; Field: TField);
begin
  if Assigned(FOnUsersElementsImportDataChange) then begin
    FOnUsersElementsImportDataChange(Sender, Field);
  end;
end;

procedure TdmUsersElementsImport.dsUsersElementsImportStateChange(
  Sender: TObject);
begin
  if (UserElementImported > TImportedState.isImportAll) and (tblUsersElementsImport.State = dsEdit) and (not FCanEditImported) then begin
    tblUsersElementsImport.Cancel;
    ShowMessage('No se puede modificar un elemento de usuario que ya ha sido importado');
  end;
end;

function TdmUsersElementsImport.GetCanEditImported: Boolean;
begin
  Result :=  FCanEditImported;
end;

function TdmUsersElementsImport.GetOnUsersElementsImportDataChange: TDataChangeEvent;
begin
  Result := FOnUsersElementsImportDataChange;
end;

procedure TdmUsersElementsImport.SetCanEditImported(const Value: Boolean);
begin
  FCanEditImported := Value;
end;

procedure TdmUsersElementsImport.SetOnUsersElementsImportDataChange(
  const Value: TDataChangeEvent);
begin
  FOnUsersElementsImportDataChange := Value;
end;

procedure TdmUsersElementsImport.tblUsersElementsImportAfterPost(
  DataSet: TDataSet);
begin
  sqlUsersElementsImportObjects.Close;
  sqlUsersElementsImportObjects.Open;
end;

procedure TdmUsersElementsImport.tblUsersElementsImportBeforeDelete(
  DataSet: TDataSet);

var
  sMsg: String;
  sUsername: String;
  sElementUsername: String;
  nElementId: Int64;

begin
  sUsername := DataSet.FieldByName('users_elements_import_username').AsString;
  sElementUsername := DataSet.FieldByName('users_elements_import_element_username').AsString;
  nElementId := DataSet.FieldByName('users_elements_import_elements_id').AsInteger;
  sMsg := '¿Seguro que quieres eliminar este elemento de usuario?' + #13#10;
  if UserElementExists(sUsername, nElementId, sElementUsername) then begin
    sMsg := sMsg + 'Una vez borrado se podría recuperar descargando de nuevo el elemento de usuario';
  end else begin
    sMsg := sMsg + 'La eliminación no se puede deshacer porque el elemento de usuario no ha sido importado';
  end;

  if MessageDlg(sMsg, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
    Abort;
  end;
end;

function TdmUsersElementsImport.UserElementExists(const sUsername: String;
  nElementId: Int64; const sElementUsername: String): Boolean;

var
  bExists: Boolean;

begin
  if sqlUserElementExists.Active then begin
    sqlUserElementExists.Close;
  end;

  sqlUserElementExists.ParamByName('username').Value := sUsername;
  sqlUserElementExists.ParamByName('element_id').Value := nElementId;
  sqlUserElementExists.ParamByName('element_username').Value := sElementUsername;
  sqlUserElementExists.Open;
  bExists := sqlUserElementExists.FieldByName('user_element_id').AsInteger > 0;
  sqlUserElementExists.Close;

  Result := bExists;
end;

function TdmUsersElementsImport.UserElementImported: TImportedState;
begin
  Result := TImportedState(tblUsersElementsImport.FieldByName('users_elements_import_imported').AsInteger);
end;

end.
