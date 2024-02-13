unit ufrmFacturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, DBCtrls, Grids, DBGrids, ExtCtrls, uJAMContainers,
  StdCtrls, Mask, JAMDBLabelEdit, Buttons, Menus;

type
  TfrmFacturas = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbgFacturas: TDBGrid;
    pnCombos: TPanel;
    dbeCdFactura: TJAMDBLabelEdit;
    JAMDBLabelEdit2: TJAMDBLabelEdit;
    dbeCliente: TJAMDBLabelEdit;
    SpeedButton1: TSpeedButton;
    mnFacturas: TMainMenu;
    mnImprimir: TMenuItem;
    JAMDBLabelEdit1: TJAMDBLabelEdit;
    dbnFacturas: TDBNavigator;
    JAMPanel2: TJAMPanel;
    dbgFacturasDetalle: TDBGrid;
    dbnVentasDetalle: TDBNavigator;
    procedure dbeCdFacturaExit(Sender: TObject);
    procedure dbnFacturasClick(Sender: TObject; Button: TNavigateBtn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnImprimirClick(Sender: TObject);
  private
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure MCliente(var Message: TMessage); message MSG_CLIENTE;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; override;
    class function SiguienteFactura: string;
    class function VentaFacturada(nIdVenta: Integer): Boolean;
  end;

implementation

uses udmClientes, uCommon, db, udmDirecciones, uqrpFacturas, ufrmClientes;

{$R *.DFM}

{ TfrmFacturas }

var
  frmFacturas: TfrmFacturas = nil;

constructor TfrmFacturas.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmClientes) then dmClientes := TdmClientes.Create(Self);
  PostDataset := dbgFacturas.DataSource.DataSet;
  DatasetList.Add(dbgFacturas.DataSource.DataSet);
  DatasetList.Add(dbgFacturasDetalle.DataSource.DataSet);
end;

procedure TfrmFacturas.MCliente(var Message: TMessage);
begin
  if (Message.WParam + Message.LParam) = -2 then Exit;

  if not (dbnFacturas.DataSource.State in dsEditModes) then
    dbnFacturas.DataSource.DataSet.Edit;
  dbnFacturas.DataSource.DataSet.FieldByName('id_cliente').AsInteger :=
    Message.WParam;
  dbnFacturas.DataSource.DataSet.FieldByName('ds_cliente').AsString :=
    TdmClientes.NombreCompletoCliente(Message.WParam);
  dbnFacturas.DataSource.DataSet.FieldByName('ds_direccion').AsString :=
    TdmDirecciones.DireccionCompleta(Message.WParam);
end;

class procedure TfrmFacturas.ShowForm;
begin
  if not Assigned(frmFacturas) then begin
    frmFacturas := TfrmFacturas.Create(Application);
    frmFacturas.Id := nvFacturas;
  end;

  frmFacturas.RefreshData([frmFacturas.Id]);
  frmFacturas.WindowState := wsNormal;
  frmFacturas.Show;
end;

procedure TfrmFacturas.dbeCdFacturaExit(Sender: TObject);
begin
  dbeCdFactura.Field.AsString := PadLeft(dbeCdFactura.Text,'0',10);
end;

procedure TfrmFacturas.dbnFacturasClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbPost, nbDelete: RefreshData([Id]);
  end;
end;

procedure TfrmFacturas.SpeedButton1Click(Sender: TObject);
begin
  TfrmClientes.SelectForm(Handle,
    dbnFacturas.DataSource.DataSet.FieldByName('id_cliente').AsInteger,False);
end;

procedure TfrmFacturas.FormActivate(Sender: TObject);
begin
  if (not Assigned(frmFacturas)) or (PostDataset.State in dsEditModes) then Exit;

  RefreshData([Id]);
end;

procedure TfrmFacturas.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;
end;

procedure TfrmFacturas.mnImprimirClick(Sender: TObject);
begin
  TqrpFacturas.Imprimir;
end;

class function TfrmFacturas.SiguienteFactura: string;
begin
  Result := TdmClientes.SiguienteFactura;
end;

class function TfrmFacturas.VentaFacturada(nIdVenta: Integer): Boolean;
begin
  Result := TdmClientes.VentaFacturada(nIdVenta); 
end;

end.
