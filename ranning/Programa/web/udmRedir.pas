unit udmRedir;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp;

type
  TdmRedir = class(TWebModule)
    procedure dmRedirwactBannerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRedir: TdmRedir;

implementation

{$R *.DFM}

uses uComun;

procedure TdmRedir.dmRedirwactBannerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

var
  sUrl: string;

begin
  sUrl := Request.QueryFields.Values['sUrl'];
  WriteBanner(Request,sUrl,1);
  if Request.QueryFields.Values['repl_char'] <> '' then
    Response.Location := StringReplace(sUrl,Request.QueryFields.Values['repl_char'],
      '&',[rfReplaceAll])
  else
    Response.Location := sUrl;
end;

end.
