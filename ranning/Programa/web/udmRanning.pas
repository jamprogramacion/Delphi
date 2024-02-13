unit udmRanning;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, DCPcrypt2,
  DCPblockciphers, DCPtwofish, ZConnection, DBWeb, Db, ZAbstractRODataset,
  ZDataset, DSProd, uCommon;

type
  TPageFrom = (pfProductos,pfProductosOfertas,pfProductosNovedades);

type
  TdmRanning = class(TWebModule)
    DCP_twofish: TDCP_twofish;
    dbRanning: TZConnection;
    sqlProductos: TZReadOnlyQuery;
    htmlwProductos: TPageProducer;
    sqlFiltros: TZReadOnlyQuery;
    sqlTiposSexo: TZReadOnlyQuery;
    sqlColoresProducto: TZReadOnlyQuery;
    htmlImagenProducto: TPageProducer;
    sqlMarcas: TZReadOnlyQuery;
    sqlPrecioProducto: TZReadOnlyQuery;
    sqlDeportes: TZReadOnlyQuery;
    sqlProductosAtributos: TZReadOnlyQuery;
    dsProductos: TDataSource;
    sqlIdProducto: TZReadOnlyQuery;
    sqlProductosOferta: TZReadOnlyQuery;
    sqlProductoEnOferta: TZReadOnlyQuery;
    sqlTiposProducto: TZReadOnlyQuery;
    sqlTiposComplemento: TZReadOnlyQuery;
    sqlProductosid_producto: TLargeintField;
    sqlProductoscd_producto: TStringField;
    sqlProductosds_producto: TStringField;
    sqlProductosid_tipo_producto: TLargeintField;
    sqlProductosid_tipo_complemento: TLargeintField;
    sqlProductosid_tipo_deporte: TLargeintField;
    sqlProductosid_tipo_sexo: TLargeintField;
    sqlProductosid_marca: TLargeintField;
    sqlProductosit_activo: TStringField;
    sqlProductosf_entrada: TDateField;
    sqlProductosobservaciones: TMemoField;
    sqlProductoscd_barras: TStringField;
    sqlProductosds_tipo_producto: TStringField;
    sqlProductosds_tipo_complemento: TStringField;
    sqlProductosds_tipo_deporte: TStringField;
    sqlProductosds_tipo_sexo: TStringField;
    sqlProductoscd_marca: TStringField;
    sqlProductosds_marca: TStringField;
    sqlMarcasTipoComplemento: TZReadOnlyQuery;
    htmlwBusquedaAvanzada: TPageProducer;
    sqlTiposProdTiposComp: TZReadOnlyQuery;
    sqlTiposDepTiposComp: TZReadOnlyQuery;
    sqlTiposSexoTiposComp: TZReadOnlyQuery;
    sqlSexoProducto: TZReadOnlyQuery;
    htmlwProductosOfertas: TPageProducer;
    sqlProductosnm_peso: TIntegerField;
    htmlwProductosNovedades: TPageProducer;
    dsProductosOferta: TDataSource;
    sqlCarrito: TZReadOnlyQuery;
    sqlAtributos: TZReadOnlyQuery;
    sqlProductosAtributosSolo: TZReadOnlyQuery;
    dsProductosAtributosSolo: TDataSource;
    sqlProductosDetalle: TZReadOnlyQuery;
    sqlOpciones: TZReadOnlyQuery;
    sqlProductosit_novedad: TStringField;
    sqlProductosf_actualizacion: TDateField;
    sqlFechaActualizacion: TZReadOnlyQuery;
    sqlUltimosPares: TZReadOnlyQuery;
    sqlOfertas: TZReadOnlyQuery;
    sqlDescuentoMaxOferta: TZReadOnlyQuery;
    dsOfertas: TDataSource;
    sqlProductosds_caracteristicas: TStringField;
    htmlwIndexConsulta: TPageProducer;
    sqlOfertaLanzamiento: TZReadOnlyQuery;
    sqlProductosnm_mult_puntos: TFloatField;
    sqlProductosnm_descuento_max: TFloatField;
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure dmRanningwactProductosAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlwProductosHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure dmRanningwactImagenProductoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlImagenProductoHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmRanningwactConsultaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure dmRanningwactBusquedaAvanzadaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure dmRanningwactProductosOfertasAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlwProductosOfertasHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure htmlwProductosNovedadesHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmRanningwactProductosNovedadesAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure sqlProductosCalcFields(DataSet: TDataSet);
    procedure htmlwBusquedaAvanzadaHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure htmlwIndexConsultaHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmRanningwactIndexConsultaAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    FnMarcas: Integer;
    FnComplemento: Integer;
    FnSexo: Integer;
    FnDeporte: Integer;
    FnTipoProducto: Integer;
    FnDescuento: Integer;
    FlNovedades: Boolean;
    FsBuscar: string;
    FnPagina: Integer;
    FnTemporada: Integer;

    function TablaProductos(slAvanzada: TStrings): string;
    function TablaProductosOfertas(slAvanzada: TStrings): string;
    procedure CreaSQLBusqueda(slSQL: TStrings);
    function OpcionesMarcas: string;
    function OpcionesComplemento: string;
    function OpcionesSexo: string;
    function OpcionesTemporada: string;
    function OpcionesDescuentos: string;
    function ImagenProducto(DataSet: TDataSet): string; overload;
    function ImagenProducto(nIdProducto: Integer; const sCdMarca, sCdProducto,
      sCdColor: string): TFileName; overload;
    function ImagenProductoPequena(DataSet: TDataSet; lOfertas: Boolean): string; overload;
    function ImagenProductoPequena(nIdProducto: Integer; const sCdMarca,
      sCdProducto, sCdColor: string): TFileName; overload;
    procedure ColoresProducto(nIdProducto: Integer; slColores: TStrings);
    //function NumeroColoresProducto(const sCdProducto: string): Integer;
    function ImagenDetalleProducto: string;
    function TablaColoresProducto: string;
    function PrecioProducto(nIdProducto: Integer): Extended; overload;
    function PrecioProducto(nIdProducto, nIdTalla: Integer;
      const sCdColor: string): Extended; overload;
    function PrecioProductoPorKg(nIdProducto: Integer): Extended;
    function PrecioProductoOferta(nIdProducto: Integer): Extended;
    function ProductoOfertaLanzamiento(nIdProducto: Integer): Boolean;
    function PrecioProductoPorKgOferta(nIdProducto: Integer): Extended;
    function PrecioProductoEuro(nIdProducto: Integer; lOferta: Boolean): string;
    function PrecioProductoPorKgEuro(nIdProducto: Integer; lOferta: Boolean): string;
    function TablaDeportes(lOfertas: Boolean): string;
    function TablaTiposProducto(lOfertas: Boolean): string;
    function CaracteristicasProducto: string; overload;
    function CaracteristicasProducto(nIdProducto: Integer): string; overload;
    //function IdProducto(const sCdMarca, sCdProducto: string): Integer;
    //procedure ValoresAtributo(const sTabla, sCampoId, sCampoValor: string; slValores: TStrings);
    function ProductoEnOferta(nIdProducto: Integer; rDescuento: Extended): Boolean;
    function DetallesOferta(nIdProducto: Integer;
      const sClassTable: string = ''; const sClassTD: string = ''): string;
    function ProductoOferta: string;
    function TablaAtributosBusqueda: string;
    function CumpleAvanzadas(slAvanzadas: TStrings): Boolean;
    procedure IniciarVariables(nDescDefecto: Integer);
    procedure ExtraeAtributosAvanzadas(slAvanzadas, slAtr: TStrings);
    function AtributosACadenaHTML(slAtr: TStrings): string;
    function BusquedaAvanzada(slAvanzada: TStrings; Pagina: TPageFrom): string;
    function BusquedaAvanzadaActiva(slAvanzada: TStrings): string;
    function BotonActualizarConsulta(slAvanzada, slTagParams: TStrings;
      Pagina: TPageFrom): string;
    function EditorBuscar: string;
    function UrlMarcas(TagParams: TStrings): string;
    function UrlComplemento(TagParams: TStrings): string;
    function UrlSexo(TagParams: TStrings): string;
    function UrlTemporada(TagParams: TStrings): string;
    function UrlPaginas(slAvanzada: TStrings; Pagina: TPageFrom;
      nNumPaginas: Integer): string;
    function BusquedaAvanzadaFrom: string;
    function TieneInformacionAtributos(slUrl: TStrings): Boolean;
    procedure CreaBookmarksValidos(slBook: TJAMMemoryTable; slAvanzada: TStrings);
    function FechaActualizacion: string;
    function EsUltimosPares(nIdProducto: Integer): Boolean;
    function DescuentoMaxProducto(nIdProducto: Integer): Extended;
    function DescuentoProducto(nIdProducto, nIdTalla: Integer;
      const sCdColor: string): Extended;
    function FechaFinOfertaLanzamiento(nIdProducto: Integer): string;
  public
    function EncryptString(const sKey, sDecString: string): string;
  end;

var
  dmRanning: TdmRanning;

implementation

{$R *.DFM}

uses DCPsha512, uUtilidades, ComObj, uComun, uConst;

const
  HTML_PRODUCTOS = HTML_IMAGES + 'productos/';
  HTML_P_PRODUCTOS = HTML_IMAGES + 'p_productos/';
  HTML_CABECERAS = HTML_IMAGES + 'cabeceras/';
  HTML_TIPOS_PRODUCTO = HTML_IMAGES + 'tipo_producto/';
  HTML_ATRIBUTOS = HTML_ROOT + 'atributos/';
  CABECERA_HTML = '<head>' +
    '<link rel="StyleSheet" href="' + HTML_ROOT +
    '_css/estilo.css" type="text/css" media="screen" title="Estilo">' +
    '<meta http-equiv="Content-Type" content="text/html" charset="iso-8859-1">' +
		'<meta name="author" content="Ranning">' +
		'<meta name="robots" content="index,nofollow">' +
		'<meta http-equiv="expires" content="0">' +
		'<meta http-equiv="pragma" content="no-cache">';
  PIE_HTML = '<head><meta http-equiv="expires" content="0">' +
		'<meta http-equiv="pragma" content="no-cache"></head>';
  IMG_P_NO_DISPONIBLE = HTML_ROOT + '_images/p_no_disponible.gif';
  ATTR_IMG_DETALLE = 'width="250" height="250"';
  ATTR_IMG_PRODUCTO = ATTR_IMG +
    ' title="Pincha en la imagen para ver los colores y tallas disponibles"';
  ATTR_IMG_PRODUCTO_OFERTAS = ATTR_IMG_OFERTAS +
    ' title="Pincha en la imagen para ver los colores y tallas disponibles"';
  ATTR_IMG_COLOR_PRODUCTO = ATTR_IMG +
    ' title="Pincha en la imagen para ampliarla"';
  // De la tabla colores
  CD_COLOR_UNICO = '04t';
  //DS_COLOR_UNICO = 'Color único';
  //VARIOS_COLORES = 'Varios colores';
  COLORES_FILA: Integer = 6;
  ID_TIPO_DEPORTE_TODOS = 0;
  SQL_PRODUCTOS = '"select",' +
    '"p.*,",' +
    '"tp.ds_tipo_producto,",' +
    '"tc.ds_tipo_complemento,",' +
    '"td.ds_tipo_deporte,",' +
    '"ts.ds_tipo_sexo,",' +
    '"m.cd_marca,",' +
    '"m.ds_marca,",' +
    '"floor(max(s.nm_descuento_oferta)) nm_descuento_max",' +
  '"from",' +
    '"productos p,",' +
    '"tipos_producto tp,",' +
    '"tipos_complemento tc,",' +
    '"tipos_deporte td,",' +
    '"tipos_sexo ts,",' +
    '"marcas m,",' +
    '"stock s",' +
  '"where",' +
    '"(p.id_tipo_producto = tp.id_tipo_producto) and",' +
    '"(p.id_tipo_complemento = tc.id_tipo_complemento) and",' +
    '"(p.id_tipo_deporte = td.id_tipo_deporte) and",' +
    '"(p.id_tipo_sexo = ts.id_tipo_sexo) and",' +
    '"(p.it_activo = ''' + CAMPO_MARCADO + ''') and",' +
    '"(p.id_marca = m.id_marca) and",' +
    '"(p.id_producto = s.id_producto)",' +
  '"#where",' +
  '"group by",' +
    '"m.ds_marca,",' +
    '"p.ds_producto,",' +
    '"p.cd_producto",' +
  '"#limit"';
  NUM_PRODUCTOS_PAGINA = 12;
  NUM_PRODUCTOS_OFERTAS_LINEA = 4;
  NUM_LINEAS_PRODUCTOS_OFERTAS = 3;
  //De la tabla descuentos
  {
  DESCUENTO_0 = 0;
  DESCUENTO_10 = 1;
  DESCUENTO_10_5 = 2;
  DESCUENTO_15 = 17;
  DESCUENTO_20 = 27;
  DESCUENTO_25 = 38;
  }
  BUSQ_AVANZADA_FROM_PRODUCTOS =  'productos';
  BUSQ_AVANZADA_FROM_OFERTAS = 'productos_ofertas';
  BUSQ_AVANZADA_FROM_NOVEDADES = 'productos_novedades';
  ULTIMOS_PARES = 2;
  //De la tabla tipos_producto
  TIPO_PRODUCTO_CALZADO = 1;
  //De la tabla tipos_complemento
  TIPO_COMPLEMENTO_ALIMENTACION = 22;

type
  TIdProducto = class
  private
    FId: Integer;

    function GetId: Integer;
  public
    constructor Create(nId: Integer);

    property Id: Integer read GetId;
  end;


{ TWebModule1 }

function TdmRanning.EncryptString(const sKey, sDecString: string): string;
begin
  DCP_twofish.InitStr(sKey,TDCP_sha512);
  Result := DCP_twofish.EncryptString(sDecString);
  DCP_twofish.Burn;
end;

procedure TdmRanning.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmRanning.dmRanningwactProductosAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Request.ContentFields.Count <> 0 then WriteClient(Request,Response);
  IniciarVariables(0);

  Response.ContentType := 'text/html';
  Response.Content := htmlwProductos.Content;
end;

procedure TdmRanning.htmlwProductosHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);

var
  slAvanzadas: TStringList;

begin
  if (LowerCase(TagString) = 'productos') or (LowerCase(TagString) = 'busqueda_avanzada_activa') then begin
    slAvanzadas := TStringList.Create;
    try
      slAvanzadas.Text := Request.ContentFields.Text;
      slAvanzadas.Text := slAvanzadas.Text + Request.QueryFields.Text;
      if LowerCase(TagString) = 'productos' then begin
        if (Request.ContentFields.Count <> 0) or
           (Request.QueryFields.Values['consulta'] = '1') then
          ReplaceText := TablaProductos(slAvanzadas) + '<p class="fuente_pequena fuente_negrita">' +
			      'Todos los precios llevan incluído el IVA. No llevan incluídos los gastos de envío.' +
            '<br>' +
            'En la lista de productos se muestra el precio final de los mismos, y entre paréntesis el descuento que' +
            'se ha aplicado al precio original. Para saber el precio original pincha en la foto del' +
            'producto en cuestión.' + 
            '</p>'
        else
          ReplaceText := '';
      end
      else if LowerCase(TagString) = 'busqueda_avanzada_activa' then
        ReplaceText := BusquedaAvanzadaActiva(slAvanzadas);
    finally
      slAvanzadas.Free;
    end;
  end;

  if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'marcas' then
    ReplaceText := OpcionesMarcas
  else if LowerCase(TagString) = 'complemento' then
    ReplaceText := OpcionesComplemento
  else if LowerCase(TagString) = 'sexo' then
    ReplaceText := OpcionesSexo
  else if LowerCase(TagString) = 'temporada' then
    ReplaceText := OpcionesTemporada
  else if LowerCase(TagString) = 'menu_deportes' then
    ReplaceText := TablaDeportes(False)
  else if LowerCase(TagString) = 'menu_tipos_producto' then
    ReplaceText := TablaTiposProducto(False)
  else if LowerCase(TagString) = 'cbmarcas' then
    ReplaceText := UrlMarcas(TagParams)
  else if LowerCase(TagString) = 'cbcomplemento' then
    ReplaceText := UrlComplemento(TagParams)
  else if LowerCase(TagString) = 'cbsexo' then
    ReplaceText := UrlSexo(TagParams)
  else if LowerCase(TagString) = 'cbtemporada' then
    ReplaceText := UrlTemporada(TagParams)
  else if LowerCase(TagString) = 'descuento' then
    ReplaceText := OpcionesDescuentos
  else if LowerCase(TagString) = 'edbuscar' then
    ReplaceText := EditorBuscar
  else if LowerCase(TagString) = 'busqueda_avanzada' then begin
    if TieneInformacionAtributos(Request.ContentFields) then
      ReplaceText := BusquedaAvanzada(Request.ContentFields,pfProductos)
    else
      ReplaceText := BusquedaAvanzada(Request.QueryFields,pfProductos);
  end
  else if LowerCase(TagString) = 'actualizar' then begin
    if TieneInformacionAtributos(Request.ContentFields) then
      ReplaceText := BotonActualizarConsulta(Request.ContentFields,TagParams,
        pfProductos)
    else
      ReplaceText := BotonActualizarConsulta(Request.QueryFields,TagParams,
        pfProductos);
  end;
end;

function TdmRanning.TablaProductos(slAvanzada: TStrings): string;

var
  sTabla: string;
  nCont: Integer;
  sTD: string;
  lOferta: Boolean;
  sSalto: string;
  nCont2: Integer;
  sNumProductos: string;
  nIdProd: Integer;
  slBook: TJAMMemoryTable;
  nNumPaginas: Integer;
  sClaseOferta: string;

begin
  if sqlProductos.Active then sqlProductos.Close;
  sqlProductos.SQL.CommaText := SQL_PRODUCTOS;
  CreaSQLBusqueda(sqlProductos.SQL);
  sqlProductos.Open;
  sTabla := '';
  slBook := TJAMMemoryTable.Create(sqlProductos,'id_producto');
  try
    CreaBookmarksValidos(slBook,slAvanzada);
    nNumPaginas := slBook.ValidCount div NUM_PRODUCTOS_PAGINA;
    if (slBook.ValidCount mod NUM_PRODUCTOS_PAGINA) <> 0 then Inc(nNumPaginas);
    if slBook.ValidCount <> 0 then begin
      if slBook.ValidCount = 1 then
        sNumProductos := IntToStr(slBook.ValidCount) + ' producto ' +
          'encontrado '
      else
        sNumProductos := IntToStr(slBook.ValidCount) + ' productos ' +
          'encontrados ';
      if nNumPaginas > 1 then
        sNumProductos := sNumProductos + ' en ' + IntToStr(nNumPaginas) +
          ' páginas';
    end
    else
      sNumProductos := 'No se encontró ningún producto';
    if slBook.ValidCount <> 0 then begin
      slBook.FieldByName('ds_tipo_deporte').Visible :=
        FnDeporte = ID_TIPO_DEPORTE_TODOS;
      slBook.FieldByName('ds_tipo_producto').Visible := FnTipoProducto <= 0;
      slBook.FieldByName('ds_tipo_complemento').Visible := FnComplemento < 0;
      slBook.FieldByName('ds_tipo_sexo').Visible := FnSexo <= 0;
      slBook.FirstValid;
      sTabla := '<table class="productos">' + SALTO_LINEA + '<tr>' + SALTO_LINEA;
      for nCont := 0 to sqlProductos.FieldCount - 1 do
        if sqlProductos.Fields[nCont].Visible then
          sTabla := sTabla + '<th>' + sqlProductos.Fields[nCont].DisplayLabel +
            '</th>' + SALTO_LINEA;
      sTabla := sTabla + '<th>Foto</th>' + SALTO_LINEA;
      sTabla := sTabla + '<th>Precio final (descuento)</th>' + SALTO_LINEA +
        '</tr>' + SALTO_LINEA;
      if FnPagina <> 1 then slBook.MoveByValid((FnPagina - 1) * NUM_PRODUCTOS_PAGINA);
      nCont2 := 0;
      while (nCont2 < NUM_PRODUCTOS_PAGINA) and (not slBook.EofValid) do begin
        nIdProd := slBook.IdField.AsInteger;
        lOferta := ProductoEnOferta(nIdProd,10.5);
        sTabla := sTabla + '<tr>' + SALTO_LINEA;
        if not lOferta then
          sClaseOferta := ''
        else begin
          if not ProductoOfertaLanzamiento(nIdProd) then
            sClaseOferta := 'productos_rojo'
          else
            sClaseOferta := 'productos_lanzamiento';
        end;
        sTD := '<td class="' + sClaseOferta + '">';
        for nCont := 0 to sqlProductos.FieldCount - 1 do
          if sqlProductos.Fields[nCont].Visible then begin
            if sqlProductos.Fields[nCont].FieldName = 'ds_marca' then
              sTabla := sTabla + '<td class="' + sClaseOferta + ' productos_imagen">' +
                ImagenMarca(sqlMarcas,sqlProductos) + '</td>' + SALTO_LINEA
            else if sqlProductos.Fields[nCont].FieldName = 'cd_producto' then
              sTabla := sTabla + sTD + slBook.FieldByName('cd_marca').AsString +
                sqlProductos.Fields[nCont].AsString + '</td>' + SALTO_LINEA
            else if sqlProductos.Fields[nCont].FieldName = 'ds_caracteristicas' then
              sTabla := sTabla + sTD + '<p class="fuente_muy_pequena">' +
                sqlProductos.Fields[nCont].AsString +
                '</p></td>' + SALTO_LINEA
            else
              sTabla := sTabla + sTD + sqlProductos.Fields[nCont].AsString +
                '</td>' + SALTO_LINEA;
          end;
        sTD := '<td class="' + sClaseOferta + ' productos_imagen">';
        sTabla := sTabla + sTD +
          ImagenProductoPequena(sqlProductos,False) + '</td>' + SALTO_LINEA;
        sTD := '<td class="' + sClaseOferta + ' precio">';
        sTabla := sTabla + sTD +
          PrecioProductoEuro(nIdProd,lOferta) + '<br> (' +
            FormateaPorcentaje(DescuentoMaxProducto(nIdProd),1) + ' %)</td>' +
            SALTO_LINEA + '</tr>' + SALTO_LINEA;
        Inc(nCont2);
        slBook.NextValid;
      end;
      sTabla := sTabla + SALTO_LINEA + '</table>' + SALTO_LINEA;
      sTabla := sTabla + '<p class="al_centrada">' + SALTO_LINEA;
      if nNumPaginas > 1 then begin
        sSalto := UrlPaginas(slAvanzada,pfProductos,nNumPaginas);
        sTabla := '<p class="al_centrada con_borde_fino">' + SALTO_LINEA + sSalto +
          '</p>' + SALTO_LINEA + sTabla + '</p>';
      end
      else
        sTabla := '<br>' + SALTO_LINEA + sTabla;
    end;
  finally
    slBook.Free;
  end;

  sTabla := '<p class="al_izquierda fuente_pequena fuente_negrita">' +
    sNumProductos + '</p>' + SALTO_LINEA + sTabla;

  Result := sTabla;
end;

procedure TdmRanning.CreaSQLBusqueda(slSQL: TStrings);

var
  nPosWhere: Integer;
  sWhere: string;

begin
  nPosWhere := slSQL.IndexOf('#where');
  sWhere := '(s.nm_descuento_oferta >= ' + IntToStr(FnDescuento) + ') and ';
  if FnDeporte > ID_TIPO_DEPORTE_TODOS then
    sWhere := sWhere + '(p.id_tipo_deporte = ' + IntToStr(FnDeporte) + ') and ';
  if FnTipoProducto > 0 then
    sWhere := sWhere + '(p.id_tipo_producto = ' + IntToStr(FnTipoProducto) +
      ') and ';
  if FnMarcas > 0 then
    sWhere := sWhere + '(p.id_marca = ' + IntToStr(FnMarcas) + ') and ';
  if FnComplemento > -1 then
    sWhere := sWhere + '(p.id_tipo_complemento = ' + IntToStr(FnComplemento) +
      ') and ';
  if FnSexo > 0 then
    sWhere := sWhere + '(p.id_tipo_sexo = ' + IntToStr(FnSexo) + ') and ';
  if FnTemporada > -1 then
    sWhere := sWhere + '(s.id_temporada = ' + IntToStr(FnTemporada) + ') and ';
  if FlNovedades then
    sWhere := sWhere + '(p.it_novedad = ' + QuotedStr(CAMPO_MARCADO) + ') and ';
  if FsBuscar <> '' then
    sWhere := sWhere + '(upper(concat(m.ds_marca,m.cd_marca,p.cd_producto,' +
      'p.ds_producto)) like ' + QuotedStr('%' + FsBuscar + '%') + ') and ';
  if sWhere <> '' then sWhere := 'and ' + Copy(sWhere,1,Length(sWhere) - 5);
  slSQL[nPosWhere] := sWhere;
end;

function TdmRanning.OpcionesMarcas: string;

var
  sOpc: string;
  nCont: Integer;

begin
  sqlOpciones.SQL.Text := 'select distinct m.id_marca,m.ds_marca from marcas m';
  if (FnDeporte > ID_TIPO_DEPORTE_TODOS) or (FnTipoProducto > 0) or (FnSexo > 0) or
     (FnComplemento > 0) or (FnTemporada > -1) then begin
    if FnTemporada < 0 then
      sqlOpciones.SQL.Add(',productos p where (p.id_marca = m.id_marca)')
    else
      sqlOpciones.SQL.Add(',productos p, stock s, temporadas t where ' +
        '(p.id_marca = m.id_marca) and (p.id_producto = s.id_producto) and ' +
        '(s.id_temporada = t.id_temporada)');
  end;
  if FnDeporte > ID_TIPO_DEPORTE_TODOS then
    sqlOpciones.SQL.Add('and (p.id_tipo_deporte = ' + IntToStr(FnDeporte) +
      ')');
  if FnTipoProducto > 0 then
    sqlOpciones.SQL.Add('and (p.id_tipo_producto = ' +
      IntToStr(FnTipoProducto) + ')');
  if FnSexo > 0 then
    sqlOpciones.SQL.Add('and (p.id_tipo_sexo = ' + IntToStr(FnSexo) + ')');
  if FnComplemento > 0 then
    sqlOpciones.SQL.Add('and (p.id_tipo_complemento = ' +
      IntToStr(FnComplemento) + ')');
  if FnTemporada > -1 then
    sqlOpciones.SQL.Add('and (t.id_temporada = ' + IntToStr(FnTemporada) + ')');
  if LinePosToBoolean(LinePos('where',sqlOpciones.SQL,True)) then
    sqlOpciones.SQL.Add('and (it_activa = ' + QuotedStr(CAMPO_MARCADO) + ')')
  else
    sqlOpciones.SQL.Add('where it_activa = ' + QuotedStr(CAMPO_MARCADO));
  sqlOpciones.SQL.Add('order by m.ds_marca');
  sqlOpciones.Open;
  sqlOpciones.First;
  nCont := sqlOpciones.FieldByName('id_marca').AsInteger;
  if FnMarcas <= 0 then
    sOpc := '<option selected value="0">Todas las marcas</option>'
  else
    sOpc := '<option value="0">Todas las marcas</option>';
  while not sqlOpciones.Eof do begin
    if nCont = FnMarcas then
      sOpc := sOpc + '<option selected value="' + IntToStr(nCont) + '">' +
        sqlOpciones.FieldByName('ds_marca').AsString + '</option>' + SALTO_LINEA
    else
      sOpc := sOpc + '<option value="' + IntToStr(nCont) + '">' +
        sqlOpciones.FieldByName('ds_marca').AsString + '</option>' + SALTO_LINEA;
    sqlOpciones.Next;
    nCont := sqlOpciones.FieldByName('id_marca').AsInteger;
  end;

  Result := sOpc;
end;

function TdmRanning.OpcionesComplemento: string;

var
  sOpc: string;
  nCont: Integer;

begin
  sqlOpciones.SQL.Text := 'select distinct tc.* from tipos_complemento tc';
  if (FnDeporte > ID_TIPO_DEPORTE_TODOS) or (FnTipoProducto > 0) or (FnSexo > 0) or
     (FnMarcas > 0)  or (FnTemporada > -1)then begin
    if FnTemporada < 0 then
      sqlOpciones.SQL.Add(',productos p where (p.id_tipo_complemento = ' +
        'tc.id_tipo_complemento)')
    else
      sqlOpciones.SQL.Add(',productos p, stock s, temporadas t where ' +
        '(p.id_tipo_complemento = tc.id_tipo_complemento) and (p.id_producto = ' +
        's.id_producto) and (s.id_temporada = t.id_temporada)');
  end;
  if FnDeporte > ID_TIPO_DEPORTE_TODOS then
    sqlOpciones.SQL.Add('and (p.id_tipo_deporte = ' + IntToStr(FnDeporte) +
      ')');
  if FnTipoProducto > 0 then
    sqlOpciones.SQL.Add('and (p.id_tipo_producto = ' +
      IntToStr(FnTipoProducto) + ')');
  if FnSexo > 0 then
    sqlOpciones.SQL.Add('and (p.id_tipo_sexo = ' + IntToStr(FnSexo) + ')');
  if FnMarcas > 0 then
    sqlOpciones.SQL.Add('and (p.id_marca = ' + IntToStr(FnMarcas) + ')');
  if FnTemporada > -1 then
    sqlOpciones.SQL.Add('and (t.id_temporada = ' + IntToStr(FnTemporada) + ')');
  sqlOpciones.SQL.Add('order by tc.ds_tipo_complemento');
  sqlOpciones.Open;
  sqlOpciones.First;
  nCont := sqlOpciones.FieldByName('id_tipo_complemento').AsInteger;
  if FnComplemento = -1 then
    sOpc := '<option selected value="-1">Todos los productos</option>'
  else
    sOpc := '<option value="-1">Todos los productos</option>';
  while not sqlOpciones.Eof do begin
    if nCont = FnComplemento then
      sOpc := sOpc + '<option selected value="' + IntToStr(nCont) + '">' +
        sqlOpciones.FieldByName('ds_tipo_complemento').AsString + '</option>' +
        SALTO_LINEA
    else
      sOpc := sOpc + '<option value="' + IntToStr(nCont) + '">' +
        sqlOpciones.FieldByName('ds_tipo_complemento').AsString + '</option>' +
        SALTO_LINEA;
    sqlOpciones.Next;
    nCont := sqlOpciones.FieldByName('id_tipo_complemento').AsInteger;
  end;

  Result := sOpc;
end;

procedure TdmRanning.WebModuleCreate(Sender: TObject);
begin
  dbRanning.Connect;
  htmlwProductos.HTMLFile := PATH_PLANTILLAS + 'wproductos.php';
  htmlwProductosOfertas.HTMLFile := PATH_PLANTILLAS + 'wproductos_ofertas.php';
  htmlwProductosNovedades.HTMLFile := PATH_PLANTILLAS + 'wproductos_novedades.php';
  htmlImagenProducto.HTMLFile := PATH_PLANTILLAS + 'wimagen_producto.php';
  htmlwBusquedaAvanzada.HTMLFile := PATH_PLANTILLAS + 'wbusqueda_avanzada.php';
  htmlwIndexConsulta.HTMLFile := PATH_PLANTILLAS + 'windex_consulta.php';
end;

procedure TdmRanning.WebModuleDestroy(Sender: TObject);
begin
  dbRanning.Disconnect;
end;

function TdmRanning.ImagenProducto(DataSet: TDataSet): string;

var
  sImg: TFileName;
  sCdMarca: string;
  sCdProducto: string;
  sDsProducto: string;
  sIdProducto: string;

begin
  sCdMarca := DataSet.FieldByName('cd_marca').AsString;
  sCdProducto := DataSet.FieldByName('cd_producto').AsString;
  sDsProducto := DataSet.FieldByName('ds_producto').AsString;
  sIdProducto := DataSet.FieldByName('id_producto').AsString;
  sImg := ImagenProducto(StrToInt(sIdProducto),sCdMarca,sCdProducto,'');

  Result := '<a href="javascript:void(0);" type="text/html" ' +
    'onclick="javascript:imagenProducto(' +
    QuotedStr('../wwwRanning.exe/wimagen_producto?id_producto=' + sIdProducto +
    '&cd_producto=' + sCdProducto + '&cd_marca=' + sCdMarca + '&ds_producto=' +
    sDsProducto) + ',' + QuotedStr(sDsProducto) + ');">' + '<img ' +
    ATTR_IMG_PRODUCTO + ' src="' + sImg + '"></a>';
end;

function TdmRanning.ImagenProducto(nIdProducto: Integer; const sCdMarca,
  sCdProducto, sCdColor: string): TFileName;

var
  sImg: TFileName;
  slColores: TStringList;
  sColor: string;
  nCont: Integer;

begin
  if sCdColor = '' then begin
    slColores := TStringList.Create;
    try
      ColoresProducto(nIdProducto,slColores);
      if slColores.Count <> 0 then begin
        nCont := 0;
        sColor := '';
        while (nCont < slColores.Count) and (sColor = '') do begin
          sColor:= slColores.Names[nCont];
          sImg := LowerCase(sCdMarca + '\' + sCdMarca + '_' + sCdProducto +
            '_' + sColor) + '.gif';
          if not FileExists(PATH_PRODUCTOS + sImg) then sColor := '';
          Inc(nCont);
        end;
        if sColor = '' then sColor := CD_COLOR_UNICO;
      end
      else
        sColor := CD_COLOR_UNICO;
    finally
      slColores.Free;
    end;
  end
  else
    sColor := sCdColor;
  sImg := LowerCase(sCdMarca + '\' + sCdMarca + '_' + sCdProducto + '_' +
    sColor) + '.gif';
  if FileOpen(PATH_PRODUCTOS + sImg,fmOpenRead or fmShareDenyNone) <> -1 then
    sImg := HTML_PRODUCTOS + sImg
  else
    sImg := IMG_NO_DISPONIBLE;

  Result := StringReplace(sImg,'\','/',[rfReplaceAll]);
end;

function TdmRanning.ImagenProductoPequena(DataSet: TDataSet;
  lOfertas: Boolean): string;

var
  sImg: TFileName;
  sCdMarca: string;
  sCdProducto: string;
  sDsProducto: string;
  sIdProducto: string;
  sAttr: string;

begin
  sCdMarca := DataSet.FieldByName('cd_marca').AsString;
  sCdProducto := DataSet.FieldByName('cd_producto').AsString;
  sDsProducto := DataSet.FieldByName('ds_producto').AsString;
  sIdProducto := DataSet.FieldByName('id_producto').AsString;
  if not lOfertas then begin
    sImg := ImagenProductoPequena(StrToInt(sIdProducto),sCdMarca,sCdProducto,'');
    sAttr := ATTR_IMG_PRODUCTO;
  end
  else begin
    sImg := ImagenProducto(StrToInt(sIdProducto),sCdMarca,sCdProducto,'');
    sAttr := ATTR_IMG_PRODUCTO_OFERTAS;
  end;

  Result := '<a href="javascript:void(0);" type="text/html" ' +
    'onclick="javascript:imagenProducto(' +
    QuotedStr('../wwwRanning.exe/wimagen_producto?id_producto=' + sIdProducto +
    '&cd_producto=' + sCdProducto + '&cd_marca=' + sCdMarca + '&ds_producto=' +
    sDsProducto) + ',' + QuotedStr(sCdProducto + ' - ' + sDsProducto) + ');">' + '<img ' +
    sAttr + ' src="' + sImg + '"></a>';
end;

function TdmRanning.ImagenProductoPequena(nIdProducto: Integer; const sCdMarca,
  sCdProducto, sCdColor: string): TFileName;

var
  sImg: TFileName;
  slColores: TStringList;
  sColor: string;
  nCont: Integer;

begin
  if sCdColor = '' then begin
    slColores := TStringList.Create;
    try
      ColoresProducto(nIdProducto,slColores);
      if slColores.Count <> 0 then begin
        nCont := 0;
        sColor := '';
        while (nCont < slColores.Count) and (sColor = '') do begin
          sColor:= slColores.Names[nCont];
          sImg := LowerCase(sCdMarca + '\p_' + sCdMarca + '_' + sCdProducto +
            '_' + sColor) + '.gif';
          if not FileExists(PATH_P_PRODUCTOS + sImg) then sColor := '';
          Inc(nCont);
        end;
        if sColor = '' then sColor := CD_COLOR_UNICO;
      end
      else
        sColor := CD_COLOR_UNICO;
    finally
      slColores.Free;
    end;
  end
  else
    sColor := sCdColor;
  sImg := LowerCase(sCdMarca + '\p_' + sCdMarca + '_' + sCdProducto + '_' +
    sColor) + '.gif';
  if FileExists(PATH_P_PRODUCTOS + sImg) then
  //if FileOpen(PATH_P_PRODUCTOS + sImg,fmOpenRead or fmShareDenyNone) <> -1 then
    sImg := HTML_P_PRODUCTOS + sImg
  else
    sImg := IMG_P_NO_DISPONIBLE;

  Result := StringReplace(sImg,'\','/',[rfReplaceAll]);
end;

procedure TdmRanning.dmRanningwactImagenProductoAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);
  Response.ContentType := 'text/html';
  Response.Content := htmlImagenProducto.Content;
end;

function TdmRanning.OpcionesSexo: string;

var
  sOpc: string;

begin
  if not sqlTiposSexo.Active then sqlTiposSexo.Open;
  sqlTiposSexo.First;
  if FnSexo <= 0 then
    sOpc := '<option selected value="0">Todos los sexos</option>'
  else
    sOpc := '<option value="0">Todos los sexos</option>';
  while not sqlTiposSexo.Eof do begin
    if FnSexo = sqlTiposSexo.FieldByName('id_tipo_sexo').AsInteger then
      sOpc := sOpc + '<option selected value="' +
        sqlTiposSexo.FieldByName('id_tipo_sexo').AsString + '">' +
        sqlTiposSexo.FieldByName('ds_tipo_sexo').AsString + '</option>'
    else
      sOpc := sOpc + '<option value="' +
        sqlTiposSexo.FieldByName('id_tipo_sexo').AsString + '">' +
        sqlTiposSexo.FieldByName('ds_tipo_sexo').AsString + '</option>';
    sOpc := sOpc + SALTO_LINEA;
    sqlTiposSexo.Next;
  end;

  Result := sOpc;
end;

function TdmRanning.OpcionesDescuentos: string;

var
  sTodos: string;
  s15: string;
  s20: string;
  s25: string;
  sOnChange: string;

begin
  sOnChange := ' onchange="javascript:document.location = ' +
      QuotedStr('../wwwRanning.exe/wproductos?cbMarcas=') +
      ' + window.document.frmBusqueda.cbMarcas.value + ' + QuotedStr('&cbComplemento=') +
      ' + window.document.frmBusqueda.cbComplemento.value + ' + QuotedStr('&cbSexo=') +
      ' + window.document.frmBusqueda.cbSexo.value + ' +
      QuotedStr('&rbDescuento=#rbDescuento' + '&deporte=' + IntToStr(FnDeporte) +
      '&tipo_producto=' + IntToStr(FnTipoProducto) + '&edBuscar=' + FsBuscar) +
      ';">';
  sTodos := '<label><input name="rbDescuento" type=radio value="0"' +
    StringReplace(sOnChange,'#rbDescuento','0',[]) +
    'Todos</label>';
  s15 := '<label><input name="rbDescuento" type=radio value="15"' +
    StringReplace(sOnChange,'#rbDescuento','15',[]) +
    '15% o mayor</label>';
  s20 := '<label><input name="rbDescuento" type=radio value="20"' +
    StringReplace(sOnChange,'#rbDescuento','20',[]) +
    '20% o mayor</label>';
  s25 := '<label><input name="rbDescuento" type=radio value="25"' +
    StringReplace(sOnChange,'#rbDescuento','25',[]) +
    '25% o mayor</label>';

  case FnDescuento of
    0: sTodos := '<label><input name="rbDescuento" type=radio value="0" checked' +
      StringReplace(sOnChange,'#rbDescuento','0',[]) +
      'Todos</label>';
    15: s15 := '<label><input name="rbDescuento" type=radio value="15" checked' +
      StringReplace(sOnChange,'#rbDescuento','15',[]) +
      '15% o mayor</label>';
    20: s20 := '<label><input name="rbDescuento" type=radio value="20" checked' +
      StringReplace(sOnChange,'#rbDescuento','20',[]) +
      '20% o mayor</label>';
    25: s25 := '<label><input name="rbDescuento" type=radio value="25" checked' +
      StringReplace(sOnChange,'#rbDescuento','25',[]) +
      '25% o mayor</label>';
  end;

  Result := sTodos + SALTO_LINEA + s15 + SALTO_LINEA + s20 + SALTO_LINEA + s25;
end;

procedure TdmRanning.ColoresProducto(nIdProducto: Integer;
  slColores: TStrings);
begin
  slColores.Clear;
  if sqlColoresProducto.Active then sqlColoresProducto.Close;
  sqlColoresProducto.Params.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlColoresProducto.Open;
  sqlColoresProducto.First;
  while not sqlColoresProducto.Eof do begin
    slColores.Add(sqlColoresProducto.FieldByName('cd_color').AsString + '=' +
      DescColor(dbRanning,sqlColoresProducto.FieldByName('cd_color').AsString));
    sqlColoresProducto.Next;
  end;
  sqlColoresProducto.Close;
end;

{
function TdmRanning.NumeroColoresProducto(const sCdProducto: string): Integer;

var
  slColores: TStringList;
  nColores: Integer;

begin
  slColores := TStringList.Create;
  try
    ColoresProducto(sCdProducto,slColores);
    nColores := slColores.Count;
    if (nColores <> 0) and (slColores.Names[0] = CD_COLOR_UNICO) then
      nColores := 0;

    Result := nColores;
  finally
    slColores.Free;
  end;
end;
}

procedure TdmRanning.htmlImagenProductoHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);

var
  sFecha: string;

begin
  if LowerCase(TagString) = 'imagen' then
    ReplaceText := ImagenDetalleProducto
  else if LowerCase(TagString) = 'tabla_colores' then
    ReplaceText := TablaColoresProducto
  else if LowerCase(TagString) = 'caracteristicas' then
    ReplaceText := CaracteristicasProducto
  else if LowerCase(TagString) = 'oferta' then
    ReplaceText := ProductoOferta
  else if LowerCase(TagString) = 'f_actualizacion' then
    ReplaceText := FechaActualizacion
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'oferta_lanzamiento' then begin
    sFecha := FechaFinOfertaLanzamiento(StrToInt(Request.QueryFields.Values['id_producto']));
    if sFecha <> '' then
      ReplaceText := SALTO_LINEA + '<br><br><span class="fuente_oferta_lanz">' +
        SALTO_LINEA + 'Producto en oferta de lanzamiento hasta el d&iacute;a ' +
        sFecha + '</span>'
    else
      ReplaceText := '';
  end;
end;

function TdmRanning.ImagenDetalleProducto: string;

var
  sImg: string;

begin
  sImg := ImagenProducto(StrToInt(Request.QueryFields.Values['id_producto']),
    Request.QueryFields.Values['cd_marca'],
    Request.QueryFields.Values['cd_producto'],
    Request.QueryFields.Values['cd_color']);

  Result := '<img id="imgDetalle" class="con_borde_fino" src="' +
    sImg + '" ' + ATTR_IMG_DETALLE + '>' +
    SALTO_LINEA;
end;

function TdmRanning.TablaColoresProducto: string;

var
  slColores: TStringList;
  nCont: Integer;
  sTabla: string;

var
  sMsg: string;
  sImg: string;

begin
  Result := '';
  if not ProductoEnOferta(StrToInt(Request.QueryFields.Values['id_producto']),10.5) then
    sMsg := 'Producto disponible en los siguientes colores y tallas'
  else
    sMsg := 'Producto en oferta en los siguientes colores y tallas';

  slColores := TStringList.Create;
  try
    ColoresProducto(StrToInt(Request.QueryFields.Values['id_producto']),slColores);
    if slColores.Count = 0 then Exit;

    if slColores.Names[0] = CD_COLOR_UNICO then Exit;

    sTabla := '<table class="colores">' + SALTO_LINEA + '<tr>' + SALTO_LINEA;
    for nCont := 0 to slColores.Count - 1 do begin
      sImg := ImagenProducto(StrToInt(Request.QueryFields.Values['id_producto']),
        Request.QueryFields.Values['cd_marca'],
        Request.QueryFields.Values['cd_producto'],slColores.Names[nCont]);
      sTabla := sTabla + '<td class="colores_imagen">' +
        '<a href="javascript:void(0);" type="image/gif" ' +
        'onclick="javascript:cambiaImagenColor(' + QuotedStr('imgDetalle') +
        ',' + QuotedStr(sImg) + ',' + QuotedStr(slColores.Names[nCont]) +
        ');"><img ' + ATTR_IMG_COLOR_PRODUCTO + ' src="' +
        ImagenProductoPequena(StrToInt(Request.QueryFields.Values['id_producto']),
        Request.QueryFields.Values['cd_marca'],
        Request.QueryFields.Values['cd_producto'],slColores.Names[nCont]) +
        '"></a><br>' + //slColores.Names[nCont] + ' - ' +
        slColores.Values[slColores.Names[nCont]] + '</td>' + SALTO_LINEA;
      if (((nCont + 1) mod COLORES_FILA) = 0) and (nCont < (slColores.Count - 1)) then
        sTabla := sTabla + '</tr>' + SALTO_LINEA + '<tr>' + SALTO_LINEA;
    end;
    if ((slColores.Count mod COLORES_FILA) <> 0) and
       ((slColores.Count div COLORES_FILA) > 0) then begin
      nCont := slColores.Count;
      while (nCont mod COLORES_FILA) <> 0 do begin
        sTabla := sTabla + '<td></td>' + SALTO_LINEA;
        Inc(nCont);
      end;
    end;
    sTabla := sTabla + '</tr>' + SALTO_LINEA + '</table>' + SALTO_LINEA;
  finally
    slColores.Free;
  end;
  Result := '<p class="fuente_negrita">' + SALTO_LINEA + sMsg + '</p>' +
    SALTO_LINEA + sTabla;
end;

function TdmRanning.PrecioProductoOferta(nIdProducto: Integer): Extended;

var
  rPrecio: Extended;

begin
  if sqlProductosOferta.Active then sqlProductosOferta.Close;
  sqlProductosOferta.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlProductosOferta.Open;
  rPrecio := sqlProductosOferta.FieldByName('nm_precio_final').AsFloat;

  if sqlOfertas.Active then sqlOfertas.Close;
  sqlOfertas.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertas.Open;

  if (not sqlOfertas.IsEmpty) and
     (sqlOfertas.FieldByName('nm_precio_final_oferta').AsFloat < sqlOfertas.FieldByName('nm_precio_final_stock').AsFloat) then
    rPrecio := sqlOfertas.FieldByName('nm_precio_final_oferta').AsFloat;

  Result := rPrecio;
end;

function TdmRanning.PrecioProductoPorKgOferta(nIdProducto: Integer): Extended;

var
  rPrecio: Extended;
  nIdOld: Integer;

begin
  nIdOld := -1;
  if sqlProductosOferta.Active then begin
    nIdOld := sqlProductosOferta.FieldByName('id').AsInteger;
    sqlProductosOferta.Close;
  end;
  sqlProductosOferta.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlProductosOferta.Open;
  rPrecio := sqlProductosOferta.FieldByName('nm_precio_kg').AsFloat;

  if sqlOfertas.Active then sqlOfertas.Close;
  sqlOfertas.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertas.Open;

  if (not sqlOfertas.IsEmpty) and
     (sqlOfertas.FieldByName('nm_precio_kg_oferta').AsFloat < sqlOfertas.FieldByName('nm_precio_kg_stock').AsFloat) then
    rPrecio := sqlOfertas.FieldByName('nm_precio_kg_oferta').AsFloat;

  if nIdOld <> -1 then begin
    sqlProductosOferta.Open;
    sqlProductosOferta.Locate('id',nIdOld,[]);
  end;

  Result := rPrecio;
end;

function TdmRanning.PrecioProducto(nIdProducto: Integer): Extended;
begin
  Result := 0;
  if sqlPrecioProducto.Active then sqlPrecioProducto.Close;
  sqlPrecioProducto.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlPrecioProducto.Open;
  if sqlPrecioProducto.RecordCount = 0 then Exit;

  Result := sqlPrecioProducto.FieldByName('nm_precio_final').AsFloat;
end;

function TdmRanning.PrecioProductoPorKg(nIdProducto: Integer): Extended;
begin
  Result := 0;
  if sqlPrecioProducto.Active then sqlPrecioProducto.Close;
  sqlPrecioProducto.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlPrecioProducto.Open;
  if sqlPrecioProducto.RecordCount = 0 then Exit;

  Result := sqlPrecioProducto.FieldByName('nm_precio_kg').AsFloat;
end;

function TdmRanning.PrecioProductoEuro(nIdProducto: Integer;
  lOferta: Boolean): string;

var
  sPrecio: string;

begin
  if not lOferta then
    sPrecio := FormatEuro(PrecioProducto(nIdProducto))
  else
    sPrecio := FormatEuro(PrecioProductoOferta(nIdProducto));

  Result := sPrecio;
end;

function TdmRanning.PrecioProductoPorKgEuro(nIdProducto: Integer;
  lOferta: Boolean): string;

var
  sPrecio: string;

begin
  if not lOferta then
    sPrecio := FormatEuro(PrecioProductoPorKg(nIdProducto))
  else
    sPrecio := FormatEuro(PrecioProductoPorKgOferta(nIdProducto));

  Result := sPrecio;
end;

function TdmRanning.TablaDeportes(lOfertas: Boolean): string;

var
  sTabla: string;
  sPagina: string;
  sNovedades: string;
  sTd: string;

begin
  if lOfertas then
    sPagina := 'wproductos_ofertas'
  else
    sPagina := 'wproductos';
  if not sqlDeportes.Active then sqlDeportes.Open;
  sqlDeportes.First;
  sTabla := '';
  if FlNovedades then begin
    sPagina := 'wproductos_novedades';
    sNovedades := '&novedades=1';
  end
  else
    sNovedades := '';
  while not sqlDeportes.Eof do begin
    if ItFieldMarked(sqlDeportes,'it_activo') then begin
      if sqlDeportes.FieldByName('id_tipo_deporte').AsInteger <> FnDeporte then
        sTd := ''
      else
        sTd := ' class="actual"';
      sTabla := sTabla + '<td' + sTd + '>' +
        '<a class="menu_deportes" href="../wwwRanning.exe/' + sPagina + '?deporte=' +
        sqlDeportes.FieldByName('id_tipo_deporte').AsString + sNovedades + '">' +
        SALTO_LINEA + sqlDeportes.FieldByName('ds_tipo_deporte').AsString +
        '</a></td>' + SALTO_LINEA;
    end;
    sqlDeportes.Next;
  end;

  Result := sTabla;
end;

function TdmRanning.TablaTiposProducto(lOfertas: Boolean): string;

var
  sTabla: string;
  sPagina: string;
  sNovedades: string;
  sTd: string;

begin
  if lOfertas then
    sPagina := 'wproductos_ofertas'
  else
    sPagina := 'wproductos';

  if not sqlTiposProducto.Active then sqlTiposProducto.Open;
  sqlTiposProducto.First;
  sTabla := '';
  if FlNovedades then begin
    sPagina := 'wproductos_novedades';
    sNovedades := '&novedades=1';
  end
  else
    sNovedades := '';
  while not sqlTiposProducto.Eof do begin
    if ItFieldMarked(sqlTiposProducto,'it_activo') then begin
      if sqlTiposProducto.FieldByName('id_tipo_producto').AsInteger <> FnTipoProducto then
        sTd := ''
      else
        sTd := ' class="actual"';
      sTabla := sTabla + '<td' + sTd + '>' +
        '<a class="menu_tipos_producto" href="../wwwRanning.exe/' + sPagina +
        '?deporte=' + IntToStr(FnDeporte) + sNovedades + '&tipo_producto=' +
        sqlTiposProducto.FieldByName('id_tipo_producto').AsString + '">' +
        SALTO_LINEA + sqlTiposProducto.FieldByName('ds_tipo_producto').AsString +
        '</a></td>' + SALTO_LINEA;
    end;
    sqlTiposProducto.Next;
  end;

  Result := sTabla;
end;

function TdmRanning.CaracteristicasProducto: string;

var
  sAux: string;
  sAtr: string;
  sAtrAnt: string;
  sPagAtrib: string;
  lAtrNull: Boolean;

begin
  if sqlProductosAtributos.Active then sqlProductosAtributos.Close;
  sqlProductosAtributos.ParamByName('id_producto').AsString :=
    Request.QueryFields.Values['id_producto'];
  sqlProductosAtributos.Open;
  sqlProductosAtributos.First;
  sAux := '';
  sAtrAnt := '';
  while not sqlProductosAtributos.Eof do begin
    sAtr := sqlProductosAtributos.FieldByName('ds_atributo').AsString;
    lAtrNull := sqlProductosAtributos.FieldByName('ds_atributo').IsNull;
    if sAtr = sAtrAnt then sAtr := '';

    if not sqlProductosAtributos.FieldByName('ds_web').IsNull then
      sPagAtrib := '<a href="' +
        sqlProductosAtributos.FieldByName('ds_web').AsString + '" target="_blank">'
    else
      sPagAtrib := '';

    if sAtr <> '' then begin
      if sAux <> '' then sAux := sAux + SALTO_LINEA + '<br>' + SALTO_LINEA;
      sAux := sAux + '<p class="fuente_negrita">' + sAtr + ': </p>' +
        sPagAtrib + sqlProductosAtributos.FieldByName('ds_valor').AsString;
    end
    else if not lAtrNull then
      sAux := sAux + ', ' +
        sPagAtrib + sqlProductosAtributos.FieldByName('ds_valor').AsString;
    if not sqlProductosAtributos.FieldByName('ds_web').IsNull then
      sAux := sAux + '</a>';
    sAtrAnt := sqlProductosAtributos.FieldByName('ds_atributo').AsString;
    sqlProductosAtributos.Next;
  end;

  if sqlProductosAtributos.FieldByName('nm_peso').AsInteger <> 0 then 
    sAux := sAux + '<p class="fuente_negrita">Peso :</p>' +
      sqlProductosAtributos.FieldByName('nm_peso').AsString + ' gramos' +
      SALTO_LINEA + '<br>';
  if Trim(sqlProductosAtributos.FieldByName('observaciones').AsString) <> '' then
    sAux := sAux + '<p class="fuente_negrita">Observaciones: </p>' + SALTO_LINEA +
      MemoATextoWeb(TMemoField(sqlProductosAtributos.FieldByName('observaciones'))) +
      '<br>' + SALTO_LINEA;

  if sqlSexoProducto.Active then sqlSexoProducto.Close;
  sqlSexoProducto.ParamByName('id_producto').AsString :=
    Request.QueryFields.Values['id_producto'];
  sqlSexoProducto.Open;
  Result := '<p class="fuente_negrita">' +
    Request.QueryFields.Values['cd_producto'] + ' - ' +
    Request.QueryFields.Values['ds_producto'] + ' (' +
    sqlSexoProducto.FieldByName('ds_tipo_sexo').AsString + ')</p>' + sAux;
end;

{
function TdmRanning.IdProducto(const sCdMarca, sCdProducto: string): Integer;
begin
  Result := -1;
  if sqlIdProducto.Active then sqlIdProducto.Close;
  sqlIdProducto.ParamByName('cd_marca').AsString := sCdMarca;
  sqlIdProducto.ParamByName('cd_producto').AsString := sCdProducto;
  sqlIdProducto.Open;
  if sqlIdProducto.IsEmpty then Exit;

  Result := sqlIdProducto.FieldByName('id_producto').AsInteger;
end;


procedure TdmRanning.ValoresAtributo(const sTabla, sCampoId,
  sCampoValor: string; slValores: TStrings);
begin
  slValores.Clear;
  if sqlValoresAtributo.Active then sqlValoresAtributo.Close;
  sqlValoresAtributo.SQL.Text := 'select * from ' + sTabla;
  sqlValoresAtributo.Open;
  sqlValoresAtributo.First;
  while not sqlValoresAtributo.Eof do begin
    slValores.Add(sqlValoresAtributo.FieldByName(sCampoId).AsString + '=' +
      sqlValoresAtributo.FieldByName(sCampoValor).AsString);
    sqlValoresAtributo.Next;
  end;
end;
}

function TdmRanning.ProductoEnOferta(nIdProducto: Integer; rDescuento: Extended): Boolean;
begin
  if sqlProductoEnOferta.Active then sqlProductoEnOferta.Close;
  sqlProductoEnOferta.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlProductoEnOferta.ParamByName('nm_descuento_oferta').AsFloat := rDescuento;
  sqlProductoEnOferta.Open;

  if sqlOfertas.Active then sqlOfertas.Close;
  sqlOfertas.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertas.Open;
  
  Result := (not sqlProductoEnOferta.IsEmpty) or (not sqlOfertas.IsEmpty);
end;

function TdmRanning.DetallesOferta(nIdProducto: Integer; const sClassTable,
  sClassTD: string): string;

const
  asCampos: array[1..7] of string = ('ds_temporada','cd_color','cd_color_fabricante',
    'ds_talla','nm_pvp','nm_descuento','nm_precio_final');

var
  sAux: string;
  nCont: Integer;
  sCdColor: string;
  sIdTalla: string;
  sCantidad: string;
  sVerId: string;
  sDisabled: string;
  lEsAlim: Boolean;

begin
  if sqlProductosOferta.Active then sqlProductosOferta.Close;
  sqlProductosOferta.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlProductosOferta.Open;
  sqlProductosOferta.First;
  if sqlOfertas.Active then sqlOfertas.Close;
  sqlOfertas.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertas.Open;
  sVerId := Request.QueryFields.Values['ver_id'];
  if sVerId = '' then
    sqlCarrito.Params.ParamByName('id_cliente_web').AsString :=
      Request.CookieFields.Values['id_cw']
  else
    sqlCarrito.Params.ParamByName('id_cliente_web').AsString := sVerId;
  sqlCarrito.Open;
  if sClassTable = '' then
    sAux := '<table>' + SALTO_LINEA
  else
    sAux := '<table class="' + sClassTable + '">' + SALTO_LINEA;
  sAux := sAux + '<tr>' + SALTO_LINEA + '<th>Temporada</th><th>Color</th><th>' +
    'Color marca</th><th>' + sqlProductosOferta.FieldByName('ds_tipo_talla').AsString +
    '</th><th>Precio</th><th>Desc.</th><th>Precio final</th>';
  lEsAlim := (sqlProductosOferta.FieldByName('id_tipo_complemento').AsInteger = TIPO_COMPLEMENTO_ALIMENTACION) and
    (sqlProductosOferta.FieldByName('nm_precio_kg').AsInteger <> 0);
  if lEsAlim then sAux := sAux + '<th>Precio por Kg</th>';
  sAux := sAux + '<th>Añade al carro</th><th>Cantidad</th>' + SALTO_LINEA +
    '</tr>' + SALTO_LINEA;

  while not sqlProductosOferta.Eof do begin
    sAux := sAux + '<tr>' + SALTO_LINEA;
    sCdColor := sqlProductosOferta.FieldByName('cd_color').AsString;
    sIdTalla := sqlProductosOferta.FieldByName('id_talla').AsString;
    for nCont := Low(asCampos) to High(asCampos) do begin
      if Pos(asCampos[nCont],'nm_pvp,nm_descuento,nm_precio_final') <> 0 then begin
        if sClassTD = '' then
          sAux := sAux + '<td class="precio">'
        else
          sAux := sAux + '<td class="precio ' + sClassTD + '">';
        if asCampos[nCont] = 'nm_pvp' then
          sAux := sAux + FormatEuro(sqlProductosOferta.FieldByName(asCampos[nCont])) +
            '</td>' + SALTO_LINEA
        else if asCampos[nCont] = 'nm_precio_final' then
          sAux := sAux + FormatEuro(PrecioProducto(nIdProducto,StrToInt(sIdTalla),
            sCdColor)) + '</td>' + SALTO_LINEA
        else if asCampos[nCont] = 'nm_descuento' then
          sAux := sAux + FormateaPorcentaje(DescuentoProducto(nIdProducto,
            StrToInt(sIdTalla),sCdColor),1) + '%</td>' + SALTO_LINEA
        else begin
          if sClassTD = '' then
            sAux := sAux + '<td>'
          else
            sAux := sAux + '<td class="' + sClassTD + '">';
          sAux := sAux + sqlProductosOferta.FieldByName(asCampos[nCont]).AsString +
            '</td>' + SALTO_LINEA;
        end;
      end
      else if asCampos[nCont] = 'ds_talla' then begin
        if sClassTD = '' then
          sAux := sAux + '<td class="precio">'
        else
          sAux := sAux + '<td class="precio ' + sClassTD + '">';
        sAux := sAux + sqlProductosOferta.FieldByName(asCampos[nCont]).AsString +
          '</td>' + SALTO_LINEA;
      end
      else if asCampos[nCont] = 'cd_color' then begin
        if sClassTD = '' then
          sAux := sAux + '<td class="precio">'
        else
          sAux := sAux + '<td class="precio ' + sClassTD + '">';
        sAux := sAux + DescColor(dbRanning,
          sqlProductosOferta.FieldByName(asCampos[nCont]).AsString) + '</td>' +
          SALTO_LINEA;
      end
      else begin
        if sClassTD = '' then
          sAux := sAux + '<td>'
        else
          sAux := sAux + '<td class="' + sClassTD + '">';
        sAux := sAux + sqlProductosOferta.FieldByName(asCampos[nCont]).AsString +
          '</td>' + SALTO_LINEA;
      end;
    end;
    if lEsAlim then begin
      if sClassTD = '' then
        sAux := sAux + '<td class="precio">'
      else
        sAux := sAux + '<td class="precio ' + sClassTD + '">';
      sAux := sAux + FormatEuro(PrecioProductoPorKgOferta(nIdProducto)) +
        '</td>' + SALTO_LINEA;
    end;

    if sClassTD = '' then
      sAux := sAux + '<td>'
    else
      sAux := sAux + '<td class="' + sClassTD + '">';
    if sVerId = '' then
      sAux := sAux + '<p class="al_centrada"><a type="text/html" href="javascript:' +
        'if (window.document.frmCarrito.edCantidad_' + sCdColor + '_' + sIdTalla +
        '.value > 0) { document.location = ' + QuotedStr('../wwwCarrito.exe/wcarrito?' +
        'id_producto=' + sqlProductosOferta.FieldByName('id_producto').AsString +
        '&id_color=' + sCdColor + '&id_talla=' + sIdTalla + '&cantidad=') +
        ' + window.document.frmCarrito.edCantidad_' + sCdColor + '_' + sIdTalla +
        '.value } else { alert(' + QuotedStr('La cantidad debe ser más de cero') +
        ') } ;"><img src="../../_images/add_carrito.gif" height="20" ' +
        'width="35" title="Pincha aquí para añadir al carrito"></a></p></td>' +
        SALTO_LINEA
    else
      sAux := sAux + '<p class="al_centrada"><a type="text/html" href="javascript:' +
        'document.location = ' + QuotedStr('../wwwCarrito.exe/wcarrito?' +
        'ver_id=' + Request.QueryFields.Values['ver_id']) +
        ';"><img src="../../_images/add_carrito.gif" height="20" ' +
        'width="35" title="Pincha aquí para volver al carrito"></a></p></td>' +
        SALTO_LINEA;
    if sClassTD = '' then
      sAux := sAux + '<td>'
    else
      sAux := sAux + '<td class="' + sClassTD + '">';
    if sqlCarrito.IsEmpty then
      sCantidad := '0'
    else
      sCantidad := sqlCarrito.FieldByName('nm_cantidad').AsString;
    if sVerId = '' then
      sDisabled := ''
    else
      sDisabled := ' disabled';
    sAux := sAux + '<p class="al_centrada"><input type="text" name="edCantidad_' +
      sqlProductosOferta.FieldByName('cd_color').AsString + '_' +
      sqlProductosOferta.FieldByName('id_talla').AsString + '" size="3" ' +
      'maxlength="3" value="' + sCantidad + '"' + sDisabled + '></p></td>' +
      SALTO_LINEA;
    sAux := sAux + '</tr>' + SALTO_LINEA;
    sqlProductosOferta.Next;
  end;
  sAux := sAux + '</table>' + SALTO_LINEA;

  Result := sAux;
end;

procedure TdmRanning.dmRanningwactConsultaAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);
  IniciarVariables(0);

  Response.ContentType := 'text/html';
  if Request.QueryFields.Values['ofertas'] = '1' then
    Response.Content := htmlwProductosOfertas.Content
  else if Request.QueryFields.Values['novedades'] = '1' then
    Response.Content := htmlwProductosNovedades.Content
  else
    Response.Content := htmlwProductos.Content;
end;

function TdmRanning.ProductoOferta: string;
begin
  Result := DetallesOferta(StrToInt(Request.QueryFields.Values['id_producto']),
    'ofertas');
end;

procedure TdmRanning.dmRanningwactBusquedaAvanzadaAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);
  IniciarVariables(0);

  Response.ContentType := 'text/html';
  if Request.MethodType <> mtPost then
    Response.Content := htmlwBusquedaAvanzada.Content
  else if Request.ContentFields.Values['from'] = BUSQ_AVANZADA_FROM_PRODUCTOS then
    Response.Content := htmlwProductos.Content
  else if Request.ContentFields.Values['from'] = BUSQ_AVANZADA_FROM_OFERTAS then
    Response.Content := htmlwProductosOfertas.Content
  else if Request.ContentFields.Values['from'] = BUSQ_AVANZADA_FROM_NOVEDADES then
    Response.Content := htmlwProductosNovedades.Content;
end;

function TdmRanning.CaracteristicasProducto(nIdProducto: Integer): string;

var
  sAux: string;
  sAtr: string;
  sAtrAnt: string;
  sPagAtrib: string;
  lAtrNull: Boolean;

begin
  if sqlProductosAtributos.Active then sqlProductosAtributos.Close;
  sqlProductosAtributos.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlProductosAtributos.Open;
  sqlProductosAtributos.First;
  sAux := '';
  sAtrAnt := '';
  while not sqlProductosAtributos.Eof do begin
    sAtr := sqlProductosAtributos.FieldByName('ds_atributo').AsString;
    lAtrNull := sqlProductosAtributos.FieldByName('ds_atributo').IsNull;
    if sAtr = sAtrAnt then sAtr := '';

    if not sqlProductosAtributos.FieldByName('ds_web').IsNull then
      sPagAtrib := '<a href="' +
        sqlProductosAtributos.FieldByName('ds_web').AsString + '" target="_blank">'
    else
      sPagAtrib := '';

    if sAtr <> '' then begin
      if sAux <> '' then
        sAux := sAux + SALTO_LINEA + '<br>' + SALTO_LINEA + '- '
      else
        sAux := '- ';
      sAux := sAux + sPagAtrib +
        sqlProductosAtributos.FieldByName('ds_valor').AsString;
    end
    else if not lAtrNull then
      sAux := sAux + ', ' + sPagAtrib +
        sqlProductosAtributos.FieldByName('ds_valor').AsString;
    if not sqlProductosAtributos.FieldByName('ds_web').IsNull then
      sAux := sAux + '</a>';
    sAtrAnt := sqlProductosAtributos.FieldByName('ds_atributo').AsString;
    sqlProductosAtributos.Next;
  end;

  Result := sAux;
end;

procedure TdmRanning.dmRanningwactProductosOfertasAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Request.ContentFields.Count <> 0 then WriteClient(Request,Response);
  IniciarVariables(25);

  Response.ContentType := 'text/html';
  Response.Content := htmlwProductosOfertas.Content;
end;

procedure TdmRanning.htmlwProductosOfertasHTMLTag(Sender: TObject;
  Tag: TTag; const TagString: String; TagParams: TStrings;
  var ReplaceText: String);

var
  slAvanzadas: TStrings;

begin
  if TieneInformacionAtributos(Request.ContentFields) then
    slAvanzadas := Request.ContentFields
  else
    slAvanzadas := Request.QueryFields;
  if LowerCase(TagString) = 'productos' then begin
    if (Request.ContentFields.Count <> 0) or
       (Request.QueryFields.Values['consulta'] = '1') then

      ReplaceText := TablaProductosOfertas(slAvanzadas)
    else
      ReplaceText := '';
  end
  else if LowerCase(TagString) = 'menu_deportes' then
    ReplaceText := TablaDeportes(True)
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'menu_tipos_producto' then
    ReplaceText := TablaTiposProducto(True)
  else if LowerCase(TagString) = 'edbuscar' then
    ReplaceText := EditorBuscar
  else if LowerCase(TagString) = 'busqueda_avanzada' then begin
    if TieneInformacionAtributos(Request.ContentFields) then
      ReplaceText := BusquedaAvanzada(Request.ContentFields,pfProductosOfertas)
    else
      ReplaceText := BusquedaAvanzada(Request.QueryFields,pfProductosOfertas);
  end
  else if LowerCase(TagString) = 'busqueda_avanzada_activa' then
    ReplaceText := BusquedaAvanzadaActiva(slAvanzadas)
  else if LowerCase(TagString) = 'actualizar' then begin
    if TieneInformacionAtributos(Request.ContentFields) then
      ReplaceText := BotonActualizarConsulta(Request.ContentFields,TagParams,
        pfProductosOfertas)
    else
      ReplaceText := BotonActualizarConsulta(Request.QueryFields,TagParams,
        pfProductosOfertas);
  end;
end;

function TdmRanning.TablaProductosOfertas(slAvanzada: TStrings): string;

var
  sTabla: string;
  sSalto: string;
  nCont: Integer;
  sNumProductos: string;
  nCont2: Integer;
  nNumProdPag: Integer;
  slBook: TJAMMemoryTable;
  nNumPaginas: Integer;

begin
  if sqlProductos.Active then sqlProductos.Close;
  sqlProductos.SQL.CommaText := SQL_PRODUCTOS;
  CreaSQLBusqueda(sqlProductos.SQL);
  sqlProductos.Open;
  sTabla := '';
  slBook := TJAMMemoryTable.Create(sqlProductos,'id_producto');
  try
    CreaBookmarksValidos(slBook,slAvanzada);
    nNumPaginas := slBook.ValidCount div NUM_PRODUCTOS_PAGINA;
    if (slBook.ValidCount mod NUM_PRODUCTOS_PAGINA) <> 0 then Inc(nNumPaginas);
    if slBook.ValidCount <> 0 then begin
      if slBook.ValidCount = 1 then
        sNumProductos := IntToStr(slBook.ValidCount) + ' producto ' +
          'encontrado '
      else
        sNumProductos := IntToStr(slBook.ValidCount) + ' productos ' +
          'encontrados ';
      if nNumPaginas > 1 then
        sNumProductos := sNumProductos + ' en ' + IntToStr(nNumPaginas) +
          ' páginas';
    end
    else
      sNumProductos := 'No se encontró ningún producto';
    if slBook.ValidCount <> 0 then begin
      slBook.FieldByName('ds_tipo_deporte').Visible :=
        FnDeporte = ID_TIPO_DEPORTE_TODOS;
      slBook.FieldByName('ds_tipo_producto').Visible := FnTipoProducto <= 0;
      slBook.FieldByName('ds_tipo_complemento').Visible := FnComplemento < 0;
      slBook.FieldByName('ds_tipo_sexo').Visible := FnSexo <= 0;
      slBook.FirstValid;
      sTabla := '<table class="productos_ofertas">' + SALTO_LINEA + '<tr>' + SALTO_LINEA;
      nNumProdPag := NUM_PRODUCTOS_OFERTAS_LINEA * NUM_LINEAS_PRODUCTOS_OFERTAS;
      if FnPagina <> 1 then slBook.MoveByValid((FnPagina - 1) * nNumProdPag);
      nCont := 0;
      nCont2 := 0;
      while (nCont2 < nNumProdPag) and (not slBook.EofValid) do begin
        slBook.SyncDataSet;
        sTabla := sTabla + '<td>' + ImagenProductoPequena(sqlProductos,True) +
        SALTO_LINEA + '<p class="fuente_pequena al_centrada con_borde_fino">' +
        slBook.FieldByName('ds_producto').AsString;
        if slBook.FieldByName('id_tipo_producto').AsInteger = TIPO_PRODUCTO_CALZADO then begin
          if EsUltimosPares(slBook.IdField.AsInteger) then
            sTabla := sTabla + SALTO_LINEA + '<br><font class="fuente_roja">' +
              '¡¡ ÚLTIMOS PARES !!</font>' + SALTO_LINEA;
        end;
        sTabla := sTabla + '</p>' + SALTO_LINEA + '</td>' + SALTO_LINEA;
        Inc(nCont);
        nCont2 := nCont;
        if ((nCont mod NUM_PRODUCTOS_OFERTAS_LINEA) = 0) then
          sTabla := sTabla + '</tr>' + SALTO_LINEA + '<tr>' + SALTO_LINEA;
        slBook.NextValid;
      end;
      if ((nCont2 mod NUM_PRODUCTOS_OFERTAS_LINEA) <> 0) then
        for nCont := 1 to (nCont2 div NUM_PRODUCTOS_OFERTAS_LINEA + 1) * NUM_PRODUCTOS_OFERTAS_LINEA - nCont2 do
          sTabla := sTabla + '<td><img class="rana_inquieta" src="' + HTML_IMAGES +
            'rana.gif" width="150" height="150"></td>' + SALTO_LINEA;
      sTabla := sTabla + SALTO_LINEA + '</tr>' + SALTO_LINEA + '</table>' +
        SALTO_LINEA;

      sTabla := sTabla + '<p class="al_centrada">' + SALTO_LINEA;
      if nNumPaginas > 1 then begin
        if FlNovedades then
          sSalto := UrlPaginas(slAvanzada,pfProductosNovedades,nNumPaginas)
        else
          sSalto := UrlPaginas(slAvanzada,pfProductosOfertas,nNumPaginas);

        sTabla := '<p class="al_centrada con_borde_fino">' + SALTO_LINEA + sSalto +
          '</p>' + SALTO_LINEA + sTabla + '</p>';
      end
      else
        sTabla := '<br>' + SALTO_LINEA + sTabla;
    end;
  finally
    slBook.Free;
  end;

  sTabla := '<p class="al_izquierda fuente_pequena fuente_negrita">' +
    sNumProductos + '</p>' + SALTO_LINEA + sTabla;

  Result := sTabla;
end;

procedure TdmRanning.htmlwProductosNovedadesHTMLTag(Sender: TObject;
  Tag: TTag; const TagString: String; TagParams: TStrings;
  var ReplaceText: String);

var
  slAvanzadas: TStrings;

begin
  if TieneInformacionAtributos(Request.ContentFields) then
    slAvanzadas := Request.ContentFields
  else
    slAvanzadas := Request.QueryFields;
  if LowerCase(TagString) = 'productos' then begin
    if (Request.ContentFields.Count <> 0) or
       (Request.QueryFields.Values['consulta'] = '1') then
      ReplaceText := TablaProductosOfertas(slAvanzadas)
    else
      ReplaceText := '';
  end
  else if LowerCase(TagString) = 'menu_deportes' then
    ReplaceText := TablaDeportes(True)
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'menu_tipos_producto' then
    ReplaceText := TablaTiposProducto(True)
  else if LowerCase(TagString) = 'edbuscar' then
    ReplaceText := EditorBuscar
  else if LowerCase(TagString) = 'busqueda_avanzada' then begin
    if TieneInformacionAtributos(Request.ContentFields) then
      ReplaceText := BusquedaAvanzada(Request.ContentFields,pfProductosNovedades)
    else
      ReplaceText := BusquedaAvanzada(Request.QueryFields,pfProductosNovedades);
  end
  else if LowerCase(TagString) = 'busqueda_avanzada_activa' then
    ReplaceText := BusquedaAvanzadaActiva(slAvanzadas)
  else if LowerCase(TagString) = 'actualizar' then begin
    if TieneInformacionAtributos(Request.ContentFields) then
      ReplaceText := BotonActualizarConsulta(Request.ContentFields,TagParams,
        pfProductosNovedades)
    else
      ReplaceText := BotonActualizarConsulta(Request.QueryFields,TagParams,
        pfProductosNovedades);
  end;
end;

procedure TdmRanning.dmRanningwactProductosNovedadesAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Request.ContentFields.Count <> 0 then WriteClient(Request,Response);
  IniciarVariables(0);

  Response.ContentType := 'text/html';
  Response.Content := htmlwProductosNovedades.Content;
end;

procedure TdmRanning.sqlProductosCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ds_caracteristicas').AsString :=
    CaracteristicasProducto(DataSet.FieldByName('id_producto').AsInteger);
end;

procedure TdmRanning.htmlwBusquedaAvanzadaHTMLTag(Sender: TObject;
  Tag: TTag; const TagString: String; TagParams: TStrings;
  var ReplaceText: String);
begin
  if LowerCase(TagString) = 'atributos' then
    ReplaceText := TablaAtributosBusqueda
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'deporte' then
    ReplaceText := '<input type="hidden" name="deporte" value="' +
      IntToStr(FnDeporte) + '">'
  else if LowerCase(TagString) = 'tipo_producto' then
    ReplaceText := '<input type="hidden" name="tipo_producto" value="' +
      IntToStr(FnTipoProducto) + '">'
  else if LowerCase(TagString) = 'cbmarcas' then
    ReplaceText := '<input type="hidden" name="cbMarcas" value="' +
      Request.QueryFields.Values['cbMarcas'] + '">'
  else if LowerCase(TagString) = 'cbcomplemento' then
    ReplaceText := '<input type="hidden" name="cbComplemento" value="' +
      Request.QueryFields.Values['cbComplemento'] + '">'
  else if LowerCase(TagString) = 'cbsexo' then
    ReplaceText := '<input type="hidden" name="cbSexo" value="' +
      Request.QueryFields.Values['cbSexo'] + '">'
  else if LowerCase(TagString) = 'rbdescuento' then
    ReplaceText := '<input type="hidden" name="rbDescuento" value="' +
      Request.QueryFields.Values['rbDescuento'] + '">'
  else if LowerCase(TagString) = 'edbuscar' then
    ReplaceText := '<input type="hidden" name="edBuscar" value="' +
      Request.QueryFields.Values['edBuscar'] + '">'
  else if LowerCase(TagString) = 'from' then
    ReplaceText := BusquedaAvanzadaFrom;
end;

function TdmRanning.TablaAtributosBusqueda: string;

var
  sAtr: string;
  sNombre: string;
  sChecked: string;

begin
  if sqlProductosAtributosSolo.Active then sqlProductosAtributosSolo.Close;
  sqlProductosAtributosSolo.Open;
  sqlProductosAtributosSolo.First;
  if sqlAtributos.Active then sqlAtributos.Close;
  sqlAtributos.Open;
  sAtr := '<table class="colores">' + SALTO_LINEA + '<tr>' + SALTO_LINEA;
  while not sqlProductosAtributosSolo.Eof do begin;
    sAtr := sAtr + '<td class="colores_imagen"><table class="colores">' +
      SALTO_LINEA + '<tr><th class="fuente_muy_pequena">' +
      sqlProductosAtributosSolo.FieldByName('ds_atributo').AsString + '</th></tr>' +
      SALTO_LINEA;
    sqlAtributos.First;
    while not sqlAtributos.Eof do begin
      sNombre := 'cbAtr_' + sqlAtributos.FieldByName('id_atributo').AsString +
        '_' + sqlAtributos.FieldByName('id_valor').AsString;
      if LowerCase(Request.QueryFields.Values[sNombre]) = 'on' then
        sChecked := 'checked'
      else
        sChecked := '';
      sAtr := sAtr + '<tr><td><label class="fuente_muy_pequena"><input type="checkbox" ' +
        'name="' + sNombre + '" ' + sChecked + '>&nbsp;' +
        sqlAtributos.FieldByName('ds_valor').AsString + '</label></td></tr>' +
        SALTO_LINEA;
      sqlAtributos.Next;
    end;
    sAtr := sAtr + '</table></td>' + SALTO_LINEA;
    sqlProductosAtributosSolo.Next;
  end;
  sAtr := sAtr + '</table>';

  Result := sAtr;
end;

function TdmRanning.CumpleAvanzadas(slAvanzadas: TStrings): Boolean;

var
  nCumple: Integer;
  nCont: Integer;
  slAtr: TStringList;
  nAtr: Integer;

begin
  nCont := 0;
  nCumple := 0;
  nAtr := 0;
  if not sqlProductosDetalle.Active then sqlProductosDetalle.Open;
  if not sqlProductosDetalle.IsEmpty then begin
    slAtr := TStringList.Create;
    try
      ExtraeAtributosAvanzadas(slAvanzadas,slAtr);
      nAtr := slAtr.Count;
      while (nCumple < slAtr.Count) and (nCont < slAtr.Count) do begin
        if sqlProductosDetalle.Locate('ds_avanzada',slAtr[nCont],[]) then
          Inc(nCumple);
        Inc(nCont);
      end;
    finally
      slAtr.Free;
    end;
  end;

  Result := (nCumple <> 0) and (nCumple = nAtr);
end;

procedure TdmRanning.IniciarVariables(nDescDefecto: Integer);

var
  sValor: string;

begin
  sValor := Request.QueryFields.Values['deporte'];
  if sValor = '' then sValor := Request.ContentFields.Values['deporte'];
  try
    FnDeporte := StrToInt(sValor);
  except
    FnDeporte := 0;
  end;

  sValor := Request.QueryFields.Values['tipo_producto'];
  if sValor = '' then sValor := Request.ContentFields.Values['tipo_producto'];
  try
    FnTipoProducto := StrToInt(sValor);
  except
    FnTipoProducto := -1;
  end;

  sValor := Request.ContentFields.Values['cbMarcas'];
  if sValor = '' then sValor := Request.QueryFields.Values['cbMarcas'];
  try
    FnMarcas := StrToInt(sValor);
  except
    FnMarcas := -1;
  end;

  sValor := Request.ContentFields.Values['cbComplemento'];
  if sValor = '' then sValor := Request.QueryFields.Values['cbComplemento'];
  try
    FnComplemento := StrToInt(sValor);
  except
    FnComplemento := -1;
  end;

  sValor := Request.ContentFields.Values['cbSexo'];
  if sValor = '' then sValor := Request.QueryFields.Values['cbSexo'];
  try
    FnSexo := StrToInt(sValor);
  except
    FnSexo := -1;
  end;

  sValor := Request.ContentFields.Values['cbTemporada'];
  if sValor = '' then sValor := Request.QueryFields.Values['cbTemporada'];
  try
    FnTemporada := StrToInt(sValor);
  except
    FnTemporada := -1;
  end;

  sValor := Request.ContentFields.Values['rbDescuento'];
  if sValor = '' then sValor := Request.QueryFields.Values['rbDescuento'];
  try
    FnDescuento := StrToInt(sValor);
  except
    FnDescuento := nDescDefecto;
  end;

  sValor := Request.QueryFields.Values['novedades'];
  if sValor = '' then sValor := Request.ContentFields.Values['novedades'];
  try
    FlNovedades := StrToInt(sValor) = 1;
  except
    FlNovedades := False;
  end;

  sValor := Request.QueryFields.Values['cbPagina'];
  if sValor = '' then sValor := Request.ContentFields.Values['cbPagina'];
  try
    FnPagina := StrToInt(sValor);
  except
    FnPagina := 1;
  end;

  FsBuscar := Trim(Request.ContentFields.Values['edBuscar']);
  if FsBuscar = '' then FsBuscar := Trim(Request.QueryFields.Values['edBuscar']);
end;

procedure TdmRanning.ExtraeAtributosAvanzadas(slAvanzadas, slAtr: TStrings);

var
  nCont: Integer;

begin
  for nCont := 0 to slAvanzadas.Count - 1 do
    if Pos('cbAtr_',slAvanzadas[nCont]) <> 0 then
      slAtr.Add(slAvanzadas.Names[nCont]);
end;

function TdmRanning.AtributosACadenaHTML(slAtr: TStrings): string;

var
  nCont: Integer;
  sAtr: string;

begin
  sAtr := '';
  for nCont := 0 to slAtr.Count - 1 do
    sAtr := sAtr + slAtr[nCont] + '=on&';

  Result := Copy(sAtr,1,Length(sAtr) - 1);
end;

function TdmRanning.BusquedaAvanzadaActiva(slAvanzada: TStrings): string;
begin
  if Pos('cbAtr_',slAvanzada.CommaText) <> 0 then
    Result := '<font class="fuente_roja fuente_pequena fuente_negrita">' +
      'Búsqueda avanzada activa</font>'
  else
    Result := '';
end;

function TdmRanning.BusquedaAvanzada(slAvanzada: TStrings;
  Pagina: TPageFrom): string;

var
  slAtr: TStringList;
  sAtr: string;

begin
  slAtr := TStringList.Create;
  try
    ExtraeAtributosAvanzadas(slAvanzada,slAtr);
    sAtr := AtributosACadenaHTML(slAtr);
  finally
    slAtr.Free;
  end;

  case Pagina of
    pfProductos: Result := '<button type="button" onclick="javascript:imagenProducto(' +
      QuotedStr('../wwwRanning.exe/wbusqueda_avanzada?cbMarcas=') +
      ' + window.document.frmBusqueda.cbMarcas.value + ' + QuotedStr('&cbComplemento=') +
      ' + window.document.frmBusqueda.cbComplemento.value + ' + QuotedStr('&cbSexo=') +
      ' + window.document.frmBusqueda.cbSexo.value + ' +
      QuotedStr('&rbDescuento=' + IntToStr(FnDescuento) + '&deporte=' +
      IntToStr(FnDeporte) + '&tipo_producto=' + IntToStr(FnTipoProducto) +
      '&edBuscar=' + FsBuscar + '&from=' + IntToSTr(Integer(pfProductos)) + '&' +
      sAtr) + ',' + QuotedStr('Búsqueda por características') +
      ');">Búsqueda por características</button>';
    pfProductosOfertas: Result := '<button type="button" ' +
      'onclick="javascript:imagenProducto(' +
      QuotedStr('../wwwRanning.exe/wbusqueda_avanzada?rbDescuento=' +
      IntToStr(FnDescuento) + '&deporte=' + IntToStr(FnDeporte) +
      '&tipo_producto=' + IntToStr(FnTipoProducto) + '&edBuscar=' + FsBuscar +
      '&from=' + IntToSTr(Integer(pfProductosOfertas)) + '&' + sAtr) + ',' +
      QuotedStr('Búsqueda por características') + ');">Búsqueda por ' +
      'características</button>';
    pfProductosNovedades: Result := '<button type="button" ' +
      'onclick="javascript:imagenProducto(' +
      QuotedStr('../wwwRanning.exe/wbusqueda_avanzada?rbDescuento=' +
      IntToStr(FnDescuento) + '&deporte=' + IntToStr(FnDeporte) +
      '&tipo_producto=' + IntToStr(FnTipoProducto) + '&edBuscar=' + FsBuscar +
      '&from=' + IntToSTr(Integer(pfProductosNovedades)) + '&' + sAtr) + ',' +
      QuotedStr('Búsqueda por características') + ');">Búsqueda por ' +
      'características</button>';
  end;
end;

function TdmRanning.EditorBuscar: string;
begin
  Result := '<input type="text" name="edBuscar" size="25" value="' + FsBuscar +
    '">'
end;

function TdmRanning.UrlComplemento(TagParams: TStrings): string;
begin
  Result := '<select' + StringListToParamString(TagParams) +
  ' onchange="javascript:document.location = ' +
    QuotedStr('../wwwRanning.exe/wproductos?cbMarcas=') +
    ' + window.document.frmBusqueda.cbMarcas.value + ' + QuotedStr('&cbComplemento=') +
    ' + window.document.frmBusqueda.cbComplemento.value + ' + QuotedStr('&cbSexo=') +
    ' + window.document.frmBusqueda.cbSexo.value + ' + QuotedStr('&cbTemporada=') +
    ' + window.document.frmBusqueda.cbTemporada.value + ' +
    QuotedStr('&rbDescuento=' + IntToStr(FnDescuento) + '&deporte=' +
    IntToStr(FnDeporte) + '&tipo_producto=' + IntToStr(FnTipoProducto) +
    '&edBuscar=' + FsBuscar) + ';">'
end;

function TdmRanning.UrlMarcas(TagParams: TStrings): string;
begin
  Result := '<select' + StringListToParamString(TagParams) +
  ' onchange="javascript:document.location = ' +
    QuotedStr('../wwwRanning.exe/wproductos?cbMarcas=') +
    ' + window.document.frmBusqueda.cbMarcas.value + ' + QuotedStr('&cbComplemento=') +
    ' + window.document.frmBusqueda.cbComplemento.value + ' + QuotedStr('&cbSexo=') +
    ' + window.document.frmBusqueda.cbSexo.value + ' + QuotedStr('&cbTemporada=') +
    ' + window.document.frmBusqueda.cbTemporada.value + ' +
    QuotedStr('&rbDescuento=' + IntToStr(FnDescuento) + '&deporte=' +
    IntToStr(FnDeporte) + '&tipo_producto=' + IntToStr(FnTipoProducto) +
    '&edBuscar=' + FsBuscar) + ';">'
end;

function TdmRanning.UrlSexo(TagParams: TStrings): string;
begin
  Result := '<select' + StringListToParamString(TagParams) +
  ' onchange="javascript:document.location = ' +
    QuotedStr('../wwwRanning.exe/wproductos?cbMarcas=') +
    ' + window.document.frmBusqueda.cbMarcas.value + ' + QuotedStr('&cbComplemento=') +
    ' + window.document.frmBusqueda.cbComplemento.value + ' + QuotedStr('&cbSexo=') +
    ' + window.document.frmBusqueda.cbSexo.value + ' + QuotedStr('&cbTemporada=') +
    ' + window.document.frmBusqueda.cbTemporada.value + ' +
    QuotedStr('&rbDescuento=' + IntToStr(FnDescuento) + '&deporte=' +
    IntToStr(FnDeporte) + '&tipo_producto=' + IntToStr(FnTipoProducto) +
    '&edBuscar=' + FsBuscar) + ';">'
end;

function TdmRanning.BusquedaAvanzadaFrom: string;

var
  sTag: string;
  sValue: string;

begin
  sTag := '<input type="hidden" name="from" value="';
  case StrToInt(Request.QueryFields.Values['from']) of
    Integer(pfProductosOfertas): sValue := BUSQ_AVANZADA_FROM_OFERTAS;
    Integer(pfProductosNovedades): sValue := BUSQ_AVANZADA_FROM_NOVEDADES;
    Integer(pfProductos): sValue := BUSQ_AVANZADA_FROM_PRODUCTOS;
  end;

  Result := sTag + sValue + '">';
end;

function TdmRanning.TieneInformacionAtributos(slUrl: TStrings): Boolean;
begin
  Result := Pos('cbAtr_',slUrl.CommaText) <> 0;
end;

procedure TdmRanning.CreaBookmarksValidos(slBook: TJAMMemoryTable;
  slAvanzada: TStrings);
begin
  if Pos('cbAtr_',slAvanzada.CommaText) = 0 then Exit;

  slBook.First;
  slBook.SyncDataSet;
  while not slBook.Eof do begin
    slBook.ActualValid := CumpleAvanzadas(slAvanzada);
    slBook.Next;
    slBook.SyncDataSet;
  end;
  sqlProductosDetalle.Close;
end;

{ TIdProducto }

constructor TIdProducto.Create(nId: Integer);
begin
  FId := nId;
end;

function TIdProducto.GetId: Integer;
begin
  Result := FId;
end;

function TdmRanning.UrlPaginas(slAvanzada: TStrings; Pagina: TPageFrom;
  nNumPaginas: Integer): string;

var
  sPagina: string;
  nCont: Integer;
  sPag: string;
  slAtr: TStringList;
  sAtr: string;
  sDesc: string;

begin
  if nNumPaginas = 1 then Exit;

  slAtr := TStringList.Create;
  try
    ExtraeAtributosAvanzadas(slAvanzada,slAtr);
    sAtr := AtributosACadenaHTML(slAtr);
  finally
    slAtr.Free;
  end;

  case Pagina of
    pfProductos: sPagina := '<select name="cbPagina" ' +
      'onchange="javascript:document.location = ' +
      QuotedStr('../wwwRanning.exe/wproductos?cbMarcas=') +
      ' + window.document.frmBusqueda.cbMarcas.value + ' +
      QuotedStr('&cbComplemento=') +
      ' + window.document.frmBusqueda.cbComplemento.value + ' +
      QuotedStr('&cbSexo=') +
      ' + window.document.frmBusqueda.cbSexo.value + ' +
      QuotedStr('&cbTemporada=') +
      ' + window.document.frmBusqueda.cbTemporada.value + ' +
      QuotedStr('&cbPagina=') +
      ' + window.document.frmBusqueda.cbPagina.value + ';
    pfProductosOfertas: sPagina := '<select name="cbPagina" ' +
      'onchange="javascript:document.location = ' +
      QuotedStr('../wwwRanning.exe/wproductos_ofertas?cbPagina=') +
      ' + window.document.frmBusqueda.cbPagina.value + ';
    pfProductosNovedades: sPagina := '<select name="cbPagina" ' +
      'onchange="javascript:document.location = ' +
      QuotedStr('../wwwRanning.exe/wproductos_novedades?novedades=1&cbPagina=') +
      ' + window.document.frmBusqueda.cbPagina.value + ';
  end;

  if Pagina in [pfProductos,pfProductosOfertas] then
    sDesc := '&rbDescuento=' + IntToStr(FnDescuento)
  else
    sDesc := '';
  if sAtr = '' then
    sPagina := sPagina + QuotedStr(sDesc + '&deporte=' + IntToStr(FnDeporte) +
      '&tipo_producto=' + IntToStr(FnTipoProducto) + '&edBuscar=' + FsBuscar +
      '&consulta=1')
  else
    sPagina := sPagina + QuotedStr(sDesc + '&deporte=' + IntToStr(FnDeporte) +
      '&tipo_producto=' + IntToStr(FnTipoProducto) + '&edBuscar=' + FsBuscar +
      '&consulta=1' + '&' + sAtr);
  sPagina := sPagina + ';">' + SALTO_LINEA;

  for nCont := 1 to nNumPaginas do begin
    sPag := IntToStr(nCont);
    sPagina := sPagina +  '<option value="' + sPag + '"';
    if nCont = FnPagina then sPagina := sPagina + ' selected';
    sPagina := sPagina + '>Página ' + sPag + '</option>' + SALTO_LINEA;
  end;

  Result := '<font class="fuente_negrita">Elije la página que quieres ver: ' +
    '</font>' + sPagina + '</select>';
end;

function TdmRanning.BotonActualizarConsulta(slAvanzada, slTagParams: TStrings;
  Pagina: TPageFrom): string;

var
  slAtr: TStringList;
  sAtr: string;
  sImg: string;

begin
  slAtr := TStringList.Create;
  try
    ExtraeAtributosAvanzadas(slAvanzada,slAtr);
    sAtr := AtributosACadenaHTML(slAtr);
  finally
    slAtr.Free;
  end;

  if sAtr <> '' then sAtr := '&' + sAtr;
  case Pagina of
    pfProductos: sImg := QuotedStr('../wwwRanning.exe/wproductos?cbMarcas=') +
      ' + window.document.frmBusqueda.cbMarcas.value + ' + QuotedStr('&cbComplemento=') +
      ' + window.document.frmBusqueda.cbComplemento.value + ' + QuotedStr('&cbSexo=') +
      ' + window.document.frmBusqueda.cbSexo.value + ' + QuotedStr('&cbTemporada=') +
      ' + window.document.frmBusqueda.cbTemporada.value + ' +
      QuotedStr('&rbDescuento=' + IntToStr(FnDescuento) + '&deporte=' +
      IntToStr(FnDeporte) + '&tipo_producto=' + IntToStr(FnTipoProducto) +
      '&edBuscar=' + FsBuscar + sAtr + '&consulta=1') + ';">';
    pfProductosOfertas: sImg := QuotedStr('../wwwRanning.exe/wproductos_ofertas?rbDescuento=' +
      IntToStr(FnDescuento) + '&deporte=' + IntToStr(FnDeporte) +
      '&tipo_producto=' + IntToStr(FnTipoProducto) + '&edBuscar=' + FsBuscar +
      sAtr + '&consulta=1') + ';">';
    pfProductosNovedades: sImg := QuotedStr('../wwwRanning.exe/wproductos_novedades?deporte=' +
      IntToStr(FnDeporte) + '&tipo_producto=' + IntToStr(FnTipoProducto) +
      '&edBuscar=' + FsBuscar + sAtr + '&consulta=1&novedades=1') + ';">';
  end;

  {
  Result := '<a href="javascript:document.location = ' + sImg +
  '<img src="../../_images/actualizar.gif" height="90" width="82"' +
  StringListToParamString(slTagParams) + '></a>';
  }
  Result := '<button type="button"' + StringListToParamString(slTagParams) +
    ' onclick="javascript:document.location = ' + sImg + 'Mostrar productos</button>';
end;

function TdmRanning.FechaActualizacion: string;
begin
  if sqlFechaActualizacion.Active then sqlFechaActualizacion.Close;
  sqlFechaActualizacion.ParamByName('id_producto').AsString :=
    Request.QueryFields.Values['id_producto'];
  sqlFechaActualizacion.Open;
  if Trim(sqlFechaActualizacion.FieldByName('f_actualizacion').AsString) = '' then
    Result := ''
  else
    Result := FormatDateTime('dd/mm/yyyy',
      sqlFechaActualizacion.FieldByName('f_actualizacion').AsDateTime);
end;

function TdmRanning.EsUltimosPares(nIdProducto: Integer): Boolean;

var
  lUltimo: Boolean;

begin
  if sqlUltimosPares.Active then sqlUltimosPares.Close;
  sqlUltimosPares.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlUltimosPares.Open;
  lUltimo := sqlUltimosPares.FieldByName('nm_producto').AsInteger <= ULTIMOS_PARES;
  sqlUltimosPares.First;
  while (not sqlUltimosPares.Eof) and (not lUltimo) do begin
    lUltimo := sqlUltimosPares.FieldByName('nm_producto').AsInteger <= ULTIMOS_PARES;
    sqlUltimosPares.Next;
  end;

  Result := lUltimo;
end;

function TdmRanning.OpcionesTemporada: string;

var
  sOpc: string;
  nCont: Integer;

begin
  sqlOpciones.SQL.Text := 'select distinct t.* from temporadas t';
  if (FnDeporte > ID_TIPO_DEPORTE_TODOS) or (FnTipoProducto > 0) or (FnSexo > 0) or
     (FnMarcas > 0) then
    sqlOpciones.SQL.Add(',productos p,stock s where (p.id_producto = ' +
      's.id_producto) and (s.id_temporada = t.id_temporada)');
  if FnDeporte > ID_TIPO_DEPORTE_TODOS then
    sqlOpciones.SQL.Add('and (p.id_tipo_deporte = ' + IntToStr(FnDeporte) +
      ')');
  if FnTipoProducto > 0 then
    sqlOpciones.SQL.Add('and (p.id_tipo_producto = ' +
      IntToStr(FnTipoProducto) + ')');
  if FnSexo > 0 then
    sqlOpciones.SQL.Add('and (p.id_tipo_sexo = ' + IntToStr(FnSexo) + ')');
  if FnMarcas > 0 then
    sqlOpciones.SQL.Add('and (p.id_marca = ' + IntToStr(FnMarcas) + ')');
  sqlOpciones.SQL.Add('order by t.nm_orden');
  sqlOpciones.Open;
  sqlOpciones.First;
  nCont := sqlOpciones.FieldByName('id_temporada').AsInteger;
  if FnTemporada = -1 then
    sOpc := '<option selected value="-1">Todas las temporadas</option>'
  else
    sOpc := '<option value="-1">Todas las temporadas</option>';
  while not sqlOpciones.Eof do begin
    if nCont = FnTemporada then
      sOpc := sOpc + '<option selected value="' + IntToStr(nCont) + '">' +
        sqlOpciones.FieldByName('ds_temporada').AsString + '</option>' +
        SALTO_LINEA
    else
      sOpc := sOpc + '<option value="' + IntToStr(nCont) + '">' +
        sqlOpciones.FieldByName('ds_temporada').AsString + '</option>' +
        SALTO_LINEA;
    sqlOpciones.Next;
    nCont := sqlOpciones.FieldByName('id_temporada').AsInteger;
  end;

  Result := sOpc;
end;

function TdmRanning.UrlTemporada(TagParams: TStrings): string;
begin
  Result := '<select' + StringListToParamString(TagParams) +
  ' onchange="javascript:document.location = ' +
    QuotedStr('../wwwRanning.exe/wproductos?cbMarcas=') +
    ' + window.document.frmBusqueda.cbMarcas.value + ' + QuotedStr('&cbComplemento=') +
    ' + window.document.frmBusqueda.cbComplemento.value + ' + QuotedStr('&cbSexo=') +
    ' + window.document.frmBusqueda.cbSexo.value + ' + QuotedStr('&cbTemporada=') +
    ' + window.document.frmBusqueda.cbTemporada.value + ' +
    QuotedStr('&rbDescuento=' + IntToStr(FnDescuento) + '&deporte=' +
    IntToStr(FnDeporte) + '&tipo_producto=' + IntToStr(FnTipoProducto) +
    '&edBuscar=' + FsBuscar) + ';">'
end;

function TdmRanning.DescuentoMaxProducto(nIdProducto: Integer): Extended;

var
  rDesc: Extended;

begin
  rDesc := sqlProductos.FieldByName('nm_descuento_max').AsFloat;

  if sqlDescuentoMaxOferta.Active then sqlDescuentoMaxOferta.Close;
  sqlDescuentoMaxOferta.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlDescuentoMaxOferta.Open;

  if (not sqlDescuentoMaxOferta.IsEmpty) and
     (sqlDescuentoMaxOferta.FieldByName('nm_desc_max').AsFloat > rDesc) then
    rDesc := sqlDescuentoMaxOferta.FieldByName('nm_desc_max').AsFloat;

  Result := rDesc;
end;

function TdmRanning.DescuentoProducto(nIdProducto, nIdTalla: Integer;
  const sCdColor: string): Extended;

var
  rDesc: Extended;

begin
  rDesc := sqlProductosOferta.FieldByName('nm_descuento').AsFloat;

  if sqlOfertas.Active then sqlOfertas.Close;
  sqlOfertas.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertas.Open;

  if not sqlOfertas.IsEmpty then begin
    if sqlOfertas.Locate('cd_color,id_talla',VarArrayOf([sCdColor,nIdTalla]),[]) and
       (sqlOfertas.FieldByName('nm_descuento_oferta').AsFloat > sqlOfertas.FieldByName('nm_descuento_stock').AsFloat) then
      rDesc := sqlOfertas.FieldByName('nm_descuento_oferta').AsFloat;
  end;

  Result := rDesc;
end;

function TdmRanning.PrecioProducto(nIdProducto, nIdTalla: Integer;
  const sCdColor: string): Extended;

var
  rDesc: Extended;

begin
  rDesc := sqlProductosOferta.FieldByName('nm_precio_final').AsFloat;

  if sqlOfertas.Active then sqlOfertas.Close;
  sqlOfertas.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertas.Open;

  if not sqlOfertas.IsEmpty then begin
    if sqlOfertas.Locate('cd_color,id_talla',VarArrayOf([sCdColor,nIdTalla]),[]) and
       (sqlOfertas.FieldByName('nm_precio_final_oferta').AsFloat < sqlOfertas.FieldByName('nm_precio_final_stock').AsFloat) then
      rDesc := sqlOfertas.FieldByName('nm_precio_final_oferta').AsFloat;
  end;

  Result := rDesc;
end;

procedure TdmRanning.htmlwIndexConsultaHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'frame_pri' then
    ReplaceText := '../wwwRanning.exe/wproductos?consulta=1&' + Request.Query
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file']);
end;

procedure TdmRanning.dmRanningwactIndexConsultaAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Request.ContentFields.Count <> 0 then WriteClient(Request,Response);

  Response.ContentType := 'text/html';
  Response.Content := htmlwIndexConsulta.Content;
end;

function TdmRanning.ProductoOfertaLanzamiento(nIdProducto: Integer): Boolean;
begin
  Result := False;

  if sqlOfertaLanzamiento.Active then sqlOfertaLanzamiento.Close;
  sqlOfertaLanzamiento.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertaLanzamiento.Open;

  if sqlOfertaLanzamiento.IsEmpty then Exit;

  Result := sqlOfertaLanzamiento.FieldByName('it_novedad').AsString = CAMPO_MARCADO;
end;

function TdmRanning.FechaFinOfertaLanzamiento(nIdProducto: Integer): string;
begin
  Result := '';

  if sqlOfertaLanzamiento.Active then sqlOfertaLanzamiento.Close;
  sqlOfertaLanzamiento.ParamByName('id_producto').AsInteger := nIdProducto;
  sqlOfertaLanzamiento.Open;

  if sqlOfertaLanzamiento.IsEmpty then Exit;

  Result := FormatDateTime('dd/mm/yyyy',
    sqlOfertaLanzamiento.FieldByName('f_fin').AsDateTime);
end;

end.


