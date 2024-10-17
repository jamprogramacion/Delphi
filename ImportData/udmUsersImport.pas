unit udmUsersImport;

interface

uses
  System.SysUtils, System.Classes, udmImportData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text, FireDAC.Comp.Client,
  System.DateUtils, FireDAC.Stan.ExprFuncs;

const
  MSG_USER_DATA_EXPIRED = 'No se puede modificar el usuario porque los datos no están actualizados';

type
  TdmUsersImport = class(TDataModule)
    bmvUsersImport: TFDBatchMove;
    bmvUsersImportReader: TFDBatchMoveTextReader;
    bmvUsersImportWriter: TFDBatchMoveDataSetWriter;
    tblUsersImport: TFDTable;
    tblUsersImportusers_import_id: TFDAutoIncField;
    tblUsersImportusers_import_username: TWideStringField;
    tblUsersImportusers_import_email: TWideStringField;
    tblUsersImportusers_import_url: TWideStringField;
    tblUsersImportusers_import_nickname: TWideStringField;
    tblUsersImportusers_import_status: TWideStringField;
    tblUsersImportusers_import_profile: TWideStringField;
    tblUsersImportusers_import_contact: TWideStringField;
    tblUsersImportusers_import_genders_id: TByteField;
    tblUsersImportusers_import_birth_date: TDateField;
    tblUsersImportusers_import_languages_id: TWordField;
    tblUsersImportusers_import_brand: TShortintField;
    tblUsersImportusers_import_objects_img_id: TLongWordField;
    tblUsersImportusers_import_objects_stela_id: TLongWordField;
    tblUsersImportusers_import_objects_public_stela_id: TLongWordField;
    tblUsersImportusers_import_objects_poster_id: TLongWordField;
    tblUsersImportusers_import_name: TWideStringField;
    tblUsersImportusers_import_surname: TWideStringField;
    tblUsersImportusers_import_company: TByteField;
    tblUsersImportusers_import_ident_documents_id: TWordField;
    tblUsersImportusers_import_ident_documents_number: TWideStringField;
    tblUsersImportusers_import_mobile_pref: TWideStringField;
    tblUsersImportusers_import_mobile_num: TWideStringField;
    tblUsersImportusers_import_countries_id: TWordField;
    tblUsersImportusers_import_regions_id: TWordField;
    tblUsersImportusers_import_provinces_id: TWordField;
    tblUsersImportusers_import_cities_id: TLongWordField;
    tblUsersImportusers_import_cities_name: TWideStringField;
    tblUsersImportusers_import_road_name: TWideStringField;
    tblUsersImportusers_import_number: TWideStringField;
    tblUsersImportusers_import_extended: TWideStringField;
    tblUsersImportusers_import_postal_code: TWideStringField;
    tblUsersImportusers_import_legal_id: TLongWordField;
    tblUsersImportusers_import_imported: TByteField;
    tblUsersImportusers_import_stamp: TDateTimeField;
    dsUsersImport: TDataSource;
    sqlUsernameUnique: TFDQuery;
    tblCountries: TFDTable;
    tblCountriescountries_id: TWordField;
    tblCountriescountries_name: TWideStringField;
    tblCountriescountries_code_alpha2: TWideStringField;
    tblCountriescountries_code_alpha3: TWideStringField;
    tblCountriescountries_code_onu: TWideStringField;
    tblCountriescountries_phone_prefix: TWideStringField;
    dsCountries: TDataSource;
    dsRegions: TDataSource;
    dsProvinces: TDataSource;
    dsCities: TDataSource;
    tblRegions: TFDTable;
    tblRegionsregions_id: TWordField;
    tblRegionsregions_countries_id: TWordField;
    tblRegionsregions_code: TWideStringField;
    tblRegionsregions_name: TWideStringField;
    tblProvinces: TFDTable;
    tblProvincesprovinces_id: TWordField;
    tblProvincesprovinces_countries_id: TWordField;
    tblProvincesprovinces_regions_id: TWordField;
    tblProvincesprovinces_code: TWideStringField;
    tblProvincesprovinces_name: TWideStringField;
    tblCities: TFDTable;
    tblCitiescities_id: TFDAutoIncField;
    tblCitiescities_countries_id: TWordField;
    tblCitiescities_regions_id: TWordField;
    tblCitiescities_provinces_id: TWordField;
    tblCitiescities_code: TWideStringField;
    tblCitiescities_name: TWideStringField;
    tblCitiescities_postal_code: TWideStringField;
    sqlPhonePrefix: TFDQuery;
    sqlPhonePrefixcountries_id: TWordField;
    sqlPhonePrefixcountries_name: TWideStringField;
    sqlPhonePrefixcountries_phone_prefix: TWideStringField;
    sqlPhonePrefixcountry_prefix: TWideStringField;
    dsPhonePrefix: TDataSource;
    sqlGenders: TFDQuery;
    dsGenders: TDataSource;
    sqlGendersgenders_id: TByteField;
    sqlGendersgender: TWideStringField;
    sqlIdentDocuments: TFDQuery;
    dsIdentDocuments: TDataSource;
    sqlIdentDocumentsident_documents_id: TWordField;
    sqlIdentDocumentsident_document: TWideStringField;
    sqlEmailUnique: TFDQuery;
    sqlDuplicateUserImport: TFDQuery;
    sqlUsersImportObjects: TFDQuery;
    dsUsersImportObjects: TDataSource;
    sqlUsersImportObjectsimg_path: TWideStringField;
    sqlUsersImportObjectsimg_name: TWideStringField;
    sqlUsersImportObjectsstela_path: TWideStringField;
    sqlUsersImportObjectsstela_name: TWideStringField;
    sqlUsersImportObjectsposter_path: TWideStringField;
    sqlUsersImportObjectsposter_name: TWideStringField;
    sqlUsersImportObjectspublic_stela_path: TWideStringField;
    sqlUsersImportObjectspublic_stela_name: TWideStringField;
    sqlUsersImportObjectsimport_img_path: TWideStringField;
    sqlUsersImportObjectsimport_img_name: TWideStringField;
    sqlUsersImportObjectsimport_stela_path: TWideStringField;
    sqlUsersImportObjectsimport_stela_name: TWideStringField;
    sqlUsersImportObjectsimport_poster_path: TWideStringField;
    sqlUsersImportObjectsimport_poster_name: TWideStringField;
    sqlUsersImportObjectsimport_public_stela_path: TWideStringField;
    sqlUsersImportObjectsimport_public_stela_name: TWideStringField;
    sqlUsersImportObjectsusers_import_username: TWideStringField;
    tblUsersImportusers_import_objects_import_img_id: TLongWordField;
    tblUsersImportusers_import_objects_import_stela_id: TLongWordField;
    tblUsersImportusers_import_objects_import_public_stela_id: TLongWordField;
    tblUsersImportusers_import_objects_import_poster_id: TLongWordField;
    tblUsersImportusers_import_last_mod: TDateTimeField;
    tblUsers: TFDTable;
    tblUsersusers_id: TFDAutoIncField;
    tblUsersusers_password_desc: TWideStringField;
    tblUsersusers_password_reset: TWideStringField;
    tblUsersusers_password_reset_expire: TDateTimeField;
    tblUsersusers_owncode: TLongWordField;
    tblUsersusers_username: TWideStringField;
    tblUsersusers_email: TWideStringField;
    tblUsersusers_nickname: TWideStringField;
    tblUsersusers_profile: TWideStringField;
    tblUsersusers_genders_id: TByteField;
    tblUsersusers_birth_date: TDateField;
    tblUsersusers_languages_id: TWordField;
    tblUsersusers_brand: TShortintField;
    tblUsersusers_public: TByteField;
    tblUsersusers_levels_id: TWordField;
    tblUsersusers_stamp: TDateTimeField;
    tblUsersusers_objects_img_id: TLongWordField;
    tblUsersusers_objects_stela_id: TLongWordField;
    tblUsersusers_objects_public_stela_id: TLongWordField;
    tblUsersusers_last_conn: TDateTimeField;
    tblUsersusers_last_mod: TDateTimeField;
    tblUsersusers_url: TWideStringField;
    tblUsersusers_status: TWideStringField;
    tblUsersusers_objects_poster_id: TLongWordField;
    tblUsersusers_contact: TWideStringField;
    tblUsersImportusers_import_delete: TByteField;
    sqlViewEditUsersImport: TFDQuery;
    sqlViewEditUsersImportusers_count: TLargeintField;
    sqlLevels: TFDQuery;
    dsLevels: TDataSource;
    sqlLevelslevels_id: TWordField;
    tblUsersImportusers_import_levels_id: TWordField;
    tblUsersImportusers_import_users_id: TLongWordField;
    sqlLevelslevels: TWideStringField;
    sqlCopyUserToImport: TFDQuery;
    sqlAddressIncomplete: TFDQuery;
    sqlAddressIncompleteaddress_id: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsUsersImportDataChange(Sender: TObject; Field: TField);
    procedure dsUsersImportStateChange(Sender: TObject);
    procedure tblUsersImportBeforePost(DataSet: TDataSet);
    procedure tblUsersImportusers_import_provinces_idChange(Sender: TField);
    procedure tblUsersImportusers_import_ident_documents_numberChange(
      Sender: TField);
    procedure tblUsersImportusers_import_cities_idChange(Sender: TField);
    procedure tblUsersImportAfterScroll(DataSet: TDataSet);
    procedure tblUsersImportusers_import_usernameChange(Sender: TField);
    procedure tblUsersImportusers_import_emailChange(Sender: TField);
    procedure tblUsersImportusers_import_genders_idChange(Sender: TField);
    procedure tblUsersImportusers_import_languages_idChange(Sender: TField);
    procedure tblUsersImportusers_import_ident_documents_idChange(
      Sender: TField);
    procedure tblUsersImportusers_import_countries_idChange(Sender: TField);
    procedure tblUsersImportusers_import_regions_idChange(Sender: TField);
    procedure tblUsersImportusers_import_legal_idChange(Sender: TField);
    procedure tblUsersImportusers_import_mobile_prefChange(Sender: TField);
    procedure bmvUsersImportProgress(ASender: TObject;
      APhase: TFDBatchMovePhase);
    procedure bmvUsersImportError(ASender: TObject; AException: Exception;
      var AAction: TFDErrorAction);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblUsersImportusers_import_nicknameChange(Sender: TField);
    procedure tblUsersImportusers_import_birth_dateChange(Sender: TField);
    procedure tblUsersImportAfterInsert(DataSet: TDataSet);
    procedure tblUsersImportAfterPost(DataSet: TDataSet);
    procedure tblUsersImportBeforeDelete(DataSet: TDataSet);
  private
    FImportErrors: TStringList;
    FCanEditImported: Boolean;
    FOnUsersImportDataChange: TDataChangeEvent;
    FUsersImportProgress: TFDBatchMoveProgressEvent;

    function IsValidIdentDocument(DataSet: TDataSet): Boolean;
    function GetCanEditImported: Boolean;
    procedure SetCanEditImported(const Value: Boolean);
    function GetOnUsersImportDataChange: TDataChangeEvent;
    function GetUsersImportProgress: TFDBatchMoveProgressEvent;
    procedure SetOnUsersImportDataChange(const Value: TDataChangeEvent);
    procedure SetUsersImportProgress(
      const Value: TFDBatchMoveProgressEvent);
  public
    property OnUsersImportDataChange: TDataChangeEvent
      read GetOnUsersImportDataChange write SetOnUsersImportDataChange;
    property UsersImportProgress: TFDBatchMoveProgressEvent
      read GetUsersImportProgress write SetUsersImportProgress;
    property ImportErrors: TStringList read FImportErrors;
    property CanEditImported: Boolean read GetCanEditImported write SetCanEditImported;

    function UserImported: TImportedState;
    procedure ImportUsersCSV;
    function AddImportedUser(nUserImportId: Integer): Integer;
    procedure AddImportedUsers(slUserImportIdList: TStrings);
    function DuplicateSelectedUser: Boolean;
    function DownloadUser(nUserId: Int64): String;
    function UserImportDateExpired: Boolean;
    function AddressIncomplete(const sUsername: String): Boolean; overload;
    function AddressIncomplete: Boolean; overload;
  end;

var
  dmUsersImport: TdmUsersImport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Vcl.Dialogs, System.TimeSpan, uIdentDocuments, System.StrUtils, Vcl.Controls,
  FireDAC.Phys.MySQLWrapper;

function TdmUsersImport.AddImportedUser(nUserImportId: Integer): Integer;

var
  bookUser: TBookmark;

begin
  bookUser := tblUsersImport.GetBookmark;
  try
    tblUsersImport.DisableControls;
    if tblUsersImport.Locate('users_import_id', nUserImportId, []) and (UserImported <> TImportedState.isImported) then begin
      Result := dmImportData.WhyuonApiAddImportedUser(nUserImportId);
    end else begin
      Result := -1;
    end;
  finally
    tblUsersImport.GotoBookmark(bookUser);
    tblUsersImport.EnableControls;
  end;
end;

procedure TdmUsersImport.AddImportedUsers(slUserImportIdList: TStrings);

var
  sServerRes: String;

begin
  sServerRes := dmImportData.WhyuonApiAddImportedUsers(slUserImportIdList);
  if dmImportData.WhyuonApiError = '' then begin
    slUserImportIdList.CommaText := sServerRes;
  end else begin
    slUserImportIdList.Clear;
  end;
end;

function TdmUsersImport.AddressIncomplete: Boolean;
begin
  Result := AddressIncomplete(tblUsersImport.FieldByName('users_username').AsString);
end;

function TdmUsersImport.AddressIncomplete(const sUsername: String): Boolean;

var
  bIncomplete: Boolean;

begin
  if sqlAddressIncomplete.Active then begin
    sqlAddressIncomplete.Close;
  end;

  sqlAddressIncomplete.ParamByName('users_import_username').Value := sUsername;
  sqlAddressIncomplete.Open;
  bIncomplete := sqlAddressIncomplete.FieldByName('address_id').AsInteger = 0;
  sqlAddressIncomplete.Close;

  Result := bIncomplete;
end;

procedure TdmUsersImport.bmvUsersImportError(ASender: TObject;
  AException: Exception; var AAction: TFDErrorAction);
begin
  AException.Message := Format('Línea %d: ', [bmvUsersImport.ReadCount + 1]) + AException.Message;
  FImportErrors.Add(AException.Message);
end;

procedure TdmUsersImport.bmvUsersImportProgress(ASender: TObject;
  APhase: TFDBatchMovePhase);
begin
  if Assigned(FUsersImportProgress) then begin
    FUsersImportProgress(ASender, APhase);
  end;
end;

procedure TdmUsersImport.DataModuleCreate(Sender: TObject);
begin
  FCanEditImported := False;
  tblUsersImport.Open;
  sqlGenders.Open;
  sqlUsernameUnique.Prepare;
  sqlEmailUnique.Prepare;
  tblCountries.Open;
  tblProvinces.Open;
  tblRegions.Open;
  tblCities.Open;
  sqlPhonePrefix.Open;
  sqlIdentDocuments.Open;
  sqlLevels.Open;
  FImportErrors := TStringList.Create;
  sqlUsersImportObjects.Open;
end;

procedure TdmUsersImport.DataModuleDestroy(Sender: TObject);
begin
  FImportErrors.Free;
end;

function TdmUsersImport.DownloadUser(nUserId: Int64): String;
begin
  sqlCopyUserToImport.Prepare;
  sqlCopyUserToImport.ParamByName('user_id').Value := nUserId;
  try
    sqlCopyUserToImport.ExecSQL;
  except
    on E: EMySQLNativeException do begin
      Result := E.Message;
      Exit;
    end;
  end;

  Result := '';
end;

procedure TdmUsersImport.dsUsersImportDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(FOnUsersImportDataChange) then begin
    FOnUsersImportDataChange(Sender, Field);
  end;
end;

procedure TdmUsersImport.dsUsersImportStateChange(Sender: TObject);
begin
  {
  if (UserImported > TImportedState.isImportAll) and (tblUsersImport.State = dsEdit) and (not FCanEditImported) then begin
    tblUsersImport.Cancel;
    ShowMessage('No se puede modificar un usuario que ya ha sido importado');
  end;
  }
  if UserImportDateExpired and (tblUsersImport.State = dsEdit) then begin
    tblUsersImport.Cancel;
    ShowMessage(MSG_USER_DATA_EXPIRED);
  end;
end;

function TdmUsersImport.DuplicateSelectedUser: Boolean;
begin
  try
    sqlDuplicateUserImport.ExecSQL;
    tblUsersImport.Refresh;
  except
    Result := False;
  end;

  Result := True;
end;

function TdmUsersImport.GetCanEditImported: Boolean;
begin
  Result := FCanEditImported;
end;

function TdmUsersImport.GetOnUsersImportDataChange: TDataChangeEvent;
begin
  Result := FOnUsersImportDataChange;
end;

function TdmUsersImport.GetUsersImportProgress: TFDBatchMoveProgressEvent;
begin
  Result := FUsersImportProgress;
end;

procedure TdmUsersImport.ImportUsersCSV;
begin
  try
    tblUsersImport.DisableControls;
    tblUsersImport.Close;
    bmvUsersImport.LogFileName := bmvUsersImportReader.ActualFileName + '.log';
    FImportErrors.Clear;
    bmvUsersImport.Execute;
  finally
    tblUsersImport.Open;
    tblUsersImport.EnableControls;
  end;
end;

function TdmUsersImport.IsValidIdentDocument(DataSet: TDataSet): Boolean;
begin
  if DataSet.FieldByName('users_import_ident_documents_id').IsNull then begin
    Result := DataSet.FieldByName('users_import_ident_documents_number').IsNull or
      (DataSet.FieldByName('users_import_ident_documents_number').AsString = '');
    Exit;
  end;

  case DataSet.FieldByName('users_import_ident_documents_id').AsInteger of
    1: Result := IsValidDNI(DataSet.FieldByName('users_import_ident_documents_number').AsString);
    2: Result := IsValidCIF(DataSet.FieldByName('users_import_ident_documents_number').AsString);
  else
    Result := True;
  end;
end;

procedure TdmUsersImport.SetCanEditImported(const Value: Boolean);
begin
  FCanEditImported := Value;
end;

procedure TdmUsersImport.SetOnUsersImportDataChange(
  const Value: TDataChangeEvent);
begin
  FOnUsersImportDataChange := Value;
end;

procedure TdmUsersImport.SetUsersImportProgress(
  const Value: TFDBatchMoveProgressEvent);
begin
  FUsersImportProgress := Value;
end;

procedure TdmUsersImport.tblUsersImportAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('users_import_languages_id').AsInteger := udmImportData.LANG_ID_SPANISH;
  DataSet.FieldByName('users_import_levels_id').AsInteger := udmImportData.LEVEL_ID_BASIC;
end;

procedure TdmUsersImport.tblUsersImportAfterPost(DataSet: TDataSet);
begin
  sqlUsersImportObjects.Close;
  sqlUsersImportObjects.Open;
end;

procedure TdmUsersImport.tblUsersImportAfterScroll(DataSet: TDataSet);
begin
  DataSet.FieldByName('users_import_cities_name').ReadOnly := not DataSet.FieldByName('users_import_cities_id').IsNull;
  DataSet.FieldByName('users_import_username').ReadOnly := not DataSet.FieldByName('users_import_users_id').IsNull;
  DataSet.FieldByName('users_import_email').ReadOnly := not DataSet.FieldByName('users_import_users_id').IsNull;

  if DataSet.State = dsInsert then begin
    Exit;
  end;

  dmImportData.tblUsersImport.Locate('users_import_id', DataSet.FieldByName('users_import_id').AsInteger, []);
end;

procedure TdmUsersImport.tblUsersImportBeforeDelete(DataSet: TDataSet);

var
  sMsg: String;

begin
  sMsg := '¿Seguro que quieres eliminar este usuario?' + #13#10;
  if dmImportData.Exists(DataSet.FieldByName('users_import_username'), 'users', 'users_username') then begin
    sMsg := sMsg + 'Una vez borrado se podría recuperar descargando de nuevo el usuario';
  end else begin
    sMsg := sMsg + 'La eliminación no se puede deshacer porque el usuario no ha sido importado';
  end;

  if MessageDlg(sMsg, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
    Abort;
  end;
end;

procedure TdmUsersImport.tblUsersImportBeforePost(DataSet: TDataSet);

var
  sMessage: String;
  bMobilePref: Boolean;
  bMobileNum: Boolean;

begin
  if (not DataSet.FieldByName('users_import_ident_documents_id').IsNull) and
      (DataSet.FieldByName('users_import_ident_documents_number').AsString = '') then begin
    DatabaseError('Se debe especificar un número de documento');
  end;

  bMobilePref := DataSet.FieldByName('users_import_mobile_pref').AsString <> '';
  bMobileNum := DataSet.FieldByName('users_import_mobile_num').AsString <> '';
  if (bMobilePref and (not bMobileNum)) or ((not bMobilePref) and bMobileNum) then begin
    sMessage := IfThen(not bMobilePref, 'Se debe especificar un prefijo telefónico',
      'Se debe especificar un número de teléfono');
    DatabaseError(sMessage);
  end;

  if TImportedState(tblUsersImport.FieldByName('users_import_imported').AsInteger) = TImportedState.isImported then begin
    tblUsersImport.FieldByName('users_import_imported').AsInteger := Ord(TImportedState.isImportAll);
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_birth_dateChange(
  Sender: TField);
begin
  if dmImportData.IsEmptyStr(Sender) then begin
    DatabaseError('Fecha de nacimiento debe tener un valor [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_cities_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'cities', 'cities_id') then begin
    DatabaseError('La ciudad no existe [' + Sender.AsString + ']');
  end;

  if not Sender.IsNull then begin
    Sender.DataSet.FieldByName('users_import_cities_name').ReadOnly := False;
    Sender.DataSet.FieldByName('users_import_cities_name').Clear;
  end;
  Sender.DataSet.FieldByName('users_import_cities_name').ReadOnly := not Sender.IsNull;
end;

procedure TdmUsersImport.tblUsersImportusers_import_countries_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'countries', 'countries_id') then begin
    DatabaseError('El país no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_emailChange(Sender: TField);
begin
  if dmImportData.IsEmptyStr(Sender) then begin
    DatabaseError('Email debe tener un valor [' + Sender.AsString + ']');
  end;

  if (Pos('@', Sender.AsString) * Pos('.', Sender.AsString)) = 0 then begin
    DatabaseError('Email no tiene un formato correcto [' + Sender.AsString + ']');
  end;

  sqlEmailUnique.Open;
  if sqlEmailUnique.RecordCount = 0 then begin
    Exit;
  end;

  sqlEmailUnique.Close;
  DatabaseError('Email ya está siendo usado por otro usuario [' + Sender.AsString + ']');
end;

procedure TdmUsersImport.tblUsersImportusers_import_genders_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'genders', 'genders_id') then begin
    DatabaseError('El género no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_ident_documents_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'ident_documents', 'ident_documents_id') then begin
    DatabaseError('El tipo de documento no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_ident_documents_numberChange(
  Sender: TField);

var
  sMessage: String;

begin
  if Sender.AsString = '' then begin
    Exit;
  end;

  if not IsValidIdentDocument(Sender.DataSet) then begin
    if Sender.DataSet.FieldByName('users_import_ident_documents_id').IsNull then begin
      sMessage := 'Se debe especificar un tipo de documento';
    end else begin
      case Sender.DataSet.FieldByName('users_import_ident_documents_id').AsInteger of
        1: sMessage := 'El DNI no es válido';
        2: sMessage := 'El NIF  no es válido';
      end;
    end;
    DatabaseError(sMessage + ' [' + Sender.AsString + ']');
  end;

  if Sender.AsString <> UpperCase(Sender.AsString) then begin
    Sender.AsString := UpperCase(Sender.AsString);
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_languages_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'languages', 'languages_id') then begin
    DatabaseError('El idioma no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_legal_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'legal', 'legal_id') then begin
    DatabaseError('El documento legal no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_mobile_prefChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'countries', 'countries_phone_prefix') then begin
    DatabaseError('El prefijo telefónico no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_nicknameChange(
  Sender: TField);
begin
  if dmImportData.IsEmptyStr(Sender) then begin
    DatabaseError('Nickname debe tener un valor [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_provinces_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'provinces', 'provinces_id') then begin
    DatabaseError('La provincia no existe [' + Sender.AsString + ']');
  end;

  dmImportData.SetRegion(Sender.DataSet.FieldByName('users_import_regions_id'), Sender.AsInteger);
end;

procedure TdmUsersImport.tblUsersImportusers_import_regions_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'regions', 'regions_id') then begin
    DatabaseError('La región no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmUsersImport.tblUsersImportusers_import_usernameChange(
  Sender: TField);
begin
  if dmImportData.IsEmptyStr(Sender) then begin
    DatabaseError('Username debe tener un valor [' + Sender.AsString + ']');
  end;

  sqlUsernameUnique.Open;
  if sqlUsernameUnique.RecordCount = 0 then begin
    Exit;
  end;

  sqlUsernameUnique.Close;
  DatabaseError('Username ya está siendo usado por otro usuario [' + Sender.AsString + ']');
end;

function TdmUsersImport.UserImportDateExpired: Boolean;
begin
  if sqlViewEditUsersImport.Active then begin
    sqlViewEditUsersImport.Close;
  end;
  sqlViewEditUsersImport.ParamByName('users_import_username').Value := tblUsersImport.FieldByName('users_import_username').Value;
  sqlViewEditUsersImport.ParamByName('users_import_email').Value := tblUsersImport.FieldByName('users_import_email').Value;
  sqlViewEditUsersImport.Open;

  Result := sqlViewEditUsersImport.FieldByName('users_count').AsInteger > 0;
end;

function TdmUsersImport.UserImported: TImportedState;
begin
  Result := TImportedState(tblUsersImport.FieldByName('users_import_imported').AsInteger);
end;

end.
