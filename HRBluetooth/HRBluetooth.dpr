program HRBluetooth;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmHRBluetooth in 'uFrmHRBluetooth.pas' {frmHRBluetooth};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmHRBluetooth, frmHRBluetooth);
  Application.Run;
end.
