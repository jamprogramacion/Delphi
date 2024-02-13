unit uqrpEtiquetaEnvio;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, GIFImage;

type
  TqrpEtiquetaEnvio = class(TQuickRep)
    DetailBand1: TQRBand;
    lblDireccion: TQRLabel;
    bndHeader: TQRBand;
    lblRemite: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    lblReembolso: TQRLabel;
    procedure lblDireccionPrint(sender: TObject; var Value: String);
    procedure lblRemitePrint(sender: TObject; var Value: String);
    procedure lblReembolsoPrint(sender: TObject; var Value: String);
  private
    lTelefono: Boolean;
    lPresupuesto: Boolean;
  public
    class procedure PrintLabel(lMostrarTelefono: Boolean);
    class procedure PrintAddressLabel(lMostrarTelefono: Boolean);
  end;

implementation

uses udmPresupuestos, Dialogs, udmRanning, udmClientes;

{$R *.DFM}

var
  qrpEtiquetaEnvio: TqrpEtiquetaEnvio = nil;

class procedure TqrpEtiquetaEnvio.PrintLabel(lMostrarTelefono: Boolean);
begin
  if Assigned(qrpEtiquetaEnvio) then begin
    ShowMessage('Ya hay una ventana de etiquetas abierta.');
    Exit;
  end;

  qrpEtiquetaEnvio := TqrpEtiquetaEnvio.Create(nil);
  try
    qrpEtiquetaEnvio.lTelefono := lMostrarTelefono;
    qrpEtiquetaEnvio.lPresupuesto := True;
    qrpEtiquetaEnvio.Preview;
  finally
    qrpEtiquetaEnvio.Free;
    qrpEtiquetaEnvio := nil;
  end;
end;

class procedure TqrpEtiquetaEnvio.PrintAddressLabel(lMostrarTelefono: Boolean);
begin
  if Assigned(qrpEtiquetaEnvio) then begin
    ShowMessage('Ya hay una ventana de etiquetas abierta.');
    Exit;
  end;

  qrpEtiquetaEnvio := TqrpEtiquetaEnvio.Create(nil);
  try
    qrpEtiquetaEnvio.lTelefono := lMostrarTelefono;
    qrpEtiquetaEnvio.lPresupuesto := False;
    qrpEtiquetaEnvio.Preview;
  finally
    qrpEtiquetaEnvio.Free;
    qrpEtiquetaEnvio := nil;
  end;
end;

procedure TqrpEtiquetaEnvio.lblDireccionPrint(sender: TObject;
  var Value: String);
begin
  if not lPresupuesto then begin
    Value := dmClientes.DatosCliente(lTelefono,False,False);
    Exit;
  end;

  Value := dmPresupuestos.DatosClientePresupuesto(lTelefono,False,False);

  if dmPresupuestos.Reembolso <> 0 then
    Value := Value + #13 + #10 + #13 + #10 + '>>>>>> REEMBOLSO ' +
      dmRanning.FormateaPrecio(dmPresupuestos.Reembolso) + ' <<<<<<';;
end;

procedure TqrpEtiquetaEnvio.lblRemitePrint(sender: TObject;
  var Value: String);
begin
  Value := 'Remite:'  + #13 + #10 + dmRanning.DireccionRemite;
  bndHeader.Size.Height := lblRemite.Size.Height + 2;
end;

procedure TqrpEtiquetaEnvio.lblReembolsoPrint(sender: TObject;
  var Value: String);
begin
  if not lPresupuesto then begin
    Value := '';
    Exit;
  end;

  if dmPresupuestos.Reembolso = 0 then begin
    Value := '';
    Exit;
  end;

  lblReembolso.Size.Top := lblDireccion.Size.Top + lblDireccion.Size.Height + 10;
  Value := '>>>>>> REEMBOLSO ' +
    dmRanning.FormateaPrecio(dmPresupuestos.Reembolso) + ' <<<<<<';
end;

end.
