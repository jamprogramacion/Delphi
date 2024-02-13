unit uComun;

interface

uses httpapp, classes, db, sysutils, ZDataSet, ZConnection;

const
  HTML_ROOT = '../../';
  HTML_IMAGES = HTML_ROOT + '_images/';
  HTML_MARCAS = HTML_IMAGES + 'marcas/';
  CAMPO_MARCADO = 'X';
  CAMPO_NO_MARCADO = '-';
  SALTO_LINEA = #13 + #10;
  IMG_NO_DISPONIBLE = HTML_ROOT + '_images/no_disponible.gif';
  {$ifdef local}
  CLAVE_BBDD_HOST = 'local';
  BBDD_USER = 'root';
  BBDD_PWD = 'apunto';
  BBDD_DB = 'ranning';
  BBDD_PORT = 3306;
  PATH_HTML = '..\';
  PATH_PRODUCTOS = PATH_HTML + '_images\productos\';
  PATH_P_PRODUCTOS = PATH_HTML + '_images\p_productos\';
  PATH_MARCAS = PATH_HTML + '_images\marcas\';
  PATH_PLANTILLAS = '';
  PATH_IMG_LIST = PATH_PLANTILLAS + '_img_list\';
  DOMINIO_COOKIE = '';
  {$endif}
  {$ifdef otro}
  CLAVE_BBDD_HOST = 'otro';
  BBDD_USER = 'root';
  BBDD_PWD = 'apunto';
  BBDD_DB = 'ranning';
  BBDD_PORT = 3306;
  PATH_HTML = '..\';
  PATH_PRODUCTOS = PATH_HTML + '_images\productos\';
  PATH_P_PRODUCTOS = PATH_HTML + '_images\p_productos\';
  PATH_MARCAS = PATH_HTML + '_images\marcas\';
  PATH_PLANTILLAS = PATH_HTML + 'cgi-bin\';
  PATH_IMG_LIST = PATH_PLANTILLAS + '_img_list\';
  DOMINIO_COOKIE = '';
  {$endif}
  {$ifdef web}
  CLAVE_BBDD_HOST = 'web';
  BBDD_USER = 'qaa834';
  BBDD_PWD = 'BBDDqaa82292';
  BBDD_DB = 'qaa834';
  BBDD_PORT = 3306;
  PATH_HTML = 'd:\xvrt\ranning.com\html\';
  PATH_PRODUCTOS = PATH_HTML + '_images\productos\';
  PATH_P_PRODUCTOS = PATH_HTML + '_images\p_productos\';
  PATH_MARCAS = PATH_HTML + '_images\marcas\';
  PATH_PLANTILLAS = PATH_HTML + 'cgi-bin\';
  PATH_IMG_LIST = PATH_PLANTILLAS + '_img_list\';
  DOMINIO_COOKIE = 'www.ranning.com';
  {$endif}
  {$ifdef web_org}
  CLAVE_BBDD_HOST = 'web';
  BBDD_USER = 'qaa834';
  BBDD_PWD = 'BBDDqaa82292';
  BBDD_DB = 'qaa834';
  BBDD_PORT = 3306;
  PATH_HTML = 'd:\xvrt\ranning.org\html\';
  PATH_PRODUCTOS = PATH_HTML + '_images\productos\';
  PATH_P_PRODUCTOS = PATH_HTML + '_images\p_productos\';
  PATH_MARCAS = PATH_HTML + '_images\marcas\';
  PATH_PLANTILLAS = PATH_HTML + 'cgi-bin\';
  PATH_IMG_LIST = PATH_PLANTILLAS + '_img_list\';
  DOMINIO_COOKIE = 'www.ranning.org';
  {$endif}
  PATH_COOKIE = '/';
  LOG_FILE = PATH_PLANTILLAS + 'log.txt';
  BBDD_INI_FILE = PATH_PLANTILLAS + 'bbdd.ini';
  CLIENTS_FILE = PATH_PLANTILLAS + 'accesos';
  BANNERS_FILE = PATH_PLANTILLAS + 'banners';
  ATTR_IMG = 'width="75" height="75"';
  ATTR_IMG_OFERTAS = 'width="150" height="150"';

function BBDDHost: string;

procedure WriteLog(const sLine: string); overload;

procedure WriteLog(const sFileName: TFileName; const sLine: string); overload;

procedure WriteEntrada(Request: TWebRequest; Response: TWebResponse);

procedure WriteClient(Request: TWebRequest; Response: TWebResponse);

procedure WriteBanner(Request: TWebRequest; const sBannerUrl: string;
  nTipo: Integer);

procedure ResetIDClient(Response: TWebResponse);

function CreateIDClient: string;

function StringListToParamString(slParams: TStrings): string;

function ItFieldMarked(DataSet: TDataSet; const sFieldName: string): Boolean;

function ConvertToLink(const sText, sUrl: string; const sClass: string = '';
  const sTarget: string = ''): string;

function MemoATextoWeb(fldMemo: TMemoField): string;

function ImagenMarca(sqlMarcas: TZReadOnlyQuery; DataSet: TDataSet): string; overload;

function ImagenMarca(const sCdMarca: string): TFileName; overload;

function DescColor(dbConn: TZConnection; const sCdColor: string): string;

function FormateaPorcentaje(rValor: Extended; nDecimales: Integer): string;

function IncludeFile(const sFile: TFileName): string;

implementation

uses uCommon, uConst, IniFiles;

var
  FLog: TextFile;

function BBDDHost: string;
begin
  with TIniFile.Create(BBDD_INI_FILE) do
    try
      Result := ReadString('host_bbdd',CLAVE_BBDD_HOST,'');
    finally
      Free;
    end;
end;

function DescColor(dbConn: TZConnection; const sCdColor: string): string;
var
  nCont: Integer;
  sColor: string;
  sqlColores: TZReadOnlyQuery;

begin
  nCont := 1;
  sColor := '';
  sqlColores := TZReadOnlyQuery.Create(nil);
  try
    sqlColores.Connection := dbConn;
    while nCont < Length(sCdColor) do begin
      if sqlColores.Active then sqlColores.Close;
      sqlColores.SQL.Text := 'select ds_color from colores where id_color = ' +
        IntToStr(ToDecimal(UpperCase(Copy(sCdColor,nCont,DIGITOS_CD_COLOR)),BASE_CD_COLOR));
      sqlColores.Open;
      sColor := sColor + sqlColores.FieldByName('ds_color').AsString + '/';
      Inc(nCont,DIGITOS_CD_COLOR);
    end;
  finally
    sqlColores.Free;
  end;

  Result := Copy(sColor,1,Length(sColor) - 1);
end;

function FormateaPorcentaje(rValor: Extended;
  nDecimales: Integer): string;
begin
  Result := FloatToStrF(rValor,ffFixed,3,nDecimales);
end;

procedure WriteLog(const sLine: string);
begin
  AssignFile(FLog,LOG_FILE);
  try
    try
      Append(FLog);
    except
      try
        Rewrite(FLog);
      except
      end;
    end;
    try
      Writeln(FLog,FormatDateTime('dd/mm/yyyy hh:nn',Now) + '-> ' + sLine);
    except
    end;
  finally
    CloseFile(FLog);
  end;
end;

procedure WriteLog(const sFileName: TFileName; const sLine: string); overload;
begin
  AssignFile(FLog,PATH_PLANTILLAS + ExtractFileName(sFileName));
  try
    try
      Append(FLog);
    except
      try
        Rewrite(FLog);
      except
      end;
    end;
    try
      Writeln(FLog,FormatDateTime('dd/mm/yyyy hh:nn',Now) + '-> ' + sLine);
    except
    end;
  finally
    CloseFile(FLog);
  end;
end;

function CreateIDClient: string;
begin
  //Result := CreateGUID62;

  Result := FormatDateTime('yyyymmddhhnnsszzz',Now);
end;

procedure ResetIDClient(Response: TWebResponse);

var
  sGUID: string;
  nCont: Integer;

begin
  sGUID := CreateIDClient + OnlyChar(Response.HTTPRequest.RemoteAddr);
  nCont := 0;
  while (nCont < Response.Cookies.Count) and (Response.Cookies[nCont].Name <> 'id_cw') do
    Inc(nCont);

  if (Response.Cookies.Count = 0) or (nCont = Response.Cookies.Count) then begin
    with Response.Cookies.Add do begin
      Name := 'id_cw';
      Value := sGUID;
      Domain := DOMINIO_COOKIE;
      Path := PATH_COOKIE;
    end;
  end
  else
    Response.Cookies[nCont].Value := sGUID;
end;

procedure WriteEntrada(Request: TWebRequest; Response: TWebResponse);

var
  sLinea: string;
  sCabecera: string;
  sOpciones: string;
  fClient: TextFile;

begin
  {$ifdef local}
    Exit;
  {$endif}
  {$ifdef otro}
    Exit;
  {$endif}

  sCabecera := '"f_fecha";"nm_hora";"ds_ip_remota";"ds_user_agent";"ds_derived_from";' +
    '"ds_referer";"ds_opciones";"ds_id";"ds_remote_host"';

  sLinea := '"' + FormatDateTime('dd/mm/yyyy',Date) + '"';
  sLinea := sLinea + ';"' + FormatDateTime('hh:nn',Time) + '"';
  sLinea := sLinea + ';"' + Request.RemoteAddr + '"';
  sLinea := sLinea + ';"' + Request.UserAgent + '"';
  sLinea := sLinea + ';"' + Request.DerivedFrom + '"';
  sLinea := sLinea + ';"' + Request.Referer + '"';
  sOpciones := StringReplace(Trim(StringListToParamString(Request.QueryFields)),
  '"','''',[rfReplaceAll]);
  sLinea := sLinea + ';"' + sOpciones + '"';
  sLinea := sLinea + ';""';
  sLinea := sLinea + ';"' + Request.RemoteHost + '"';
  AssignFile(fClient,CLIENTS_FILE + '_' + FormatDateTime('yyyymmdd',Date) + '.txt');
  try
    try
      Append(fClient);
    except
      try
        Rewrite(fClient);
        Writeln(fClient,sCabecera);
      except
      end;
    end;
    try
      Writeln(fClient,sLinea);
    except
    end;
  finally
    CloseFile(fClient);
  end;
end;

procedure WriteClient(Request: TWebRequest; Response: TWebResponse);

var
  sLinea: string;
  sCabecera: string;
  sOpciones: string;
  sGUID: string;
  fClient: TextFile;

begin
  sGUID := '';
  sCabecera := '"f_fecha";"nm_hora";"ds_ip_remota";"ds_user_agent";"ds_derived_from";' +
    '"ds_referer";"ds_opciones";"ds_id";"ds_remote_host"';
  if Request.CookieFields.Values['id_cw'] <> '' then
    sGUID := Request.CookieFields.Values['id_cw']
  {
  else if Request.ContentFields.Values['id'] <> '' then
    sGUID := Request.ContentFields.Values['id']
  }
  else
    ResetIDClient(Response);

  {$ifdef local}
  Exit;
  {$endif}
  {$ifdef otro}
  Exit;
  {$endif}

  sLinea := '"' + FormatDateTime('dd/mm/yyyy',Date) + '"';
  sLinea := sLinea + ';"' + FormatDateTime('hh:nn',Time) + '"';
  sLinea := sLinea + ';"' + Request.RemoteAddr + '"';
  sLinea := sLinea + ';"' + Request.UserAgent + '"';
  sLinea := sLinea + ';"' + Request.DerivedFrom + '"';
  sLinea := sLinea + ';"' + Request.Referer + '"';
  sOpciones := StringReplace(Trim(StringListToParamString(Request.QueryFields)),
  '"','''',[rfReplaceAll]);
  sLinea := sLinea + ';"' + sOpciones + '"';
  sLinea := sLinea + ';"' + sGUID + '"';
  sLinea := sLinea + ';"' + Request.RemoteHost + '"';
  AssignFile(fClient,CLIENTS_FILE + '_' + FormatDateTime('yyyymmdd',Date) + '.txt');
  try
    try
      Append(fClient);
    except
      try
        Rewrite(fClient);
        Writeln(fClient,sCabecera);
      except
      end;
    end;
    try
      Writeln(fClient,sLinea);
    except
    end;
  finally
    CloseFile(fClient);
  end;
end;

procedure WriteBanner(Request: TWebRequest; const sBannerUrl: string;
  nTipo: Integer);

var
  sLinea: string;
  sCabecera: string;
  sOpciones: string;
  sGUID: string;
  fClient: TextFile;

begin
  sCabecera := '"f_fecha";"nm_hora";"ds_ip_remota";"ds_url_banner";"nm_tipo"' +
    ';"ds_user_agent";"ds_derived_from";"ds_referer";"ds_opciones";"ds_id"' +
    ';"ds_remote_host"';
  sGUID := Request.CookieFields.Values['id_cw'];

  {$ifdef local}
  Exit;
  {$endif}
  {$ifdef otro}
  Exit;
  {$endif}

  sLinea := '"' + FormatDateTime('dd/mm/yyyy',Date) + '"';
  sLinea := sLinea + ';"' + FormatDateTime('hh:nn',Time) + '"';
  sLinea := sLinea + ';"' + Request.RemoteAddr + '"';
  sLinea := sLinea + ';"' + sBannerUrl + '"';
  sLinea := sLinea + ';"' + IntToStr(nTipo) + '"';
  sLinea := sLinea + ';"' + Request.UserAgent + '"';
  sLinea := sLinea + ';"' + Request.DerivedFrom + '"';
  sLinea := sLinea + ';"' + Request.Referer + '"';
  sOpciones := StringReplace(Trim(StringListToParamString(Request.QueryFields)),
  '"','''',[rfReplaceAll]);
  sLinea := sLinea + ';"' + sOpciones + '"';
  sLinea := sLinea + ';"' + sGUID + '"';
  sLinea := sLinea + ';"' + Request.RemoteHost + '"';
  AssignFile(fClient,BANNERS_FILE + '_' + FormatDateTime('yyyymmdd',Date) + '.txt');
  try
    try
      Append(fClient);
    except
      try
        Rewrite(fClient);
        Writeln(fClient,sCabecera);
      except
      end;
    end;
    try
      Writeln(fClient,sLinea);
    except
    end;
  finally
    CloseFile(fClient);
  end;
end;

function StringListToParamString(slParams: TStrings): string;

var
  nCont: Integer;
  sParams: string;

begin
  sParams := '';
  for nCont := 0 to slParams.Count - 1 do
    if Pos('=',slParams[nCont]) <> 0 then
      sParams := sParams + ' ' + slParams.Names[nCont] + '="' +
        slParams.Values[slParams.Names[nCont]] + '"'
    else
      sParams := sParams + ' ' + slParams[nCont];

  Result := sParams;
end;

function ItFieldMarked(DataSet: TDataSet; const sFieldName: string): Boolean;
begin
  Result := DataSet.FieldByName(sFieldName).AsString = CAMPO_MARCADO;
end;

function ConvertToLink(const sText, sUrl: string; const sClass: string = '';
  const sTarget: string = ''): string;

var
  sLink: string;

begin
  if sClass = '' then
    sLink := '<a href="' + sUrl + '"'
  else
    sLink := '<a class="' + sClass + '" href="' + sUrl + '"';
  if sTarget <> '' then
    sLink := sLink + ' target="' + sTarget + '"';
    
  Result := sLink + '>' + sText + '</a>';
end;

function MemoATextoWeb(fldMemo: TMemoField): string;
var
  nCont: Integer;
  slTexto: TStringList;
  sTexto: string;

begin
  slTexto := TStringList.Create;
  try
    slTexto.Text := fldMemo.Value;
    sTexto := '';
    for nCont := 0 to slTexto.Count - 1 do begin
      sTexto := sTexto + slTexto[nCont];
      if nCont < (slTexto.Count - 1) then sTexto := sTexto + '<br>';
    end;
  finally
    slTexto.Free;
  end;

  Result := sTexto;
end;

function ImagenMarca(sqlMarcas: TZReadOnlyQuery; DataSet: TDataSet): string; overload;

var
  sImg: TFileName;
  sCdMarca: string;
  sDsMarca: string;
  sWeb: string;

begin
  sCdMarca := DataSet.FieldByName('cd_marca').AsString;
  sDsMarca := DataSet.FieldByName('ds_marca').AsString;
  if not sqlMarcas.Active then sqlMarcas.Open;
  sqlMarcas.Locate('cd_marca',sCdMarca,[]);
  sWeb := Trim(sqlMarcas.FieldByName('ds_web').AsString);
  sImg := ImagenMarca(sCdMarca);

  Result := '<img ' + ATTR_IMG + ' src="' + sImg + '" title="' + sDsMarca + '">';
  if sWeb <> '' then
    Result := '<a href="' + sWeb + '" target="_blank"><img ' + ATTR_IMG +
      ' src="' + sImg + '" title="' + sDsMarca +
      '. Pincha en la imagen para ir a la web de la marca"></a>';
end;

function ImagenMarca(const sCdMarca: string): TFileName; overload;

var
  sImg: TFileName;

begin
  sImg := 'logo_' + LowerCase(sCdMarca) + '.gif';
  if FileOpen(PATH_MARCAS + sImg,fmOpenRead or fmShareDenyNone) <> -1 then
    sImg := HTML_MARCAS + sImg
  else
    sImg := IMG_NO_DISPONIBLE;

  Result := StringReplace(sImg,'\','/',[rfReplaceAll]);
end;

function IncludeFile(const sFile: TFileName): string;

var
  slIncludeFile: TStringList;

begin
  slIncludeFile := TStringList.Create;
  try
    slIncludeFile.LoadFromFile(PATH_HTML + sFile);
    Result := slIncludeFile.Text;
  finally
    slIncludeFile.Free;
  end;
end;

end.
