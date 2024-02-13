unit ufrmMDIChildBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uJAMContainers, Contnrs, db, uJAMDBControls, menus;

type
  // Identificadores de cada ventana
  TIdVentana = (nvProductos,nvAltaProductos,nvStock,nvColores,nvTallas,
    nvAtributos,nvCarreras,nvProvMuni,nvDirecciones,nvClientes,nvFacturas,
    nvVentas,nvPresupuesto,nvExplorer,nvImagenProducto,nvEtiquetas,nvPDF,
    nvClientesAccess,nvSelColores,nvProductosAccess,nvTipoComplemento);
  TIdVentanas = set of TIdVentana;

const
  FRM_TODAS = [nvProductos,nvAltaProductos,nvStock,nvColores,nvTallas,
    nvAtributos,nvCarreras,nvProvMuni,nvDirecciones,nvClientes,nvFacturas,
    nvVentas,nvPresupuesto,nvExplorer,nvImagenProducto,nvEtiquetas,nvPDF,
    nvClientesAccess,nvSelColores,nvProductosAccess,nvTipoComplemento];
  MSG_REFRESH = WM_USER + 1;
  MSG_TALLAS = MSG_REFRESH + 1;
  MSG_PROV_MUNI = MSG_TALLAS + 1;
  MSG_TIPO_VIA = MSG_PROV_MUNI + 1;
  MSG_CLIENTE = MSG_TIPO_VIA + 1;
  MSG_PRODUCTO_VENTA = MSG_CLIENTE + 1;
  MSG_PRODUCTO_PRESUPUESTO = MSG_PRODUCTO_VENTA + 1;
  MSG_COLORES = MSG_PRODUCTO_PRESUPUESTO + 1;
  MSG_FILE_SUBIR_IMG = MSG_COLORES + 1;

type
  TfrmMDIChildBase = class(TJAMForm)
  private
    FnId: TIdVentana;
    FDatasetList: TObjectList;
    FCombosPanelList: TObjectList;
    FPostDataset: TDataSet;

    function FindMainMenu: TMainMenu;
  protected
    function GetId: TIdVentana;
    procedure SetId(const Value: TIdVentana);
    function GetPostDataset: TDataSet;
    procedure SetPostDataset(const Value: TDataSet);
    function GetIsEnabled(Index: TIdVentana): Boolean; virtual;
    procedure DoShow; override;
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;

    procedure DoHide; override;
    procedure Resize; override;
    procedure PostChanges;
    procedure CancelChanges;
    procedure RefreshData(nId: TIdVentanas); dynamic;
    procedure FillAllLists(Container: TWinControl);
    procedure ActualizaCombos;

    class procedure ShowForm; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Id: TIdVentana read GetId write SetId;
    property DatasetList: TObjectList read FDatasetList;
    property PostDataset: TDataSet read GetPostDataset write SetPostDataset;
    property IsEnabled[Index: TIdVentana]: Boolean read GetIsEnabled;
    property CombosPanelList: TObjectList read FCombosPanelList;
  end;

procedure SetFontName(Control: TControl);

procedure RegisterFormMainMenu(Menu: TMainMenu);

function WindowOpened(nWndFrom, nWnd: TIdVentana; lEnabled: Boolean): Boolean;

function GetWindowHandle(nWnd: TIdVentana): HWND;

implementation

{$R *.DFM}

uses extctrls;

const
  FONT_NAME = 'Tahoma';

var
  nGroupIndex: Byte = 1;

type
  TControlAccessor = class(TControl);

procedure SetFontName(Control: TControl);
begin
  TControlAccessor(Control).Font.Name := FONT_NAME;
end;

procedure RegisterFormMainMenu(Menu: TMainMenu);

var
  nCont: Integer;

begin
  if not Assigned(Menu) then Exit;
  
  for nCont := Menu.Items.Count - 1 downto 0 do
    if Menu.Items[nCont].GroupIndex = 0 then
      Menu.Items[nCont].GroupIndex := nGroupIndex;

  Inc(nGroupIndex);
end;

function WindowOpened(nWndFrom, nWnd: TIdVentana; lEnabled: Boolean): Boolean;

var
  nCont: Integer;

begin
  nCont := 0;
  while (nCont < Application.MainForm.MDIChildCount) and
        (TfrmMDIChildBase(Application.MainForm.MDIChildren[nCont]).Id <> nWnd) do
    Inc(nCont);

  Result := nCont < Application.MainForm.MDIChildCount;
  if (not lEnabled) or (not Result) then Exit;

  Result := TfrmMDIChildBase(Application.MainForm.MDIChildren[nCont]).IsEnabled[nWndFrom];
end;

function GetWindowHandle(nWnd: TIdVentana): HWND;

var
  nCont: Integer;

begin
  Result := 0;
  nCont := 0;
  while (nCont < Application.MainForm.MDIChildCount) and
        (TfrmMDIChildBase(Application.MainForm.MDIChildren[nCont]).Id <> nWnd) do
    Inc(nCont);

  if nCont < Application.MainForm.MDIChildCount then
    Result := Application.MainForm.MDIChildren[nCont].Handle;
end;

{ TfrmMDIChildBase }

procedure TfrmMDIChildBase.RefreshData(nId: TIdVentanas);

var
  nCont: TIdVentana;
  nCont2: Integer;

begin
  for nCont := Low(TIdVentana) to High(TIdVentana) do
    if nCont in nId then
      for nCont2 := 0 to Application.MainForm.MDIChildCount - 1 do
        if TfrmMDIChildBase(Application.MainForm.MDIChildren[nCont2]).Id = nCont then
          SendMessage(Application.MainForm.MDIChildren[nCont2].Handle,MSG_REFRESH,
            0,Ord(nCont));
end;

procedure TfrmMDIChildBase.CancelChanges;
begin
  if Assigned(FPostDataset) then FPostDataset.Cancel;
end;

constructor TfrmMDIChildBase.Create(AOwner: TComponent);
begin
  inherited;

  Font.Name := FONT_NAME;
  FDatasetList := TObjectList.Create(False);
  FCombosPanelList := TObjectList.Create(False);
end;

destructor TfrmMDIChildBase.Destroy;
begin
  FDatasetList.Free;
  FCombosPanelList.Free;

  inherited;
end;

function TfrmMDIChildBase.GetId: TIdVentana;
begin
  Result := FnId;
end;

function TfrmMDIChildBase.GetPostDataset: TDataSet;
begin
  Result := FPostDataset;
end;

procedure TfrmMDIChildBase.PostChanges;
begin
  if Assigned(FPostDataset) then FPostDataset.Post;
end;

procedure TfrmMDIChildBase.Resize;
begin
  inherited;

  Application.MainForm.Invalidate;
end;

procedure TfrmMDIChildBase.SetId(const Value: TIdVentana);
begin
  FnId := Value;
end;

procedure TfrmMDIChildBase.SetPostDataset(const Value: TDataSet);
begin
  FPostDataset := Value;
end;

procedure TfrmMDIChildBase.MRefresh(var Message: TMessage);

var
  nCont: Integer;
  sReg: TBookmarkStr;

begin
  if Application.Terminated then Exit;

  if (FnId <> TIdVentana(Message.LParam)) or (not Assigned(FDatasetList)) then begin
    Message.Result := Integer(False);
    Exit;
  end;

  Message.Result := Integer(True);
  for nCont := 0 to FDatasetList.Count - 1 do begin
    if FDatasetList[nCont] is TDataSet then begin
      TDataSet(FDatasetList[nCont]).DisableControls;
      try
        sReg := '';
        if TDataSet(FDatasetList[nCont]).Active then begin
          sReg := TDataSet(FDatasetList[nCont]).Bookmark;
          TDataSet(FDatasetList[nCont]).Close;
        end;
        TDataSet(FDatasetList[nCont]).Open;
      finally
        if sReg <> '' then
          try
            TDataSet(FDatasetList[nCont]).Bookmark := sReg;
          except
          end;
        TDataSet(FDatasetList[nCont]).EnableControls;
      end;
    end;
  end;
end;

procedure TfrmMDIChildBase.FillAllLists(Container: TWinControl);

var
  nCont: Integer;

begin
  for nCont := 0 to Container.ControlCount - 1 do
    if Container.Controls[nCont] is TJAMDBIdComboBox then
      TJAMDBIdComboBox(Container.Controls[nCont]).FillList;
end;

function TfrmMDIChildBase.GetIsEnabled(Index: TIdVentana): Boolean;
begin
  Result := True;
end;

procedure TfrmMDIChildBase.ActualizaCombos;

var
  nCont: Integer;
  nItem: Integer;

begin
  for nItem := 0 to FCombosPanelList.Count - 1 do
    for nCont := 0 to TPanel(FCombosPanelList[nItem]).ControlCount - 1 do
      if TPanel(FCombosPanelList[nItem]).Controls[nCont] is TJAMDBIdComboBox then
        TJAMDBIdComboBox(TPanel(FCombosPanelList[nItem]).Controls[nCont]).StoreFieldId;
end;

function TfrmMDIChildBase.FindMainMenu: TMainMenu;

var
  nCont: Integer;

begin
  Result := nil;
  nCont := 0;
  while (nCont < ComponentCount) and (not (Components[nCont] is TMainMenu)) do
    Inc(nCont);

  if (nCont < ComponentCount) and (Components[nCont] is TMainMenu) then
    Result := TMainMenu(Components[nCont]);
end;

procedure TfrmMDIChildBase.DoShow;
begin
  RegisterFormMainMenu(FindMainMenu);

  inherited;
end;

procedure TfrmMDIChildBase.DoHide;
begin
  inherited;

  Application.MainForm.Invalidate;
end;

end.
