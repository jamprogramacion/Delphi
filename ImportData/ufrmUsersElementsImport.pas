unit ufrmUsersElementsImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  udmUsersElementsImport, udmImportData, Vcl.Mask, Vcl.Menus, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUsersElementsImport = class(TForm)
    dbnvUsersElementsImport: TDBNavigator;
    lblUserElementsImported: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgImages: TDBGrid;
    Label1: TLabel;
    edtUsername: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    dlgImages: TOpenDialog;
    btnUsersList: TButton;
    procedure FormActivate(Sender: TObject);
    procedure dbgImagesTitleClick(Column: TColumn);
    procedure btnUsersListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetDBNavButtons;
    procedure SetActiveControls;
    procedure RefreshImages;
    procedure UsersElementsImportDataChange(Sender: TObject; Field: TField);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  System.StrUtils, ufrmUsersList;

procedure TfrmUsersElementsImport.btnUsersListClick(Sender: TObject);
begin
  if not Assigned(frmUsersList) then begin
    frmUsersList := TfrmUsersList.Create(Self);
  end;

  if frmUsersList.ShowModal = mrOk then begin
    if not (edtUsername.DataSource.DataSet.State in [TDataSetState.dsEdit, dsInsert]) then begin
      edtUsername.DataSource.DataSet.Edit;
    end;
    if edtUsername.DataSource.DataSet.State in [TDataSetState.dsEdit, dsInsert] then begin
      edtUsername.Field.AsString := frmUsersList.Username;
    end;
  end;
end;

procedure TfrmUsersElementsImport.dbgImagesTitleClick(Column: TColumn);

var
  itUserImage: TUserOwnerImageType;
  sFileName: TFileName;
  sImageName: String;
  sUserImageImportIdField: String;
  sUserImageIdField: String;
  nObjectId: Int64;
  sUsername: String;
  rcrdImage: TUploadedFile;

begin
  if dmUsersElementsImport.UserElementImported > TImportedState.isImportAll then begin
    if MessageDlg('Este elemento de usuario ya ha sido importado y se eliminará la imagen actual de manera irrecuperable.' + #10#13 + '¿Aún así quieres modificar la imagen?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
      Exit;
    end;
  end;

  if dbnvUsersElementsImport.DataSource.DataSet.State in [dsEdit, dsInsert] then begin
    ShowMessage('Antes de subir una imagen debes grabar los cambios');
    Exit;
  end;

  sUsername := Column.Field.DataSet.FieldByName('users_elements_import_username').AsString;
  sUserImageImportIdField := 'users_elements_import_objects_import_';
  if Column.FieldName = 'import_stela_name' then begin
    itUserImage := TImageType.itUserElementStela;
    sUserImageImportIdField := sUserImageImportIdField + 'stela_id';
  end
  else begin
    ShowMessage('Las imágenes que están en el servidor no se pueden cambiar.' + #10#13 +
      'Pulsa en la cabecera correspondiente de imagen importada');
    Exit;
  end;

  sUserImageIdField := ReplaceStr(sUserImageImportIdField, 'objects_import', 'objects');
  if not (Column.Field.IsNull and dmUsersElementsImport.tblUsersElementsImport.FieldByName(sUserImageIdField).IsNull) then begin
    if MessageDlg('La imagen ya existe. ¿Quieres subir una nueva?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
      Exit;
    end;
  end;

  sImageName := IMG_TYPE_DISPLAY_NAMES[itUserImage] + ' ';
  if not InputQuery('Introduce un nombre para identificar la imagen', Column.Title.Caption, sImageName) then begin
    Exit;
  end;

  dlgImages.Title := 'Elige la ' + Column.Title.Caption;
  if dlgImages.Execute then begin
    sFileName := dlgImages.FileName;
    rcrdImage := dmImportData.UploadImage(sUsername, sFileName, itUserImage, True);
    if rcrdImage.Error in [ufeOK, ufeObjectsExistsBBDD] then begin
      if rcrdImage.Error = ufeOK then begin
        ShowMessage('Imagen subida al servidor como [' + ExtractFileName(ReplaceStr(rcrdImage.sPath, '/', PathDelim)) + ']');
        nObjectId := dmImportData.AddImportObject(sUsername, rcrdImage.sPath, sImageName, rcrdImage.sSHA256, itUserImage);
      end
      else begin
        ShowMessage('La imagen ya existe en la BBDD');
        nObjectId := rcrdImage.nObjectId;
      end;
      try
        if not (dmUsersElementsImport.tblUsersElementsImport.State in [dsEdit, dsInsert]) then begin
          dmUsersElementsImport.CanEditImported := True;
          dmUsersElementsImport.tblUsersElementsImport.Edit;
        end;
        dmUsersElementsImport.tblUsersElementsImport.FieldByName(sUserImageImportIdField).AsLargeInt := nObjectId;
        dmUsersElementsImport.tblUsersElementsImport.FieldByName(sUserImageIdField).Clear;
        if dmUsersElementsImport.UserElementImported = TImportedState.isImported then begin
          dmUsersElementsImport.tblUsersElementsImport.FieldByName('users_elements_import_imported').AsInteger := 2;
        end;
        dmUsersElementsImport.tblUsersElementsImport.Post;
      finally
        dmUsersElementsImport.CanEditImported := False;
      end;
    end
    else begin
      ShowMessage('La imagen no se subió al servidor');
    end;
  end;
end;

procedure TfrmUsersElementsImport.FormActivate(Sender: TObject);
begin
  dbnvUsersElementsImport.DataSource.DataSet.Refresh;
  SetDBNavButtons;
  SetActiveControls;
  RefreshImages;
end;

procedure TfrmUsersElementsImport.FormCreate(Sender: TObject);
begin
  dmUsersElementsImport.evntOnUsersElementsImportDataChange := UsersElementsImportDataChange;
end;

procedure TfrmUsersElementsImport.RefreshImages;
begin
  dbgImages.DataSource.DataSet.Close;
  dbgImages.DataSource.DataSet.Open;
end;

procedure TfrmUsersElementsImport.SetActiveControls;
begin
  lblUserElementsImported.Visible := dmUsersElementsImport.UserElementImported > TImportedState.isImportAll;
end;

procedure TfrmUsersElementsImport.SetDBNavButtons;
begin
  if dmUsersElementsImport.UserElementImported > TImportedState.isImportAll then begin
    dbnvUsersElementsImport.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbRefresh];
  end
  else begin
    dbnvUsersElementsImport.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbPost,nbCancel,nbRefresh];
  end;
end;


procedure TfrmUsersElementsImport.UsersElementsImportDataChange(Sender: TObject;
  Field: TField);
begin
  SetDBNavButtons;
  SetActiveControls;
  RefreshImages;
end;

end.
