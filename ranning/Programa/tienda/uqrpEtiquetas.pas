unit uqrpEtiquetas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, ZAbstractRODataset,
  ZDataset, Db, jpeg;

type
  TqrpEtiquetas = class(TQuickRep)
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    lblDsMarca: TQRLabel;
    dbtDsPrecio: TQRDBText;
    sqlProductos: TZReadOnlyQuery;
    lblProductoColor: TQRLabel;
    dbtDsDescuento: TQRDBText;
    dsProductos: TDataSource;
    sqlProductosDetalle: TZReadOnlyQuery;
    dbtDsPrecioDescuento: TQRDBText;
    procedure lblProductoColorPrint(sender: TObject; var Value: String);
    procedure lblDsMarcaPrint(sender: TObject; var Value: String);
    procedure sqlProductosAfterOpen(DataSet: TDataSet);
    procedure sqlProductosBeforeClose(DataSet: TDataSet);
    procedure dbtDsDescuentoPrint(sender: TObject; var Value: String);
    procedure dbtDsPrecioPrint(sender: TObject; var Value: String);
    procedure dbtDsPrecioDescuentoPrint(sender: TObject;
      var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    nDescMin: Integer;
    sColores: string;

    function AtributosProducto: string;
  public
    class procedure PrintLabels(const sIdList, sColorList: string;
      nIdDescuentoMinimo: Integer);
  end;

implementation

uses udmRanning, Dialogs;

{$R *.DFM}

{ TqrpEtiquetas }

var
  qrpEtiquetas: TqrpEtiquetas = nil;

class procedure TqrpEtiquetas.PrintLabels(const sIdList, sColorList: string;
  nIdDescuentoMinimo: Integer);

var
  nPos: Integer;

begin
  if Assigned(qrpEtiquetas) then begin
    ShowMessage('Ya hay una ventana de etiquetas abierta.');
    Exit;
  end;

  qrpEtiquetas := TqrpEtiquetas.Create(nil);
  try
    qrpEtiquetas.nDescMin := nIdDescuentoMinimo;
    qrpEtiquetas.sColores := sColorList;
    nPos := qrpEtiquetas.sqlProductos.SQL.IndexOf('#where');
    qrpEtiquetas.sqlProductos.SQL[nPos] := '  (p.id_producto in (' + sIdList + ')) and';
    qrpEtiquetas.sqlProductos.Open;
    qrpEtiquetas.Preview;
  finally
    qrpEtiquetas.Free;
    qrpEtiquetas := nil;
  end;
end;

procedure TqrpEtiquetas.lblProductoColorPrint(sender: TObject;
  var Value: String);
begin
  Value := DataSet.FieldByName('ds_producto').AsString + ' (' +
    dmRanning.DescColor(DataSet.FieldByName('cd_color').AsString) + ')';
end;

procedure TqrpEtiquetas.lblDsMarcaPrint(sender: TObject;
  var Value: String);

var
  sAtr: string;
  sPeso: string;

begin
  sAtr := AtributosProducto;
  sPeso := DataSet.FieldByName('nm_peso').AsString;
  if (sPeso <> '') and (sPeso <> '0') then
    sPeso := ' - ' + sPeso + ' g'
  else
    sPeso := '';
  if sAtr <> '' then sAtr := ' - ' + sAtr;
  Value := DataSet.FieldByName('codigo').AsString + ' - ' +
    DataSet.FieldByName('ds_marca').AsString + ' - ' +
    DataSet.FieldByName('ds_tipo_sexo').AsString + sAtr + ' - ' +
    DataSet.FieldByName('ds_temporada').AsString + sPeso;
end;

function TqrpEtiquetas.AtributosProducto: string;

var
  sAtr: string;

begin
  sAtr := '';
  sqlProductosDetalle.First;
  while not sqlProductosDetalle.Eof do begin
    sAtr := sAtr + sqlProductosDetalle.FieldByName('ds_valor').AsString + ', ';
    sqlProductosDetalle.Next;
  end;

  Result := Copy(sAtr,1,Length(sAtr) - 2);
end;

procedure TqrpEtiquetas.sqlProductosAfterOpen(DataSet: TDataSet);
begin
  sqlProductosDetalle.Open;
end;

procedure TqrpEtiquetas.sqlProductosBeforeClose(DataSet: TDataSet);
begin
  sqlProductosDetalle.Close;
end;

procedure TqrpEtiquetas.dbtDsDescuentoPrint(sender: TObject; var Value: String);
begin
  Value := '';
  Exit;

  if DataSet.FieldByName('id_descuento').AsInteger <= nDescMin then
    Value := '';
end;

procedure TqrpEtiquetas.dbtDsPrecioPrint(sender: TObject;
  var Value: String);
begin
  Value := StringReplace(DataSet.FieldByName('ds_pvp').AsString + ' ' +
    DataSet.FieldByName('ds_descuento').AsString + ' = ' +
    DataSet.FieldByName('ds_precio_descuento').AsString,'.',',',[rfReplaceAll]);
{
  if DataSet.FieldByName('id_descuento').AsInteger <= nDescMin then
    Value := '';
}
end;

procedure TqrpEtiquetas.dbtDsPrecioDescuentoPrint(sender: TObject;
  var Value: String);
begin
  Value := '';
  Exit;
  
  if DataSet.FieldByName('id_descuento').AsInteger <= nDescMin then begin
    dbtDsPrecioDescuento.Font.Color := lblDsMarca.Font.Color;
    Value := DataSet.FieldByName('ds_precio_descuento').AsString;
  end
  else
    dbtDsPrecioDescuento.Font.Color := dbtDsDescuento.Font.Color;
end;

procedure TqrpEtiquetas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := Pos(DataSet.FieldByName('cd_marca').AsString +
    DataSet.FieldByName('codigo').AsString + '(' +
    DataSet.FieldByName('cd_color_fabricante').AsString + ')' +
    dmRanning.DescColor(DataSet.FieldByName('cd_color').AsString),
    sColores) <> 0;
end;

end.
