program Estadisticas;

uses
  Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  udmEstadisticas in 'udmEstadisticas.pas' {dmEstadisticas: TDataModule},
  ufrmFechas in 'ufrmFechas.pas' {frmFechas},
  uqrpTotalVentasPorDia in 'uqrpTotalVentasPorDia.pas' {qrpTotalVentasPorDia: TQuickRep},
  uqrpVentasAlmacen in 'uqrpVentasAlmacen.pas' {qrpVentasAlmacen: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmEstadisticas, dmEstadisticas);
  Application.CreateForm(TqrpTotalVentasPorDia, qrpTotalVentasPorDia);
  Application.CreateForm(TqrpVentasAlmacen, qrpVentasAlmacen);
  Application.Run;
end.
