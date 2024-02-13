unit ufrmSelColores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, StdCtrls, uJAMControls, Buttons;

const
  COLORES_OK = 1;
  COLORES_CANCEL = 0;

type
  TfrmSelColores = class(TfrmMDIChildBase)
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    lbColores: TJAMIdListBox;
    lbSelColores: TListBox;
    lblColores: TStaticText;
    StaticText1: TStaticText;
    btnBorra: TButton;
    btnSube: TButton;
    btnBaja: TButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBorraClick(Sender: TObject);
    procedure btnSubeClick(Sender: TObject);
    procedure btnBajaClick(Sender: TObject);
    procedure lbColoresDblClick(Sender: TObject);
    procedure MueveColor(nCambio: Integer);
    procedure lbSelColoresDblClick(Sender: TObject);
    procedure BorraColor;
  private
    slColores: TStrings;
    hndOpener: HWND;

    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure CargaListaColores;
    procedure SeleccionaColores;
    procedure InsertaColor;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; overload; override;
    class procedure ShowForm(hndCallBack: HWND; slListaColores: TStrings); reintroduce; overload;
  end;

implementation

uses udmProductos, udmRanning;

{$R *.DFM}

var
  frmSelColores: TfrmSelColores = nil;

const
  MOVER_ARRIBA = -1;
  MOVER_ABAJO = 1;

{ TfrmSelColores }

procedure TfrmSelColores.btnAceptarClick(Sender: TObject);
begin
  CargaListaColores;
  PostMessage(hndOpener,MSG_COLORES,COLORES_OK,0);
  WindowState := wsMinimized;
end;

procedure TfrmSelColores.btnCancelarClick(Sender: TObject);
begin
  slColores.Clear;
  PostMessage(hndOpener,MSG_COLORES,COLORES_CANCEL,0);
  WindowState := wsMinimized;
end;

procedure TfrmSelColores.CargaListaColores;

var
  nCont: Integer;

begin
  slColores.Clear;
  for nCont := 0 to lbSelColores.Items.Count - 1 do begin
    lbColores.ItemIndex := lbColores.Items.IndexOf(lbSelColores.Items[nCont]);
    slColores.Add(dmRanning.CodColor(lbColores.Id));
  end;
end;

constructor TfrmSelColores.Create(AOwner: TComponent);
begin
  inherited;

  DatasetList.Add(lbColores.ListDataSource.DataSet);
end;

procedure TfrmSelColores.FormActivate(Sender: TObject);
begin
  if not Assigned(frmSelColores) then Exit;

  RefreshData([Id]);
end;

procedure TfrmSelColores.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  lbColores.FillList;
  lbColores.SetFocus;
end;

procedure TfrmSelColores.SeleccionaColores;

var
  nCont: Integer;

begin
  lbSelColores.Clear;
  for nCont := 0 to slColores.Count - 1 do begin
    lbColores.ItemIndex := 0;
    while (lbColores.ItemIndex < lbColores.Items.Count) and
          (dmRanning.CodColor(lbColores.Id) <> slColores[nCont]) do
      lbColores.ItemIndex := lbColores.ItemIndex + 1;
    if lbColores.ItemIndex < lbColores.Items.Count then
      lbSelColores.Items.Add(lbColores.Items[lbColores.ItemIndex]);
  end;
end;

class procedure TfrmSelColores.ShowForm(hndCallBack: HWND;
  slListaColores: TStrings);
begin
  ShowForm;
  frmSelColores.slColores := slListaColores;
  frmSelColores.hndOpener := hndCallBack;
  frmSelColores.SeleccionaColores;
end;

class procedure TfrmSelColores.ShowForm;
begin
  if not Assigned(frmSelColores) then begin
    frmSelColores := TfrmSelColores.Create(Application);
    frmSelColores.Id := nvSelColores;
  end;

  frmSelColores.RefreshData([frmSelColores.Id]);
  frmSelColores.WindowState := wsNormal;
  frmSelColores.Show;
end;

procedure TfrmSelColores.btnBorraClick(Sender: TObject);
begin
  BorraColor;
end;

procedure TfrmSelColores.btnSubeClick(Sender: TObject);
begin
  MueveColor(MOVER_ARRIBA);
end;

procedure TfrmSelColores.btnBajaClick(Sender: TObject);
begin
  MueveColor(MOVER_ABAJO);
end;

procedure TfrmSelColores.InsertaColor;

var
  nPos: Integer;

begin
  if lbColores.ItemIndex < 0 then Exit;

  lbSelColores.Items.Add(lbColores.Items[lbColores.ItemIndex]);
  nPos := lbSelColores.Items.IndexOf(COLOR_UNICO);
  if nPos <> -1 then lbSelColores.Items.Delete(nPos);
end;

procedure TfrmSelColores.lbColoresDblClick(Sender: TObject);
begin
  InsertaColor;
end;

procedure TfrmSelColores.MueveColor(nCambio: Integer);
begin
  case nCambio of
    MOVER_ARRIBA: if lbSelColores.ItemIndex = 0 then Exit;
    MOVER_ABAJO: if lbSelColores.ItemIndex = (lbSelColores.Items.Count - 1) then Exit;
  end;

  lbSelColores.Items.Exchange(lbSelColores.ItemIndex + nCambio,lbSelColores.ItemIndex);
  lbSelColores.SetFocus;
end;

procedure TfrmSelColores.lbSelColoresDblClick(Sender: TObject);
begin
  BorraColor;
end;

procedure TfrmSelColores.BorraColor;
begin
  if lbSelColores.ItemIndex < 0 then Exit;

  lbSelColores.Items.Delete(lbSelColores.ItemIndex);
end;

end.
