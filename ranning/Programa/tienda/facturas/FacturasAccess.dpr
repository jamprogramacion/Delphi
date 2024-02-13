program FacturasAccess;

uses
  Forms,
  ufrmFacturasAccess in 'ufrmFacturasAccess.pas' {frmFacturasAccess},
  udmFacturasAccess in 'udmFacturasAccess.pas' {dmFacturasAccess: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFacturasAccess, frmFacturasAccess);
  Application.CreateForm(TdmFacturasAccess, dmFacturasAccess);
  Application.Run;
end.
