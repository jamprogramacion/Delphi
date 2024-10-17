unit ufrmElements;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmElements, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  System.Actions, Vcl.ActnList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.ExtDlgs;

type
  TfrmElements = class(TForm)
    dbnvEventsImport: TDBNavigator;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtElementsCode: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    edtElementsName: TDBEdit;
    Label4: TLabel;
    edtElementsDesc: TDBEdit;
    dbgElementsContentFormats: TDBGrid;
    dbgElementsElementsTypes: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgContentFormats: TDBGrid;
    dbgElementTypes: TDBGrid;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Button3: TButton;
    Panel10: TPanel;
    Button4: TButton;
    ActionList1: TActionList;
    actDeleteFormat: TAction;
    actDeleteType: TAction;
    actAddFormat: TAction;
    actAddType: TAction;
    Panel11: TPanel;
    DBGrid2: TDBGrid;
    dlgImages: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure edtElementsNameDblClick(Sender: TObject);
    procedure edtElementsDescDblClick(Sender: TObject);
    procedure actAddFormatExecute(Sender: TObject);
    procedure actAddTypeExecute(Sender: TObject);
    procedure actDeleteFormatExecute(Sender: TObject);
    procedure actDeleteTypeExecute(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
  private
    dmElements: TdmElements;

    procedure ChangeTranslation(fldTranslation: TField; const sTranslationCode: String);
    procedure AddTranslation(fldTranslation: TField; const sTranslationCode: String);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  System.StrUtils, System.UITypes, udmImportData;

const
  TRANSLATIONS_CODE_NAME = 'tc_*_name';
  TRANSLATIONS_CODE_DESC = 'tc_*_desc';

procedure TfrmElements.actAddFormatExecute(Sender: TObject);
begin
  if dbgElementsContentFormats.DataSource.DataSet.Locate('elements_content_formats_content_formats_id', dbgContentFormats.DataSource.DataSet.FieldByName('content_formats_id').AsString, []) then begin
    ShowMessage('El elemento ya contiene este formato');
    if not dbgContentFormats.DataSource.DataSet.Eof then begin
      dbgContentFormats.DataSource.DataSet.Next;
    end;
    Exit;
  end;

  dmElements.AddElementContentFormat;
  if not dbgContentFormats.DataSource.DataSet.Eof then begin
    dbgContentFormats.DataSource.DataSet.Next;
  end;
end;

procedure TfrmElements.actAddTypeExecute(Sender: TObject);
begin
  if dbgElementsElementsTypes.DataSource.DataSet.Locate('elements_elements_types_elements_types_id', dbgElementTypes.DataSource.DataSet.FieldByName('elements_types_id').AsString, []) then begin
    ShowMessage('El elemento ya contiene este tipo');
    if not dbgElementTypes.DataSource.DataSet.Eof then begin
      dbgElementTypes.DataSource.DataSet.Next;
    end;
    Exit;
  end;

  dmElements.AddElementElementType;
  if not dbgElementTypes.DataSource.DataSet.Eof then begin
    dbgElementTypes.DataSource.DataSet.Next;
  end;
end;

procedure TfrmElements.actDeleteFormatExecute(Sender: TObject);
begin
  if dbgElementsContentFormats.DataSource.DataSet.RecordCount = 0 then begin
    Exit;
  end;

  dmElements.DeleteElementContentFormat;
end;

procedure TfrmElements.actDeleteTypeExecute(Sender: TObject);
begin
  if dbgElementsElementsTypes.DataSource.DataSet.RecordCount = 0 then begin
    Exit;
  end;

  dmElements.DeleteElementElementType;
end;

procedure TfrmElements.AddTranslation(fldTranslation: TField;
  const sTranslationCode: String);

var
  sText: String;

begin
  sText := '';
  if InputQuery('Introduce el texto', fldTranslation.DisplayName, sText) then begin
    dmElements.AddTranslation(fldTranslation, sTranslationCode, sText);
  end;
end;

procedure TfrmElements.ChangeTranslation(fldTranslation: TField;
  const sTranslationCode: String);

var
  sNewText: String;

begin
  sNewText := fldTranslation.AsString;
  if InputQuery('Introduce el nuevo texto', fldTranslation.DisplayName, sNewText) then begin
    dmElements.ChangeTranslation(sTranslationCode, sNewText);
  end;
end;

procedure TfrmElements.DBGrid2TitleClick(Column: TColumn);

var
  itElementImage: TElementImageType;
  sFileName: TFileName;
  sName: String;
  sSHA256: String;
  sElementImageIdField: String;
  sObjectId: Int64;

begin
  if not Column.Field.IsNull then begin
    if MessageDlg('La imagen ya existe. ¿Quieres subir una nueva?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrNo then begin
      Exit;
    end;
  end;

  itElementImage := TImageType.itElementImage;
  sName := edtElementsName.Text;
  sElementImageIdField := 'elements_objects_';
  if Column.FieldName = 'img_path' then begin
    itElementImage := TImageType.itElementImage;
    sName := 'Imagen de ' + sName;
    sElementImageIdField := sElementImageIdField + 'img_id';
  end
  else if Column.FieldName = 'stela_path' then begin
    itElementImage := TImageType.itElementStela;
    sName := 'Estela de ' + sName;
    sElementImageIdField := sElementImageIdField + 'stela_id';
  end
  else if Column.FieldName = 'poster_path' then begin
    itElementImage := TImageType.itElementPoster;
    sName := 'Cartel de ' + sName;
    sElementImageIdField := sElementImageIdField + 'poster_id';
  end
  else if Column.FieldName = 'icon_path' then begin
    itElementImage := TImageType.itElementIcon;
    sName := 'Icono de ' + sName;
    sElementImageIdField := sElementImageIdField + 'icon_id';
  end;
  sFileName := ReplaceStr(edtElementsCode.Text, udmElements.ELEMENTS_CODE_SUFIX, udmImportData.IMG_TYPE_NAMES[itElementImage] + '_');

  dlgImages.Title := 'Elige la ' + Column.Title.Caption;
  if dlgImages.Execute then begin
    sFileName := LowerCase(sFileName) + ExtractFileExt(dlgImages.FileName);
    sSHA256 := dmImportData.UploadImage(dlgImages.FileName, sFileName, itElementImage);
    if sSHA256 <> '' then begin
      ShowMessage('Imagen subida al servidor como [' + sFileName + ']');
      sObjectId := dmElements.AddObject('[ftp]' + sFileName, sName, sName, sName, sSHA256);
      if not (dmElements.tblElements.State in [dsEdit, dsInsert]) then begin
        dmElements.tblElements.Edit;
      end;
      dmElements.tblElements.FieldByName(sElementImageIdField).AsLargeInt := sObjectId;
    end
    else begin
      ShowMessage('La imagen no se subió al servidor');
    end;
  end;
end;

procedure TfrmElements.edtElementsDescDblClick(Sender: TObject);

var
  sTranslationCode: String;

begin
  if Trim(edtElementsCode.Text) = ELEMENTS_CODE_SUFIX then begin
    ShowMessage('El código del elemento debe tener algo más que [' + udmElements.ELEMENTS_CODE_SUFIX + ']');
    Exit;
  end;

  sTranslationCode := edtElementsDesc.DataSource.DataSet.FieldByName('elements_desc_tc').AsString;
  if sTranslationCode <> '' then begin
    ChangeTranslation(edtElementsDesc.Field, sTranslationCode);
  end
  else begin
    sTranslationCode := ReplaceStr(TRANSLATIONS_CODE_DESC, '*', Lowercase(edtElementsCode.Text));
    AddTranslation(edtElementsDesc.DataSource.DataSet.FieldByName('elements_desc_tc'), sTranslationCode);
  end;
end;

procedure TfrmElements.edtElementsNameDblClick(Sender: TObject);

var
  sTranslationCode: String;

begin
  if Trim(edtElementsCode.Text) = ELEMENTS_CODE_SUFIX then begin
    ShowMessage('El código del elemento debe tener algo más que [' + udmElements.ELEMENTS_CODE_SUFIX + ']');
    Exit;
  end;

  sTranslationCode := edtElementsName.DataSource.DataSet.FieldByName('elements_name_tc').AsString;
  if sTranslationCode <> '' then begin
    ChangeTranslation(edtElementsName.Field, sTranslationCode);
  end
  else begin
    sTranslationCode := ReplaceStr(TRANSLATIONS_CODE_NAME, '*', Lowercase(edtElementsCode.Text));
    AddTranslation(edtElementsName.DataSource.DataSet.FieldByName('elements_name_tc'), sTranslationCode);
  end;
end;

procedure TfrmElements.FormCreate(Sender: TObject);
begin
  dmElements := TdmElements.Create(Self);
end;

end.
