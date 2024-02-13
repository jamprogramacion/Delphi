unit udmProductos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZAbstractRODataset, ZDataset, ZSqlUpdate, ZAbstractDataset, Provider,
  DBClient, udmRanning, dbGrids, ADODB;

const
  IMG_NO_DISPONIBLE = 'no_disponible.gif';
  IMG_P_NO_DISPONIBLE = 'p_no_disponible.gif';

type
  TdmProductos = class(TDataModule)
    sqlProductos: TZReadOnlyQuery;
    dsProductos: TDataSource;
    sqlProductoscod_producto: TStringField;
    sqlProductoscd_producto: TStringField;
    sqlProductosds_producto: TStringField;
    sqlProductosds_tipo_producto: TStringField;
    sqlProductosds_tipo_complemento: TStringField;
    sqlProductosds_tipo_deporte: TStringField;
    sqlProductosds_tipo_sexo: TStringField;
    sqlProductosds_marca: TStringField;
    sqlProductosit_activo: TStringField;
    dsAltaProductos: TDataSource;
    dsMarcas: TDataSource;
    dsTiposSexo: TDataSource;
    dsTiposDeporte: TDataSource;
    dsTiposComplemento: TDataSource;
    dsTiposProducto: TDataSource;
    sqlTiposSexo: TZReadOnlyQuery;
    sqlTiposDeporte: TZReadOnlyQuery;
    sqlTiposComplemento: TZReadOnlyQuery;
    sqlTiposProducto: TZReadOnlyQuery;
    sqlTiposProductoid_tipo_producto: TLargeintField;
    sqlTiposProductods_tipo_producto: TStringField;
    sqlTiposComplementoid_tipo_complemento: TLargeintField;
    sqlTiposComplementods_tipo_complemento: TStringField;
    sqlTiposDeporteid_tipo_deporte: TLargeintField;
    sqlTiposDeporteds_imagen_cabecera: TStringField;
    sqlTiposDeporteds_tipo_deporte: TStringField;
    sqlTiposDeporteit_activo: TStringField;
    sqlTiposSexoid_tipo_sexo: TLargeintField;
    sqlTiposSexods_tipo_sexo: TStringField;
    sqlProductosid_producto: TLargeintField;
    sqlMarcas: TZReadOnlyQuery;
    sqlMarcasid_marca: TLargeintField;
    sqlMarcascd_marca: TStringField;
    sqlMarcasds_marca: TStringField;
    sqlMarcasid_pais: TLargeintField;
    sqlMarcasds_web: TStringField;
    sqlAltaProductosInsert: TZReadOnlyQuery;
    sqlAltaProductosUpdate: TZReadOnlyQuery;
    sqlAltaProductos: TZQuery;
    sqlAltaProductosid_producto: TLargeintField;
    sqlAltaProductoscd_producto: TStringField;
    sqlAltaProductosds_producto: TStringField;
    sqlAltaProductosid_tipo_producto: TLargeintField;
    sqlAltaProductosid_tipo_deporte: TLargeintField;
    sqlAltaProductosid_tipo_sexo: TLargeintField;
    sqlAltaProductosid_marca: TLargeintField;
    sqlAltaProductosit_activo: TStringField;
    sqlAltaProductosf_entrada: TDateField;
    sqlAltaProductosobservaciones: TMemoField;
    sqlAltaProductoscd_barras: TStringField;
    sqlAltaProductosds_tipo_producto: TStringField;
    sqlAltaProductosds_tipo_complemento: TStringField;
    sqlAltaProductosds_tipo_deporte: TStringField;
    sqlAltaProductosds_tipo_sexo: TStringField;
    sqlAltaProductosds_marca: TStringField;
    sqlProductosid_marca: TLargeintField;
    sqlProductosid_tipo_deporte: TLargeintField;
    sqlAltaProductosid_tipo_complemento: TLargeintField;
    sqlStock: TZQuery;
    dsStock: TDataSource;
    sqlProductosDetalle: TZQuery;
    dsProductosDetalle: TDataSource;
    sqlStockid_producto: TLargeintField;
    sqlStockid_talla: TLargeintField;
    sqlStockf_entrada: TDateField;
    sqlStocknm_coste: TFloatField;
    sqlStocknm_iva: TFloatField;
    sqlStocknm_pvp: TFloatField;
    sqlStocknm_descuento_coste: TFloatField;
    sqlStocknm_portes: TFloatField;
    sqlStockds_talla: TStringField;
    dsDescuentos: TDataSource;
    sqlStockInsert: TZReadOnlyQuery;
    sqlStockUpdate: TZReadOnlyQuery;
    sqlStockDelete: TZReadOnlyQuery;
    sqlTallas: TZReadOnlyQuery;
    dsTallas: TDataSource;
    sqlColores: TZReadOnlyQuery;
    dsColores: TDataSource;
    sqlColoresid_color: TLargeintField;
    sqlColoresds_color: TStringField;
    sqlStockid_marca: TLargeintField;
    sqlProductosid_tipo_producto: TLargeintField;
    sqlProductosid_tipo_sexo: TLargeintField;
    sqlUltStock: TZQuery;
    LargeintField1: TLargeintField;
    LargeintField3: TLargeintField;
    DateField1: TDateField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IntegerField1: TIntegerField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    LargeintField4: TLargeintField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField6: TFloatField;
    LargeintField5: TLargeintField;
    sqlStockds_producto: TStringField;
    sqlImagenProducto: TZReadOnlyQuery;
    sqlImagenProductods_imagen: TStringField;
    sqlMarcasTipoProductoMargen: TZReadOnlyQuery;
    sqlMarcasTipoProductoMargenid_marca: TLargeintField;
    sqlMarcasTipoProductoMargenid_tipo_producto: TLargeintField;
    sqlMarcasTipoProductoMargenid_margen: TFloatField;
    sqlAltaProductosDelete: TZReadOnlyQuery;
    sqlProductosAtributos: TZReadOnlyQuery;
    sqlProductosAtributosid_atributo: TLargeintField;
    sqlProductosAtributosds_atributo: TStringField;
    dsProductosAtributos: TDataSource;
    dsAtributo: TDataSource;
    sqlAtributo: TZReadOnlyQuery;
    sqlProductosDetalleid_producto: TLargeintField;
    sqlProductosDetalleid_atributo: TLargeintField;
    sqlProductosDetalleid_valor: TLargeintField;
    sqlProductosnm_peso: TIntegerField;
    sqlAltaProductosnm_peso: TIntegerField;
    sqlNumAtributos: TZReadOnlyQuery;
    sqlStockid: TLargeintField;
    sqlProductosDetalleid: TLargeintField;
    sqlStockcd_color: TStringField;
    sqlDatosProducto: TZReadOnlyQuery;
    sqlDatosProductoid_talla: TLargeintField;
    sqlDatosProductonm_pvp_final: TFloatField;
    sqlDatosProductods_talla: TStringField;
    sqlDatosProductonm_descuento: TFloatField;
    sqlDatosProductods_producto: TStringField;
    sqlDatosProductocod_producto: TStringField;
    sqlDatosProductoid_producto: TLargeintField;
    sqlDatosProductonm_pvp: TFloatField;
    sqlDatosProductods_marca: TStringField;
    sqlProductosf_entrada: TDateField;
    sqlProductoscd_marca: TStringField;
    sqlAltaProductosit_novedad: TStringField;
    sqlProductosit_novedad: TStringField;
    sqlDatosProductocd_color: TStringField;
    sqlAtributoid_atributo: TLargeintField;
    sqlAtributoid_valor: TLargeintField;
    sqlAtributods_valor: TStringField;
    sqlProductosDetalleds_valor: TStringField;
    sqlEtiquetas: TZReadOnlyQuery;
    sqlActualizaFActualizacion: TZReadOnlyQuery;
    sqlStockf_actualizacion: TDateField;
    sqlProductosf_actualizacion: TDateField;
    sqlFActualizacion: TZReadOnlyQuery;
    sqlStockcd_color_fabricante: TStringField;
    sqlStockcd_marca: TStringField;
    sqlStockcd_producto: TStringField;
    sqlStocknm_orden_talla: TSmallintField;
    sqlDatosProductonm_orden_talla: TSmallintField;
    sqlStockid_temporada: TLargeintField;
    sqlStockds_temporada: TStringField;
    sqlTemporadas: TZReadOnlyQuery;
    dsTemporadas: TDataSource;
    sqlTemporadasid_temporada: TLargeintField;
    sqlTemporadasds_temporada: TStringField;
    sqlDatosProductonm_iva: TFloatField;
    sqlStockds_color: TStringField;
    sqlDatosProductods_color: TStringField;
    sqlDatosProductods_color_completo: TStringField;
    sqlUltStockid: TLargeintField;
    sqlUltStockcd_color: TStringField;
    sqlUltStockid_temporada: TLargeintField;
    sqlCopiaAtr: TZReadOnlyQuery;
    sqlProductosAccess: TZReadOnlyQuery;
    dsProductosAccess: TDataSource;
    sqlProductosAccesscd_producto: TStringField;
    sqlProductosAccessds_producto: TStringField;
    sqlProductosAccesscd_color_fabricante: TStringField;
    sqlProductosAccessnm_coste: TFloatField;
    sqlProductosAccessds_talla: TStringField;
    sqlProductosAccessnm_iva: TFloatField;
    sqlProductosAccessnm_margen_real: TFloatField;
    sqlProductosAccessnm_pvp: TFloatField;
    sqlTipoProducto: TADOQuery;
    sqlSexo: TADOQuery;
    sqlProveedor: TADOQuery;
    dsTipoProducto: TDataSource;
    dsSexo: TDataSource;
    dsProveedor: TDataSource;
    sqlTipoProductotipopro: TIntegerField;
    sqlTipoProductodescripcion: TWideStringField;
    sqlSexoSEXO_PROD: TFloatField;
    sqlSexoSEXO_DES: TWideStringField;
    sqlProveedorideprov: TIntegerField;
    sqlProveedorproveedor: TWideStringField;
    sqlCodigosAccess: TZReadOnlyQuery;
    sqlCodigosAccessidepro: TStringField;
    sqlProductosAccessid_talla: TLargeintField;
    sqlProductosAccesscd_marca: TStringField;
    sqlStockinInsert: TADOQuery;
    sqlProductosAccessInsert: TADOQuery;
    sqlPreciosInsert: TADOQuery;
    sqlProductosAccessnm_iva2: TFloatField;
    sqlProductosAccesscd_color: TStringField;
    sqlCodigosAccesscd_color: TStringField;
    sqlProductoAccessExiste: TADOQuery;
    sqlProductosAccessf_entrada: TDateField;
    sqlCodigosAccessid_talla: TLargeintField;
    sqlPrecioAccessOK: TADOQuery;
    sqlPreciosUpdate: TADOQuery;
    sqlNumAtributosnm_atributos: TLargeintField;
    sqlOfertas: TZReadOnlyQuery;
    sqlOfertasid_producto: TLargeintField;
    sqlOfertascd_color: TStringField;
    sqlOfertasid_talla: TLargeintField;
    sqlOfertasnm_descuento_stock: TFloatField;
    sqlOfertasnm_descuento_oferta: TFloatField;
    sqlOfertasnm_precio_final_stock: TFloatField;
    sqlOfertasnm_precio_final_oferta: TFloatField;
    sqlOfertasnm_precio_kg_stock: TFloatField;
    sqlOfertasnm_precio_kg_oferta: TFloatField;
    sqlOfertasid_oferta: TLargeintField;
    sqlOfertasid_producto_1: TLargeintField;
    sqlOfertasid_tipo_producto: TLargeintField;
    sqlOfertasid_tipo_complemento: TLargeintField;
    sqlOfertasid_tipo_deporte: TLargeintField;
    sqlOfertasid_temporada: TIntegerField;
    sqlOfertasid_marca: TLargeintField;
    sqlOfertasid_tipo_sexo: TLargeintField;
    sqlOfertasf_inicio: TDateField;
    sqlOfertasf_fin: TDateField;
    sqlOfertasds_oferta: TStringField;
    sqlTipoComplemento: TZQuery;
    sqlTipoComplementoid_tipo_complemento: TLargeintField;
    sqlTipoComplementods_tipo_complemento: TStringField;
    dsTipoComplemento: TDataSource;
    sqlTipoComplementoInsert: TZReadOnlyQuery;
    sqlTipoComplementoUpdate: TZReadOnlyQuery;
    sqlStocknm_cantidad: TLargeintField;
    sqlTemporadasnm_orden: TLargeintField;
    sqlProductosAccessnm_cantidad: TLargeintField;
    sqlProductosDetallenm_cantidad: TFloatField;
    sqlProductosDetalleid_unidad: TLargeintField;
    sqlProductosDetallenm_orden: TLargeintField;
    sqlProductosDetalleds_unidad: TStringField;
    sqlProductosDetalleds_simbolo: TStringField;
    sqlUnidades: TZQuery;
    sqlUnidadesid_unidad: TLargeintField;
    sqlUnidadesds_unidad: TStringField;
    sqlUnidadesds_simbolo: TStringField;
    sqlUnidadesid_unidad_principal: TLargeintField;
    sqlUnidadesnm_multiplicador: TFloatField;
    dsUnidades: TDataSource;
    sqlProductosDetalleUpdate: TZQuery;
    LargeintField2: TLargeintField;
    LargeintField6: TLargeintField;
    LargeintField7: TLargeintField;
    LargeintField8: TLargeintField;
    StringField5: TStringField;
    FloatField7: TFloatField;
    LargeintField9: TLargeintField;
    LargeintField10: TLargeintField;
    StringField6: TStringField;
    StringField7: TStringField;
    sqlAltaProductosf_actualizacion: TDateTimeField;
    sqlPedidosMarca: TZReadOnlyQuery;
    sqlPedidosMarcaid_pedido: TLargeintField;
    sqlPedidosMarcads_pedido: TStringField;
    sqlPedidosMarcaid_temporada: TLargeintField;
    sqlPedidosMarcaid_marca: TLargeintField;
    sqlPedidosMarcaf_entrada: TDateField;
    sqlPedidosMarcaobservaciones: TMemoField;
    sqlPedidosMarcads_temporada: TStringField;
    sqlPedidosMarcads_marca: TStringField;
    sqlAltaProductosnm_mult_puntos: TFloatField;
    sqlProductosAccessnm_mult_puntos: TFloatField;
    sqlPuntosUpdate: TADOQuery;
    sqlStockit_descuento_temporada: TStringField;
    sqlStocknm_descuento_oferta: TFloatField;
    sqlOfertasnm_descuento: TFloatField;
    procedure sqlAltaProductosBeforePost(DataSet: TDataSet);
    procedure sqlAltaProductosNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlProductosAfterOpen(DataSet: TDataSet);
    procedure sqlStockUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlStockBeforePost(DataSet: TDataSet);
    procedure sqlStockBeforeDelete(DataSet: TDataSet);
    procedure sqlStockNewRecord(DataSet: TDataSet);
    procedure sqlProductosAfterScroll(DataSet: TDataSet);
    procedure sqlStockAfterScroll(DataSet: TDataSet);
    procedure sqlAltaProductosAfterOpen(DataSet: TDataSet);
    procedure sqlProductosBeforeClose(DataSet: TDataSet);
    procedure sqlProductosAtributosAfterScroll(DataSet: TDataSet);
    procedure sqlProductosDetalleBeforeOpen(DataSet: TDataSet);
    procedure sqlStockAfterOpen(DataSet: TDataSet);
    procedure sqlProductosDetalleUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlStockAfterPost(DataSet: TDataSet);
    procedure sqlStockAfterInsert(DataSet: TDataSet);
    procedure sqlStockCalcFields(DataSet: TDataSet);
    procedure sqlDatosProductoCalcFields(DataSet: TDataSet);
    procedure sqlUltStockCalcFields(DataSet: TDataSet);
    procedure sqlTipoComplementoBeforePost(DataSet: TDataSet);
    procedure sqlProductosDetalleBeforePost(DataSet: TDataSet);
  private
    FUltIdProducto: Integer;
    FProductosAfterScrollEvent: TDataSetNotifyEvent;
    FProductosAtributosAfterScrollEvent: TDataSetNotifyEvent;
    FStockAfterScrollEvent: TDataSetNotifyEvent;

    function GetNumAtributos: Integer;
    procedure ActualizaProductosDetalle;
    function NombreProducto(nId: Integer): string;
    procedure ActualizaFActualizacion;
    procedure RenameImage(nIdProducto: Integer; const sNewCdProducto: string); overload;
    procedure RenameImage(nIdProducto: Integer; const sOldCdColor, sNewCdColor: string); overload;
    function RenombraFichero(sOldName, sNewName: TFileName): Boolean;
    function GetIdUltimaTemporada: Integer;
    function GetDsUltimaTemporada: string;
    function GetDescuentoOferta: Extended;
  public
    function NombreImagenProducto(nIdProducto: Integer; const sCdColor: string): TFileName;
    function NombreImagenProductoPequena(nIdProducto: Integer;
      const sCdColor: string): TFileName;
    function ImagenProducto(nIdProducto: Integer; const sCdColor: string): TFileName;
    function ProductoConImagen(nIdProducto: Integer): Boolean;
    function MargenProducto(nIdMarca, nIdTipoProducto: Integer): Extended;
    procedure AnadeAtributo(lstAtributos: TBookmarkList); overload;
    procedure AnadeAtributo(nIdAtributo, nIdValor, nOrden, nIdUnidad: Integer;
      rCantidad: Extended); overload;
    procedure BorraAtributo;
    procedure InsertaTallas(slTallas: TStrings);
    procedure InsertaColores(nColores: Integer);
    function BorraProducto(nId: Integer): Boolean;
    function CopiaValorTodos(fldCampo, fldCampoMsg: TField;
      const sIdCopiar: string): Boolean;
    procedure ListaTallasColores(nIdProducto: Integer; slLista: TStrings);
    {
    function DatosProductoToText(nIdProducto, nIdColor,
      nIdTalla: Integer; rPrecio: Extended): string; overload;
    function DatosProductoToText(Producto: TProductoVenta): string; overload;
    function DatosPresupuestoToText(Presupuesto: TProductoVentaList): string;
    procedure DsColor(anIdColor: array of Integer; slDsColor: TStrings);
    }
    function DetalleProducto(nIdProducto: Integer): string;
    function CambiaFechaFichero(sFichero: TFileName; nFecha: TDateTime): Boolean;
    procedure CambiaDescuentoProducto(sqlProductos: TDataSet;
      Rango: TRangoProductos; rDescuento: Extended); overload;
    procedure CambiaDescuentoProducto(nIdProducto: Integer;
      rDescuento: Extended); overload;
    procedure CambiaPrecioProducto(sqlProductos: TDataSet;
      Rango: TRangoProductos; rPrecio: Extended); overload;
    procedure CambiaPrecioProducto(nIdProducto: Integer;
      rPrecio: Extended); overload;
    procedure FiltraActivos(lFiltrar: Boolean);
    procedure AltaProductoAccess(nTipoPro, nSexProd, nIdeProv, nUnidades: Integer;
      lCodColor: Boolean; const sPrefijo, sPrefColor: string;
      slEqTallas: TStrings);
    procedure FiltraProductosAccess(const sCdColor: string); overload;
    procedure FiltraProductosAccess(const sCdColor: string; nIdTalla: Integer); overload;
    function ProductoAccessExiste(const sIdepro: string): Boolean;
    function PrecioAccessOK(const sIdepro: string): Boolean;
    procedure DuplicarProducto(nIdOrigen: Integer; const sCodProDestino: string);
    procedure CloseAccessConnection;
    procedure AltaPedidoDetalle(nIdPedido, nIdProducto: Integer;
      const sCdColor: string); overload;
    procedure AltaPedidoDetalle(nIdPedido, nIdProducto, nIdTalla: Integer;
      const sCdColor: string); overload;

    property UltIdProducto: Integer read FUltIdProducto;
    property NumAtributos: Integer read GetNumAtributos;
    property IdUltimaTemporada: Integer read GetIdUltimaTemporada;
    property DsUltimaTemporada: string read GetDsUltimaTemporada;
    property ProductosAfterScrollEvent: TDataSetNotifyEvent
      read FProductosAfterScrollEvent write FProductosAfterScrollEvent;
    property ProductosAtributosAfterScrollEvent: TDataSetNotifyEvent
      read FProductosAtributosAfterScrollEvent
      write FProductosAtributosAfterScrollEvent;
    property StockAfterScrollEvent: TDataSetNotifyEvent
      read FStockAfterScrollEvent write FStockAfterScrollEvent;
    property DescuentoOferta: Extended read GetDescuentoOferta;
  end;

var
  dmProductos: TdmProductos = nil;

implementation

uses uCommon;

const
  // De tallas
  DS_TALLA_0 = '0.0';

{$R *.DFM}

{ TdmProductos }

procedure TdmProductos.sqlAltaProductosBeforePost(DataSet: TDataSet);

var
  sCdProducto: string;

begin
  case DataSet.State of
    dsEdit: begin
      sCdProducto := DataSet.FieldByName('cd_producto').AsString;
      if DataSet.FieldByName('cd_producto').OldValue <> sCdProducto then
        RenameImage(DataSet.FieldByName('id_producto').AsInteger,sCdProducto);
      sqlAltaProductosUpdate.ExecSQL;
      FUltIdProducto := DataSet.FieldByName('id_producto').AsInteger;
      dmRanning.TablaModificada('productos','id_producto',FUltIdProducto,raModify);
    end;
    dsInsert: begin
      sqlAltaProductosInsert.ExecSQL;
      FUltIdProducto := dmRanning.UltimoID;
      dmRanning.TablaModificada('productos','id_producto',FUltIdProducto,raInsert);
    end;
  end;
end;

procedure TdmProductos.sqlAltaProductosNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('f_entrada').AsDateTime := Date;
  DataSet.FieldByName('f_actualizacion').AsDateTime := Now;
  DataSet.FieldByName('it_activo').AsString := CAMPO_MARCADO;
  DataSet.FieldByName('it_novedad').AsString := CAMPO_MARCADO;
  DataSet.FieldByName('ds_marca').AsString :=
    sqlProductos.FieldByName('ds_marca').AsString;
  DataSet.FieldByName('ds_tipo_producto').AsString :=
    sqlProductos.FieldByName('ds_tipo_producto').AsString;
  DataSet.FieldByName('ds_tipo_complemento').AsString :=
    sqlProductos.FieldByName('ds_tipo_complemento').AsString;
  DataSet.FieldByName('ds_tipo_sexo').AsString :=
    sqlProductos.FieldByName('ds_tipo_sexo').AsString;
  DataSet.FieldByName('ds_tipo_deporte').AsString :=
    sqlProductos.FieldByName('ds_tipo_deporte').AsString;
  DataSet.FieldByName('nm_mult_puntos').AsFloat := 1;
end;

procedure TdmProductos.DataModuleCreate(Sender: TObject);
begin
  FUltIdProducto := -1;
end;

procedure TdmProductos.sqlProductosAfterOpen(DataSet: TDataSet);
begin
  if FUltIdProducto = -1 then Exit;

  DataSet.Locate('id_producto',FUltIdProducto,[]);
end;

procedure TdmProductos.sqlStockUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmProductos.sqlStockBeforePost(DataSet: TDataSet);

var
  sOld: string;
  sNew: string;

begin
  case DataSet.State of
    dsEdit: begin
      sOld := DataSet.FieldByName('cd_color').OldValue;
      sNew := DataSet.FieldByName('cd_color').AsString;
      if sOld <> sNew then begin
        if MessageDlg('¿Quieres renombrar la imagen de este color?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          RenameImage(DataSet.FieldByName('id_producto').AsInteger,sOld,sNew)
      end;
      sqlStockUpdate.ParamByName('cd_color_ant').Value :=
        sqlStock.FieldByName('cd_color').OldValue;
      sqlStockUpdate.ParamByName('id_talla_ant').Value :=
        sqlStock.FieldByName('id_talla').OldValue;
      sqlStockUpdate.ParamByName('f_entrada_ant').Value :=
        sqlStock.FieldByName('f_entrada').OldValue;
      sqlStockUpdate.ExecSQL;
      dmRanning.TablaModificada('stock','id',DataSet.FieldByName('id').AsInteger,
        raModify);
    end;
    dsInsert: begin
      sqlStockInsert.ExecSQL;
      dmRanning.TablaModificada('stock','id',dmRanning.UltimoID,raInsert);
    end;
  end;
end;

procedure TdmProductos.sqlStockBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('¿Estás seguro de borrar este registro?',mtWarning,[mbYes,mbNo],0) = mrYes then begin
    sqlStockDelete.ExecSQL;
    dmRanning.TablaModificada('stock','id',DataSet.FieldByName('id').AsInteger,
      raDelete);
    ActualizaFActualizacion;
  end
  else
    Abort;
end;

procedure TdmProductos.sqlStockNewRecord(DataSet: TDataSet);

const
  asCampos: array[1..16] of string = ('cd_color','id_talla','f_entrada','nm_iva',
    'nm_cantidad','nm_descuento_coste','nm_portes','nm_descuento_oferta',
    'nm_descuento','ds_talla','nm_coste','nm_pvp','nm_descuento_coste',
    'nm_portes','cd_albaran','id_temporada');

var
  nCont: Integer;

begin
  if sqlUltStock.IsEmpty then begin
    DataSet.FieldByName('id_producto').AsInteger :=
      sqlProductos.FieldByName('id_producto').AsInteger;
    DataSet.FieldByName('cd_color').AsString := dmRanning.CdColorUnico;
    DataSet.FieldByName('cd_color_fabricante').AsString := '';
    DataSet.FieldByName('id_talla').AsInteger := 0;
    DataSet.FieldByName('f_entrada').AsDateTime := Date;
    DataSet.FieldByName('nm_iva').AsFloat := dmRanning.IVA;
    DataSet.FieldByName('nm_cantidad').AsInteger := 1;
    DataSet.FieldByName('nm_descuento_coste').AsFloat := 0;
    DataSet.FieldByName('nm_portes').AsFloat := 0;
    DataSet.FieldByName('nm_descuento_oferta').AsFloat := NM_DESCUENTO_10;
    DataSet.FieldByName('ds_talla').AsString := DS_TALLA_0;
    DataSet.FieldByName('ds_color').AsString := COLOR_UNICO;
    DataSet.FieldByName('id_temporada').AsInteger := IdUltimaTemporada;
    DataSet.FieldByName('ds_temporada').AsString := DsUltimaTemporada;
    DataSet.FieldByName('it_descuento_temporada').AsString := CAMPO_MARCADO;
  end
  else begin
    DataSet.FieldByName('id_producto').AsInteger :=
      sqlProductos.FieldByName('id_producto').AsInteger;
    for nCont := Low(asCampos) to High(asCampos) do
      DataSet.FieldByName(asCampos[nCont]).Value :=
        sqlUltStock.FieldByName(asCampos[nCont]).Value;
  end;
end;

procedure TdmProductos.sqlProductosAfterScroll(DataSet: TDataSet);
begin
  if sqlAltaProductos.Active then
    sqlAltaProductos.Locate('id_producto',DataSet.FieldByName('id_producto').AsInteger,[]);

  ActualizaProductosDetalle;
  if Assigned(FProductosAfterScrollEvent) then
    FProductosAfterScrollEvent(DataSet);
end;

procedure TdmProductos.sqlStockAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FStockAfterScrollEvent) then FStockAfterScrollEvent(DataSet);
end;

procedure TdmProductos.sqlAltaProductosAfterOpen(DataSet: TDataSet);
begin
  DataSet.Locate('id_producto',sqlProductos.FieldByName('id_producto').AsInteger,[]);
end;

function TdmProductos.ImagenProducto(nIdProducto: Integer;
  const sCdColor: string): TFileName;

var
 sImg: TFileName;

begin
  sImg := dmRanning.PathImages + PATH_IMG_PRODUCTOS +
    NombreImagenProducto(nIdProducto,sCdColor);
  if not FileExists(sImg) then sImg := dmRanning.PathImages + IMG_NO_DISPONIBLE;

  Result := LowerCase(sImg);
end;

function TdmProductos.MargenProducto(nIdMarca, nIdTipoProducto: Integer): Extended;
begin
  Result := 100;
  if not sqlMarcasTipoProductoMargen.Active then sqlMarcasTipoProductoMargen.Open;
  if sqlMarcasTipoProductoMargen.Locate('id_marca;id_tipo_producto',VarArrayOf([nIdMarca,nIdTipoProducto]),[]) then
    Result := sqlMarcasTipoProductoMargen.FieldByName('nm_margen').AsFloat;
end;

procedure TdmProductos.sqlProductosBeforeClose(DataSet: TDataSet);
begin
  FUltIdProducto := DataSet.FieldByName('id_producto').AsInteger;
end;

procedure TdmProductos.sqlProductosAtributosAfterScroll(DataSet: TDataSet);
begin
  ActualizaProductosDetalle;

  if Assigned(FProductosAtributosAfterScrollEvent) then
    FProductosAtributosAfterScrollEvent(DataSet);
end;

procedure TdmProductos.AnadeAtributo(nIdAtributo, nIdValor, nOrden, nIdUnidad: Integer;
  rCantidad: Extended);
begin
  dmRanning.ComandoSQL('insert into productos_detalle (id_producto,id_atributo,' +
    'id_valor,nm_orden,id_unidad,nm_cantidad) values (' +
    sqlProductos.FieldByName('id_producto').AsString +  ',' +
    IntToStr(nIdAtributo) + ',' + IntToStr(nIdValor) + ',' + IntToStr(nOrden) +
    ',' + IntToStr(nIdUnidad) + ',' + FloatToStr(rCantidad) + ')',csEjecutar);
  dmRanning.TablaModificada('productos_detalle','id',dmRanning.UltimoID,raInsert);
end;

procedure TdmProductos.AnadeAtributo(lstAtributos: TBookmarkList);

var
  nCont: Integer;

begin
  for nCont := 0 to lstAtributos.Count - 1 do begin
    sqlAtributo.Bookmark := lstAtributos[nCont];
    AnadeAtributo(sqlProductosAtributos.FieldByName('id_atributo').AsInteger,
      sqlAtributo.FieldByName('id_valor').AsInteger,0,0,0);
  end;
end;

procedure TdmProductos.BorraAtributo;
begin
  if MessageDlg('¿Estás seguro de borrar este registro?',mtWarning,[mbYes,mbNo],0) = mrYes then begin
    dmRanning.ComandoSQL('delete from productos_detalle where (id_producto = ' +
      sqlProductosDetalle.FieldByName('id_producto').AsString + ') and (id_atributo = ' +
      sqlProductosDetalle.FieldByName('id_atributo').AsString + ') and (id_valor = ' +
      sqlProductosDetalle.FieldByName('id_valor').AsString +
      ')',csEjecutar);
  dmRanning.TablaModificada('productos_detalle','id',
    sqlProductosDetalle.FieldByName('id').AsInteger,raDelete);
  end;
end;

function TdmProductos.GetNumAtributos: Integer;
begin
  if not sqlNumAtributos.Active then sqlNumAtributos.Open;

  Result := sqlNumAtributos.FieldByName('nm_atributos').AsInteger;
end;

procedure TdmProductos.sqlProductosDetalleBeforeOpen(DataSet: TDataSet);
begin
  sqlProductosDetalle.ParamByName('id_producto').AsInteger :=
    sqlProductos.FieldByName('id_producto').AsInteger;
  sqlProductosDetalle.ParamByName('id_atributo').AsInteger :=
    sqlProductosAtributos.FieldByName('id_atributo').AsInteger;
end;

procedure TdmProductos.sqlStockAfterOpen(DataSet: TDataSet);
begin
  dmRanning.CreaSQLTallas(sqlProductos,sqlTallas);
end;

procedure TdmProductos.ActualizaProductosDetalle;
begin
  if sqlProductosDetalle.Active then sqlProductosDetalle.Close;
  sqlProductosDetalle.Open;
end;

procedure TdmProductos.sqlProductosDetalleUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

function TdmProductos.ProductoConImagen(nIdProducto: Integer): Boolean;

var
  sColor: string;
  lSalir: Boolean;

begin
  if not sqlStock.Active then sqlStock.Open;
  sqlStock.First;
  sColor := '';
  lSalir := False;
  while (not sqlStock.Eof) and (not lSalir) do begin
    if sColor <> sqlStock.FieldByName('cd_color').AsString then
      lSalir := ImagenProducto(nIdProducto,
        sqlStock.FieldByName('cd_color').AsString) = dmRanning.PathImages + IMG_NO_DISPONIBLE;
    sColor := sqlStock.FieldByName('cd_color').AsString;
    sqlStock.Next;
  end;

  Result := not lSalir;
end;

function TdmProductos.NombreImagenProducto(nIdProducto: Integer;
  const sCdColor: string): TFileName;
begin
  if sqlImagenProducto.Active then sqlImagenProducto.Close;
  sqlImagenProducto.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlImagenProducto.ParamByName('cd_color').AsString := sCdColor;
  sqlImagenProducto.Open;

  Result := sqlImagenProducto.FieldByName('ds_imagen').AsString;
end;

function TdmProductos.NombreImagenProductoPequena(nIdProducto: Integer;
  const sCdColor: string): TFileName;
begin
  Result := ExtractFilePath(NombreImagenProducto(nIdProducto,sCdColor)) + 'p_' +
    ExtractFileName(NombreImagenProducto(nIdProducto,sCdColor));
end;

procedure TdmProductos.InsertaTallas(slTallas: TStrings);

var
  nCont: Integer;
  sqlTalla: TZReadOnlyQuery;
  nId: Integer;

begin
  for nCont := 0 to slTallas.Count - 1 do begin
    sqlTalla := dmRanning.ComandoSQL('select id from stock where (id_producto = ' +
      sqlProductos.FieldByName('id_producto').AsString + ') and (cd_color = ' +
      QuotedStr(sqlStock.FieldByName('cd_color').AsString) + ') and (id_talla = ' +
      slTallas[nCont] + ')',csResultado);
    if sqlTalla.RecordCount = 0 then begin
      dmRanning.ComandoSQL('insert into stock (id_producto,cd_color,id_talla,' +
        'f_entrada,nm_coste,nm_iva,nm_pvp,nm_cantidad,' +
        'nm_descuento_coste,nm_portes,nm_descuento_oferta,' +
        'cd_color_fabricante,id_temporada) values (' +
        sqlProductos.FieldByName('id_producto').AsString + ',' +
        QuotedStr(sqlStock.FieldByName('cd_color').AsString) + ',' +
        slTallas[nCont] + ',' + QuotedStr(FormatDateTime('yyyy-mm-dd',Date)) + ',' +
        sqlStock.FieldByName('nm_coste').AsString + ',' +
        sqlStock.FieldByName('nm_iva').AsString + ',' +
        sqlStock.FieldByName('nm_pvp').AsString + ',' +
        sqlStock.FieldByName('nm_cantidad').AsString + ',' +
        sqlStock.FieldByName('nm_descuento_coste').AsString + ',' +
        sqlStock.FieldByName('nm_portes').AsString + ',' +
        sqlStock.FieldByName('nm_descuento_oferta').AsString + ',' +
        QuotedStr(sqlStock.FieldByName('cd_color_fabricante').AsString) + ',' +
        sqlStock.FieldByName('id_temporada').AsString + ');',
        csEjecutar);
      dmRanning.TablaModificada('stock','id',dmRanning.UltimoID,raInsert);
    end
    else begin
      nId := sqlTalla.FieldByName('id').AsInteger;
      dmRanning.ComandoSQL('update stock set nm_cantidad = nm_cantidad + 1 where ' +
        'id = ' + sqlTalla.FieldByName('id').AsString,csEjecutar);
      dmRanning.TablaModificada('stock','id',nId,raModify);
    end;
    dmRanning.ComandoSQLFree(sqlTalla);
  end;
  ActualizaFActualizacion;
end;

procedure TdmProductos.ListaTallasColores(nIdProducto: Integer;
  slLista: TStrings);

var
  nProducto: Integer;
  sCdColorAnt: string;

begin
  if sqlDatosProducto.Active then sqlDatosProducto.Close;
  sqlDatosProducto.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlDatosProducto.Open;
  slLista.Clear;
  sqlDatosProducto.First;
  sCdColorAnt := sqlDatosProducto.FieldByName('cd_color').AsString;
  while not sqlDatosProducto.Eof do begin
    if sCdColorAnt = sqlDatosProducto.FieldByName('cd_color').AsString then begin
      nProducto := slLista.Add(
        sqlDatosProducto.FieldByName('ds_color').AsString + ' - ' +
        sqlDatosProducto.FieldByName('ds_talla').AsString + ' - ' +
        sqlDatosProducto.FieldByName('nm_pvp_final').AsString + ' €');
      slLista.Objects[nProducto] := TProductoVenta.Create(nIdProducto,
        sqlDatosProducto.FieldByName('id_talla').AsInteger,
        sqlDatosProducto.FieldByName('nm_pvp').AsFloat,
        sqlDatosProducto.FieldByName('nm_descuento').AsFloat,
        sqlDatosProducto.FieldByName('nm_iva').AsFloat,
        sqlDatosProducto.FieldByName('cd_color').AsString,Now);
    end
    else begin
      slLista.Add('-');
      nProducto := slLista.Add(
        sqlDatosProducto.FieldByName('ds_color').AsString + ' - ' +
        sqlDatosProducto.FieldByName('ds_talla').AsString + ' - ' +
        sqlDatosProducto.FieldByName('nm_pvp_final').AsString + ' €');
      slLista.Objects[nProducto] := TProductoVenta.Create(nIdProducto,
        sqlDatosProducto.FieldByName('id_talla').AsInteger,
        sqlDatosProducto.FieldByName('nm_pvp').AsFloat,
        sqlDatosProducto.FieldByName('nm_descuento').AsFloat,
        sqlDatosProducto.FieldByName('nm_iva').AsFloat,
        sqlDatosProducto.FieldByName('cd_color').AsString,Now);
    end;
    sCdColorAnt := sqlDatosProducto.FieldByName('cd_color').AsString;
    sqlDatosProducto.Next;
  end;
end;

function TdmProductos.BorraProducto(nId: Integer): Boolean;

var
  sMsg: string;
  sqlBorrar: TZReadOnlyQuery;

begin
  Result := False;
  sMsg := '¿Estás seguro de borrar el producto ' + NombreProducto(nId) + '?' +
    #13 + #10 + 'También se borrarán todos los registros correspondientes ' +
    'a este producto en las tablas de stock y detalles de producto';
  if MessageDlg(sMsg,mtWarning,[mbYes,mbNo],0) = mrYes then begin
    sqlBorrar := dmRanning.ComandoSQL('select id from stock where id_producto = ' +
      IntToStr(nId),csResultado);
    sqlBorrar.First;
    while not sqlBorrar.Eof do begin
      dmRanning.TablaModificada('stock','id',
        sqlBorrar.FieldByName('id').AsInteger,raDelete);
      sqlBorrar.Next;
    end;
    dmRanning.ComandoSQLFree(sqlBorrar);
    dmRanning.ComandoSQL('delete from stock where id_producto = ' +
      IntToStr(nId),csEjecutar);

    sqlBorrar := dmRanning.ComandoSQL('select id from productos_detalle where ' +
      'id_producto = ' + IntToStr(nId),csResultado);
    sqlBorrar.First;
    while not sqlBorrar.Eof do begin
      dmRanning.TablaModificada('productos_detalle','id',
        sqlBorrar.FieldByName('id').AsInteger,raDelete);
      sqlBorrar.Next;
    end;
    dmRanning.ComandoSQLFree(sqlBorrar);
    dmRanning.ComandoSQL('delete from productos_detalle where id_producto = ' +
      IntToStr(nId),csEjecutar);
    dmRanning.ComandoSQL('delete from productos where id_producto = ' +
      IntToStr(nId),csEjecutar);
    dmRanning.TablaModificada('productos','id_producto',nId,raDelete);
    Result := True;
  end
  else
    Abort;
end;

function TdmProductos.CopiaValorTodos(fldCampo, fldCampoMsg: TField;
  const sIdCopiar: string): Boolean;

var
  sMsg: string;
  //sqlCambio: TZReadOnlyQuery;
  slIdCopiar: TStringList;
  nCont: Integer;

begin
  Result := False;
  sMsg := '¿Estás seguro de cambiar el valor de "' + fldCampoMsg.DisplayName + '" ' +
    'a "' + fldCampoMsg.AsString + '" para todos los registros seleccionados?';
  if MessageDlg(sMsg,mtWarning,[mbYes,mbNo],0) <> mrYes then Exit;

  slIdCopiar := TStringList.Create;
  try
    slIdCopiar.CommaText := sIdCopiar;
    for nCont := 0 to slIdCopiar.Count - 1 do
      dmRanning.TablaModificada('stock','id',StrToInt(slIdCopiar[nCont]),raModify);
  finally
    slIdCopiar.Free;
  end;
  {
  sqlCambio := dmRanning.ComandoSQL('select id from stock where id in (' +
    sIdCopiar + ')',csResultado);
  sqlCambio.First;
  while not sqlCambio.Eof do begin
    dmRanning.TablaModificada('stock','id',
      sqlCambio.FieldByName('id').AsInteger,raModify);
    sqlCambio.Next;
  end;
  }
  if fldCampo.DataType in [ftString,ftDate,ftTime,ftDateTime] then
    dmRanning.ComandoSQL('update stock set ' + fldCampo.FieldName + ' = ' +
      QuotedStr(fldCampo.AsString) + ' where id in (' + sIdCopiar + ')',
      csEjecutar)
  else
    dmRanning.ComandoSQL('update stock set ' + fldCampo.FieldName + ' = ' +
      fldCampo.AsString + ' where id in (' + sIdCopiar + ')',csEjecutar);

  Result := True;
end;

function TdmProductos.NombreProducto(nId: Integer): string;

var
  sqlComando: TZReadOnlyQuery;
  sProducto: string;

begin
  sqlComando := dmRanning.ComandoSQL('select ds_producto from productos where ' +
    'id_producto = ' + IntToStr(nId),csResultado);
  sProducto := sqlComando.FieldByName('ds_producto').AsString;
  dmRanning.ComandoSQLFree(sqlComando);

  Result := sProducto;
end;
{
function TdmProductos.DatosProductoToText(nIdProducto, nIdColor,
  nIdTalla: Integer; rPrecio: Extended): string;
begin
  Result := '';
  if sqlDatosProducto.Active then sqlDatosProducto.Close;
  sqlDatosProducto.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlDatosProducto.Open;
  if not sqlDatosProducto.Locate('id_producto;id_color;id_talla',
    VarArrayOf([nIdProducto,nIdColor,nIdTalla]),[]) then Exit;

  Result := 'Código: ' + sqlDatosProducto.FieldByName('cod_producto').AsString +
    #13 + #10 + 'Producto: ' +
    sqlDatosProducto.FieldByName('ds_producto').AsString + #13 + #10 +
    'Color: ' + sqlDatosProducto.FieldByName('ds_color_completo').AsString +
    #13 + #10 + 'Talla: ' + sqlDatosProducto.FieldByName('ds_talla').AsString +
    #13 + #10 + 'Precio: ' + dmRannning.FormateaPrecio(rPrecio);
end;

function TdmProductos.DatosProductoToText(Producto: TProductoVenta): string;

var
  sProd: string;

begin
  sProd := DatosProductoToText(Producto.IdProducto,Producto.IdColor,
    Producto.IdTalla,Producto.PVP * (1 - Producto.Descuento / 100));
  if (sProd <> '') and (Producto.Fecha <> 0) then
    sProd := 'Fecha: ' + FormatDateTime('dd/mm/yyyy hh:nn',Producto.Fecha) +
      #13 + #10 + sProd;

  Result := sProd;
end;

function TdmProductos.DatosPresupuestoToText(
  Presupuesto: TProductoVentaList): string;

var
  nCont: Integer;
  sPre: string;

begin
  sPre := 'Fecha del presupuesto: ' +
    FormatDateTime('dd/mm/yyyy hh:nn',Presupuesto.LastDate) + #13 + #10 + #13 + #10;
  for nCont := 0 to Presupuesto.Count - 1 do
    sPre := sPre + DatosProductoToText(Presupuesto[nCont]) + #13 + #10 + #13 + #10;

  Result := sPre + 'Total: ' +  dmRannning.FormateaPrecio(Presupuesto.Total);
end;

procedure TdmProductos.DsColor(anIdColor: array of Integer; slDsColor: TStrings);

var
  sqlColor: TZReadOnlyQuery;
  sColores: string;
  nCont: Integer;

begin
  sColores := '(';
  for nCont := Low(anIdColor) to High(anIdColor) do
    sColores := sColores + IntToStr(anIdColor[nCont]) + ',';
  sColores := Copy(sColores,1,Length(sColores) - 1) + ')';
  sqlColor := dmRanning.ComandoSQL('select id_color,ds_color from colores ' +
    'where id_color in ' + sColores,csResultado);
  slDsColor.Clear;
  sqlColor.First;
  while not sqlColor.Eof do begin
    slDsColor.Add(sqlColor.FieldByName('id_color').AsString + '=' +
      sqlColor.FieldByName('ds_color').AsString);
    sqlColor.Next;
  end;
end;
}
function TdmProductos.DetalleProducto(nIdProducto: Integer): string;

var
  sqlDetalle: TZReadOnlyQuery;
  sDetalle: string;

begin
  sqlDetalle := dmRanning.ComandoSQL('select distinct cd_color,' +
    'concat(nm_pvp," €") ds_pvp,concat(nm_descuento," %") ds_descuento,' +
    'concat(round(nm_pvp * (1 - nm_descuento / 100),2)," €") ds_precio_final ' +
    'from stock s where id_producto = ' +
    IntToStr(nIdProducto) + ' order by cd_color',csResultado);
  sDetalle := '';
  sqlDetalle.First;
  while not sqlDetalle.Eof do begin
    sDetalle := sDetalle +
      dmRanning.DescColor(sqlDetalle.FieldByName('cd_color').AsString) + ', ' +
      sqlDetalle.FieldByName('ds_pvp').AsString + ', ' +
      sqlDetalle.FieldByName('ds_descuento').AsString + ', ' +
      sqlDetalle.FieldByName('ds_precio_final').AsString + #13 + #10;
    sqlDetalle.Next;
  end;
  dmRanning.ComandoSQLFree(sqlDetalle);

  Result := sDetalle;
end;

procedure TdmProductos.ActualizaFActualizacion;

var
  sMsg: string;

begin
  if sqlStock.IsEmpty then Exit;

  if sqlFActualizacion.Active then sqlFActualizacion.Close;
  sqlFActualizacion.Open;
  if sqlFActualizacion.FieldByName('f_actualizacion').AsDateTime >= Date then Exit;

  {
  sMsg := '¿Quieres actualizar a hoy la fecha de actualización de stock del producto?';
  if MessageDlg(sMsg,mtWarning,[mbYes,mbNo],0) = mrYes then begin
  }
    sqlActualizaFActualizacion.ExecSQL;
    dmRanning.TablaModificada('productos','id_producto',
      sqlStock.FieldByName('id_producto').AsInteger,raModify);
  {
  end;
  }
end;

procedure TdmProductos.sqlStockAfterPost(DataSet: TDataSet);
begin
  ActualizaFActualizacion;
end;

procedure TdmProductos.sqlStockAfterInsert(DataSet: TDataSet);
begin
  ActualizaFActualizacion;
end;

procedure TdmProductos.RenameImage(nIdProducto: Integer;
  const sNewCdProducto: string);

var
  sqlIdColor: TZReadOnlyQuery;
  sImgAnt: string;
  sImg: string;

begin
  sqlIdColor := dmRanning.ComandoSQL('select distinct concat(m.cd_marca,' +
    QuotedStr('\\') + ',m.cd_marca,' + QuotedStr('_') + ',p.cd_producto,' +
    QuotedStr('_') + ',s.cd_color,' + QuotedStr('.gif') + ') ds_imagen_ant, ' +
    'concat(m.cd_marca,' + QuotedStr('\\') + ',m.cd_marca,' + QuotedStr('_') +
    ',' + QuotedStr(sNewCdProducto) + ',' + QuotedStr('_') + ',s.cd_color,' +
    QuotedStr('.gif') + ') ds_imagen from marcas m, productos p, ' +
    'stock s where (s.id_producto = ' + IntToStr(nIdProducto) + ') and ' +
    '(s.id_producto = p.id_producto) and (m.id_marca = p.id_marca)',csResultado);
  sqlIdColor.First;
  while not sqlIdColor.Eof do begin
    sImgAnt := LowerCase(dmRanning.PathImages + PATH_IMG_PRODUCTOS +
      sqlIdColor.FieldByName('ds_imagen_ant').AsString);
    if FileExists(sImgAnt) then begin
      sImg := LowerCase(dmRanning.PathImages + PATH_IMG_PRODUCTOS +
        sqlIdColor.FieldByName('ds_imagen').AsString);
      if RenombraFichero(sImgAnt,sImg) then begin
        ShowMessage('El archivo [' + sImgAnt + '] se ha renombrado como' + #13 +
          #10 + '[' + sImg + ']');
        dmRanning.ImagenRenombrada(LowerCase(
          sqlIdColor.FieldByName('ds_imagen_ant').AsString),LowerCase(
          sqlIdColor.FieldByName('ds_imagen').AsString));
      end
      else
        ShowMessage('El archivo [' + sImgAnt + '] no se pudo renombrar');

      sImgAnt := LowerCase(dmRanning.PathImages + PATH_IMG_P_PRODUCTOS +
        ExtractFilePath(sqlIdColor.FieldByName('ds_imagen_ant').AsString) + 'p_' +
        ExtractFileName(sqlIdColor.FieldByName('ds_imagen_ant').AsString));
      sImg := LowerCase(dmRanning.PathImages + PATH_IMG_P_PRODUCTOS +
        ExtractFilePath(sqlIdColor.FieldByName('ds_imagen').AsString) + 'p_' +
        ExtractFileName(sqlIdColor.FieldByName('ds_imagen').AsString));
      if RenombraFichero(sImgAnt,sImg) then
        ShowMessage('El archivo [' + sImgAnt + '] se ha renombrado como' + #13 +
          #10 + '[' + sImg + ']')
      else
        ShowMessage('El archivo [' + sImgAnt + '] no se pudo renombrar');
    end;

    sqlIdColor.Next;
  end;
  dmRanning.ComandoSQLFree(sqlIdColor);
end;

procedure TdmProductos.RenameImage(nIdProducto: Integer;
  const sOldCdColor, sNewCdColor: string);

var
  sqlImg: TZReadOnlyQuery;
  sImgAnt: string;
  sImg: string;

begin
  sqlImg := dmRanning.ComandoSQL('select concat(m.cd_marca,' + QuotedStr('\\') +
    ',m.cd_marca,' + QuotedStr('_') + ',p.cd_producto,' +
    QuotedStr('_' + sOldCdColor + '.gif') + ') ds_imagen_ant, ' +
    'concat(m.cd_marca,' + QuotedStr('\\') + ',m.cd_marca,' + QuotedStr('_') +
    ',p.cd_producto,' + QuotedStr('_' + sNewCdColor + '.gif') +
    ') ds_imagen from ' + 'marcas m, productos p where (p.id_producto = ' +
    IntToStr(nIdProducto) + ') and (p.id_marca = m.id_marca)',
    csResultado);

  sImgAnt := LowerCase(dmRanning.PathImages + PATH_IMG_PRODUCTOS +
    sqlImg.FieldByName('ds_imagen_ant').AsString);
  if FileExists(sImgAnt) then begin
    sImg := LowerCase(dmRanning.PathImages + PATH_IMG_PRODUCTOS +
      sqlImg.FieldByName('ds_imagen').AsString);
    if RenombraFichero(sImgAnt,sImg) then begin
      ShowMessage('El archivo [' + sImgAnt + '] se ha renombrado como' + #13 +
        #10 + '[' + sImg + ']');
      dmRanning.ImagenRenombrada(LowerCase(
        sqlImg.FieldByName('ds_imagen_ant').AsString), LowerCase(
        sqlImg.FieldByName('ds_imagen').AsString));
    end
    else
      ShowMessage('El archivo [' + sImgAnt + '] no se pudo renombrar');

    sImgAnt := LowerCase(dmRanning.PathImages + PATH_IMG_P_PRODUCTOS +
      ExtractFilePath(sqlImg.FieldByName('ds_imagen_ant').AsString) + 'p_' +
      ExtractFileName(sqlImg.FieldByName('ds_imagen_ant').AsString));
    sImg := LowerCase(dmRanning.PathImages + PATH_IMG_P_PRODUCTOS +
      ExtractFilePath(sqlImg.FieldByName('ds_imagen').AsString) + 'p_' +
      ExtractFileName(sqlImg.FieldByName('ds_imagen').AsString));
    if RenombraFichero(sImgAnt,sImg) then
      ShowMessage('El archivo [' + sImgAnt + '] se ha renombrado como' + #13 +
        #10 + '[' + sImg + ']')
    else
      ShowMessage('El archivo [' + sImgAnt + '] no se pudo renombrar');
  end;
  dmRanning.ComandoSQLFree(sqlImg);
end;

function TdmProductos.RenombraFichero(sOldName, sNewName: TFileName): Boolean;

var
  hndImg: Integer;

begin
  Result := True;
  if RenameFile(sOldName,sNewName) then begin
    hndImg := FileOpen(sNewName,fmOpenWrite or fmShareDenyNone);
    try
      if hndImg <> -1 then FileSetDate(hndImg,DateTimeToFileDate(Now));
    finally
      if hndImg <> -1 then FileClose(hndImg);
    end;
    CambiaFechaFichero(sNewName,Now);
  end
  else
    Result := False;
end;

function TdmProductos.CambiaFechaFichero(sFichero: TFileName;
  nFecha: TDateTime): Boolean;

var
  hndFichero: Integer;

begin
  Result := True;
  hndFichero := FileOpen(sFichero,fmOpenWrite or fmShareDenyNone);
  try
    if hndFichero = -1 then begin
      Result := False;
      Exit;
    end;

    Result := FileSetDate(hndFichero,DateTimeToFileDate(nFecha)) = 0;
  finally
    if hndFichero <> -1 then FileClose(hndFichero);
  end;
end;

procedure TdmProductos.CambiaDescuentoProducto(sqlProductos: TDataSet;
  Rango: TRangoProductos; rDescuento: Extended);

var
  sAct: TBookmarkStr;

begin
  if Rango = rpActual then
    CambiaDescuentoProducto(sqlProductos.FieldByName('id_producto').AsInteger,
      rDescuento)
  else if Rango = rpTodos then begin
    sAct := sqlProductos.Bookmark;
    sqlProductos.DisableControls;
    try
      sqlProductos.First;
      while not sqlProductos.Eof do begin
        CambiaDescuentoProducto(sqlProductos.FieldByName('id_producto').AsInteger,
          rDescuento);
        sqlProductos.Next;
      end;
    finally
      sqlProductos.Bookmark := sAct;
      sqlProductos.EnableControls;
    end;
  end;
end;

procedure TdmProductos.CambiaDescuentoProducto(nIdProducto: Integer;
  rDescuento: Extended);

var
  sqlMod: TZReadOnlyQuery;

begin
  dmRanning.ComandoSQL('update stock set nm_descuento_oferta = ' +
    FloatToStr(rDescuento) + ' where id_producto = ' + IntToStr(nIdProducto),
    csEjecutar);
  sqlMod := dmRanning.ComandoSQL('select id from stock where id_producto = ' +
    IntToStr(nIdProducto),csResultado);
  sqlMod.First;
  while not sqlMod.Eof do begin
    dmRanning.TablaModificada('stock','id',sqlMod.FieldByName('id').AsInteger,
      raModify);
    sqlMod.Next;
  end;
  dmRanning.ComandoSQLFree(sqlMod);
end;

function TdmProductos.GetIdUltimaTemporada: Integer;

var
  sqlComando: TZReadOnlyQuery;
  nId: Integer;

begin
  sqlComando := dmRanning.ComandoSQL('select id_temporada from temporadas ' +
    'order by nm_orden desc limit 1',csResultado);
  nId := sqlComando.FieldByName('id_temporada').AsInteger;
  dmRanning.ComandoSQLFree(sqlComando);

  Result := nId;
end;

function TdmProductos.GetDsUltimaTemporada: string;

var
  sqlComando: TZReadOnlyQuery;
  sTemporada: string;

begin
  sqlComando := dmRanning.ComandoSQL('select ds_temporada from temporadas ' +
    'order by nm_orden desc limit 1',csResultado);
  sTemporada := sqlComando.FieldByName('ds_temporada').AsString;;
  dmRanning.ComandoSQLFree(sqlComando);

  Result := sTemporada;
end;

procedure TdmProductos.FiltraActivos(lFiltrar: Boolean);
begin
  if lFiltrar then begin
    if sqlProductos.Filter = '' then
      sqlProductos.Filter := '(it_activo = ' + QuotedStr(CAMPO_MARCADO) + ')'
    else if Pos('(it_activo = ' + QuotedStr(CAMPO_MARCADO) + ')',sqlProductos.Filter) = 0 then
      sqlProductos.Filter := sqlProductos.Filter + ' and (it_activo = ' +
        QuotedStr(CAMPO_MARCADO) + ')';
  end
  else begin
    sqlProductos.Filter :=  StringReplace(sqlProductos.Filter,
      ' and (it_activo = ' + QuotedStr(CAMPO_MARCADO) + ')','',[]);
    sqlProductos.Filter :=  StringReplace(sqlProductos.Filter,
      '(it_activo = ' + QuotedStr(CAMPO_MARCADO) + ')','',[]);
  end;

  sqlProductos.Filtered := lFiltrar or sqlProductos.Filtered;
end;

procedure TdmProductos.sqlStockCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ds_color').AsString :=
    dmRanning.DescColor(DataSet.FieldByName('cd_color').AsString);
end;

procedure TdmProductos.sqlDatosProductoCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ds_color').AsString :=
    dmRanning.DescColor(DataSet.FieldByName('cd_color').AsString);
  DataSet.FieldByName('ds_color_completo').AsString :=
    DataSet.FieldByName('cd_color').AsString + '-' +
    DataSet.FieldByName('ds_color').AsString;
end;

procedure TdmProductos.sqlUltStockCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ds_color').AsString :=
    dmRanning.DescColor(DataSet.FieldByName('cd_color').AsString);
end;

procedure TdmProductos.AltaProductoAccess(nTipoPro, nSexProd, nIdeProv,
  nUnidades: Integer; lCodColor: Boolean; const sPrefijo, sPrefColor: string;
  slEqTallas: TStrings);

var
  sIdTalla: string;
  sTalla: string;
  sColor: string;
  sColorAnt: string;
  sIdepro: string;

begin
  sqlProductosAccess.First;
  sColorAnt := '###';
  while not sqlProductosAccess.Eof do begin
    sIdTalla := sqlProductosAccess.FieldByName('id_talla').AsString;
    sTalla := sqlProductosAccess.FieldByName('ds_talla').AsString;
    if LinePosToBoolean(LinePos(sIdTalla + '=',slEqTallas,True)) then
      sTalla := slEqTallas.Values[sIdTalla];
    sColor := '';
    if lCodColor then
      sColor := sqlProductosAccess.FieldByName('cd_color_fabricante').AsString;
    sIdepro := sPrefijo +
      sqlProductosAccess.FieldByName('cd_producto').AsString + sPrefColor + sColor;
    sqlStockinInsert.Parameters.ParamByName('idepro').Value := sIdepro;
    sqlStockinInsert.Parameters.ParamByName('talla').Value := sTalla;
    if nUnidades = 0 then
      sqlStockinInsert.Parameters.ParamByName('cantidad').Value :=
        sqlProductosAccess.FieldByName('nm_cantidad').AsInteger
    else
      sqlStockinInsert.Parameters.ParamByName('cantidad').Value := nUnidades;
    sqlStockinInsert.ExecSQL;
    if (sColor <> sColorAnt) and (not ProductoAccessExiste(sIdepro)) then begin
      sqlProductosAccessInsert.Parameters.ParamByName('idepro').Value := sIdepro;
      sqlProductosAccessInsert.Parameters.ParamByName('tipopro').Value := nTipoPro;
      sqlProductosAccessInsert.Parameters.ParamByName('sex_prod').Value := nSexProd;
      sqlProductosAccessInsert.Parameters.ParamByName('ideprov').Value := nIdeProv;
      sqlProductosAccessInsert.ExecSQL;
      sqlPreciosInsert.Parameters.ParamByName('idepro').Value := sIdepro;
      sqlPreciosInsert.ExecSQL;
    end
    else if (sColor <> sColorAnt) and (not PrecioAccessOK(sIdepro)) then begin
      sqlPreciosUpdate.Parameters.ParamByName('idepro').Value := sIdepro;
      sqlPreciosUpdate.ExecSQL;
    end;
    sqlPuntosUpdate.Parameters.ParamByName('idepro').Value := sIdepro;
    sqlPuntosUpdate.ExecSQL;
    sColorAnt := sColor;
    sqlProductosAccess.Next;
    Application.ProcessMessages;
  end;
end;

procedure TdmProductos.FiltraProductosAccess(const sCdColor: string);
begin
  sqlProductosAccess.Filtered := False;
  sqlCodigosAccess.Filtered := False;
  if sCdColor <> '' then begin
    sqlProductosAccess.Filter := 'cd_color = ' + QuotedStr(sCdColor);
    sqlCodigosAccess.Filter := 'cd_color = ' + QuotedStr(sCdColor);
  end;
  sqlProductosAccess.Filtered := sCdColor <> '';
  sqlCodigosAccess.Filtered := sCdColor <> '';
end;

procedure TdmProductos.FiltraProductosAccess(const sCdColor: string;
  nIdTalla: Integer);
begin
  sqlProductosAccess.Filtered := False;
  sqlCodigosAccess.Filtered := False;
  sqlProductosAccess.Filter := '(cd_color = ' + QuotedStr(sCdColor) + ') and (' +
    'id_talla = ' + IntToStr(nIdTalla) + ')';
  sqlCodigosAccess.Filter := '(cd_color = ' + QuotedStr(sCdColor) + ') and (' +
    'id_talla = ' + IntToStr(nIdTalla) + ')';
  sqlProductosAccess.Filtered := True;
  sqlCodigosAccess.Filtered := True;
end;

function TdmProductos.ProductoAccessExiste(const sIdepro: string): Boolean;
begin
  if sqlProductoAccessExiste.Active then sqlProductoAccessExiste.Close;
  sqlProductoAccessExiste.Parameters.ParamByName('idepro').Value := sIdepro;
  sqlProductoAccessExiste.Open;

  Result := sqlProductoAccessExiste.FieldByName('nm_idepro').AsInteger > 0;
end;

function TdmProductos.PrecioAccessOK(const sIdepro: string): Boolean;
begin
  if sqlPrecioAccessOK.Active then sqlPrecioAccessOK.Close;
  sqlPrecioAccessOK.Parameters.ParamByName('idepro').Value := sIdepro;
  sqlPrecioAccessOK.Open;

  Result := sqlPrecioAccessOK.FieldByName('nm_idepro').AsInteger > 0;
end;

function TdmProductos.GetDescuentoOferta: Extended;
begin
  Result := 0;

  if not sqlOfertas.Active then sqlOfertas.Open;

  Result := sqlOfertas.FieldByName('nm_descuento_oferta').AsFloat;
end;

procedure TdmProductos.InsertaColores(nColores: Integer);

var
  nCont: Integer;

begin
  for nCont := 1 to nColores do begin
    dmRanning.ComandoSQL('insert into stock (id_producto,cd_color,id_talla,' +
      'f_entrada,nm_coste,nm_iva,nm_pvp,nm_cantidad,' +
      'nm_descuento_coste,nm_portes,nm_descuento_oferta,cd_color_fabricante,' +
      'id_temporada) values (' +
      sqlProductos.FieldByName('id_producto').AsString + ',' +
      QuotedStr(CHAR_COLOR_SIN_DEFINIR + IntToStr(nCont)) + ',' +
      sqlStock.FieldByName('id_talla').AsString + ',' +
      QuotedStr(FormatDateTime('yyyy-mm-dd',Date)) + ',' +
      sqlStock.FieldByName('nm_coste').AsString + ',' +
      sqlStock.FieldByName('nm_iva').AsString + ',' +
      sqlStock.FieldByName('nm_pvp').AsString + ',' +
      sqlStock.FieldByName('nm_cantidad').AsString + ',' +
      sqlStock.FieldByName('nm_descuento_coste').AsString + ',' +
      sqlStock.FieldByName('nm_portes').AsString + ',' +
      sqlStock.FieldByName('nm_descuento_oferta').AsString + ',' +
      IntToStr(nCont) + ',' + sqlStock.FieldByName('id_temporada').AsString + ');',
      csEjecutar);
    dmRanning.TablaModificada('stock','id',dmRanning.UltimoID,raInsert);
  end;
  ActualizaFActualizacion;
end;

procedure TdmProductos.DuplicarProducto(nIdOrigen: Integer;
  const sCodProDestino: string);

const
  TABLAS_PRODUCTO: array[0..2] of string = ('productos','productos_detalle','stock');
  CAMPOS_AUT = 'productos-id_producto;productos_detalle-id;stock-id';

var
  nCont: Integer;
  nField: Integer;
  sqlSource: TZReadOnlyQuery;
  sqlInsert: TZReadOnlyQuery;
  slFieldMap: TStringList;
  nIdProd: Integer;

begin
  sqlInsert := nil;
  slFieldMap := nil;
  sqlSource := TZReadOnlyQuery.Create(nil);
  try
    sqlSource.Connection := dmRanning.dbRanning;
    sqlInsert := TZReadOnlyQuery.Create(nil);
    sqlInsert.Connection := dmRanning.dbRanning;
    slFieldMap := TStringList.Create;
    for nCont := Low(TABLAS_PRODUCTO) to High(TABLAS_PRODUCTO) do begin
      sqlSource.SQL.Text := 'select * from ' + TABLAS_PRODUCTO[nCont] + ' where ' +
        'id_producto = ' + IntToStr(nIdOrigen);
      sqlSource.Open;
      slFieldMap.Clear;
      for nField := 0 to sqlSource.Fields.Count - 1 do
        if Pos(sqlSource.Fields[nField].FieldName,CAMPOS_AUT) = 0 then begin
          if sqlSource.Fields[nField].FieldName <> 'cd_producto' then
            slFieldMap.Add(sqlSource.Fields[nField].FieldName + '=' +
              sqlSource.Fields[nField].FieldName)
          else
            slFieldMap.Add('*' + sqlSource.Fields[nField].FieldName + '=' +
              sqlSource.Fields[nField].FieldName)
        end;
      sqlInsert.SQL.Text := StringReplace(DataSetRegCopyInsert(TABLAS_PRODUCTO[nCont],
        'id_producto = ' + IntToStr(nIdOrigen),TABLAS_PRODUCTO[nCont],slFieldMap),'*cd_producto',
        QuotedStr(sCodProDestino),[rfReplaceAll,rfIgnoreCase]);
      sqlInsert.ExecSQL;
      if TABLAS_PRODUCTO[nCont] = 'productos' then
        nIdProd := dmRanning.UltimoID;
      dmRanning.TablaModificada(TABLAS_PRODUCTO[nCont],'id_producto',nIdOrigen,raInsert);
    end;
  finally
    sqlSource.Free;
    if Assigned(sqlInsert) then sqlInsert.Free;
    if Assigned(slFieldMap) then slFieldMap.Free;
  end;
end;

procedure TdmProductos.sqlTipoComplementoBeforePost(DataSet: TDataSet);
begin
  case DataSet.State of
    dsEdit: begin
      sqlTipoComplementoUpdate.ExecSQL;
      dmRanning.TablaModificada('tipos_complemento','id_tipo_complemento',
        DataSet.FieldByName('id_tipo_complemento').AsInteger,raModify);
    end;
    dsInsert: begin
      sqlTipoComplementoInsert.ExecSQL;
      dmRanning.TablaModificada('tipos_complemento','id_tipo_complemento',
        dmRanning.UltimoID,raInsert);
    end;
  end;
end;

procedure TdmProductos.CloseAccessConnection;
begin
  if dmRanning.dbAccess.Connected then dmRanning.dbAccess.Close;
end;

procedure TdmProductos.sqlProductosDetalleBeforePost(DataSet: TDataSet);
begin
  sqlProductosDetalleUpdate.ExecSQL;

  dmRanning.TablaModificada('productos_detalle','id',
    TZQuery(DataSet).FieldByName('id').AsInteger,raModify);
end;

procedure TdmProductos.AltaPedidoDetalle(nIdPedido, nIdProducto: Integer;
  const sCdColor: string);
begin
  if not sqlPedidosMarca.Active then sqlPedidosMarca.Open;
  try
    dmRanning.ComandoSQL('insert into pedidos_detalle (id_pedido,cd_producto,' +
      'cd_color,id_talla,f_entrada,nm_coste,nm_iva,nm_pvp,nm_cantidad,' +
      'cd_color_fabricante,nm_descuento_coste,nm_portes) select ' + IntToStr(nIdPedido) +
      ' ,p.cd_producto,s.cd_color,s.id_talla,s.f_entrada,s.nm_coste,s.nm_iva,' +
      's.nm_pvp,s.nm_cantidad,s.cd_color_fabricante,s.nm_descuento_coste,' +
      's.nm_portes from stock s, productos p where (p.id_producto = ' + IntToStr(nIdProducto) +
      ') and (p.id_producto = s.id_producto) and (s.cd_color = ' + QuotedStr(sCdColor) +
      ')',csEjecutar);
  finally
    sqlPedidosMarca.Close;
  end;
end;

procedure TdmProductos.AltaPedidoDetalle(nIdPedido, nIdProducto,
  nIdTalla: Integer; const sCdColor: string);
begin
  if not sqlPedidosMarca.Active then sqlPedidosMarca.Open;
  try
    dmRanning.ComandoSQL('insert into pedidos_detalle (id_pedido,cd_producto,' +
      'cd_color,id_talla,f_entrada,nm_coste,nm_iva,nm_pvp,nm_cantidad,' +
      'cd_color_fabricante,nm_descuento_coste,nm_portes) select ' + IntToStr(nIdPedido) +
      ' ,p.cd_producto,s.cd_color,s.id_talla,s.f_entrada,s.nm_coste,s.nm_iva,' +
      's.nm_pvp,s.nm_cantidad,s.cd_color_fabricante,s.nm_descuento_coste,' +
      's.nm_portes from stock s, productos p where (p.id_producto = ' + IntToStr(nIdProducto) +
      ') and (p.id_producto = s.id_producto) and (s.cd_color = ' + QuotedStr(sCdColor) +
      ') and (s.id_talla = ' + IntToStr(nIdTalla) + ')',csEjecutar);
  finally
    sqlPedidosMarca.Close;
  end;
end;

procedure TdmProductos.CambiaPrecioProducto(sqlProductos: TDataSet;
  Rango: TRangoProductos; rPrecio: Extended);

var
  sAct: TBookmarkStr;

begin
  if Rango = rpActual then
    CambiaPrecioProducto(sqlProductos.FieldByName('id_producto').AsInteger,
      rPrecio)
  else if Rango = rpTodos then begin
    sAct := sqlProductos.Bookmark;
    sqlProductos.DisableControls;
    try
      sqlProductos.First;
      while not sqlProductos.Eof do begin
        CambiaPrecioProducto(sqlProductos.FieldByName('id_producto').AsInteger,
          rPrecio);
        sqlProductos.Next;
      end;
    finally
      sqlProductos.Bookmark := sAct;
      sqlProductos.EnableControls;
    end;
  end;
end;

procedure TdmProductos.CambiaPrecioProducto(nIdProducto: Integer;
  rPrecio: Extended);

var
  sqlMod: TZReadOnlyQuery;
  sSQL: string;

begin
  sSQL := 'update stock set nm_descuento_oferta = 100 * (1 - ' +
    FloatToStr(rPrecio) + ' / nm_pvp) where id_producto = ' + IntToStr(nIdProducto);
  dmRanning.ComandoSQL(sSQL,csEjecutar);
  sqlMod := dmRanning.ComandoSQL('select id from stock where id_producto = ' +
    IntToStr(nIdProducto),csResultado);
  sqlMod.First;
  while not sqlMod.Eof do begin
    dmRanning.TablaModificada('stock','id',sqlMod.FieldByName('id').AsInteger,raModify);
    sqlMod.Next;
  end;
  dmRanning.ComandoSQLFree(sqlMod);
end;

end.
