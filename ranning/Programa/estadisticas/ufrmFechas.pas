unit ufrmFechas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, uJAMControls;

type
  TfrmFechas = class(TForm)
    edFechaIni: TJAMMaskEdit;
    edFechaFin: TJAMMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    lbDiasSemana: TJAMListBox;
    procedure FormCreate(Sender: TObject);
  private
    function GetFechaFin: TDate;
    function GetFechaInicio: TDate;
    function DiasSemana: string;
    procedure InicializaDiasSemana;
  public
    class function ElijeFechas(var nFechaIni, nFechaFin: TDate;
      var sDiasSemana: string): TModalResult;

    property FechaInicio: TDate read GetFechaInicio;
    property FechaFin: TDate read GetFechaFin;
  end;

var
  frmFechas: TfrmFechas;

implementation

{$R *.DFM}

{ TfrmFechas }

function TfrmFechas.GetFechaFin: TDate;
begin
  Result := StrToDateTime(edFechaFin.Text);
end;

function TfrmFechas.GetFechaInicio: TDate;
begin
  Result := StrToDateTime(edFechaIni.Text);
end;

procedure TfrmFechas.FormCreate(Sender: TObject);
begin
  edFechaIni.Text := DateTimeToStr(Date);
  edFechaFin.Text := DateTimeToStr(Date);
  InicializaDiasSemana;
end;

class function TfrmFechas.ElijeFechas(var nFechaIni,
  nFechaFin: TDate; var sDiasSemana: string): TModalResult;
begin
  with TfrmFechas.Create(nil) do
    try
      Result := ShowModal;
      nFechaIni := FechaInicio;
      nFechaFin := FechaFin;
      sDiasSemana := DiasSemana;
    finally
      Free;
    end;
end;

function TfrmFechas.DiasSemana: string;

var
  nCont: Integer;
  nItem: Integer;
  sAux: string;

begin
  nCont := 0;
  nItem := 0;
  sAux := '';
  while nCont < lbDiasSemana.SelCount do begin
    if lbDiasSemana.Selected[nItem] then begin
      sAux := sAux + IntToStr(nItem + 1) + ',';
      Inc(nCont);
    end;
    Inc(nItem);
  end;

  Result := Copy(sAux,1,Length(sAux) - 1);
end;

procedure TfrmFechas.InicializaDiasSemana;

var
  nCont: Integer;
  nItem: Integer;

begin
  for nCont := Low(LongDayNames) to High(LongDayNames) do begin
    nItem := lbDiasSemana.Items.Add(LongDayNames[nCont]);
    lbDiasSemana.Selected[nItem] := True;
  end;
end;

end.
