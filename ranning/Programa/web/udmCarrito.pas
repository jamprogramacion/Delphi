unit udmCarrito;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, ZConnection, Db,
  ZAbstractRODataset, ZDataset;

type
  TdmCarrito = class(TWebModule)
    dbRanning: TZConnection;
    htmlwCarrito: TPageProducer;
    sqlCarrito: TZReadOnlyQuery;
    dsCarrito: TDataSource;
    sqlCarritoInsert: TZReadOnlyQuery;
    sqlCarritoUpdate: TZReadOnlyQuery;
    sqlStock: TZReadOnlyQuery;
    dsStock: TDataSource;
    sqlCarritoDelete: TZReadOnlyQuery;
    sqlEstadoPedido: TZReadOnlyQuery;
    sqlOfertas: TZReadOnlyQuery;
    sqlOfertasStock: TZReadOnlyQuery;
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure dmCarritowactCarritoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlwCarritoHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure WebModuleCreate(Sender: TObject);
    procedure sqlCarritoAfterOpen(DataSet: TDataSet);
    function DescuentoProducto: Extended;
    function PrecioProducto: Extended;
    function PrecioTotalProducto: Extended;
    procedure sqlStockAfterOpen(DataSet: TDataSet);
  private
    function TablaCarrito(const sIdCliente, sVerId: string): string;
  public
    { Public declarations }
  end;

var
  dmCarrito: TdmCarrito;

implementation

uses uComun, uCommon;

{$R *.DFM}

procedure TdmCarrito.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmCarrito.dmCarritowactCarritoAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

var
  nIdProducto: Integer;
  sCdColor: string;
  nIdTalla: Integer;
  nCantidad: Integer;
  sId: string;

begin
  WriteClient(Request,Response);
  try
    nIdProducto := StrToInt(Request.QueryFields.Values['id_producto']);
  except
    nIdProducto := 0;
  end;
  if nIdProducto <> 0 then begin
    try
      nCantidad := StrToInt(Request.QueryFields.Values['cantidad']);
    except
      nCantidad := 0;
    end;
    if nCantidad <> 0 then begin
      sId := Request.CookieFields.Values['id_cw'];
      sqlCarrito.Params.ParamByName('id_cliente_web').AsString := sId;
      sqlCarrito.Open;
      sCdColor := Request.QueryFields.Values['id_color'];
      nIdTalla := StrToInt(Request.QueryFields.Values['id_talla']);
      if not sqlCarrito.Locate('id_producto;cd_color;id_talla',VarArrayOf([nIdProducto,sCdColor,nIdTalla]),[]) then begin
        sqlStock.Params.ParamByName('id_producto').AsInteger := nIdProducto;
        sqlStock.Params.ParamByName('cd_color').AsString := sCdColor;
        sqlStock.Params.ParamByName('id_talla').AsInteger := nIdTalla;
        sqlStock.Open;
        sqlCarritoInsert.Params.ParamByName('id_cliente_web').AsString := sId;
        sqlCarritoInsert.Params.ParamByName('f_fecha_compra').AsDateTime := Now;
        sqlCarritoInsert.Params.ParamByName('cantidad').AsInteger := nCantidad;
        sqlCarritoInsert.Params.ParamByName('nm_desc').AsFloat :=
          DescuentoProducto;
        sqlCarritoInsert.ExecSQL;
      end
      else begin
        sqlCarritoUpdate.Params.ParamByName('fecha_compra').AsDateTime := Now;
        sqlCarritoUpdate.Params.ParamByName('cantidad').AsInteger := nCantidad;
        sqlCarritoUpdate.ExecSQL;
      end;
    end;
  end
  else if Request.QueryFields.Values['id_reg'] <> '' then begin
    sqlCarritoDelete.Params.ParamByName('id').AsString :=
      Request.QueryFields.Values['id_reg'];
    sqlCarritoDelete.ExecSQL;
  end;

  Response.ContentType := 'text/html';
  Response.Content := htmlwCarrito.Content;
end;

procedure TdmCarrito.htmlwCarritoHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);

var
  sVerId: string;

begin
  sVerId := Request.QueryFields.Values['ver_id'];
  if LowerCase(TagString) = 'tabla_productos' then begin
    if sVerId = '' then
      ReplaceText := TablaCarrito(Request.CookieFields.Values['id_cw'],sVerId)
    else
      ReplaceText := TablaCarrito(sVerId,sVerId);
  end
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'actualiza_carrito' then begin
    if sVerId <> '' then
      ReplaceText := '<br></br>'
    else
      ReplaceText := '<p class="al_centrada">' + SALTO_LINEA +
        '<a href="javascript:actualizaCarrito();">Actualiza el carrito</a>' +
        SALTO_LINEA + '</p>';
  end;
end;

function TdmCarrito.TablaCarrito(const sIdCliente, sVerId: string): string;

var
  sAux: string;
  sEnlaceProd: string;
  sCdProducto: string;
  sDsProducto: string;
  sIdProd: string;
  sCdColor: string;
  sIdTalla: string;
  rTotal: Extended;
  sBotonEnviar: string;
  sColspan: string;
  sFechaEnvio: string;

begin
  if sqlCarrito.Active then sqlCarrito.Close;
  sqlCarrito.Params.ParamByName('id_cliente_web').AsString := sIdCliente;
  sqlCarrito.Open;
  sqlCarrito.First;
  if sVerId = '' then
    sColspan := '10'
  else begin
    sColspan := '9';
    sqlEstadoPedido.Open;
    if sqlEstadoPedido.FieldByName('f_fecha_envio').IsNull then
      sFechaEnvio := ''
    else
      sFechaEnvio :=
        FormatDateTime('dd/mm/yyyy hh:nn',
        sqlEstadoPedido.FieldByName('f_fecha_envio').AsDateTime);
  end;
  sAux := '<table class="carrito">' + SALTO_LINEA + '<tr>' + SALTO_LINEA +
    '<td colspan="' + sColspan + '"><font class="fuente_negrita fuente_roja">' +
    'Código de cliente web: ' + sIdCliente + '</font></td>' + SALTO_LINEA +
    '</tr>';
  if sVerId <> '' then
    sAux := sAux + SALTO_LINEA + '<tr>' + SALTO_LINEA + '<td colspan="' +
      sColspan + '"><font class="fuente_negrita fuente_roja">' + SALTO_LINEA +
      'Estado del pedido: ' + sqlEstadoPedido.FieldByName('ds_estado_pedido').AsString +
      SALTO_LINEA + '</font></td>' + SALTO_LINEA + '</tr>' + SALTO_LINEA +
      '<tr>' + SALTO_LINEA + '<td colspan="' + sColspan +
      '"><font class="fuente_negrita fuente_roja">' + SALTO_LINEA +
      'Enviar a: ' + SALTO_LINEA + '</font><br>' +
      UpperCaseFirstAll(sqlEstadoPedido.FieldByName('ds_nombre_completo').AsString) +
      SALTO_LINEA + '<br>' + SALTO_LINEA +
      UpperCaseFirstAll(sqlEstadoPedido.FieldByName('ds_calle').AsString) +
      SALTO_LINEA + '<br>' +
      UpperCaseFirstAll(sqlEstadoPedido.FieldByName('ds_muni').AsString) +
      SALTO_LINEA + '<br><b>Observaciones:</b> ' +
      sqlEstadoPedido.FieldByName('ds_observaciones').AsString +
      SALTO_LINEA + '</td>' + SALTO_LINEA + '</tr>' + SALTO_LINEA +
      '<tr>' + SALTO_LINEA + '<td colspan="' + sColspan +
      '"><font class="fuente_negrita fuente_roja">' + SALTO_LINEA +
      'Código del envío: ' + sqlEstadoPedido.FieldByName('ds_codigo_envio').AsString +
      SALTO_LINEA + '</font></td>' + SALTO_LINEA + '</tr>' +
      '<tr>' + SALTO_LINEA + '<td colspan="' + sColspan +
      '"><font class="fuente_negrita fuente_roja">' + SALTO_LINEA +
      'Fecha y hora del envío: ' + sFechaEnvio +
      SALTO_LINEA + '</font></td>' + SALTO_LINEA + '</tr>';
  sAux := sAux + SALTO_LINEA + '<tr>' + SALTO_LINEA +
   '<th>Marca</th><th>Código</th><th>Producto</th><th>Color</th><th>Talla</th>' +
   '<th>Desc.</th><th>Precio</th><th>Unid.</th><th>PVP Total</th>';
  if sVerId = '' then sAux := sAux + '<th>Borrar</th>';
  sAux := sAux + SALTO_LINEA + '</tr>' + SALTO_LINEA;
  rTotal := 0;
  while not sqlCarrito.Eof do begin
    sIdProd := sqlCarrito.FieldByName('id_producto').AsString;
    sCdProducto := sqlCarrito.FieldByName('cd_producto').AsString;
    sDsProducto := sqlCarrito.FieldByName('ds_producto').AsString;
    sCdColor := sqlCarrito.FieldByName('cd_color').AsString;
    sIdTalla := sqlCarrito.FieldByName('id_talla').AsString;
    sEnlaceProd := '<a type="text/html" href="javascript:imagenProductoCarrito(' +
      QuotedStr('../wwwRanning.exe/wimagen_producto?id_producto=' +
      sIdProd + '&cd_producto=' + sCdProducto + '&cd_marca=' +
      sqlCarrito.FieldByName('cd_marca').AsString + '&ds_producto=' +
      sDsProducto + '&ver_id=' + sVerId) + ',' +
      QuotedStr(sCdProducto + ' - ' + sDsProducto) + ');" title="Pincha aquí ' +
      'para ver el producto o cambiar la cantidad">';
    sAux := sAux + '<tr>' + SALTO_LINEA + '<td>' +
      sqlCarrito.FieldByName('ds_marca').AsString + '</td>' + SALTO_LINEA +
      '<td>' + sEnlaceProd +
      sqlCarrito.FieldByName('cd_producto_completo').AsString + '</a></td>' +
      SALTO_LINEA + '<td>' + sDsProducto + '</td>' + SALTO_LINEA + '<td>' +
      DescColor(dbRanning,sCdColor) + '</td>' + SALTO_LINEA + '<td>' +
      sqlCarrito.FieldByName('ds_talla').AsString + '</td>' + SALTO_LINEA +
      '<td class="precio">' + FormateaPorcentaje(sqlCarrito.FieldByName('nm_descuento').AsFloat,1) +
      '%</td>' + SALTO_LINEA + '<td class="precio">' +
      FormatEuro(PrecioProducto) + '</td>' + SALTO_LINEA + '<td class="precio">' +
      sqlCarrito.FieldByName('nm_cantidad').AsString + '</td>' + SALTO_LINEA +
      '<td class="precio">' +
      FormatEuro(PrecioTotalProducto) + '</td>' + SALTO_LINEA;
    if sVerId = '' then
      sAux := sAux + '<td><button type="button" onclick="javascript:' +
        'document.location = ' + QuotedStr('../wwwCarrito.exe/wcarrito?' +
        'id_reg=' + sqlCarrito.FieldByName('id').AsString) + ';"><font ' +
        'class="fuente_pequena">Borrar</font></button></td>' + SALTO_LINEA;
    sAux := sAux + '</tr>' + SALTO_LINEA;
    rTotal := rTotal + sqlCarrito.FieldByName('nm_precio_final_total').AsFloat;
    sqlCarrito.Next;
  end;
  sAux := sAux + '<tr><td colspan="' + sColspan + '"></td></tr>' + SALTO_LINEA +
    '<tr>' + SALTO_LINEA + '<td colspan="8"><font class="fuente_negrita">Total' +
    '</font></td>' + SALTO_LINEA + '<td class="precio"><font class="fuente_negrita">' +
    FormatEuro(rTotal) + '</font></td>' + SALTO_LINEA;
  if sVerId = '' then sAux := sAux + '<td></td>' + SALTO_LINEA;
  sAux := sAux + '</tr>' + SALTO_LINEA;
  if not sqlCarrito.IsEmpty then
    sBotonEnviar := ''
  else
    sBotonEnviar := 'disabled';
  if sVerId = '' then
    sAux := sAux + '<tr>' + SALTO_LINEA + '<td colspan="' + sColspan + '">' +
    '<p class="al_centrada">' + SALTO_LINEA + '<button type="button" ' +
    'onclick="javascript:window.opener.document.location = ' +
    QuotedStr('../../wcomo_comprar_conf.php') +
    ';window.close();" ' + sBotonEnviar + '>Enviar pedido</button></p></td>' +
    SALTO_LINEA +	'</tr>' + SALTO_LINEA;
  sAux := sAux + '</table>';

  Result := sAux;
end;

procedure TdmCarrito.WebModuleCreate(Sender: TObject);
begin
  htmlwCarrito.HTMLFile := PATH_PLANTILLAS + 'wcarrito.php';
end;

procedure TdmCarrito.sqlCarritoAfterOpen(DataSet: TDataSet);
begin
  if not sqlOfertas.Active then sqlOfertas.Open;
end;

function TdmCarrito.DescuentoProducto: Extended;

var
  rDesc: Extended;

begin
  rDesc := sqlStock.FieldByName('nm_descuento').AsFloat;

  if (not sqlOfertas.IsEmpty) and
     (sqlOfertas.FieldByName('nm_descuento').AsFloat > rDesc) then
    rDesc := sqlOfertas.FieldByName('nm_descuento').AsFloat;

  Result := rDesc;
end;

function TdmCarrito.PrecioProducto: Extended;

var
  rPrecio: Extended;

begin
  rPrecio := sqlCarrito.FieldByName('nm_precio_final').AsFloat;

  if (not sqlOfertas.IsEmpty) and
     (sqlOfertas.FieldByName('nm_precio_final').AsFloat < rPrecio) then
    rPrecio := sqlOfertas.FieldByName('nm_precio_final').AsFloat;

  Result := rPrecio;
end;

function TdmCarrito.PrecioTotalProducto: Extended;

var
  rPrecio: Extended;

begin
  rPrecio := sqlCarrito.FieldByName('nm_precio_final_total').AsFloat;

  if (not sqlOfertas.IsEmpty) and
     (sqlOfertas.FieldByName('nm_precio_final_total').AsFloat < rPrecio) then
    rPrecio := sqlOfertas.FieldByName('nm_precio_final_total').AsFloat;

  Result := rPrecio;
end;

procedure TdmCarrito.sqlStockAfterOpen(DataSet: TDataSet);
begin
  if not sqlOfertasStock.Active then sqlOfertasStock.Open;
end;

end.
