unit udmVacaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, ZConnection, Db,
  ZAbstractRODataset, ZDataset;

type
  TdmVacaciones = class(TWebModule)
    dbRanning: TZConnection;
    htmlwVacaciones: TPageProducer;
    sqlVacaciones: TZReadOnlyQuery;
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure WebModuleCreate(Sender: TObject);
    procedure htmlwVacacionesHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmVacacioneswactVacacionesAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    function TablaDiasLibres: string;
  public
    { Public declarations }
  end;

var
  dmVacaciones: TdmVacaciones;

implementation

{$R *.DFM}

uses uComun;

procedure TdmVacaciones.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmVacaciones.WebModuleCreate(Sender: TObject);
begin
  htmlwVacaciones.HTMLFile := PATH_PLANTILLAS + 'wvacaciones.php';
end;

procedure TdmVacaciones.htmlwVacacionesHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'dias_libres' then
    ReplaceText := TablaDiasLibres
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file']);
end;

procedure TdmVacaciones.dmVacacioneswactVacacionesAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.ContentType := 'text/html';
  Response.Content := htmlwVacaciones.Content;
end;

function TdmVacaciones.TablaDiasLibres: string;

var
  sTabla: string;

begin
  sTabla := '';
  if sqlVacaciones.Active then sqlVacaciones.Close;
  sqlVacaciones.Open;
  sqlVacaciones.First;
  while not sqlVacaciones.Eof do begin
    sTabla := sTabla + '<tr>' + SALTO_LINEA;
    sTabla := sTabla + '<td>' + FormatDateTime('dddddd',
      sqlVacaciones.FieldByName('f_desde').AsDateTime) + '</td>' + SALTO_LINEA +
      '<td>' + FormatDateTime('dddddd',
      sqlVacaciones.FieldByName('f_hasta').AsDateTime) + '</td>' + SALTO_LINEA +
      '</tr>' + SALTO_LINEA;
    sqlVacaciones.Next;
  end;

  Result := sTabla;
end;

end.
