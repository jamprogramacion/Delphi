unit udmEventsImport;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmImportData,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.Text;

type
  TdmEventsImport = class(TDataModule)
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
    dsEventsImport: TDataSource;
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
    bmvEventsImport: TFDBatchMove;
    bmvEventsImportReader: TFDBatchMoveTextReader;
    bmvEventsImportWriter: TFDBatchMoveDataSetWriter;
    dsUsersElements: TDataSource;
    sqlUsersElements: TFDQuery;
    sqlUsersElementsusers_elements_id: TFDAutoIncField;
    sqlUsersElementsusers_elements_username: TWideStringField;
    sqlContentFormats: TFDQuery;
    dsContentFormats: TDataSource;
    sqlContentFormatscontent_formats_id: TWordField;
    sqlContentFormatscontent_format: TWideStringField;
    sqlCategories: TFDQuery;
    dsCategories: TDataSource;
    sqlEventsImportCategories: TFDQuery;
    dsEventsImportCategories: TDataSource;
    sqlEventsImportCategoriescategory: TWideStringField;
    sqlCategoriescategory: TWideStringField;
    tblEventsImportevents_import_elements_name: TStringField;
    tblEventsImportevents_import_format_name: TStringField;
    sqlCategoriesList: TFDQuery;
    sqlCategoriesListcategories_id: TLongWordField;
    sqlCategoriesListcategory: TWideStringField;
    sqlDuplicateEventImport: TFDQuery;
    sqlEventsImportObjects: TFDQuery;
    dsEventsImportObjects: TDataSource;
    tblEventsImportevents_import_objects_import_poster_id: TLongWordField;
    tblEventsImportevents_import_objects_import_stela_id: TLongWordField;
    tblEventsImportevents_import_last_mod: TDateTimeField;
    sqlEventsImportObjectsevents_import_username: TWideStringField;
    sqlEventsImportObjectsstela_path: TWideStringField;
    sqlEventsImportObjectsstela_name: TWideStringField;
    sqlEventsImportObjectsposter_path: TWideStringField;
    sqlEventsImportObjectsposter_name: TWideStringField;
    sqlEventsImportObjectsimport_stela_path: TWideStringField;
    sqlEventsImportObjectsimport_stela_name: TWideStringField;
    sqlEventsImportObjectsimport_poster_path: TWideStringField;
    sqlEventsImportObjectsimport_poster_name: TWideStringField;
    sqlEventsImportObjectsevents_import_id: TFDAutoIncField;
    tblEventsImportevents_import_eventstbl_id: TLongWordField;
    sqlElements: TFDQuery;
    sqlElementselements_id: TLongWordField;
    sqlElementselement: TWideStringField;
    dsElements: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure tblEventsImportevents_import_countries_idChange(Sender: TField);
    procedure tblEventsImportevents_import_regions_idChange(Sender: TField);
    procedure tblEventsImportevents_import_provinces_idChange(Sender: TField);
    procedure tblEventsImportevents_import_cities_idChange(Sender: TField);
    procedure tblEventsImportevents_import_elements_idChange(Sender: TField);
    procedure tblEventsImportevents_import_users_elements_idChange(
      Sender: TField);
    procedure tblEventsImportevents_import_content_formats_idChange(
      Sender: TField);
    procedure tblEventsImportevents_import_languages_idChange(Sender: TField);
    procedure dsEventsImportDataChange(Sender: TObject; Field: TField);
    procedure dsEventsImportStateChange(Sender: TObject);
    procedure sqlEventsImportCategoriesBeforeOpen(DataSet: TDataSet);
    procedure tblEventsImportAfterScroll(DataSet: TDataSet);
    procedure sqlCategoriesBeforeOpen(DataSet: TDataSet);
    procedure bmvEventsImportProgress(ASender: TObject;
      APhase: TFDBatchMovePhase);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblEventsImportevents_import_categories_idChange(Sender: TField);
    procedure tblEventsImportAfterPost(DataSet: TDataSet);
    procedure tblEventsImportAfterCancel(DataSet: TDataSet);
    procedure tblEventsImportevents_import_startChange(Sender: TField);
    procedure tblEventsImportevents_import_endChange(Sender: TField);
    procedure tblEventsImportAfterRefresh(DataSet: TDataSet);
    procedure bmvEventsImportError(ASender: TObject; AException: Exception;
      var AAction: TFDErrorAction);
    procedure tblEventsImportevents_import_usernameChange(Sender: TField);
    procedure tblEventsImportAfterInsert(DataSet: TDataSet);
    procedure tblEventsImportBeforeDelete(DataSet: TDataSet);
  private
    FImportErrors: TStringList;
    FCanEditImported: Boolean;
    FOnEventsImportDataChange: TDataChangeEvent;
    FEventsImportProgress: TFDBatchMoveProgressEvent;

    bImporting: Boolean;
    slCategories: TStringList;

    procedure UpdateCategories;
    procedure UpdateCategoriesList;
    function GetCanEditImported: Boolean;
    procedure SetCanEditImported(const Value: Boolean);
    function GetEventsImportProgress: TFDBatchMoveProgressEvent;
    function GetOnEventsImportDataChange: TDataChangeEvent;
    procedure SetEventsImportProgress(const Value: TFDBatchMoveProgressEvent);
    procedure SetOnEventsImportDataChange(const Value: TDataChangeEvent);
  public
    property OnEventsImportDataChange: TDataChangeEvent
      read GetOnEventsImportDataChange write SetOnEventsImportDataChange;
    property EventsImportProgress: TFDBatchMoveProgressEvent
      read GetEventsImportProgress write SetEventsImportProgress;

    property ImportErrors: TStringList read FImportErrors;
    property CanEditImported: Boolean read GetCanEditImported write SetCanEditImported;

    function EventImported: TImportedState;
    procedure ImportEventsCSV;
    procedure SaveCategories(slCategoryCodes: TStrings);
    function AddImportedEvent(nEventImportId: Integer): Integer;
    procedure AddImportedEvents(slEventImportIdList: TStrings);
    function DuplicateSelectedEvent: Boolean;
  end;

var
  dmEventsImport: TdmEventsImport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  udmUsersImport, Vcl.Dialogs, System.DateUtils, System.TimeSpan, Vcl.Controls;

function TdmEventsImport.AddImportedEvent(nEventImportId: Integer): Integer;

var
  bookUser: TBookmark;

begin
  bookUser := tblEventsImport.GetBookmark;
  try
    tblEventsImport.DisableControls;
    if tblEventsImport.Locate('events_import_id', nEventImportId, []) and (EventImported <> TImportedState.isImported) then begin
      Result := dmImportData.WhyuonApiAddImportedEvent(nEventImportId);
    end else begin
      Result := -1;
    end;
  finally
    tblEventsImport.GotoBookmark(bookUser);
    tblEventsImport.EnableControls;
  end;
end;

procedure TdmEventsImport.AddImportedEvents(slEventImportIdList: TStrings);

var
  sServerRes: String;

begin
  sServerRes := dmImportData.WhyuonApiAddImportedEvents(slEventImportIdList);
  if dmImportData.WhyuonApiError = '' then begin
    slEventImportIdList.CommaText := sServerRes;
  end else begin
    slEventImportIdList.Clear;
  end;
end;

procedure TdmEventsImport.bmvEventsImportError(ASender: TObject;
  AException: Exception; var AAction: TFDErrorAction);
begin
  AException.Message := Format('Línea %d: ', [bmvEventsImport.ReadCount + 1]) + AException.Message;
  FImportErrors.Add(AException.Message);
end;

procedure TdmEventsImport.bmvEventsImportProgress(ASender: TObject;
  APhase: TFDBatchMovePhase);
begin
  if Assigned(FEventsImportProgress) then begin
    FEventsImportProgress(ASender, APhase);
  end;
end;

procedure TdmEventsImport.DataModuleCreate(Sender: TObject);
begin
  FCanEditImported := False;
  tblEventsImport.Open;
  tblCountries.Open;
  tblProvinces.Open;
  tblRegions.Open;
  tblCities.Open;
  sqlContentFormats.Open;
  slCategories := TStringList.Create;
  UpdateCategoriesList;
  bImporting := False;
  FImportErrors := TStringList.Create;
  sqlDuplicateEventImport.Prepare;
  sqlElements.Open;
  sqlEventsImportObjects.Open;
  sqlUsersElements.Prepare;
  sqlUsersElements.Open;
end;

procedure TdmEventsImport.DataModuleDestroy(Sender: TObject);
begin
  slCategories.Free;
  FImportErrors.Free;
end;

procedure TdmEventsImport.dsEventsImportDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(FOnEventsImportDataChange) then begin
    FOnEventsImportDataChange(Sender, Field);
  end;
end;

procedure TdmEventsImport.dsEventsImportStateChange(Sender: TObject);
begin
  if (EventImported > TImportedState.isImportAll) and (tblEventsImport.State = dsEdit) and (not FCanEditImported) then begin
    tblEventsImport.Cancel;
    ShowMessage('No se puede modificar un evento que ya ha sido importado');
  end;
end;

function TdmEventsImport.DuplicateSelectedEvent: Boolean;
begin
  try
    sqlDuplicateEventImport.ExecSQL;
    tblEventsImport.Refresh;
  except
    Result := False;
  end;

  Result := True;
end;

function TdmEventsImport.EventImported: TImportedState;
begin
  Result := TImportedState(tblEventsImport.FieldByName('events_import_imported').AsInteger);
end;

function TdmEventsImport.GetCanEditImported: Boolean;
begin
  Result := FCanEditImported;
end;

function TdmEventsImport.GetEventsImportProgress: TFDBatchMoveProgressEvent;
begin
  Result := FEventsImportProgress;
end;

function TdmEventsImport.GetOnEventsImportDataChange: TDataChangeEvent;
begin
  Result := FOnEventsImportDataChange;
end;

procedure TdmEventsImport.ImportEventsCSV;
begin
  try
    bImporting := True;
    tblEventsImport.DisableControls;
    tblEventsImport.Close;
    bmvEventsImport.LogFileName := bmvEventsImportReader.ActualFileName + '.log';
    FImportErrors.Clear;
    bmvEventsImport.Execute;
  finally
    bImporting := False;
    tblEventsImport.Open;
    tblEventsImport.EnableControls;
  end;
end;

procedure TdmEventsImport.SaveCategories(slCategoryCodes: TStrings);

var
  sCode: String;
  slCategoryIds: TStringList;

begin
  if not (tblEventsImport.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then begin
    tblEventsImport.Edit;
  end;

  slCategoryIds := TStringList.Create;
  try
      for sCode in slCategoryCodes do begin
        slCategoryIds.Add(slCategories.Values[sCode]);
      end;
      if slCategoryIds.Count = 0 then begin
        tblEventsImport.FieldByName('events_import_categories_id').Clear;
      end
      else begin
        tblEventsImport.FieldByName('events_import_categories_id').AsString := slCategoryIds.CommaText;
      end;
  finally
    slCategoryIds.Free;
  end;
end;

procedure TdmEventsImport.SetCanEditImported(const Value: Boolean);
begin
  FCanEditImported := Value;
end;

procedure TdmEventsImport.SetEventsImportProgress(
  const Value: TFDBatchMoveProgressEvent);
begin
  FEventsImportProgress := Value;
end;

procedure TdmEventsImport.SetOnEventsImportDataChange(
  const Value: TDataChangeEvent);
begin
  FOnEventsImportDataChange := Value;
end;

procedure TdmEventsImport.sqlCategoriesBeforeOpen(DataSet: TDataSet);

var
  sCategories: String;

begin
  if tblEventsImport.FieldByName('events_import_categories_id').AsString = '' then begin
    sCategories := '';
  end else begin
    sCategories := 'where ' +
      'categories_id not in (' + tblEventsImport.FieldByName('events_import_categories_id').AsString +
      ') ';
  end;

  sqlCategories.SQL.Text := 'select ' +
    'c.categories_id, ' +
    'cast(t.translations_text as char(100)) as category ' +
    'from ' +
    'categories as c ' +
    'join translations as t ' +
    'on c.categories_name_tc = t.translations_code ' +
    sCategories +
    'order by ' +
    'category';
end;

procedure TdmEventsImport.sqlEventsImportCategoriesBeforeOpen(
  DataSet: TDataSet);

var
  sCategories: String;

begin
  if tblEventsImport.FieldByName('events_import_categories_id').AsString = '' then begin
    sCategories := 'where categories_id is null ';
  end else begin
    sCategories := 'where ' +
      'categories_id in (' + tblEventsImport.FieldByName('events_import_categories_id').AsString +
      ') ';
  end;

  sqlEventsImportCategories.SQL.Text := 'select ' +
    'c.categories_id, ' +
    'cast(t.translations_text as char(100)) as category ' +
    'from ' +
    'categories as c ' +
    'join translations as t ' +
    'on c.categories_name_tc = t.translations_code ' +
    sCategories +
    'order by ' +
    'category';
end;

procedure TdmEventsImport.tblEventsImportAfterCancel(DataSet: TDataSet);
begin
  UpdateCategories;
end;

procedure TdmEventsImport.tblEventsImportAfterInsert(DataSet: TDataSet);
begin
  if bImporting then begin
    Exit;
  end;

  DataSet.FieldByName('events_import_username').AsString :=
    dmUsersImport.tblUsersImport.FieldByName('users_import_username').AsString;
  DataSet.FieldByName('events_import_start').AsDateTime := Now; // - TTimeZone.Local.GetUtcOffset(Now);
  DataSet.FieldByName('events_import_end').AsDateTime :=
    DataSet.FieldByName('events_import_start').AsDateTime + TTimeSpan.FromMinutes(1);
  DataSet.FieldByName('events_import_languages_id').AsInteger := udmImportData.LANG_ID_SPANISH;
end;

procedure TdmEventsImport.tblEventsImportAfterPost(DataSet: TDataSet);
begin
  UpdateCategories;
  sqlEventsImportObjects.Close;
  sqlEventsImportObjects.Open;
end;

procedure TdmEventsImport.tblEventsImportAfterRefresh(DataSet: TDataSet);
begin
  UpdateCategories;
end;

procedure TdmEventsImport.tblEventsImportAfterScroll(DataSet: TDataSet);
begin
  UpdateCategories;
  DataSet.FieldByName('events_import_cities_name').ReadOnly := not DataSet.FieldByName('events_import_cities_id').IsNull;

  if DataSet.State = dsInsert then begin
    Exit;
  end;

  dmImportData.tblEventsImport.Locate('events_import_id', tblEventsImport.FieldByName('events_import_id').AsInteger, []);
end;

procedure TdmEventsImport.tblEventsImportBeforeDelete(DataSet: TDataSet);

var
  sMsg: String;

begin
  sMsg := '¿Seguro que quieres eliminar este evento?' + #13#10;
  if not DataSet.FieldByName('events_import_eventstbl_id').IsNull then begin
    sMsg := sMsg + 'Una vez borrado se podría recuperar descargando de nuevo el evento';
  end else begin
    sMsg := sMsg + 'La eliminación no se puede deshacer porque el evento no ha sido importado';
  end;

  if MessageDlg(sMsg, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
    Abort;
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_categories_idChange(
  Sender: TField);
begin
  if not dmImportData.ExistsList(Sender, 'categories', 'categories_id') then begin
    DatabaseError('La categoría no existe [' + Sender.AsString + ']');
  end;

  if Sender.AsString <> '' then begin
    UpdateCategories;
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_cities_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'cities', 'cities_id') then begin
    DatabaseError('La ciudad no existe [' + Sender.AsString + ']');
  end;

  if not Sender.IsNull then begin
    Sender.DataSet.FieldByName('users_import_cities_name').Clear;
  end;
  Sender.DataSet.FieldByName('users_import_cities_name').ReadOnly := not Sender.IsNull;
end;

procedure TdmEventsImport.tblEventsImportevents_import_content_formats_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'content_formats', 'content_formats_id') then begin
    DatabaseError('El formato no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_countries_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'countries', 'countries_id') then begin
    DatabaseError('El país no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_elements_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'elements', 'elements_id') then begin
    DatabaseError('El elemento no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_endChange(
  Sender: TField);
begin
  if Sender.AsDateTime <= Sender.DataSet.FieldByName('events_import_start').AsDateTime then begin
    DatabaseError('La fecha de fin debe ser posterior que la de inicio [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_languages_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'languages', 'languages_id') then begin
    DatabaseError('El idioma no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_provinces_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'provinces', 'provinces_id') then begin
    DatabaseError('La provincia no existe [' + Sender.AsString + ']');
  end;

  dmImportData.SetRegion(Sender.DataSet.FieldByName('events_import_regions_id'), Sender.AsInteger);
end;

procedure TdmEventsImport.tblEventsImportevents_import_regions_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'regions', 'regions_id') then begin
    DatabaseError('La región no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_startChange(
  Sender: TField);
begin
  if Sender.DataSet.FieldByName('events_import_end').IsNull then begin
    Exit;
  end;

  if Sender.AsDateTime >= Sender.DataSet.FieldByName('events_import_end').AsDateTime then begin
    DatabaseError('La fecha de inicio debe ser anterior que la de fin [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_usernameChange(
  Sender: TField);
begin
  if not (dmImportData.Exists(Sender, 'users', 'users_username') or dmImportData.Exists(Sender, 'users_import', 'users_import_username')) then begin
    DatabaseError('El username no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.tblEventsImportevents_import_users_elements_idChange(
  Sender: TField);
begin
  if not dmImportData.Exists(Sender, 'users_elements', 'users_elements_id') then begin
    DatabaseError('El username del elemento no existe [' + Sender.AsString + ']');
  end;
end;

procedure TdmEventsImport.UpdateCategories;
begin
  if bImporting then begin
    Exit;
  end;

  if sqlEventsImportCategories.Active then begin
    sqlEventsImportCategories.Close;
  end;
  sqlEventsImportCategories.Open;

  if sqlCategories.Active then begin
    sqlCategories.Close;
  end;
  sqlCategories.Open;
end;

procedure TdmEventsImport.UpdateCategoriesList;
begin
  sqlCategoriesList.Open;
  sqlCategoriesList.First;
  while not sqlCategoriesList.Eof do begin
    slCategories.Add(sqlCategoriesList.FieldByName('category').AsString + '=' +
      sqlCategoriesList.FieldByName('categories_id').AsString);
    sqlCategoriesList.Next;
  end;
  sqlCategoriesList.Close;
end;

end.
