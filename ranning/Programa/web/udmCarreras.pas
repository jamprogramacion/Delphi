unit udmCarreras;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, ZConnection, Db,
  ZAbstractRODataset, ZDataset, DBWeb;

type
  TdmCarreras = class(TWebModule)
    dbRanning: TZConnection;
    htmlTblCarreras: TDataSetTableProducer;
    sqlCarreras: TZReadOnlyQuery;
    htmlwCarreras: TPageProducer;
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure dmCarreraswactCarrerasAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlTblCarrerasFormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure WebModuleCreate(Sender: TObject);
    procedure sqlCarrerasBeforeOpen(DataSet: TDataSet);
    procedure htmlwCarrerasHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure WebModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCarreras: TdmCarreras;

implementation

uses uComun;

{$R *.DFM}

procedure TdmCarreras.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmCarreras.dmCarreraswactCarrerasAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);
  if not sqlCarreras.Active then sqlCarreras.Open;
  Response.ContentType := 'text/html';
  Response.Content := htmlwCarreras.Content;
end;

procedure TdmCarreras.htmlTblCarrerasFormatCell(Sender: TObject; CellRow,
  CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
  var VAlign: THTMLVAlign; var CustomAttrs, CellData: String);
begin
  if CellRow <> 0 then begin
    if ItFieldMarked(htmlTblCarreras.DataSet,'it_tenemos_inscripcion') then begin
      if CustomAttrs = '' then
        CustomAttrs := 'class="productos_rojo"'
      else
        Insert(' productos_rojo',CustomAttrs,Length(CustomAttrs));
    end;
    if (LowerCase(htmlTblCarreras.Columns[CellColumn].FieldName) = 'ds_carrera') and
       (htmlTblCarreras.DataSet.FieldByName('ds_pagina_web').AsString <> '') then
      CellData := ConvertToLink(CellData,
        htmlTblCarreras.DataSet.FieldByName('ds_pagina_web').AsString,'','_blank')
    else if LowerCase(htmlTblCarreras.Columns[CellColumn].FieldName) = 'observaciones' then
      CellData := MemoATextoWeb(TMemoField(htmlTblCarreras.Columns[CellColumn].Field))
    else if (LowerCase(htmlTblCarreras.Columns[CellColumn].FieldName) = 'precio') and
         (not htmlTblCarreras.Columns[CellColumn].Field.IsNull) then
      CellData := CellData + ' �';
  end;
end;

procedure TdmCarreras.WebModuleCreate(Sender: TObject);
begin
  htmlwCarreras.HTMLFile := PATH_PLANTILLAS + 'wcarreras.php';
end;

procedure TdmCarreras.sqlCarrerasBeforeOpen(DataSet: TDataSet);
begin
  sqlCarreras.Params.ParamByName('f_fecha').AsDateTime := Date;
end;

procedure TdmCarreras.htmlwCarrerasHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'carreras' then
    ReplaceText := htmlTblCarreras.Content
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file']);
end;

procedure TdmCarreras.WebModuleDestroy(Sender: TObject);
begin
  dbRanning.Disconnect;
end;

end.
