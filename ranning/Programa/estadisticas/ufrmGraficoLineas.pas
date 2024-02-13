unit ufrmGraficoLineas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, DBChart, QrTee, QuickRpt;

type
  TfrmGraficoLineas = class(TForm)
  private
    { Private declarations }
  public
    constructor ShowGraph(DataSet: TADOQuery);
  end;

var
  frmGraficoLineas: TfrmGraficoLineas;

implementation

{$R *.DFM}

end.
