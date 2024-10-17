unit ufrmEventsImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, udmImportData,
  udmEventsImport, Vcl.StdCtrls, Vcl.Mask, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.ComCtrls, Data.DB, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.Grids, Vcl.DBGrids;

type
  TfrmEventsImport = class(TForm)
    dbnvEventsImport: TDBNavigator;
    pnlAddress: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit8: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    PopupMenu1: TPopupMenu;
    Borrarlaseleccin1: TMenuItem;
    ActionList1: TActionList;
    actLookupCombosDelete: TAction;
    lblEventImported: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    edtUsername: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label20: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel2: TPanel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    edtStart: TDBEdit;
    Label12: TLabel;
    edtEnd: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    edtStartCalendar: TDateTimePicker;
    edtEndCalendar: TDateTimePicker;
    DBLookupComboBox2: TDBLookupComboBox;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    lbCategories: TListBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    actCategoriesDelete: TAction;
    actCategoriesAdd: TAction;
    btnCategoriesDelete: TButton;
    btnCategoriesAdd: TButton;
    lbCategoriesSelect: TListBox;
    BindSourceDB2: TBindSourceDB;
    Label3: TLabel;
    LinkFillControlToField2: TLinkFillControlToField;
    BindSourceDB3: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    btnUsersList: TButton;
    dbgImages: TDBGrid;
    dlgImages: TOpenDialog;
    MainMenu1: TMainMenu;
    Verocultarimgenes1: TMenuItem;
    actShowImages: TAction;
    procedure DBLookupComboBox6ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure actLookupCombosDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actCategoriesDeleteExecute(Sender: TObject);
    procedure actCategoriesAddExecute(Sender: TObject);
    procedure lbCategoriesClick(Sender: TObject);
    procedure lbCategoriesSelectClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnUsersListClick(Sender: TObject);
    procedure dbgImagesTitleClick(Column: TColumn);
    procedure actShowImagesExecute(Sender: TObject);
    procedure dbnvEventsImportClick(Sender: TObject; Button: TNavigateBtn);
  private
    procedure EventsImportDataChange(Sender: TObject; Field: TField);
    procedure SetDBNavButtons;
    procedure SetActiveControls;
    procedure RefreshIMages;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  System.StrUtils, ufrmUsersList;

procedure TfrmEventsImport.actCategoriesAddExecute(Sender: TObject);

var
  nCategory: Integer;

begin
  if lbCategoriesSelect.SelCount = 0 then begin
    Exit;
  end;

  for nCategory := 0 to lbCategoriesSelect.Count - 1 do begin
    if lbCategoriesSelect.Selected[nCategory] then begin
      lbCategories.Items.Add(lbCategoriesSelect.Items[nCategory]);
    end;
  end;
  dmEventsImport.SaveCategories(lbCategories.Items);
end;

procedure TfrmEventsImport.actCategoriesDeleteExecute(Sender: TObject);
begin
  if lbCategories.SelCount = 0 then begin
    Exit;
  end;

  lbCategories.DeleteSelected;
  dmEventsImport.SaveCategories(lbCategories.Items);
end;

procedure TfrmEventsImport.actLookupCombosDeleteExecute(Sender: TObject);

var
  dbcbDelete: TDBLookupComboBox;

begin
  dbcbDelete := TDBLookupComboBox(Self.ActiveControl);
  if not(dbcbDelete.DataSource.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then begin
    dbcbDelete.DataSource.DataSet.Edit;
  end;
  dbcbDelete.Field.Clear;
end;

procedure TfrmEventsImport.actShowImagesExecute(Sender: TObject);
begin
  dbgImages.Align := TAlign.alClient;
  if not dbgImages.Visible then begin
    RefreshImages;
  end;
  dbgImages.Visible := not dbgImages.Visible;
end;

procedure TfrmEventsImport.btnUsersListClick(Sender: TObject);
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

procedure TfrmEventsImport.dbgImagesTitleClick(Column: TColumn);

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
  if dmEventsImport.EventImported > TImportedState.isImportAll then begin
    if MessageDlg('Este usuario ya ha sido importado y se eliminará la imagen actual de manera irrecuperable.' + #10#13 + '¿Aún así quieres modificar la imagen?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
      Exit;
    end;
  end;

  if dbnvEventsImport.DataSource.DataSet.State in [dsEdit, dsInsert] then begin
    ShowMessage('Antes de subir una imagen debes grabar los cambios');
    Exit;
  end;

  sUsername := Column.Field.DataSet.FieldByName('events_import_username').AsString;
  sUserImageImportIdField := 'events_import_objects_import_';
  if Column.FieldName = 'import_stela_name' then begin
    itUserImage := TImageType.itEventStela;
    sUserImageImportIdField := sUserImageImportIdField + 'stela_id';
  end
  else if Column.FieldName = 'import_poster_name' then begin
    itUserImage := TImageType.itEventPoster;
    sUserImageImportIdField := sUserImageImportIdField + 'poster_id';
  end
  else begin
    ShowMessage('Las imágenes que están en el servidor no se pueden cambiar.' + #10#13 +
      'Pulsa en la cabecera correspondiente de imagen importada');
    Exit;
  end;

  sUserImageIdField := ReplaceStr(sUserImageImportIdField, 'objects_import', 'objects');
  if not (Column.Field.IsNull and dmEventsImport.tblEventsImport.FieldByName(sUserImageIdField).IsNull) then begin
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
        if not (dmEventsImport.tblEventsImport.State in [dsEdit, dsInsert]) then begin
          dmEventsImport.CanEditImported := True;
          dmEventsImport.tblEventsImport.Edit;
        end;
        dmEventsImport.tblEventsImport.FieldByName(sUserImageImportIdField).AsLargeInt := nObjectId;
        dmEventsImport.tblEventsImport.FieldByName(sUserImageIdField).Clear;
        if dmEventsImport.EventImported = TImportedState.isImported then begin
          dmEventsImport.tblEventsImport.FieldByName('events_import_imported').AsInteger := 2;
        end;
        dmEventsImport.tblEventsImport.Post;
      finally
          dmEventsImport.CanEditImported := False;
      end;
    end
    else begin
      ShowMessage('La imagen no se subió al servidor');
    end;
  end;
end;

procedure TfrmEventsImport.DBLookupComboBox6ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  TDBLookupComboBox(Sender).SetFocus;
end;

procedure TfrmEventsImport.dbnvEventsImportClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = TNavigateBtn.nbRefresh then begin
    RefreshImages;
  end;
end;

procedure TfrmEventsImport.EventsImportDataChange(Sender: TObject;
  Field: TField);
begin
  SetDBNavButtons;
  SetActiveControls;
end;

procedure TfrmEventsImport.FormActivate(Sender: TObject);
begin
  dbnvEventsImport.DataSource.DataSet.Refresh;
  dbnvEventsImport.DataSource.DataSet.Locate('events_import_id', dmImportData.tblEventsImport.FieldByName('events_import_id').AsInteger, []);
  SetDBNavButtons;
  SetActiveControls;
  if dbgImages.Visible then begin
    RefreshImages;
  end;
end;

procedure TfrmEventsImport.FormCreate(Sender: TObject);
begin
  dmEventsImport.OnEventsImportDataChange := EventsImportDataChange;
end;

procedure TfrmEventsImport.FormDeactivate(Sender: TObject);
begin
  dmEventsImport.tblEventsImport.Refresh;
end;

procedure TfrmEventsImport.lbCategoriesClick(Sender: TObject);
begin
  btnCategoriesDelete.Enabled := lbCategories.SelCount > 0;
end;

procedure TfrmEventsImport.lbCategoriesSelectClick(Sender: TObject);
begin
  btnCategoriesAdd.Enabled := lbCategoriesSelect.SelCount > 0;
end;

procedure TfrmEventsImport.RefreshIMages;
begin
  dbgImages.DataSource.DataSet.Close;
  dbgImages.DataSource.DataSet.Open;
end;

procedure TfrmEventsImport.SetActiveControls;
begin
  edtStartCalendar.Enabled := dmEventsImport.EventImported = TImportedState.isImportAll;
  edtEndCalendar.Enabled := dmEventsImport.EventImported = TImportedState.isImportAll;
  btnCategoriesDelete.Enabled := (lbCategories.SelCount > 0) and (dmEventsImport.EventImported = TImportedState.isImportAll);
  btnCategoriesAdd.Enabled := (lbCategoriesSelect.SelCount > 0) and (dmEventsImport.EventImported = TImportedState.isImportAll);
  lblEventImported.Visible := not dmEventsImport.tblEventsImport.FieldByName('events_import_eventstbl_id').IsNull;
  btnUsersList.Enabled := dmEventsImport.EventImported = TImportedState.isImportAll;
end;

procedure TfrmEventsImport.SetDBNavButtons;
begin
  if dmEventsImport.EventImported > TImportedState.isImportAll then begin
    dbnvEventsImport.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbRefresh];
  end
  else begin
    dbnvEventsImport.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbPost,nbCancel,nbRefresh];
  end;
end;

end.
