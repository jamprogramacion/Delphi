unit udmMail;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, ZConnection, uJamInternetControls,
  Db, ZAbstractRODataset, ZDataset, Psock, NMsmtp;

type
  TdmMail = class(TWebModule)
    smtp: TJAMSMTP;
    htmlwMail: TPageProducer;
    dbRanning: TZConnection;
    htmlwMailPresupuesto: TPageProducer;
    sqlCarritoPresupuesto: TZReadOnlyQuery;
    sqlClienteExiste: TZReadOnlyQuery;
    sqlProvincias: TZReadOnlyQuery;
    sqlCarrito: TZReadOnlyQuery;
    sqlVacaciones: TZReadOnlyQuery;
    sqlFestivos: TZReadOnlyQuery;
    htmlwMailCliente: TPageProducer;
    sqlMunicipios: TZReadOnlyQuery;
    sqlCP: TZReadOnlyQuery;
    sqlTiposVia: TZReadOnlyQuery;
    smtpMuni: TJAMSMTP;
    sqlFormasPago: TZReadOnlyQuery;
    htmlwMailExt: TPageProducer;
    smtpExt: TJAMSMTP;
    sqlCorreoExterno: TZReadOnlyQuery;
    sqlClientes: TZReadOnlyQuery;
    htmlwMailOk: TPageProducer;
    sqlTotalPedido: TZReadOnlyQuery;
    sqlGastosEnvio: TZReadOnlyQuery;
    dsFormasPago: TDataSource;
    sqlGastosEnvioSuplemento: TZReadOnlyQuery;
    procedure dmMailwactMailAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure htmlwMailHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure smtpSuccess(Sender: TObject);
    procedure WebModuleCreate(Sender: TObject);
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure htmlwMailPresupuestoHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmMailwactMailExtAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure smtpExtSuccess(Sender: TObject);
    procedure htmlwMailExtHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure htmlwMailClienteHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmMailwactMailCienteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure dmMailwactMailPresupuestoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure smtpConnect(Sender: TObject);
    procedure smtpPwdAuthenticationFailed(Sender: TObject);
    procedure htmlwMailOkHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    FsErrorMail: string;
    lErrorMail: Boolean;

    function WebATexto(const sMail: string): string;
    function DatosEnvio: string;
    function ExisteClienteWeb: Boolean;
    function CPCorrecto(const sCP: string): Boolean;
    function DatosCarritoATexto(const sIdCliente: string): string;
    function TextoVacaciones: string;
    function EsVacaciones: Boolean;
    function DiaFestivo: string;
    function Provincia(const sIdProv: string): string;
    function Municipio(const sIdProv, sIdMuni: string): string;
    function OpcionProvicias(slValores: TStrings): string;
    function OpcionMunicipios(slValores: TStrings): string;
    function OpcionTiposVia(slValores: TStrings): string;
    function OpcionTiposSexo(slValores: TStrings): string;
    function CP(const sIdProv, sIdMuni: string): string;
    function DNICorrecto(const sDNI: string): Boolean;
    procedure EnviaCorreoCPMunicipio(const sIdProv, sIdMuni, sCP: string);
    function FormasEnvio(lExtranjero: Boolean; const sCdProvincia: string): string;
    function DescFormaEnvio(const sCdFormaEnvio: string): string;
    function GastosEnvio(const sCdFormaEnvio: string): Extended;
    procedure AbreCorreoExterno;
    function TituloCorreoExterno: string;
    function VariasDireccionesCliente: string;
  public
    { Public declarations }
  end;

var
  dmMail: TdmMail;

implementation

uses uComun, uCommon, uConst, Math;

const
  //De agencias_transporte.id_agencia_transporte-agencias_transporte.id_forma_pago
  //ENVIO_DEFECTO = '1-5';
  CAMPO_OBLIGATORIO = '<font class="fuente_roja fuente_negrita">(*)</font>';
  // De la tabla tipos_vial
  TIPO_VIA_CALLE = 'C/';
  // De la tabla tipos_sexo
  TIPO_SEXO_HOMBRE = 1;
  TIPO_SEXO_MUJER = 2;
  SEXO_HOMBRE = 'Hombre';
  SEXO_MUJER = 'Mujer';
  PEDIDO_CONFIRMADO = '1';
  PEDIDO_ANULADO = '0';

{$R *.DFM}

procedure TdmMail.dmMailwactMailAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

var
  sError: string;
  sFestivo: string;

begin
  if Request.QueryFields.Values['subject'] = 'p' then begin
    dmMailwactMailPresupuestoAction(Sender,Request,Response,Handled);
    Exit;
  end;

  WriteClient(Request,Response);

  sError := '';
  if Request.QueryFields.Values['subject'] <> 'p' then begin
    if Trim(Request.ContentFields.Values['edResponder']) = '' then
      sError := 'La direcci�n de e-mail de respuesta es obligatoria'
    else if Pos('@',Request.ContentFields.Values['edResponder']) = 0 then
      sError := 'La direcci�n de e-mail de respuesta no es correcta';
  end;

  if (sError = '') and (Request.QueryFields.Values['subject'] = 'productos') then begin
    if Trim(Request.ContentFields.Values['edNombre']) = '' then
      sError := 'El nombre es obligatorio'
    else if Trim(Request.ContentFields.Values['edApellido1']) = '' then
      sError := 'El primer apellido es obligatorio';

    if Request.ContentFields.Values['cbExtranjero'] = '' then begin
      if Trim(Request.ContentFields.Values['edDNI']) = '' then
        sError := 'el DNI es obligatorio'
      else if not DNICorrecto(Trim(Request.ContentFields.Values['edDNI'])) then
        sError := 'el DNI no es correcto. Falta la letra'
      else if Trim(Request.ContentFields.Values['edTelefono']) = '' then
        sError := 'El n�mero de tel�fono es obligatorio';
    end;

    if (sError = '') and (Request.ContentFields.Values['cbExtranjero'] = '') then begin
      if Request.ContentFields.Values['cbProvincia'] = '' then
        sError := 'La provincia es obligatoria'
      else if (Request.ContentFields.Values['cbPoblacion'] = '') and
           (Trim(Request.ContentFields.Values['edPoblacion']) = '') then
        sError := 'La poblaci�n es obligatoria'
      else if Trim(Request.ContentFields.Values['edCP']) = '' then
        sError := 'El C�digo Postal es obligatorio'
      else if not CPCorrecto(Trim(Request.ContentFields.Values['edCP'])) then
        sError := 'El C�digo Postal no es correcto';
    end;

    if (sError = '') then begin
      if Trim(Request.ContentFields.Values['edNombreVia']) = '' then
        sError := 'El nombre de la v�a es obligatorio'
      else if Trim(Request.ContentFields.Values['edNumero']) = '' then
        sError := 'El n�mero es obligatorio'
      else if (Request.ContentFields.Values['rbFormaEnvio'] = 'id_cliente') or
           (Request.ContentFields.Values['rbFormaEnvio'] = '')then
        sError := 'Hay que seleccionar una forma de env�o';
    end;
  end;

  if (sError <> '') and (Trim(Request.ContentFields.Values['cbProvincia']) <> '') then begin
    FsErrorMail := sError;
    lErrorMail := True;
    Response.ContentType := 'text/html';
    if Request.QueryFields.Values['subject'] = 'p' then
      Response.Content := htmlwMailPresupuesto.Content
    else
      Response.Content := htmlwMail.Content;
    Exit;
  end;

  if sError = '' then begin
    smtp.PostMessage.ReplyTo := WebATexto(Request.ContentFields.Values['edResponder']);
    if Request.QueryFields.Values['subject'] = 'productos' then begin
      smtp.PostMessage.ToBlindCarbonCopy.CommaText := 'ventaweb@ranning.com,' +
        smtp.PostMessage.ReplyTo;
      smtp.PostMessage.Subject := 'Pedido (' + FormatDateTime('yyyymmddhhnn',Now) + ')';
    end
    else if Request.QueryFields.Values['subject'] = 'quienes_somos' then begin
      smtp.PostMessage.ToBlindCarbonCopy.Text := 'ventaweb@ranning.com';
      smtp.PostMessage.Subject := 'Consulta (' + FormatDateTime('yyyymmddhhnn',Now) + ')';
    end
    else if Request.QueryFields.Values['subject'] = 'masajista' then begin
      smtp.PostMessage.ToBlindCarbonCopy.Text := 'masajista@ranning.com';
      smtp.PostMessage.Subject := 'Consulta masajista (' +
        FormatDateTime('yyyymmddhhnn',Now) + ')';
    end
    else if Request.QueryFields.Values['subject'] = 'viajes' then begin
      smtp.PostMessage.ToBlindCarbonCopy.Add('viajes@ranning.com');
      smtp.PostMessage.ToBlindCarbonCopy.Add('fibratec@fibratecsport.com');
      smtp.PostMessage.Subject := 'Consulta viajes (' +
        FormatDateTime('yyyymmddhhnn',Now) + ')';
    end
    else if Request.QueryFields.Values['subject'] = 'articulos' then begin
      smtp.PostMessage.ToBlindCarbonCopy.Text := 'latienda@ranning.com';
      smtp.PostMessage.Subject := 'Articulo (' +
        FormatDateTime('yyyymmddhhnn',Now) + ')';
    end
    else if Request.QueryFields.Values['subject'] = 'fotos' then begin
      smtp.PostMessage.ToBlindCarbonCopy.Text := 'latienda@ranning.com';
      smtp.PostMessage.Subject := 'Foto (' + FormatDateTime('yyyymmddhhnn',Now) + ')';
    end
    else begin
      smtp.PostMessage.ToBlindCarbonCopy.Text := 'ventaweb@ranning.com';
      smtp.PostMessage.Subject := '(' + FormatDateTime('yyyymmddhhnn',Now) + ')';
    end;
    sFestivo := DiaFestivo;
    if Request.QueryFields.Values['subject'] <> 'p' then begin
      if (not EsVacaciones) and (DiaFestivo = '') then
        smtp.PostMessage.Body.Text := ''
      else if EsVacaciones then
        smtp.PostMessage.Body.Text := 'Estamos de vacaciones desde el ' +
          FormatDateTime('dddddd',sqlVacaciones.FieldByName('f_desde').AsDateTime) +
          ' hasta el ' + FormatDateTime('dddddd',
          sqlVacaciones.FieldByName('f_hasta').AsDateTime) + ' ambos inclusive, ' +
          'de modo que puede que no te contestemos hasta la vuelta. Perd�n por ' +
          'las molestias.'
      else if DiaFestivo <> '' then
        smtp.PostMessage.Body.Text := 'El d�a ' +
          sqlFestivos.FieldByName('f_festivo').AsString + ' es ' + sFestivo +
          ', de modo que puede que no te contestemos hasta el d�a siguiente. ' +
          'Perd�n por las molestias.';
    end;
    if Request.QueryFields.Values['subject'] = 'productos' then begin
      smtp.PostMessage.Body.Add('');
      smtp.PostMessage.Body.Add('Este correo es un resumen del pedido que acabas ' +
        'de realizar en nuestra p�gina. Una copia de este correo nos llegar� a ' +
        'nosotros y te contestaremos tras comprobar que tenemos disponibles todos ' +
        'los productos que nos has pedido, envi�ndote otro correo con un ' +
        'presupuesto de la compra que has hecho, incluyendo los gastos de env�o.');
      smtp.PostMessage.Body.Add('Hasta que no confirmes el pedido tras recibir ' +
      'el presupuesto en ese segundo correo, no podremos envi�rtelo.');
    end;
    if Request.QueryFields.Values['subject'] <> 'p' then begin
      smtp.PostMessage.Body.Add('');
      smtp.PostMessage.Body.Add(WebATexto(Request.ContentFields.Values['meMail']));
    end;
    if Request.QueryFields.Values['subject'] = 'productos' then begin
      smtp.PostMessage.Body.Add('');
      smtp.PostMessage.Body.Add('Pincha o copia este enlace si quieres ver ' +
        'el estado de tu pedido: http://www.ranning.com/cgi-bin/' +
        'wwwCarrito.exe/wcarrito?ver_id=' + Request.CookieFields.Values['id_cw']);
      smtp.PostMessage.Body.Add('');
      smtp.PostMessage.Body.Add('id_cliente_web: ' +
        Request.CookieFields.Values['id_cw']);
      smtp.PostMessage.Body.Add('');
      smtp.PostMessage.Body.Add('Nombre: ' +
        UpperCaseFirstAll(Request.ContentFields.Values['edNombre'] + ' ' +
        Request.ContentFields.Values['edApellido1'] + ' ' +
        Request.ContentFields.Values['edApellido2']));
      smtp.PostMessage.Body.Add('NIF: ' +
        UpperCase(Request.ContentFields.Values['edDNI']));
      smtp.PostMessage.Body.Add('Direcci�n: ' +
        UpperCaseFirstAll(Request.ContentFields.Values['cbTipoVia'] + ' ' +
        Request.ContentFields.Values['edNombreVia'] + ' ' +
        Request.ContentFields.Values['edNumero'] + ', ' +
        Request.ContentFields.Values['meDireccion']));
      smtp.PostMessage.Body.Add('CP: ' + Request.ContentFields.Values['edCP']);
      smtp.PostMessage.Body.Add('Municipio: ' +
        Municipio(Request.ContentFields.Values['cbProvincia'],
        Request.ContentFields.Values['cbPoblacion']) + ' (' +
        Provincia(Request.ContentFields.Values['cbProvincia']) + ')');
      smtp.PostMessage.Body.Add('Tel�fono: ' +
        Request.ContentFields.Values['edTelefono']);
      smtp.PostMessage.Body.Add('');
      smtp.PostMessage.Body.Add('Forma de env�o: ' +
        DescFormaEnvio(Request.ContentFields.Values['rbFormaEnvio']));
      smtp.PostMessage.Body.Add('');
      smtp.PostMessage.Body.Add(DatosCarritoATexto(
        Request.CookieFields.Values['id_cw']));
    end;
    smtp.PostMessage.ToAddress.CommaText := WebATexto(Request.ContentFields.Values['edPara']);

    if Trim(smtp.PostMessage.Body.Text) <> '' then begin
      try
        smtp.Connect;
        try
          if not lErrorMail then smtp.SendMail;
        finally
          if smtp.Connected then smtp.Disconnect;
        end;
      except
        on E: Exception do begin
          FsErrorMail := E.ClassName + ' [' + E.Message + ']';
          lErrorMail := True;
        end;
      end;
    end;
  end;

  if sError <> '' then begin
    FsErrorMail := sError;
    lErrorMail := True;
  end
  else if Trim(smtp.PostMessage.Body.Text) = '' then begin
    FsErrorMail := 'El texto del mensaje est� vac�o';
    lErrorMail := True;
  end;

  Response.ContentType := 'text/html';
  if Request.QueryFields.Values['subject'] = 'productos' then begin
    htmlwMailOk.HTMLFile := PATH_PLANTILLAS + 'wmail_pedido_ok.php';
    if lErrorMail then
      Response.Content := htmlwMail.Content
    else
      Response.Content := htmlwMailOk.Content;
  end
  else
    Response.Content := htmlwMail.Content;
end;

function TdmMail.WebATexto(const sMail: string): string;

var
  sTexto: string;
  {
  nPos: Integer;
  sHex: string;
  }

begin
  sTexto := sMail;
  {
  sTexto := StringReplace(sMail,'+',' ',[rfReplaceAll]);
  nPos := Pos('%',sTexto);
  while nPos <> 0 do begin
    sHex := Copy(sTexto,nPos,3);
    sTexto :=
      StringReplace(sTexto,sHex,Chr(StrToInt(HexDisplayPrefix + Copy(sHex,2,2))),
      [rfReplaceAll]);
    nPos := Pos('%',sTexto);
  end;
  }
  Result := sTexto;
end;

procedure TdmMail.htmlwMailHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'error' then begin
    if Request.MethodType <> mtGet then begin
      TagParams.Values['size'] := IntToStr(Length(FsErrorMail));
      TagParams.Values['value'] := FsErrorMail;
      ReplaceText := '<br>' + SALTO_LINEA + '<input' +
        StringListToParamString(TagParams) + '>' + SALTO_LINEA + '<br><br>';
    end
    else
      ReplaceText := '';
  end
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'texto' then begin
    if lErrorMail and (Request.MethodType <> mtGet) then
      ReplaceText := '<textarea' + StringListToParamString(TagParams) + '>' +
        WebATexto(Request.ContentFields.Values['meMail']) + '</textarea>'
    else if Request.QueryFields.Values['subject'] = 'productos' then
      ReplaceText := '<textarea' + StringListToParamString(TagParams) + '>' +
        'Si quieres comentarnos algo acerca del pedido hazlo a continuaci�n: ' +
        '</textarea>'
    else
      ReplaceText := '<textarea' + StringListToParamString(TagParams) + '>' +
        '</textarea>';
  end
  else if LowerCase(TagString) = 'copia_para' then begin
    if lErrorMail then begin
      TagParams.Values['value'] := Request.ContentFields.Values['edPara'];
      ReplaceText := '<input' + StringListToParamString(TagParams) + '>';
    end
    else
      ReplaceText := '<input' + StringListToParamString(TagParams) + '>';
  end
  else if LowerCase(TagString) = 'responder' then begin
    if lErrorMail or (Request.QueryFields.Values['id_cli'] = '1') then
      ReplaceText := '<input' + StringListToParamString(TagParams) +
        'value="' + Request.ContentFields.Values['edResponder'] + '">'
    else
      ReplaceText := '<input' + StringListToParamString(TagParams) + '">';
  end
  else if LowerCase(TagString) = 'datos_envio' then
    ReplaceText := DatosEnvio
  else if LowerCase(TagString) = 'texto_obligatorio' then begin
    if Request.QueryFields.Values['subject'] = 'productos' then
      ReplaceText := ''
    else
      ReplaceText := CAMPO_OBLIGATORIO;
  end
  else if LowerCase(TagString) = 'clase_oculta' then begin
    if Request.QueryFields.Values['subject'] = 'productos' then
      ReplaceText := ''
    else
      ReplaceText := 'no_visible';
  end
  else if LowerCase(TagString) = 'vacaciones' then
    ReplaceText := TextoVacaciones;
end;

procedure TdmMail.smtpSuccess(Sender: TObject);

var
  sId: string;
  sIdMuni: string;
  sDsMuni: string;
  sIdProv: string;
  sCP: string;
  nPos: Integer;

begin
  FsErrorMail := 'El correo se envi� correctamente';
  lErrorMail := False;
  sId := Request.CookieFields.Values['id_cw'];
  if (sId <> '') and (Request.QueryFields.Values['subject'] = 'productos') and
     (not ExisteClienteWeb) then begin
    sIdMuni := Request.ContentFields.Values['cbPoblacion'];
    sDsMuni := Trim(Request.ContentFields.Values['edPoblacion']);
    sIdProv := Request.ContentFields.Values['cbProvincia'];
    sCP := Trim(Request.ContentFields.Values['edCP']);
    sqlCarritoPresupuesto.ParamByName('id_cliente_web').AsString := sId;
    sqlCarritoPresupuesto.ParamByName('id_estado_pedido').AsInteger := 1;
    sqlCarritoPresupuesto.ParamByName('f_fecha_compra').AsDateTime := Now;
    sqlCarritoPresupuesto.ParamByName('ds_primer_apellido').AsString :=
      UpperCaseFirstAll(Trim(Request.ContentFields.Values['edApellido1']));
    sqlCarritoPresupuesto.ParamByName('ds_segundo_apellido').AsString :=
      UpperCaseFirstAll(Trim(Request.ContentFields.Values['edApellido2']));
    sqlCarritoPresupuesto.ParamByName('ds_nombre').AsString :=
      UpperCaseFirstAll(Trim(Request.ContentFields.Values['edNombre']));
    sqlCarritoPresupuesto.ParamByName('ds_email').AsString :=
      LowerCase(Trim(Request.ContentFields.Values['edResponder']));
    sqlCarritoPresupuesto.ParamByName('it_canarias').AsString :=
      CAMPO_NO_MARCADO;
    sqlCarritoPresupuesto.ParamByName('ds_cp').AsString := sCP;
    sqlCarritoPresupuesto.ParamByName('id_provincia').AsString := sIdProv;
    if sIdMuni <> '' then begin
      if Length(sCP) > Length(CP(sIdProv,sIdMuni)) then
        EnviaCorreoCPMunicipio(sIdProv,sIdMuni,sCP);
      sqlCarritoPresupuesto.ParamByName('id_municipio').AsString := sIdMuni;
      sqlCarritoPresupuesto.ParamByName('ds_municipio').AsString :=
        Municipio(sIdProv,sIdMuni);
    end
    else begin
      sqlCarritoPresupuesto.ParamByName('id_municipio').AsString := '';
      sqlCarritoPresupuesto.ParamByName('ds_municipio').AsString :=
        UpperCaseFirstAll(sDsMuni);
    end;
    sqlCarritoPresupuesto.ParamByName('ds_resto_direccion').AsString :=
      UpperCaseFirstAll(Trim(Request.ContentFields.Values['meDireccion']));
    sqlCarritoPresupuesto.ParamByName('id_tipo_via').AsString :=
      Request.ContentFields.Values['cbTipoVia'];
    sqlCarritoPresupuesto.ParamByName('ds_nombre_via').AsString :=
      UpperCaseFirstAll(Trim(Request.ContentFields.Values['edNombreVia']));
    sqlCarritoPresupuesto.ParamByName('ds_numero').AsString :=
      UpperCase(Trim(Request.ContentFields.Values['edNumero']));
    sqlCarritoPresupuesto.ParamByName('ds_dni').AsString :=
      NormalizaNIF(Request.ContentFields.Values['edDNI']);
    sqlCarritoPresupuesto.ParamByName('ds_telefono').AsString :=
      Trim(Request.ContentFields.Values['edTelefono']);
    nPos := Pos('-',Request.ContentFields.Values['rbFormaEnvio']);
    sqlCarritoPresupuesto.ParamByName('id_cliente').AsInteger :=
      StrToIntDef(Request.QueryFields.Values['id_cliente'],0);
    sqlCarritoPresupuesto.ParamByName('id_agencia_transporte').AsString :=
      Copy(Request.ContentFields.Values['rbFormaEnvio'],1,nPos - 1);
    sqlCarritoPresupuesto.ParamByName('id_forma_pago').AsString :=
      ToEnd(Request.ContentFields.Values['rbFormaEnvio'],nPos + 1);
    sqlCarritoPresupuesto.ParamByName('nm_gastos_envio').AsFloat :=
      GastosEnvio(Request.ContentFields.Values['rbFormaEnvio']);
    sqlCarritoPresupuesto.ParamByName('ds_observaciones').AsString :=
      WebATexto(Trim(Request.ContentFields.Values['meMail']));
    sqlCarritoPresupuesto.ExecSQL;
    ResetIDClient(Response);
  end;
end;

procedure TdmMail.WebModuleCreate(Sender: TObject);
begin
  FsErrorMail := '';
  lErrorMail := False;
  htmlwMail.HTMLFile := PATH_PLANTILLAS + 'wmail.php';
  htmlwMailPresupuesto.HTMLFile := PATH_PLANTILLAS + 'wmail_presupuesto.php';
  htmlwMailCliente.HTMLFile := PATH_PLANTILLAS + 'wmail_cliente.php';
  htmlwMailExt.HTMLFile := PATH_PLANTILLAS + 'wmail_externo.php';
end;

procedure TdmMail.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmMail.WebModuleDestroy(Sender: TObject);
begin
  dbRanning.Disconnect;
end;

function TdmMail.DatosEnvio: string;

var
  sEnvio: string;
  sCP: string;
  lExtr: Boolean;
  sProv: string;
  sMuni: string;
  sMuniCP: string;

begin
  Result := '';
  if Request.QueryFields.Values['subject'] <> 'productos' then Exit;

  lExtr := Request.ContentFields.Values['cbExtranjero'] = '1';
  if not lExtr then begin
    sProv := Trim(Request.ContentFields.Values['cbProvincia']);
    sMuni := Trim(Request.ContentFields.Values['cbPoblacion']);
    sCP := Trim(Request.ContentFields.Values['edCP']);
    if Copy(Trim(sCP),1,2) <> Copy(sProv,1,2) then
      sCP := '';
    if (sProv <> '') and (sMuni <> '') then begin
      sMuniCP := CP(sProv,sMuni);
      if (Length(sMuniCP) > Length(sCP)) then sCP := sMuniCP;
    end
    else if (sCP = '') and (sProv <> '') then
      sCP := Copy(sProv,1,2);
  end;

  if lErrorMail or (Trim(Request.QueryFields.Values['id_cliente']) <> '') then begin
    sEnvio := '<br><br>' + SALTO_LINEA + 'Nombre ' + CAMPO_OBLIGATORIO + '&nbsp;' +
      SALTO_LINEA + '<input name="edNombre" size="30" value="' +
      Request.ContentFields.Values['edNombre'] + '">' + SALTO_LINEA + '<br><br>' +
      SALTO_LINEA + 'Primer apellido ' + CAMPO_OBLIGATORIO + '&nbsp;' + SALTO_LINEA +
      '<input name="edApellido1" size="30" value="' +
      Request.ContentFields.Values['edApellido1'] + '">' + SALTO_LINEA +
      '&nbsp;&nbsp;Segundo apellido&nbsp;' + SALTO_LINEA +
      '<input name="edApellido2" size="30" value="' +
      Request.ContentFields.Values['edApellido2'] + '">' + SALTO_LINEA +
      '<br><br>' + SALTO_LINEA + OpcionTiposSexo(Request.ContentFields) +
      SALTO_LINEA + '<br><br>' + SALTO_LINEA;
    if not lExtr then
      sEnvio := sEnvio + '<input name="cbExtranjero" type="checkbox" value="1"' +
        ' onchange="javascript:submit();">'
    else
      sEnvio := sEnvio + '<input name="cbExtranjero" checked type="checkbox" value="1"' +
        ' onchange="javascript:submit();">';
    sEnvio := sEnvio + '&nbsp;&nbsp;Marca esta casilla si la direcci�n de env�o es ' +
      'de fuera de Espa�a' + SALTO_LINEA + '<br><br>' + SALTO_LINEA;
    if not lExtr then begin
      sEnvio := sEnvio + 'DNI ' + CAMPO_OBLIGATORIO + '&nbsp;' + SALTO_LINEA +
        '<input name="edDNI" size="15" value="' +
        Request.ContentFields.Values['edDNI'] + '">' + SALTO_LINEA +
        '&nbsp;&nbsp;Tel�fono de contacto ' + CAMPO_OBLIGATORIO + '&nbsp;' +
        SALTO_LINEA + '<input name="edTelefono" size="40" value="' +
        Request.ContentFields.Values['edTelefono'] + '">' + SALTO_LINEA +
        '<br><br>' + SALTO_LINEA + '<table><tr><td class="fuente_pequena">' +
        'Provincia ' + CAMPO_OBLIGATORIO + '</td><td class="fuente_pequena">';
      if sProv <> '' then sEnvio := sEnvio + 'Poblaci�n ' + CAMPO_OBLIGATORIO;
      sEnvio := sEnvio + '</td><td></td></tr>' + SALTO_LINEA +
        '<tr><td>' + SALTO_LINEA + OpcionProvicias(Request.ContentFields) +
        '</td><td>' + SALTO_LINEA + OpcionMunicipios(Request.ContentFields) + '</td>';
      if (sProv <> '') and (sMuni = '') then
        sEnvio := sEnvio + '<td class="fuente_pequena">' + SALTO_LINEA +
          'Si no encuentras tu poblaci�n escr�bela aqu� ' + CAMPO_OBLIGATORIO +
          SALTO_LINEA + '<br>' + '<input name="edPoblacion" size="50" value="' +
          Request.ContentFields.Values['edPoblacion'] + '"></td>'
      else
        sEnvio := sEnvio + '<td></td>';
      sEnvio := sEnvio + '</tr></table>' + SALTO_LINEA + '<br>' +
        'C�digo postal ' + CAMPO_OBLIGATORIO + '&nbsp;' + SALTO_LINEA +
        '<input name="edCP" size="10" value="' + sCP + '">' + SALTO_LINEA +
        '<br><br>' + SALTO_LINEA;
    end;
    sEnvio := sEnvio + 'Tipo de v�a ' + CAMPO_OBLIGATORIO + SALTO_LINEA +
      OpcionTiposVia(Request.ContentFields) + SALTO_LINEA + '<br><br>' +
      SALTO_LINEA + 'Nombre de la v�a ' + CAMPO_OBLIGATORIO +
      ' <input name="edNombreVia" size="35" value="' +
      Request.ContentFields.Values['edNombreVia'] + '">' + SALTO_LINEA +
      '&nbsp;&nbsp;N�mero ' + CAMPO_OBLIGATORIO +
      ' <input name="edNumero" size="5" value="' +
      Request.ContentFields.Values['edNumero'] + '">' + SALTO_LINEA + '<br><br>' +
      'Resto de la direcci�n (escalera, puerta, etc.)' + SALTO_LINEA + '<br>' +
      SALTO_LINEA + '<input name="meDireccion" size="80" value="' +
      Request.ContentFields.Values['meDireccion'] + '">' + SALTO_LINEA +
      '<br><br>' + SALTO_LINEA + 'Forma de env�o ' + CAMPO_OBLIGATORIO +
      SALTO_LINEA + '<br>' + SALTO_LINEA +
      FormasEnvio(lExtr,Request.ContentFields.Values['cbProvincia']);
  end
  else begin
    sEnvio := '<br><br>' + SALTO_LINEA + 'Nombre ' + CAMPO_OBLIGATORIO +
      '&nbsp;' + SALTO_LINEA + '<input name="edNombre" size="30">' +
      SALTO_LINEA + '<br><br>' + SALTO_LINEA + 'Primer apellido ' +
      CAMPO_OBLIGATORIO + '&nbsp;' + SALTO_LINEA +
      '<input name="edApellido1" size="30">' + SALTO_LINEA +
      '&nbsp;&nbsp;Segundo apellido&nbsp;' + SALTO_LINEA +
      '<input name="edApellido2" size="30">' + SALTO_LINEA + '<br><br>' +
      SALTO_LINEA + OpcionTiposSexo(Request.ContentFields) + SALTO_LINEA +
      '<br><br>' + SALTO_LINEA;
    if not lExtr then
      sEnvio := sEnvio + '<input name="cbExtranjero" type="checkbox" value="1"' +
        ' onchange="javascript:submit();">'
    else
      sEnvio := sEnvio + '<input name="cbExtranjero" checked type="checkbox" value="1"' +
        ' onchange="javascript:submit();">';
    sEnvio := sEnvio + '&nbsp;&nbsp;Marca esta casilla si la direcci�n de env�o es ' +
      'de fuera de Espa�a' + SALTO_LINEA + '<br><br>' + SALTO_LINEA;
    if not lExtr then
      sEnvio := sEnvio + 'DNI ' + CAMPO_OBLIGATORIO + '&nbsp;' + SALTO_LINEA +
        '<input name="edDNI" size="15">' + SALTO_LINEA +
        '&nbsp;&nbsp;Tel�fono de contacto ' + CAMPO_OBLIGATORIO + '&nbsp;' +
        SALTO_LINEA + '<input name="edTelefono" size="40">' + SALTO_LINEA +
        '<br><br>' + '<table><tr><td class="fuente_pequena">Provincia ' +
        CAMPO_OBLIGATORIO + '</td>' + '<td class="fuente_pequena">';
      if sProv <> '' then sEnvio := sEnvio + 'Poblaci�n ' + CAMPO_OBLIGATORIO;
      sEnvio := sEnvio + '</td><td></td></tr>' + SALTO_LINEA +
        '<tr><td>' + SALTO_LINEA + OpcionProvicias(Request.ContentFields) +
        '</td><td>' + SALTO_LINEA + OpcionMunicipios(Request.ContentFields) + '</td>';
      if (sProv <> '') and (sMuni = '') then
        sEnvio := sEnvio + '<td class="fuente_pequena">' + SALTO_LINEA +
          'Si no encuentras tu poblaci�n escr�bela aqu� ' + CAMPO_OBLIGATORIO +
          SALTO_LINEA + '<br>' + SALTO_LINEA + '<input name="edPoblacion" size="50">' +
          '</td>'
      else
        sEnvio := sEnvio + '<td></td>';
      sEnvio := sEnvio + '</tr></table>' + SALTO_LINEA + '<br><br>' + SALTO_LINEA +
        'C�digo postal ' + CAMPO_OBLIGATORIO + '&nbsp;' + SALTO_LINEA +
        '<input name="edCP" size="10">' + SALTO_LINEA + '<br><br>' + SALTO_LINEA;
    sEnvio := sEnvio + 'Tipo de v�a ' + CAMPO_OBLIGATORIO + SALTO_LINEA +
      OpcionTiposVia(Request.ContentFields) + SALTO_LINEA + '<br><br>' +
      SALTO_LINEA + ' Nombre de la v�a ' + CAMPO_OBLIGATORIO +
      ' <input name="edNombreVia" size="35">' + SALTO_LINEA +
      '&nbsp;&nbsp;N�mero ' + CAMPO_OBLIGATORIO + ' <input name="edNumero" size="5">' +
      SALTO_LINEA + '<br><br>' + 'Resto de la direcci�n (escalera, puerta, etc.)' +
      SALTO_LINEA + '<br>' + SALTO_LINEA +
      '<input name="meDireccion" size="80">' + SALTO_LINEA + '<br><br>' +
      SALTO_LINEA + 'Forma de env�o ' + CAMPO_OBLIGATORIO + SALTO_LINEA + '<br>' +
      SALTO_LINEA + FormasEnvio(lExtr,Request.ContentFields.Values['cbProvincia']);
  end;

  Result := sEnvio;
end;

procedure TdmMail.htmlwMailPresupuestoHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'fichero' then
    ReplaceText := Request.QueryFields.Values['f']
  else if LowerCase(TagString) = 'clase_oculta' then begin
    if Request.ContentFields.Values['rbConfirmacion'] = PEDIDO_CONFIRMADO then
      ReplaceText := ''
    else
      ReplaceText := 'no_visible';
  end
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'clase_oculta_2' then begin
    if Request.ContentFields.Values['rbConfirmacion'] = '' then
      ReplaceText := ''
    else
      ReplaceText := 'no_visible';
  end
  else if LowerCase(TagString) = 'clase_oculta_3' then begin
    if Request.ContentFields.Values['rbConfirmacion'] = PEDIDO_ANULADO then
      ReplaceText := ''
    else
      ReplaceText := 'no_visible';
  end
  else if LowerCase(TagString) = 'email' then
    ReplaceText := Request.QueryFields.Values['e'];
end;

function TdmMail.ExisteClienteWeb: Boolean;

var
  sId: string;

begin
  Result := False;
  sId := Request.CookieFields.Values['id_cw'];
  if sId = '' then Exit;

  sqlClienteExiste.ParamByName('id_cliente_web').AsString := sId;
  sqlClienteExiste.ExecSQL;

  Result := not sqlClienteExiste.IsEmpty;
end;

function TdmMail.CPCorrecto(const sCP: string): Boolean;

var
  nCP: Integer;

begin
  nCP := StrToIntDef(Trim(sCP),-1);
  if (nCP = -1) or (Length(sCP) <> 5) then begin
    Result := False;
    Exit;
  end;

  if not sqlProvincias.Active then sqlProvincias.Open;
  Result :=
    sqlProvincias.Locate('id_provincia',Copy(PadLeft(IntToStr(nCP),'0',5),1,2),[]) and
    (Request.ContentFields.Values['cbProvincia'] =
    Copy(PadLeft(IntToStr(nCP),'0',5),1,2));
end;

function TdmMail.DatosCarritoATexto(const sIdCliente: string): string;

var
  sCarrito: string;
  rTotal: Extended;

begin
  sCarrito := 'Los art�culos que nos has pedido son:' + SALTO_LINEA + SALTO_LINEA;
  rTotal := 0;
  if sqlCarrito.Active then sqlCarrito.Close;
  sqlCarrito.ParamByName('id_cliente_web').AsString :=
    Request.CookieFields.Values['id_cw'];
  sqlCarrito.Open;
  if sqlCarrito.IsEmpty then begin
    Result := 'Pedido sin ning�n art�culo';
    Exit;
  end;

  sqlCarrito.First;
  while not sqlCarrito.Eof do begin
    sCarrito := sCarrito + sqlCarrito.FieldByName('ds_marca').AsString + ' ' +
      sqlCarrito.FieldByName('ds_producto').AsString + ' (' +
      sqlCarrito.FieldByName('ds_cod_producto').AsString + '-' +
      sqlCarrito.FieldByName('cd_color_fabricante').AsString + ') ' +
      DescColor(dbRanning,sqlCarrito.FieldByName('cd_color').AsString) + ' ' +
      sqlCarrito.FieldByName('ds_tipo_talla').AsString + ' ' +
      sqlCarrito.FieldByName('ds_talla').AsString + SALTO_LINEA + 'Unid: ' +
      sqlCarrito.FieldByName('nm_cantidad').AsString + ', PVP/unid: ' +
      sqlCarrito.FieldByName('nm_pvp').AsString + ' Euro, Desc: ' +
      sqlCarrito.FieldByName('nm_descuento').AsString + '%, PVP: ' +
      FloatToStrF(sqlCarrito.FieldByName('nm_precio_final').AsFloat,ffFixed,10,2) +
      ' Euro' + SALTO_LINEA + SALTO_LINEA;
      rTotal := rTotal + sqlCarrito.FieldByName('nm_precio_final').AsFloat;
    sqlCarrito.Next;
  end;

  Result := sCarrito + 'El total del pedido sin incluir gastos de env�o es de ' +
    FloatToStrF(rTotal,ffFixed,10,2) + ' Euro';
end;

function TdmMail.TextoVacaciones: string;

var
  sFestivo: string;

begin
  Result := '';
  sFestivo := DiaFestivo;
  if (not EsVacaciones) and (sFestivo = '') then Exit;

  if EsVacaciones then
    Result := '<p class="fuente_pequena fuente_roja">' + SALTO_LINEA +
      'Estamos de vacaciones desde el ' + '<font class="fuente_negrita">' +
      FormatDateTime('dddddd',sqlVacaciones.FieldByName('f_desde').AsDateTime) +
      '</font> hasta el <font class="fuente_negrita">' + FormatDateTime('dddddd',
      sqlVacaciones.FieldByName('f_hasta').AsDateTime) + '</font> ambos inclusive, ' +
      'de modo que puede que no te contestemos hasta la vuelta. Perd�n por las ' +
      'molestias.' + SALTO_LINEA + '</p>'
  else if sFestivo <> '' then
    Result := '<p class="fuente_pequena fuente_roja">' + SALTO_LINEA + 'El d�a ' +
      sqlFestivos.FieldByName('f_festivo').AsString + ' es ' + sFestivo +
      ', de modo que puede que no te contestemos hasta el d�a siguiente. ' +
      'Perd�n por las molestias.' + SALTO_LINEA + '</p>';
end;

function TdmMail.EsVacaciones: Boolean;
begin
  if sqlVacaciones.Active then sqlVacaciones.Close;
  sqlVacaciones.Open;

  Result := not sqlVacaciones.IsEmpty;
end;

function TdmMail.DiaFestivo: string;
begin
  Result := '';
  if sqlFestivos.Active then sqlFestivos.Close;
  sqlFestivos.Open;

  if sqlFestivos.IsEmpty then Exit;

  Result := sqlFestivos.FieldByName('ds_festivo').AsString;
end;

function TdmMail.OpcionProvicias(slValores: TStrings): string;

var
  sOpc: string;
  sProv: string;

begin
  sProv := slValores.Values['cbProvincia'];
  sOpc := '<select name="cbProvincia" size="8" onchange="javascript:submit();">' +
    SALTO_LINEA;
  if not sqlProvincias.Active then sqlProvincias.Open;
  sqlProvincias.First;
  while not sqlProvincias.Eof do begin
    if sqlProvincias.FieldByName('id_provincia').AsString <> sProv then
      sOpc := sOpc + '<option value="'
    else
      sOpc := sOpc + '<option selected value="';
    sOpc := sOpc + sqlProvincias.FieldByName('id_provincia').AsString + '">' +
      sqlProvincias.FieldByName('ds_provincia').AsString + '</opcion>' +
      SALTO_LINEA;
    sqlProvincias.Next;
  end;

  Result := sOpc + SALTO_LINEA + '</select>';
end;

function TdmMail.OpcionMunicipios(slValores: TStrings): string;

var
  sProv: string;
  sOpc: string;
  sMuni: string;

begin
  Result := '';
  sProv := slValores.Values['cbProvincia'];
  if sProv = '' then Exit;

  sMuni := slValores.Values['cbPoblacion'];
  if sqlMunicipios.Active then sqlMunicipios.Close;
  sqlMunicipios.ParamByName('id_provincia').AsString := sProv;
  sqlMunicipios.Open;
  sOpc := '<select name="cbPoblacion" size="8" onchange="javascript:submit();">' +
    SALTO_LINEA;
  if not sqlMunicipios.Active then sqlMunicipios.Open;
  sqlMunicipios.First;
  while not sqlMunicipios.Eof do begin
    if sqlMunicipios.FieldByName('id_municipio').AsString <> sMuni then
      sOpc := sOpc + '<option value="'
    else
      sOpc := sOpc + '<option selected value="';
    sOpc := sOpc + sqlMunicipios.FieldByName('id_municipio').AsString + '">' +
      sqlMunicipios.FieldByName('ds_municipio').AsString + '</opcion>' +
      SALTO_LINEA;
    sqlMunicipios.Next;
  end;

  Result := sOpc + SALTO_LINEA + '</select>';
end;

function TdmMail.Provincia(const sIdProv: string): string;
begin
  Result := '';
  if not sqlProvincias.Active then sqlProvincias.Open;

  if sqlProvincias.Locate('id_provincia',sIdProv,[]) then
    Result := sqlProvincias.FieldByName('ds_provincia').AsString;
end;

function TdmMail.Municipio(const sIdProv, sIdMuni: string): string;
begin
  Result := '';
  if sIdMuni = '' then begin
    Result := UpperCaseFirstAll(Trim(Request.ContentFields.Values['edPoblacion']));
    Exit;
  end;

  if sqlMunicipios.Active then sqlMunicipios.Close;
  sqlMunicipios.ParamByName('id_provincia').AsString := sIdProv;
  sqlMunicipios.Open;

  if sqlMunicipios.Locate('id_provincia,id_municipio',VarArrayOf([sIdProv,sIdMuni]),[]) then
    Result := sqlMunicipios.FieldByName('ds_municipio').AsString;
end;

function TdmMail.CP(const sIdProv, sIdMuni: string): string;
begin
  Result := sIdProv;
  if sqlCP.Active then sqlCP.Close;
  sqlCP.ParamByName('id_provincia').AsString := sIdProv;
  sqlCP.ParamByName('id_municipio').AsString := sIdMuni;
  sqlCP.Open;

  if not sqlCP.IsEmpty then
    Result := sqlCP.FieldByName('ds_cp').AsString;
end;

function TdmMail.OpcionTiposVia(slValores: TStrings): string;

var
  sOpc: string;
  sVia: string;

begin
  sVia := Trim(slValores.Values['cbTipoVia']);
  if sVia = '' then sVia := TIPO_VIA_CALLE;
  sOpc := '<select name="cbTipoVia">' + SALTO_LINEA;
  if not sqlTiposVia.Active then sqlTiposVia.Open;
  sqlTiposVia.First;
  while not sqlTiposVia.Eof do begin
    if sqlTiposVia.FieldByName('id_tipo_via').AsString <> sVia then
      sOpc := sOpc + '<option value="'
    else
      sOpc := sOpc + '<option selected value="';
    sOpc := sOpc + sqlTiposVia.FieldByName('id_tipo_via').AsString + '">' +
      sqlTiposVia.FieldByName('ds_tipo_via').AsString + '</opcion>' +
      SALTO_LINEA;
    sqlTiposVia.Next;
  end;

  Result := sOpc + SALTO_LINEA + '</select>';
end;

function TdmMail.DNICorrecto(const sDNI: string): Boolean;
begin
  Result := StrToIntDef(NormalizaNIF(sDNI),-1) = -1;
end;

procedure TdmMail.EnviaCorreoCPMunicipio(const sIdProv, sIdMuni,
  sCP: string);
begin
  smtpMuni.PostMessage.Subject := 'Municipio (' +
    FormatDateTime('yyyymmddhhnn',Now) + ')';
  smtpMuni.PostMessage.Body.Add('Provincia: ' + Provincia(sIdProv));
  smtpMuni.PostMessage.Body.Add('Municipio: ' + Municipio(sIdProv,sIdMuni));
  smtpMuni.PostMessage.Body.Add('CP: ' + sCP);
  try
    smtpMuni.Connect;
    try
      if not lErrorMail then smtpMuni.SendMail;
    finally
      if smtpMuni.Connected then smtpMuni.Disconnect;
    end;
  except
  end;
end;

function TdmMail.FormasEnvio(lExtranjero: Boolean; const sCdProvincia: string): string;

var
  sEnvio: string;
  sValor: string;
  sCheck: string;
  sGastosEnvio: string;
  rGastosEnvio: Extended;
  rGastosEnvioTotal: Extended;
  rComision: Extended;
  rFijo: Extended;
  rMinComision: Extended;
  rTotalPedido: extended;
  lActivo: Boolean;
  rSuplemento: Extended;

begin
  lActivo := True;
  if sqlTotalPedido.Active then sqlTotalPedido.Close;
  sqlTotalPedido.ParamByName('id_cliente_web').AsString :=
    Request.CookieFields.Values['id_cw'];
  sqlTotalPedido.Open;
  rTotalPedido := sqlTotalPedido.FieldByName('nm_total').AsFloat;
  if sqlFormasPago.Active then sqlFormasPago.Close;
  sqlFormasPago.Open;
  sqlFormasPago.First;
  if sqlGastosEnvio.Active then sqlGastosEnvio.Close;
  sqlGastosEnvio.ParamByName('nm_total').AsFloat := rTotalPedido;
  sqlGastosEnvio.Open;
  sEnvio := '<table class="gastos_envio">' + '<tr><th colspan="6">' +
    'Total del pedido (sin incluir los gastos de env�o) ' +
    FormatEuro(rTotalPedido) + '</th></tr>' + SALTO_LINEA + '<tr><th colspan="2">' +
    'Agencia</th><th>Forma de pago</th><th>Gastos de env�o</th>' +
    '<th class="fuente_roja">Comisi�n</th><th>Total</th></tr>' + SALTO_LINEA;
  sCheck := '';
  rGastosEnvio := 0;
  while not sqlFormasPago.Eof do begin
    rSuplemento := 0;
    if sCdProvincia <> '' then begin
      if sqlGastosEnvioSuplemento.Active then sqlGastosEnvioSuplemento.Close;
      sqlGastosEnvioSuplemento.ParamByName('id_provincia').AsString := sCdProvincia;
      sqlGastosEnvioSuplemento.Open;
      lActivo := sqlGastosEnvioSuplemento.IsEmpty or
        ItFieldMarked(sqlGastosEnvioSuplemento,'it_activo');
      rSuplemento := sqlGastosEnvioSuplemento.FieldByName('nm_suplemento').AsFloat;
    end;
    if lActivo then begin
      sEnvio := sEnvio + '<tr>';
      if (not lExtranjero) or (lExtranjero and ItFieldMarked(sqlFormasPago,'it_envio_extranjero')) then begin
        sValor := sqlFormasPago.FieldByName('id_agencia_transporte').AsString + '-' +
          sqlFormasPago.FieldByName('id_forma_pago').AsString;
        if Request.ContentFields.Values['rbFormaEnvio'] = sValor then
          sCheck := ' checked'
        else
          sCheck := '';

        sGastosEnvio := '';
        if not lExtranjero then begin
          rGastosEnvio := sqlFormasPago.FieldByName('nm_gastos_envio').AsFloat;
          if not ItFieldMarked(sqlGastosEnvio,'it_tarifa_normal') then
            rGastosEnvio := sqlGastosEnvio.FieldByName('nm_gastos_envio').AsFloat;
          sGastosEnvio := '';
          rComision := sqlFormasPago.FieldByName('nm_comision_reembolso').AsFloat;
          rFijo := sqlFormasPago.FieldByName('nm_fijo_reembolso').AsFloat;
          rMinComision := sqlFormasPago.FieldByName('nm_minimo_comision').AsFloat;
          if rFijo <> 0 then
            sGastosEnvio := FormatEuro(rFijo);
          if rComision <> 0 then begin
            if rFijo <> 0 then sGastosEnvio := sGastosEnvio + ' + ';
            sGastosEnvio := sGastosEnvio + FormateaPorcentaje(rComision,2) + ' %';
          end;
          rGastosEnvio := rGastosEnvio + rSuplemento;
          rGastosEnvioTotal := rGastosEnvio +
            Max((rGastosEnvio + rTotalPedido) * rComision / 100 + rFijo,rMinComision);
          if rMinComision <> 0 then
            sGastosEnvio := sGastosEnvio + ' (m�nimo de ' + FormatEuro(rMinComision) + ')';
        end;
        sEnvio := sEnvio + '<td><input name="rbFormaEnvio" type="radio" value="' +
          sValor + '"' + sCheck + '></td><td>' +
          sqlFormasPago.FieldByName('ds_agencia_transporte').AsString + '<td>' +
          sqlFormasPago.FieldByName('ds_forma_pago').AsString + '</td>' +
          '<td class="al_derecha">' +
          FormatEuro(rGastosEnvio) + '</td><td class="al_derecha fuente_roja">' +
          sGastosEnvio + '</td><td class="al_derecha fuente_negrita">' +
          FormatEuro(rGastosEnvioTotal) + '</td></tr>';
      end;
    end;
    sqlFormasPago.Next;
  end;
  sEnvio := sEnvio + '</table>';

  Result := sEnvio;
end;

function TdmMail.DescFormaEnvio(const sCdFormaEnvio: string): string;

var
  nPos: Integer;

begin
  Result := '';
  if sqlFormasPago.Active then sqlFormasPago.Close;
  sqlFormasPago.Open;
  nPos := Pos('-',sCdFormaEnvio);
  if sqlFormasPago.Locate('id_agencia_transporte,id_forma_pago',
     VarArrayOf([Copy(sCdFormaEnvio,1,nPos - 1),ToEnd(sCdFormaEnvio,nPos + 1)]),[]) then
    Result := sqlFormasPago.FieldByName('ds_envio').AsString;
end;

function TdmMail.GastosEnvio(const sCdFormaEnvio: string): Extended;

var
  nPos: Integer;

begin
  Result := 0;
  if sqlFormasPago.Active then sqlFormasPago.Close;
  sqlFormasPago.Open;
  nPos := Pos('-',sCdFormaEnvio);
  if sqlFormasPago.Locate('id_agencia_transporte,id_forma_pago',
     VarArrayOf([Copy(sCdFormaEnvio,1,nPos - 1),ToEnd(sCdFormaEnvio,nPos + 1)]),[]) then begin

    if sqlTotalPedido.Active then sqlTotalPedido.Close;
    sqlTotalPedido.ParamByName('id_cliente_web').AsString :=
      Request.CookieFields.Values['id_cw'];
    sqlTotalPedido.Open;
    if sqlGastosEnvio.Active then sqlGastosEnvio.Close;
    sqlGastosEnvio.ParamByName('nm_total').AsFloat :=
      sqlTotalPedido.FieldByName('nm_total').AsFloat;
    sqlGastosEnvio.Open;

    if ItFieldMarked(sqlGastosEnvio,'it_tarifa_normal') then
      Result := sqlFormasPago.FieldByName('nm_gastos_envio').AsFloat
    else
      Result := sqlGastosEnvio.FieldByName('nm_gastos_envio').AsFloat;
  end;
end;

function TdmMail.OpcionTiposSexo(slValores: TStrings): string;

var
  sAux: string;
  nSexo: Integer;

begin
  nSexo := StrToIntDef(slValores.Values['rbTipoSexo'],TIPO_SEXO_HOMBRE);
  sAux := '<input name="rbTipoSexo" type="radio" value="' +
    IntToStr(TIPO_SEXO_HOMBRE) + '"';
  if nSexo = TIPO_SEXO_HOMBRE then sAux := sAux + ' checked';
  sAux := sAux + '>&nbsp;' + SEXO_HOMBRE + '&nbsp;&nbsp;&nbsp;&nbsp;' +
    '<input name="rbTipoSexo" type="radio" value="' + IntToStr(TIPO_SEXO_MUJER) +
    '"';
  if nSexo = TIPO_SEXO_MUJER then sAux := sAux + ' checked';
  sAux := sAux + '>&nbsp;' + SEXO_MUJER;

  Result := sAux;
end;

procedure TdmMail.dmMailwactMailExtAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

var
  sError: string;

begin
  WriteClient(Request,Response);

  sError := '';
  if Trim(Request.ContentFields.Values['edResponder']) = '' then
    sError := 'La direcci�n de e-mail de respuesta es obligatoria'
  else if Pos('@',Request.ContentFields.Values['edResponder']) = 0 then
    sError := 'La direcci�n de e-mail de respuesta no es correcta';

  if sError = '' then begin
    AbreCorreoExterno;
    smtpExt.PostMessage.FromAddress := sqlCorreoExterno.FieldByName('ds_desde').AsString;
    smtpExt.PostMessage.Subject := sqlCorreoExterno.FieldByName('ds_asunto').AsString;
    smtpExt.PostMessage.ReplyTo :=
      WebATexto(Request.ContentFields.Values['edResponder']);
    smtpExt.PostMessage.ToAddress.CommaText :=
      WebATexto(Request.ContentFields.Values['edResponder']) + ',' +
      WebATexto(Request.ContentFields.Values['edPara']) + ',' +
      sqlCorreoExterno.FieldByName('ds_para').AsString;
    smtpExt.PostMessage.ToBlindCarbonCopy.CommaText :=
      sqlCorreoExterno.FieldByName('ds_cco').AsString;
    smtpExt.PostMessage.Body.Add(WebATexto(Request.ContentFields.Values['meMail']));
    smtpExt.UserID := sqlCorreoExterno.FieldByName('ds_smtp_user').AsString;
    smtpExt.Password := sqlCorreoExterno.FieldByName('ds_pwd').AsString;

    if Trim(smtpExt.PostMessage.Body.Text) <> '' then begin
      try
        smtpExt.Connect;
        try
          if not lErrorMail then smtpExt.SendMail;
        finally
          if smtpExt.Connected then smtpExt.Disconnect;
        end;
      except
        on E: Exception do begin
          FsErrorMail := E.ClassName + ' [' + E.Message + ']';
          lErrorMail := True;
        end;
      end;
    end;
  end;

  lErrorMail := False;
  if sError <> '' then begin
    FsErrorMail := sError;
    lErrorMail := True;
  end
  else if Trim(smtpExt.PostMessage.Body.Text) = '' then begin
    FsErrorMail := 'El texto del mensaje est� vac�o';
    lErrorMail := True;
  end;

  Response.ContentType := 'text/html';
  htmlwMailOk.HTMLFile := PATH_PLANTILLAS + 'wmail_externo_ok.php';
  if lErrorMail then
    Response.Content := htmlwMailExt.Content
  else
    Response.Content := htmlwMailOk.Content;
end;

procedure TdmMail.smtpExtSuccess(Sender: TObject);
begin
  FsErrorMail := 'El correo se envi� correctamente';
  lErrorMail := False;
end;

procedure TdmMail.htmlwMailExtHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'error' then begin
    if Request.MethodType <> mtGet then begin
      TagParams.Values['size'] := IntToStr(Length(FsErrorMail));
      TagParams.Values['value'] := FsErrorMail;
      ReplaceText := '<br>' + SALTO_LINEA + '<input' +
        StringListToParamString(TagParams) + '>' + SALTO_LINEA + '<br><br>';
    end
    else
      ReplaceText := '';
  end
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'texto' then begin
    if lErrorMail and (Request.MethodType <> mtGet) then
      ReplaceText := '<textarea' + StringListToParamString(TagParams) + '>' +
        WebATexto(Request.ContentFields.Values['meMail']) + '</textarea>'
    else
      ReplaceText := '<textarea' + StringListToParamString(TagParams) + '>' +
        '</textarea>';
  end
  else if LowerCase(TagString) = 'copia_para' then begin
    if lErrorMail then begin
      TagParams.Values['value'] := Request.ContentFields.Values['edPara'];
      ReplaceText := '<input' + StringListToParamString(TagParams) + '>';
    end
    else
      ReplaceText := '<input' + StringListToParamString(TagParams) + '>';
  end
  else if LowerCase(TagString) = 'responder' then begin
    if lErrorMail then
      ReplaceText := '<input' + StringListToParamString(TagParams) +
        'value="' + Request.ContentFields.Values['edResponder'] + '">'
    else
      ReplaceText := '<input' + StringListToParamString(TagParams) + '">';
  end
  else if LowerCase(TagString) = 'texto_obligatorio' then begin
    if Request.QueryFields.Values['subject'] = 'productos' then
      ReplaceText := ''
    else
      ReplaceText := CAMPO_OBLIGATORIO;
  end
  else if LowerCase(TagString) = 'titulo' then
    ReplaceText := TituloCorreoExterno;
end;

procedure TdmMail.AbreCorreoExterno;
begin
  if sqlCorreoExterno.Active then sqlCorreoExterno.Close;
  sqlCorreoExterno.ParamByName('id_correo_externo').AsString :=
    Request.QueryFields.Values['id_ce'];
  sqlCorreoExterno.Open;
end;

function TdmMail.TituloCorreoExterno: string;
begin
  AbreCorreoExterno;
  Result := sqlCorreoExterno.FieldByName('ds_titulo_formulario').AsString;
end;

procedure TdmMail.htmlwMailClienteHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);

const
  asCAMPOS: array[0..16] of string = ('ds_email','ds_dni','ds_nombre_esp',
    'ds_primer_apellido_esp','ds_segundo_apellido_esp','id_tipo_sexo','ds_telefono',
    'id_provincia','id_municipio','ds_municipio','ds_cp','id_tipo_via',
    'ds_nombre_via','ds_numero','ds_resto_direccion','ds_provincia','municipio');

var
  nIdDir: Integer;

begin
  nIdDir := StrToIntDef(Request.ContentFields.Values['rbIdDir'],0);
  if (Trim(Request.ContentFields.Values['edDNI2']) <> '') and (Length(NormalizaNIF(Request.ContentFields.Values['edDNI2'])) > 1)  then begin
    if sqlClientes.Active then sqlClientes.Close;
    sqlClientes.ParamByName('ds_dni').AsString :=
      NormalizaNIF(Request.ContentFields.Values['edDNI2']);
    sqlClientes.ParamByName('ds_email').AsString := '*';
    sqlClientes.Open;
    if (nIdDir = 0) and (sqlClientes.RecordCount = 1) then
      nIdDir := sqlClientes.FieldByName('id_direccion').AsInteger;
    if (nIdDir <> 0) and (sqlClientes.RecordCount > 1) then
      sqlClientes.Locate('id_direccion',nIdDir,[]);
  end
  else if (Trim(Request.ContentFields.Values['edEmail2']) <> '') and (Pos('@',Request.ContentFields.Values['edEmail2']) <> 0)  then begin
    if sqlClientes.Active then sqlClientes.Close;
    sqlClientes.ParamByName('ds_dni').AsString := '*';
    sqlClientes.ParamByName('ds_email').AsString :=
      Request.ContentFields.Values['edEmail2'];
    sqlClientes.Open;
    if (nIdDir = 0) and (sqlClientes.RecordCount = 1) then
      nIdDir := sqlClientes.FieldByName('id_direccion').AsInteger;
    if (nIdDir <> 0) and (sqlClientes.RecordCount > 1) then
      sqlClientes.Locate('id_direccion',nIdDir,[]);
  end;

  if LowerCase(TagString) = 'form_action' then
    ReplaceText := ''
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'clase_oculta' then
    ReplaceText := 'no_visible'
  else if LowerCase(TagString) = 'clase_oculta_varias_dir' then
    ReplaceText := 'no_visible'
  else if LowerCase(TagString) = 'eddni2' then begin
    if (Length(NormalizaNIF(Request.ContentFields.Values['edDNI2'])) > 1) then
      ReplaceText := Request.ContentFields.Values['edDNI2']
    else
      ReplaceText := '';
  end
  else if LowerCase(TagString) = 'edemail2' then begin
    if (Pos('@',Request.ContentFields.Values['edEmail2']) <> 0) then
      ReplaceText := Request.ContentFields.Values['edEmail2']
    else
      ReplaceText := '';
  end;

  if LowerCase(TagString) = 'vacaciones' then
    ReplaceText := TextoVacaciones
  else if (nIdDir <> 0) and (LowerCase(TagString) = 'clase_oculta') then
    ReplaceText := ''
  else if (nIdDir <> 0) and (LowerCase(TagString) = 'form_action') then
    ReplaceText := 'action="../wwwMail.exe/wmail?subject=productos&id_cliente=' +
      sqlClientes.FieldByName('id_cliente').AsString + '"'
  else if (sqlClientes.Active) and (PosArray(LowerCase(TagString),asCAMPOS) <> (Low(asCAMPOS) - 1)) then
    ReplaceText := sqlClientes.FieldByName(LowerCase(TagString)).AsString
  else if (nIdDir = 0) and (sqlClientes.Active) and (sqlClientes.RecordCount > 1) and (LowerCase(TagString) = 'clase_oculta_varias_dir') then
    ReplaceText := ''
  else if (nIdDir = 0) and (sqlClientes.Active) and (sqlClientes.RecordCount > 1) and (LowerCase(TagString) = 'varias_dir') then
    ReplaceText := VariasDireccionesCliente;
end;

function TdmMail.VariasDireccionesCliente: string;

const
  DIRECCIONES = '<tr>' + SALTO_LINEA +
		'<td class="fuente_pequena al_derecha"><label class="fuente_negrita">Direcci�n <#num_dir> <input type="radio" ' +
    'class="mail_cliente" name="rbIdDir" value="<#id_direccion>"<#dir_check>>' +
    '</label></td>' + SALTO_LINEA +
		'<td class="fuente_pequena al_izquierda"><input class="mail_cliente" ' +
    'name="cbTipoVia" value="<#id_tipo_via>" size="5" readonly>' + SALTO_LINEA +
		'<input class="mail_cliente" name="edNombreVia" value="<#ds_nombre_via>" ' +
    'size="50" readonly>' + SALTO_LINEA +
		'<input class="mail_cliente" name="edNumero" value="<#ds_numero>" size="5" ' +
    'readonly>' + SALTO_LINEA +
		'<input class="mail_cliente" name="meDireccion" value="<#ds_resto_direccion>"' +
    ' size="50" readonly></td>' + SALTO_LINEA +
		'</tr>' + SALTO_LINEA +
		'<tr>' + SALTO_LINEA +
		'<td class="fuente_pequena al_derecha">&nbsp;</td>' + SALTO_LINEA +
		'<td class="fuente_pequena al_izquierda"><input class="mail_cliente" ' +
    'name="edCP" value="<#ds_cp>" size="5" readonly>' + SALTO_LINEA +
		'<input class="mail_cliente" name="edPoblacion" value="<#municipio>" ' +
    'size="100" readonly>&nbsp;' + SALTO_LINEA +
		'<br><input class="mail_cliente" value="<#ds_provincia>" size="30" ' +
    'readonly></td>' + SALTO_LINEA +
    '</tr>' + SALTO_LINEA;

var
  sTabla: string;
  nCont: Integer;
  sDir: string;
  nDir: Integer;

begin
  sqlClientes.First;
  sTabla := '';
  nDir := 1;
  sDir := StringReplace(DIRECCIONES,'<#dir_check>',' checked',[]);
  sDir := StringReplace(sDir,'<#num_dir>',IntToStr(nDir),[]);
  while not sqlClientes.Eof do begin
    for nCont := 0 to sqlClientes.Fields.Count - 1 do
      sDir := StringReplace(sDir,'<#' + sqlClientes.Fields.Fields[nCont].FieldName +
        '>',sqlClientes.Fields.Fields[nCont].AsString,[rfReplaceAll,rfIgnoreCase]);

    sTabla := sTabla + sDir;
    Inc(nDir);
    sDir := StringReplace(DIRECCIONES,'<#dir_check>','',[]);
    sDir := StringReplace(sDir,'<#num_dir>',IntToStr(nDir),[]);
    sqlClientes.Next;
  end;

  Result := sTabla;
end;

procedure TdmMail.dmMailwactMailCienteAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WriteClient(Request,Response);

  Response.ContentType := 'text/html';
  Response.Content := htmlwMailCliente.Content;
end;

procedure TdmMail.dmMailwactMailPresupuestoAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if (Request.MethodType = mtPost) and (Request.ContentFields.Values['rbConfirmacion'] <> '') then begin
    WriteClient(Request,Response);
    smtp.PostMessage.ToBlindCarbonCopy.Text := 'ventaweb@ranning.com';
    smtp.PostMessage.ReplyTo := WebATexto(Request.QueryFields.Values['e']);
    if Request.ContentFields.Values['rbConfirmacion'] = PEDIDO_CONFIRMADO then begin
      smtp.PostMessage.Subject := 'Presupuesto confirmado';
      smtp.PostMessage.Body.Add('Fichero confirmado: ' +
        Request.QueryFields.Values['f']);
    end
    else if Request.ContentFields.Values['rbConfirmacion'] = PEDIDO_ANULADO then begin
      smtp.PostMessage.Subject := 'Presupuesto anulado';
      smtp.PostMessage.Body.Add('Fichero anulado: ' +
        Request.QueryFields.Values['f']);
    end;
    smtp.PostMessage.Body.Add('');
    smtp.PostMessage.Body.Add('e-mail de respuesta: ' +
      Request.QueryFields.Values['e']);

    try
      smtp.Connect;
      try
        if not lErrorMail then smtp.SendMail;
      finally
        if smtp.Connected then smtp.Disconnect;
      end;
    except
      on E: Exception do begin
        FsErrorMail := E.ClassName + ' [' + E.Message + ']';
        lErrorMail := True;
      end;
    end;
  end;

  Response.ContentType := 'text/html';
  Response.Content := htmlwMailPresupuesto.Content;
end;

procedure TdmMail.smtpConnect(Sender: TObject);
begin
  lErrorMail := False;
  TJAMSMTP(Sender).Authenticate;
end;

procedure TdmMail.smtpPwdAuthenticationFailed(Sender: TObject);
begin
  WriteLog('id_cliente_web: ' +
    Request.CookieFields.Values['id_cw'] + ' - ' +
    TJAMSMTP(Sender).PwdAuthenticationError);
  FsErrorMail := 'No se pudo conectar al servidor de correo';
  lErrorMail := True;
end;

procedure TdmMail.htmlwMailOkHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
end;

end.
