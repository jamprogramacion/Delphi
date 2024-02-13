program wwwNoticias;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp_jam,
  udmNoticias in 'udmNoticias.pas' {dmNoticias: TWebModule},
  uComun in 'uComun.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmNoticias, dmNoticias);
  Application.Run;
end.
