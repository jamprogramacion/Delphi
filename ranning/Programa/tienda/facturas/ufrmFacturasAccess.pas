unit ufrmFacturasAccess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DBCtrls, ExtCtrls, uJAMContainers, Menus;

type
  TfrmFacturasAccess = class(TForm)
    JAMPanel1: TJAMPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    JAMPanel5: TJAMPanel;
    JAMPanel2: TJAMPanel;
    JAMPanel3: TJAMPanel;
    JAMPanel4: TJAMPanel;
    mnuPrincipal: TMainMenu;
    mnuAbrir: TMenuItem;
    mnuSalir: TMenuItem;
    JAMPanel6: TJAMPanel;
    JAMPanel7: TJAMPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    btnFacturar: TButton;
    procedure mnuSalirClick(Sender: TObject);
    procedure mnuAbrirClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFacturasAccess: TfrmFacturasAccess;

implementation

uses udmFacturasAccess;

{$R *.DFM}

procedure TfrmFacturasAccess.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFacturasAccess.mnuAbrirClick(Sender: TObject);
begin
  dmFacturasAccess.OpenDatabase;
end;

procedure TfrmFacturasAccess.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button <> nbRefresh then Exit;

  dmFacturasAccess.RefreshData;
  Abort;
end;

end.
