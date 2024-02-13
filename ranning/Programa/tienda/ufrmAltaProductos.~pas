unit ufrmAltaProductos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, DBCtrls, uJAMDBControls, StdCtrls, Mask, JAMDBLabelEdit,
  ExtCtrls, uJAMContainers, Buttons;

type
  TfrmAltaProductos = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbleCdProducto: TJAMDBLabelEdit;
    JAMDBLabelEdit2: TJAMDBLabelEdit;
    JAMDBLabelEdit3: TJAMDBLabelEdit;
    JAMDBLabelEdit4: TJAMDBLabelEdit;
    JAMDBCheckBox1: TJAMDBCheckBox;
    JAMDBMemo1: TJAMDBMemo;
    Label1: TLabel;
    JAMPanel3: TJAMPanel;
    pnCombos: TJAMPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbcbMarca: TJAMDBIdComboBox;
    dbnAltaProductos: TDBNavigator;
    dbcbTipoComplemento: TJAMDBIdComboBox;
    dbcbTipoDeporte: TJAMDBIdComboBox;
    dbcbTipoProducto: TJAMDBIdComboBox;
    dbcbTipoSexo: TJAMDBIdComboBox;
    JAMDBLabelEdit1: TJAMDBLabelEdit;
    JAMPanel2: TJAMPanel;
    DBNavigator1: TDBNavigator;
    JAMDBCheckBox2: TJAMDBCheckBox;
    dbeFActualizacion: TJAMDBLabelEdit;
    Button1: TButton;
    JAMDBLabelEdit5: TJAMDBLabelEdit;
    procedure FormActivate(Sender: TObject);
    procedure dbnAltaProductosClick(Sender: TObject; Button: TNavigateBtn);
    procedure Button1Click(Sender: TObject);
    procedure dbnAltaProductosBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; overload; override;
    class procedure ShowForm(nIdProducto: Integer); reintroduce; overload;
  end;

implementation

uses udmProductos, db, uJAMIntf;

{$R *.DFM}

{ TfrmAltaProductos }

var
  frmAltaProductos: TfrmAltaProductos = nil;

constructor TfrmAltaProductos.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmProductos) then dmProductos := TdmProductos.Create(Self);
  PostDataset := dbleCdProducto.DataSource.DataSet;
  DatasetList.Add(dbleCdProducto.DataSource.DataSet);
  DatasetList.Add(dmProductos.sqlMarcas);
  DatasetList.Add(dmProductos.sqlTiposComplemento);
  DatasetList.Add(dmProductos.sqlTiposDeporte);
  DatasetList.Add(dmProductos.sqlTiposProducto);
  DatasetList.Add(dmProductos.sqlTiposSexo);
  CombosPanelList.Add(pnCombos);
end;

class procedure TfrmAltaProductos.ShowForm;
begin
  if not Assigned(frmAltaProductos) then begin
    frmAltaProductos := TfrmAltaProductos.Create(Application);
    frmAltaProductos.Id := nvAltaProductos;
  end;

  frmAltaProductos.RefreshData([frmAltaProductos.Id]);
  frmAltaProductos.WindowState := wsNormal;
  frmAltaProductos.Show;
end;

class procedure TfrmAltaProductos.ShowForm(nIdProducto: Integer);
begin
  ShowForm;

  frmAltaProductos.dbleCdProducto.DataSource.DataSet.Locate('id_producto',
    nIdProducto,[]);
end;

procedure TfrmAltaProductos.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  FillAllLists(pnCombos);
end;

procedure TfrmAltaProductos.FormActivate(Sender: TObject);
begin
  if (not Assigned(frmAltaProductos)) or (PostDataset.State in dsEditModes) then Exit;

  RefreshData([Id]);
end;

procedure TfrmAltaProductos.dbnAltaProductosClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbInsert: ActualizaCombos;
    nbPost: RefreshData([nvStock]);
  end;
end;

procedure TfrmAltaProductos.Button1Click(Sender: TObject);
begin
  if not (dbeFActualizacion.DataSource.State in dsEditModes) then
    dbeFActualizacion.DataSource.DataSet.Edit;
  dbeFActualizacion.Field.AsDateTime := Now;
end;

procedure TfrmAltaProductos.dbnAltaProductosBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then dbleCdProducto.SetFocus;
end;

end.
