unit ufrmVentas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, DBCtrls, ExtCtrls, uJAMContainers,
  StdCtrls, Mask, JAMDBLabelEdit, uJAMDBControls, Buttons, Menus;

type
  TfrmVentas = class(TfrmMDIChildBase)
    pnCombos1: TJAMPanel;
    dbnVentas: TDBNavigator;
    pnCombos2: TJAMPanel;
    dbgVentas: TDBGrid;
    JAMDBLabelEdit1: TJAMDBLabelEdit;
    dbeFPago: TJAMDBLabelEdit;
    JAMDBLabelEdit3: TJAMDBLabelEdit;
    dbcbVendedor: TJAMDBIdComboBox;
    Label1: TLabel;
    dbcbFormaPago: TJAMDBIdComboBox;
    Label2: TLabel;
    JAMPanel1: TJAMPanel;
    dbgVentasDetalle: TDBGrid;
    dbnVentasDetalle: TDBNavigator;
    dbeCliente: TJAMDBLabelEdit;
    SpeedButton1: TSpeedButton;
    JAMDBMemo1: TJAMDBMemo;
    Label3: TLabel;
    JAMDBLabelEdit4: TJAMDBLabelEdit;
    JAMDBLabelEdit5: TJAMDBLabelEdit;
    JAMDBLabelEdit6: TJAMDBLabelEdit;
    JAMDBLabelEdit7: TJAMDBLabelEdit;
    Label4: TLabel;
    JAMDBLabelEdit8: TJAMDBLabelEdit;
    JAMDBLabelEdit9: TJAMDBLabelEdit;
    JAMDBCheckBox1: TJAMDBCheckBox;
    mnuVentas: TMainMenu;
    mnuFacturar: TMenuItem;
    SpeedButton2: TSpeedButton;
    JAMDBLabelEdit2: TJAMDBLabelEdit;
    Label5: TLabel;
    JAMDBLabelEdit10: TJAMDBLabelEdit;
    JAMDBEdit1: TJAMDBEdit;
    JAMDBCheckBox2: TJAMDBCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbnVentasClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbnVentasBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbnVentasDetalleClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbcbFormaPagoChange(Sender: TObject);
    procedure JAMDBLabelEdit4Exit(Sender: TObject);
    procedure JAMDBLabelEdit5Exit(Sender: TObject);
    procedure JAMDBLabelEdit6Exit(Sender: TObject);
    procedure dbeFPagoExit(Sender: TObject);
    procedure mnuFacturarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure JAMDBLabelEdit3Exit(Sender: TObject);
    procedure JAMDBLabelEdit2Exit(Sender: TObject);
  private
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure MCliente(var Message: TMessage); message MSG_CLIENTE;
    procedure MProductoVenta(var Message: TMessage); message MSG_PRODUCTO_VENTA;
    function VentaTerminada: Boolean;
    function PuedeInsertarProducto: Boolean;
  protected
    function GetIsEnabled(Index: TIdVentana): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;

    class procedure ShowForm; overload; override;
  end;

implementation

uses udmVentas, udmClientes, db, udmRanning, ufrmFacturas, ufrmClientes;

{$R *.DFM}

{ TfrmVentas }

var
  frmVentas: TfrmVentas = nil;

constructor TfrmVentas.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmVentas) then dmVentas := TdmVentas.Create(Self);
  PostDataset := dbgVentas.DataSource.DataSet;
  DatasetList.Add(dbgVentas.DataSource.DataSet);
  DatasetList.Add(dbgVentasDetalle.DataSource.DataSet);
  DatasetList.Add(dbcbVendedor.ListDataSource.DataSet);
  DatasetList.Add(dbcbFormaPago.ListDataSource.DataSet);
  CombosPanelList.Add(pnCombos1);
end;

procedure TfrmVentas.MCliente(var Message: TMessage);
begin
  if (Message.WParam + Message.LParam) = -2 then Exit;

  if not (dbnVentas.DataSource.State in dsEditModes) then
    dbnVentas.DataSource.DataSet.Edit;
  dbnVentas.DataSource.DataSet.FieldByName('id_cliente').AsInteger :=
    Message.WParam;
  dbnVentas.DataSource.DataSet.FieldByName('ds_cliente').AsString :=
    TdmClientes.NombreCompletoCliente(Message.WParam);
end;

procedure TfrmVentas.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  FillAllLists(pnCombos1);
end;

class procedure TfrmVentas.ShowForm;
begin
  if not Assigned(frmVentas) then begin
    frmVentas := TfrmVentas.Create(Application);
    frmVentas.Id := nvVentas;
  end;

  frmVentas.RefreshData([frmVentas.Id]);
  frmVentas.WindowState := wsNormal;
  frmVentas.Show;
end;

procedure TfrmVentas.SpeedButton1Click(Sender: TObject);
begin
  if VentaTerminada then begin
    ShowMessage('La venta ya está cobrada. No se puede modificar');
    Exit;
  end;

  TfrmClientes.SelectForm(Handle,
    dbnVentas.DataSource.DataSet.FieldByName('id_cliente').AsInteger,False);
end;

procedure TfrmVentas.dbnVentasClick(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbPost, nbDelete: RefreshData([Id]);
    nbInsert: ActualizaCombos;
  end;
end;

function TfrmVentas.GetIsEnabled(Index: TIdVentana): Boolean;
begin
  Result := (not dbgVentas.DataSource.DataSet.IsEmpty) and (not VentaTerminada);
end;

procedure TfrmVentas.dbnVentasBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbEdit) and VentaTerminada then begin
    ShowMessage('La venta ya está cobrada. No se puede modificar');
    Abort;
  end;
end;

function TfrmVentas.VentaTerminada: Boolean;
begin
  Result := dmRanning.ItFieldMarked(
    dbgVentas.DataSource.DataSet.FieldByName('it_terminada'));
end;

procedure TfrmVentas.MProductoVenta(var Message: TMessage);

var
  pProducto: TProductoVenta;

begin
  if not PuedeInsertarProducto then Exit;

  pProducto := TProductoVenta(Message.WParam);
  dmVentas.InsertaProducto(pProducto.IdProducto,pProducto.IdTalla,
    pProducto.CdColor);

  ActualizaCombos;
end;

procedure TfrmVentas.dbnVentasDetalleClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbPost, nbDelete: RefreshData([Id]);
  end;
end;

function TfrmVentas.PuedeInsertarProducto: Boolean;
begin
  Result := (not VentaTerminada) and
    (not (dbgVentas.DataSource.State in dsEditModes)) and
    (dbgVentas.DataSource.DataSet.RecordCount <> 0);
end;


procedure TfrmVentas.dbcbFormaPagoChange(Sender: TObject);
begin
  if (not Assigned(dbcbFormaPago.DataSource)) or
     (not (dbcbFormaPago.DataSource.State in dsEditModes)) then Exit;
  
  dbcbFormaPago.DataSource.DataSet.FieldByName('nm_comision_pago').AsFloat :=
    dmVentas.ComisionPago(dbcbFormaPago.Id);
end;

procedure TfrmVentas.JAMDBLabelEdit4Exit(Sender: TObject);
begin
  dmVentas.ActualizaPrecios;
end;

procedure TfrmVentas.JAMDBLabelEdit5Exit(Sender: TObject);
begin
  dmVentas.ActualizaPrecios;
end;

procedure TfrmVentas.JAMDBLabelEdit6Exit(Sender: TObject);
begin
  dmVentas.ActualizaPrecios;
end;

procedure TfrmVentas.dbeFPagoExit(Sender: TObject);
begin
  dmVentas.ActualizaVentaTerminada;
end;

procedure TfrmVentas.mnuFacturarClick(Sender: TObject);

var
  nIdVenta: Integer;

begin
  nIdVenta := dbgVentas.DataSource.DataSet.FieldByName('id_venta').AsInteger;
  if not VentaTerminada then begin
    ShowMessage('No se puede facturar hasta terminar la venta');
    Exit;
  end
  else if TfrmFacturas.VentaFacturada(nIdVenta) then begin
    ShowMessage('Esta venta ya ha sido facturada');
    Exit;
  end;

  dmVentas.FacturarVenta(nIdVenta,TfrmFacturas.SiguienteFactura);
  ShowMessage('Venta facturada');
end;

procedure TfrmVentas.SpeedButton2Click(Sender: TObject);
begin
  if not (dbeFPago.DataSource.State in dsEditModes) then
    dbeFPago.DataSource.DataSet.Edit;
  dbeFPago.Field.AsDateTime := Date;
  dmVentas.ActualizaVentaTerminada;
end;

procedure TfrmVentas.JAMDBLabelEdit3Exit(Sender: TObject);
begin
  dmVentas.ActualizaGastosEnvio;
end;

procedure TfrmVentas.JAMDBLabelEdit2Exit(Sender: TObject);
begin
  dmVentas.ActualizaGastosEnvio;
end;

end.
