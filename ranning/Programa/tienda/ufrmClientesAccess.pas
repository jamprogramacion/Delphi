unit ufrmClientesAccess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, ExtCtrls, uJAMContainers, Buttons,
  StdCtrls, JAMLabelEdit, Menus;

type
  TfrmClientesAccess = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbgClientesAccess: TDBGrid;
    JAMPanel2: TJAMPanel;
    edBusqueda: TJAMLabelEdit;
    btnBorrarBusqueda: TSpeedButton;
    mnuClientesAccess: TPopupMenu;
    mnuCopiaEmail: TMenuItem;
    mnuCopiarDNI: TMenuItem;
    procedure btnBorrarBusquedaClick(Sender: TObject);
    procedure edBusquedaChange(Sender: TObject);
    procedure mnuCopiaEmailClick(Sender: TObject);
    procedure mnuClientesAccessPopup(Sender: TObject);
    procedure mnuCopiarDNIClick(Sender: TObject);
  private
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; override;
  end;

implementation

uses udmClientes, udmRanning;

{$R *.DFM}

var
  frmClientesAccess: TfrmClientesAccess = nil;

{ TfrmClientesAccess }

constructor TfrmClientesAccess.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmClientes) then dmClientes := TdmClientes.Create(Self);
  DatasetList.Add(dbgClientesAccess.DataSource.DataSet);
end;

procedure TfrmClientesAccess.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  dmClientes.BusquedaClientesAccess(edBusqueda.Text);
end;

class procedure TfrmClientesAccess.ShowForm;
begin
  if not Assigned(frmClientesAccess) then begin
    frmClientesAccess := TfrmClientesAccess.Create(Application);
    frmClientesAccess.Id := nvClientesAccess;
  end;

  frmClientesAccess.RefreshData([frmClientesAccess.Id]);
  frmClientesAccess.WindowState := wsNormal;
  frmClientesAccess.Show;
end;

procedure TfrmClientesAccess.btnBorrarBusquedaClick(Sender: TObject);
begin
  inherited;

  edBusqueda.Clear;
  RefreshData([Id]);
end;

procedure TfrmClientesAccess.edBusquedaChange(Sender: TObject);
begin
  dmClientes.BusquedaClientesAccess(edBusqueda.Text);
end;

procedure TfrmClientesAccess.mnuCopiaEmailClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgClientesAccess.DataSource.DataSet.FieldByName('ds_email').AsString);
end;

procedure TfrmClientesAccess.mnuClientesAccessPopup(Sender: TObject);
begin
  mnuCopiaEmail.Enabled :=
    Trim(dbgClientesAccess.DataSource.DataSet.FieldByName('ds_email').AsString) <> '';
  mnuCopiarDNI.Enabled :=
    (Trim(dbgClientesAccess.DataSource.DataSet.FieldByName('ds_nif').AsString) <> '') and
    (dbgClientesAccess.DataSource.DataSet.FieldByName('ds_nif').AsString <> '0') and
    (dbgClientesAccess.DataSource.DataSet.FieldByName('ds_nif').AsString <> '0T');
end;

procedure TfrmClientesAccess.mnuCopiarDNIClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgClientesAccess.DataSource.DataSet.FieldByName('ds_nif').AsString);
end;

end.
