unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus;

type
  TfrmPrincipal = class(TForm)
    mnuEstadisticas: TMainMenu;
    mnuSalir: TMenuItem;
    mnuInformes: TMenuItem;
    mnuInformesTotalVentasPorDia: TMenuItem;
    mnuInformesTotalVentasPorDiaSinIVA0: TMenuItem;
    mnuGraficos: TMenuItem;
    mnuGraficosVentasDiariasPorMes: TMenuItem;
    mnuInformesVentasAlmacen: TMenuItem;
    procedure mnuSalirClick(Sender: TObject);
    procedure mnuInformesTotalVentasPorDiaClick(Sender: TObject);
    procedure mnuInformesTotalVentasPorDiaSinIVA0Click(Sender: TObject);
    procedure mnuGraficosVentasDiariasPorMesClick(Sender: TObject);
    procedure mnuInformesVentasAlmacenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uqrpTotalVentasPorDia, ufrmFechas, uqrpVentasAlmacen;

{$R *.DFM}

procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.mnuInformesTotalVentasPorDiaClick(Sender: TObject);

var
  nFechaIni: TDate;
  nFechaFin: TDate;
  sDiasSemana: string;

begin
  if TfrmFechas.ElijeFechas(nFechaIni,nFechaFin,sDiasSemana) = mrOk then
    TqrpTotalVentasPorDia.Imprimir(nFechaIni,nFechaFin,sDiasSemana,True);
end;

procedure TfrmPrincipal.mnuInformesTotalVentasPorDiaSinIVA0Click(
  Sender: TObject);

var
  nFechaIni: TDate;
  nFechaFin: TDate;
  sDiasSemana: string;

begin
  if TfrmFechas.ElijeFechas(nFechaIni,nFechaFin,sDiasSemana) = mrOk then
    TqrpTotalVentasPorDia.Imprimir(nFechaIni,nFechaFin,sDiasSemana,False);
end;

procedure TfrmPrincipal.mnuGraficosVentasDiariasPorMesClick(
  Sender: TObject);

var
  nDia: Word;
  nMes: Word;
  nAno: Word;
  nFecha: TDate;

begin
  nFecha := StrToDate(InputBox('Ventas diarias por mes','Fecha del mes a mostrar: ',
    '0'));
  if nFecha = 0 then Exit;

  DecodeDate(nFecha,nAno,nMes,nDia);
end;

procedure TfrmPrincipal.mnuInformesVentasAlmacenClick(Sender: TObject);

var
  nAno: Integer;

begin
  nAno := StrToInt(InputBox('Ventas y stock en almacén','Hasta el 31/12 del año: ',
    '0'));
  if nAno = 0 then Exit;

  TqrpVentasAlmacen.Imprimir(nAno);
end;

end.
