unit ufrmCarreras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, ExtCtrls, uJAMContainers, StdCtrls,
  DBCtrls, uJAMDBControls, Mask, JAMDBLabelEdit, Buttons, ComCtrls;

type
  TfrmCarreras = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    pnCombos: TJAMPanel;
    dbeFFecha: TJAMDBLabelEdit;
    JAMDBLabelEdit2: TJAMDBLabelEdit;
    JAMDBLabelEdit3: TJAMDBLabelEdit;
    JAMDBLabelEdit4: TJAMDBLabelEdit;
    JAMDBLabelEdit5: TJAMDBLabelEdit;
    JAMDBLabelEdit6: TJAMDBLabelEdit;
    JAMDBMemo1: TJAMDBMemo;
    Label1: TLabel;
    JAMPanel3: TJAMPanel;
    dbnCarreras: TDBNavigator;
    JAMDBCheckBox1: TJAMDBCheckBox;
    dbgCarreras: TDBGrid;
    dbeProvincia: TJAMDBLabelEdit;
    dbeMunicipio: TJAMDBLabelEdit;
    btnProvinciaMunicipio: TSpeedButton;
    dtFFecha: TDateTimePicker;
    procedure dbnCarrerasClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnProvinciaMunicipioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbeProvinciaEnter(Sender: TObject);
    procedure dbeMunicipioEnter(Sender: TObject);
    procedure dtFFechaCloseUp(Sender: TObject);
    procedure dbeFFechaChange(Sender: TObject);
    procedure dbeFFechaExit(Sender: TObject);
  private
    procedure MProvMuni(var Message: TMessage); message MSG_PROV_MUNI;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; override;
  end;

implementation

uses udmCarreras, uCommon, ufrmProvMuni, db;

{$R *.DFM}

{ TfrmCarreras }

var
  frmCarreras: TfrmCarreras = nil;

constructor TfrmCarreras.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmCarreras) then dmCarreras := TdmCarreras.Create(Self);
  PostDataset := dbgCarreras.DataSource.DataSet;
  DatasetList.Add(dbgCarreras.DataSource.DataSet);
  CombosPanelList.Add(pnCombos);
  dtFFecha.Top := dbeFFecha.Top;
  dtFFecha.SendToBack;
end;

class procedure TfrmCarreras.ShowForm;
begin
  if not Assigned(frmCarreras) then begin
    frmCarreras := TfrmCarreras.Create(Application);
    frmCarreras.Id := nvCarreras;
  end;

  frmCarreras.RefreshData([frmCarreras.Id]);
  frmCarreras.WindowState := wsNormal;
  frmCarreras.Show;
end;

procedure TfrmCarreras.dbnCarrerasClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbPost, nbDelete: RefreshData([Id]);
    nbInsert: ActualizaCombos;
  end;
end;

procedure TfrmCarreras.MProvMuni(var Message: TMessage);

var
  sCdProv: string;
  sCdMuni: string;

begin
  if (Message.WParam + Message.LParam) = 0 then Exit;

  sCdProv := PadLeft(IntToStr(Message.WParam),'0',2);
  sCdMuni := PadLeft(IntToStr(Message.LParam),'0',4);
  if not (dbnCarreras.DataSource.State in dsEditModes) then
    dbnCarreras.DataSource.DataSet.Edit;
  dbnCarreras.DataSource.DataSet.FieldByName('id_provincia').AsString := sCdProv;
  dbnCarreras.DataSource.DataSet.FieldByName('id_municipio').AsString := sCdMuni;
  dbnCarreras.DataSource.DataSet.FieldByName('ds_provincia').AsString :=
    TfrmProvMuni.DsProvincia(sCdProv);
  dbnCarreras.DataSource.DataSet.FieldByName('ds_municipio').AsString :=
    TfrmProvMuni.DsMunicipio(sCdProv,sCdMuni);
end;

procedure TfrmCarreras.btnProvinciaMunicipioClick(Sender: TObject);
begin
  TfrmProvMuni.ShowForm(Handle,
    dbnCarreras.DataSource.DataSet.FieldByName('id_provincia').AsString,
    dbnCarreras.DataSource.DataSet.FieldByName('id_municipio').AsString);
end;

procedure TfrmCarreras.FormActivate(Sender: TObject);
begin
  if (not Assigned(frmCarreras)) or (PostDataset.State in dsEditModes) then Exit;
  
  RefreshData([Id]);
end;

procedure TfrmCarreras.dbeProvinciaEnter(Sender: TObject);
begin
  if dbeProvincia.Field.IsNull then btnProvinciaMunicipioClick(Sender);
end;

procedure TfrmCarreras.dbeMunicipioEnter(Sender: TObject);
begin
  if dbeMunicipio.Field.IsNull then btnProvinciaMunicipioClick(Sender);
end;

procedure TfrmCarreras.dtFFechaCloseUp(Sender: TObject);
begin
  if dbeFFecha.Field.AsDateTime = dtFFecha.DateTime then Exit;

  if not (dbeFFecha.DataSource.State in dsEditModes) then
    dbeFFecha.DataSource.Edit;

  dbeFFecha.Field.AsDateTime := dtFFecha.DateTime;
end;

procedure TfrmCarreras.dbeFFechaChange(Sender: TObject);
begin
  dtFFecha.DateTime := dbeFFecha.Field.AsDateTime;
end;

procedure TfrmCarreras.dbeFFechaExit(Sender: TObject);
begin
  dtFFecha.DateTime := StrToDate(dbeFFecha.Text);
end;

end.
