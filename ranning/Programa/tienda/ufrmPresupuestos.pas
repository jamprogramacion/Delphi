unit ufrmPresupuestos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, Inifiles, StdCtrls, uJAMControls, Menus, Grids, DBGrids,
  JAMLabelEdit, db, DBCtrls, uJAMDBControls, ExtCtrls, uJAMContainers,
  JvComponentBase, JvMail;

type
  TEnvioCorreo = (ecNormal,ecPresupuestoAceptado,ecPedidoEnviado,ecDatosCliente,
    ecPresupuestoAnulado,ecPresupuestoPagado);

type
  TfrmPresupuestos = class(TfrmMDIChildBase)
    btnActualizar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btnExportar: TButton;
    btnBorrar: TButton;
    btnVerPdf: TButton;
    mnuPresupuestos: TPopupMenu;
    btnEmail: TButton;
    mnuAceptado: TMenuItem;
    dbgCarritoPresupuesto: TDBGrid;
    dbgCarrito: TDBGrid;
    cbSoloNoAceptados: TJAMCheckBox;
    edId: TJAMLabelEdit;
    btnBuscar: TButton;
    mnuEnviado: TMenuItem;
    mnuCopiarID: TMenuItem;
    mnuSubirAWeb: TMenuItem;
    btnVenta: TButton;
    mnuCodigoEnvio: TMenuItem;
    btnActualizar2: TButton;
    mnuTallas: TPopupMenu;
    mnuCopiarCodigoEnvio: TMenuItem;
    mnuCopiarEmail: TMenuItem;
    mnuEnviarCorreo: TMenuItem;
    btnVerHtml: TButton;
    mnuCanarias: TMenuItem;
    mnuCopiaEnlacePedido: TMenuItem;
    mnuEstadoInicial: TMenuItem;
    mnuAltaClienteAccess: TMenuItem;
    mnuAltaCliente: TMenuItem;
    mnuEditar: TMenuItem;
    mnuEnviarDatosCliente: TMenuItem;
    mnuVerDatosCliente: TMenuItem;
    mnuPresupuestoAnulado: TMenuItem;
    dbmObservaciones: TJAMDBMemo;
    Label3: TLabel;
    lblGrabaObs: TLabel;
    lblCancelaObs: TLabel;
    pnBotones: TJAMPanel;
    btnBorraProducto: TJAMButton;
    btnCantidad: TJAMButton;
    edCantidad: TJAMNumberEdit;
    btnCambiaTalla: TJAMButton;
    btnCambiaDescuento: TJAMButton;
    mnuEtiquetaEnvio: TMenuItem;
    mnuCopiarDNI: TMenuItem;
    mnuEtiquetaEnvioSinTelefono: TMenuItem;
    mnuEtiquetaEnvioConTelefono: TMenuItem;
    mnuAltaDireccion: TMenuItem;
    mnuProductos: TPopupMenu;
    mnuDevolucion: TMenuItem;
    mnuDescuentoEfectivo: TMenuItem;
    mnuCambioEnvioPago: TMenuItem;
    mnuClienteDeParte: TMenuItem;
    mnuDuplicaPresupuesto: TMenuItem;
    mnuRecogida: TMenuItem;
    jvCorreo: TJvMail;
    edDescuento: TJAMNumberEdit;
    btnCambiaPrecio: TJAMButton;
    edPrecio: TJAMNumberEdit;
    mnuCambiaPrecio: TPopupMenu;
    mnuCambiaPrecioSel: TMenuItem;
    mnuCambiaPrecioTodos: TMenuItem;
    mnuUnir: TMenuItem;
    mnucambiaPrecioTodoEste: TMenuItem;
    mnuCambiaDescuento: TPopupMenu;
    mnuCambiaDescuentoSel: TMenuItem;
    mnuCambiaDescuentoTodoEste: TMenuItem;
    mnuCambiaDescuentoTodos: TMenuItem;
    mnuPagado: TMenuItem;
    procedure btnActualizarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnVerPdfClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure mnuAceptadoClick(Sender: TObject);
    procedure dbgCarritoPresupuestoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cbSoloNoAceptadosClick(Sender: TObject);
    procedure edIdChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure mnuPresupuestosPopup(Sender: TObject);
    procedure mnuEnviadoClick(Sender: TObject);
    procedure mnuCopiarIDClick(Sender: TObject);
    procedure mnuSubirAWebClick(Sender: TObject);
    procedure btnVentaClick(Sender: TObject);
    procedure btnCambiaDescuentoClick(Sender: TObject);
    procedure mnuCodigoEnvioClick(Sender: TObject);
    procedure btnActualizar2Click(Sender: TObject);
    procedure btnCambiaTallaClick(Sender: TObject);
    procedure btnBorraProductoClick(Sender: TObject);
    procedure btnCantidadClick(Sender: TObject);
    procedure mnuCopiarCodigoEnvioClick(Sender: TObject);
    procedure mnuCopiarEmailClick(Sender: TObject);
    procedure mnuEnviarCorreoClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure mnuCanariasClick(Sender: TObject);
    procedure mnuCopiaEnlacePedidoClick(Sender: TObject);
    procedure btnVerHtmlClick(Sender: TObject);
    procedure mnuEstadoInicialClick(Sender: TObject);
    procedure mnuAltaClienteAccessClick(Sender: TObject);
    procedure mnuAltaClienteClick(Sender: TObject);
    procedure mnuEnviarDatosClienteClick(Sender: TObject);
    procedure mnuVerDatosClienteClick(Sender: TObject);
    procedure mnuPresupuestoAnuladoClick(Sender: TObject);
    procedure lblGrabaObsClick(Sender: TObject);
    procedure lblCancelaObsClick(Sender: TObject);
    procedure mnuCopiarDNIClick(Sender: TObject);
    procedure mnuEtiquetaEnvioSinTelefonoClick(Sender: TObject);
    procedure mnuEtiquetaEnvioConTelefonoClick(Sender: TObject);
    procedure mnuAltaDireccionClick(Sender: TObject);
    procedure mnuDevolucionClick(Sender: TObject);
    procedure mnuDescuentoEfectivoClick(Sender: TObject);
    procedure mnuProductosPopup(Sender: TObject);
    procedure mnuCambioEnvioPagoClick(Sender: TObject);
    procedure mnuClienteDeParteClick(Sender: TObject);
    procedure mnuDuplicaPresupuestoClick(Sender: TObject);
    procedure mnuRecogidaClick(Sender: TObject);
    procedure jvCorreoError(Sender: TJvMail; ErrorCode: Cardinal);
    procedure mnuCambiaPrecioSelClick(Sender: TObject);
    procedure mnuCambiaPrecioTodosClick(Sender: TObject);
    procedure btnCambiaPrecioClick(Sender: TObject);
    procedure mnuUnirClick(Sender: TObject);
    procedure mnucambiaPrecioTodoEsteClick(Sender: TObject);
    procedure mnuCambiaDescuentoSelClick(Sender: TObject);
    procedure mnuCambiaDescuentoTodoEsteClick(Sender: TObject);
    procedure mnuCambiaDescuentoTodosClick(Sender: TObject);
    procedure mnuPagadoClick(Sender: TObject);
  private
    slPlantilla: TStringList;
    lModificando: Boolean;
    slHtmlTemp: TStringList;
    slMenuEnvioPago: TStringList;
    nErrorCorreo: Cardinal;

    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure MProductoPresupuesto(var Message: TMessage); message MSG_PRODUCTO_PRESUPUESTO;
    procedure CambiaModificando(lValor: Boolean);
    procedure ActualizaProductos;
    procedure BorrarPresupuesto(const sFile: TFileName);
    procedure PresupuestoAceptado;
    procedure PresupuestoPagado;
    procedure PresupuestoAnulado;
    procedure SustituyeFalsoTag(slPlantilla: TStrings; const sTag, sSust: string);
    procedure ActualizaPresupuesto;
    procedure sqlCarritoPresupuestoAfterScroll(DataSet: TDataSet);
    function GetNombreArchivo: string;
    function GetPathHtml: TFileName;
    function GetPathPdf: TFileName;
    function GetPathHtmlTemp: TFileName;
    procedure BorraHtmlTemp;
    procedure ExportaHtml(lPdf: Boolean; const sPlantillaPresupuesto: string);
    procedure ExportaHtmlwww(lPdf: Boolean; const sPlantillaPresupuesto: string);
    procedure mnuDescuentoClick(Sender: TObject);
    procedure mnuTallaClick(Sender: TObject);
    procedure CargaMenuTallas;
    function PuedeInsertarProducto: Boolean;
    function PuedeCopiarDireccion: Boolean;
    procedure EnviarCorreo(TipoCorreo: TEnvioCorreo);
    procedure InputFormCallBack(asValues: array of string);
    procedure AltaClienteAccess(lPreguntar: Boolean);
    procedure CreaMenuEnvioPago;
    procedure CambiaDescuento(rDescuento: Extended);
  protected
    function GetIsEnabled(Index: TIdVentana): Boolean; override;
    function ErrorCorreo(nErrorCode: Cardinal): Boolean;

    property NombreArchivo: string read GetNombreArchivo;
    property PathPdf: TFileName read GetPathPdf;
    property PathHtml: TFileName read GetPathHtml;
    property PathHtmlTemp: TFileName read GetPathHtmlTemp;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class procedure ShowForm; overload; override;
  end;

implementation

uses ufrmExplorer, ShellApi, uCommon, udmPresupuestos, udmRanning,
  udmVentas, ufrmPDF, Math, uJAMIntf, ZDataset, uqrpEtiquetaEnvio,
  udmClientes, {mozMapi32} mapi, Clipbrd;

{$R *.DFM}

const
  PLANTILLA_PRESUPUESTO_REEMBOLSO = 'presupuesto_reembolso.htm';
  PLANTILLA_PRESUPUESTO_REEMBOLSO_WWW = 'presupuesto_reembolso_www.htm';
  PLANTILLA_PRESUPUESTO = 'presupuesto.htm';
  PLANTILLA_PRESUPUESTO_WWW = 'presupuesto_www.htm';
  FORMATO_FECHA = 'yyyymmddhhnn';
  GASTOS_ENVIO = 'Gastos de env�o: ';
  MAIL_VENTAWEB = 'ventaweb@ranning.com';
  FIRMA_MAIL = 'C:\Documents and Settings\PC\Mis documentos\DocumentosTienda\FirmasCorreo\logo_ranning_latienda_firma_mail.gif=firma_mail.gif';
  //De formas_pago.id_forma_pago
  ID_FORMA_PAGO_INGRESO = 3;
  ID_FORMA_PAGO_REEMBOLOSO = 5;

var
  frmPresupuestos: TfrmPresupuestos = nil;

{ TfrmPresupuestos }

constructor TfrmPresupuestos.Create(AOwner: TComponent);
begin
  inherited;

  if not Assigned(dmPresupuestos) then
    dmPresupuestos := TdmPresupuestos.Create(nil);
  dmPresupuestos.sqlCarritoPresupuesto.AfterScroll :=
    sqlCarritoPresupuestoAfterScroll;
  DatasetList.Add(dbgCarritoPresupuesto.DataSource.DataSet);
  DatasetList.Add(dbgCarrito.DataSource.DataSet);
  slPlantilla := TStringList.Create;
  slHtmlTemp := nil;
  slMenuEnvioPago := TStringList.Create;
  CambiaModificando(False);
end;

destructor TfrmPresupuestos.Destroy;
begin
  slMenuEnvioPago.Free;
  slPlantilla.Free;
  if Assigned(slHtmlTemp) then begin
    BorraHtmlTemp;
    slHtmlTemp.Free;
  end;

  inherited;
end;

function TfrmPresupuestos.GetIsEnabled(Index: TIdVentana): Boolean;
begin
  case Index of
    nvProductos: Result := PuedeInsertarProducto;
    nvClientes: Result := PuedeCopiarDireccion;
  else
    Result := True;
  end;
end;

procedure TfrmPresupuestos.MProductoPresupuesto(var Message: TMessage);

var
  pProducto: TProductoVenta;

begin
  if not PuedeInsertarProducto then Exit;

  pProducto := TProductoVenta(Message.WParam);
  dmPresupuestos.InsertaProducto(pProducto);
  RefreshData([Id]);
end;

class procedure TfrmPresupuestos.ShowForm;
begin
  if not Assigned(frmPresupuestos) then begin
    frmPresupuestos := TfrmPresupuestos.Create(Application);
    frmPresupuestos.Id := nvPresupuesto;
  end;

  frmPresupuestos.RefreshData([frmPresupuestos.Id]);
  frmPresupuestos.WindowState := wsNormal;
  frmPresupuestos.Show;
end;

procedure TfrmPresupuestos.btnActualizarClick(Sender: TObject);
begin
  dmPresupuestos.ActualizaPresupuesto(Trim(edId.Text));
  ActualizaPresupuesto;
end;

procedure TfrmPresupuestos.MRefresh(var Message: TMessage);
begin
  inherited;

  if (not Boolean(Message.Result)) or lModificando then Exit;

  dmPresupuestos.ActualizaPresupuesto('');
  btnVenta.Enabled := WindowOpened(Id,nvVentas,True);
  //dmRanning.CargaMenuDescuentos(mnuDescuentos,mnuDescuentoClick);
  dmPresupuestos.FiltraActivos(cbSoloNoAceptados.Checked);
end;

procedure TfrmPresupuestos.btnModificarClick(Sender: TObject);
begin
  CambiaModificando(True);
end;

procedure TfrmPresupuestos.CambiaModificando(lValor: Boolean);

var
  lVacia: Boolean;
  vPanel: IJAMContainer;

begin
  lVacia := dmPresupuestos.sqlCarritoPresupuesto.IsEmpty;
  lModificando := lValor;
  btnActualizar.Enabled := (not lModificando);
  btnBuscar.Enabled := (not lModificando) and (Length(Trim(edId.Text)) <> 0);
  btnExportar.Enabled := (not lModificando) and (not lVacia) and
    (not dmPresupuestos.EsPresupuestoAceptado);
  btnBorrar.Enabled := (not lModificando) and (not lVacia);
  btnVerPdf.Enabled := (not lModificando) and (not lVacia) and
    FileExists(PathPdf);
  btnVerHtml.Enabled := (not lModificando) and (not lVacia) and
    FileExists(PathHtml);
  btnEmail.Enabled := (not lModificando) and (not lVacia) and
    FileExists(PathPdf);
  lblGrabaObs.Enabled := (not lModificando) and (not lVacia) and
    (not dmPresupuestos.EsPresupuestoAceptado);
  lblCancelaObs.Enabled := (not lModificando) and (not lVacia) and
    (not dmPresupuestos.EsPresupuestoAceptado);
  dbmObservaciones.Enabled := (not lModificando) and (not lVacia) and
    (not dmPresupuestos.EsPresupuestoAceptado);
  vPanel := pnBotones as IJAMContainer;
  vPanel.ReadOnlyChildren(lVacia or dmPresupuestos.EsPresupuestoAceptado);
  Finalize(vPanel);
end;

procedure TfrmPresupuestos.ActualizaProductos;
begin
end;

procedure TfrmPresupuestos.btnBorrarClick(Sender: TObject);

var
  sId: string;

begin
  if MessageDlg('�Est�s seguro de borrar el presupuesto seleccionado?',mtWarning,
     [mbYes,mbNo],0) <> mrYes then Exit;

  sId := dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString;
  dmPresupuestos.BorraPresupuesto(sId);
  BorrarPresupuesto(sId);
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.btnVerPdfClick(Sender: TObject);
begin
  TfrmPDF.ExploreFile(PathPdf);
end;

procedure TfrmPresupuestos.FormActivate(Sender: TObject);
begin
  if (not Assigned(frmPresupuestos)) or lModificando then Exit;

  CambiaModificando(lModificando);
end;

procedure TfrmPresupuestos.BorrarPresupuesto(const sFile: TFileName);
begin
  dmRanning.CambiaExtensionPresupuesto(sFile);
end;

procedure TfrmPresupuestos.btnEmailClick(Sender: TObject);

var
  nPara: Integer;
  slPara: TStringList;
  sPara: string;
  nCont: Integer;
  sId: string;

begin
  nErrorCorreo := SUCCESS_SUCCESS;
  jvCorreo.Clear;

  jvCorreo.Attachment.Add(PathHtml + '=Pedido.htm');
  jvCorreo.Attachment.Add(PathPdf + '=Pedido.pdf');
  jvCorreo.Attachment.Add(FIRMA_MAIL);

  nPara := 1;
  sPara := dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('ds_email').AsString;
  slPara := TStringList.Create;
  slPara.CommaText := sPara;
  nPara := slPara.Count;
  for nCont := 0 to nPara - 1 do
    jvCorreo.Recipient.AddRecipient(jvCorreo.ResolveName(slPara[nCont]));

  sId :=
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString;
  jvCorreo.Subject := 'Total del pedido ' + sId;
  jvCorreo.Body.Add('Se adjuntan los archivos "Pedido.htm" y ' +
    '"Pedido.pdf" con el total del pedido y con las instrucciones para confirmarlo, as� ' +
    'como el n�mero de cuenta bancaria para pagos por transferencia.');
  jvCorreo.Body.Add('');
  jvCorreo.Body.Add('El enlace para ver el estado del pedido es:');
  jvCorreo.Body.Add('');
  jvCorreo.Body.Add('http://' + dmRanning.ServidorWeb + '/cgi-bin/wwwCarrito.exe/wcarrito?' +
    'ver_id=' + sId);
  jvCorreo.Body.Add('');
  jvCorreo.Body.Add('');
  jvCorreo.Body.Add('Un saludo,');
  jvCorreo.Body.Add('');

  jvCorreo.SendMail;

  if not ErrorCorreo(nErrorCorreo) then begin
    ShowMessage('El correo se envi� correctamente');
    dmPresupuestos.PresupuestoEnviado(sId,
      dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('f_fecha_compra').AsDateTime);
  end;
  {
  MapiResolveName(0,Application.Handle,PChar(MAIL_VENTAWEB),0,0,pOrigen);
  try
    sPara := dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('ds_email').AsString;
    slPara := TStringList.Create;
    slPara.CommaText := sPara;
    nPara := slPara.Count;
    SetLength(aPara,nPara);
    SetLength(apPara,nPara);
    for nCont := 0 to nPara - 1 do begin
      MapiResolveName(0,Application.Handle,PChar(slPara[nCont]),0,0,apPara[nCont]);
      if Assigned(apPara[nCont]) then begin
        apPara[nCont]^.ulRecipClass := MAPI_TO;
        aPara[nCont] := apPara[nCont]^;
      end
      else
        ShowMessage('La direcci�n de correo [' + slPara[nCont] + '] no es correcta');
    end;
    pOrigen^.ulRecipClass := MAPI_ORIG;
    FillChar(Msg,SizeOf(Msg),0);
    Msg.ulReserved := 0;
    sId :=
      dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString;
    Msg.lpszSubject := PChar('Total del pedido ' + sId);
    Msg.lpszNoteText := PChar('Se adjuntan los archivos "Pedido.htm" y ' +
      '"Pedido.pdf" con el total del pedido y con las instrucciones para confirmarlo, as� ' +
      'como el n�mero de cuenta bancaria para pagos por transferencia.' +
      #13 + #10 + #13 + #10 + 'El enlace para ver el estado del pedido es:' + #13 + #10 +
      'http://' + dmRanning.ServidorWeb + '/cgi-bin/wwwCarrito.exe/wcarrito?' +
      'ver_id=' + sId + #13 + #10 + #13 + #10 + 'Un saludo,' + FIRMA_MAIL);
    Msg.flFlags := MAPI_RECEIPT_REQUESTED;
    Msg.lpOriginator := pOrigen;
    Msg.nRecipCount := nPara;
    Msg.lpRecips := @aPara[0];
    Msg.nFileCount := 2;
    Msg.lpFiles := @aAdj[0];
    if MapiSendMail(0,Application.Handle,Msg,MAPI_DIALOG,0) = SUCCESS_SUCCESS then begin
      ShowMessage('El correo se envi� correctamente');
      dmPresupuestos.PresupuestoEnviado(sId,
        dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('f_fecha_compra').AsDateTime);
    end;
  finally
    MapiFreeBuffer(pOrigen);
    slPara.Free;
    for nCont := 0 to nPara - 1 do MapiFreeBuffer(apPara[nCont]);
    Finalize(aPara);
  end;
  }

  RefreshData([Id]);
end;

procedure TfrmPresupuestos.PresupuestoAceptado;
begin
  dmPresupuestos.PresupuestoAceptado(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString);
  ActualizaPresupuesto;
  //ExportaHtml(True);
end;

procedure TfrmPresupuestos.mnuAceptadoClick(Sender: TObject);

var
  sMsg: string;

begin
  PresupuestoAceptado;

  if dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente').AsInteger = 0 then
    AltaClienteAccess(True);

  sMsg := '�Quieres enviarle un correo de confirmaci�n de presupuesto aceptado?';
  if MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
    EnviarCorreo(ecPresupuestoAceptado);
end;

procedure TfrmPresupuestos.SustituyeFalsoTag(slPlantilla: TStrings;
  const sTag, sSust: string);

var
  nPos: TLinePos;

begin
  repeat
    nPos := LinePos(sTag,slPlantilla,True);
    if nPos.nLine = -1 then Exit;

    slPlantilla[nPos.nLine] := StringReplace(slPlantilla[nPos.nLine],sTag,sSust,
      [rfReplaceAll,rfIgnoreCase]);
  until (nPos.nLine = -1) and (nPos.nPos = 0);
end;

procedure TfrmPresupuestos.dbgCarritoPresupuestoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var
  sText: string;
  nTextH: Integer;
  nTextW: Integer;
  nX: Integer;
  nY: Integer;
  dbgGrid: TDBGrid;

begin
  if gdFixed in State then Exit;

  dbgGrid := TDBGrid(Sender);
  if dmPresupuestos.EsPresupuestoAnulado then
    dbgGrid.Canvas.Font.Color := clRed
  else if dmPresupuestos.EsPresupuestoAceptado then
    dbgGrid.Canvas.Font.Color := clLime
  else if dmPresupuestos.EsPresupuestoCaducado then
    dbgGrid.Canvas.Font.Color := clRed;

  try
    sText := Column.Field.AsString;
    nTextH := dbgGrid.Canvas.TextHeight(sText);
    nTextW := dbgGrid.Canvas.TextWidth(sText);
    nY := Rect.Top + ((Rect.Bottom - Rect.Top - nTextH) div 2);
    nX := 0;
    case Column.Alignment of
      taLeftJustify : nX := Rect.Left + 2;
      taCenter : nX := Rect.Left + ((Rect.Right - Rect.Left - nTextW) div 2);
      taRightJustify : nX := Rect.Right - 3 - nTextW;
    end;
    dbgGrid.Canvas.TextOut(nX,nY,sText);

    dbmObservaciones.Font.Color := dbgGrid.Canvas.Font.Color;
  finally
    dbgGrid.Canvas.Font.Color := dbgGrid.Font.Color;
  end;
  Application.ProcessMessages;
end;

procedure TfrmPresupuestos.cbSoloNoAceptadosClick(Sender: TObject);
begin
  dmPresupuestos.FiltraActivos(cbSoloNoAceptados.Checked);
end;

procedure TfrmPresupuestos.ActualizaPresupuesto;

var
  sReg: string;

begin
  sReg :=
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString;
  try
    dbgCarritoPresupuesto.DataSource.DataSet.Close;
    dbgCarritoPresupuesto.DataSource.DataSet.Open;
  finally
    dbgCarritoPresupuesto.DataSource.DataSet.Locate('id_cliente_web',sReg,[]);
  end;
end;

procedure TfrmPresupuestos.sqlCarritoPresupuestoAfterScroll(
  DataSet: TDataSet);
begin
  CambiaModificando(lModificando);
end;

procedure TfrmPresupuestos.edIdChange(Sender: TObject);
begin
  CambiaModificando(lModificando);
end;

function TfrmPresupuestos.GetNombreArchivo: string;
begin
  Result :=
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString;
end;

function TfrmPresupuestos.GetPathHtml: TFileName;
begin
  Result := dmRanning.PathPresupuestos + NombreArchivo + '.htm';
end;

function TfrmPresupuestos.GetPathPdf: TFileName;
begin
  Result := dmRanning.PathPresupuestos + NombreArchivo + '.pdf';
end;

procedure TfrmPresupuestos.btnBuscarClick(Sender: TObject);
begin
  ActualizaPresupuesto;
  if not dmPresupuestos.BuscaPresupuesto(Trim(edId.Text)) then
    ShowMessage('No existe presupuesto con ese c�digo de cliente web');
end;

procedure TfrmPresupuestos.mnuPresupuestosPopup(Sender: TObject);

var
  DataSet: TDataSet;

begin
  CreaMenuEnvioPago;
  DataSet := dbgCarritoPresupuesto.DataSource.DataSet;
  mnuAceptado.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    (not dmPresupuestos.EsPresupuestoAceptado);
  mnuEnviado.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    dmPresupuestos.EsPresupuestoAceptado;
  mnuEtiquetaEnvio.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    dmPresupuestos.EsPresupuestoAceptado;
  mnuRecogida.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    dmPresupuestos.EsPresupuestoAceptado;
  mnuPagado.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    (DataSet.FieldByName('id_forma_pago').AsInteger = ID_FORMA_PAGO_TRANSFERENCIA) and
    (not DataSet.FieldByName('f_fecha_aceptacion').IsNull);
  mnuCopiarID.Enabled := not DataSet.IsEmpty;
  mnuCopiarCodigoEnvio.Enabled := (not DataSet.IsEmpty) and
    (not DataSet.FieldByName('ds_codigo_envio').IsNull);
  mnuSubirAWeb.Enabled := (not DataSet.IsEmpty) and (not lModificando);
  mnuCodigoEnvio.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    (not dmPresupuestos.EsPresupuestoAceptado);
  mnuCopiarEmail.Enabled := (not DataSet.IsEmpty) and (not lModificando);
  mnuCopiarDNI.Enabled := (not DataSet.IsEmpty) and (not lModificando);
  mnuEnviarCorreo.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    (not DataSet.FieldByName('ds_email').IsNull);
  mnuEnviarDatosCliente.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    (not DataSet.FieldByName('ds_email').IsNull);
  mnuEstadoInicial.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    (not (DataSet.FieldByName('id_estado_pedido').AsInteger in
    [ID_ESTADO_ENVIADO_RANNING,ID_ESTADO_PEDIDO_ENVIADO]));
  mnuCopiaEnlacePedido.Enabled := not DataSet.IsEmpty;
  mnuAltaClienteAccess.Enabled := (not DataSet.IsEmpty) and
    (DataSet.FieldByName('cod_cliente_access').AsInteger = 0);
  mnuAltaCliente.Enabled := (not DataSet.IsEmpty) and
    (DataSet.FieldByName('id_cliente').AsInteger = 0) and
    (DataSet.FieldByName('id_tipo_via').AsString <> '');
  mnuAltaDireccion.Enabled := (not DataSet.IsEmpty) and
    (DataSet.FieldByName('id_cliente').AsInteger <> 0) and
    (DataSet.FieldByName('id_tipo_via').AsString <> '');
  mnuVerDatosCliente.Enabled := not DataSet.IsEmpty;
  mnuCambioEnvioPago.Enabled := (not DataSet.IsEmpty) and (not lModificando) and
    (not dmPresupuestos.EsPresupuestoAceptado);
end;

function TfrmPresupuestos.GetPathHtmlTemp: TFileName;

var
  sTemp: TFileName;

begin
  sTemp := dmRanning.PathPresupuestos + CreateGUID62 + '.htm';
  if not Assigned(slHtmlTemp) then slHtmlTemp := TStringList.Create;
  slHtmlTemp.Add(sTemp);

  Result := sTemp;
end;

procedure TfrmPresupuestos.BorraHtmlTemp;

var
  nCont: Integer;

begin
  for nCont := 0 to slHtmlTemp.Count - 1 do
    if FileExists(slHtmlTemp[nCont]) then DeleteFile(slHtmlTemp[nCont]);
end;

procedure TfrmPresupuestos.ExportaHtmlwww(lPdf: Boolean;
  const sPlantillaPresupuesto: string);

var
  sGastos: string;
  rGastos: Extended;
  Dataset: TDataSet;
  nFechaPres: TDate;
  rTotal: Extended;
  rFijo: Extended;
  rComision: Extended;
  rMinComision: Extended;
  sMinComision: string;
  rDesc: Extended;

begin
  Dataset := dbgCarritoPresupuesto.DataSource.DataSet;
  if dmPresupuestos.EsPresupuestoAceptado then Exit;

  rDesc := Dataset.FieldByName('nm_descuento_efectivo').AsFloat;
  rGastos := Dataset.FieldByName('nm_gastos_envio').AsFloat;

  slPlantilla.LoadFromFile(dmRanning.PathServidor + sPlantillaPresupuesto);

  SustituyeFalsoTag(slPlantilla,'<#id_cliente_web>',NombreArchivo);

  SustituyeFalsoTag(slPlantilla,'<#datos_envio>',dmPresupuestos.DatosEnvio(True));
  SustituyeFalsoTag(slPlantilla,'<#datos_envio_desistimiento>',dmPresupuestos.DatosEnvio(False));

  SustituyeFalsoTag(slPlantilla,'<#agencia_envio>',
    Dataset.FieldByName('ds_agencia_transporte').AsString);

  nFechaPres := Dataset.FieldByName('f_fecha_compra').AsDateTime;

  SustituyeFalsoTag(slPlantilla,'<#fecha>',FormatDateTime('dd/mm/yyyy',nFechaPres));

  SustituyeFalsoTag(slPlantilla,'<#ccc>',dmRanning.CCC);

  SustituyeFalsoTag(slPlantilla,'<#fecha2>',
    FormatDateTime('dd/mm/yyyy',dmRanning.UltimoDiaPresupuesto(nFechaPres)));

  rTotal := Dataset.FieldByName('nm_pvp').AsFloat + rGastos - rDesc;
  SustituyeFalsoTag(slPlantilla,'<#total_articulos>',
    dmRanning.FormateaPrecio(Dataset.FieldByName('nm_pvp').AsFloat - rDesc));
  SustituyeFalsoTag(slPlantilla,'<#total>',dmRanning.FormateaPrecio(rTotal));

  SustituyeFalsoTag(slPlantilla,'<#gastos_envio>',
    dmRanning.FormateaPrecio(rGastos));

  SustituyeFalsoTag(slPlantilla,'<#productos>',
    dmPresupuestos.DatosPresupuestoToHtml);

  SustituyeFalsoTag(slPlantilla,'<#path>',dmRanning.ServidorWeb);

  rFijo := Dataset.FieldByName('nm_fijo_reembolso').AsFloat;
  rComision := Dataset.FieldByName('nm_comision_reembolso').AsFloat;
  rMinComision := Dataset.FieldByName('nm_minimo_comision').AsFloat;

  sMinComision := '';
  if rMinComision <> 0 then
    sMinComision := ', m�nimo de ' + dmRanning.FormateaPrecio(rMinComision);
  if (rComision = 0) and (rFijo <> 0) then
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPrecio(rFijo) + sMinComision)
  else if (rComision <> 0) and (rFijo = 0) then
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPorcentaje(rComision) + sMinComision)
  else if (rComision <> 0) and (rFijo <> 0) then
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPrecio(rFijo) + ' + ' +
      dmRanning.FormateaPorcentaje(rComision) + sMinComision)
  else
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPrecio(0));

  SustituyeFalsoTag(slPlantilla,'<#derechos_correos>',dmRanning.FormateaPrecio(
    Max(rFijo + rComision * rTotal / 100,rMinComision)));

  SustituyeFalsoTag(slPlantilla,'<#total_correos>',dmRanning.FormateaPrecio(
    rTotal + Max(rFijo + rTotal * rComision / 100,rMinComision)));

  if not dmRanning.ItFieldMarked(Dataset.FieldByName('it_canarias')) then begin
    SustituyeFalsoTag(slPlantilla,'<#canarias>','');
    SustituyeFalsoTag(slPlantilla,'<#iva_canarias>','');
  end
  else begin
    SustituyeFalsoTag(slPlantilla,'<#canarias>','<p class="fuente_pequena ' +
      'fuente_negrita">Env�o a Canarias. Los precios ya tienen descontado el ' +
      'IVA</p>');
    SustituyeFalsoTag(slPlantilla,'<#iva_canarias>',' (sin IVA)');
  end;

  slPlantilla.SaveToFile(dmRanning.PathPresupuestoswww + NombreArchivo + '.htm');
end;

procedure TfrmPresupuestos.ExportaHtml(lPdf: Boolean; const sPlantillaPresupuesto: string);

var
  sGastos: string;
  rGastos: Extended;
  sHtml: TFileName;
  sEmail: string;
  Dataset: TDataSet;
  lAceptado: Boolean;
  nFechaPres: TDate;
  lCambiaFCompra: Boolean;
  rTotal: Extended;
  rFijo: Extended;
  rComision: Extended;
  rMinComision: Extended;
  sMinComision: string;
  rDesc: Extended;

begin
  Dataset := dbgCarritoPresupuesto.DataSource.DataSet;
  lAceptado := dmPresupuestos.EsPresupuestoAceptado;
  rDesc := Dataset.FieldByName('nm_descuento_efectivo').AsFloat;
  if not lAceptado then begin
    repeat
      sGastos := InputBox('Datos para exportar a HTML','Gastos de env�o: ',
        Dataset.FieldByName('nm_gastos_envio').AsString);
      try
        rGastos := StrToFloat(sGastos);
      except
        rGastos := -1
      end;
    until rGastos <> -1;
    if Dataset.FieldByName('nm_gastos_envio').AsFloat <> rGastos then begin
      Dataset.Edit;
      Dataset.FieldByName('nm_gastos_envio').AsFloat := rGastos;
    end;

    repeat
      sEmail := InputBox('Datos para exportar a HTML','e-mail de respuesta: ',
        Dataset.FieldByName('ds_email').AsString);
    until (sEmail <> '') and (Pos('@',sEmail) <> 0);
    if Dataset.FieldByName('ds_email').AsString <> sEmail then begin
      if not (Dataset.State in dsEditModes) then Dataset.Edit;
      Dataset.FieldByName('ds_email').AsString := sEmail;
    end;
    if Dataset.State in dsEditModes then Dataset.Post;
  end
  else begin
    rGastos := Dataset.FieldByName('nm_gastos_envio').AsFloat;
    sEmail := Dataset.FieldByName('ds_email').AsString;
  end;

  slPlantilla.LoadFromFile(dmRanning.PathServidor + sPlantillaPresupuesto);

  SustituyeFalsoTag(slPlantilla,'<#id_cliente_web>',NombreArchivo);

  SustituyeFalsoTag(slPlantilla,'<#datos_envio>',dmPresupuestos.DatosEnvio(True));
  SustituyeFalsoTag(slPlantilla,'<#datos_envio_desistimiento>',dmPresupuestos.DatosEnvio(False));

  SustituyeFalsoTag(slPlantilla,'<#agencia_envio>',
    Dataset.FieldByName('ds_agencia_transporte').AsString);

  nFechaPres := Dataset.FieldByName('f_fecha_compra').AsDateTime;
  lCambiaFCompra := False;
  if Date <> Trunc(Dataset.FieldByName('f_fecha_compra').AsDateTime) then begin
    lCambiaFCompra := MessageDlg('�Quieres cambiar la fecha de presupuesto a la de hoy?',
      mtWarning,[mbYes,mbNo],0) = mrYes;
    if lCambiaFCompra then nFechaPres := Date;
  end;
  SustituyeFalsoTag(slPlantilla,'<#fecha>',FormatDateTime('dd/mm/yyyy',nFechaPres));

  SustituyeFalsoTag(slPlantilla,'<#ccc>',dmRanning.CCC);

  SustituyeFalsoTag(slPlantilla,'<#fecha2>',
    FormatDateTime('dd/mm/yyyy',dmRanning.UltimoDiaPresupuesto(nFechaPres)));

  rTotal := Dataset.FieldByName('nm_pvp').AsFloat + rGastos - rDesc;
  SustituyeFalsoTag(slPlantilla,'<#total_articulos>',
    dmRanning.FormateaPrecio(Dataset.FieldByName('nm_pvp').AsFloat - rDesc));
  SustituyeFalsoTag(slPlantilla,'<#total>',dmRanning.FormateaPrecio(rTotal));

  SustituyeFalsoTag(slPlantilla,'<#gastos_envio>',
    dmRanning.FormateaPrecio(rGastos));

  SustituyeFalsoTag(slPlantilla,'<#productos>',
    dmPresupuestos.DatosPresupuestoToHtml);

  SustituyeFalsoTag(slPlantilla,'<#path>',dmRanning.ServidorWeb);

  SustituyeFalsoTag(slPlantilla,'<#enlace>',NombreArchivo + '&e=' + sEmail);

  rFijo := Dataset.FieldByName('nm_fijo_reembolso').AsFloat;
  rComision := Dataset.FieldByName('nm_comision_reembolso').AsFloat;
  rMinComision := Dataset.FieldByName('nm_minimo_comision').AsFloat;

  sMinComision := '';
  if rMinComision <> 0 then
    sMinComision := ', m�nimo de ' + dmRanning.FormateaPrecio(rMinComision);
  if (rComision = 0) and (rFijo <> 0) then
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPrecio(rFijo) + sMinComision)
  else if (rComision <> 0) and (rFijo = 0) then
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPorcentaje(rComision) + sMinComision)
  else if (rComision <> 0) and (rFijo <> 0) then
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPrecio(rFijo) + ' + ' +
      dmRanning.FormateaPorcentaje(rComision) + sMinComision)
  else
    SustituyeFalsoTag(slPlantilla,'<#derechos_correos_txt>',
      dmRanning.FormateaPrecio(0));

  SustituyeFalsoTag(slPlantilla,'<#derechos_correos>',dmRanning.FormateaPrecio(
    Max(rFijo + rComision * rTotal / 100,rMinComision)));

  SustituyeFalsoTag(slPlantilla,'<#total_correos>',dmRanning.FormateaPrecio(
    rTotal + Max(rFijo + rTotal * rComision / 100,rMinComision)));

  if not dmRanning.ItFieldMarked(Dataset.FieldByName('it_canarias')) then begin
    SustituyeFalsoTag(slPlantilla,'<#canarias>','');
    SustituyeFalsoTag(slPlantilla,'<#iva_canarias>','');
  end
  else begin
    SustituyeFalsoTag(slPlantilla,'<#canarias>','<p class="fuente_pequena ' +
      'fuente_negrita">Env�o a Canarias. Los precios ya tienen descontado el ' +
      'IVA</p>');
    SustituyeFalsoTag(slPlantilla,'<#iva_canarias>',' (sin IVA)');
  end;

  if (not lAceptado) or (lAceptado and lPdf) then
    sHtml := PathHtml
  else
    sHtml := PathHtmlTemp;

  slPlantilla.SaveToFile(sHtml);

  TfrmExplorer.HtmlToPdf(sHtml,lAceptado,lAceptado and lPdf);

  if lCambiaFCompra then begin
    dmPresupuestos.CambiaFechaCompra(NombreArchivo,nFechaPres);
    RefreshData([Id]);
  end;
end;

procedure TfrmPresupuestos.InputFormCallBack(asValues: array of string);

var
  Dataset: TDataSet;

begin
  Dataset := frmPresupuestos.dbgCarritoPresupuesto.DataSource.DataSet;
  if (asValues[0] <> Dataset.FieldByName('ds_codigo_envio').AsString) or
     (asValues[1] <> Dataset.FieldByName('f_fecha_envio').AsString) then begin
    if not (Dataset.State in dsEditModes) then Dataset.Edit;
    Dataset.FieldByName('ds_codigo_envio').AsString := asValues[0];
    Dataset.FieldByName('f_fecha_envio').AsString := asValues[1];
    Dataset.Post;
  end;
end;

procedure TfrmPresupuestos.mnuEnviadoClick(Sender: TObject);

var
  Dataset: TDataSet;
  asEnvio: array[0..1] of string;
  pCallBack: TInputFormCallBack;
  sMsg: string;

begin
  Dataset := dbgCarritoPresupuesto.DataSource.DataSet;
  asEnvio[0] := Dataset.FieldByName('ds_codigo_envio').AsString;
  if Dataset.FieldByName('f_fecha_envio').IsNull then
    asEnvio[1] := FormatDateTime('dd/mm/yyyy',Date)
  else
    asEnvio[1] := Dataset.FieldByName('f_fecha_envio').AsString;
  pCallBack := InputFormCallBack;
  if not InputForm('Datos para seguimiento del env�o',['C�digo del env�o:','Fecha y hora del env�o:'],asEnvio,pCallBack) then
    Exit;

  sMsg := '�Quieres enviarle un correo de env�o del pedido?';
  if MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
    frmPresupuestos.EnviarCorreo(ecPedidoEnviado);

  dmPresupuestos.PedidoEnviado(Dataset.FieldByName('id_cliente_web').AsString);
  frmPresupuestos.ActualizaPresupuesto;
end;

procedure TfrmPresupuestos.mnuCopiarIDClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString);
end;

procedure TfrmPresupuestos.mnuSubirAWebClick(Sender: TObject);
begin
  dmPresupuestos.SubirPedido(
    dbgCarritoPresupuesto.DataSource.Dataset.FieldByName('id_cliente_web').AsString);
  dmRanning.SubePedido(dmRanning.PathPresupuestoswww + NombreArchivo + '.htm');

  ShowMessage('El presupuesto ' +
    dbgCarritoPresupuesto.DataSource.Dataset.FieldByName('id_cliente_web').AsString +
    ' se ha subido a la web');
end;

procedure TfrmPresupuestos.btnVentaClick(Sender: TObject);

var
  slMap: TStringList;

begin
  slMap := TStringList.Create;
  try
    slMap.Add('id_producto=');
    slMap.Add('id_color=');
    slMap.Add('id_talla=');
    slMap.Add('nm_cantidad=');
    slMap.Add('nm_pvp=nm_precio_unitario');
    slMap.Add('nm_descuento=');
    slMap.Add('nm_iva=');
    DataSetCopy(dbgCarrito.DataSource.DataSet,dmVentas.sqlVentasDetalle,slMap);
  finally
    slMap.Free;
  end;
end;

procedure TfrmPresupuestos.mnuDescuentoClick(Sender: TObject);
begin
  dbgCarrito.DataSource.DataSet.Edit;
  dbgCarrito.DataSource.DataSet.FieldByName('id_descuento').AsInteger :=
    TComponent(Sender).Tag;
  dbgCarrito.DataSource.DataSet.Post;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.btnCambiaDescuentoClick(Sender: TObject);

var
  pOrigen: TPoint;

begin
  pOrigen.x := TControl(Sender).Left;
  pOrigen.y := TControl(Sender).Top;
  pOrigen := TControl(Sender).ClientToScreen(pOrigen);
  mnuCambiaDescuento.Popup(pOrigen.x,pOrigen.y);
end;

procedure TfrmPresupuestos.mnuCodigoEnvioClick(Sender: TObject);

var
  sCodigo: string;

begin
  sCodigo := InputBox('C�digo de env�o','',
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('ds_codigo_envio').AsString);
  if sCodigo = '' then Exit;

  dbgCarritoPresupuesto.DataSource.Edit;
  dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('ds_codigo_envio').AsString :=
    sCodigo;
  dbgCarritoPresupuesto.DataSource.DataSet.Post;
end;

procedure TfrmPresupuestos.btnActualizar2Click(Sender: TObject);
begin
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.CargaMenuTallas;

var
  pTalla: TMenuItem;

begin
  mnuTallas.Items.Clear;
  dmPresupuestos.CargaTallas;
  dmPresupuestos.sqlTallas.First;
  while not dmPresupuestos.sqlTallas.Eof do begin
    pTalla := TMenuItem.Create(mnuTallas);
    pTalla.Tag := dmPresupuestos.sqlTallas.FieldByName('id_talla').AsInteger;
    pTalla.Caption :=
      dmPresupuestos.sqlTallas.FieldByName('ds_talla').AsString;
    pTalla.OnClick := mnuTallaClick;

    mnuTallas.Items.Add(pTalla);
    dmPresupuestos.sqlTallas.Next;
    Application.ProcessMessages;
  end;
end;

procedure TfrmPresupuestos.mnuTallaClick(Sender: TObject);
begin
  dbgCarrito.DataSource.DataSet.Edit;
  dbgCarrito.DataSource.DataSet.FieldByName('id_talla').AsInteger :=
    TComponent(Sender).Tag;
  dbgCarrito.DataSource.DataSet.Post;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.btnCambiaTallaClick(Sender: TObject);
begin
  CargaMenuTallas;
  dmRanning.ShowPopupMenu(TControl(Sender),mnuTallas);
end;

procedure TfrmPresupuestos.btnBorraProductoClick(Sender: TObject);
begin
  dbgCarrito.DataSource.DataSet.Delete;
  RefreshData([Id]);
end;

function TfrmPresupuestos.PuedeInsertarProducto: Boolean;
begin
  Result :=
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_estado_pedido').AsInteger in
    [ID_ESTADO_ENVIADO_RANNING,ID_ESTADO_ENVIADO_CLIENTE];
end;

procedure TfrmPresupuestos.btnCantidadClick(Sender: TObject);

var
  DataSet: TDataSet;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  DataSet.Edit;
  DataSet.FieldByName('nm_cantidad').AsString := edCantidad.Text;
  DataSet.Post;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuCopiarCodigoEnvioClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('ds_codigo_envio').AsString);
end;

procedure TfrmPresupuestos.EnviarCorreo(TipoCorreo: TEnvioCorreo);

var
  nPara: Integer;
  slPara: TStringList;
  sPara: string;
  nCont: Integer;
  sId: string;
  DataSet: TDataSet;
  sTexto: string;
  sNombre: string;
  sqlNombre: TZReadOnlyQuery;
  sDatosCliente: string;

begin
  sqlNombre := nil;
  nErrorCorreo := SUCCESS_SUCCESS;
  jvCorreo.Clear;

  jvCorreo.Attachment.Add(FIRMA_MAIL);

  DataSet := dbgCarritoPresupuesto.DataSource.DataSet;
  nPara := 1;
  sPara := DataSet.FieldByName('ds_email').AsString;
  slPara := TStringList.Create;
  slPara.CommaText := sPara;
  nPara := slPara.Count;
  for nCont := 0 to nPara - 1 do
    jvCorreo.Recipient.AddRecipient(jvCorreo.ResolveName(slPara[nCont]));

  sId := DataSet.FieldByName('id_cliente_web').AsString;
  case TipoCorreo of
    ecNormal: jvCorreo.Subject := 'Pedido ' + sId;
    ecPresupuestoAceptado: jvCorreo.Subject := 'Confirmaci�n del pedido ' + sId;
    ecPedidoEnviado: jvCorreo.Subject := 'Env�o del pedido ' + sId;
    ecDatosCliente: jvCorreo.Subject := 'Datos de cliente para la web';
    ecPresupuestoAnulado: jvCorreo.Subject := 'Anulaci�n del pedido ' + sId;
    ecPresupuestoPagado: jvCorreo.Subject := 'Confirmaci�n de pago del pedido ' + sId;
  end;
  sNombre := DataSet.FieldByName('ds_nombre_completo').AsString;
  if DataSet.FieldByName('id_cliente').AsInteger <> 0 then begin
    sqlNombre := dmRanning.ComandoSQL('select concat(ds_nombre_esp," ",' +
      'ds_primer_apellido_esp," ",ds_segundo_apellido_esp) ds_nombre from ' +
      'clientes where id_cliente = ' + DataSet.FieldByName('id_cliente').AsString,
      csResultado);
    sNombre := sqlNombre.FieldByName('ds_nombre').AsString;
  end;
  sTexto := 'Hola ' + sNombre + ',' + #13 + #10 + #13 + #10;
  sDatosCliente := 'Te recordamos tus datos de cliente ' +
    'para que la pr�xima vez que hagas un pedido no tengas que escribirlos ' +
    'de nuevo:' + #13 + #10 + '- DNI: ' +
    DataSet.FieldByName('ds_dni').AsString + #13 + #10 + '- e-mail: ' +
    DataSet.FieldByName('ds_email').AsString;
  case TipoCorreo of
    ecPresupuestoAceptado: begin
      sTexto := sTexto + 'hemos recibido la confirmaci�n de tu pedido.';
      if DataSet.FieldByName('id_forma_pago').AsInteger = ID_FORMA_PAGO_INGRESO then
        sTexto := sTexto + #13 + #10 + 'En caso que hayas elejido pago ' +
          'mediante transferencia esperaremos a que nos notifiques la misma ' +
          'para enviar el pedido.';
      if DataSet.FieldByName('cod_cliente_access').AsString <> '' then
        sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
    end;
    ecPresupuestoAnulado: begin
      sTexto := sTexto + 'hemos recibido la anulaci�n ' +
        'de tu pedido.' + #13 + #10 + 'En caso de que te hayas confundido ' +
        'puedes confirmarlo pinchando en el enlace correspondiente.' + #13 + #10 +
        'Si lo que quieres es cambiar, a�adir o eliminar alg�n art�culo puedes ' +
        'dec�rnoslo por correo, y nosotros modificamos el pedido con los cambios ' +
        'que nos digas y te enviamos el presupuesto rectificado.';
        if DataSet.FieldByName('cod_cliente_access').AsString <> '' then
          sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
    end;
    ecPedidoEnviado: begin
      sTexto := sTexto + 'te hemos enviado tu pedido. Le han ' +
        'asignado el identificador y fecha ' + DataSet.FieldByName('ds_codigo_envio').AsString +
        ' ' + FormatDateTime('dd/mm/yyyy hh:nn',
        DataSet.FieldByName('f_fecha_envio').AsDateTime) + '.';
        if DataSet.FieldByName('cod_cliente_access').AsString <> '' then
          sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
    end;
    ecPresupuestoPagado: begin
      sTexto := sTexto + 'hemos recibido la confirmaci�n de pago de tu pedido.';
      if DataSet.FieldByName('cod_cliente_access').AsString <> '' then
        sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
    end;
    ecDatosCliente: sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
  end;
  sTexto := sTexto + #13 + #10 + #13 + #10 + 'Un saludo y muchas gracias,' +
    #13 + #10 + #13 + #10;
  jvCorreo.Body.Text := sTexto;

  if Assigned(sqlNombre) then dmRanning.ComandoSQLFree(sqlNombre);

  jvCorreo.SendMail;

  if not ErrorCorreo(nErrorCorreo) then ShowMessage('El correo se envi� correctamente');

  {
  slPara := nil;

  DataSet := dbgCarritoPresupuesto.DataSource.DataSet;
  nPara := 1;
  MapiResolveName(0,Application.Handle,PChar(MAIL_VENTAWEB),0,0,pOrigen);
  try
    sPara := DataSet.FieldByName('ds_email').AsString;
    slPara := TStringList.Create;
    slPara.CommaText := sPara;
    nPara := slPara.Count;
    SetLength(aPara,nPara);
    SetLength(apPara,nPara);
    for nCont := 0 to nPara - 1 do begin
      MapiResolveName(0,Application.Handle,PChar(slPara[nCont]),0,0,apPara[nCont]);
      apPara[nCont]^.ulRecipClass := MAPI_TO;
      aPara[nCont] := apPara[nCont]^;
    end;
    pOrigen^.ulRecipClass := MAPI_ORIG;
    FillChar(Msg,SizeOf(Msg),0);
    Msg.ulReserved := 0;
    sId := DataSet.FieldByName('id_cliente_web').AsString;
    case TipoCorreo of
      ecNormal: Msg.lpszSubject := PChar('Pedido ' + sId);
      ecPresupuestoAceptado: Msg.lpszSubject := PChar('Confirmaci�n del pedido ' + sId);
      ecPedidoEnviado: Msg.lpszSubject := PChar('Env�o del pedido ' + sId);
      ecDatosCliente: Msg.lpszSubject := PChar('Datos de cliente para la web');
      ecPresupuestoAnulado: Msg.lpszSubject := PChar('Anulaci�n del pedido ' + sId);
    end;
    sNombre := DataSet.FieldByName('ds_nombre_completo').AsString;
    if DataSet.FieldByName('id_cliente').AsInteger <> 0 then begin
      sqlNombre := dmRanning.ComandoSQL('select concat(ds_nombre_esp," ",' +
        'ds_primer_apellido_esp," ",ds_segundo_apellido_esp) ds_nombre from ' +
        'clientes where id_cliente = ' + DataSet.FieldByName('id_cliente').AsString,
        csResultado);
      sNombre := sqlNombre.FieldByName('ds_nombre').AsString;
    end;
    sTexto := 'Hola ' + sNombre + ',' + #13 + #10 + #13 + #10;
    sDatosCliente := 'Te recordamos tus datos de cliente ' +
      'para que la pr�xima vez que hagas un pedido no tengas que escribirlos ' +
      'de nuevo:' + #13 + #10 + '- DNI: ' +
      DataSet.FieldByName('ds_dni').AsString + #13 + #10 + '- e-mail: ' +
      DataSet.FieldByName('ds_email').AsString;
    case TipoCorreo of
      ecPresupuestoAceptado: begin
        sTexto := sTexto + 'hemos recibido la confirmaci�n de tu pedido.';
        if DataSet.FieldByName('id_forma_pago').AsInteger = ID_FORMA_PAGO_INGRESO then
          sTexto := sTexto + #13 + #10 + 'En caso que hayas elejido pago ' +
            'mediante transferencia esperaremos a que nos notifiques la misma ' +
            'para enviar el pedido.';
        if DataSet.FieldByName('cod_cliente_access').AsString <> '' then
          sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
      end;
      ecPresupuestoAnulado: begin
        sTexto := sTexto + 'hemos recibido la anulaci�n ' +
          'de tu pedido.' + #13 + #10 + 'En caso de que te hayas confundido ' +
          'puedes confirmarlo pinchando en el enlace correspondiente.' + #13 + #10 +
          'Si lo que quieres es cambiar, a�adir o eliminar alg�n art�culo puedes ' +
          'dec�rnoslo por correo, y nosotros modificamos el pedido con los cambios ' +
          'que nos digas y te enviamos el presupuesto rectificado.';
          if DataSet.FieldByName('cod_cliente_access').AsString <> '' then
            sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
      end;
      ecPedidoEnviado: begin
        sTexto := sTexto + 'te hemos enviado tu pedido. Le han ' +
          'asignado el identificador y fecha ' + DataSet.FieldByName('ds_codigo_envio').AsString +
          ' ' + FormatDateTime('dd/mm/yyyy hh:nn',
          DataSet.FieldByName('f_fecha_envio').AsDateTime) + '.';
          if DataSet.FieldByName('cod_cliente_access').AsString <> '' then
            sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
      end;
      ecDatosCliente: sTexto := sTexto + #13 + #10 + #13 + #10 + sDatosCliente;
    end;
    sTexto := sTexto + #13 + #10 + #13 + #10 + 'Un saludo y muchas gracias,' +
      FIRMA_MAIL;
    Msg.lpszNoteText := PChar(sTexto);
    Msg.flFlags := MAPI_RECEIPT_REQUESTED;
    Msg.lpOriginator := pOrigen;
    Msg.nRecipCount := nPara;
    Msg.lpRecips := @aPara[0];
    if MapiSendMail(0,Application.Handle,Msg,MAPI_DIALOG,0) = SUCCESS_SUCCESS then
      ShowMessage('El correo se envi� correctamente');
  finally
    MapiFreeBuffer(pOrigen);
    slPara.Free;
    for nCont := 0 to nPara - 1 do MapiFreeBuffer(apPara[nCont]);
    Finalize(aPara);
  end;
  }
end;

procedure TfrmPresupuestos.mnuCopiarEmailClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('ds_email').AsString);
end;

procedure TfrmPresupuestos.mnuEnviarCorreoClick(Sender: TObject);
begin
  EnviarCorreo(ecNormal);
end;

procedure TfrmPresupuestos.btnExportarClick(Sender: TObject);
begin
  case dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_forma_pago').AsInteger of
    ID_FORMA_PAGO_INGRESO: begin
      ExportaHtml(not dmPresupuestos.EsPresupuestoAceptado,PLANTILLA_PRESUPUESTO);
      ExportaHtmlwww(not dmPresupuestos.EsPresupuestoAceptado,PLANTILLA_PRESUPUESTO_WWW);
    end;
    ID_FORMA_PAGO_REEMBOLOSO: begin
      ExportaHtml(not dmPresupuestos.EsPresupuestoAceptado,PLANTILLA_PRESUPUESTO_REEMBOLSO);
      ExportaHtmlwww(not dmPresupuestos.EsPresupuestoAceptado,PLANTILLA_PRESUPUESTO_REEMBOLSO_WWW);
    end;
  end;

  TfrmExplorer.ImprimirPdf;
  
  dmRanning.SubePedido(dmRanning.PathPresupuestoswww + NombreArchivo + '.htm');
end;

procedure TfrmPresupuestos.mnuCanariasClick(Sender: TObject);
begin
  dmPresupuestos.ActualizaPresupuestoCanarias;

  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuCopiaEnlacePedidoClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard('http://' + dmRanning.ServidorWeb +
    '/cgi-bin/wwwCarrito.exe/wcarrito?ver_id=' + NombreArchivo);
end;

procedure TfrmPresupuestos.btnVerHtmlClick(Sender: TObject);
begin
{
  ShellExecute(Handle,'open',PChar(PathHtml),nil,PChar(dmRanning.PathPresupuestos),
    SW_SHOWNORMAL);
}
  TfrmExplorer.ExploreFile(PathHtml,False);
end;

procedure TfrmPresupuestos.mnuEstadoInicialClick(Sender: TObject);
begin
  dmPresupuestos.PedidoEstadoCero(
    dbgCarritoPresupuesto.DataSource.Dataset.FieldByName('id_cliente_web').AsString);
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.AltaClienteAccess(lPreguntar: Boolean);

var
  sMsg: string;

begin
  sMsg := '�Quieres dar de alta el cliente en la base de datos de Access?';
  if lPreguntar then begin
    if MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      dmPresupuestos.AltaClienteAccess;
  end
  else
    dmPresupuestos.AltaClienteAccess;
end;

procedure TfrmPresupuestos.mnuAltaClienteAccessClick(Sender: TObject);
begin
  AltaClienteAccess(False);
end;

procedure TfrmPresupuestos.mnuAltaClienteClick(Sender: TObject);

var
  nCodCli: Integer;

begin
  nCodCli := StrToIntDef(InputBox('Datos para el alta de cliente',
    'C�digo de cliente en Access: ','-1'),-1);
  if nCodCli = -1 then Exit;

  dmPresupuestos.AltaCliente(nCodCli);
end;

procedure TfrmPresupuestos.mnuEnviarDatosClienteClick(Sender: TObject);
begin
  EnviarCorreo(ecDatosCliente);
end;

procedure TfrmPresupuestos.mnuVerDatosClienteClick(Sender: TObject);
begin
  ShowMessage(dmPresupuestos.DatosClientePresupuesto(True,True,True));
end;

procedure TfrmPresupuestos.mnuPresupuestoAnuladoClick(Sender: TObject);

var
  sMsg: string;

begin
  PresupuestoAnulado;
  sMsg := '�Quieres enviarle un correo de confirmaci�n de presupuesto anulado?';
  if MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
    EnviarCorreo(ecPresupuestoAnulado);
end;

procedure TfrmPresupuestos.PresupuestoAnulado;
begin
  dmPresupuestos.PresupuestoAnulado(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString);
  ActualizaPresupuesto;
end;

procedure TfrmPresupuestos.lblGrabaObsClick(Sender: TObject);
begin
  if not (dbmObservaciones.DataSource.DataSet.State in dsEditModes) then
    dbmObservaciones.DataSource.DataSet.Edit;
  dbmObservaciones.DataSource.DataSet.Post;
  ShowMessage('Se grabaron los cambios');
end;

procedure TfrmPresupuestos.lblCancelaObsClick(Sender: TObject);
begin
  dbmObservaciones.DataSource.DataSet.Cancel;
end;

procedure TfrmPresupuestos.mnuCopiarDNIClick(Sender: TObject);
begin
  dmRanning.CopyToClipboard(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('ds_dni').AsString);
end;

procedure TfrmPresupuestos.mnuEtiquetaEnvioSinTelefonoClick(
  Sender: TObject);
begin
  TqrpEtiquetaEnvio.PrintLabel(False);
end;

procedure TfrmPresupuestos.mnuEtiquetaEnvioConTelefonoClick(
  Sender: TObject);
begin
  TqrpEtiquetaEnvio.PrintLabel(True);
end;

procedure TfrmPresupuestos.mnuAltaDireccionClick(Sender: TObject);
begin
  dmPresupuestos.AltaDireccion(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente').AsInteger);
end;

procedure TfrmPresupuestos.mnuDevolucionClick(Sender: TObject);

var
  DataSet: TDataSet;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  DataSet.Edit;
  DataSet.FieldByName('it_devolucion').AsString := CAMPO_MARCADO;
  DataSet.Post;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuDescuentoEfectivoClick(Sender: TObject);

var
  DataSet: TDataSet;
  rDesc: Extended;
  sDesc: string;

begin
  rDesc := 0;
  sDesc := '';
  if not InputQuery('Descuento en efectivo','Descuento:',sDesc) then Exit;

  try
    rDesc := StrToFloat(sDesc);
  except
    ShowMessage('[' + sDesc + '] no es una cantidad v�lida');
    Exit;
  end;

  DataSet := dbgCarritoPresupuesto.DataSource.DataSet;
  DataSet.Edit;
  DataSet.FieldByName('nm_descuento_efectivo').AsFloat := rDesc;
  DataSet.Post;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuProductosPopup(Sender: TObject);

var
  DataSet: TDataSet;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  mnuDevolucion.Enabled := DataSet.Active and (not DataSet.IsEmpty) and
    (not dmPresupuestos.EsPresupuestoAceptado);
end;

procedure TfrmPresupuestos.CreaMenuEnvioPago;

var
  nCont: Integer;
  pMenu: TMenuItem;
  sqlEnvioPago: TZReadOnlyQuery;
  nItem: Integer;

begin
  mnuCambioEnvioPago.Clear;
  slMenuEnvioPago.Clear;
  sqlEnvioPago := dmRanning.ComandoSQL('select a.id_agencia_transporte, ' +
    'a.ds_agencia_transporte, fp.id_forma_pago, fp.ds_forma_pago from ' +
    'agencias_transporte a, formas_pago fp where (a.id_forma_pago = ' +
    'fp.id_forma_pago) and (a.it_activo = ' + QuotedStr(CAMPO_MARCADO) +
    ') order by a.ds_agencia_transporte, fp.ds_forma_pago',csResultado);
  sqlEnvioPago.First;
  while not sqlEnvioPago.Eof do begin
    nItem := slMenuEnvioPago.Add(sqlEnvioPago.FieldByName('id_agencia_transporte').AsString +
      '-' + sqlEnvioPago.FieldByName('id_forma_pago').AsString);
    pMenu := TMenuItem.Create(mnuCambioEnvioPago);
    pMenu.Caption := sqlEnvioPago.FieldByName('ds_agencia_transporte').AsString +
      ' - ' + sqlEnvioPago.FieldByName('ds_forma_pago').AsString;
    pMenu.Tag := nItem;
    pMenu.OnClick := mnuCambioEnvioPagoClick;
    mnuCambioEnvioPago.Add(pMenu);
    sqlEnvioPago.Next;
  end;
  dmRanning.ComandoSQLFree(sqlEnvioPago);
end;

procedure TfrmPresupuestos.mnuCambioEnvioPagoClick(Sender: TObject);

var
  DataSet: TDataSet;
  pMenu: TMenuItem;
  nPos: Integer;

begin
  pMenu := TMenuItem(Sender);
  nPos := Pos('-',slMenuEnvioPago[pMenu.Tag]);
  DataSet := dbgCarritoPresupuesto.DataSource.DataSet;
  DataSet.Edit;
  DataSet.FieldByName('id_agencia_transporte').AsString :=
    Copy(slMenuEnvioPago[pMenu.Tag],1,nPos - 1);
  DataSet.FieldByName('id_forma_pago').AsString :=
    ToEnd(slMenuEnvioPago[pMenu.Tag],nPos + 1);
  DataSet.Post;
  RefreshData([Id]);
end;

function TfrmPresupuestos.PuedeCopiarDireccion: Boolean;

var
  sMsg: string;
  lConf: Boolean;

begin
  if (not PuedeInsertarProducto) or
    (dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente').AsInteger <>
    dmClientes.sqlClientes.FieldByName('id_cliente').AsInteger) then begin
    Result := False;
    Exit;
  end;

  sMsg := 'La direcci�n del presupuesto es:' + #13 + #10 + #13 + #10 +
    dmPresupuestos.DatosClientePresupuesto(True,False,False) + #13 + #10 + #13 + #10 +
    'y la direcci�n que se va a copiar del cliente es:' + #13 + #10  + #13 + #10 +
    dmPresupuestos.DatosDireccionCliente(
    dmClientes.sqlDireccionesClientes.FieldByName('id_direccion').AsInteger) +
    #13 + #10  + #13 + #10 + '�Quieres copiar la direcci�n al presupuesto?';

  lConf := MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes;

  Result := lConf;
end;

procedure TfrmPresupuestos.mnuClienteDeParteClick(Sender: TObject);

var
  nCodCli: Integer;

begin
  nCodCli := StrToIntDef(InputBox('Datos para el cliente',
    'C�digo de cliente en Access: ','-1'),-1);
  if nCodCli = -1 then Exit;

  dmPresupuestos.ClienteDeParte(nCodCli);
end;

procedure TfrmPresupuestos.mnuDuplicaPresupuestoClick(Sender: TObject);
begin
  dmPresupuestos.DuplicaPresupuesto(
    dbgCarrito.DataSource.DataSet.FieldByName('id').AsInteger);

  ShowMessage('Presupuesto duplicado');

  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuRecogidaClick(Sender: TObject);

var
  Dataset: TDataSet;
  asEnvio: array[0..1] of string;
  pCallBack: TInputFormCallBack;
  sMsg: string;

begin
  Dataset := dbgCarritoPresupuesto.DataSource.DataSet;
  asEnvio[0] := Dataset.FieldByName('ds_codigo_envio').AsString;
  if Dataset.FieldByName('f_fecha_envio').IsNull then
    asEnvio[1] := FormatDateTime('dd/mm/yyyy',Date)
  else
    asEnvio[1] := Dataset.FieldByName('f_fecha_envio').AsString;
  pCallBack := InputFormCallBack;
  if not InputForm('Datos para seguimiento del env�o',['C�digo del env�o:','Fecha y hora del env�o:'],asEnvio,pCallBack) then
    Exit;

  dmPresupuestos.PresupuestoRecogida(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString);
  ActualizaPresupuesto;
end;

procedure TfrmPresupuestos.jvCorreoError(Sender: TJvMail;
  ErrorCode: Cardinal);

var
  sErrorMsg: string;

begin
  nErrorCorreo := ErrorCode;
  case nErrorCorreo of
    MAPI_USER_ABORT: sErrorMsg := 'Env�o cancelado por el usuario';
    MAPI_E_FAILURE: sErrorMsg := 'Fallo al enviar el correo';
    MAPI_E_LOGON_FAILURE: sErrorMsg := 'Fallo en la identificaci�n';
    MAPI_E_DISK_FULL: sErrorMsg := 'Disco lleno';
    MAPI_E_INSUFFICIENT_MEMORY: sErrorMsg := 'Memoria insuficiente';
    MAPI_E_ACCESS_DENIED: sErrorMsg := 'Acceso denegado';
    MAPI_E_TOO_MANY_SESSIONS: sErrorMsg := 'Demasiadas sesiones';
    MAPI_E_TOO_MANY_FILES: sErrorMsg := 'Demasiados archivos';
    MAPI_E_TOO_MANY_RECIPIENTS: sErrorMsg := 'Demasiados destinatarios';
    MAPI_E_ATTACHMENT_NOT_FOUND: sErrorMsg := 'Archivo adjunto no encontrado';
    MAPI_E_ATTACHMENT_OPEN_FAILURE: sErrorMsg := 'Fallo al abrir el archivo adjunto';
    MAPI_E_ATTACHMENT_WRITE_FAILURE: sErrorMsg := 'Fallo al escribir el archivo adjunto';
    MAPI_E_UNKNOWN_RECIPIENT: sErrorMsg := 'Destinatario desconocido';
    MAPI_E_BAD_RECIPTYPE: sErrorMsg := 'Tipo de destinatario err�neo';
    MAPI_E_NO_MESSAGES: sErrorMsg := 'Sin mensaje';
    MAPI_E_INVALID_MESSAGE: sErrorMsg := 'Mensaje no v�lido';
    MAPI_E_TEXT_TOO_LARGE: sErrorMsg := 'Texto demasiado largo';
    MAPI_E_INVALID_SESSION: sErrorMsg := 'Sesi�n no v�lida';
    MAPI_E_TYPE_NOT_SUPPORTED: sErrorMsg := 'Tipo no soportado';
    MAPI_E_AMBIGUOUS_RECIPIENT: sErrorMsg := 'Destinatario ambiguo';
    MAPI_E_MESSAGE_IN_USE: sErrorMsg := 'Mensaje en uso';
    MAPI_E_NETWORK_FAILURE: sErrorMsg := 'Fallo de red';
    MAPI_E_INVALID_EDITFIELDS: sErrorMsg := 'Campos de edici�n no v�lidos';
    MAPI_E_INVALID_RECIPS: sErrorMsg := 'Destinatario no v�lido';
    MAPI_E_NOT_SUPPORTED: sErrorMsg := 'No soportado';
  end;
  ShowMessage('Error al enviar el correo. ' + sErrorMsg + ' [' +
    IntToStr(ErrorCode) + ']');
end;

function TfrmPresupuestos.ErrorCorreo(nErrorCode: Cardinal): Boolean;
begin
  Result := nErrorCode <> SUCCESS_SUCCESS;
end;

procedure TfrmPresupuestos.CambiaDescuento(rDescuento: Extended);

var
  DataSet: TDataSet;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  DataSet.Edit;
  DataSet.FieldByName('nm_descuento').AsFloat := rDescuento;
  DataSet.Post;
end;

procedure TfrmPresupuestos.mnuCambiaPrecioSelClick(Sender: TObject);

var
  DataSet: TDataSet;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  CambiaDescuento(100 * (1 - StrToFloat(edPrecio.Text) / DataSet.FieldByName('nm_pvp').AsFloat));
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuCambiaPrecioTodosClick(Sender: TObject);

var
  DataSet: TDataSet;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  DataSet.DisableControls;
  try
    DataSet.First;
    while not DataSet.Eof do begin
      CambiaDescuento(100 * (1 - StrToFloat(edPrecio.Text) / DataSet.FieldByName('nm_pvp').AsFloat));
      DataSet.Next;
    end;
  finally
    DataSet.EnableControls;
  end;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.btnCambiaPrecioClick(Sender: TObject);

var
  pOrigen: TPoint;

begin
  pOrigen.x := TControl(Sender).Left;
  pOrigen.y := TControl(Sender).Top;
  pOrigen := TControl(Sender).ClientToScreen(pOrigen);
  mnuCambiaPrecio.Popup(pOrigen.x,pOrigen.y);
end;

procedure TfrmPresupuestos.mnuUnirClick(Sender: TObject);

var
  nIdCarrito1: Integer;
  nIdCarrito2: Integer;
  sIdCliente2: string;
  sqlIdCarrito2: TZReadOnlyQuery;

begin
  nIdCarrito1 := dbgCarrito.DataSource.DataSet.FieldByName('id').AsInteger;
  sIdCliente2 := '';
  if Clipboard.HasFormat(CF_TEXT) then sIdCliente2 := Clipboard.AsText;
  sqlIdCarrito2 := dmRanning.ComandoSQL('select id from carrito ' +
    'where id_cliente_web = ' + QuotedStr(sIdCliente2),csResultado);
  nIdCarrito2 := sqlIdCarrito2.FieldByName('id').AsInteger;
  dmRanning.ComandoSQLFree(sqlIdCarrito2);

  dmPresupuestos.UnePresupuestos(nIdCarrito1,nIdCarrito2);

  ShowMessage('Presupuestos unidos');

  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnucambiaPrecioTodoEsteClick(Sender: TObject);

var
  DataSet: TDataSet;
  nIdProducto: Integer;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  nIdProducto := DataSet.FieldByName('id_producto').AsInteger;
  DataSet.DisableControls;
  try
    DataSet.First;
    while not DataSet.Eof do begin
      if DataSet.FieldByName('id_producto').AsInteger = nIdProducto then
        CambiaDescuento(100 * (1 - StrToFloat(edPrecio.Text) / DataSet.FieldByName('nm_pvp').AsFloat));
      DataSet.Next;
    end;
  finally
    DataSet.EnableControls;
  end;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuCambiaDescuentoSelClick(Sender: TObject);
begin
  CambiaDescuento(StrToFloat(edDescuento.Text));
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuCambiaDescuentoTodoEsteClick(
  Sender: TObject);

var
  DataSet: TDataSet;
  nIdProducto: Integer;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  nIdProducto := DataSet.FieldByName('id_producto').AsInteger;
  DataSet.DisableControls;
  try
    DataSet.First;
    while not DataSet.Eof do begin
      if DataSet.FieldByName('id_producto').AsInteger = nIdProducto then
        CambiaDescuento(StrToFloat(edDescuento.Text));
      DataSet.Next;
    end;
  finally
    DataSet.EnableControls;
  end;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuCambiaDescuentoTodosClick(Sender: TObject);

var
  DataSet: TDataSet;

begin
  DataSet := dbgCarrito.DataSource.DataSet;
  DataSet.DisableControls;
  try
    DataSet.First;
    while not DataSet.Eof do begin
      CambiaDescuento(StrToFloat(edDescuento.Text));
      DataSet.Next;
    end;
  finally
    DataSet.EnableControls;
  end;
  RefreshData([Id]);
end;

procedure TfrmPresupuestos.mnuPagadoClick(Sender: TObject);

var
  sMsg: string;

begin
  PresupuestoPagado;

  sMsg := '�Quieres enviarle un correo de confirmaci�n de presupuesto pagado?';
  if MessageDlg(sMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
    EnviarCorreo(ecPresupuestoPagado);
end;

procedure TfrmPresupuestos.PresupuestoPagado;
begin
  dmPresupuestos.PresupuestoPagado(
    dbgCarritoPresupuesto.DataSource.DataSet.FieldByName('id_cliente_web').AsString);
  ActualizaPresupuesto;
end;

end.

