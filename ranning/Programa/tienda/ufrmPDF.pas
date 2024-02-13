unit ufrmPDF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, OleCtrls, AcroPDFLib_TLB;

type
  TfrmPDF = class(TfrmMDIChildBase)
    pdfExplorer: TAcroPDF;
  private
    { Private declarations }
  public
    class procedure ShowForm; overload; override;
    class procedure ExploreFile(const sFile: TFileName);
  end;

implementation

{$R *.DFM}

var
  frmPDF: TfrmPDF = nil;

{ TfrmPDF }

class procedure TfrmPDF.ExploreFile(const sFile: TFileName);
begin
  ShowForm;

  frmPDF.Caption := sFile;
  frmPDF.pdfExplorer.src := sFile;
end;

class procedure TfrmPDF.ShowForm;
begin
  if not Assigned(frmPDF) then begin
    frmPDF := TfrmPDF.Create(Application);
    frmPDF.Id := nvPDF;
  end;

  frmPDF.RefreshData([frmPDF.Id]);
  frmPDF.WindowState := wsNormal;
  frmPDF.Show;
end;

end.
