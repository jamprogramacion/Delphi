program Correos;

uses
  Forms,
  uCorreos in 'uCorreos.pas' {frmCorreos};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCorreos, frmCorreos);
  Application.Run;
end.
