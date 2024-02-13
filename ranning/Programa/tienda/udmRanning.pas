unit udmRanning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZConnection, Db, ZAbstractRODataset, ZDataset, ZSqlMetadata, contnrs,
  inifiles, menus, ADODB, Psock, NMFtp;

type
  TRecordAction = (raInsert,raModify,raDelete);
  TProductoAction = (paAdd,paDelete);
  TCondicionTalla = (ctMarca,ctTipoProducto,ctTipoDeporte,ctTipoSexo);
  TCondicionesTalla = set of TCondicionTalla;
  TRangoProductos = (rpTodos,rpActual);

type
  TDatosProducto = record
    nIdProducto: Integer;
    sCdColor: string;
    nIdTalla: Integer;
    rPVP: Extended;
    rDescuento: Extended;
    nIdDescuento: Integer;
    nFecha: TDateTime;
    rIVA: Extended;
  end;

  TDatosProductoFile = class(TIniFile)
  protected
    function LastProduct: Integer;
  public
    procedure WriteDatosProducto(Prod: TDatosProducto);
    function ReadDatosProducto(nNumProd: Integer): TDatosProducto;
    procedure WriteLastDate(nDate: TDateTime);
    function ReadLastDate: TDateTime;
    procedure EraseProducto(nNumProd: Integer);
  end;

  TProductoVenta = class;

  TProductoVentaList = class(TObjectList)
  private
    FLastDate: TDateTime;
    FFileName: TFileName;
    FTotal: Extended;

    function GetItem(Index: Integer): TProductoVenta;
    procedure SetItem(Index: Integer; const Value: TProductoVenta);
    function GetFileName: TFileName;
    procedure SetFileName(const Value: TFileName);
    function GetLastDate: TDateTime;
    function GetTotal: Extended;
  protected
    procedure ChangeLastDate(nNewDate: TDateTime; Action: TProductoAction);
    procedure CalculaTotal(rNuevoPrecio: Extended; Action: TProductoAction);
  public
    constructor Create(const sFileName: TFileName); overload;
    constructor Create; overload;
    class function CreateFileName(const sFolder: TFileName): TFileName;
    procedure Clear; override;
    procedure SaveToFile;
    procedure LoadFromFile;

    function Add(AObject: TProductoVenta): Integer;
    function Remove(AObject: TProductoVenta): Integer;
    function IndexOf(AObject: TProductoVenta): Integer;
    procedure Insert(Index: Integer; AObject: TProductoVenta);
    procedure Delete(Index: Integer);
    property Items[Index: Integer]: TProductoVenta read GetItem write SetItem; default;
    property FileName: TFileName read GetFileName write SetFileName;
    property LastDate: TDateTime read GetLastDate;
    property Total: Extended read GetTotal;
  end;

  TProductoVenta = class
  private
    Producto: TDatosProducto;

    function GetDescuento: Extended;
    function GetCdColor: string;
    function GetIdProducto: Integer;
    function GetIdTalla: Integer;
    function GetPVP: Extended;
    function GetFecha: TDateTime;
    function GetPrecioFinal: Extended;
    function GetIVA: Extended;
  public
    constructor Create(nIdProducto, nIdTalla: Integer;
      rPVP: Extended; const sCdColor: string); overload;
    constructor Create(nIdProducto, nIdTalla: Integer;
      rPVP, rDescuento: Extended; const sCdColor: string); overload;
    constructor Create(nIdProducto, nIdTalla: Integer;
      rPVP, rDescuento, rIVA: Extended; const sCdColor: string;
      nFecha: TDateTime); overload;
    constructor Create(Prod: TDatosProducto); overload;

    property IdProducto: Integer read GetIdProducto;
    property CdColor: string read GetCdColor;
    property IdTalla: Integer read GetIdTalla;
    property PVP: Extended read GetPVP;
    property Descuento: Extended read GetDescuento;
    property Fecha: TDateTime read GetFecha;
    property PrecioFinal: Extended read GetPrecioFinal;
    property IVA: Extended read GetIVA;
  end;

const
  CAMPO_MARCADO = 'X';
  CAMPO_NO_MARCADO = '-';
  RECORD_ACTION_CHAR: array[TRecordAction] of Char = ('I','M','D');
  // De descuentos.nm_descuento
  NM_DESCUENTO_10 = 10;
  //De la tabla estado_presupuesto
  ID_ESTADO_ENVIADO_RANNING = 1;
  ID_ESTADO_ENVIADO_CLIENTE = 2;
  ID_ESTADO_PEDIDO_ENVIADO = 4;
  ID_ESTADO_CADUCADO = 5;
  ID_ESTADO_ANULADO = 6;
  // De colores.ds_color
  COLOR_UNICO = 'Color único';
  PATH_IMG_PRODUCTOS = 'productos\';
  PATH_IMG_P_PRODUCTOS = 'p_productos\';
  CHAR_COLOR_SIN_DEFINIR = '#';

type
  TComandoSQL = (csEjecutar,csResultado);
  TConfiguracion = (cLocal,cWeb);

type
  TdmRanning = class(TDataModule)
    dbRanning: TZConnection;
    dbWeb: TZConnection;
    Metadata: TZSQLMetadata;
    sqlRanning: TZReadOnlyQuery;
    sqlWebInsert: TZReadOnlyQuery;
    dsRanning: TDataSource;
    sqlSubirTablas: TZReadOnlyQuery;
    sqlSubirTablasds_tabla: TStringField;
    sqlSubirTablasds_campo_id: TStringField;
    sqlSubirTablasid: TIntegerField;
    sqlSubirTablasit_accion: TStringField;
    sqlWebDelete: TZReadOnlyQuery;
    sqlWebUpdate: TZReadOnlyQuery;
    sqlSubir: TZReadOnlyQuery;
    dbAccess: TADOConnection;
    sqlClientes: TADOQuery;
    dsClientes: TDataSource;
    sqlClientesAccessUpdate: TZReadOnlyQuery;
    sqlClientesAccessInsert: TZReadOnlyQuery;
    sqlClientesIDECLI: TSmallintField;
    sqlClientesNUMCLIANTERIOR: TSmallintField;
    sqlClientesCLIENTE: TWideStringField;
    sqlClientesNIF: TWideStringField;
    sqlClientesFECHANACIMIENTO: TDateTimeField;
    sqlClientesDIRECLI: TWideStringField;
    sqlClientesCODIGOP: TWideStringField;
    sqlClientesCIUDAD: TWideStringField;
    sqlClientesTELECLI: TWideStringField;
    sqlClientesCLUB: TWideStringField;
    sqlClientesGIMNASIO: TWideStringField;
    sqlClientesPROMOCION: TWideStringField;
    sqlClientesNUM_SOCIO: TWideStringField;
    sqlClientesDESCUENTO: TFloatField;
    sqlClientesTALLAPIE: TWideStringField;
    sqlClientesTALLATEXTIL: TWideStringField;
    sqlClientesTARJETA: TWordField;
    sqlClientesFECHAACTU: TDateTimeField;
    sqlClientesOBSERVA: TMemoField;
    sqlClientesCORREO: TWordField;
    sqlClientesCL_TIPO: TWideStringField;
    sqlClientesCompraInicial: TFloatField;
    sqlClientesCompras: TADOQuery;
    sqlClientesComprasnm_compras: TFloatField;
    sqlClientesAccess: TZReadOnlyQuery;
    sqlClientesComprasidecli: TSmallintField;
    sqlColores: TZReadOnlyQuery;
    ftpImages: TNMFTP;
    sqlClientesEMAIL: TWideStringField;
    sqlClientesSexo: TFloatField;
    sqlClientesIdCliRef: TSmallintField;
    ftpPedidos: TNMFTP;
    sqlOfertasLanzamiento: TZReadOnlyQuery;
    sqlOfertasLanzamientoid_oferta: TLargeintField;
    sqlOfertasLanzamientoid_producto: TLargeintField;
    sqlOfertasLanzamientoid_tipo_producto: TLargeintField;
    sqlOfertasLanzamientoid_tipo_complemento: TLargeintField;
    sqlOfertasLanzamientoid_tipo_deporte: TLargeintField;
    sqlOfertasLanzamientoid_temporada: TIntegerField;
    sqlOfertasLanzamientoid_marca: TLargeintField;
    sqlOfertasLanzamientoid_tipo_sexo: TLargeintField;
    sqlOfertasLanzamientof_inicio: TDateField;
    sqlOfertasLanzamientof_fin: TDateField;
    sqlOfertasLanzamientoid_descuento: TLargeintField;
    sqlOfertasLanzamientods_oferta: TStringField;
    sqlClientesPuntosInicial: TIntegerField;
    sqlOfertasLanzamientonm_descuento: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ftpImagesConnectionFailed(Sender: TObject);
    procedure ftpImagesFailure(var Handled: Boolean; Trans_Type: TCmdType);
    procedure dbWebBeforeConnect(Sender: TObject);
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure dbAccessBeforeConnect(Sender: TObject);
    procedure ftpPedidosFailure(var Handled: Boolean;
      Trans_Type: TCmdType);
  private
    FServidorWeb: string;
    FBBDDWeb: string;
    FBBDDLocal: string;
    FConfiguracionWeb: TConfiguracion;
    FColorUnico: string;
    lErrorImagenFtp: Boolean;
    lErrorPedidoFtp: Boolean;
    FPathServidor: TFileName;
    FPathFotosProductos: TFileName;
    FPathImages: TFileName;
    FAccessConnString: WideString;
    FCCC: string;
    FDiasOfertaLanzamiento: Integer;
    FIdDescuentoOfertaLanzamiento: Integer;
    FIVA: Extended;
    FEqivIVA: TStringList;
    FComandoSQLList: TList;
    FDireccionRemite: string;
    FLinea: string;

    procedure CargaConfiguracionActual;
    function GetDescConfiguracionWeb: string;
    function GetServidorWeb: string;
    function GetConfiguracionWeb: TConfiguracion;
    function LastDay(nMonth,nYear: Word): Word;
    function GetPathServidor: TFileName;
    function ConsultasTallas(nIdMarca, nIdTipoProd, nIdTipoDep,
      nIdTipoSexo: Integer): TCondicionesTalla;
    function GetCdColorUnico: string;
    function GetImagenesPendientes: Boolean;
    function GetBBDDWeb: string;
    function GetPathPresupuestos: TFileName;
    function GetBBDDLocal: string;
    function GetPathFotosProductos: TFileName;
    function GetPathFotosImages: TFileName;
    function GetCCC: string;
    function GetPathPresupuestoswww: TFileName;
    procedure ProductoModificado(nIdProducto: Integer);
    function GetDiasOfertaLanzamiento: Integer;
    function GetIdDescuentoOfertaLanzamiento: Integer;
    function GetIVA: Extended;
    function GetEquivalenciaIVA(const Index: string): Extended;
    function ComandoSQLCreate(const sSQL: string): TZReadOnlyQuery;
    function GetDireccionRemite: string;
  public
    function ComandoSQL(const sSQL: string; TipoComando: TComandoSQL): TZReadOnlyQuery;
    function ComandoSQLWeb(const sSQL: string; TipoComando: TComandoSQL): TZReadOnlyQuery;
    procedure ComandoSQLFree(var sqlComando: TZReadOnlyQuery);
    function ItFieldMarked(Field: TField): Boolean;
    procedure TablaModificada(const sTabla, sCampoId: string; nId: Integer;
      Accion: TRecordAction);
    procedure TablasASubir(slTablas: TStrings);
    function UltimoID: Integer;
    function FormateaPrecio(rPrecio: Extended): string; overload;
    function FormateaPrecio(fldPrecio: TField): string; overload;
    function FormateaPorcentaje(rPorcentaje: Extended): string; overload;
    function FormateaPorcentaje(fldPorcentaje: TField): string; overload;
    procedure CargaConfiguracion(TipoConfig: TConfiguracion);
    function RanningDay(nMonth, nYear: Word): TDate;
    function UltimoDiaPresupuesto(nFechaCompra: TDate): TDate;
    procedure MantenimientoPresupuestos(lManual: Boolean);
    procedure CreaSQLTallas(sqlProductos, sqlTallas: TZReadOnlyQuery);
    {
    procedure CargaMenuDescuentos(mnuDescuentos: TMenu;
      mnuDescuentoClick: TNotifyEvent); overload;
    procedure CargaMenuDescuentos(mnuDescuentos: TMenuItem;
      mnuDescuentoClick: TNotifyEvent); overload;
    }
    procedure CopyToClipboard(const sData: string);
    procedure ActualizaClientesAccess;
    function DescColor(const sCdColor: string): string;
    function CodColor(nIdColor: Integer): string;
    procedure SeparaCdColor(const sCdColor: string; slCdColores: TStrings);
    procedure ShowPopupMenu(Control: TControl; Menu: TPopupMenu);
    procedure SubeImagenes(lAuto: Boolean);
    procedure SubePedido(const sFile: TFileName);
    procedure ImagenModificada(const sImgFile: TFileName);
    procedure ImagenRenombrada(const sImgOld, sImgNew: TFileName);
    procedure BorraStockCero;
    procedure CambiaExtensionPresupuesto(const sFile: TFileName);
    procedure OfertaLanzamiento(nIdProducto, nIdTemporada: Integer;
      nFechaInicio: TDate);
    function EsMismaOfertaLanzamiento(nIdProducto, nIdTemporada: Integer;
      nFechaInicio: TDate): Boolean;

    property ServidorWeb: string read GetServidorWeb;
    property ConfiguracionWeb: TConfiguracion read GetConfiguracionWeb;
    property DescConfiguracionWeb: string read GetDescConfiguracionWeb;
    property PathServidor: TFileName read GetPathServidor;
    property PathPresupuestos: TFileName read GetPathPresupuestos;
    property PathPresupuestoswww: TFileName read GetPathPresupuestoswww;
    property CdColorUnico: string read GetCdColorUnico;
    property ImagenesPendientes: Boolean read GetImagenesPendientes;
    property BBDDWeb: string read GetBBDDWeb;
    property BBDDLocal: string read GetBBDDLocal;
    property PathFotosProductos: TFileName read GetPathFotosProductos;
    property PathImages: TFileName read GetPathFotosImages;
    property CCC: string read GetCCC;
    property DiasOfertaLanzamiento: Integer read GetDiasOfertaLanzamiento;
    property IdDescuentoOfertaLanzamiento: Integer read GetIdDescuentoOfertaLanzamiento;
    property IVA: Extended read GetIVA;
    property EquivalenciaIVA[const Index: string]: Extended read GetEquivalenciaIVA;
    property DireccionRemite: string read GetDireccionRemite;
  end;

var
  dmRanning: TdmRanning = nil;
  CHAR_RECORD_ACTION: array[Char] of TRecordAction;

implementation

uses ComObj, uCommon, Clipbrd, uConst, UFRMMDICHILDBASE;

{$R *.DFM}

type
  TConfiguracionDesc = array[TConfiguracion] of string;

const
  SECCION_PRODUCTO = 'Producto';
  SECCION_FECHA = 'Fecha';
  DESC_CONFIGURACION: TConfiguracionDesc = ('Configuración local',
    'Configuración web');
  RANNING_DAYS = [3,4,5];
  DIAS_CADUCIDAD_PRESUPUESTO = 7;
  DIAS_BORRADO_PRESUPUESTO = 30;
  //De la tabla estado_presupuesto
  ID_ESTADO_ACEPTADO = 3;
  SQL_TALLAS = '"select t.*,tt.ds_tipo_talla from tallas t, tipos_tallas tt",' +
    '"where (t.id_tipo_talla = tt.id_tipo_talla) and ",' +
    '"#where",' +
    '"order by id_marca,id_tipo_producto,id_tipo_deporte,id_tipo_sexo,nm_orden"';
  // De tipos_producto.id_tipo_producto
  ID_TIPO_PRODUCTO_CALZADO = 1;
  PATH_IMG_WEB = '/html/_images/';
  PATH_IMG_PRODUCTOS_WEB = PATH_IMG_WEB + 'productos/';
  PATH_IMG_P_PRODUCTOS_WEB = PATH_IMG_WEB + 'p_productos/';
  FILE_SUBIR_IMG = 'subir_img.ini';
  PATH_PEDIDOS_WEB = '/html/cgi-bin/pedidos/';
  PATH_PRESUPUESTOS = 'Presupuestos\';
  PATH_PRESUPUESTOS_WWW = 'Presupuestos\www\';
  SUFIJO_PRESUP_BORRADO = '_';
  OFERTA_LANZAMIENTO = 'Oferta lanzamiento';

{ TProductoVentaList }

function TProductoVentaList.Add(AObject: TProductoVenta): Integer;
begin
  Result := inherited Add(AObject);

  ChangeLastDate(AObject.Fecha,paAdd);
  CalculaTotal(AObject.PrecioFinal,paAdd);
end;

constructor TProductoVentaList.Create(const sFileName: TFileName);
begin
  inherited Create(True);

  FLastDate := 0;
  FFileName := sFileName;
  FTotal := 0;
end;

function TProductoVentaList.GetItem(Index: Integer): TProductoVenta;
begin
  Result := TProductoVenta(inherited Items[Index]);
end;

function TProductoVentaList.IndexOf(AObject: TProductoVenta): Integer;
begin
  Result := inherited IndexOf(AObject);
end;

procedure TProductoVentaList.Insert(Index: Integer;
  AObject: TProductoVenta);
begin
  inherited Insert(Index,AObject);

  ChangeLastDate(AObject.Fecha,paAdd);
  CalculaTotal(AObject.PrecioFinal,paAdd);
end;

function TProductoVentaList.Remove(AObject: TProductoVenta): Integer;
begin
  Result := inherited Remove(AObject);

  ChangeLastDate(AObject.Fecha,paDelete);
  CalculaTotal(AObject.PrecioFinal,paDelete);
end;

procedure TProductoVentaList.SetItem(Index: Integer;
  const Value: TProductoVenta);

var
  nAntFecha: TDateTime;
  nAntPrecio: Extended;

begin
  nAntFecha := Items[Index].Fecha;
  nAntPrecio := Items[Index].PrecioFinal;
  inherited Items[Index] := Value;

  if nAntFecha <> Value.Fecha then ChangeLastDate(Value.Fecha,paAdd);
  if nAntPrecio <> (Value.PrecioFinal) then
    CalculaTotal(Value.PrecioFinal,paAdd);
end;

class function TProductoVentaList.CreateFileName(const sFolder: TFileName): TFileName;

var
  sGuid: string;
  sGuid64: string;
  nCont: Integer;

begin
  sGuid := CreateClassID;
  sGuid := StringReplace(sGuid,'-','',[rfReplaceAll]);
  sGuid := StringReplace(sGuid,'{','',[rfReplaceAll]);
  sGuid := StringReplace(sGuid,'}','',[rfReplaceAll]);
  sGuid64 := '';
  nCont := Length(sGuid) - 3;
  while nCont >= 0 do begin
    sGuid64 := ToBase(Copy(sGuid,nCont,3),16,64,2) + sGuid64;
    Dec(nCont,3);
  end;
  Result := IncludeTrailingBackslash(sFolder) + sGuid64 + '.ran';
end;

procedure TProductoVentaList.LoadFromFile;

var
  fPresup: TDatosProductoFile;
  Prod: TDatosProducto;
  nCont: Integer;

begin
  Clear;
  fPresup := TDatosProductoFile.Create(FFileName);
  try
    nCont := 1;
    Prod := fPresup.ReadDatosProducto(nCont);
    while Prod.nIdProducto <> -1 do begin
      Add(TProductoVenta.Create(Prod));
      Inc(nCont);
      Prod := fPresup.ReadDatosProducto(nCont);
    end;

    FLastDate := fPresup.ReadLastDate;
  finally
    fPresup.Free;
  end;
end;

procedure TProductoVentaList.SaveToFile;

var
  fPresup: TDatosProductoFile;
  nCont: Integer;

begin
  fPresup := TDatosProductoFile.Create(FFileName);
  try
    for nCont := 1 to fPresup.LastProduct do
      fPresup.EraseProducto(nCont);
    for nCont := 0 to Count - 1 do
      fPresup.WriteDatosProducto(Items[nCont].Producto);

    fPresup.WriteLastDate(FLastDate);
  finally
    fPresup.Free;
  end;
end;

procedure TProductoVentaList.ChangeLastDate(nNewDate: TDateTime;
  Action: TProductoAction);

var
  nCont: Integer;

begin
  if nNewDate < FLastDate then Exit;

  if Action = paAdd then begin
    if nNewDate > FLastDate then FLastDate := nNewDate;
    Exit;
  end
  else if Action = paDelete then begin
    FLastDate := Items[0].Fecha;
    for nCont := 1 to Count - 1 do
      if Items[nCont].Fecha > FLastDate then FLastDate := Items[nCont].Fecha;
  end;
end;

function TProductoVentaList.GetFileName: TFileName;
begin
  Result := FFileName;
end;

procedure TProductoVentaList.SetFileName(const Value: TFileName);
begin
  FFileName := Value;
  Clear;
end;

procedure TProductoVentaList.Clear;
begin
  inherited;

  FLastDate := 0;
  FTotal := 0;
end;

function TProductoVentaList.GetLastDate: TDateTime;
begin
  Result := FLastDate; 
end;

constructor TProductoVentaList.Create;
begin
  Create('');
end;

procedure TProductoVentaList.CalculaTotal(rNuevoPrecio: Extended;
  Action: TProductoAction);
begin
  case Action of
    paAdd: FTotal := FTotal + rNuevoPrecio;
    paDelete: FTotal := FTotal - rNuevoPrecio;
  end;
end;

function TProductoVentaList.GetTotal: Extended;
begin
  Result := FTotal;
end;

procedure TProductoVentaList.Delete(Index: Integer);
begin
  ChangeLastDate(Items[Index].Fecha,paDelete);
  CalculaTotal(Items[Index].PrecioFinal,paDelete);

  inherited Delete(Index);
end;

{ TProductoVenta }

constructor TProductoVenta.Create(nIdProducto, nIdTalla: Integer;
  rPVP: Extended; const sCdColor: string);
begin
  inherited Create;

  Producto.nIdProducto := nIdProducto;
  Producto.sCdColor := sCdColor;
  Producto.nIdTalla := nIdTalla;
  Producto.rPVP := rPVP;
  Producto.rDescuento := -1;
  Producto.nIdDescuento := 0;
  Producto.nFecha := Now;
end;

constructor TProductoVenta.Create(nIdProducto, nIdTalla: Integer;
  rPVP, rDescuento: Extended; const sCdColor: string);
begin
  inherited Create;

  Producto.nIdProducto := nIdProducto;
  Producto.sCdColor := sCdColor;
  Producto.nIdTalla := nIdTalla;
  Producto.rPVP := rPVP;
  Producto.rDescuento := rDescuento;
  Producto.nIdDescuento := 0;
  Producto.nFecha := 0;
end;

constructor TProductoVenta.Create(Prod: TDatosProducto);
begin
  inherited Create;

  Producto := Prod;
end;

constructor TProductoVenta.Create(nIdProducto, nIdTalla: Integer;
  rPVP, rDescuento, rIVA: Extended; const sCdColor: string; nFecha: TDateTime);
begin
  inherited Create;

  Producto.nIdProducto := nIdProducto;
  Producto.sCdColor := sCdColor;
  Producto.nIdTalla := nIdTalla;
  Producto.rPVP := rPVP;
  Producto.rDescuento := rDescuento;
  Producto.nFecha := nFecha;
  Producto.rIVA := rIVA;
end;

function TProductoVenta.GetDescuento: Extended;
begin
  Result := Producto.rDescuento;
end;

function TProductoVenta.GetFecha: TDateTime;
begin
  Result := Producto.nFecha;
end;

function TProductoVenta.GetCdColor: string;
begin
  Result := Producto.sCdColor;
end;

function TProductoVenta.GetIdProducto: Integer;
begin
  Result := Producto.nIdProducto;
end;

function TProductoVenta.GetIdTalla: Integer;
begin
  Result := Producto.nIdTalla;
end;

function TProductoVenta.GetIVA: Extended;
begin
  Result := Producto.rIVA;
end;

function TProductoVenta.GetPrecioFinal: Extended;
begin
  Result := PVP * (1 - Descuento / 100);
end;

function TProductoVenta.GetPVP: Extended;
begin
  Result := Producto.rPVP;
end;

{ TdmRanning }

procedure TdmRanning.ActualizaClientesAccess;

var
  pStep: TProgressStepProc;

begin
  if not dbAccess.Connected then dbAccess.Open;
  if sqlClientes.Active then sqlClientes.Close;
  sqlClientes.Open;
  sqlClientesCompras.Open;
  pStep := ShowProgress('Actualización de clientes de Access',0,sqlClientes.RecordCount);
  sqlClientes.First;
  while not sqlClientes.Eof do begin
    if sqlClientesAccess.Active then sqlClientesAccess.Close;
    sqlClientesAccess.ParamByName('idecli').AsInteger :=
      sqlClientes.FieldByName('idecli').AsInteger;
    sqlClientesAccess.Open;
    if sqlClientesAccess.FieldByName('nCliente').AsInteger <> 0 then begin
      sqlClientesAccessUpdate.ParamByName('idecli').AsInteger :=
        sqlClientes.FieldByName('idecli').AsInteger;
      sqlClientesAccessUpdate.ParamByName('cliente').AsString :=
        UpperCaseFirstAll(sqlClientes.FieldByName('cliente').AsString);
      sqlClientesAccessUpdate.ParamByName('nif').AsString :=
        sqlClientes.FieldByName('nif').AsString;
      sqlClientesAccessUpdate.ParamByName('fechanacimiento').AsDateTime :=
        sqlClientes.FieldByName('fecha nacimiento').AsDateTime;
      sqlClientesAccessUpdate.ParamByName('direcli').AsString :=
        UpperCaseFirstAll(sqlClientes.FieldByName('direcli').AsString);
      sqlClientesAccessUpdate.ParamByName('codigop').AsString :=
        sqlClientes.FieldByName('codigop').AsString;
      sqlClientesAccessUpdate.ParamByName('ciudad').AsString :=
        UpperCaseFirstAll(sqlClientes.FieldByName('ciudad').AsString);
      sqlClientesAccessUpdate.ParamByName('telecli').AsString :=
        sqlClientes.FieldByName('telecli').AsString;
      sqlClientesAccessUpdate.ParamByName('descuento').AsFloat :=
        sqlClientes.FieldByName('descuento').AsFloat;
      sqlClientesAccessUpdate.ParamByName('email').AsString :=
        sqlClientes.FieldByName('email').AsString;
      sqlClientesAccessUpdate.ParamByName('comprainicial').AsFloat :=
        sqlClientes.FieldByName('comprainicial').AsFloat;
      sqlClientesAccessUpdate.ParamByName('puntosinicial').AsInteger :=
        sqlClientes.FieldByName('puntosinicial').AsInteger;
      if sqlClientesCompras.Locate('idecli',sqlClientes.FieldByName('idecli').AsInteger,[]) then
        sqlClientesAccessUpdate.ParamByName('compras').AsFloat :=
          sqlClientesCompras.FieldByName('nm_compras').AsFloat
      else
        sqlClientesAccessUpdate.ParamByName('compras').AsFloat := 0;
      sqlClientesAccessUpdate.ExecSQL;
    end
    else begin
      sqlClientesAccessInsert.ParamByName('idecli').AsInteger :=
        sqlClientes.FieldByName('idecli').AsInteger;
      sqlClientesAccessInsert.ParamByName('cliente').AsString :=
        UpperCaseFirstAll(sqlClientes.FieldByName('cliente').AsString);
      sqlClientesAccessInsert.ParamByName('nif').AsString :=
        sqlClientes.FieldByName('nif').AsString;
      sqlClientesAccessInsert.ParamByName('fechanacimiento').AsDateTime :=
        sqlClientes.FieldByName('fecha nacimiento').AsDateTime;
      sqlClientesAccessInsert.ParamByName('direcli').AsString :=
        UpperCaseFirstAll(sqlClientes.FieldByName('direcli').AsString);
      sqlClientesAccessInsert.ParamByName('codigop').AsString :=
        sqlClientes.FieldByName('codigop').AsString;
      sqlClientesAccessInsert.ParamByName('ciudad').AsString :=
        UpperCaseFirstAll(sqlClientes.FieldByName('ciudad').AsString);
      sqlClientesAccessInsert.ParamByName('telecli').AsString :=
        sqlClientes.FieldByName('telecli').AsString;
      sqlClientesAccessInsert.ParamByName('descuento').AsFloat :=
        sqlClientes.FieldByName('descuento').AsFloat;
      sqlClientesAccessInsert.ParamByName('email').AsString :=
        sqlClientes.FieldByName('email').AsString;
      sqlClientesAccessInsert.ParamByName('comprainicial').AsFloat :=
        sqlClientes.FieldByName('comprainicial').AsFloat;
      sqlClientesAccessInsert.ParamByName('puntosinicial').AsInteger :=
        sqlClientes.FieldByName('puntosinicial').AsInteger;
      if sqlClientesCompras.Locate('idecli',sqlClientes.FieldByName('idecli').AsInteger,[]) then
        sqlClientesAccessInsert.ParamByName('compras').AsFloat :=
          sqlClientesCompras.FieldByName('nm_compras').AsFloat
      else
        sqlClientesAccessInsert.ParamByName('compras').AsFloat := 0;
      sqlClientesAccessInsert.ExecSQL;
    end;
    sqlClientes.Next;
    pStep;
    Application.ProcessMessages;
  end;

  ShowMessage('Proceso de paso de clientes desde Access terminado');
  dbAccess.Close;
end;

procedure TdmRanning.CargaConfiguracion(TipoConfig: TConfiguracion);

var
  sIni: TFileName;

begin
  FConfiguracionWeb := TipoConfig;
  sIni := ExtractFilePath(Application.ExeName) +
    ChangeFileExt(ExtractFileName(Application.ExeName),'.ini');
  with TIniFile.Create(sIni) do
    try
      case TipoConfig of
        cLocal: FServidorWeb := ReadString('ServidorWeb','PathLocal','');
        cWeb: FServidorWeb := ReadString('ServidorWeb','PathWeb','');
      end;
      FBBDDWeb := ReadString('ServidorWeb','BBDDWeb','error');
      FBBDDLocal := ReadString('ServidorWeb','BBDDLocal','error');
      FPathServidor := ReadString('Configuracion','PathServidor','');
      FDireccionRemite := ReadString('DireccionTienda','Remite','');
      FLinea := ReadString('DireccionTienda','Linea','');

      WriteInteger('Configuracion','ServidorWeb',Integer(TipoConfig));
    finally
      Free;
    end;
end;

procedure TdmRanning.CargaConfiguracionActual;

var
  sIni: TFileName;

begin
  sIni := ExtractFilePath(Application.ExeName) +
    ChangeFileExt(ExtractFileName(Application.ExeName),'.ini');
  with TIniFile.Create(sIni) do
    try
      FConfiguracionWeb := TConfiguracion(ReadInteger('Configuracion',
        'ServidorWeb',0));

      case FConfiguracionWeb of
        cLocal: FServidorWeb := ReadString('ServidorWeb','PathLocal','');
        cWeb: FServidorWeb := ReadString('ServidorWeb','PathWeb','');
      end;

      FAccessConnString := ReadString('Configuracion','AccessConnString','');
      FBBDDWeb := ReadString('ServidorWeb','BBDDWeb','error');
      FBBDDLocal := ReadString('ServidorWeb','BBDDLocal','error');
      FPathServidor := ReadString('Configuracion','PathServidor','');
      FPathFotosProductos := ReadString('Configuracion','PathFotosProductos','');
      FPathImages  := ReadString('Configuracion','PathImages','');
      FCCC  := ReadString('Presupuestos','CCC','');
      FDiasOfertaLanzamiento := ReadInteger('Configuracion','DiasOfertaLanzamiento',0);
      FIdDescuentoOfertaLanzamiento := ReadInteger('Configuracion','IdDescuentoOfertaLanzamiento',0);
      FIVA := ReadInteger('Configuracion','IVA',IVA_GENERAL);
      ReadSectionValues('IVA',FEqivIVA);
      FDireccionRemite := ReadString('DireccionTienda','Remite','');
      FLinea := ReadString('DireccionTienda','Linea','');
    finally
      Free;
    end;
end;

{
procedure TdmRanning.CargaMenuDescuentos(mnuDescuentos: TMenu;
  mnuDescuentoClick: TNotifyEvent);

var
  pDesc: TMenuItem;
  nCont: Integer;
  sqlDescuentos: TZReadOnlyQuery;

begin
  sqlDescuentos := ComandoSQL('select * from descuentos order by nm_descuento',
    csResultado);
  if sqlDescuentos.Active then sqlDescuentos.Close;
  sqlDescuentos.Open;
  sqlDescuentos.First;
  for nCont := 0 to mnuDescuentos.Items.Count - 1 do
    mnuDescuentos.Items[nCont].Clear;
  while not sqlDescuentos.Eof do begin
    pDesc := TMenuItem.Create(mnuDescuentos);
    pDesc.Tag := sqlDescuentos.FieldByName('id_descuento').AsInteger;
    pDesc.Caption := sqlDescuentos.FieldByName('nm_descuento').AsString + ' %';
    pDesc.OnClick := mnuDescuentoClick;

    nCont := 0;
    while mnuDescuentos.Items[nCont].Tag < sqlDescuentos.FieldByName('nm_descuento').AsFloat do
      Inc(nCont);

    mnuDescuentos.Items[nCont].Add(pDesc);
    sqlDescuentos.Next;
    Application.ProcessMessages;
  end;
end;

procedure TdmRanning.CargaMenuDescuentos(mnuDescuentos: TMenuItem;
  mnuDescuentoClick: TNotifyEvent);

var
  pDesc: TMenuItem;
  nCont: Integer;
  sqlDescuentos: TZReadOnlyQuery;

begin
  sqlDescuentos := ComandoSQL('select * from descuentos order by nm_descuento',
    csResultado);
  sqlDescuentos.First;
  for nCont := 0 to mnuDescuentos.Count - 1 do
    mnuDescuentos.Items[nCont].Clear;
  while not sqlDescuentos.Eof do begin
    pDesc := TMenuItem.Create(mnuDescuentos);
    pDesc.Tag := sqlDescuentos.FieldByName('id_descuento').AsInteger;
    pDesc.Caption := sqlDescuentos.FieldByName('nm_descuento').AsString + ' %';
    pDesc.OnClick := mnuDescuentoClick;

    nCont := 0;
    while mnuDescuentos.Items[nCont].Tag < sqlDescuentos.FieldByName('nm_descuento').AsFloat do
      Inc(nCont);

    mnuDescuentos.Items[nCont].Add(pDesc);
    sqlDescuentos.Next;
    Application.ProcessMessages;
  end;
end;
}

function TdmRanning.ComandoSQL(const sSQL: string;
  TipoComando: TComandoSQL): TZReadOnlyQuery;

var
  sqlComando: TZReadOnlyQuery;

begin
  sqlComando := ComandoSQLCreate(sSQL);
  sqlComando.Connection := dbRanning;
  case TipoComando of
    csEjecutar: begin
      sqlComando.ExecSQL;
      ComandoSQLFree(sqlComando);
    end;
    csResultado: sqlComando.Open;
  end;

  Result := sqlComando;
end;

function TdmRanning.ComandoSQLWeb(const sSQL: string;
  TipoComando: TComandoSQL): TZReadOnlyQuery;

var
  sqlComando: TZReadOnlyQuery;

begin
  sqlComando := ComandoSQLCreate(sSQL);
  sqlComando.Connection := dbWeb;
  case TipoComando of
    csEjecutar: begin
      sqlComando.ExecSQL;
      ComandoSQLFree(sqlComando);
    end;
    csResultado: sqlComando.Open;
  end;

  Result := sqlComando;
end;

function TdmRanning.ConsultasTallas(nIdMarca, nIdTipoProd, nIdTipoDep,
  nIdTipoSexo: Integer): TCondicionesTalla;

var
  Cond: TCondicionesTalla;
  sqlCond: TZReadOnlyQuery;

begin
  Cond := [];
  sqlCond := ComandoSQL('select count(id_talla) nTalla from tallas where ' +
    '(id_marca = ' + IntToStr(nIdMarca) + ') and (id_tipo_producto = ' +
    IntToStr(nIdTipoProd) + ')',csResultado);
  if sqlCond.FieldByName('nTalla').AsInteger <> 0 then Cond := Cond + [ctMarca];
  ComandoSQLFree(sqlCond);

  sqlCond := ComandoSQL('select count(id_talla) nTalla from tallas where ' +
    '(id_marca = ' + IntToStr(nIdMarca) + ') and (id_tipo_deporte = ' +
    IntToStr(nIdTipoDep) + ') and (id_tipo_producto = ' + IntToStr(nIdTipoProd) +
    ')',csResultado);
  if sqlCond.FieldByName('nTalla').AsInteger <> 0 then
    Cond := Cond + [ctTipoDeporte];
  ComandoSQLFree(sqlCond);

  sqlCond := ComandoSQL('select count(id_talla) nTalla from tallas where ' +
    '(id_marca = ' + IntToStr(nIdMarca) + ') and (id_tipo_sexo = ' +
    IntToStr(nIdTipoSexo) + ') and (id_tipo_producto = ' + IntToStr(nIdTipoProd) +
    ')',csResultado);
  if sqlCond.FieldByName('nTalla').AsInteger <> 0 then
    Cond := Cond + [ctTipoSexo];
  ComandoSQLFree(sqlCond);

  Result := Cond;
end;

procedure TdmRanning.CopyToClipboard(const sData: string);
begin
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(sData));
end;

procedure TdmRanning.CreaSQLTallas(sqlProductos, sqlTallas: TZReadOnlyQuery);

var
  nPosWhere: Integer;
  nIdMarca: Integer;
  nIdTipoProducto: Integer;
  nIdTipoDeporte: Integer;
  nIdTipoSexo: Integer;
  Cond: TCondicionesTalla;
  sWhere: string;

begin
  if sqlProductos.IsEmpty then Exit;

  if sqlTallas.Active then sqlTallas.Close;
  sqlTallas.SQL.CommaText := SQL_TALLAS;
  nPosWhere := sqlTallas.SQL.IndexOf('#where');
  nIdTipoProducto := sqlProductos.FieldByName('id_tipo_producto').AsInteger;
  nIdMarca := sqlProductos.FieldByName('id_marca').AsInteger;
  nIdTipoDeporte := sqlProductos.FieldByName('id_tipo_deporte').AsInteger;
  nIdTipoSexo := sqlProductos.FieldByName('id_tipo_sexo').AsInteger;
  sWhere := ' (id_tipo_producto = ' + IntToStr(nIdTipoProducto) + ') and ';
  Cond := ConsultasTallas(nIdMarca,nIdTipoProducto,nIdTipoDeporte,nIdTipoSexo);

  if ctMarca in Cond then
    sWhere := sWhere + '(id_marca = ' + IntToStr(nIdMarca) + ') and '
  else
    sWhere := sWhere + '(id_marca = 0) and ';
  if ctTipoDeporte in Cond then
    sWhere := sWhere + '(id_tipo_deporte = ' + IntToStr(nIdTipoDeporte) + ') and '
  else
    sWhere := sWhere + '(id_tipo_deporte = 0) and ';
  if ctTipoSexo in Cond then
    sWhere := sWhere + '(id_tipo_sexo = ' + IntToStr(nIdTipoSexo) + ') and '
  else
    sWhere := sWhere + '(id_tipo_sexo = 0) and ';
  sqlTallas.SQL[nPosWhere] := Copy(sWhere,1,Length(sWhere) - 5);

  sqlTallas.Open;
end;

procedure TdmRanning.DataModuleCreate(Sender: TObject);
begin
  FEqivIVA := TStringList.Create;
  CHAR_RECORD_ACTION['I'] := raInsert;
  CHAR_RECORD_ACTION['M'] := raModify;
  CHAR_RECORD_ACTION['D'] := raDelete;
  CargaConfiguracionActual;
  FColorUnico := '';
  FComandoSQLList := TList.Create;
  FDireccionRemite := '';
  FLinea := '';
end;

procedure TdmRanning.DataModuleDestroy(Sender: TObject);

var
  nCont: Integer;

begin
  MantenimientoPresupuestos(False);
  dbRanning.Disconnect;
  dbWeb.Disconnect;
  if dbAccess.Connected then dbAccess.Close;
  FEqivIVA.Free;
  for nCont := 0 to FComandoSQLList.Count - 1 do
    TZReadOnlyQuery(FComandoSQLList[nCont]).Close;
end;

function TdmRanning.FormateaPrecio(rPrecio: Extended): string;
begin
  Result := FloatToStrF(rPrecio,ffCurrency,10,2);
end;

function TdmRanning.DescColor(const sCdColor: string): string;

var
  nCont: Integer;
  sColor: string;

begin
  Result := 'Color sin definir';
  if Pos(CHAR_COLOR_SIN_DEFINIR,sCdColor) <> 0 then Exit;
  
  nCont := 1;
  sColor := '';
  while nCont < Length(sCdColor) do begin
    if sqlColores.Active then sqlColores.Close;
    sqlColores.ParamByName('id_color').AsString :=
      IntToStr(ToDecimal(UpperCase(Copy(sCdColor,nCont,DIGITOS_CD_COLOR)),BASE_CD_COLOR));
    sqlColores.Open;
    sColor := sColor + sqlColores.FieldByName('ds_color').AsString + '/';
    Inc(nCont,DIGITOS_CD_COLOR);
  end;

  Result := Copy(sColor,1,Length(sColor) - 1);
end;

function TdmRanning.FormateaPrecio(fldPrecio: TField): string;
begin
  Result := FormateaPrecio(fldPrecio.AsFloat);
end;

function TdmRanning.GetConfiguracionWeb: TConfiguracion;
begin
  Result := FConfiguracionWeb;
end;

function TdmRanning.GetDescConfiguracionWeb: string;
begin
  Result := DESC_CONFIGURACION[FConfiguracionWeb];
end;

function TdmRanning.GetPathServidor: TFileName;
begin
  Result := FPathServidor;
end;

function TdmRanning.GetServidorWeb: string;
begin
  Result := FServidorWeb;
end;

function TdmRanning.ItFieldMarked(Field: TField): Boolean;
begin
  Result := Field.AsString = CAMPO_MARCADO;
end;

function TdmRanning.LastDay(nMonth, nYear: Word): Word;

var
  nDia: Word;
  nMes: Word;
  nAno: Word;

begin
  DecodeDate(IncMonth(EncodeDate(nYear,nMonth,1),1) - 1,nAno,nMes,nDia);
  Result := nDia;
end;

procedure TdmRanning.MantenimientoPresupuestos(lManual: Boolean);

var
  sqlFile: TZReadOnlyQuery;
  sId: string;
  sIni: TFileName;
  nFecha: TDate;

begin
  sIni := PathServidor + ChangeFileExt(ExtractFileName(Application.ExeName),'.ini');
  if not lManual then begin
    with TIniFile.Create(sIni) do
      try
        nFecha := ReadDate('ActualizacionPresupuestos','Fecha',0);
      finally
        Free;
      end;
    if nFecha >= Date then Exit;
  end;

  ComandoSQL('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_CADUCADO) + ' where (id_estado_pedido in (' +
    IntToStr(ID_ESTADO_ENVIADO_RANNING) + ',' +
    IntToStr(ID_ESTADO_ENVIADO_CLIENTE) + ',' +
    IntToStr(ID_ESTADO_ANULADO) + ')) and ((to_days(curdate()) - ' +
    'to_days(f_fecha_compra)) > ' + IntToStr(DIAS_CADUCIDAD_PRESUPUESTO) + ')',
    csEjecutar);

  ComandoSQLWeb('update carrito_presupuesto set id_estado_pedido = ' +
    IntToStr(ID_ESTADO_CADUCADO) + ' where (id_estado_pedido in (' +
    IntToStr(ID_ESTADO_ENVIADO_RANNING) + ',' +
    IntToStr(ID_ESTADO_ENVIADO_CLIENTE) + ',' +
    IntToStr(ID_ESTADO_ANULADO) + ')) and ((to_days(curdate()) - ' +
    'to_days(f_fecha_compra)) > ' + IntToStr(DIAS_CADUCIDAD_PRESUPUESTO) + ')',
    csEjecutar);

  sqlFile := ComandoSQL('select id_cliente_web from ' +
    'carrito_presupuesto where (id_estado_pedido = ' +
    IntToStr(ID_ESTADO_CADUCADO) + ') and ((to_days(curdate()) - ' +
    'to_days(f_fecha_compra)) > ' + IntToStr(DIAS_BORRADO_PRESUPUESTO) + ')',
    csResultado);
  if not sqlFile.IsEmpty then begin
    sqlFile.First;
    sId := '(';
    while not sqlFile.Eof do begin
      sId := sId + QuotedStr(sqlFile.FieldByName('id_cliente_web').AsString) + ',';
      sqlFile.Next;
    end;
    sId := Copy(sId,1,Length(sId) - 1) + ')';
    ComandoSQL('delete from carrito where id_cliente_web in ' + sId,csEjecutar);
    ComandoSQL('delete from carrito_presupuesto where id_cliente_web in ' + sId,
      csEjecutar);
  end;
  ComandoSQLFree(sqlFile);

  sqlFile := ComandoSQLWeb('select id_cliente_web from ' +
    'carrito_presupuesto where (id_estado_pedido = ' +
    IntToStr(ID_ESTADO_CADUCADO) + ') and ((to_days(curdate()) - ' +
    'to_days(f_fecha_compra)) > ' + IntToStr(DIAS_BORRADO_PRESUPUESTO) + ')',
    csResultado);
  if not sqlFile.IsEmpty then begin
    sqlFile.First;
    sId := '(';
    while not sqlFile.Eof do begin
      sId := sId + QuotedStr(sqlFile.FieldByName('id_cliente_web').AsString) + ',';
      sqlFile.Next;
    end;
    sId := Copy(sId,1,Length(sId) - 1) + ')';
    ComandoSQLWeb('delete from carrito where id_cliente_web in ' + sId,csEjecutar);
    ComandoSQLWeb('delete from carrito_presupuesto where id_cliente_web in ' +
      sId,csEjecutar);
  end;
  ComandoSQLFree(sqlFile);

  sqlFile := ComandoSQL('select id_cliente_web from carrito_presupuesto ' +
    'where id_estado_pedido = ' + IntToStr(ID_ESTADO_CADUCADO),csResultado);
  sqlFile.First;
  while not sqlFile.Eof do begin
    sId := sqlFile.FieldByName('id_cliente_web').AsString;
    if FileExists(PathPresupuestos + sId + '.htm') then begin
      if not DeleteFile(PathPresupuestos + sId + '.htm') then
        ShowMessage('No se pudo borrar el archivo ' + PathPresupuestos + sId + '.htm');
    end;

    if FileExists(PathPresupuestos + sId + '.pdf') then begin
      if not DeleteFile(PathPresupuestos + sId + '.pdf') then
        ShowMessage('No se pudo borrar el archivo ' + PathPresupuestos + sId + '.pdf');
    end;
    sqlFile.Next;
    Application.ProcessMessages;
  end;
  ComandoSQLFree(sqlFile);

  sqlFile := ComandoSQL('select id_cliente_web from carrito_presupuesto ' +
    'where (to_days(curdate()) - to_days(f_fecha_compra)) > ' +
    IntToStr(DIAS_BORRADO_PRESUPUESTO),csResultado);
  sqlFile.First;
  while not sqlFile.Eof do begin
    sId := sqlFile.FieldByName('id_cliente_web').AsString;
    if FileExists(PathPresupuestos + sId + '.htm') then begin
      if not DeleteFile(PathPresupuestos + sId + '.htm') then
        ShowMessage('No se pudo borrar el archivo ' + PathPresupuestos + sId + '.htm');
    end;

    if FileExists(PathPresupuestos + sId + '.pdf') then begin
      if not DeleteFile(PathPresupuestos + sId + '.pdf') then
        ShowMessage('No se pudo borrar el archivo ' + PathPresupuestos + sId + '.pdf');
    end;

    if FileExists(PathPresupuestoswww + sId + '.htm') then begin
      if not DeleteFile(PathPresupuestoswww + sId + '.htm') then
        ShowMessage('No se pudo borrar el archivo ' + PathPresupuestoswww + sId + '.htm');
    end;
    sqlFile.Next;
    Application.ProcessMessages;
  end;
  ComandoSQLFree(sqlFile);

  with TIniFile.Create(sIni) do
    try
      WriteDate('ActualizacionPresupuestos','Fecha',Date);
    finally
      Free;
    end;

  if lManual then ShowMessage('Proceso terminado');
end;

function TdmRanning.RanningDay(nMonth, nYear: Word): TDate;

var
  nRanning: Word;
  nDia: Word;

begin
  Randomize;
  nDia := LastDay(nMonth,nYear);
  nRanning := Random(nDia) + 1;
  while not (DayOfWeek(EncodeDate(nYear,nMonth,nRanning)) in RANNING_DAYS) do
    nRanning := Random(nDia) + 1;

  Result := EncodeDate(nYear,nMonth,nRanning);
end;

procedure TdmRanning.ProductoModificado(nIdProducto: Integer);
begin
  ComandoSQL('update productos set f_actualizacion = now() where id_producto = ' +
    IntToStr(nIdProducto),csEjecutar);
  TablaModificada('productos','id_producto',nIdProducto,raModify);
end;

procedure TdmRanning.TablaModificada(const sTabla, sCampoId: string;
  nId: Integer; Accion: TRecordAction);

var
  sAccion: string;
  AccionAnt: TRecordAction;
  AccionFin: TRecordAction;
  sqlProducto: TZReadOnlyQuery;
  fldProducto: TField;

begin
  if sTabla <> 'productos' then begin
    sqlProducto := ComandoSQL('select * from ' + sTabla + ' where ' + sCampoId +
      ' = ' + IntToStr(nId),csResultado);
    fldProducto := nil;
    fldProducto := sqlProducto.FindField('id_producto');
    if Assigned(fldProducto) then ProductoModificado(fldProducto.AsInteger);
    ComandoSQLFree(sqlProducto);
  end;

  AccionFin := Accion;
  if sqlSubir.Active then sqlSubir.Close;
  sqlSubir.SQL.Text := 'select it_accion from subir_tablas where (ds_tabla = ' +
    QuotedStr(sTabla) + ') and (id = ' + IntToStr(nId) + ')';
  sqlSubir.Open;
  sAccion := sqlSubir.FieldByName('it_accion').AsString;
  if sAccion <> '' then begin
    AccionAnt := CHAR_RECORD_ACTION[sAccion[1]];
    case AccionAnt of
      raInsert, raModify: begin
        case Accion of
          raDelete: begin
            sqlSubir.Close;
            sqlSubir.SQL.Text := 'delete from subir_tablas where (ds_tabla = ' +
              QuotedStr(sTabla) + ') and (id = ' + IntToStr(nId) + ')';
            sqlSubir.ExecSQL;
          end;
        end;
      end;
    end;
  end;

  if sAccion = '' then begin
    sqlSubir.Close;
    sqlSubir.SQL.Text := 'insert into subir_tablas (ds_tabla,ds_campo_id,' +
      'id,it_accion) values (' + QuotedStr(sTabla) + ',' + QuotedStr(sCampoId) +
      ',' + IntToStr(nId) + ',' + QuotedStr(RECORD_ACTION_CHAR[AccionFin]) + ')';
    sqlSubir.ExecSQL;
  end;
end;

procedure TdmRanning.TablasASubir(slTablas: TStrings);

var
  sqlTablas: TZReadOnlyQuery;

begin
  slTablas.Clear;
  sqlTablas := ComandoSQL('select distinct ds_tabla from subir_tablas ' +
    'order by ds_tabla',csResultado);
  sqlTablas.First;
  while not sqlTablas.Eof do begin
    slTablas.Add(sqlTablas.FieldByName('ds_tabla').AsString);
    sqlTablas.Next;
  end;
  ComandoSQLFree(sqlTablas);
end;

function TdmRanning.UltimoDiaPresupuesto(nFechaCompra: TDate): TDate;
begin
  Result := nFechaCompra + DIAS_CADUCIDAD_PRESUPUESTO;
end;

function TdmRanning.UltimoID: Integer;

var
  sqlComando: TZReadOnlyQuery;
  nId: Integer;

begin
  sqlComando := ComandoSQL('select last_insert_id() ult_id',
    csResultado);
  nId := sqlComando.FieldByName('ult_id').AsInteger;
  
  Result := nId;
end;

function TdmRanning.GetCdColorUnico: string;

var
  sqlColor: TZReadOnlyQuery;
  nColor: Integer;

begin
  sqlColor := ComandoSQL('select id_color from colores where ds_color = ' +
    QuotedStr(COLOR_UNICO),csResultado);
  nColor := sqlColor.FieldByName('id_color').AsInteger;

  ComandoSQLFree(sqlColor);

  Result := CodColor(nColor);
end;

function TdmRanning.CodColor(nIdColor: Integer): string;
begin
  Result := LowerCase(ToBase(IntToStr(nIdColor),10,BASE_CD_COLOR,DIGITOS_CD_COLOR));
end;

procedure TdmRanning.SeparaCdColor(const sCdColor: string;
  slCdColores: TStrings);

var
  nCont: Integer;

begin
  slCdColores.Clear;
  if Pos(CHAR_COLOR_SIN_DEFINIR,sCdColor) <> 0 then begin
    slCdColores.Add(CdColorUnico);
    Exit;
  end;

  nCont := 1;
  while nCont < Length(sCdColor) do begin
    slCdColores.Add(Copy(sCdColor,nCont,DIGITOS_CD_COLOR));
    Inc(nCont,DIGITOS_CD_COLOR);
  end;
end;

procedure TdmRanning.ShowPopupMenu(Control: TControl; Menu: TPopupMenu);

var
  Pop: TPoint;
  nAlto: Integer;

begin
  Pop := Control.ClientToScreen(Point(Control.Left,Control.Top));
  nAlto := Menu.Items.Count * GetSystemMetrics(SM_CYMENU);
  Menu.Popup(Pop.x,Pop.y + Control.Height - nAlto);
end;

procedure TdmRanning.SubePedido(const sFile: TFileName);
begin
  ftpPedidos.Connect;
  try
    ftpPedidos.Mode(MODE_IMAGE);
    lErrorPedidoFtp := False;
    ftpPedidos.ChangeDir(PATH_PEDIDOS_WEB);
    Application.ProcessMessages;
    ftpPedidos.Delete(PATH_PEDIDOS_WEB + ExtractFileName(sFile));
    Application.ProcessMessages;
    ftpPedidos.Upload(sFile,PATH_PEDIDOS_WEB + ExtractFileName(sFile));
    Application.ProcessMessages;
    if lErrorPedidoFtp then
      ShowMessage('El pedido ' + sFile + ' no se pudo subir al servidor');
  finally
    ftpPedidos.Disconnect;
  end;
end;

procedure TdmRanning.SubeImagenes(lAuto: Boolean);

var
  slImg: TStringList;
  nCont: Integer;
  pStep: TProgressStepProc;
  nPos: Integer;
  sPImg: string;

begin
  if not FileExists(PathServidor + FILE_SUBIR_IMG) then begin
    if not lAuto then ShowMessage('No hay imágenes pendientes de subir a la web');
    Exit;
  end;

  slImg := nil;
  ftpImages.Connect;
  try
    ftpImages.Mode(MODE_IMAGE);
    slImg := TStringList.Create;
    slImg.LoadFromFile(PathServidor + FILE_SUBIR_IMG);
    pStep := ShowProgress('Subiendo ' + IntToStr(slImg.Count) +
      ' imágenes al servidor',0,2 * (slImg.Count));
    for nCont := 0 to slImg.Count - 1 do begin
      lErrorImagenFtp := False;
      nPos := PosEnd('\',slImg[nCont]);
      ftpImages.ChangeDir(PATH_IMG_PRODUCTOS_WEB + Copy(slImg[nCont],1,nPos - 1));
      Application.ProcessMessages;
      if lErrorImagenFtp then begin
        ftpImages.MakeDirectory(PATH_IMG_PRODUCTOS_WEB + Copy(slImg[nCont],1,nPos - 1));
        lErrorImagenFtp := False;
      end;
      ftpImages.Upload(PathImages + PATH_IMG_PRODUCTOS + slImg[nCont],
        PATH_IMG_PRODUCTOS_WEB + StringReplace(slImg[nCont],'\','/',[rfReplaceAll]));
      pStep;
      sPImg := slImg[nCont];
      Insert('p_',sPImg,nPos + 1);
      ftpImages.ChangeDir(PATH_IMG_P_PRODUCTOS_WEB + Copy(slImg[nCont],1,nPos - 1));
      Application.ProcessMessages;
      if lErrorImagenFtp then begin
        ftpImages.MakeDirectory(PATH_IMG_P_PRODUCTOS_WEB + Copy(slImg[nCont],1,nPos - 1));
        lErrorImagenFtp := False;
      end;
      ftpImages.Upload(PathImages + PATH_IMG_P_PRODUCTOS + sPImg,
        PATH_IMG_P_PRODUCTOS_WEB + StringReplace(sPImg,'\','/',[rfReplaceAll]));
      pStep;
      if not lErrorImagenFtp then slImg[nCont] := '';
    end;
    if not lErrorImagenFtp then slImg[slImg.Count - 1] := '';
    nCont := 0;
    while nCont < slImg.Count do
      if slImg[nCont] = '' then
        slImg.Delete(nCont)
      else
        Inc(nCont);
    if slImg.Count = 0 then begin
      DeleteFile(PathServidor + FILE_SUBIR_IMG);
      ShowMessage('Se subieron todas las imágenes a la web');
    end
    else begin
      slImg.SaveToFile(PathServidor + FILE_SUBIR_IMG);
      ShowMessage('Quedaron pendientes por subir las siguentes imágenes:' +
        #13 + #10 + #13 + #10 + StringReplace(slImg.CommaText,',',#13 + #10,
        [rfReplaceAll]));
    end;
  finally
    ftpImages.Disconnect;
    if Assigned(slImg) then slImg.Free;
  end;

  PostMessage(Application.MainForm.Handle,MSG_FILE_SUBIR_IMG,0,0);
end;

procedure TdmRanning.ImagenModificada(const sImgFile: TFileName);

var
  fImg: TextFile;

begin
  AssignFile(fImg,PathServidor + FILE_SUBIR_IMG);
  if FileExists(PathServidor + FILE_SUBIR_IMG) then
    Append(fImg)
  else begin
    Rewrite(fImg);
    PostMessage(Application.MainForm.Handle,MSG_FILE_SUBIR_IMG,0,0);
  end;
  try
    Writeln(fImg,sImgFile);
  finally
    Flush(fImg);
    CloseFile(fImg);
  end;
end;

function TdmRanning.GetImagenesPendientes: Boolean;
begin
  Result := FileExists(PathServidor + FILE_SUBIR_IMG);
end;

procedure TdmRanning.ImagenRenombrada(const sImgOld, sImgNew: TFileName);

var
  slImg: TStringList;

begin
  if FileExists(PathServidor + FILE_SUBIR_IMG) then begin
    slImg := TStringList.Create;
    try
      slImg.LoadFromFile(PathServidor + FILE_SUBIR_IMG);
      slImg.Delete(slImg.IndexOf(sImgOld));
      slImg.SaveToFile(PathServidor + FILE_SUBIR_IMG);
    finally
      slImg.Free;
    end;
  end;

  ImagenModificada(sImgNew);
end;

function TdmRanning.FormateaPorcentaje(rPorcentaje: Extended): string;

var
  sRes: string;

begin
  sRes := FloatToStrF(rPorcentaje,ffFixed,6,2) + ' %';
  if sRes = FloatToStrF(rPorcentaje,ffFixed,5,1) + '0 %' then
    sRes := FloatToStrF(rPorcentaje,ffFixed,5,1) + ' %';
    
  Result := sRes;
end;

function TdmRanning.FormateaPorcentaje(fldPorcentaje: TField): string;
begin
  Result := FormateaPorcentaje(fldPorcentaje.AsFloat);
end;

procedure TdmRanning.BorraStockCero;

var
  sqlActivo: TZReadOnlyQuery;
  sActivo: string;

begin
  ComandoSQL('delete from stock where nm_cantidad = 0',csEjecutar);
  ComandoSQLWeb('delete from stock where nm_cantidad = 0',csEjecutar);
  sqlActivo := ComandoSQL('select kk.id_producto from (select p.id_producto,' +
    'sum(s.nm_cantidad) nm_uds from productos p left join stock s on ' +
    'p.id_producto = s.id_producto where p.it_activo = ' + QuotedStr(CAMPO_MARCADO) +
    ' group by p.id_producto) kk where (kk.nm_uds is null) or (kk.nm_uds = 0)',
    csResultado);
  if sqlActivo.RecordCount = 0 then begin
    ComandoSQLFree(sqlActivo);
    Exit;
  end;

  sActivo := '';
  sqlActivo.First;
  while not sqlActivo.Eof do begin
    sActivo := sActivo + sqlActivo.FieldByName('id_producto').AsString + ',';
    TablaModificada('productos','id_producto',
      sqlActivo.FieldByName('id_producto').AsInteger,raModify);
    sqlActivo.Next;
  end;
  ComandoSQLFree(sqlActivo);
  SetLength(sActivo,Length(sActivo) - 1);
  ComandoSQL('update productos set it_activo = ' + QuotedStr(CAMPO_NO_MARCADO) +
    ' where id_producto in (' + sActivo + ')',csEjecutar);
end;

function TdmRanning.GetBBDDWeb: string;
begin
  Result := FBBDDWeb;
end;

function TdmRanning.GetPathPresupuestos: TFileName;
begin
  Result := PathServidor + PATH_PRESUPUESTOS;
end;

function TdmRanning.GetBBDDLocal: string;
begin
  Result := FBBDDLocal;
end;

function TdmRanning.GetPathFotosProductos: TFileName;
begin
  Result := FPathFotosProductos;
end;

function TdmRanning.GetPathFotosImages: TFileName;
begin
  Result := FPathImages;
end;

function TdmRanning.GetCCC: string;
begin
  Result := FCCC;
end;

function TdmRanning.GetPathPresupuestoswww: TFileName;
begin
  Result := PathServidor + PATH_PRESUPUESTOS_WWW;
end;

procedure TdmRanning.CambiaExtensionPresupuesto(const sFile: TFileName);
begin
  RenameFile(sFile + '.htm',sFile + '.htm' + SUFIJO_PRESUP_BORRADO);
  RenameFile(sFile + '.pdf',sFile + '.pdf' + SUFIJO_PRESUP_BORRADO);
end;

function TdmRanning.GetDiasOfertaLanzamiento: Integer;
begin
  Result := FDiasOfertaLanzamiento;
end;

procedure TdmRanning.OfertaLanzamiento(nIdProducto, nIdTemporada: Integer;
  nFechaInicio: TDate);

var
  sMsg: string;
  nIdOferta: Integer;
  lActualizar: Boolean;

begin
  if EsMismaOfertaLanzamiento(nIdProducto,nIdTemporada,nFechaInicio) then begin
    ShowMessage('Ya existe oferta de lanzamiento para este producto');
    Exit;
  end;

  lActualizar := False;
  if sqlOfertasLanzamiento.FieldByName('id_producto').AsInteger = nIdProducto then begin
    sMsg := 'Ya existe oferta de lanzamiento para este producto.' + SALTO_LINEA +
      '¿Quieres prolongar la oferta del día ' +
      FormatDateTime('dd/mm/yyyy',sqlOfertasLanzamiento.FieldByName('f_fin').AsDateTime) +
      ' al día ' + FormatDateTime('dd/mm/yyyy',nFechaInicio + DiasOfertaLanzamiento) +
      '?';
    if MessageDlg(sMsg,mtWarning,[mbYes,mbNo],0) <> mrYes then
      Exit
    else begin
      lActualizar := True;
      nIdOferta := sqlOfertasLanzamiento.FieldByName('id_oferta').AsInteger;
      ComandoSQL('update ofertas set id_temporada = ' + IntToStr(nIdTemporada) +
        ', f_inicio = ' + QuotedStr(FormatDateTime('yyyy-mm-dd',nFechaInicio)) +
        ', f_fin = ' + QuotedStr(FormatDateTime('yyyy-mm-dd',nFechaInicio + DiasOfertaLanzamiento)) +
        ' where id_oferta = ' + sqlOfertasLanzamiento.FieldByName('id_oferta').AsString,
        csEjecutar);
    end;
  end
  else begin
    ComandoSQL('insert into ofertas (id_producto,id_temporada,f_inicio,f_fin,' +
      'id_descuento,ds_oferta) select ' + IntToStr(nIdProducto) + ',' +
      IntToStr(nIdTemporada) + ',' + QuotedStr(FormatDateTime('yyyy-mm-dd',nFechaInicio)) + ',' +
      QuotedStr(FormatDateTime('yyyy-mm-dd',nFechaInicio + DiasOfertaLanzamiento)) + ',' +
      IntToStr(IdDescuentoOfertaLanzamiento) + ',concat(' +
      QuotedStr(OFERTA_LANZAMIENTO + ' ') + ',ds_producto) from productos where ' +
      'id_producto = ' + IntToStr(nIdProducto),csEjecutar);
    nIdOferta := UltimoID;
  end;

  if lActualizar then
    TablaModificada('ofertas','id_oferta',nIdOferta,raModify)
  else
    TablaModificada('ofertas','id_oferta',nIdOferta,raInsert);

  ShowMessage('Oferta de lanzamiento realizada hasta el día ' +
    FormatDateTime('dd/mm/yyyy',nFechaInicio + DiasOfertaLanzamiento));
end;

function TdmRanning.EsMismaOfertaLanzamiento(nIdProducto, nIdTemporada: Integer;
  nFechaInicio: TDate): Boolean;
begin
  Result := False;
  if sqlOfertasLanzamiento.Active then sqlOfertasLanzamiento.Close;
  sqlOfertasLanzamiento.Open;
  if not sqlOfertasLanzamiento.Locate('id_producto',nIdProducto,[]) then Exit;

  if (nIdTemporada <> sqlOfertasLanzamiento.FieldByName('id_temporada').AsInteger) or
     (nFechaInicio <> sqlOfertasLanzamiento.FieldByName('f_inicio').AsDateTime) then Exit;

  Result := True;
end;

function TdmRanning.GetIdDescuentoOfertaLanzamiento: Integer;
begin
  Result := FIdDescuentoOfertaLanzamiento;
end;

function TdmRanning.GetIVA: Extended;
begin
  Result := FIVA;
end;

function TdmRanning.GetEquivalenciaIVA(const Index: string): Extended;

var
  sIVA: string;

begin
  Result := -1;

  sIVA := FEqivIVA.Values[Index];
  if sIVA = '' then Exit;

  Result := StrToFloat(sIVA) / 100;
end;

procedure TdmRanning.ComandoSQLFree(var sqlComando: TZReadOnlyQuery);
begin
  sqlComando.Close;
  sqlComando.SQL.Clear;
  sqlComando.SQL.Text := '';
  sqlComando := nil;
end;

function TdmRanning.ComandoSQLCreate(const sSQL: string): TZReadOnlyQuery;

var
  nCont: Integer;
  sqlComando: TZReadOnlyQuery;

begin
  nCont := 0;
  sqlComando := nil;
  if FComandoSQLList.Count = 0 then begin
    sqlComando := TZReadOnlyQuery.Create(Self);
    sqlComando.SQL.Text := sSQL;
    FComandoSQLList.Add(sqlComando);
    Result := sqlComando;
    Exit;
  end;

  while (nCont < FComandoSQLList.Count) and (TZReadOnlyQuery(FComandoSQLList.Items[nCont]).SQL.Text <> '') do
    nCont := nCont + 1;

  if nCont < FComandoSQLList.Count then
    sqlComando := TZReadOnlyQuery(FComandoSQLList.Items[nCont])
  else begin
    sqlComando := TZReadOnlyQuery.Create(Self);
    FComandoSQLList.Add(sqlComando);
  end;
  sqlComando.SQL.Text := sSQL;

  Result := sqlComando;
end;

function TdmRanning.GetDireccionRemite: string;
begin
  CargaConfiguracionActual;
  Result := StringReplace(FDireccionRemite,FLinea,SALTO_LINEA,[rfReplaceAll]);
end;

{ TDatosProductoFile }

procedure TDatosProductoFile.EraseProducto(nNumProd: Integer);
begin
  EraseSection(SECCION_PRODUCTO + IntToStr(nNumProd));
end;

function TDatosProductoFile.LastProduct: Integer;

var
  slProd: TStringList;
  nCont: Integer;
  nProd: Integer;
  nUlt: Integer;

begin
  slProd := TStringList.Create;
  try
    ReadSections(slProd);
    nUlt := 0;
    for nCont := 0 to slProd.Count - 1 do 
      if Pos(SECCION_PRODUCTO,slProd[nCont]) <> 0 then begin
        nProd := StrToInt(ToEnd(slProd[nCont],Length(SECCION_PRODUCTO) + 1));
        if nProd > nUlt then nUlt := nProd;
      end;
  finally
    slProd.Free;
  end;

  Result := nUlt;
end;

function TDatosProductoFile.ReadDatosProducto(
  nNumProd: Integer): TDatosProducto;

var
  slProd: TStringList;
  Prod: TDatosProducto;

begin
  slProd := TStringList.Create;
  try
    ReadSectionValues(SECCION_PRODUCTO + IntToStr(nNumProd),slProd);
    if slProd.Count = 0 then begin
      Prod.nIdProducto := -1;
      Result := Prod;
      Exit;
    end;
    
    Prod.nIdProducto := StrToInt(slProd.Values['nIdProducto']);
    Prod.sCdColor := slProd.Values['sCdColor'];
    Prod.nIdTalla := StrToInt(slProd.Values['nIdTalla']);
    Prod.rPVP := StrToFloat(slProd.Values['rPVP']);
    Prod.rDescuento := StrToFloat(slProd.Values['rDescuento']);
    Prod.nFecha := StrToDateTime(slProd.Values['nFecha']);
  finally
    slProd.Free;
  end;

  Result := Prod;
end;

function TDatosProductoFile.ReadLastDate: TDateTime;
begin
  Result := StrToDateTime(ReadString(SECCION_FECHA,SECCION_FECHA,'0'));
end;

procedure TDatosProductoFile.WriteDatosProducto(Prod: TDatosProducto);

var
  sSeccion: string;

begin
  sSeccion := SECCION_PRODUCTO + IntToStr(LastProduct + 1);
  WriteString(sSeccion,'nIdProducto',IntToStr(Prod.nIdProducto));
  WriteString(sSeccion,'sCdColor',Prod.sCdColor);
  WriteString(sSeccion,'nIdTalla',IntToStr(Prod.nIdTalla));
  WriteString(sSeccion,'rPVP',FloatToStr(Prod.rPVP));
  WriteString(sSeccion,'rDescuento',FloatToStr(Prod.rDescuento));
  WriteString(sSeccion,'nFecha',DateTimeToStr(Prod.nFecha));
end;

procedure TDatosProductoFile.WriteLastDate(nDate: TDateTime);
begin
  WriteString(SECCION_FECHA,SECCION_FECHA,DateTimeToStr(nDate));
end;

procedure TdmRanning.ftpImagesConnectionFailed(Sender: TObject);
begin
  ShowMessage('La conexión con el servidor FTP no se pudo abrir');
end;

procedure TdmRanning.ftpImagesFailure(var Handled: Boolean;
  Trans_Type: TCmdType);
begin
  if not (Trans_Type in [cmdUpload,cmdChangeDir]) then Exit;

  lErrorImagenFtp := True;
  Handled := True;
end;

procedure TdmRanning.dbWebBeforeConnect(Sender: TObject);
begin
 dbWeb.HostName := BBDDWeb;
end;

procedure TdmRanning.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDLocal;
end;

procedure TdmRanning.dbAccessBeforeConnect(Sender: TObject);
begin
  dbAccess.ConnectionString := FAccessConnString;
end;

procedure TdmRanning.ftpPedidosFailure(var Handled: Boolean;
  Trans_Type: TCmdType);
begin
  if not (Trans_Type in [cmdUpload,cmdChangeDir,cmdDelete]) then Exit;

  lErrorPedidoFtp := Trans_Type in [cmdUpload,cmdChangeDir];
  Handled := True;
end;

end.
