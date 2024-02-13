unit uqrpVentasAlmacen;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrpVentasAlmacen = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    lblTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure lblTituloPrint(sender: TObject; var Value: String);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private
    FAno: Integer;
  public
    class procedure Imprimir(nAno: Integer);
  end;

var
  qrpVentasAlmacen: TqrpVentasAlmacen;

implementation

uses udmEstadisticas, uCommon, ADODb;

{$R *.DFM}

{ TqrpVentasAlmacen }

class procedure TqrpVentasAlmacen.Imprimir(nAno: Integer);
begin
  with TqrpVentasAlmacen.Create(nil) do
    try
      FAno := nAno;
      if DataSet.Active then DataSet.Close;
      TADOQuery(DataSet).Parameters.ParamByName('ano_fechaven').Value := nAno;
      DataSet.Open;
      if dmEstadisticas.sqlAlmacen.Active then dmEstadisticas.sqlAlmacen.Close;
      dmEstadisticas.sqlAlmacen.Parameters.ParamByName('ano_fecha').Value := nAno;
      dmEstadisticas.sqlAlmacen.Open;
      Preview;
    finally
      Free;
    end;
end;

procedure TqrpVentasAlmacen.lblTituloPrint(sender: TObject;
  var Value: String);
begin
  Value := 'Ventas y stock en almacén hasta 31/12/' + IntToStr(FAno);
end;

procedure TqrpVentasAlmacen.QRLabel7Print(sender: TObject;
  var Value: String);
begin
  Value := FormatEuro(DataSet.FieldByName('precio_bruto'));
end;

procedure TqrpVentasAlmacen.QRLabel8Print(sender: TObject;
  var Value: String);
begin
  Value := FormatEuro(DataSet.FieldByName('pvp'));
end;

procedure TqrpVentasAlmacen.QRLabel9Print(sender: TObject;
  var Value: String);

var
  rDesc: Extended;

begin
  rDesc := (DataSet.FieldByName('precio_bruto').AsFloat -
    DataSet.FieldByName('pvp').AsFloat) * 100 /
    DataSet.FieldByName('precio_bruto').AsFloat;
  Value := FloatToStrF(rDesc,ffFixed,6,2) + ' %';
end;

procedure TqrpVentasAlmacen.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  Value := FormatEuro(DataSet.FieldByName('coste_ventas'));
end;

procedure TqrpVentasAlmacen.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  Value := FormatEuro(dmEstadisticas.sqlAlmacen.FieldByName('coste').AsFloat -
    DataSet.FieldByName('coste_ventas').AsFloat);
end;

procedure TqrpVentasAlmacen.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  Value := FormatEuro(dmEstadisticas.sqlAlmacen.FieldByName('coste'));
end;

end.
