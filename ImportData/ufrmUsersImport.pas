unit ufrmUsersImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmImportData, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  udmUsersImport, Vcl.Menus, System.Actions, Vcl.ActnList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.Buttons;

type
  TfrmUsersImport = class(TForm)
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    dbnvUsersImport: TDBNavigator;
    lblUserImported: TLabel;
    DBEdit8: TDBEdit;
    pnlAddress: TPanel;
    pnlUserData: TPanel;
    pnlBrandCompany: TPanel;
    pnlUserApp: TPanel;
    Label1: TLabel;
    edtUsername: TDBEdit;
    Label2: TLabel;
    edtEmail: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label20: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label8: TLabel;
    edtBirthDate: TDBEdit;
    edtBirthDateCalendar: TDateTimePicker;
    Label12: TLabel;
    Label25: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    actLookupCombosDelete: TAction;
    Borrarlaseleccin1: TMenuItem;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    dbgImages: TDBGrid;
    MainMenu1: TMainMenu;
    actShowImages: TAction;
    Verocultarimgenes1: TMenuItem;
    dlgImages: TOpenDialog;
    DBRadioGroup3: TDBRadioGroup;
    Label26: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actLookupCombosDeleteExecute(Sender: TObject);
    procedure DBLookupComboBoxContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormDeactivate(Sender: TObject);
    procedure actShowImagesExecute(Sender: TObject);
    procedure dbgImagesTitleClick(Column: TColumn);
    procedure dbnvUsersImportClick(Sender: TObject; Button: TNavigateBtn);
  private
    procedure SetDBNavButtons;
    procedure SetActiveControls;
    procedure UsersImportDataChange(Sender: TObject; Field: TField);
    procedure RefreshImages;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  System.StrUtils, System.UITypes;

procedure TfrmUsersImport.FormActivate(Sender: TObject);
begin
  dbnvUsersImport.DataSource.DataSet.Refresh;
  dbnvUsersImport.DataSource.DataSet.Locate('users_import_id', dmImportData.tblUsersImport.FieldByName('users_import_id').AsInteger, []);
  SetDBNavButtons;
  SetActiveControls;
  if dbgImages.Visible then begin
    RefreshImages;
  end;
end;

procedure TfrmUsersImport.FormCreate(Sender: TObject);
begin
  dmUsersImport.OnUsersImportDataChange := UsersImportDataChange;
end;

procedure TfrmUsersImport.FormDeactivate(Sender: TObject);
begin
  dmUsersImport.tblUsersImport.Refresh;
end;

procedure TfrmUsersImport.RefreshImages;
begin
  dbgImages.DataSource.DataSet.Close;
  dbgImages.DataSource.DataSet.Open;
end;

procedure TfrmUsersImport.SetActiveControls;

var
  bExpired: Boolean;

begin
  bExpired := dmUsersImport.UserImportDateExpired;
  //edtBirthDateCalendar.Enabled := dmUsersImport.UserImported = TImportedState.isImportAll;
  if not bExpired then begin
    lblUserImported.Caption := 'Este usuario ya ha sido importado, las modificaciones sobreescribirán los datos del usuario cuando se importe de nuevo';
  end else begin
    lblUserImported.Caption := udmUsersImport.MSG_USER_DATA_EXPIRED;
  end;
  lblUserImported.Visible := not dmUsersImport.tblUsersImport.FieldByName('users_import_users_id').IsNull;
  edtUsername.ShowHint := dmUsersImport.UserImported > TImportedState.isImportAll;
  edtEmail.ShowHint := dmUsersImport.UserImported > TImportedState.isImportAll;
  actShowImages.Enabled := not bExpired;
end;

procedure TfrmUsersImport.SetDBNavButtons;
begin
  {
  if dmUsersImport.UserImported > TImportedState.isImportAll then begin
    dbnvUsersImport.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbRefresh];
  end
  else begin
    dbnvUsersImport.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbPost,nbCancel,nbRefresh];
  end;
  }
end;

procedure TfrmUsersImport.UsersImportDataChange(Sender: TObject; Field: TField);
begin
  SetDBNavButtons;
  SetActiveControls;
end;

procedure TfrmUsersImport.actLookupCombosDeleteExecute(Sender: TObject);

var
  dbcbDelete: TDBLookupComboBox;

begin
  dbcbDelete := TDBLookupComboBox(Self.ActiveControl);
  if not(dbcbDelete.DataSource.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then begin
    dbcbDelete.DataSource.DataSet.Edit;
  end;
  dbcbDelete.Field.Clear;
end;

procedure TfrmUsersImport.actShowImagesExecute(Sender: TObject);
begin
  dbgImages.Align := TAlign.alClient;
  if not dbgImages.Visible then begin
    RefreshImages;
  end;
  dbgImages.Visible := not dbgImages.Visible;
end;

procedure TfrmUsersImport.dbgImagesTitleClick(Column: TColumn);

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
  if dmUsersImport.UserImported > TImportedState.isImportAll then begin
    if MessageDlg('Este usuario ya ha sido importado y se eliminará la imagen actual de manera irrecuperable.' + #10#13 + '¿Aún así quieres modificar la imagen?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
      Exit;
    end;
  end;

  if dbnvUsersImport.DataSource.DataSet.State in [dsEdit, dsInsert] then begin
    ShowMessage('Antes de subir una imagen debes grabar los cambios');
    Exit;
  end;

  sUsername := Column.Field.DataSet.FieldByName('users_import_username').AsString;
  sUserImageImportIdField := 'users_import_objects_import_';
  if Column.FieldName = 'import_img_name' then begin
    itUserImage := TImageType.itImage;
    sUserImageImportIdField := sUserImageImportIdField + 'img_id';
  end
  else if Column.FieldName = 'import_stela_name' then begin
    itUserImage := TImageType.itStela;
    sUserImageImportIdField := sUserImageImportIdField + 'stela_id';
  end
  else if Column.FieldName = 'import_poster_name' then begin
    itUserImage := TImageType.itPoster;
    sUserImageImportIdField := sUserImageImportIdField + 'poster_id';
  end
  else if Column.FieldName = 'import_public_stela_name' then begin
    itUserImage := TImageType.itPublicStela;
    sUserImageImportIdField := sUserImageImportIdField + 'public_stela_id';
  end
  else begin
    ShowMessage('Las imágenes que están en el servidor no se pueden cambiar.' + #10#13 +
      'Pulsa en la cabecera correspondiente de imagen importada');
    Exit;
  end;

  sUserImageIdField := ReplaceStr(sUserImageImportIdField, 'objects_import', 'objects');
  if not (Column.Field.IsNull and dmUsersImport.tblUsersImport.FieldByName(sUserImageIdField).IsNull) then begin
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
        if not (dmUsersImport.tblUsersImport.State in [dsEdit, dsInsert]) then begin
          dmUsersImport.CanEditImported := True;
          dmUsersImport.tblUsersImport.Edit;
        end;
        dmUsersImport.tblUsersImport.FieldByName(sUserImageImportIdField).AsLargeInt := nObjectId;
        dmUsersImport.tblUsersImport.FieldByName(sUserImageIdField).Clear;
        if dmUsersImport.UserImported = TImportedState.isImported then begin
          dmUsersImport.tblUsersImport.FieldByName('users_import_imported').AsInteger := 2;
        end;
        dmUsersImport.tblUsersImport.Post;
      finally
        dmUsersImport.CanEditImported := False;
      end;
    end
    else begin
      ShowMessage('La imagen no se subió al servidor');
    end;
  end;
end;

procedure TfrmUsersImport.DBLookupComboBoxContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  TDBLookupComboBox(Sender).SetFocus;
end;

procedure TfrmUsersImport.dbnvUsersImportClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = TNavigateBtn.nbRefresh then begin
    RefreshImages;
  end;
end;

end.
