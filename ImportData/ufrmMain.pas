unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ufrmUsersImport, ufrmEventsImport,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, udmImportData, udmUsersImport, udmEventsImport, Vcl.ComCtrls,
  FireDAC.Comp.BatchMove, Vcl.ExtDlgs, Vcl.DBCtrls, ufrmElements, ufrmUsersList,
  udmUsersElementsImport, ufrmUsersElementsImport, ufrmLogin;

type
  TfrmMain = class(TForm)
    mnuMain: TMainMenu;
    Introducirdatos1: TMenuItem;
    Usuarios1: TMenuItem;
    Eventos1: TMenuItem;
    Salir1: TMenuItem;
    ActionList1: TActionList;
    actExit: TAction;
    actUsersData: TAction;
    actEventsData: TAction;
    pnlUsers: TPanel;
    pnlEvents: TPanel;
    Label1: TLabel;
    dbgUsersImport: TDBGrid;
    Importardatos1: TMenuItem;
    actUsersImportCSV: TAction;
    UsuariosCSV1: TMenuItem;
    actEventsImportCSV: TAction;
    EventosCSV1: TMenuItem;
    dbgEventsImport: TDBGrid;
    actConnectToWhyuonApi: TAction;
    pbImport: TProgressBar;
    lblImportProgress: TLabel;
    Label2: TLabel;
    dlgImportCSV: TOpenTextFileDialog;
    actUserImportCSVSelection: TAction;
    actAddImportedUser: TAction;
    UsuariosaadirelseleccionadoalaBBDD1: TMenuItem;
    actEventImportCSVSelection: TAction;
    actAddImportedEvent: TAction;
    EventosaadirelseleccionadoalaBBDD1: TMenuItem;
    memImportLog: TMemo;
    actShowUsersImportCSVErrors: TAction;
    actShowEventsImportCSVErrors: TAction;
    ErroresdeeventosCSV1: TMenuItem;
    ErroresdeusuariosCSV1: TMenuItem;
    ConectaralaapideWhyuon1: TMenuItem;
    actEventsPanelView: TAction;
    actUsersPanelView: TAction;
    Mostrar1: TMenuItem;
    Paneldeusuarios1: TMenuItem;
    Paneldeeventos1: TMenuItem;
    actLinkEventsToUser: TAction;
    Eventosdelusuarioseleccionado1: TMenuItem;
    actDuplicateEvent: TAction;
    PopupMenu1: TPopupMenu;
    Duplicaeleventoseleccionado1: TMenuItem;
    PopupMenu2: TPopupMenu;
    actDuplicateUser: TAction;
    Duplicaelusuarioseleccionado1: TMenuItem;
    Duplicaeleventoseleccionado2: TMenuItem;
    Duplicaelusuarioseleccionado2: TMenuItem;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    actAddImportedEvents: TAction;
    actAddImportedUsers: TAction;
    UsuariosaadirlosseleccionadosalaBBDD1: TMenuItem;
    EventosaadirlosseleccionadosalaBBDD1: TMenuItem;
    actEventsSelectAll: TAction;
    actUsersSelectAll: TAction;
    Seleccionartodos1: TMenuItem;
    Seleccionartodos2: TMenuItem;
    actAbout: TAction;
    Acercade1: TMenuItem;
    actElements: TAction;
    Elementos1: TMenuItem;
    actDownloadUser: TAction;
    Descargarusuarioyadadodealta1: TMenuItem;
    edtUsersFilter: TEdit;
    pnlUsersElements: TPanel;
    Label3: TLabel;
    dbgUsersElementsImport: TDBGrid;
    DBNavigator3: TDBNavigator;
    actUsersElementData: TAction;
    Elementosdeusuario1: TMenuItem;
    actUsersElementsPanelView: TAction;
    Paneldeelementosdeusuario1: TMenuItem;
    actDownloadUserElements: TAction;
    Descargarelementosdeusuarioyadadodealta1: TMenuItem;
    actAddImportedUserElement: TAction;
    actAddImportedUsersElements: TAction;
    ElementosdeusuarioaadirelactualalaBBDD1: TMenuItem;
    ElementosdeusuarioaadirlosseleccionadosalaBBDD1: TMenuItem;
    actUsersElementsSelectAll: TAction;
    PopupMenu3: TPopupMenu;
    Seleccionartodos3: TMenuItem;
    actIniConfigLoad: TAction;
    Configuracin1: TMenuItem;
    Cargarconfiguracindeinicio1: TMenuItem;
    procedure actExitExecute(Sender: TObject);
    procedure actUsersDataExecute(Sender: TObject);
    procedure dbgUsersImportDblClick(Sender: TObject);
    procedure actUsersImportCSVExecute(Sender: TObject);
    procedure actConnectToWhyuonApiExecute(Sender: TObject);
    procedure actContinueUsersImportCSVExecute(Sender: TObject);
    procedure actAddImportedUserExecute(Sender: TObject);
    procedure actEventsDataExecute(Sender: TObject);
    procedure dbgEventsImportDblClick(Sender: TObject);
    procedure actEventsImportCSVExecute(Sender: TObject);
    procedure actUserImportCSVSelectionExecute(Sender: TObject);
    procedure actEventImportCSVSelectionExecute(Sender: TObject);
    procedure actAddImportedEventExecute(Sender: TObject);
    procedure Importardatos1Click(Sender: TObject);
    procedure memImportLogDblClick(Sender: TObject);
    procedure actShowUsersImportCSVErrorsExecute(Sender: TObject);
    procedure actShowEventsImportCSVErrorsExecute(Sender: TObject);
    procedure actUsersPanelViewExecute(Sender: TObject);
    procedure actEventsPanelViewExecute(Sender: TObject);
    procedure actLinkEventsToUserExecute(Sender: TObject);
    procedure actDuplicateEventExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actDuplicateUserExecute(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure actAddImportedUsersExecute(Sender: TObject);
    procedure actAddImportedEventsExecute(Sender: TObject);
    procedure actEventsSelectAllExecute(Sender: TObject);
    procedure actUsersSelectAllExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actElementsExecute(Sender: TObject);
    procedure ActionList1Execute(Action: TBasicAction; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actDownloadUserExecute(Sender: TObject);
    procedure edtUsersFilterChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgUsersElementsImportDblClick(Sender: TObject);
    procedure actUsersElementsPanelViewExecute(Sender: TObject);
    procedure actDownloadUserElementsExecute(Sender: TObject);
    procedure actUsersElementDataExecute(Sender: TObject);
    procedure actAddImportedUserElementExecute(Sender: TObject);
    procedure actAddImportedUsersElementsExecute(Sender: TObject);
    procedure actUsersElementsSelectAllExecute(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure actIniConfigLoadExecute(Sender: TObject);
  private
    frmUsersImport: TfrmUsersImport;
    frmEventsImport: TfrmEventsImport;
    frmElements: TfrmElements;
    frmUsersElementsImport: TfrmUsersElementsImport;
    FLogged: Boolean;

    procedure ShowErrorMemo(ctrlParent: TWinControl; slErrors: TStrings);
    procedure UsersImportProgress(ASender: TObject;
      APhase: TFDBatchMovePhase);
    procedure EventsImportProgress(ASender: TObject;
      APhase: TFDBatchMovePhase);
    function Login: Boolean;
    function GetLogged: Boolean;
    procedure ShowPanels;
  public
    property Logged: Boolean read GetLogged;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}


procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
  sMsg: String;

begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;

  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;

  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;

  sMsg := 'db: ' + dmImportData.connWhyuon.Params.Values['Server']+ ' (' +
    dmImportData.connWhyuon.Params.Values['Database'] + ')' + #13#10 +
    'api: ' + dmImportData.IniConfig['apiURL'] + #13#10 + #13#10 +
    Format('Versión %d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
    LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
    LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
    LongRec(FixedPtr.dwFileVersionLS).Lo]); //build

  ShowMessage(sMsg);
end;

procedure TfrmMain.actAddImportedEventExecute(Sender: TObject);

var
  nEventId: Integer;

begin
  nEventId := dmEventsImport.AddImportedEvent(dbgEventsImport.DataSource.DataSet.FieldByName('events_import_id').AsInteger);
  if nEventId <> -1 then begin
    ShowMessage('Evento importado añadido a la BBDD con el id: ' + IntToStr(nEventId));
  end else begin
    ShowMessage('Se produjo un error al añadir el evento importado a la BBDD' + #10#13 +
      '[' + dmImportData.WhyuonApiError + ']');
  end;
  dbgEventsImport.DataSource.DataSet.Refresh;
end;

procedure TfrmMain.actAddImportedEventsExecute(Sender: TObject);

var
  slIdList: TStringList;

begin
  slIdList := TStringList.Create;
  try
    dmImportData.IdBookmarkListToStringList(dbgEventsImport.SelectedRows,
      dbgEventsImport.DataSource.DataSet.FieldByName('events_import_id'),
      dbgEventsImport.DataSource.DataSet.FieldByName('events_import_imported'),
      slIdList);
    if slIdList.Count = 0 then begin
      ShowMessage('No hay ningún evento para importar');
      Exit;
    end;

    dmEventsImport.AddImportedEvents(slIdList);
    if slIdList.Count > 0 then begin
      ShowMessage('Eventos importados añadidos a la BBDD con los ids: ' + slIdList.CommaText);
    end else begin
      ShowMessage('Se produjo un error al añadir los eventos importados a la BBDD' + #10#13 +
        '[' + dmImportData.WhyuonApiError + ']');
    end;
  finally
    slIdList.Free;
    dbgEventsImport.DataSource.DataSet.Refresh;
  end;
end;

procedure TfrmMain.actAddImportedUserElementExecute(Sender: TObject);

var
  nUserId: Integer;

begin
  nUserId := dmUsersElementsImport.AddImportedUserElement(dbgUsersElementsImport.DataSource.DataSet.FieldByName('users_elements_import_id').AsInteger);
  if nUserId <> -1 then begin
    ShowMessage('Elemento de usuario importado añadido a la BBDD con el id: ' + IntToStr(nUserId));
  end else begin
    ShowMessage('Se produjo un error al añadir el elemento de usuario importado a la BBDD' + #10#13 +
      '[' + dmImportData.WhyuonApiError + ']');
  end;
  dbgUsersElementsImport.DataSource.DataSet.Refresh;
end;

procedure TfrmMain.actAddImportedUserExecute(Sender: TObject);

var
  nUserId: Integer;

begin
  nUserId := dmUsersImport.AddImportedUser(dbgUsersImport.DataSource.DataSet.FieldByName('users_import_id').AsInteger);
  if nUserId <> -1 then begin
    ShowMessage('Usuario importado añadido a la BBDD con el id: ' + IntToStr(nUserId));
  end else begin
    ShowMessage('Se produjo un error al añadir el usuario importado a la BBDD' + #10#13 +
      '[' + dmImportData.WhyuonApiError + ']');
  end;
  dbgUsersImport.DataSource.DataSet.Refresh;
end;

procedure TfrmMain.actAddImportedUsersElementsExecute(Sender: TObject);

var
  slIdList: TStringList;

begin
  slIdList := TStringList.Create;
  try
    dmImportData.IdBookmarkListToStringList(dbgUsersElementsImport.SelectedRows,
      dbgUsersElementsImport.DataSource.DataSet.FieldByName('users_elements_import_id'),
      dbgUsersElementsImport.DataSource.DataSet.FieldByName('users_elements_import_imported'),
      slIdList);
    if slIdList.Count = 0 then begin
      ShowMessage('No hay ningún elemento de usuario para importar');
      Exit;
    end;

    dmUsersElementsImport.AddImportedUsersElements(slIdList);
    if slIdList.Count > 0 then begin
      ShowMessage('Elementos de usuarios importados añadidos a la BBDD con los ids: ' + slIdList.CommaText);
    end else begin
      ShowMessage('Se produjo un error al añadir los elementos de usuarios importados a la BBDD' + #10#13 +
        '[' + dmImportData.WhyuonApiError + ']');
    end;
  finally
    slIdList.Free;
    dbgUsersElementsImport.DataSource.DataSet.Refresh;
  end;
end;

procedure TfrmMain.actAddImportedUsersExecute(Sender: TObject);

var
  slIdList: TStringList;

begin
  slIdList := TStringList.Create;
  try
    dmImportData.IdBookmarkListToStringList(dbgUsersImport.SelectedRows,
      dbgUsersImport.DataSource.DataSet.FieldByName('users_import_id'),
      dbgUsersImport.DataSource.DataSet.FieldByName('users_import_imported'),
      slIdList);
    if slIdList.Count = 0 then begin
      ShowMessage('No hay ningún usuario para importar');
      Exit;
    end;

    dmUsersImport.AddImportedUsers(slIdList);
    if slIdList.Count > 0 then begin
      ShowMessage('Usuarios importados añadidos a la BBDD con los ids: ' + slIdList.CommaText);
    end else begin
      ShowMessage('Se produjo un error al añadir los usuarios importados a la BBDD' + #10#13 +
        '[' + dmImportData.WhyuonApiError + ']');
    end;
  finally
    slIdList.Free;
    dbgUsersImport.DataSource.DataSet.Refresh;
  end;
end;

procedure TfrmMain.actConnectToWhyuonApiExecute(Sender: TObject);

var
  mrLogin: TModalResult;

begin
  mrLogin := TfrmLogin.ShowLogin;
  if (mrLogin = mrOk) and (dmImportData.LoggedUserId <> -1) then begin
    ShowMessage('Conexión establecida con la API');
    FLogged := True;
    actUsersPanelView.Execute;
    actEventsPanelView.Execute;
  end else if mrLogin <> mrCancel then begin
    ShowMessage('Error en la conexión con la API:' + #13#10 + #13#10 + dmImportData.WhyuonApiError);
  end;
end;

procedure TfrmMain.actContinueUsersImportCSVExecute(Sender: TObject);
begin
  actUsersImportCSV.Execute;
end;

procedure TfrmMain.actDownloadUserElementsExecute(Sender: TObject);

var
  sDownload: String;

begin
  if not Assigned(frmUsersList) then begin
    frmUsersList := TfrmUsersList.Create(Self);
  end;

  if frmUsersList.ShowModal = mrOk then begin
    sDownload := dmUsersElementsImport.DownloadUserElements(frmUsersList.UserId);
    if sDownload = '' then begin
      dbgUsersImport.DataSource.DataSet.Refresh;
      if dbgUsersElementsImport.DataSource.DataSet.Locate('users_elements_import_username', frmUsersList.Username, [loCaseInsensitive]) then begin
        ShowMessage('Usuario [' + frmUsersList.Username + '] descargado correctamente');
      end
      else begin
        ShowMessage('Ocurrió un error al descargar el usuario [' + frmUsersList.Username + ']');
      end;
    end
    else begin
      ShowMessage('Ocurrió un error al descargar el usuario [' + frmUsersList.Username + ']' +
        #13#10 + #13#10 + sDownload);
    end;
  end;
end;

procedure TfrmMain.actDownloadUserExecute(Sender: TObject);

var
  sDownload: String;

begin
  if not Assigned(frmUsersList) then begin
    frmUsersList := TfrmUsersList.Create(Self);
  end;

  if frmUsersList.ShowModal = mrOk then begin
    sDownload := dmUsersImport.DownloadUser(frmUsersList.UserId);
    if sDownload = '' then begin
      dbgUsersImport.DataSource.DataSet.Refresh;
      if dbgUsersImport.DataSource.DataSet.Locate('users_import_username', frmUsersList.Username, [loCaseInsensitive]) then begin
        ShowMessage('Usuario [' + frmUsersList.Username + '] descargado correctamente');
        if dmUsersImport.AddressIncomplete(frmUsersList.Username) then begin
          ShowMessage('La dirección del usuario descargado es incompleta, por favor revisa esa información');
          actUsersData.Execute;
        end;
      end
      else begin
        ShowMessage('Ocurrió un error al descargar el usuario [' + frmUsersList.Username + ']');
      end;
    end
    else begin
      ShowMessage('Ocurrió un error al descargar el usuario [' + frmUsersList.Username + ']' +
        #13#10 + #13#10 + sDownload);
    end;
  end;
end;

procedure TfrmMain.actDuplicateEventExecute(Sender: TObject);
begin
  dmEventsImport.DuplicateSelectedEvent;
  dbgEventsImport.DataSource.DataSet.Refresh;
  dbgEventsImport.DataSource.DataSet.Last;
end;

procedure TfrmMain.actDuplicateUserExecute(Sender: TObject);
begin
  dmUsersImport.DuplicateSelectedUser;
  dbgUsersImport.DataSource.DataSet.Refresh;
  dbgUsersImport.DataSource.DataSet.Last;
end;

procedure TfrmMain.actElementsExecute(Sender: TObject);
begin
  if not Assigned(frmElements) then
    frmElements := TfrmElements.Create(Self);

  frmElements.WindowState := TWindowState.wsNormal;
  frmElements.Show;
end;

procedure TfrmMain.actEventImportCSVSelectionExecute(Sender: TObject);
begin
  if not dlgImportCSV.Execute then begin
    dmEventsImport.bmvEventsImportReader.FileName := '';
    Exit;
  end;

  dmEventsImport.bmvEventsImportReader.FileName := dlgImportCSV.FileName;
end;

procedure TfrmMain.actEventsDataExecute(Sender: TObject);
begin
  if not Assigned(frmEventsImport) then
    frmEventsImport := TfrmEventsImport.Create(Self);

  frmEventsImport.WindowState := TWindowState.wsNormal;
  frmEventsImport.Show;
end;

procedure TfrmMain.actEventsImportCSVExecute(Sender: TObject);

var
  slCSV: TStringList;

begin
  actEventImportCSVSelection.Execute;
  if dmEventsImport.bmvEventsImportReader.FileName = '' then begin
    Exit;
  end;

  slCSV := TStringList.Create;
  try
    slCSV.LoadFromFile(dmEventsImport.bmvEventsImportReader.ActualFileName);
    pbImport.Max := slCSV.Count - 1;
    dmEventsImport.bmvEventsImport.AnalyzeSample := slCSV.Count;
  finally
    slCSV.Free;
  end;
  pbImport.Position := 0;
  pbImport.Show;
  lblImportProgress.Show;
  if not Assigned(dmEventsImport.EventsImportProgress) then begin
    dmEventsImport.EventsImportProgress := EventsImportProgress;
  end;
  dmEventsImport.ImportEventsCSV;
  ShowMessage('Leídos: ' + IntToStr(dmEventsImport.bmvEventsImport.ReadCount) + #10#13 +
    'Importados: ' + IntToStr(dmEventsImport.bmvEventsImport.InsertCount) + #10#13 +
    'Errores: ' + IntToStr(dmEventsImport.bmvEventsImport.ErrorCount));

  lblImportProgress.Hide;
  pbImport.Hide;
  lblImportProgress.Caption := '';
  pbImport.Position := 0;

  dbgEventsImport.DataSource.DataSet.Refresh;
  if dmEventsImport.bmvEventsImport.ErrorCount > 0 then begin
    ShowErrorMemo(pnlEvents, dmEventsImport.ImportErrors);
  end;
end;

procedure TfrmMain.actEventsPanelViewExecute(Sender: TObject);
begin
  ShowPanels;
end;

procedure TfrmMain.actEventsSelectAllExecute(Sender: TObject);
begin
  dbgEventsImport.DataSource.DataSet.First;
  while not dbgEventsImport.DataSource.DataSet.Eof do begin
    dbgEventsImport.SelectedRows.CurrentRowSelected := True;
    dbgEventsImport.DataSource.DataSet.Next;
  end;
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.actIniConfigLoadExecute(Sender: TObject);
begin
  dmImportData.LoadIniConfigFile;
end;

procedure TfrmMain.ActionList1Execute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if (Action = actExit) or (Action = actConnectToWhyuonApi) or (Action = actAbout) then begin
    Handled := False;
    Exit;
  end;

  if not Login then begin
    Handled := True;
    ShowMessage('Usuario o contraseña incorrectos');
  end;
end;

procedure TfrmMain.actLinkEventsToUserExecute(Sender: TObject);
begin
  if actLinkEventsToUser.Checked then begin
    dmEventsImport.tblEventsImport.MasterFields := 'users_import_username';
    dmEventsImport.tblEventsImport.IndexFieldNames := 'events_import_username';
    dmEventsImport.tblEventsImport.DetailFields := 'events_import_username';
    dmEventsImport.tblEventsImport.MasterSource := dbgUsersImport.DataSource;

    dmImportData.tblEventsImport.MasterFields := 'users_import_username';
    dmImportData.tblEventsImport.IndexFieldNames := 'events_import_username';
    dmImportData.tblEventsImport.DetailFields := 'events_import_username';
    dmImportData.tblEventsImport.MasterSource := dbgUsersImport.DataSource;

    dmUsersElementsImport.tblUsersElementsImport.MasterFields := 'users_import_username';
    dmUsersElementsImport.tblUsersElementsImport.IndexFieldNames := 'users_elements_import_username';
    dmUsersElementsImport.tblUsersElementsImport.DetailFields := 'users_elements_import_username';
    dmUsersElementsImport.tblUsersElementsImport.MasterSource := dbgUsersImport.DataSource;
  end else begin
    dmEventsImport.tblEventsImport.MasterSource := Nil;
    dmEventsImport.tblEventsImport.IndexFieldNames := 'events_import_id';

    dmImportData.tblEventsImport.MasterSource := Nil;
    dmImportData.tblEventsImport.IndexFieldNames := 'events_import_id';

    dmUsersElementsImport.tblUsersElementsImport.MasterSource := Nil;
    dmUsersElementsImport.tblUsersElementsImport.IndexFieldNames := 'users_elements_import_id';
  end;
end;

procedure TfrmMain.actShowEventsImportCSVErrorsExecute(Sender: TObject);
begin
  ShowErrorMemo(pnlEvents, dmEventsImport.ImportErrors);
end;

procedure TfrmMain.actShowUsersImportCSVErrorsExecute(Sender: TObject);
begin
  ShowErrorMemo(pnlUsers, dmUsersImport.ImportErrors);
end;

procedure TfrmMain.actUserImportCSVSelectionExecute(Sender: TObject);
begin
  if not dlgImportCSV.Execute then begin
    dmUsersImport.bmvUsersImportReader.FileName := '';
    Exit;
  end;

  dmUsersImport.bmvUsersImportReader.FileName := dlgImportCSV.FileName;
end;

procedure TfrmMain.actUsersDataExecute(Sender: TObject);
begin
  if not Assigned(frmUsersImport) then
    frmUsersImport := TfrmUsersImport.Create(Self);

  frmUsersImport.WindowState := TWindowState.wsNormal;
  frmUsersImport.Show;
end;

procedure TfrmMain.actUsersElementDataExecute(Sender: TObject);
begin
  if not Assigned(frmUsersElementsImport) then begin
    frmUsersElementsImport := TfrmUsersElementsImport.Create(Self);
  end;

  frmUsersElementsImport.WindowState := TWindowState.wsNormal;
  frmUsersElementsImport.Show;
end;

procedure TfrmMain.actUsersElementsPanelViewExecute(Sender: TObject);
begin
  actEventsPanelView.Checked := False;
  ShowPanels;
end;

procedure TfrmMain.actUsersElementsSelectAllExecute(Sender: TObject);
begin
  dbgUsersElementsImport.DataSource.DataSet.First;
  while not dbgUsersElementsImport.DataSource.DataSet.Eof do begin
    dbgUsersElementsImport.SelectedRows.CurrentRowSelected := True;
    dbgUsersElementsImport.DataSource.DataSet.Next;
  end;
end;

procedure TfrmMain.actUsersImportCSVExecute(Sender: TObject);

var
  slCSV: TStringList;

begin
  actUserImportCSVSelection.Execute;
  if dmUsersImport.bmvUsersImportReader.FileName = '' then begin
    Exit;
  end;

  slCSV := TStringList.Create;
  try
    slCSV.LoadFromFile(dmUsersImport.bmvUsersImportReader.ActualFileName);
    pbImport.Max := slCSV.Count - 1;
    dmUsersImport.bmvUsersImport.AnalyzeSample := slCSV.Count;
  finally
    slCSV.Free;
  end;
  pbImport.Position := 0;
  pbImport.Show;
  lblImportProgress.Show;
  if not Assigned(dmUsersImport.UsersImportProgress) then begin
    dmUsersImport.UsersImportProgress := UsersImportProgress;
  end;
  dmUsersImport.ImportUsersCSV;
  ShowMessage('Leídos: ' + IntToStr(dmUsersImport.bmvUsersImport.ReadCount) + #10#13 +
    'Importados: ' + IntToStr(dmUsersImport.bmvUsersImport.InsertCount) + #10#13 +
    'Errores: ' + IntToStr(dmUsersImport.bmvUsersImport.ErrorCount));

  lblImportProgress.Hide;
  pbImport.Hide;
  lblImportProgress.Caption := '';
  pbImport.Position := 0;

  dbgUsersImport.DataSource.DataSet.Refresh;
  if dmUsersImport.bmvUsersImport.ErrorCount > 0 then begin
    ShowErrorMemo(pnlUsers, dmUsersImport.ImportErrors);
  end;
end;

procedure TfrmMain.actUsersPanelViewExecute(Sender: TObject);
begin
  ShowPanels;
end;

procedure TfrmMain.actUsersSelectAllExecute(Sender: TObject);
begin
  dbgUsersImport.DataSource.DataSet.First;
  while not dbgUsersImport.DataSource.DataSet.Eof do begin
    dbgUsersImport.SelectedRows.CurrentRowSelected := True;
    dbgUsersImport.DataSource.DataSet.Next;
  end;
end;

procedure TfrmMain.dbgEventsImportDblClick(Sender: TObject);
begin
  if dbgEventsImport.DataSource.DataSet.RecordCount = 0 then begin
    Exit;
  end;

  actEventsData.Execute;
end;

procedure TfrmMain.dbgUsersElementsImportDblClick(Sender: TObject);
begin
  if dbgUsersElementsImport.DataSource.DataSet.RecordCount = 0 then begin
    Exit;
  end;

  actUsersElementData.Execute;
end;

procedure TfrmMain.dbgUsersImportDblClick(Sender: TObject);
begin
  if dbgUsersImport.DataSource.DataSet.RecordCount = 0 then begin
    Exit;
  end;

  actUsersData.Execute;
end;

procedure TfrmMain.edtUsersFilterChange(Sender: TObject);
begin
  if Trim(edtUsersFilter.Text) = '' then begin
    dbgUsersImport.DataSource.DataSet.Filtered := False;
    Exit;
  end;

  dbgUsersImport.DataSource.DataSet.Filter := Format('(users_import_username like %0:s) ' +
    'or (users_import_email like %0:s) ' +
    'or (users_import_nickname like %0:s)', [QuotedStr('%' + edtUsersFilter.Text + '%')]);
  dbgUsersImport.DataSource.DataSet.Filtered := True;
end;

procedure TfrmMain.EventsImportProgress(ASender: TObject;
  APhase: TFDBatchMovePhase);
begin
  pbImport.Position := dmEventsImport.bmvEventsImport.ReadCount;
  case APhase of
    psPreparing: lblImportProgress.Caption := 'Preparando la importación de datos';
    psStarting: lblImportProgress.Caption := 'Comenzando la importación de datos';
    psProgress: lblImportProgress.Caption := dmEventsImport.bmvEventsImportReader.ActualFileName +
      ' (' + IntToStr(Round(100 * pbImport.Position / pbImport.Max)) + '%)';
    psFinishing: lblImportProgress.Caption := 'Terminando la importación de datos';
    psUnpreparing: ;
  end;

  Application.ProcessMessages;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  dbgUsersImport.DataSource.DataSet.Refresh;
  dbgEventsImport.DataSource.DataSet.Refresh;
  dbgUsersElementsImport.DataSource.DataSet.Refresh;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  actUsersPanelView.Checked := not actConnectToWhyuonApi.Enabled;
  actEventsPanelView.Checked := not actConnectToWhyuonApi.Enabled;
  actUsersElementsPanelView.Checked := False;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ShowPanels;
end;

function TfrmMain.GetLogged: Boolean;
begin
  Result := FLogged;
end;

procedure TfrmMain.Importardatos1Click(Sender: TObject);
begin
  actAddImportedUser.Enabled := pnlUsers.Visible and dmImportData.AppUserAdmin
    and (TImportedState(dbgUsersImport.DataSource.DataSet.FieldByName('users_import_imported').AsInteger) <> TImportedState.isImported)
    and (dbgUsersImport.SelectedRows.Count <= 1);
  actAddImportedUsers.Enabled := pnlUsers.Visible and dmImportData.AppUserAdmin and (dbgUsersImport.SelectedRows.Count > 1);
  actShowUsersImportCSVErrors.Enabled := dmUsersImport.ImportErrors.Count > 0;
  actAddImportedEvent.Enabled := pnlEvents.Visible and dmImportData.AppUserAdmin
    and (TImportedState(dbgEventsImport.DataSource.DataSet.FieldByName('events_import_imported').AsInteger) <> TImportedState.isImported)
    and (dbgEventsImport.SelectedRows.Count <= 1);
  actAddImportedEvents.Enabled := pnlEvents.Visible and dmImportData.AppUserAdmin and (dbgEventsImport.SelectedRows.Count > 1);
  actShowEventsImportCSVErrors.Enabled := dmEventsImport.ImportErrors.Count > 0;
  actAddImportedUserElement.Enabled := pnlUsersElements.Visible and dmImportData.AppUserAdmin
    and (TImportedState(dbgUsersElementsImport.DataSource.DataSet.FieldByName('users_elements_import_imported').AsInteger) <> TImportedState.isImported)
    and (dbgUsersElementsImport.SelectedRows.Count <= 1);
  actAddImportedUsersElements.Enabled := pnlUsersElements.Visible and dmImportData.AppUserAdmin and (dbgUsersElementsImport.SelectedRows.Count > 1);
end;

function TfrmMain.Login: Boolean;
begin
  if not actConnectToWhyuonApi.Enabled then begin
    FLogged := True;
    Result := True;

    Exit;
  end;

  if not FLogged then begin
    actConnectToWhyuonApi.Execute;
  end;
  FLogged := dmImportData.ValidToken;
  if FLogged then begin
    Caption := 'Import data [' + dmImportData.LoggedUserUsername + ']';
  end;

  Result := FLogged;
end;

procedure TfrmMain.memImportLogDblClick(Sender: TObject);
begin
  memImportLog.Hide;
  edtUsersFilter.Show;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
  actDuplicateEvent.Enabled := dbgEventsImport.SelectedRows.Count = 1;
  actEventsSelectAll.Enabled := (dbgEventsImport.DataSource.DataSet.RecordCount > 1)
    and (dbgEventsImport.DataSource.DataSet.RecordCount > dbgEventsImport.SelectedRows.Count);
end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
  actDuplicateUser.Enabled := dbgUsersImport.SelectedRows.Count = 1;
  actUsersSelectAll.Enabled := (dbgUsersImport.DataSource.DataSet.RecordCount > 1)
    and (dbgUsersImport.DataSource.DataSet.RecordCount > dbgUsersImport.SelectedRows.Count);
end;

procedure TfrmMain.PopupMenu3Popup(Sender: TObject);
begin
  actUsersElementsSelectAll.Enabled := (dbgUsersElementsImport.DataSource.DataSet.RecordCount > 1)
    and (dbgUsersElementsImport.DataSource.DataSet.RecordCount > dbgUsersElementsImport.SelectedRows.Count);
end;

procedure TfrmMain.ShowErrorMemo(ctrlParent: TWinControl; slErrors: TStrings);
begin
  edtUsersFilter.Hide;
  memImportLog.Parent := ctrlParent;
  memImportLog.Align := TAlign.alClient;
  memImportLog.Lines.Assign(slErrors);
  memImportLog.Show;
end;

procedure TfrmMain.ShowPanels;
begin
  if actEventsPanelView.Checked then begin
    if pnlUsers.Visible then begin
      pnlUsers.Align := TAlign.alTop;
      pnlUsers.Height := 300;
    end;
    pnlEvents.Align := TAlign.alClient;
  end else begin
    pnlUsers.Align := TAlign.alClient;
  end;
  pnlEvents.Visible := actEventsPanelView.Checked;

  if actEventsPanelView.Checked then begin
    actUsersElementsPanelView.Checked := False;
  end;
  if actUsersElementsPanelView.Checked then begin
    if pnlUsers.Visible then begin
      pnlUsers.Align := TAlign.alTop;
      pnlUsers.Height := 300;
    end;
    pnlUsersElements.Align := TAlign.alClient;
  end else begin
    pnlUsers.Align := TAlign.alClient;
  end;
  pnlUsersElements.Visible := actUsersElementsPanelView.Checked;
  if actUsersElementsPanelView.Checked then begin
    actEventsPanelView.Checked := False;
  end;

  if actUsersPanelView.Checked then begin
    if pnlEvents.Visible or pnlUsersElements.Visible then begin
      pnlUsers.Align := TAlign.alTop;
      pnlUsers.Height := 300;
    end else begin
      pnlUsers.Align := TAlign.alClient;
    end;
  end
  else if pnlEvents.Visible then begin
    pnlEvents.Align := TAlign.alClient;
  end
  else if pnlUsersElements.Visible then begin
    pnlUsersElements.Align := TAlign.alClient;
  end;
  pnlUsers.Visible := actUsersPanelView.Checked;
end;

procedure TfrmMain.UsersImportProgress(ASender: TObject;
  APhase: TFDBatchMovePhase);
begin
  pbImport.Position := dmUsersImport.bmvUsersImport.ReadCount;
  case APhase of
    psPreparing: lblImportProgress.Caption := 'Preparando la importación de datos';
    psStarting: lblImportProgress.Caption := 'Comenzando la importación de datos';
    psProgress: lblImportProgress.Caption := dmUsersImport.bmvUsersImportReader.ActualFileName +
      ' (' + IntToStr(Round(100 * pbImport.Position / pbImport.Max)) + '%)';
    psFinishing: lblImportProgress.Caption := 'Terminando la importación de datos';
    psUnpreparing: ;
  end;

  Application.ProcessMessages;
end;

end.
