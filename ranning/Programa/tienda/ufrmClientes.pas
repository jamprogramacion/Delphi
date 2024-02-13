unit ufrmClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, StdCtrls, Mask, DBCtrls, JAMDBLabelEdit, Buttons,
  Grids, DBGrids, ExtCtrls, uJAMContainers, uJAMDBControls, JAMLabelEdit,
  Menus;

type
  TfrmClientes = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbgClientes: TDBGrid;
    JAMPanel3: TJAMPanel;
    dbnClientes: TDBNavigator;
    pnCombos: TJAMPanel;
    dbePrimerApellido: TJAMDBLabelEdit;
    JAMDBLabelEdit2: TJAMDBLabelEdit;
    JAMDBLabelEdit3: TJAMDBLabelEdit;
    JAMDBNIFLabelEdit4: TJAMDBNIFLabelEdit;
    JAMDBLabelEdit5: TJAMDBLabelEdit;
    JAMDBLabelEdit6: TJAMDBLabelEdit;
    JAMDBLabelEdit7: TJAMDBLabelEdit;
    JAMDBMemo1: TJAMDBMemo;
    JAMDBLabelEdit10: TJAMDBLabelEdit;
    Label1: TLabel;
    dbcbSexo: TJAMDBIdComboBox;
    dbcbClub: TJAMDBIdComboBox;
    Label2: TLabel;
    Label3: TLabel;
    pnSelect: TJAMPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    JAMDBLabelEdit11: TJAMDBLabelEdit;
    dbgDirecciones: TDBGrid;
    Label5: TLabel;
    JAMPanel2: TJAMPanel;
    edBusqueda: TJAMLabelEdit;
    SpeedButton1: TSpeedButton;
    mnuClientes: TPopupMenu;
    mnuCopiaEmail: TMenuItem;
    mnuCopiarDNI: TMenuItem;
    mnuDirecciones: TPopupMenu;
    mnuCopiaAPresupuesto: TMenuItem;
    mnuEtiquetaDireccion: TMenuItem;
    mnuEtiquetaDireccionConTelefono: TMenuItem;
    mnuEtiquetaDireccionSinTelefono: TMenuItem;
    JAMDBLabelEdit1: TJAMDBLabelEdit;
    procedure FormActivate(Sender: TObject);
    procedure dbnClientesClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgDireccionesDblClick(Sender: TObject);
    procedure edBusquedaChange(Sender: TObject);
    procedure dbnClientesBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure mnuCopiaEmailClick(Sender: TObject);
    procedure mnuCopiarDNIClick(Sender: TObject);
    procedure mnuDireccionesPopup(Sender: TObject);
    procedure mnuCopiaAPresupuestoClick(Sender: TObject);
    procedure mnuEtiquetaDireccionConTelefonoClick(Sender: TObject);
    procedure mnuEtiquetaDireccionSinTelefonoClick(Sender: TObject);
  private
    hndOpener: HWND;

    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; override;
    class procedure SelectForm(hndCallBack: HWND; nIdCliente: Integer;
      lModificar: Boolean);
  end;

implementation

uses udmClientes, db, ufrmDirecciones, udmDirecciones, udmRanning,
  uqrpEtiquetaEnvio;

{$R *.DFM}

{ TfrmClientes }

var
  frmClientes: TfrmClientes = nil;

constructor TfrmClientes.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmClientes) then dmClientes := TdmClientes.Create(Self);
  PostDataset := dbgClientes.DataSource.DataSet;
  DatasetList.Add(dbgClientes.DataSource.DataSet);
  DatasetList.Add(dbgDirecciones.DataSource.DataSet);
  DatasetList.Add(dbcbSexo.ListDataSource.DataSet);
  DatasetList.Add(dbcbClub.ListDataSource.DataSet);
  CombosPanelList.Add(pnCombos);
end;

procedure TfrmClientes.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  FillAllLists(pnCombos);
end;

class procedure TfrmClientes.ShowForm;
begin
  if not Assigned(frmClientes) then begin
    frmClientes := TfrmClientes.Create(Application);
    frmClientes.Id := nvClientes;
  end;

  frmClientes.RefreshData([frmClientes.Id]);
  frmClientes.WindowState := wsNormal;
  frmClientes.pnSelect.Hide;
  frmClientes.pnCombos.Enabled := True;
  frmClientes.dbnClientes.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,
    nbInsert,nbDelete,nbEdit,nbPost,nbCancel];
  frmClientes.Show;
end;

procedure TfrmClientes.FormActivate(Sender: TObject);
begin
  if (not Assigned(frmClientes)) or (PostDataset.State in dsEditModes) then Exit;

  RefreshData([Id]);
  dmClientes.SincronizaClientesBusqueda(Trim(edBusqueda.Text));
end;

procedure TfrmClientes.dbnClientesClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbPost, nbDelete: RefreshData([Id]);
    nbInsert: ActualizaCombos;
  end;
end;

class procedure TfrmClientes.SelectForm(hndCallBack: HWND;
  nIdCliente: Integer; lModificar: Boolean);
begin
  ShowForm;
  frmClientes.hndOpener := hndCallBack;
  frmClientes.pnSelect.Show;
  frmClientes.pnCombos.Enabled := lModificar;
  if lModificar then
    frmClientes.dbnClientes.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,
      nbInsert,nbDelete,nbEdit,nbPost,nbCancel]
  else
    frmClientes.dbnClientes.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
  if nIdCliente = -1 then Exit;

  frmClientes.dbgClientes.DataSource.DataSet.Locate('id_cliente',nIdCliente,[]);
end;

procedure TfrmClientes.btnAceptarClick(Sender: TObject);
begin
  PostMessage(hndOpener,MSG_CLIENTE,
    dbnClientes.DataSource.DataSet.FieldByName('id_cliente').AsInteger,0);
  WindowState := wsMinimized;
end;

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  PostMessage(hndOpener,MSG_CLIENTE,-1,-1);
  WindowState := wsMinimized;
end;

procedure TfrmClientes.dbgDireccionesDblClick(Sender: TObject);
begin
  TfrmDirecciones.ShowForm(dbgClientes.DataSource.DataSet.FieldByName('id_cliente').AsInteger,
    dbgDirecciones.DataSource.DataSet.FieldByName('id_direccion').AsInteger);
end;

procedure TfrmClientes.edBusquedaChange(Sender: TObject);
begin
  dmClientes.SincronizaClientesBusqueda(Trim(edBusqueda.Text));
end;

procedure TfrmClientes.dbnClientesBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then dbePrimerApellido.SetFocus;
end;

procedure TfrmClientes.SpeedButton1Click(Sender: TObject);
begin
  edBusqueda.Clear;
end;

procedure TfrmClientes.mnuCopiaEmailClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgClientes.DataSource.DataSet.FieldByName('ds_email').AsString);
end;

procedure TfrmClientes.mnuCopiarDNIClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgClientes.DataSource.DataSet.FieldByName('ds_dni').AsString);
end;

procedure TfrmClientes.mnuDireccionesPopup(Sender: TObject);
begin
  mnuCopiaAPresupuesto.Enabled := not dbgDirecciones.DataSource.DataSet.IsEmpty;
end;

procedure TfrmClientes.mnuCopiaAPresupuestoClick(Sender: TObject);
begin
  if not WindowOpened(Id,nvPresupuesto,True) then Exit;

  dmClientes.CopiaDireccionAPresupuesto;
  RefreshData([nvPresupuesto]);
end;

procedure TfrmClientes.mnuEtiquetaDireccionConTelefonoClick(
  Sender: TObject);
begin
  TqrpEtiquetaEnvio.PrintAddressLabel(True);
end;

procedure TfrmClientes.mnuEtiquetaDireccionSinTelefonoClick(
  Sender: TObject);
begin
  TqrpEtiquetaEnvio.PrintAddressLabel(False);
end;

end.
