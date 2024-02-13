unit udmEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp;

type
  TdmEntrada = class(TWebModule)
    htmlEntrada: TPageProducer;
    htmlEntradaMjp: TPageProducer;
    procedure dmEntradawactEntradaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure htmlEntradaHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    function CadenaConsulta(const sConsulta, sReplChar: string): string; 
  public
    { Public declarations }
  end;

var
  dmEntrada: TdmEntrada;

implementation

uses uComun;

{$R *.DFM}

procedure TdmEntrada.dmEntradawactEntradaAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.ContentType := 'text/html';

  if Request.QueryFields.Values['mjp'] <> '1' then
    Response.Content := htmlEntrada.Content
  else
    Response.Content := htmlEntradaMjp.Content;

  WriteEntrada(Request,Response);
end;

procedure TdmEntrada.WebModuleCreate(Sender: TObject);
begin
  htmlEntrada.HTMLFile := PATH_PLANTILLAS + 'wentrada.php';
  htmlEntradaMjp.HTMLFile := PATH_PLANTILLAS + 'wentrada_mjp.php';
end;

procedure TdmEntrada.htmlEntradaHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'redirect' then begin
    if Request.QueryFields.Values['consulta'] = '' then
      ReplaceText := '../../index2.php'
    else begin
      if Request.QueryFields.Values['repl_char'] = '' then
        ReplaceText := '../wwwRanning.exe/wproductos?consulta=1&' +
          Request.QueryFields.Values['consulta']
      else
        ReplaceText := '../wwwRanning.exe/wproductos?consulta=1&' +
          CadenaConsulta(Request.QueryFields.Values['consulta'],
          Request.QueryFields.Values['repl_char']);
    end;
  end
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file']);
end;

function TdmEntrada.CadenaConsulta(const sConsulta,sReplChar: string): string;
begin
  Result := StringReplace(sConsulta,sReplChar,'&',[rfReplaceAll,rfIgnoreCase]);
end;

end.
