unit ufrmTipoComplemento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, ExtCtrls, uJAMContainers, DBCtrls, Grids, DBGrids,
  StdCtrls, Mask, JAMDBLabelEdit;

type
  TfrmTipoComplemento = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    JAMPanel2: TJAMPanel;
    dbgTipoComplemento: TDBGrid;
    DBNavigator1: TDBNavigator;
    dbeDsTipoComplemento: TJAMDBLabelEdit;
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure dbgTipoComplementoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; overload; override;
  end;

implementation

uses udmProductos, DB;

{$R *.DFM}

var
  frmTipoComplemento: TfrmTipoComplemento = nil;

{ TfrmTipoComplemento }

constructor TfrmTipoComplemento.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmProductos) then dmProductos := TdmProductos.Create(Self);
  PostDataset := dbgTipoComplemento.DataSource.DataSet;
  DatasetList.Add(dbgTipoComplemento.DataSource.DataSet);
end;

procedure TfrmTipoComplemento.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;
end;

class procedure TfrmTipoComplemento.ShowForm;
begin
  if not Assigned(frmTipoComplemento) then begin
    frmTipoComplemento := TfrmTipoComplemento.Create(Application);
    frmTipoComplemento.Id := nvTipoComplemento
  end;

  frmTipoComplemento.RefreshData([frmTipoComplemento.Id]);
  frmTipoComplemento.WindowState := wsNormal;
  frmTipoComplemento.Show;
end;

procedure TfrmTipoComplemento.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then dbeDsTipoComplemento.SetFocus;
end;

procedure TfrmTipoComplemento.dbgTipoComplementoKeyPress(Sender: TObject;
  var Key: Char);
begin
  dbgTipoComplemento.DataSource.DataSet.Locate('ds_tipo_complemento',Key,
    [loCaseInsensitive,loPartialKey]);
end;

end.
