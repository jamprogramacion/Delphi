unit udmEstadisticas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB;

type
  TdmEstadisticas = class(TDataModule)
    dbEstadisticas: TADOConnection;
    sqlTotalVentasPorDia: TADOQuery;
    sqlFormasPago: TADOQuery;
    dsTotalVentasPorDia: TDataSource;
    sqlVentasDiariasPorMes: TADOQuery;
    sqlVentasAlmacen: TADOQuery;
    sqlAlmacen: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqlTotalVentasPorDiaAfterOpen(DataSet: TDataSet);
    procedure sqlTotalVentasPorDiaAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstadisticas: TdmEstadisticas;

implementation

{$R *.DFM}

const
  TOTAL_VENTAS_POR_DIA_SQL_1 = 'select fechaven,fpago,iva2,sum(total_bruto) as total_bruto,sum(total_neto) as total_neto,' +
    'sum(gastos_envio) as gastos_envio ' +
    'from (select ' +
      'fechaven, ' +
      'fpago, ' +
      'round(switch((iva = 0) and (fpago <> ''C''),18,iva <> 0,iva * 100),2) as iva2, ' +
      'round(sum(gastosenvio / 1.18),2) as gastos_envio, ' +
      'round(sum(precioreal / (1 + iva)) + sum(gastosenvio / 1.18),2) as total_bruto, ' +
      'round(sum(precioreal) + sum(gastosenvio),2) as total_neto ' +
    'from ' +
      'ventas ';
  TOTAL_VENTAS_POR_DIA_SQL_2 = 'group by ' +
      'fechaven, ' +
      'fpago, ' +
      'iva ' +
    ') where iva2 <> 0 ' +
    'group by ' +
      'fechaven, ' +
      'fpago, ' +
      'iva2';

procedure TdmEstadisticas.DataModuleCreate(Sender: TObject);
begin
  dbEstadisticas.Open;
end;

procedure TdmEstadisticas.DataModuleDestroy(Sender: TObject);
begin
  dbEstadisticas.Close;
end;

procedure TdmEstadisticas.sqlTotalVentasPorDiaAfterOpen(DataSet: TDataSet);
begin
  sqlFormasPago.Open;
end;

procedure TdmEstadisticas.sqlTotalVentasPorDiaAfterClose(
  DataSet: TDataSet);
begin
  sqlTotalVentasPorDia.SQL.Text := TOTAL_VENTAS_POR_DIA_SQL_1;
  sqlTotalVentasPorDia.SQL.Add('#where');
  sqlTotalVentasPorDia.SQL.Add(TOTAL_VENTAS_POR_DIA_SQL_2);
end;

end.
