program wwwRanning;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp_jam,
  udmRanning in 'udmRanning.pas' {dmRanning: TWebModule},
  uComun in 'uComun.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmRanning, dmRanning);
  Application.Run;
end.
