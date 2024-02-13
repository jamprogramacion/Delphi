unit udmPago;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, ZConnection, Db,
  ZAbstractRODataset, ZDataset;

type
  TdmPago = class(TWebModule)
    htmlwPago: TPageProducer;
    dbRanning: TZConnection;
    sqlTransaccionInsert: TZReadOnlyQuery;
    sqlIdTransaccion: TZReadOnlyQuery;
    htmlwTPV: TPageProducer;
    procedure WebModuleCreate(Sender: TObject);
    procedure dbRanningBeforeConnect(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure WebModuleBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlwTPVHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    function Firma(const sTransaccion, sImporte, sLocalizador: string): string;
    function PalabraClaveDes: string;
    function Peticion(const sTransaccion, sImporte, sLocalizador: string): string;
  public
    { Public declarations }
  end;

var
  dmPago: TdmPago;

implementation

{$R *.DFM}

uses
  uComun, uHashes, uCommon;

const
  CLAVE_BBVA = '75;03;0E;5E;55;2B;78;0A;77;7A;07;01;06;0E;07;00;75;68;6F;1E';
  CLAVE_RANNING = 'DAMjam92B84028687***';
  TERMINAL = '999999';
  COMERCIO = 'B8402868700001';
  MONEDA = '978';
  URL_TPV = 'https://w3.grupobbva.com/TLPV/tlpv/TLPV_pub_RecepOpModeloServidor';
  URL_RESP_TPV = 'http://www.ranning.com/cgi-bin/wwwPago.exe/wTPV';

{ TdmPago }

function TdmPago.Firma(const sTransaccion, sImporte, sLocalizador: string): string;

var
  sImp: string;
  nCont: Integer;

begin
  sImp := '';
  for nCont := 1 to Length(sImporte) do
    if sImporte[nCont] in ['0'..'9'] then sImp := sImp + sImporte[nCont];

  Result := UpperCase(SHA1DigestToHex(CalcSHA1(TERMINAL + COMERCIO + sTransaccion +
    sImp + MONEDA + sLocalizador + PalabraClaveDes)));
end;

function TdmPago.PalabraClaveDes: string;

var
  slLog: TJAMStringList;
  nCont: Integer;
  aBbva: array of Byte;
  aRanning: array of Byte;
  sPalabra: string;

begin
  slLog := TJAMStringList.Create;
  try
    slLog.SetExtendedText(CLAVE_BBVA,';',#0);
    SetLength(aBbva,slLog.Count);
    SetLength(aRanning,slLog.Count);
    sPalabra := '';
    for nCont := 0 to slLog.Count - 1 do begin
      aBbva[nCont] := ToDecimal(slLog[nCont],16);
      aRanning[nCont] := Ord(CLAVE_RANNING[nCont + 1]);
      sPalabra := sPalabra + Char(aBbva[nCont] xor aRanning[nCont]);
    end;
  finally
    slLog.Free;
  end;

  Result := sPalabra;
end;

procedure TdmPago.WebModuleCreate(Sender: TObject);
begin
  htmlwPago.HTMLFile := PATH_PLANTILLAS + 'wpago.htm';
  htmlwTPV.HTMLFile := PATH_PLANTILLAS + 'wtpv.htm';
end;

procedure TdmPago.dbRanningBeforeConnect(Sender: TObject);
begin
  dbRanning.HostName := BBDDHost;
  dbRanning.User := BBDD_USER;
  dbRanning.Password := BBDD_PWD;
  dbRanning.Database := BBDD_DB;
  dbRanning.Port := BBDD_PORT;
end;

procedure TdmPago.WebModuleDestroy(Sender: TObject);
begin
  dbRanning.Disconnect;
end;

procedure TdmPago.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

var
  sIdTr: string;

begin
  WriteLog('tpv.txt',Request.ContentFields.CommaText);
  WriteLog('tpv.txt',Request.QueryFields.CommaText);
  if Trim(Request.ContentFields.Values['id_cw']) = '' then Exit;

  sIdTr := '';
  if sqlIdTransaccion.Active then sqlIdTransaccion.Close;
  sqlIdTransaccion.ParamByName('ds_localizador').AsString :=
    Request.ContentFields.Values['id_cw'];
  sqlIdTransaccion.Open;
  if sqlIdTransaccion.RecordCount <> 0 then
    sIdTr := PadLeft(sqlIdTransaccion.FieldByName('id_transaccion').AsString,'0',12);

  if sIdTr = '' then begin
    sqlTransaccionInsert.ParamByName('nm_importe').AsString :=
      Request.ContentFields.Values['total'];
    sqlTransaccionInsert.ParamByName('ds_localizador').AsString :=
      Request.ContentFields.Values['id_cw'];
    sqlTransaccionInsert.ParamByName('f_transaccion').AsDateTime := Now;
    sqlTransaccionInsert.ExecSQL;

    if sqlIdTransaccion.Active then sqlIdTransaccion.Close;
    sqlIdTransaccion.ParamByName('ds_localizador').AsString :=
      Request.ContentFields.Values['id_cw'];
    sqlIdTransaccion.Open;
    sIdTr := PadLeft(sqlIdTransaccion.FieldByName('id_transaccion').AsString,'0',12);
  end;

  Request.ContentFields.Clear;
  Request.ContentFields.Add('peticion=' +
    Peticion(sIdTr,Request.ContentFields.Values['total'],
    Request.ContentFields.Values['id_cw']));

  WriteLog('tpv.txt',Request.ContentFields.CommaText);
  Response.Location := URL_TPV;
  Handled := True;
end;

function TdmPago.Peticion(const sTransaccion, sImporte,
  sLocalizador: string): string;
begin
  Result := '<tpv><oppago>' +
    '<modelopago>4</modelopago>' +
    '<idterminal>' + TERMINAL + '</idterminal>' +
    '<idcomercio>' + COMERCIO + '</idcomercio>' +
    '<idtransaccion>' + sTransaccion + '</idtransaccion>' +
    '<moneda>' + MONEDA + '</moneda>' +
    '<importe>' + sImporte + '</importe>' +
    '<urlcomercio>' + URL_RESP_TPV + '</urlcomercio>' +
    '<idioma>es</idioma><pais>ES</pais>' +
    '<urlredir>' + URL_RESP_TPV + '</urlredir>' +
    '<localizador>' + sLocalizador + '</localizador>' +
    '<firma>' + Firma(sTransaccion,sImporte,sLocalizador) + '</firma>' +
    '</oppago></tpv>';
end;                                                            

procedure TdmPago.htmlwTPVHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'url_desde' then
    ReplaceText := Request.RemoteHost
  else if LowerCase(TagString) = 'resp_tpv' then
    ReplaceText := StringReplace(
      StringReplace(Request.QueryFields.Values['peticion'],'<','',[rfReplaceAll]),
      '>','<br><br>',[rfReplaceAll]);
end;

end.
