program Ranning;

uses
  Windows,
  Messages,
  Forms,
  ufrmRanning in 'ufrmRanning.pas' {frmRanning},
  udmRanning in 'udmRanning.pas' {dmRanning: TDataModule},
  ufrmMDIChildBase in 'UFRMMDICHILDBASE.pas' {frmMDIChildBase},
  ufrmProductos in 'ufrmProductos.pas' {frmProductos},
  udmProductos in 'udmProductos.pas' {dmProductos: TDataModule},
  ufrmFiltros in 'ufrmFiltros.pas' {frmFiltros: TFrame},
  ufrmAltaProductos in 'ufrmAltaProductos.pas' {frmAltaProductos},
  ufrmStock in 'ufrmStock.pas' {frmStock},
  udmColores in 'udmColores.pas' {dmColores: TDataModule},
  ufrmColores in 'ufrmColores.pas' {frmColores},
  ufrmTallas in 'ufrmTallas.pas' {frmTallas},
  ufrmSubeTablas in 'ufrmSubeTablas.pas' {frmSubeTablas},
  ufrmAtributos in 'ufrmAtributos.pas' {frmAtributos},
  ufrmCarreras in 'ufrmCarreras.pas' {frmCarreras},
  udmCarreras in 'udmCarreras.pas' {dmCarreras: TDataModule},
  ufrmProvMuni in 'ufrmProvMuni.pas' {frmProvMuni},
  udmDirecciones in 'udmDirecciones.pas' {dmDirecciones: TDataModule},
  ufrmDirecciones in 'ufrmDirecciones.pas' {frmDirecciones},
  ufrmTiposVia in 'ufrmTiposVia.pas' {frmTiposVia},
  ufrmClientes in 'ufrmClientes.pas' {frmClientes},
  udmClientes in 'udmClientes.pas' {dmClientes: TDataModule},
  ufrmFacturas in 'ufrmFacturas.pas' {frmFacturas},
  uqrpFacturas in 'uqrpFacturas.pas' {qrpFacturas: TQuickRep},
  ufrmVentas in 'ufrmVentas.pas' {frmVentas},
  udmVentas in 'udmVentas.pas' {dmVentas: TDataModule},
  ufrmPresupuestos in 'ufrmPresupuestos.pas' {frmPresupuestos},
  ufrmExplorer in 'ufrmExplorer.pas' {frmExplorer},
  ufrmImagenProducto in 'ufrmImagenProducto.pas' {frmImagenProducto},
  ufrmEtiquetas in 'ufrmEtiquetas.pas' {frmEtiquetas},
  uqrpEtiquetas in 'uqrpEtiquetas.pas' {qrpEtiquetas: TQuickRep},
  uqrpEtiquetasOferta in 'uqrpEtiquetasOferta.pas' {qrpEtiquetasOferta: TQuickRep},
  udmPresupuestos in 'udmPresupuestos.pas' {dmPresupuestos: TDataModule},
  ufrmInicio in 'ufrmInicio.pas' {frmInicio},
  ufrmPDF in 'ufrmPDF.pas' {frmPDF},
  ufrmClientesAccess in 'ufrmClientesAccess.pas' {frmClientesAccess},
  ufrmSelColores in 'ufrmSelColores.pas' {frmSelColores},
  ufrmProductosAccess in 'ufrmProductosAccess.pas' {frmProductosAccess},
  uqrpEtiquetaEnvio in 'uqrpEtiquetaEnvio.pas' {qrpEtiquetaEnvio: TQuickRep},
  ufrmTipoComplemento in 'ufrmTipoComplemento.pas' {frmTipoComplemento};

{$R *.RES}

begin
  {
  CreateMutex(nil,True,PChar(MSG_ACTIVA_RANNING));
  nMsgRanning := RegisterWindowMessage(PChar(MSG_ACTIVA_RANNING));
  if GetLastError = ERROR_ALREADY_EXISTS then begin
    SendMessage(HWND_BROADCAST,nMsgRanning,0,0);
    Application.Terminate;
  end;
  }
  Application.Initialize;
  Application.Title := 'Ranning';
  frmInicio := TfrmInicio.Create(Application);
  frmInicio.Show;
  repeat
    Application.ProcessMessages;
  until frmInicio.Visible;
  Application.CreateForm(TfrmRanning, frmRanning);
  frmInicio.Close;
  Application.Run;
end.
