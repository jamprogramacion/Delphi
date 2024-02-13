unit uqrpEtiquetasOferta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, ZAbstractRODataset,
  ZDataset, Db, DBTables;

type
  TqrpEtiquetasOferta = class(TQuickRep)
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    lblDescuento: TQRLabel;
    sqlEtiquetas: TZReadOnlyQuery;
    procedure sqlEtiquetasUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
  public
    class procedure PrintLabels(rDescuento: Extended);
  end;

implementation

uses udmRanning, Dialogs;

{$R *.DFM}

{ TqrpEtiquetas }

var
  qrpEtiquetasOferta: TqrpEtiquetasOferta = nil;

class procedure TqrpEtiquetasOferta.PrintLabels(rDescuento: Extended);
begin
  if Assigned(qrpEtiquetasOferta) then begin
    ShowMessage('Ya hay una ventana de etiquetas abierta.');
    Exit;
  end;

  qrpEtiquetasOferta := TqrpEtiquetasOferta.Create(nil);
  try
    qrpEtiquetasOferta.lblDescuento.Caption := '¡ OFERTA !                      -' +
      FloatToStr(rDescuento) + '%';
    qrpEtiquetasOferta.sqlEtiquetas.SQL.Text := 'select id_descuento from ' +
      'descuentos limit 9';
    qrpEtiquetasOferta.sqlEtiquetas.Open;
    qrpEtiquetasOferta.Preview;
  finally
    qrpEtiquetasOferta.Free;
    qrpEtiquetasOferta := nil;
  end;
end;

procedure TqrpEtiquetasOferta.sqlEtiquetasUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

end.
