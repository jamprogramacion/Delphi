program wwwPago;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  udmPago in 'udmPago.pas' {dmPago: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmPago, dmPago);
  Application.Run;
end.
