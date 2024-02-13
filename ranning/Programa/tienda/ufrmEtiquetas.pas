unit ufrmEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, db, IniFiles, StdCtrls, uJAMControls, ExtCtrls,
  uJAMContainers, DBCtrls, uJAMDBControls, udmRanning;

type
  TfrmEtiquetas = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    pnCombos: TJAMPanel;
    meEtiquetas: TJAMMemo;
    btnGrabar: TButton;
    btnCancelar: TButton;
    btnImprimir: TButton;
    btnActualizar: TButton;
    cbDescuento: TJAMComboBox;
    Label1: TLabel;
    btnLimpiar: TButton;
    procedure btnGrabarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure meEtiquetasChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
  private
    lModificado: Boolean;

    class function GetFicheroEtiquetas: TFileName;
    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure LoadFromFile;
    procedure SaveToFile;
    procedure PrintLabels;
    procedure CambiaModificado(lValor: Boolean);
    //procedure CargaDescuentos;
  protected
    class procedure AddAll(Productos: TDataSet; const sCampoIdProducto: string);
    class procedure AddSelected(Productos: TDataSet;
      const sCampoIdProducto: string);
    class procedure AddLabel(const sProducto, sId, sColor: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class procedure ShowForm; override;
    class procedure Add(Productos: TDataSet; const sCampoIdProducto: string;
      Rango: TRangoProductos);
  end;

implementation

uses uqrpEtiquetas, udmProductos;

{$R *.DFM}

const
  FICHERO_ETIQUETAS = 'etiquetas.ini';
  SECCION_ETIQUETAS = 'Etiquetas';
  SECCION_COLORES = 'Colores';

type
  TInteger = class
  private
    FnNumber: Integer;
  public
    constructor Create(nNumber: Integer);

    property Number: Integer read FnNumber;
  end;

var
  frmEtiquetas: TfrmEtiquetas = nil;
  fEtiquetas: TIniFile = nil;

{ TInteger }

constructor TInteger.Create(nNumber: Integer);
begin
  inherited Create;

  FnNumber := nNumber;
end;

{ TfrmEtiquetas }

class procedure TfrmEtiquetas.Add(Productos: TDataSet; const sCampoIdProducto: string;
  Rango: TRangoProductos);
begin
  case Rango of
    rpTodos: AddAll(Productos,sCampoIdProducto);
    rpActual: AddSelected(Productos,sCampoIdProducto);
  end;
end;

class procedure TfrmEtiquetas.AddAll(Productos: TDataSet;
  const sCampoIdProducto: string);

var
  sSel: TBookmarkStr;

begin
  Productos.DisableControls;
  try
    sSel := Productos.Bookmark;
    Productos.First;
    while not Productos.Eof do begin
      AddSelected(Productos,sCampoIdProducto);
      Productos.Next;
      Application.ProcessMessages;
    end;
  finally
    Productos.Bookmark := sSel;
    Productos.EnableControls;
  end;
end;

class procedure TfrmEtiquetas.AddLabel(const sProducto, sId, sColor: string);

var
  sColores: string;
  
begin
  if not Assigned(fEtiquetas) then
    fEtiquetas := TIniFile.Create(GetFicheroEtiquetas);

  fEtiquetas.WriteString(SECCION_ETIQUETAS,sProducto,sId);
  if fEtiquetas.ValueExists(SECCION_COLORES,sProducto) then begin
    sColores := fEtiquetas.ReadString(SECCION_COLORES,sProducto,'');
    if Pos(sColor,sColores) = 0 then
      fEtiquetas.WriteString(SECCION_COLORES,sProducto,sColores + ',' + sProducto +
        sColor);
  end
  else
    fEtiquetas.WriteString(SECCION_COLORES,sProducto,sProducto + sColor);
end;

class procedure TfrmEtiquetas.AddSelected(Productos: TDataSet;
  const sCampoIdProducto: string);
begin
  if dmProductos.sqlEtiquetas.Active then dmProductos.sqlEtiquetas.Close;
  dmProductos.sqlEtiquetas.ParamByName('id_producto').AsInteger :=
    Productos.FieldByName(sCampoIdProducto).AsInteger;
  dmProductos.sqlEtiquetas.Open;
  dmProductos.sqlEtiquetas.First;

  while not dmProductos.sqlEtiquetas.Eof do begin
    AddLabel(Productos.FieldByName('cd_marca').AsString +
      Productos.FieldByName('cd_producto').AsString,
      Productos.FieldByName('id_producto').AsString,
      '(' + dmProductos.sqlEtiquetas.FieldByName('cd_color_fabricante').AsString + ')' +
      dmRanning.DescColor(dmProductos.sqlEtiquetas.FieldByName('cd_color').AsString));
    dmProductos.sqlEtiquetas.Next;
  end;
end;

destructor TfrmEtiquetas.Destroy;

var
  nCont: Integer;

begin
  if Assigned(fEtiquetas) then fEtiquetas.Free;
  for nCont := 0 to cbDescuento.Items.Count - 1 do
    cbDescuento.Items.Objects[nCont].Free;

  inherited;
end;

class function TfrmEtiquetas.GetFicheroEtiquetas: TFileName;
begin
  Result := dmRanning.PathServidor + FICHERO_ETIQUETAS;
end;

procedure TfrmEtiquetas.LoadFromFile;
begin
  meEtiquetas.Lines.LoadFromFile(GetFicheroEtiquetas);
  CambiaModificado(False);
end;

procedure TfrmEtiquetas.SaveToFile;
begin
  meEtiquetas.Lines.SaveToFile(GetFicheroEtiquetas);
  CambiaModificado(False);
end;

class procedure TfrmEtiquetas.ShowForm;
begin
  if not Assigned(frmEtiquetas) then begin
    frmEtiquetas := TfrmEtiquetas.Create(Application);
    frmEtiquetas.Id := nvEtiquetas;
    frmEtiquetas.LoadFromFile;
  end;

  frmEtiquetas.RefreshData([frmEtiquetas.Id]);
  frmEtiquetas.WindowState := wsNormal;
  frmEtiquetas.Show;
end;

procedure TfrmEtiquetas.btnGrabarClick(Sender: TObject);
begin
  SaveToFile;
end;

procedure TfrmEtiquetas.btnCancelarClick(Sender: TObject);
begin
  LoadFromFile;
end;

procedure TfrmEtiquetas.btnActualizarClick(Sender: TObject);
begin
  LoadFromFile;
end;

procedure TfrmEtiquetas.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  //CargaDescuentos;
  LoadFromFile;
end;

procedure TfrmEtiquetas.PrintLabels;

var
  slProd: TStringList;
  sIdList: string;
  sColorList: string;
  sId: string;
  nCont: Integer;
  nId: Integer;

begin
  slProd := TStringList.Create;
  try
    sIdList := '';
    sColorList := '';
    nId := 0;
    fEtiquetas.ReadSection(SECCION_ETIQUETAS,slProd);
    for nCont := 0 to slProd.Count - 1 do begin
      sId := fEtiquetas.ReadString(SECCION_ETIQUETAS,slProd[nCont],'0');
      if sId <> '0' then begin
        sIdList := sIdList + sId + ',';
        sColorList := sColorList + 
          fEtiquetas.ReadString(SECCION_COLORES,slProd[nCont],'') + ',';
        Inc(nId);
      end;
    end;

    if nId <> 0 then
      TqrpEtiquetas.PrintLabels(Copy(sIdList,1,Length(sIdList) - 1),
        Copy(sColorList,1,Length(sColorList) - 1),
        TInteger(cbDescuento.Items.Objects[cbDescuento.ItemIndex]).Number)
    else
      ShowMessage('No hay etiquetas pendientes de imprimir');
  finally
    slProd.Free;
  end;
end;

constructor TfrmEtiquetas.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(fEtiquetas) then
    fEtiquetas := TIniFile.Create(GetFicheroEtiquetas);

  if not Assigned(dmProductos) then dmProductos := TdmProductos.Create(Self);
  //DatasetList.Add(dmProductos.sqlDescuentos);

  CambiaModificado(False);
end;

procedure TfrmEtiquetas.CambiaModificado(lValor: Boolean);
begin
  lModificado := lValor;
  btnImprimir.Enabled := not lModificado;
  btnGrabar.Enabled := lModificado;
  btnCancelar.Enabled := lModificado;
end;

procedure TfrmEtiquetas.meEtiquetasChange(Sender: TObject);
begin
  CambiaModificado(True);
end;

procedure TfrmEtiquetas.btnImprimirClick(Sender: TObject);
begin
  PrintLabels;
end;

{
procedure TfrmEtiquetas.CargaDescuentos;

var
  nItem: Integer;

begin
  dmProductos.sqlDescuentos.First;
  while not dmProductos.sqlDescuentos.Eof do begin
    nItem :=
      cbDescuento.Items.Add(dmProductos.sqlDescuentos.FieldByName('nm_descuento').AsString);
    cbDescuento.Items.Objects[nItem] := TInteger.Create(
      dmProductos.sqlDescuentos.FieldByName('id_descuento').AsInteger);
    dmProductos.sqlDescuentos.Next;
    Application.ProcessMessages;
  end;
  cbDescuento.ItemIndex := cbDescuento.Items.IndexOf(IntToStr(NM_DESCUENTO_10));
end;
}

procedure TfrmEtiquetas.btnLimpiarClick(Sender: TObject);
begin
  meEtiquetas.Clear;
  CambiaModificado(True);
end;

end.
