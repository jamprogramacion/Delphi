unit uqrpTotalVentasPorDia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrpTotalVentasPorDia = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    dbtFechaven: TQRDBText;
    lblTotalB: TQRLabel;
    lblTotalN: TQRLabel;
    qrsTotal: TQRShape;
    lblFecha: TQRLabel;
    lblTotalBruto: TQRLabel;
    lblTotalNeto: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    lblFecha2: TQRLabel;
    lblTotalBruto2: TQRLabel;
    lblTotalNeto2: TQRLabel;
    ChildBand2: TQRChildBand;
    QRShape2: TQRShape;
    lblFecha3: TQRLabel;
    lblTotalBruto3: TQRLabel;
    lblTotalNeto3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    lblTipoIVA: TQRLabel;
    lblFormaPago: TQRLabel;
    lblAviso: TQRLabel;
    QRLabel8: TQRLabel;
    lblEnvio: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lblTotalBrutoPrint(sender: TObject; var Value: String);
    procedure lblTotalNetoPrint(sender: TObject; var Value: String);
    procedure lblFechaPrint(sender: TObject; var Value: String);
    procedure lblTotalBPrint(sender: TObject; var Value: String);
    procedure lblTotalNPrint(sender: TObject; var Value: String);
    procedure lblGastosPrint(sender: TObject; var Value: String);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lblTotalBruto3Print(sender: TObject; var Value: String);
    procedure lblTotalNeto3Print(sender: TObject; var Value: String);
    procedure lblFecha3Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure lblTipoIVAPrint(sender: TObject; var Value: String);
    procedure lblFormaPagoPrint(sender: TObject; var Value: String);
    procedure lblAvisoPrint(sender: TObject; var Value: String);
    procedure lblEnvioPrint(sender: TObject; var Value: String);
  private
    rTotalBruto: Extended;
    rTotalNeto: Extended;
    nFecha: TDate;
    nFechaAnt: TDate;
    nNumReg: Integer;
    rTotalBrutoTotal: Extended;
    rTotalNetoTotal: Extended;
    FechaIni: TDate;
    FechaFin: TDate;
    lIVA0: Boolean;
    lSumar: Boolean;
  public
    class procedure Imprimir(nFechaIni, nFechaFin: TDate;
      const sDiasSemana: string; lSumarIVA0: Boolean);
  end;

var
  qrpTotalVentasPorDia: TqrpTotalVentasPorDia;

implementation

uses udmEstadisticas;

{$R *.DFM}

{ TqrpTotalVentasPorDia }

const
  FPAGO_TARJETA = 'T';

class procedure TqrpTotalVentasPorDia.Imprimir(nFechaIni,
  nFechaFin: TDate; const sDiasSemana: string; lSumarIVA0: Boolean);

var
  nWhere: Integer;

begin
  with TqrpTotalVentasPorDia.Create(nil) do
    try
      FechaIni := nFechaIni;
      FechaFin := nFechaFin;
      lIVA0 := lSumarIVA0;
      if dmEstadisticas.sqlTotalVentasPorDia.Active then
        dmEstadisticas.sqlTotalVentasPorDia.Close;
      nWhere := dmEstadisticas.sqlTotalVentasPorDia.SQL.IndexOf('#where');
      dmEstadisticas.sqlTotalVentasPorDia.SQL[nWhere] := ' where (fechaven ' +
        'between #' + FormatDateTime('mm/dd/yyyy',nFechaIni) + '# and #' +
        FormatDateTime('mm/dd/yyyy',nFechaFin) + '#) and (weekday(fechaven) ' +
        'in (' + sDiasSemana + ')) ';
      Preview;
    finally
      Free;
    end;
end;

procedure TqrpTotalVentasPorDia.QRChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrsTotal.Enabled := nFecha <> DataSet.FieldByName('fechaven').AsDateTime;
  lblFecha.Enabled := qrsTotal.Enabled;
  lblTotalBruto.Enabled := qrsTotal.Enabled;
  lblTotalNeto.Enabled := qrsTotal.Enabled;
  //lSumar := lIVA0 or (DataSet.FieldByName('fpago').AsString = FPAGO_TARJETA) or
    //(DataSet.FieldByName('iva').AsFloat > 0);
  lSumar := True;
  if lSumar then begin
    rTotalBruto := rTotalBruto + DataSet.FieldByName('total_bruto').AsFloat;
    rTotalNeto := rTotalNeto + DataSet.FieldByName('total_neto').AsFloat;
    rTotalBrutoTotal := rTotalBrutoTotal + DataSet.FieldByName('total_bruto').AsFloat;
    rTotalNetoTotal := rTotalNetoTotal + DataSet.FieldByName('total_neto').AsFloat;
  end;
  if not qrsTotal.Enabled then begin
    dbtFechaven.Top := 2;
    lblFormaPago.Top := 2;
    lblTipoIVA.Top := 2;
    lblTotalB.Top := 2;
    lblTotalN.Top := 2;
    lblEnvio.Top := 2;
    Sender.Height := 15;
  end
  else begin
    dbtFechaven.Top := 30;
    lblFormaPago.Top := 30;
    lblTipoIVA.Top := 30;
    lblTotalB.Top := 30;
    lblTotalN.Top := 30;
    lblEnvio.Top := 30;
    Sender.Height := 48;
    if lSumar then begin
      rTotalBruto := rTotalBruto - DataSet.FieldByName('total_bruto').AsFloat;
      rTotalNeto := rTotalNeto - DataSet.FieldByName('total_neto').AsFloat;
    end;
  end;
  nFecha := DataSet.FieldByName('fechaven').AsDateTime;
end;

procedure TqrpTotalVentasPorDia.DetailBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Dec(nNumReg);
  if qrsTotal.Enabled then begin
    rTotalBruto := DataSet.FieldByName('total_bruto').AsFloat;
    rTotalNeto := DataSet.FieldByName('total_neto').AsFloat;
  end;
end;

procedure TqrpTotalVentasPorDia.lblTotalBrutoPrint(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(rTotalBruto,ffCurrency,10,2);
end;

procedure TqrpTotalVentasPorDia.lblTotalNetoPrint(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(rTotalNeto,ffCurrency,10,2);
end;

procedure TqrpTotalVentasPorDia.lblFechaPrint(sender: TObject;
  var Value: String);
begin
  Value := 'Total del día ' + FormatDateTime('dd/mm/yyyy',nFechaAnt) + ' (' +
    LongDayNames[DayOfWeek(nFechaAnt)] + ')';
  nFechaAnt := dmEstadisticas.sqlTotalVentasPorDia.FieldByName('fechaven').AsDateTime;
end;

procedure TqrpTotalVentasPorDia.lblTotalBPrint(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(DataSet.FieldByName('total_bruto').AsFloat,ffCurrency,10,2);
  if not lSumar then Value := Value + ' *';
end;

procedure TqrpTotalVentasPorDia.lblTotalNPrint(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(DataSet.FieldByName('total_neto').AsFloat,ffCurrency,10,2);
  if not lSumar then Value := Value + ' *';
end;

procedure TqrpTotalVentasPorDia.lblGastosPrint(sender: TObject;
  var Value: String);
begin
  if DataSet.FieldByName('gastos').AsFloat = 0 then begin
    Value := '0';
    Exit;
  end;

  Value := FloatToStrF(DataSet.FieldByName('gastos').AsFloat * 100,ffFixed,5,2) +
    ' %';
end;

procedure TqrpTotalVentasPorDia.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rTotalBruto := 0;
  rTotalNeto := 0;
  rTotalBrutoTotal := 0;
  rTotalNetoTotal := 0;
  dmEstadisticas.sqlTotalVentasPorDia.Open;
  dmEstadisticas.sqlTotalVentasPorDia.First;
  nFecha := dmEstadisticas.sqlTotalVentasPorDia.FieldByName('fechaven').AsDateTime;
  nFechaAnt := dmEstadisticas.sqlTotalVentasPorDia.FieldByName('fechaven').AsDateTime;
  nNumReg := DataSet.RecordCount;
  lblAviso.Enabled := not lIVA0;
end;

procedure TqrpTotalVentasPorDia.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := nNumReg = 0;
end;

procedure TqrpTotalVentasPorDia.ChildBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := nNumReg = 0;
end;

procedure TqrpTotalVentasPorDia.lblTotalBruto3Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(rTotalBrutoTotal,ffCurrency,10,2);
end;

procedure TqrpTotalVentasPorDia.lblTotalNeto3Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(rTotalNetoTotal,ffCurrency,10,2);
end;

procedure TqrpTotalVentasPorDia.lblFecha3Print(sender: TObject;
  var Value: String);
begin
  Value := 'Total entre los días ' + FormatDateTime('dd/mm/yyyy',FechaIni) +
    ' y ' + FormatDateTime('dd/mm/yyyy',FechaFin);
end;

procedure TqrpTotalVentasPorDia.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  if lIVA0 then
    Value := 'Total de ventas por día ('
  else
    Value := 'Total de ventas por día sin contar IVA 0 (';
  Value := Value + FormatDateTime('dd/mm/yyyy',FechaIni) + ' a ' +
    FormatDateTime('dd/mm/yyyy',FechaFin) + ')'
end;

procedure TqrpTotalVentasPorDia.lblTipoIVAPrint(sender: TObject;
  var Value: String);
begin
  if DataSet.FieldByName('iva2').AsFloat = 0 then begin
    Value := '0';
    Exit;
  end;

  Value := DataSet.FieldByName('iva2').AsString + ' %';
end;

procedure TqrpTotalVentasPorDia.lblFormaPagoPrint(sender: TObject;
  var Value: String);
begin
  Value := dmEstadisticas.sqlFormasPago.FieldByName('descripcion').AsString;
end;

procedure TqrpTotalVentasPorDia.lblAvisoPrint(sender: TObject;
  var Value: String);
begin
  if lIVA0 then
    Value := ''
  else
    Value := '(*) La cantidad no se suma en los subtotales ni en el total';
end;

procedure TqrpTotalVentasPorDia.lblEnvioPrint(sender: TObject;
  var Value: String);
begin
  if DataSet.FieldByName('gastos_envio').AsFloat = 0 then begin
    Value := '0';
    Exit;
  end;

  Value := FloatToStrF(DataSet.FieldByName('gastos_envio').AsFloat,ffCurrency,10,2);
end;

end.
