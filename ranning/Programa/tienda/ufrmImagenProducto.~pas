unit ufrmImagenProducto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, OleCtnrs, ExtCtrls;

type
  TfrmImagenProducto = class(TfrmMDIChildBase)
    imgProducto: TImage;
  private
    procedure CargaImagen(const sImagen: TFileName);
  public
    class procedure ShowForm; overload; override;
    class procedure ShowForm(const sImagen: TFileName); reintroduce; overload;
  end;

implementation

{$R *.DFM}

{ TfrmImagenProducto }

var
  frmImagenProducto: TfrmImagenProducto = nil;

class procedure TfrmImagenProducto.ShowForm;
begin
  if not Assigned(frmImagenProducto) then begin
    frmImagenProducto := TfrmImagenProducto.Create(Application);
    frmImagenProducto.Id := nvImagenProducto;
  end;

  frmImagenProducto.RefreshData([frmImagenProducto.Id]);
  frmImagenProducto.WindowState := wsNormal;
  frmImagenProducto.Show;
end;

procedure TfrmImagenProducto.CargaImagen(const sImagen: TFileName);
begin
  imgProducto.Picture.LoadFromFile(sImagen);
end;

class procedure TfrmImagenProducto.ShowForm(const sImagen: TFileName);
begin
  ShowForm;

  frmImagenProducto.CargaImagen(sImagen);
end;

end.
