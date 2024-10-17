unit udmElements;

interface

uses
  System.SysUtils, System.Classes, udmImportData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

const
  ELEMENTS_CODE_SUFIX = 'ELEMENTS_';

type
  TdmElements = class(TDataModule)
    tblElements: TFDTable;
    dsElements: TDataSource;
    sqlElementsTranslationsName: TFDQuery;
    tblElementselements_id: TFDAutoIncField;
    tblElementselements_objects_stela_id: TLongWordField;
    tblElementselements_objects_img_id: TLongWordField;
    tblElementselements_objects_icon_id: TLongWordField;
    tblElementselements_code: TWideStringField;
    tblElementselements_name_tc: TWideStringField;
    tblElementselements_desc_tc: TWideStringField;
    tblElementselements_user_url_template: TWideStringField;
    tblElementselements_stamp: TDateTimeField;
    tblElementselements_objects_poster_id: TLongWordField;
    sqlElementsTranslationsNameelement_name: TWideStringField;
    tblElementselements_name: TStringField;
    tblElementselements_desc: TStringField;
    sqlContentFormatsTranslations: TFDQuery;
    dsContentFormatsTranslations: TDataSource;
    sqlContentFormatsTranslationscontent_formats_id: TWordField;
    sqlContentFormatsTranslationscontent_formats_name: TWideStringField;
    sqlContentFormatsTranslationscontent_formats_desc: TWideStringField;
    sqlElementsTypesTranslations: TFDQuery;
    dsElementsTypesTranslations: TDataSource;
    sqlElementsTypesTranslationselements_types_id: TWordField;
    sqlElementsTypesTranslationselements_types_name: TWideStringField;
    sqlElementsTypesTranslationselements_types_desc: TWideStringField;
    sqlElementsContentFormats: TFDQuery;
    dsElementsContentFormats: TDataSource;
    sqlElementsContentFormatselements_content_formats_elements_id: TLongWordField;
    sqlElementsContentFormatscontent_formats_name: TWideStringField;
    sqlElementsContentFormatscontent_formats_desc: TWideStringField;
    sqlElementsElementsTypes: TFDQuery;
    dsElementsElementsTypes: TDataSource;
    sqlElementsElementsTypeselements_elements_types_elements_id: TLongWordField;
    sqlElementsElementsTypeselements_types_name: TWideStringField;
    sqlElementsElementsTypeselements_types_desc: TWideStringField;
    sqlElementsContentFormatsInsert: TFDCommand;
    tblTranslations: TFDTable;
    tblTranslationstranslations_id: TFDAutoIncField;
    tblTranslationstranslations_languages_id: TWordField;
    tblTranslationstranslations_code: TWideStringField;
    tblTranslationstranslations_text: TWideMemoField;
    tblTranslationstranslations_objects_id: TLongWordField;
    tblTranslationstranslations_max_length: TLongWordField;
    sqlElementsTranslationsDesc: TFDQuery;
    WideStringField4: TWideStringField;
    sqlElementsTranslationsNametranslations_code: TWideStringField;
    sqlElementsTranslationsDesctranslations_code: TWideStringField;
    sqlElementsContentFormatselements_content_formats_content_formats_id: TWordField;
    sqlElementsElementsTypeselements_elements_types_elements_types_id: TWordField;
    sqlElementsContentFormatsDelete: TFDCommand;
    sqlElementsContentFormatselements_content_formats_id: TLongWordField;
    sqlElementsElementsTypeselements_elements_types_id: TLongWordField;
    sqlElementsElementsTypesInsert: TFDCommand;
    sqlElementsElementsTypesDelete: TFDCommand;
    sqlElementsObjects: TFDQuery;
    dsElementsObjects: TDataSource;
    sqlElementsObjectselements_id: TFDAutoIncField;
    sqlElementsObjectsimg_path: TWideStringField;
    sqlElementsObjectsimg_name: TWideStringField;
    sqlElementsObjectsstela_path: TWideStringField;
    sqlElementsObjectsstela_name: TWideStringField;
    sqlElementsObjectsposter_path: TWideStringField;
    sqlElementsObjectsposter_name: TWideStringField;
    sqlElementsObjectsicon_path: TWideStringField;
    sqlElementsObjectsicon_name: TWideStringField;
    tblObjects: TFDTable;
    tblObjectsobjects_id: TFDAutoIncField;
    tblObjectsobjects_levels_id: TWordField;
    tblObjectsobjects_languages_id: TWordField;
    tblObjectsobjects_visibility: TByteField;
    tblObjectsobjects_path: TWideStringField;
    tblObjectsobjects_name: TWideStringField;
    tblObjectsobjects_long_name: TWideStringField;
    tblObjectsobjects_desc: TWideStringField;
    tblObjectsobjects_sha256: TWideStringField;
    tblObjectsobjects_last_mod: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tblElementsAfterInsert(DataSet: TDataSet);
    procedure tblElementselements_codeChange(Sender: TField);
    procedure tblElementsBeforePost(DataSet: TDataSet);
    procedure tblElementsAfterPost(DataSet: TDataSet);
  private
  public
    procedure ChangeTranslation(const sTranslationCode: String; const sNewText: String);
    procedure AddTranslation(fldTranslation: TField; const sTranslationCode: String; const sText: String);
    procedure AddElementContentFormat();
    procedure DeleteElementContentFormat();
    procedure AddElementElementType();
    procedure DeleteElementElementType();
    function AddObject(const sPath, sName, sLongName, sDesc, sSHA256: String; nVisibility: Byte = 1): Int64;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Vcl.Dialogs;

procedure TdmElements.AddElementContentFormat;
begin
  sqlElementsContentFormatsInsert.Params.ParamByName('elements_id').Value := tblElements.FieldByName('elements_id').AsString;
  sqlElementsContentFormatsInsert.Params.ParamByName('content_formats_id').Value := sqlContentFormatsTranslations.FieldByName('content_formats_id').AsString;
  sqlElementsContentFormatsInsert.Execute;
  sqlElementsContentFormats.Refresh;
end;

procedure TdmElements.AddElementElementType;
begin
  sqlElementsElementsTypesInsert.Params.ParamByName('elements_id').Value := tblElements.FieldByName('elements_id').AsString;
  sqlElementsElementsTypesInsert.Params.ParamByName('elements_types_id').Value := sqlElementsTypesTranslations.FieldByName('elements_types_id').AsString;
  sqlElementsElementsTypesInsert.Execute;
  sqlElementsElementsTypes.Refresh;
end;

function TdmElements.AddObject(const sPath, sName, sLongName, sDesc,
  sSHA256: String; nVisibility: Byte): Int64;
begin
  if not tblObjects.Active then begin
    tblObjects.Open;
  end;
  tblObjects.Insert;
  tblObjects.FieldByName('objects_path').AsString := sPath;
  tblObjects.FieldByName('objects_name').AsString := sName;
  tblObjects.FieldByName('objects_long_name').AsString := sLongName;
  tblObjects.FieldByName('objects_desc').AsString := sDesc;
  tblObjects.FieldByName('objects_sha256').AsString := sSHA256;
  tblObjects.FieldByName('objects_visibility').AsInteger := nVisibility;
  tblObjects.Post;

  Result := tblObjects.FieldByName('objects_id').AsLargeInt;
end;

procedure TdmElements.AddTranslation(fldTranslation: TField; const sTranslationCode, sText: String);
begin
  try
    tblTranslations.Insert;
    tblTranslations.FieldByName('translations_languages_id').AsInteger := udmImportData.LANG_ID_SPANISH;
    tblTranslations.FieldByName('translations_code').AsString := sTranslationCode;
    tblTranslations.FieldByName('translations_text').AsString := sText;
    tblTranslations.Post;
  except
    tblTranslations.Cancel;
  end;
  sqlElementsTranslationsName.Refresh;
  sqlElementsTranslationsDesc.Refresh;
  fldTranslation.AsString := sTranslationCode;
  tblElements.FieldByName('elements_name').RefreshLookupList;
  tblElements.FieldByName('elements_desc').RefreshLookupList;
end;

procedure TdmElements.ChangeTranslation(const sTranslationCode: String;
  const sNewText: String);
begin
  if not tblTranslations.FindKey([sTranslationCode, 0]) then begin
    Exit;
  end;

  try
    tblTranslations.Edit;
    tblTranslations.FieldByName('translations_text').AsString := sNewText;
    tblTranslations.Post;
  except
    tblTranslations.Cancel;
  end;
  sqlElementsTranslationsName.Refresh;
  sqlElementsTranslationsDesc.Refresh;
  tblElements.Refresh;
end;

procedure TdmElements.DataModuleCreate(Sender: TObject);
begin
  sqlElementsTranslationsName.Open;
  sqlElementsTranslationsDesc.Open;
  sqlContentFormatsTranslations.Open;
  sqlElementsTypesTranslations.Open;
  tblElements.Open;
  sqlElementsContentFormats.Prepare;
  sqlElementsContentFormats.Open;
  sqlElementsElementsTypes.Prepare;
  sqlElementsElementsTypes.Open;
  tblTranslations.Open;
  sqlElementsObjects.Open;
end;

procedure TdmElements.DeleteElementContentFormat;
begin
  sqlElementsContentFormatsDelete.Params.ParamByName('id').Value := sqlElementsContentFormats.FieldByName('elements_content_formats_id').AsString;
  sqlElementsContentFormatsDelete.Execute;
  sqlElementsContentFormats.Refresh;
end;

procedure TdmElements.DeleteElementElementType;
begin
  sqlElementsElementsTypesDelete.Params.ParamByName('id').Value := sqlElementsElementsTypes.FieldByName('elements_elements_types_id').AsString;
  sqlElementsElementsTypesDelete.Execute;
  sqlElementsElementsTypes.Refresh;
end;

procedure TdmElements.tblElementsAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('elements_code').AsString := 'ELEMENTS_';
end;

procedure TdmElements.tblElementsAfterPost(DataSet: TDataSet);
begin
  sqlElementsObjects.Close;
  sqlElementsObjects.Open;
end;

procedure TdmElements.tblElementsBeforePost(DataSet: TDataSet);
begin
  if Trim(DataSet.FieldByName('elements_code').AsString) = ELEMENTS_CODE_SUFIX then begin
    DatabaseError('El código del elemento debe tener algo más que [' + udmElements.ELEMENTS_CODE_SUFIX + ']');
  end;
end;

procedure TdmElements.tblElementselements_codeChange(Sender: TField);
begin
  if Sender.AsString.IndexOf(ELEMENTS_CODE_SUFIX) <> 0 then begin
    Sender.AsString := ELEMENTS_CODE_SUFIX + Sender.AsString;
  end;
end;

end.
