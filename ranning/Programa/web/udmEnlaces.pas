unit udmEnlaces;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, ZConnection, Db,
  ZAbstractRODataset, ZDataset;

type
  TdmEnlaces = class(TWebModule)
    dbRanning: TZConnection;
    htmlwEnlaces: TPageProducer;
    sqlEnlaces: TZReadOnlyQuery;
    sqlMarcas: TZReadOnlyQuery;
    procedure dmEnlacesWebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure WebModuleCreate(Sender: TObject);
    procedure htmlwEnlacesHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure WebModuleDestroy(Sender: TObject);
  private
    function TablaMarcas: string;
  public
    { Public declarations }
  end;

var
  dmEnlaces: TdmEnlaces;

implementation

uses uComun;

{$R *.DFM}

procedure TdmEnlaces.dmEnlacesWebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);
  Response.ContentType := 'text/html';
  Response.Content := htmlwEnlaces.Content;
end;

procedure TdmEnlaces.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmEnlaces.WebModuleCreate(Sender: TObject);
begin
  dbRanning.Connect;
  htmlwEnlaces.HTMLFile := PATH_PLANTILLAS + 'wenlaces.php';
end;

procedure TdmEnlaces.htmlwEnlacesHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'marcas' then
    ReplaceText := TablaMarcas
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file']);
end;

function TdmEnlaces.TablaMarcas: string;

const
  MARCAS_FILA: Integer = 9;

var
  sAux: string;
  nCont: Integer;
  slPos: TStringList;
  nPos: Integer;
  nRanas: Integer;

begin
  Randomize;
  sAux := '<tr>';
  if not sqlEnlaces.Active then sqlEnlaces.Open;
  sqlEnlaces.First;
  if (sqlEnlaces.RecordCount mod MARCAS_FILA) = 0 then
    nRanas := 0
  else
    nRanas := MARCAS_FILA * (sqlEnlaces.RecordCount div MARCAS_FILA + 1) -
      sqlEnlaces.RecordCount;
  slPos := TStringList.Create;
  try
    while slPos.Count < nRanas do begin
      nPos := Round(Random(MARCAS_FILA *
        (sqlEnlaces.RecordCount div MARCAS_FILA + 1) - 1)) + 1;
      if (slPos.IndexOf(IntToStr(nPos)) = -1) and
         (slPos.IndexOf(IntToStr(nPos - 1)) = -1) and
         (slPos.IndexOf(IntToStr(nPos + 1)) = -1)then slPos.Add(IntToStr(nPos));
    end;
    nCont := 0;
    while not sqlEnlaces.Eof do begin
      if (nCont <> 0) and ((nCont mod MARCAS_FILA) = 0) then
        sAux := sAux + '</tr>' + SALTO_LINEA + '<tr>';
      if slPos.IndexOf(IntToStr(nCont + 1)) <> -1 then begin
        sAux := sAux + '<td><img class="rana_inquieta" src="' +
          HTML_IMAGES + 'rana.gif" width="80" height="80"></a></td>' +
          SALTO_LINEA;
        Inc(nCont);
      end;
      if (nCont <> 0) and ((nCont mod MARCAS_FILA) = 0) then
        sAux := sAux + '</tr>' + SALTO_LINEA + '<tr>';
      sAux := sAux + '<td><a href="' + sqlEnlaces.FieldByName('ds_web').AsString +
        '" target="_blank"><img class="con_borde_fino" src="' +
        ImagenMarca(sqlEnlaces.FieldByName('cd_marca').AsString) + '" width="80" ' +
        'height="80" title="' + sqlEnlaces.FieldByName('ds_marca').AsString +
        '"></a></td>' + SALTO_LINEA;
      Inc(nCont);
      sqlEnlaces.Next;
    end;
  finally
    slPos.Free;
  end;

  Result := sAux;
end;


procedure TdmEnlaces.WebModuleDestroy(Sender: TObject);
begin
  dbRanning.Disconnect;
end;

end.
