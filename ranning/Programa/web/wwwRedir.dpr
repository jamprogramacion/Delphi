program wwwRedir;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp_jam,
  udmRedir in 'udmRedir.pas' {dmRedir: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmRedir, dmRedir);
  Application.Run;
end.
