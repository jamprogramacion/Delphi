unit ufrmTiposVia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls,
  uJAMContainers;

type
  TfrmTiposVia = class(TfrmMDIChildBase)
    JAMPanel4: TJAMPanel;
    dbnTiposVia: TDBNavigator;
    JAMPanel5: TJAMPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    JAMPanel2: TJAMPanel;
    dbgTiposVia: TDBGrid;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgTiposViaKeyPress(Sender: TObject; var Key: Char);
  private
    hndOpener: HWND;
    sIdTipoVia: string;
    sDsTipoVia: string;

  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; overload; override;
    class procedure ShowForm(hndCallBack: HWND; const sCdTipoVia: string); reintroduce; overload;
    class function DsTipoVia(const sCdTipoVia: string): string;
  end;

implementation

uses udmDirecciones, db;

{$R *.DFM}

var
  frmTiposVia: TfrmTiposVia = nil;

procedure TfrmTiposVia.btnAceptarClick(Sender: TObject);
begin
  sIdTipoVia := dbnTiposVia.DataSource.DataSet.FieldByName('id_tipo_via').AsString;
  sDsTipoVia := dbnTiposVia.DataSource.DataSet.FieldByName('ds_tipo_via').AsString;
  PostMessage(hndOpener,MSG_TIPO_VIA,Integer(PChar(sIdTipoVia)),Integer(PChar(sDsTipoVia)));
  WindowState := wsMinimized;
end;

procedure TfrmTiposVia.btnCancelarClick(Sender: TObject);
begin
  PostMessage(hndOpener,MSG_TIPO_VIA,0,0);
  WindowState := wsMinimized;
end;

constructor TfrmTiposVia.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmDirecciones) then
    dmDirecciones := TdmDirecciones.Create(Self);
  DatasetList.Add(dbgTiposVia.DataSource.DataSet);
end;

class function TfrmTiposVia.DsTipoVia(const sCdTipoVia: string): string;
begin
  dmDirecciones.sqlTiposVia.Locate('id_tipo_via',sCdTipoVia,[]);
  Result := dmDirecciones.sqlTiposVia.FieldByName('ds_tipo_via').AsString;
end;

class procedure TfrmTiposVia.ShowForm;
begin
  if not Assigned(frmTiposVia) then begin
    frmTiposVia := TfrmTiposVia.Create(Application);
    frmTiposVia.Id := nvProvMuni;
  end;

  frmTiposVia.RefreshData([frmTiposVia.Id]);
  frmTiposVia.WindowState := wsNormal;
  frmTiposVia.Show;
end;

class procedure TfrmTiposVia.ShowForm(hndCallBack: HWND;
  const sCdTipoVia: string);
begin
  ShowForm;
  frmTiposVia.hndOpener := hndCallBack;
  if sCdTipoVia = '' then Exit;

  dmDirecciones.sqlTiposVia.Locate('id_tipo_via',sCdTipoVia,[]);
end;

procedure TfrmTiposVia.dbgTiposViaKeyPress(Sender: TObject; var Key: Char);
begin
  dbgTiposVia.DataSource.DataSet.Locate('ds_tipo_via',Key,[loCaseInsensitive,
    loPartialKey]);
end;

end.
