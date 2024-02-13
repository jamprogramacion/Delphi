program wwwEnlaces;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp_jam,
  udmEnlaces in 'udmEnlaces.pas' {dmEnlaces: TWebModule},
  uComun in 'uComun.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmEnlaces, dmEnlaces);
  Application.Run;
end.
