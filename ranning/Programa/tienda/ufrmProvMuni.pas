unit ufrmProvMuni;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, ExtCtrls, uJAMContainers, DBCtrls,
  StdCtrls, Buttons, Menus;

type
  TfrmProvMuni = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    JAMPanel2: TJAMPanel;
    dbgProvincias: TDBGrid;
    dbgMunicipios: TDBGrid;
    JAMPanel3: TJAMPanel;
    dbnCarreras: TDBNavigator;
    JAMPanel4: TJAMPanel;
    DBNavigator1: TDBNavigator;
    JAMPanel5: TJAMPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    mnuMunicipios: TPopupMenu;
    mnuCambiaCP: TMenuItem;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgProvinciasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgMunicipiosKeyPress(Sender: TObject; var Key: Char);
    procedure mnuCambiaCPClick(Sender: TObject);
  private
    hndOpener: HWND;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; overload; override;
    class procedure ShowForm(hndCallBack: HWND;
      const sCdProv, sCdMuni: string); reintroduce; overload;
    class function DsProvincia(const sCdProvincia: string): string;
    class function DsMunicipio(const sCdProvincia, sCdMunicipio: string): string;
  end;

implementation

uses udmDirecciones, db;

{$R *.DFM}

{ TfrmProvMuni }

var
  frmProvMuni: TfrmProvMuni = nil;

constructor TfrmProvMuni.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmDirecciones) then
    dmDirecciones := TdmDirecciones.Create(Self);
  DatasetList.Add(dbgProvincias.DataSource.DataSet);
  DatasetList.Add(dbgMunicipios.DataSource.DataSet);
end;

class procedure TfrmProvMuni.ShowForm;
begin
  if not Assigned(frmProvMuni) then begin
    frmProvMuni := TfrmProvMuni.Create(Application);
    frmProvMuni.Id := nvProvMuni;
  end;

  frmProvMuni.RefreshData([frmProvMuni.Id]);
  frmProvMuni.WindowState := wsNormal;
  frmProvMuni.Show;
end;

class procedure TfrmProvMuni.ShowForm(hndCallBack: HWND;
  const sCdProv, sCdMuni: string);
begin
  ShowForm;
  frmProvMuni.hndOpener := hndCallBack;
  if sCdProv = '' then Exit;

  dmDirecciones.sqlProvincias.Locate('id_provincia',sCdProv,[]);
  dmDirecciones.sqlMunicipios.Locate('id_municipio',sCdMuni,[]);
end;

procedure TfrmProvMuni.btnAceptarClick(Sender: TObject);
begin
  PostMessage(hndOpener,MSG_PROV_MUNI,
    dmDirecciones.sqlProvincias.FieldByName('id_provincia').AsInteger,
    dmDirecciones.sqlMunicipios.FieldByName('id_municipio').AsInteger);
  WindowState := wsMinimized;
end;

procedure TfrmProvMuni.btnCancelarClick(Sender: TObject);
begin
  PostMessage(hndOpener,MSG_PROV_MUNI,0,0);
  WindowState := wsMinimized;
end;

class function TfrmProvMuni.DsMunicipio(const sCdProvincia,
  sCdMunicipio: string): string;
begin
  Result := '';
  if not dmDirecciones.sqlMunicipios.Locate('id_provincia;id_municipio',
    VarArrayOf([sCdProvincia,sCdMunicipio]),[]) then
    Exit;

  Result := dmDirecciones.sqlMunicipios.FieldByName('ds_municipio').AsString;
end;

class function TfrmProvMuni.DsProvincia(const sCdProvincia: string): string;
begin
  Result := '';
  if not dmDirecciones.sqlProvincias.Locate('id_provincia',sCdProvincia,[]) then
    Exit;

  Result := dmDirecciones.sqlProvincias.FieldByName('ds_provincia').AsString;
end;

procedure TfrmProvMuni.dbgProvinciasKeyPress(Sender: TObject;
  var Key: Char);
begin
  dbgProvincias.DataSource.DataSet.Locate('ds_provincia',Key,[loCaseInsensitive,
    loPartialKey]);
end;

procedure TfrmProvMuni.dbgMunicipiosKeyPress(Sender: TObject;
  var Key: Char);
begin
  dbgMunicipios.DataSource.DataSet.Locate('ds_municipio',Key,[loCaseInsensitive,
    loPartialKey]);
end;

procedure TfrmProvMuni.mnuCambiaCPClick(Sender: TObject);

var
  sCP: string;

begin
  sCP := dbgMunicipios.DataSource.DataSet.FieldByName('ds_cp').AsString;
  if InputQuery('Actualización de CP','CP:',sCP) then begin
    dmDirecciones.ActualizaCP(sCP);
    RefreshData([Id]);
  end;
end;

end.
