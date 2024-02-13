program wwwImagen;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp_jam,
  udmImagen in 'udmImagen.pas' {dmImagen: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmImagen, dmImagen);
  Application.Run;
end.
