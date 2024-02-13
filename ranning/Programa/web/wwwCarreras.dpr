program wwwCarreras;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp_jam,
  udmCarreras in 'udmCarreras.pas' {dmCarreras: TWebModule},
  uComun in 'uComun.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmCarreras, dmCarreras);
  Application.Run;
end.
