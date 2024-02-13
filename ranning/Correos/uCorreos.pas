unit uCorreos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uJAMContainers, StdCtrls, uJAMControls;

type
  TfrmCorreos = class(TJAMForm)
    nedImporteCliente: TJAMNumberEdit;
    Label2: TLabel;
    Label3: TLabel;
    nedDerechosCorreos: TJAMNumberEdit;
    Label4: TLabel;
    nedImporteGiro: TJAMNumberEdit;
    Label1: TLabel;
    btnCalcular: TButton;
    btnBorrar: TButton;
    nedFijoCorreos: TJAMNumberEdit;
    Label5: TLabel;
    nedTotalDerechos: TJAMNumberEdit;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CalcularImporteGiro;
    procedure CalcularImporteCliente;
    procedure Borrar;
  public
    { Public declarations }
  end;

var
  frmCorreos: TfrmCorreos;

implementation

uses uCommon, uJAMIntf;

{$R *.DFM}

procedure TfrmCorreos.btnCalcularClick(Sender: TObject);
begin
  if nedImporteGiro.Text = '0' then
    CalcularImporteGiro
  else if nedImporteCliente.Text = '0' then
    CalcularImporteCliente;
end;

procedure TfrmCorreos.btnBorrarClick(Sender: TObject);
begin
  Borrar;
end;

procedure TfrmCorreos.Borrar;
begin
  nedImporteCliente.Text := '0';
  nedImporteGiro.Text := '0';
  nedTotalDerechos.Text := '0';
end;

procedure TfrmCorreos.CalcularImporteGiro;

var
  rImpCli: Extended;
  rImpFij: Extended;
  rDerCor: Extended;
  rImpGir: Extended;
  rTotalDer: Extended;

begin
  rImpCli := StrToFloat(nedImporteCliente.Text);
  rImpFij := StrToFloat(nedFijoCorreos.Text);
  rDerCor := StrToFloat(nedDerechosCorreos.Text) / 100;
  rImpGir := (rImpCli - rImpFij) / (1 + rDerCor);
  rTotalDer := rImpGir * rDerCor + rImpFij;
  nedTotalDerechos.Text := FloatToStr(RoundDec(rTotalDer,2));
  nedImporteGiro.Text := FloatToStr(RoundDec(rImpGir,2));
end;

procedure TfrmCorreos.FormCreate(Sender: TObject);
begin
  nedFijoCorreos.Text := sFijoGiro;
  nedDerechosCorreos.Text := sPorcentajeGiro;
  SetControlReadOnly(nedTotalDerechos as IJAMWinControl,True);
end;

procedure TfrmCorreos.CalcularImporteCliente;

var
  rImpCli: Extended;
  rImpFij: Extended;
  rDerCor: Extended;
  rImpGir: Extended;
  rTotalDer: Extended;

begin
  rImpFij := StrToFloat(nedFijoCorreos.Text);
  rDerCor := StrToFloat(nedDerechosCorreos.Text) / 100;
  rImpGir := StrToFloat(nedImporteGiro.Text);
  rTotalDer := rImpGir * rDerCor + rImpFij;
  rImpCli := rImpGir + rTotalDer;
  nedTotalDerechos.Text := FloatToStr(RoundDec(rTotalDer,2));
  nedImporteCliente.Text := FloatToStr(RoundDec(rImpCli,2));
end;

end.
