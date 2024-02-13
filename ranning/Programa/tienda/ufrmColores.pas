unit ufrmColores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Grids, DBGrids, DBCtrls, ExtCtrls, uJAMContainers,
  StdCtrls, Mask, JAMDBLabelEdit, uJAMDBControls;

type
  TfrmColores = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbnColores: TDBNavigator;
    dbgColores: TDBGrid;
    pnCombos: TJAMPanel;
    dbeDsColor: TJAMDBLabelEdit;
    procedure dbnColoresClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormActivate(Sender: TObject);
    procedure dbgColoresKeyPress(Sender: TObject; var Key: Char);
    procedure dbgColoresTitleClick(Column: TColumn);
    procedure dbnColoresBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  public
    constructor Create(AOwner: TComponent); override;
    class procedure ShowForm; overload; override;
  end;

implementation

uses udmColores, db;

{$R *.DFM}

{ TfrmColores }

var
  frmColores: TfrmColores = nil;

constructor TfrmColores.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmColores) then dmColores := TdmColores.Create(Self);
  PostDataset := dbgColores.DataSource.DataSet;
  DatasetList.Add(dbgColores.DataSource.DataSet);
  CombosPanelList.Add(pnCombos);
end;

class procedure TfrmColores.ShowForm;
begin
  if not Assigned(frmColores) then begin
    frmColores := TfrmColores.Create(Application);
    frmColores.Id := nvColores;
  end;

  frmColores.RefreshData([frmColores.Id]);
  frmColores.dbgColores.DataSource.DataSet.First;
  frmColores.WindowState := wsNormal;
  frmColores.Show;
end;

procedure TfrmColores.dbnColoresClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbPost: RefreshData([Id]);
    nbInsert: ActualizaCombos;
  end;
end;

procedure TfrmColores.FormActivate(Sender: TObject);
begin
  if (not Assigned(frmColores)) or (PostDataset.State in dsEditModes) then Exit;
  
  RefreshData([Id]);
end;

procedure TfrmColores.dbgColoresKeyPress(Sender: TObject; var Key: Char);
begin
  dbgColores.DataSource.DataSet.Locate('ds_color',Key,[loCaseInsensitive,
    loPartialKey]);
end;

procedure TfrmColores.dbgColoresTitleClick(Column: TColumn);
begin
  dmColores.CambiaOrdenColores(Column.FieldName);
end;

procedure TfrmColores.dbnColoresBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then dbeDsColor.SetFocus;
end;

end.
