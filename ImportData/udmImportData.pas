unit udmImportData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text, REST.Types, REST.Client,
  REST.Authenticator.Simple, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Response.Adapter, REST.Authenticator.Basic, Vcl.DBGrids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

const
  LANG_ID_SPANISH = 43;
  LEVEL_ID_BASIC = 2;

type
  TImportedState = (isImportAll = 0, isImported = 1, isImportImages = 2);
  TImageType = (itImage, itStela, itPublicStela, itPoster, itEventPoster, itEventStela, itUserElementStela,
    itElementImage, itElementStela, itElementPoster, itElementIcon);
  TUserImageType = itImage..itPoster;
  TEventImageType = itEventPoster..itEventStela;
  TUserElementImageType = itUserElementStela..itUserElementStela;
  TUserOwnerImageType = itImage..itUserElementStela;
  TElementImageType = itElementImage..itElementIcon;
  TUploadFileError = (ufeOK, ufeObjectsExistsBBDD, ufeFileExists, ufeFTPError);
  TUploadedFile = record
    sSHA256: String;
    sPath: TFileName;
    nObjectId: Int64;
    Error: TUploadFileError;
  end;

  TWhyuonApiError = record
    Code: Integer;
    Error: String;
    class operator Initialize(out Dest: TWhyuonApiError);
    procedure SetError(nCode: Integer; const sError: String);
    function ToString: String;
  end;

const
  IMG_TYPE_NAMES: Array[TImageType] of String = ('image', 'stela', 'public_stela', 'poster',
    'event_poster', 'event_stela', 'user_element_stela', 'image', 'stela', 'poster', 'icon');
  IMG_TYPE_DISPLAY_NAMES: Array[TImageType] of String = ('Imagen', 'Estela', 'Estela pública', 'Cartel',
    'Cartel', 'Estela', 'Estela', 'Imagen', 'Estela', 'Cartel', 'Icono');
  IMG_CATEGORIES_1: Array[TImageType] of String = ('OBJECTS_CATEGORIES_USER',
    'OBJECTS_CATEGORIES_USER', 'OBJECTS_CATEGORIES_USER', 'OBJECTS_CATEGORIES_USER',
    'OBJECTS_CATEGORIES_EVENT', 'OBJECTS_CATEGORIES_EVENT', 'OBJECTS_CATEGORIES_ELEMENT',
    'OBJECTS_CATEGORIES_ELEMENT', 'OBJECTS_CATEGORIES_ELEMENT', 'OBJECTS_CATEGORIES_ELEMENT',
    'OBJECTS_CATEGORIES_ELEMENT');
  IMG_CATEGORIES_2: Array[TImageType] of String = ('OBJECTS_CATEGORIES_IMG',
    'OBJECTS_CATEGORIES_STELA', 'OBJECTS_CATEGORIES_STELA', 'OBJECTS_CATEGORIES_POSTER',
    'OBJECTS_CATEGORIES_POSTER', 'OBJECTS_CATEGORIES_STELA', 'OBJECTS_CATEGORIES_STELA',
    'OBJECTS_CATEGORIES_IMG', 'OBJECTS_CATEGORIES_STELA', 'OBJECTS_CATEGORIES_POSTER',
    'OBJECTS_CATEGORIES_ICON');

type
  TdmImportData = class(TDataModule)
    lnkMariaDB: TFDPhysMySQLDriverLink;
    connWhyuon: TFDConnection;
    tblLanguages: TFDTable;
    tblLanguageslanguages_id: TWordField;
    tblLanguageslanguages_code: TWideStringField;
    tblLanguageslanguages_name: TWideStringField;
    tblLanguageslanguages_active: TShortintField;
    tblUsersObjects: TFDTable;
    tblUsersObjectsusers_objects_id: TFDAutoIncField;
    tblUsersObjectsusers_objects_users_id: TLongWordField;
    tblUsersObjectsusers_objects_objects_id: TLongWordField;
    tblUsersObjectsusers_objects_name: TWideStringField;
    tblUsersObjectsusers_objects_long_name: TWideStringField;
    tblUsersObjectsusers_objects_desc: TWideStringField;
    tblUsersObjectsusers_objects_last_mod: TDateTimeField;
    dsLanguages: TDataSource;
    sqlRegionOfProvince: TFDQuery;
    sqlRegionOfProvinceprovinces_regions_id: TWordField;
    rcliWhyuonApi: TRESTClient;
    reqWhyuonApiAddImportedUser: TRESTRequest;
    respWhyuonApiLogin: TRESTResponse;
    reqWhyuonApiLogin: TRESTRequest;
    respWhyuonApiAddImportedUser: TRESTResponse;
    reqWhyuonApiAddImportedEvent: TRESTRequest;
    respWhyuonApiAddImportedEvent: TRESTResponse;
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
    tblEventsImport: TFDTable;
    tblEventsImportevents_import_id: TFDAutoIncField;
    tblEventsImportevents_import_username: TWideStringField;
    tblEventsImportevents_import_elements_id: TLongWordField;
    tblEventsImportevents_import_users_elements_id: TLongWordField;
    tblEventsImportevents_import_content_formats_id: TWordField;
    tblEventsImportevents_import_categories_id: TWideStringField;
    tblEventsImportevents_import_title: TWideStringField;
    tblEventsImportevents_import_profile: TWideStringField;
    tblEventsImportevents_import_addresses_desc: TWideStringField;
    tblEventsImportevents_import_objects_poster_id: TLongWordField;
    tblEventsImportevents_import_objects_stela_id: TLongWordField;
    tblEventsImportevents_import_url: TWideStringField;
    tblEventsImportevents_import_url_info: TWideStringField;
    tblEventsImportevents_import_start: TDateTimeField;
    tblEventsImportevents_import_end: TDateTimeField;
    tblEventsImportevents_import_hashtags: TWideStringField;
    tblEventsImportevents_import_languages_id: TWordField;
    tblEventsImportevents_import_countries_id: TWordField;
    tblEventsImportevents_import_regions_id: TWordField;
    tblEventsImportevents_import_provinces_id: TWordField;
    tblEventsImportevents_import_cities_id: TLongWordField;
    tblEventsImportevents_import_cities_name: TWideStringField;
    tblEventsImportevents_import_road_name: TWideStringField;
    tblEventsImportevents_import_number: TWideStringField;
    tblEventsImportevents_import_extended: TWideStringField;
    tblEventsImportevents_import_postal_code: TWideStringField;
    tblEventsImportevents_import_imported: TByteField;
    tblEventsImportevents_import_stamp: TDateTimeField;
    tblEventsImportevents_import_elements_name: TStringField;
    tblEventsImportevents_import_format_name: TStringField;
    dsEventsImport: TDataSource;
    sqlContentFormats: TFDQuery;
    sqlContentFormatscontent_formats_id: TWordField;
    sqlContentFormatscontent_format: TWideStringField;
    dsContentFormats: TDataSource;
    reqWhyuonApiAddImportedUsers: TRESTRequest;
    respWhyuonApiAddImportedUsers: TRESTResponse;
    reqWhyuonApiAddImportedEvents: TRESTRequest;
    respWhyuonApiAddImportedEvents: TRESTResponse;
    ftpWhyuon: TIdFTP;
    sqlImportedImageExists: TFDQuery;
    tblObjectsImport: TFDTable;
    tblObjectsImportobjects_import_id: TFDAutoIncField;
    tblObjectsImportobjects_import_username: TWideStringField;
    tblObjectsImportobjects_import_sha256: TWideStringField;
    tblObjectsImportobjects_import_path: TWideStringField;
    tblObjectsImportobjects_import_name: TWideStringField;
    tblObjectsImportobjects_import_objects_categories_1_id: TWordField;
    tblObjectsImportobjects_import_objects_categories_2_id: TWordField;
    tblObjectsImportobjects_import_objects_id: TLongWordField;
    tblObjectsImportobjects_import_stamp: TDateTimeField;
    tblObjectsCategories: TFDTable;
    tblObjectsCategoriesobjects_categories_id: TWordField;
    tblObjectsCategoriesobjects_categories_code: TWideStringField;
    tblObjectsCategoriesobjects_categories_name_tc: TWideStringField;
    tblObjectsCategoriesobjects_categories_long_name_tc: TWideStringField;
    tblObjectsCategoriesobjects_categories_desc_tc: TWideStringField;
    tblObjectsCategoriesobjects_categories_last_mod: TDateTimeField;
    sqlImportedImageExistsobjects_import_id: TFDAutoIncField;
    tblUsersImportusers_import_objects_import_img_id: TLongWordField;
    tblUsersImportusers_import_objects_import_stela_id: TLongWordField;
    tblUsersImportusers_import_objects_import_public_stela_id: TLongWordField;
    tblUsersImportusers_import_objects_import_poster_id: TLongWordField;
    tblUsersImportusers_import_last_mod: TDateTimeField;
    sqlUsersList: TFDQuery;
    sqlUsersListusers_username: TWideStringField;
    sqlUsersListusers_email: TWideStringField;
    sqlUsersListusers_nickname: TWideStringField;
    dsUsersList: TDataSource;
    sqlUsersListusers_id: TFDAutoIncField;
    sqlUserActions: TFDQuery;
    sqlUserActionsusers_id: TLongWordField;
    sqlUserActionsactions_id: TWordField;
    sqlUserActionsactions_code: TWideStringField;
    sqlElements: TFDQuery;
    sqlElementselements_id: TLongWordField;
    sqlElementselement: TWideStringField;
    dsElements: TDataSource;
    reqWhyuonApiAddImportedUserElement: TRESTRequest;
    respWhyuonApiAddImportedUserElement: TRESTResponse;
    reqWhyuonApiAddImportedUsersElements: TRESTRequest;
    respWhyuonApiAddImportedUsersElements: TRESTResponse;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    reqWhyuonApiLogout: TRESTRequest;
    respWhyuonApiLogout: TRESTResponse;
    sqlUserActionsactions_grant: TSmallintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure reqWhyuonApiLoginAfterExecute(Sender: TCustomRESTRequest);
    procedure reqWhyuonApiAddImportedUserAfterExecute(
      Sender: TCustomRESTRequest);
    procedure reqWhyuonApiAddImportedEventAfterExecute(
      Sender: TCustomRESTRequest);
    procedure reqWhyuonApiAddImportedUserElementAfterExecute(
      Sender: TCustomRESTRequest);
    procedure reqWhyuonApiAddImportedUsersElementsAfterExecute(
      Sender: TCustomRESTRequest);
    procedure reqWhyuonApiLogoutAfterExecute(Sender: TCustomRESTRequest);
  private
    IMAGE_IMPORT_SERVER_DIR: Array[TImageType] of String;
    FValidToken: Boolean;
    FWhyuonApiError: TWhyuonApiError;
    FIniConfig: TStringList;
    FExistsSQLList: TStringList;
    FAppUserAdmin: Boolean;
    FLoggedUserId: Int64;
    FLoggedUserUsername: String;
    FLoggedUserActions: TStringList;

    procedure WhyuonApiStatusValidToken(respSender: TCustomRESTResponse);
    function GetValidToken: Boolean;
    procedure SetValidToken(Value: Boolean);
    function GetWhyuonApiError: String;
    procedure SetWhyuonApiError(respSender: TCustomRESTResponse); overload;
    function Region(nProvince: Integer): Integer;
    function GetIniConfig(Index: String): String;
    function GetObjectCatgoryIdByCode(const sObjectCategoryCode: String): Integer;
    procedure LoadIniConfigDefaults;
    function GetUUID: String;
    function GetAppUserAdmin: Boolean;
    function GetLoggedUserId: Int64;
    function GetLoggedUserUsername: String;
    function GetLoggedUserAction(Index: String): Boolean;
    procedure LoadLoggedUserActions(nUserId: Int64);
  protected
    function GetExistsSQLList(const sTableName: String; const sFieldName: String): TFDQuery;
    property ExistsSQLList[const sTableName: String; const sFieldName: String]: TFDQuery read GetExistsSQLList;

    function ImportedImageExists(const sUsername, sSHA256: String; itImageType: TImageType): Int64;
    function GetSHA256FileName(const sFileName: TFileName): TFileName;
    procedure WhyuonApiLogout;
  public
    property ValidToken: Boolean read GetValidToken;
    property WhyuonApiError: String read GetWhyuonApiError;
    property IniConfig[Index: String]: String read GetIniConfig;
    property AppUserAdmin: Boolean read GetAppUserAdmin;
    property LoggedUserId: Int64 read GetLoggedUserId;
    property LoggedUserUsername: String read GetLoggedUserUsername;
    property LoggedUserActions[Index: String]: Boolean read GetLoggedUserAction;

    procedure LoadIniConfigFile;
    procedure SetRegion(fldRegionField: TField; nProvincia: Integer);
    function Exists(const sValue, sTableName, sFieldName: String): Boolean; overload;
    function Exists(fldValidField: TField; const sTableName, sFieldName: String): Boolean; overload;
    function ExistsList(fldValidField: TField; const sTableName, sFieldName: String): Boolean;
    function IsEmptyStr(fldEmptyField: TField; bTrim: Boolean = True): Boolean;
    function WhyuonApiLogin(bResetToken: Boolean = False): Boolean; overload;
    function WhyuonApiLogin(const sLogin, sPassword: String): Boolean; overload;
    function WhyuonApiAddImportedUser(nUserImportId: Integer): Int64;
    function WhyuonApiAddImportedUsers(slUserImportIdArray: TStrings): String;
    function WhyuonApiAddImportedEvent(nEventImportId: Integer): Int64;
    function WhyuonApiAddImportedEvents(slEventImportIdArray: TStrings): String;
    function WhyuonApiAddImportedUserElement(nUserElementImportId: Integer): Int64;
    function WhyuonApiAddImportedUsersElements(slUserElementImportIdArray: TStrings): String;
    procedure IdBookmarkListToStringList(lstIds: TBookmarkList; fldIdField, fldImportedField: TField; slIds: TStrings);
    function UploadImage(const sUsername: String; const sFileName: TFileName; itImageType: TUserOwnerImageType; bOverwrite: Boolean): TUploadedFile; overload;
    function UploadImage(const sFileName, sImageName: TFileName; itImageType: TElementImageType): String; overload;
    function AddImportObject(const sUsername, sPath, sName, sSHA256: String; itImageType: TUserOwnerImageType): Int64;
    function LoggedUserHasActions(const asActionsCodes: Array of String): Integer;
    function LoggedUserHasAllActions(const asActionsCodes: Array of String): Boolean;
    function LoggedUserCan(nUserId: Int64; const sActionName: String): Boolean;
  end;

var
  dmImportData: TdmImportData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Vcl.Dialogs, System.JSON, System.Hash, System.StrUtils;

const
  STATUS_ERROR_TOKEN = 498;
  SERVER_CONFIG_DEV = 'dev';
  SERVER_CONFIG_REAL = 'real';

function TdmImportData.AddImportObject(const sUsername, sPath, sName,
  sSHA256: String; itImageType: TUserOwnerImageType): Int64;
begin
  if not tblObjectsImport.Active then begin
    tblObjectsImport.Open;
  end;
  tblObjectsImport.Insert;
  tblObjectsImport.FieldByName('objects_import_username').AsString := sUsername;
  tblObjectsImport.FieldByName('objects_import_path').AsString := sPath;
  tblObjectsImport.FieldByName('objects_import_name').AsString := sName;
  tblObjectsImport.FieldByName('objects_import_objects_categories_1_id').AsInteger := GetObjectCatgoryIdByCode(IMG_CATEGORIES_1[itImageType]);
  tblObjectsImport.FieldByName('objects_import_objects_categories_2_id').AsInteger := GetObjectCatgoryIdByCode(IMG_CATEGORIES_2[itImageType]);
  tblObjectsImport.FieldByName('objects_import_sha256').AsString := sSHA256;
  tblObjectsImport.Post;

  Result := tblObjectsImport.FieldByName('objects_import_id').AsLargeInt;
end;

procedure TdmImportData.DataModuleCreate(Sender: TObject);
begin
  FLoggedUserId := -1;
  FLoggedUserUsername := '';
  FLoggedUserActions := TStringList.Create;
  FExistsSQLList := TStringList.Create;
  lnkMariaDB.VendorLib := 'libmariadb.dll';
  FIniConfig := TStringList.Create;
  LoadIniConfigFile;
  if IniConfig['serverConfig'] = SERVER_CONFIG_DEV then begin
    connWhyuon.Params.Values['Database'] := '';
    connWhyuon.Params.Values['User_Name'] := '';
    connWhyuon.Params.Values['Password'] := '';
    ftpWhyuon.Username := '';
    ftpWhyuon.Password := '';
  end else if IniConfig['serverConfig'] = SERVER_CONFIG_REAL then begin
    connWhyuon.Params.Values['Database'] := '';
    connWhyuon.Params.Values['User_Name'] := '';
    connWhyuon.Params.Values['Password'] := '';
    ftpWhyuon.Username := '';
    ftpWhyuon.Password := '';
  end else begin
    connWhyuon.Params.Values['Database'] := '';
    connWhyuon.Params.Values['User_Name'] := '';
    connWhyuon.Params.Values['Password'] := '';
    ftpWhyuon.Username := '';
    ftpWhyuon.Password := '';
  end;
  connWhyuon.Connected := True;
  FValidToken := False;
  tblLanguages.Open;
  sqlRegionOfProvince.Prepare;
  tblUsersImport.Open;
  tblEventsImport.Open;
  sqlContentFormats.Open;
  sqlElements.Open;
  sqlImportedImageExists.Prepare;
end;

procedure TdmImportData.DataModuleDestroy(Sender: TObject);
begin
  WhyuonApiLogout;
  FLoggedUserActions.Free;
  FExistsSQLList.Free;
  FIniConfig.Free;
  connWhyuon.Close;
end;

function TdmImportData.Exists(fldValidField: TField; const sTableName,
  sFieldName: String): Boolean;
begin
  Result := Exists(fldValidField.AsString, sTableName, sFieldName);
end;

function TdmImportData.Exists(const sValue, sTableName,
  sFieldName: String): Boolean;

var
  sqlExistsValidation: TFDQuery;

begin
  sqlExistsValidation := GetExistsSQLList(sTableName, sFieldName);
  sqlExistsValidation.ParamByName('param').Value := sValue;
  sqlExistsValidation.Open;
  Result := sqlExistsValidation.RecordCount > 0;
  sqlExistsValidation.Close;
end;

function TdmImportData.ExistsList(fldValidField: TField; const sTableName,
  sFieldName: String): Boolean;

var
  slValues: TStringList;
  sValue: String;
  sqlExistsValidation: TFDQuery;

begin
  sqlExistsValidation := GetExistsSQLList(sTableName, sFieldName);
  slValues := TStringList.Create;
  try
    slValues.CommaText := fldValidField.AsString;
    for sValue in slValues do begin
      sqlExistsValidation.ParamByName('param').Value := sValue;
      sqlExistsValidation.Open;
      if sqlExistsValidation.RecordCount = 0 then begin
        sqlExistsValidation.Close;
        Result := False;
        Exit;
      end;
      sqlExistsValidation.Close;
    end;
  finally
    slValues.Free;
  end;

  Result := True;
end;

function TdmImportData.GetAppUserAdmin: Boolean;
begin
  Result := IniConfig['userRole'] = 'admin';
end;

function TdmImportData.GetExistsSQLList(const sTableName: String; const sFieldName: String): TFDQuery;

var
  nQuery: Integer;

begin
  nQuery := FExistsSQLList.IndexOf(sTableName + '-' + sFieldName);
  if nQuery >= 0 then begin
    Result := TFDQuery(FExistsSQLList.Objects[nQuery]);
    if Result.Active then begin
      Result.Close;
    end;
    Exit;
  end;

  Result := TFDQuery.Create(Self);
  Result.Connection := connWhyuon;
  Result.FormatOptions.SortOptions := [soNoSymbols, soNoCase];
  Result.FormatOptions.StrsTrim := False;
  Result.FormatOptions.SortLocale := 0;
  Result.SQL.Text := 'SELECT ' + sFieldName + ' FROM ' + sTableName +
    ' WHERE ' + sFieldName + ' = :param';
  Result.ParamByName('param').ParamType := TParamType.ptInput;
  Result.ParamByName('param').DataType := TFieldType.ftString;
  Result.Prepare;
end;

function TdmImportData.GetIniConfig(Index: String): String;
begin
  Result := FIniConfig.Values[Index];
end;

function TdmImportData.GetLoggedUserId: Int64;
begin
  Result := FLoggedUserId;
end;

function TdmImportData.GetLoggedUserUsername: String;
begin
  Result := FLoggedUserUsername;
end;

function TdmImportData.GetObjectCatgoryIdByCode(
  const sObjectCategoryCode: String): Integer;
begin
  Result := -1;
  if not tblObjectsCategories.Active then begin
    tblObjectsCategories.Open;
  end;

  if tblObjectsCategories.FindKey([sObjectCategoryCode]) then begin
    Result := tblObjectsCategories.FieldByName('objects_categories_id').AsInteger;
  end;
end;

function TdmImportData.GetSHA256FileName(const sFileName: TFileName): TFileName;
begin
  Result := THashSHA2.GetHashStringFromFile(sFileName);
end;

function TdmImportData.GetLoggedUserAction(Index: String): Boolean;
begin
  Result := (FLoggedUserActions.IndexOfName(Index) <> -1) and
    (FLoggedUserActions.Values[Index] = '1');
end;

function TdmImportData.GetUUID: String;

var
  guidImgName: TGUID;

begin
  if CreateGUID(guidImgName) <> 0 then begin
    Result := '';
    Exit;
  end;

  Result := ReplaceStr(ReplaceStr(ReplaceStr(GUIDToString(guidImgName), '-', ''), '{', ''), '}', '');
end;

function TdmImportData.GetValidToken: Boolean;
begin
  Result := FValidToken;
end;

function TdmImportData.GetWhyuonApiError: String;
begin
  if FWhyuonApiError.Code = 200 then begin
    Result := '';
    Exit;
  end;

  Result := FWhyuonApiError.ToString;
end;

procedure TdmImportData.IdBookmarkListToStringList(lstIds: TBookmarkList;
  fldIdField, fldImportedField: TField; slIds: TStrings);

var
    nCont: Integer;

begin
  if lstIds.Count = 0 then begin
    Exit;
  end;
  
  fldIdField.DataSet.DisableControls;
  try
    for nCont := 0 to lstIds.Count - 1 do begin
      fldIdField.DataSet.GotoBookmark(lstIds.Items[nCont]);
      if TImportedState(fldImportedField.AsInteger) <> TImportedState.isImported then begin
        slIds.Add(fldIdField.AsString);
      end;
    end;
  finally
    fldIdField.DataSet.EnableControls;
  end;
end;

function TdmImportData.ImportedImageExists(const sUsername, sSHA256: String;
  itImageType: TImageType): Int64;
begin
  if sqlImportedImageExists.Active then begin
    sqlImportedImageExists.Close;
  end;
  sqlImportedImageExists.ParamByName('objects_import_username').Value := sUsername;
  sqlImportedImageExists.ParamByName('objects_categories_code_1').Value := IMG_CATEGORIES_1[itImageType];
  sqlImportedImageExists.ParamByName('objects_categories_code_2').Value := IMG_CATEGORIES_2[itImageType];
  sqlImportedImageExists.ParamByName('objects_import_sha256').Value := sSHA256;
  sqlImportedImageExists.Open;

  if sqlImportedImageExists.RecordCount = 0 then begin
    sqlImportedImageExists.Close;
    Result := -1;
    Exit;
  end;

  Result := sqlImportedImageExists.FieldByName('objects_import_id').AsLargeInt;
  sqlImportedImageExists.Close;
end;

function TdmImportData.IsEmptyStr(fldEmptyField: TField; bTrim: Boolean = True): Boolean;
begin
  Result := Trim(fldEmptyField.AsString) = '';
end;

procedure TdmImportData.LoadIniConfigDefaults;
begin
  FIniConfig.Add('apiURL=http://localhost:8000/api');
  FIniConfig.Add('userImagesDir=user_images/');
  FIniConfig.Add('userImportImagesDir=user_import_images/');
  FIniConfig.Add('elementsImagesDir=elements_images/');
  FIniConfig.Add('userRole=user');
  FIniConfig.Add('serverConfig=dev');
end;

procedure TdmImportData.LoadIniConfigFile;
begin
  try
    FIniConfig.LoadFromFile('ImportData.ini');
  except
    ShowMessage('No se pudo cargar el archivo de configuraciones [ImportData.ini]' + #13#10 +
      'Se aplicarán los valores por defecto');
    LoadIniConfigDefaults;
  end;
  rcliWhyuonApi.BaseURL := IniConfig['apiURL'];

  IMAGE_IMPORT_SERVER_DIR[itImage] := IniConfig['userImportImagesDir'] + IMG_TYPE_NAMES[itImage] + 's';
  IMAGE_IMPORT_SERVER_DIR[itStela] := IniConfig['userImportImagesDir'] + IMG_TYPE_NAMES[itStela] + 's';
  IMAGE_IMPORT_SERVER_DIR[itPublicStela] := IniConfig['userImportImagesDir'] + IMG_TYPE_NAMES[itStela] + 's';
  IMAGE_IMPORT_SERVER_DIR[itPoster] := IniConfig['userImportImagesDir'] + IMG_TYPE_NAMES[itPoster] + 's';
  IMAGE_IMPORT_SERVER_DIR[itEventPoster] := IniConfig['userImportImagesDir'] + IMG_TYPE_NAMES[itEventPoster] + 's';
  IMAGE_IMPORT_SERVER_DIR[itEventStela] := IniConfig['userImportImagesDir'] + IMG_TYPE_NAMES[itEventStela] + 's';
  IMAGE_IMPORT_SERVER_DIR[itUserElementStela] := IniConfig['userImportImagesDir'] + IMG_TYPE_NAMES[itUserElementStela] + 's';
  IMAGE_IMPORT_SERVER_DIR[itElementImage] := IniConfig['elementsImagesDir'];
  IMAGE_IMPORT_SERVER_DIR[itElementStela] := IniConfig['elementsImagesDir'];
  IMAGE_IMPORT_SERVER_DIR[itElementPoster] := IniConfig['elementsImagesDir'];
  IMAGE_IMPORT_SERVER_DIR[itElementIcon] := IniConfig['elementsImagesDir'];
end;

procedure TdmImportData.LoadLoggedUserActions(nUserId: Int64);

var
  sActionCode: String;

begin
  FLoggedUserActions.Clear;
  sqlUserActions.ParamByName('user_id').AsLargeInt := nUserId;
  try
    sqlUserActions.Open;
    sqlUserActions.First;
    while not sqlUserActions.Eof do begin
      sActionCode := sqlUserActions.FieldByName('actions_code').AsString;
      if FLoggedUserActions.IndexOfName(sActionCode) = -1 then begin
        FLoggedUserActions.AddPair(sActionCode, sqlUserActions.FieldByName('actions_grant').AsString);
      end else if FLoggedUserActions.Values[sActionCode] = '1' then begin
        FLoggedUserActions.Values[sActionCode] := sqlUserActions.FieldByName('actions_grant').AsString;
      end;

      sqlUserActions.Next;
    end;
  finally
    sqlUserActions.Close;
  end;
end;

function TdmImportData.Region(nProvince: Integer): Integer;

var
  nRegion: Integer;

begin
    nRegion := -1;
    if sqlRegionOfProvince.Active then begin
      sqlRegionOfProvince.Close;
    end;
    sqlRegionOfProvince.ParamByName('users_import_provinces_id').AsInteger := nProvince;
    dmImportdata.sqlRegionOfProvince.Open;
    if sqlRegionOfProvince.RecordCount = 1 then begin
      nRegion := sqlRegionOfProvince.FieldByName('provinces_regions_id').AsInteger;
    end;
    dmImportdata.sqlRegionOfProvince.Close;

    Result := nRegion;
end;

procedure TdmImportData.reqWhyuonApiAddImportedEventAfterExecute(
  Sender: TCustomRESTRequest);
begin
  WhyuonApiStatusValidToken(Sender.Response);
end;

procedure TdmImportData.reqWhyuonApiAddImportedUserAfterExecute(
  Sender: TCustomRESTRequest);
begin
  WhyuonApiStatusValidToken(Sender.Response);
end;

procedure TdmImportData.reqWhyuonApiAddImportedUserElementAfterExecute(
  Sender: TCustomRESTRequest);
begin
  WhyuonApiStatusValidToken(Sender.Response);
end;

procedure TdmImportData.reqWhyuonApiAddImportedUsersElementsAfterExecute(
  Sender: TCustomRESTRequest);
begin
  WhyuonApiStatusValidToken(Sender.Response);
end;

procedure TdmImportData.reqWhyuonApiLoginAfterExecute(
  Sender: TCustomRESTRequest);
begin
  SetValidToken(Sender.Response.StatusCode = 200);
  if not FValidToken then begin
    Exit;
  end;

  Sender.Client.Params.ParameterByName('token').Value := Sender.Response.JSONValue.Value;
  Sender.Response.RootElement := 'user.user_id';
  FLoggedUserId := Sender.Response.JSONValue.AsType<Int64>;
  Sender.Response.RootElement := 'user.username';
  FLoggedUserUsername := Sender.Response.JSONValue.Value;
  LoadLoggedUserActions(FLoggedUserId);
end;

procedure TdmImportData.reqWhyuonApiLogoutAfterExecute(
  Sender: TCustomRESTRequest);
begin
  SetValidToken(False);
end;

procedure TdmImportData.SetRegion(fldRegionField: TField; nProvincia: Integer);

var
  nRegion: Integer;

begin
  nRegion := Region(nProvincia);
  if nRegion <> -1 then begin
    if fldRegionField.AsInteger <> nRegion then begin
      fldRegionField.AsInteger := nRegion;
    end;
  end;
end;

procedure TdmImportData.SetValidToken(Value: Boolean);
begin
  FValidToken := Value;
  if not Value then begin
    FLoggedUserId := -1;
    FLoggedUserUsername := '';
  end;
end;

procedure TdmImportData.SetWhyuonApiError(respSender: TCustomRESTResponse);

var
  nCode: Integer;

begin
  nCode := respSender.StatusCode;
  if nCode = 200 then begin
    FWhyuonApiError.SetError(nCode, '');
  end
  else if (nCode = 460) or (nCode = 470) or (nCode = 500) then begin
    respSender.RootElement := 'message';
    if Assigned(respSender.JSONValue) then begin
      FWhyuonApiError.SetError(nCode, TJSONObject.ParseJSONValue(respSender.JSONValue.ToString, True).Format);
    end;
  end
  else if nCode = 461 then begin
    if Assigned(respSender.JSONValue) then begin
      FWhyuonApiError.SetError(nCode, TJSONObject.ParseJSONValue(respSender.JSONValue.ToString, True).Format);
    end;
  end
  else if nCode = 450 then begin
    respSender.RootElement := 'errors';
    if Assigned(respSender.JSONValue) then begin
      FWhyuonApiError.SetError(nCode, TJSONObject.ParseJSONValue(respSender.JSONValue.ToString, True).Format);
    end;
  end;
  if not Assigned(respSender.JSONValue) then begin
    FWhyuonApiError.SetError(nCode, '');
  end;
end;

function TdmImportData.UploadImage(const sFileName, sImageName: TFileName;
  itImageType: TElementImageType): String;

var
  sSHA256: String;

begin
  if not ftpWhyuon.Connected then begin
    ftpWhyuon.Connect;
  end;
  ftpWhyuon.ChangeDir('/' + IMAGE_IMPORT_SERVER_DIR[itImageType]);
  sSHA256 := GetSHA256FileName(sFileName);
  {
  if Exists(sSHA256, 'objects', 'objects_sha256') then begin
    Result := '';
    Exit;
  end;
  }
  try
    ftpWhyuon.Put(sFileName, sImageName);
  except
    Result := '';
    ftpWhyuon.Disconnect;
    Exit;
  end;
  ftpWhyuon.Disconnect;

  Result := sSHA256;
end;

function TdmImportData.LoggedUserCan(nUserId: Int64;
  const sActionName: String): Boolean;
begin
{ TODO : Implementar }
end;

function TdmImportData.LoggedUserHasActions(
  const asActionsCodes: array of String): Integer;

var
  sAction: String;
  nCont: Integer;

begin
  nCont := 0;
  for sAction in asActionsCodes do begin
    if LoggedUserActions[sAction] then begin
      Inc(nCont);
    end;
  end;

  Result := nCont;
end;

function TdmImportData.LoggedUserHasAllActions(
  const asActionsCodes: array of String): Boolean;
begin
  Result := LoggedUserHasActions(asActionsCodes) = Length(asActionsCodes);
end;

function TdmImportData.UploadImage(const sUsername: String; const sFileName: TFileName;
  itImageType: TUserOwnerImageType; bOverwrite: Boolean): TUploadedFile;

var
  sImgName: TFileName;
  sSHA256: String;
  sGUID: String;
  slFiles: TStringList;
  nObject: Int64;

begin
  Result.Error := ufeOK;

  if not ftpWhyuon.Connected then begin
    ftpWhyuon.Connect;
  end;
  ftpWhyuon.ChangeDir('/' + IMAGE_IMPORT_SERVER_DIR[itImageType]);
  sSHA256 := GetSHA256FileName(sFileName);
  sImgName := GetUUID + '_' + IMG_TYPE_NAMES[itImageType];
  if itImageType > High(TUserImageType) then begin
    sGUID := GetUUID;
    if sGUID = '' then begin
      Result.Error := ufeFTPError;
      Exit;
    end;
    sImgName := sImgName + '_' + sGUID;
  end;
  sImgName := sImgName + ExtractFileExt(sFileName);
  nObject := ImportedImageExists(sUsername, sSHA256, itImageType);
  if nObject <> -1 then begin
    Result.sSHA256 := sSHA256;
    Result.nObjectId := nObject;
    Result.Error := ufeObjectsExistsBBDD;
    Exit;
  end;

  if not bOverwrite then begin
    slFiles := TStringList.Create;
    try
      ftpWhyuon.List(slFiles, '', False);
      if slFiles.IndexOf(sImgName) >= 0 then begin
        Result.Error := ufeFileExists;
        Exit;
      end;
    finally
      slFiles.Free;
    end;
  end;

  try
    ftpWhyuon.Put(sFileName, sImgName);
  except
    Result.Error := ufeFTPError;
    ftpWhyuon.Disconnect;
    Exit;
  end;
  ftpWhyuon.Disconnect;

  Result.sSHA256 := sSHA256;
  Result.sPath := IMAGE_IMPORT_SERVER_DIR[itImageType] + '/' + sImgName;
end;

function TdmImportData.WhyuonApiAddImportedEvent(
  nEventImportId: Integer): Int64;

var
  respResponse: TCustomRESTResponse;

begin
  if not FValidToken then begin
    WhyuonApiLogin(True);
  end;
  if not FValidToken then begin
    Result := -1;
    Exit;
  end;

  reqWhyuonApiAddImportedEvent.Params.ParameterByName('import_id').Value := IntToStr(nEventImportId);
  try
    reqWhyuonApiAddImportedEvent.Execute;
  except

  end;
  respResponse := reqWhyuonApiAddImportedEvent.Response;
  SetWhyuonApiError(respResponse);
  if respResponse.StatusCode <> 200 then begin
    Result := -1;
    Exit;
  end;
  respResponse.RootElement := 'event_id';

  Result := respResponse.JSONValue.AsType<Int64>;
end;

function TdmImportData.WhyuonApiAddImportedEvents(
  slEventImportIdArray: TStrings): String;

var
  respResponse: TCustomRESTResponse;
  nCont: Integer;

begin
  if not FValidToken then begin
    WhyuonApiLogin(True);
  end;
  if not FValidToken then begin
    Result := '[]';
    Exit;
  end;

  for nCont := 0 to slEventImportIdArray.Count - 1 do begin
    reqWhyuonApiAddImportedEvents.Params.AddItem('import_id[' + IntToStr(nCont) + ']', slEventImportIdArray[nCont], TRESTRequestParameterKind.pkGETorPOST);
  end;
  try
    reqWhyuonApiAddImportedEvents.Execute;
  except

  end;
  respResponse := reqWhyuonApiAddImportedEvents.Response;
  SetWhyuonApiError(respResponse);
  if respResponse.StatusCode <> 200 then begin
    Result := FWhyuonApiError.ToString;
    Exit;
  end;
  respResponse.RootElement := 'event_id';

  Result := respResponse.JSONValue.Value;
end;

function TdmImportData.WhyuonApiAddImportedUser(
  nUserImportId: Integer): Int64;

var
  respResponse: TCustomRESTResponse;

begin
  if not FValidToken then begin
    WhyuonApiLogin(True);
  end;
  if not FValidToken then begin
    Result := -1;
    Exit;
  end;

  reqWhyuonApiAddImportedUser.Params.ParameterByName('import_id').Value := IntToStr(nUserImportId);
  try
    reqWhyuonApiAddImportedUser.Execute;
  except

  end;
  respResponse := reqWhyuonApiAddImportedUser.Response;
  SetWhyuonApiError(respResponse);
  if respResponse.StatusCode <> 200 then begin
    Result := -1;
    Exit;
  end;
  respResponse.RootElement := 'user_id';

  Result := respResponse.JSONValue.AsType<Int64>;
end;

function TdmImportData.WhyuonApiAddImportedUserElement(
  nUserElementImportId: Integer): Int64;

var
  respResponse: TCustomRESTResponse;

begin
  if not FValidToken then begin
    WhyuonApiLogin(True);
  end;
  if not FValidToken then begin
    Result := -1;
    Exit;
  end;

  reqWhyuonApiAddImportedUserElement.Params.ParameterByName('import_id').Value := IntToStr(nUserElementImportId);
  try
    reqWhyuonApiAddImportedUserElement.Execute;
  except

  end;
  respResponse := reqWhyuonApiAddImportedUserElement.Response;
  SetWhyuonApiError(respResponse);
  if respResponse.StatusCode <> 200 then begin
    Result := -1;
    Exit;
  end;
  respResponse.RootElement := 'user_element_id';

  Result := respResponse.JSONValue.AsType<Int64>;
end;

function TdmImportData.WhyuonApiAddImportedUsers(
  slUserImportIdArray: TStrings): String;

var
  respResponse: TCustomRESTResponse;
  nCont: Integer;

begin
  if not FValidToken then begin
    WhyuonApiLogin(True);
  end;
  if not FValidToken then begin
    Result := '[]';
    Exit;
  end;

  for nCont := 0 to slUserImportIdArray.Count - 1 do begin
    reqWhyuonApiAddImportedUsers.Params.AddItem('import_id[' + IntToStr(nCont) + ']', slUserImportIdArray[nCont], TRESTRequestParameterKind.pkGETorPOST);
  end;
  try
    reqWhyuonApiAddImportedUsers.Execute;
  except

  end;
  respResponse := reqWhyuonApiAddImportedUsers.Response;
  SetWhyuonApiError(respResponse);
  if respResponse.StatusCode <> 200 then begin
    Result := '[]';
    Exit;
  end;
  respResponse.RootElement := 'user_id';

  Result := respResponse.JSONValue.Value;
end;

function TdmImportData.WhyuonApiAddImportedUsersElements(
  slUserElementImportIdArray: TStrings): String;

var
  respResponse: TCustomRESTResponse;
  nCont: Integer;

begin
  if not FValidToken then begin
    WhyuonApiLogin(True);
  end;
  if not FValidToken then begin
    Result := '[]';
    Exit;
  end;

  for nCont := 0 to slUserElementImportIdArray.Count - 1 do begin
    reqWhyuonApiAddImportedUsersElements.Params.AddItem('import_id[' + IntToStr(nCont) + ']', slUserElementImportIdArray[nCont], TRESTRequestParameterKind.pkGETorPOST);
  end;
  try
    reqWhyuonApiAddImportedUsersElements.Execute;
  except

  end;
  respResponse := reqWhyuonApiAddImportedUsersElements.Response;
  SetWhyuonApiError(respResponse);
  if respResponse.StatusCode <> 200 then begin
    Result := '[]';
    Exit;
  end;
  respResponse.RootElement := 'user_element_id';

  Result := respResponse.JSONValue.Value;
end;

function TdmImportData.WhyuonApiLogin(const sLogin, sPassword: String): Boolean;

var
  bLogin: Boolean;

begin
  reqWhyuonApiLogin.Params.ParameterByName('login').Value := sLogin;
  reqWhyuonApiLogin.Params.ParameterByName('password').Value := sPassword;

  bLogin := WhyuonApiLogin(True);
  if bLogin and (not LoggedUserActions['ACTIONS_LOGIN_IMPORT_APP']) then begin
    bLogin := False;
    WhyuonApiLogout;
    FWhyuonApiError.SetError(470, 'Usuario no autorizado')
  end;

  Result := bLogin;
end;

procedure TdmImportData.WhyuonApiLogout;
begin
  if not FValidToken then begin
    Exit;  
  end;

  try
    reqWhyuonApiLogout.Execute;
  except
    on E: ERESTException do begin
      Exit;
    end;
  end;
end;

function TdmImportData.WhyuonApiLogin(bResetToken: Boolean = False): Boolean;
begin
  if FValidToken and (not bResetToken) then begin
    Result := True;
    Exit;
  end;

  reqWhyuonApiLogin.Response.RootElement := 'authorisation.token';
  try
    reqWhyuonApiLogin.Execute;
  except
    on E: ERESTException do begin
      FWhyuonApiError.SetError(500, E.Message);
      Exit;
    end;
  end;
  if not FValidToken then begin
    reqWhyuonApiLogin.Response.RootElement := 'message';
    FWhyuonApiError.SetError(reqWhyuonApiLogin.Response.StatusCode, reqWhyuonApiLogin.Response.JSONValue.Value);
  end;

  Result := FValidToken;
end;

procedure TdmImportData.WhyuonApiStatusValidToken(respSender: TCustomRESTResponse);
begin
  SetValidToken(respSender.StatusCode <> STATUS_ERROR_TOKEN);
end;

{ TWhyuonApiError }

class operator TWhyuonApiError.Initialize(out Dest: TWhyuonApiError);
begin
  Dest.Code := 200;
  Dest.Error := '';
end;

procedure TWhyuonApiError.SetError(nCode: Integer; const sError: String);
begin
  Self.Code := nCode;
  Self.Error := sError;
end;

function TWhyuonApiError.ToString: String;
begin
  Result := 'Error ' + IntToStr(Self.Code) + ': ' + Self.Error;
end;

end.
