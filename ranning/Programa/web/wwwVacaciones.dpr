program wwwVacaciones;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp_jam,
  udmVacaciones in 'udmVacaciones.pas' {dmVacaciones: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmVacaciones, dmVacaciones);
  Application.Run;
end.
