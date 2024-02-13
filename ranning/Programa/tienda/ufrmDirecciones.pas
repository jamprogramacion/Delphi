unit ufrmDirecciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, DBCtrls, ExtCtrls, uJAMContainers, Grids, DBGrids,
  Buttons, StdCtrls, Mask, JAMDBLabelEdit;

type
  TfrmDirecciones = class(TfrmMDIChildBase)
    JAMPanel3: TJAMPanel;
    dbnDirecciones: TDBNavigator;
    pnCombos: TJAMPanel;
    dbeProvincia: TJAMDBLabelEdit;
    btnProvinciaMunicipio: TSpeedButton;
    dbeMunicipio: TJAMDBLabelEdit;
    dbeTipoVia: TJAMDBLabelEdit;
    btnTipoVia: TSpeedButton;
    JAMDBLabelEdit1: TJAMDBLabelEdit;
    JAMDBLabelEdit2: TJAMDBLabelEdit;
    JAMDBLabelEdit3: TJAMDBLabelEdit;
    JAMDBLabelEdit4: TJAMDBLabelEdit;
    JAMDBLabelEdit5: TJAMDBLabelEdit;
    procedure btnProvinciaMunicipioClick(Sender: TObject);
    procedure btnTipoViaClick(Sender: TObject);
    procedure dbeProvinciaEnter(Sender: TObject);
    procedure dbeMunicipioEnter(Sender: TObject);
    procedure dbeTipoViaEnter(Sender: TObject);
    procedure dbnDireccionesBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    hndOpener: HWND;
    nIdCliente: Integer;

    procedure MProvMuni(var Message: TMessage); message MSG_PROV_MUNI;
    procedure MTipoVia(var Message: TMessage); message MSG_TIPO_VIA;
  protected
    class procedure ShowForm; overload; override;
  public
    class procedure ShowForm(nIdCliente, nIdDireccion: Integer); reintroduce; overload;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses ufrmProvMuni, uCommon, db, ufrmTiposVia, udmDirecciones, udmRanning;

{$R *.DFM}

{ TfrmDirecciones }

var
  frmDirecciones: TfrmDirecciones = nil;

constructor TfrmDirecciones.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmDirecciones) then dmDirecciones := TdmDirecciones.Create(Self);
  PostDataset := dbnDirecciones.DataSource.DataSet;
  DatasetList.Add(dbnDirecciones.DataSource.DataSet);
end;

procedure TfrmDirecciones.MProvMuni(var Message: TMessage);

var
  sCdProv: string;
  sCdMuni: string;

begin
  if (Message.WParam + Message.LParam) = 0 then Exit;

  sCdProv := PadLeft(IntToStr(Message.WParam),'0',2);
  sCdMuni := PadLeft(IntToStr(Message.LParam),'0',4);
  if not (dbnDirecciones.DataSource.State in dsEditModes) then
    dbnDirecciones.DataSource.DataSet.Edit;
  dbnDirecciones.DataSource.DataSet.FieldByName('id_provincia').AsString := sCdProv;
  dbnDirecciones.DataSource.DataSet.FieldByName('id_municipio').AsString := sCdMuni;
  dbnDirecciones.DataSource.DataSet.FieldByName('ds_provincia').AsString :=
    TfrmProvMuni.DsProvincia(sCdProv);
  dbnDirecciones.DataSource.DataSet.FieldByName('ds_municipio').AsString :=
    TfrmProvMuni.DsMunicipio(sCdProv,sCdMuni);
end;

class procedure TfrmDirecciones.ShowForm;
begin
  if not Assigned(frmDirecciones) then begin
    frmDirecciones := TfrmDirecciones.Create(Application);
    frmDirecciones.Id := nvDirecciones;
  end;

  frmDirecciones.RefreshData([frmDirecciones.Id]);
  frmDirecciones.WindowState := wsNormal;
  frmDirecciones.Show;
end;

class procedure TfrmDirecciones.ShowForm(nIdCliente, nIdDireccion: Integer);
begin
  ShowForm;
  frmDirecciones.nIdCliente := nIdCliente;
  frmDirecciones.dbnDirecciones.DataSource.DataSet.Locate('id_direccion',nIdDireccion,[]);
end;

procedure TfrmDirecciones.btnProvinciaMunicipioClick(Sender: TObject);
begin
  TfrmProvMuni.ShowForm(Handle,
    dbnDirecciones.DataSource.DataSet.FieldByName('id_provincia').AsString,
    dbnDirecciones.DataSource.DataSet.FieldByName('id_municipio').AsString);
end;

procedure TfrmDirecciones.MTipoVia(var Message: TMessage);

var
  sIdTipoVia: string;
  sDsTipoVia: string;

begin
  if (Message.WParam + Message.LParam) = 0 then Exit;

  sIdTipoVia := PChar(Message.WParam);
  sDsTipoVia := PChar(Message.LParam);
  if not (dbnDirecciones.DataSource.State in dsEditModes) then
    dbnDirecciones.DataSource.DataSet.Edit;
  dbnDirecciones.DataSource.DataSet.FieldByName('id_tipo_via').AsString :=
    sIdTipoVia;
  dbnDirecciones.DataSource.DataSet.FieldByName('ds_tipo_via').AsString :=
    sDsTipoVia;
end;

procedure TfrmDirecciones.btnTipoViaClick(Sender: TObject);
begin
  TfrmTiposVia.ShowForm(Handle,
    dbnDirecciones.DataSource.DataSet.FieldByName('id_tipo_via').AsString);
end;

procedure TfrmDirecciones.dbeProvinciaEnter(Sender: TObject);
begin
  if dbeProvincia.Field.IsNull then btnProvinciaMunicipioClick(Sender);
end;

procedure TfrmDirecciones.dbeMunicipioEnter(Sender: TObject);
begin
  if dbeMunicipio.Field.IsNull then btnProvinciaMunicipioClick(Sender);
end;

procedure TfrmDirecciones.dbeTipoViaEnter(Sender: TObject);
begin
  if dbeTipoVia.Field.IsNull then btnTipoViaClick(Sender);
end;

procedure TfrmDirecciones.dbnDireccionesBeforeAction(Sender: TObject;
  Button: TNavigateBtn);

var
  sDir: string;
  DataSet: TDataSet;
  nIdDir: Integer;

begin
  case Button of
    nbDelete: begin
      DataSet := dbnDirecciones.DataSource.DataSet;
      sDir := '¿Estás seguro de borrar la dirección?' + #13 + #10 +
        DataSet.FieldByName('ds_direccion').AsString;
      if MessageDlg(sDir,mtWarning,[mbYes,mbNo],0) <> mrYes then Abort;

      nIdDir := DataSet.FieldByName('id_direccion').AsInteger;
      dmDirecciones.sqlDireccionesDelete.ExecSQL;
      dmRanning.TablaModificada('direcciones','id_direccion',nIdDir,raDelete);
      dmRanning.TablaModificada('clientes_direcciones','id_direccion',nIdDir,raDelete);
      WindowState := wsMinimized;
    end;
    nbInsert: dmDirecciones.IdCliente := nIdCliente;
    else
      WindowState := wsMinimized;
  end;
end;

end.
