unit ufrmTallas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, StdCtrls, Buttons, uJAMControls;

type
  TfrmTallas = class(TfrmMDIChildBase)
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    lbTallas: TJAMIdListBox;
    lblTalla: TStaticText;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    slTallas: TStrings;
    hndOpener: HWND;

    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure CargaListaTallas;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; overload; override;
    class procedure ShowForm(hndCallBack: HWND; slListaTallas: TStrings); reintroduce; overload;
  end;

implementation

uses udmProductos;

{$R *.DFM}

{ TfrmTallas }

var
  frmTallas: TfrmTallas = nil;

constructor TfrmTallas.Create(AOwner: TComponent);
begin
  inherited;

  DatasetList.Add(lbTallas.ListDataSource.DataSet);
end;

procedure TfrmTallas.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  lbTallas.FillList;
  lblTalla.Caption :=
    lbTallas.ListDataSource.DataSet.FieldByName('ds_tipo_talla').AsString;
end;

procedure TfrmTallas.btnAceptarClick(Sender: TObject);
begin
  CargaListaTallas;
  PostMessage(hndOpener,MSG_TALLAS,0,0);
  WindowState := wsMinimized;
end;

procedure TfrmTallas.btnCancelarClick(Sender: TObject);
begin
  slTallas.Clear;
  PostMessage(hndOpener,MSG_TALLAS,0,0);
  WindowState := wsMinimized;
end;

procedure TfrmTallas.CargaListaTallas;
begin
  lbTallas.GetSelectedIdList(slTallas);
end;

class procedure TfrmTallas.ShowForm;
begin
  if not Assigned(frmTallas) then begin
    frmTallas := TfrmTallas.Create(Application);
    frmTallas.Id := nvTallas;
  end;

  frmTallas.RefreshData([frmTallas.Id]);
  frmTallas.WindowState := wsNormal;
  frmTallas.Show;
end;

class procedure TfrmTallas.ShowForm(hndCallBack: HWND; slListaTallas: TStrings);
begin
  ShowForm;
  frmTallas.slTallas := slListaTallas;
  frmTallas.hndOpener := hndCallBack;
end;

procedure TfrmTallas.FormActivate(Sender: TObject);
begin
  if not Assigned(frmTallas) then Exit;

  RefreshData([Id]);
end;

end.
