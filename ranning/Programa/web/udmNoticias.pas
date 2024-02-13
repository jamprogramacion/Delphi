unit udmNoticias;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, ZConnection, Db,
  ZAbstractRODataset, ZDataset, DBWeb;

type
  TdmNoticias = class(TWebModule)
    dbRanning: TZConnection;
    sqlNoticias: TZReadOnlyQuery;
    htmlTblNoticias: TDataSetTableProducer;
    htmlwNoticias: TPageProducer;
    htmlNoticiaDetalle: TPageProducer;
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure htmlTblNoticiasFormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure htmlwNoticiasHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmNoticiaswactNoticiasAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure dmNoticiaswactNoticiasDetalleAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlNoticiaDetalleHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
  private
    function ImagenNoticia(sImg: TFileName): TFileName;
  public
    { Public declarations }
  end;

var
  dmNoticias: TdmNoticias;

implementation

uses uComun;

{$R *.DFM}

const
  {$ifdef local}
  PATH_NOTICIAS = '..\_images\noticias\';
  {$endif}
  {$ifdef web}
  PATH_NOTICIAS = 'd:\xvrt\ranning.com\html\_images\noticias\';
  {$endif}
  HTML_NOTICIAS = HTML_IMAGES + 'noticias/';

procedure TdmNoticias.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmNoticias.htmlTblNoticiasFormatCell(Sender: TObject; CellRow,
  CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
  var VAlign: THTMLVAlign; var CustomAttrs, CellData: String);
begin
  if CellRow <> 0 then begin
    if LowerCase(htmlTblNoticias.Columns[CellColumn].FieldName) = 'ds_titular' then
      CellData := '<a href="javascript:void(0);" type="text/html" ' +
        'onclick="javascript:imagenProducto(' +
        QuotedStr('../wwwNoticias.exe/wnoticia_detalle?id=' +
        sqlNoticias.FieldByName('id_noticia').AsString) + ',' +
        QuotedStr('Ocurrió el día ' + sqlNoticias.FieldByName('f_suceso').AsString) +
        ');">' + CellData + '</a>';
  end;
end;

procedure TdmNoticias.htmlwNoticiasHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'noticias' then
    ReplaceText := htmlTblNoticias.Content;
end;

procedure TdmNoticias.dmNoticiaswactNoticiasAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);
  if not sqlNoticias.Active then sqlNoticias.Open;
  Response.ContentType := 'text/html';
  Response.Content := '<html>' + htmlwNoticias.Content + '</html>';
end;

procedure TdmNoticias.dmNoticiaswactNoticiasDetalleAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);
  Response.ContentType := 'text/html';
  Response.Content := htmlNoticiaDetalle.Content;
end;

procedure TdmNoticias.htmlNoticiaDetalleHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);

var
  sImg: TFileName;

begin
  if not sqlNoticias.Active then sqlNoticias.Open;
  if LowerCase(TagString) = 'noticia' then begin
    sqlNoticias.Locate('id_noticia',Request.QueryFields.Values['id'],[]);
    ReplaceText := MemoATextoWeb(TMemoField(sqlNoticias.FieldByName('ds_noticia')));
  end
  else if LowerCase(TagString) = 'imagen' then begin
    sImg := Trim(sqlNoticias.FieldByName('ds_imagen').AsString);
    if sImg <> '' then
      ReplaceText := '<img class="con_borde_fino" src="' + ImagenNoticia(sImg) +
        '">';
  end;
end;

function TdmNoticias.ImagenNoticia(sImg: TFileName): TFileName;
begin
  {
  if FileOpen(PATH_NOTICIAS + sImg,fmOpenRead or fmShareDenyNone) <> -1 then
    sImg := HTML_NOTICIAS + sImg
  else
    sImg := IMG_NO_DISPONIBLE;

  Result := StringReplace(sImg,'\','/',[rfReplaceAll]);
  }
end;

procedure TdmNoticias.WebModuleCreate(Sender: TObject);
begin
  dbRanning.Connect;
  htmlwNoticias.HTMLFile := PATH_PLANTILLAS + 'wnoticias.htm';
  htmlNoticiaDetalle.HTMLFile := PATH_PLANTILLAS + 'wnoticia_detalle.htm';
end;

procedure TdmNoticias.WebModuleDestroy(Sender: TObject);
begin
  dbRanning.Disconnect;
end;

end.
