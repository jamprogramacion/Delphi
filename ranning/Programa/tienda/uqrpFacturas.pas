unit uqrpFacturas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, jpeg;

type
  TqrpFacturas = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lblCdFactura: TQRLabel;
    lblFFactura: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel31: TQRLabel;
    procedure lblCdFacturaPrint(sender: TObject; var Value: String);
    procedure lblFFacturaPrint(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel21Print(sender: TObject; var Value: String);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRLabel25Print(sender: TObject; var Value: String);
    procedure QRLabel26Print(sender: TObject; var Value: String);
    procedure QRLabel27Print(sender: TObject; var Value: String);
  private
    rTotalIVA: Extended;
    rTotalPrecio: Extended;
    rIVAGastos: Extended;
    nNumReg: Integer;

    procedure CambiaColor(Sender: TQRCustomLabel);
  public
    class procedure Imprimir;
  end;

implementation

uses udmClientes;

{$R *.DFM}

const
  COLOR_IMPAR: TColor = TColor(22 or $80000000);

procedure TqrpFacturas.lblCdFacturaPrint(sender: TObject;
  var Value: String);
begin
  Value := 'Factura número: ' + DataSet.FieldByName('cd_factura').AsString;
end;

procedure TqrpFacturas.lblFFacturaPrint(sender: TObject;
  var Value: String);
begin
  Value := 'Fecha: ' + DataSet.FieldByName('f_factura').AsString;
end;

procedure TqrpFacturas.QRLabel15Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
  Value := FloatToStrF(DataSet.FieldByName('nm_precio_unitario').AsFloat,
    ffCurrency,10,2);
end;

procedure TqrpFacturas.QRLabel17Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
  Value := FloatToStrF(DataSet.FieldByName('nm_iva_total').AsFloat,
    ffCurrency,10,2);
end;

procedure TqrpFacturas.QRLabel18Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
  Value := FloatToStrF(DataSet.FieldByName('nm_precio_pagado').AsFloat,
    ffCurrency,10,2);
end;

procedure TqrpFacturas.QRLabel16Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
  Value := FloatToStrF(DataSet.FieldByName('nm_iva').AsFloat,ffFixed,5,2) + ' %';
end;

class procedure TqrpFacturas.Imprimir;
begin
  with TqrpFacturas.Create(nil) do
    try
      if not dmClientes.sqlImpresionFactura.Active then
        dmClientes.sqlImpresionFactura.Open;
      dmClientes.sqlImpresionFactura.First;
      Preview;
    finally
      Free;
    end;
end;

procedure TqrpFacturas.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  rIVAGastos := dmClientes.IVAGastosEnvio / 100 *
    DataSet.FieldByName('nm_gastos_envio').AsFloat /
    (1 + dmClientes.IVAGastosEnvio / 100);
  rTotalIVA := rIVAGastos;
  rTotalPrecio := DataSet.FieldByName('nm_gastos_envio').AsFloat;
  nNumReg := 0;
end;

procedure TqrpFacturas.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rTotalIVA := rTotalIVA + DataSet.FieldByName('nm_iva_total').AsFloat;
  rTotalPrecio := rTotalPrecio + DataSet.FieldByName('nm_precio_pagado').AsFloat;
  Inc(nNumReg);
end;

procedure TqrpFacturas.QRLabel20Print(sender: TObject; var Value: String);
begin
  Value := FloatToStrF(rTotalIVA,ffCurrency,8,2);
end;

procedure TqrpFacturas.QRLabel21Print(sender: TObject; var Value: String);
begin
  Value := FloatToStrF(rTotalPrecio,ffCurrency,8,2);
end;

procedure TqrpFacturas.QRLabel23Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
  Value := FloatToStrF(DataSet.FieldByName('nm_descuento').AsFloat,ffFixed,5,2) +
    ' %';
end;

procedure TqrpFacturas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (nNumReg mod 2) = 0 then
    Sender.Color := COLOR_IMPAR
  else
    Sender.Color := clWhite;
end;

procedure TqrpFacturas.CambiaColor(Sender: TQRCustomLabel);
begin
  if (nNumReg mod 2) = 0 then
    Sender.Color := COLOR_IMPAR
  else
    Sender.Color := clWhite;
end;

procedure TqrpFacturas.QRDBText4Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
end;

procedure TqrpFacturas.QRDBText5Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
end;

procedure TqrpFacturas.QRDBText6Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
end;

procedure TqrpFacturas.QRDBText7Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
end;

procedure TqrpFacturas.QRDBText8Print(sender: TObject; var Value: String);
begin
  CambiaColor(TQRCustomLabel(Sender));
end;

procedure TqrpFacturas.QRLabel25Print(sender: TObject; var Value: String);
begin
  Value := FloatToStrF(dmClientes.IVAGastosEnvio,ffFixed,5,2) + ' %';
end;

procedure TqrpFacturas.QRLabel26Print(sender: TObject; var Value: String);
begin
  Value := FloatToStrF(rIVAGastos,ffCurrency,8,2);
end;

procedure TqrpFacturas.QRLabel27Print(sender: TObject; var Value: String);
begin
  Value := FloatToStrF(DataSet.FieldByName('nm_gastos_envio').AsFloat,
    ffCurrency,8,2);
end;

end.

