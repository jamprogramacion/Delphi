unit ufrmRanning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Psock, NMFtp, ComCtrls, UFRMMDICHILDBASE, AppEvnts;

const
  MSG_ACTIVA_RANNING = 'B5CEF86A-DF62-4ADA-9581-6AA4F9A75F62';

type
  TfrmRanning = class(TForm)
    mnRanning: TMainMenu;
    mnCatalogos: TMenuItem;
    mnSalir: TMenuItem;
    mnProductos: TMenuItem;
    mnColores: TMenuItem;
    mnCarreras: TMenuItem;
    mnClientes: TMenuItem;
    mnFacturas: TMenuItem;
    mnUtilidades: TMenuItem;
    mnBorraStockCero: TMenuItem;
    mnVentas: TMenuItem;
    mnPresupuestos: TMenuItem;
    mnuEtiquetas: TMenuItem;
    mnuEtiquetasArchivo: TMenuItem;
    mnGeneraID62: TMenuItem;
    mnuConfiguracion: TMenuItem;
    mnuConfiguracionServidorWeb: TMenuItem;
    mnuConfiguracionServidorWebLocal: TMenuItem;
    mnuConfiguracionServidorWebWeb: TMenuItem;
    mnRanningDay: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuPresupuestos: TMenuItem;
    mnuSubirTablas: TMenuItem;
    mnLetraNIF: TMenuItem;
    mnPasaClientesAccess: TMenuItem;
    mnClientesAccess: TMenuItem;
    mnProvMuni: TMenuItem;
    mnCodigoColor: TMenuItem;
    mnuSubirImagenes: TMenuItem;
    sbRanning: TStatusBar;
    mnTipoComplemento: TMenuItem;
    mnuVentanas: TMenuItem;
    mnuVentanasMinimizar: TMenuItem;
    procedure mnSalirClick(Sender: TObject);
    procedure mnProductosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnColoresClick(Sender: TObject);
    procedure mnCarrerasClick(Sender: TObject);
    procedure mnClientesClick(Sender: TObject);
    procedure mnFacturasClick(Sender: TObject);
    procedure mnBorraStockCeroClick(Sender: TObject);
    procedure mnVentasClick(Sender: TObject);
    procedure mnPresupuestosClick(Sender: TObject);
    procedure mnuEtiquetasArchivoClick(Sender: TObject);
    procedure mnGeneraID62Click(Sender: TObject);
    procedure mnuConfiguracionServidorWebLocalClick(Sender: TObject);
    procedure mnuConfiguracionServidorWebWebClick(Sender: TObject);
    procedure mnRanningDayClick(Sender: TObject);
    procedure mnuSubirTablasClick(Sender: TObject);
    procedure mnuPresupuestosClick(Sender: TObject);
    procedure mnLetraNIFClick(Sender: TObject);
    procedure mnPasaClientesAccessClick(Sender: TObject);
    procedure mnClientesAccessClick(Sender: TObject);
    procedure mnProvMuniClick(Sender: TObject);
    procedure mnCodigoColorClick(Sender: TObject);
    procedure mnuSubirImagenesClick(Sender: TObject);
    procedure mnTipoComplementoClick(Sender: TObject);
    procedure mnuVentanasMinimizarClick(Sender: TObject);
  private
    bmpRana: TBitmap;

    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure MFileSubirImg(var Message: TMessage); message MSG_FILE_SUBIR_IMG;
    procedure ActualizaCaption;
    procedure ActualizaBarraEstado;
    procedure ApplicationException(Sender: TObject; E: Exception);

    procedure Cerrar;
    procedure GeneraID62;
  protected
    //procedure WndProc(var Message: TMessage); override;
  public
    { Public declarations }
  end;

var
  frmRanning: TfrmRanning;
  nMsgRanning: UINT;

implementation

uses ufrmProductos, ufrmColores, ufrmSubeTablas, ufrmCarreras,
  ufrmDirecciones, ufrmClientes, ufrmFacturas, udmRanning, ufrmVentas,
  ufrmPresupuestos, ufrmEtiquetas, uCommon, clipbrd, ufrmInicio,
  ufrmClientesAccess, ufrmProvMuni, uConst, ufrmTipoComplemento;

{$R *.DFM}

procedure TfrmRanning.Cerrar;
begin
  Close;
end;

procedure TfrmRanning.mnSalirClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TfrmRanning.mnProductosClick(Sender: TObject);
begin
  TfrmProductos.ShowForm;
end;

procedure TfrmRanning.WMPaint(var Message: TWMPaint);

var
  hndPaint: HDC;
  pPaintStr: TPaintStruct;

begin
  inherited;

  hndPaint := BeginPaint(ClientHandle,pPaintStr);
  try
    BitBlt(hndPaint,ClientWidth div 2 - bmpRana.Width div 2,
      ClientHeight div 2 - bmpRana.Height div 2,bmpRana.Width,bmpRana.Height,
      bmpRana.Canvas.Handle,0,0,SRCCOPY);
  finally
    EndPaint(Handle,pPaintStr);
  end;
end;

procedure TfrmRanning.FormCreate(Sender: TObject);
begin
  if not Assigned(dmRanning) then dmRanning := TdmRanning.Create(Self);
  ActualizaCaption;
  bmpRana := TBitmap.Create;
  bmpRana.LoadFromFile(dmRanning.PathServidor + 'rana.bmp');
  RegisterFormMainMenu(mnRanning);
  Application.OnException := ApplicationException;
  ActualizaBarraEstado;
end;

procedure TfrmRanning.FormDestroy(Sender: TObject);
begin
  bmpRana.Free;
end;

procedure TfrmRanning.mnColoresClick(Sender: TObject);
begin
  TfrmColores.ShowForm;
end;

procedure TfrmRanning.mnCarrerasClick(Sender: TObject);
begin
  TfrmCarreras.ShowForm;
end;

procedure TfrmRanning.mnClientesClick(Sender: TObject);
begin
  TfrmClientes.ShowForm;
end;

procedure TfrmRanning.mnFacturasClick(Sender: TObject);
begin
  TfrmFacturas.ShowForm;
end;

procedure TfrmRanning.mnBorraStockCeroClick(Sender: TObject);
begin
  dmRanning.BorraStockCero;
  ShowMessage('Proceso terminado');
end;

procedure TfrmRanning.mnVentasClick(Sender: TObject);
begin
  TfrmVentas.ShowForm;
end;

procedure TfrmRanning.mnPresupuestosClick(Sender: TObject);
begin
  TfrmPresupuestos.ShowForm;
end;

procedure TfrmRanning.mnuEtiquetasArchivoClick(Sender: TObject);
begin
  TfrmEtiquetas.ShowForm;
end;

procedure TfrmRanning.mnGeneraID62Click(Sender: TObject);
begin
  GeneraID62;
end;

procedure TfrmRanning.GeneraID62;

var
  sGUID: string;

begin
  sGUID := CreateGUID62;
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(sGUID));
  ShowMessage('El código generado es: ' + sGUID + #13 + #10 + 'Se ha copiado en' +
    ' el portapapeles');
end;

procedure TfrmRanning.ActualizaCaption;
begin
  Caption := 'Ranning, el programa (' + dmRanning.DescConfiguracionWeb + ')';
  mnuConfiguracionServidorWebLocal.Checked := dmRanning.ConfiguracionWeb = cLocal;
  mnuConfiguracionServidorWebWeb.Checked := dmRanning.ConfiguracionWeb = cWeb;
  Application.ProcessMessages;
end;

procedure TfrmRanning.mnuConfiguracionServidorWebLocalClick(
  Sender: TObject);
begin
  dmRanning.CargaConfiguracion(cLocal);
  ActualizaCaption;
end;

procedure TfrmRanning.mnuConfiguracionServidorWebWebClick(Sender: TObject);
begin
  dmRanning.CargaConfiguracion(cWeb);
  ActualizaCaption;
end;

procedure TfrmRanning.mnRanningDayClick(Sender: TObject);

var
  nDia: Word;
  nMes: Word;
  nAno: word;

begin
  DecodeDate(Date,nAno,nMes,nDia);
  ShowMessage(FormatDateTime('dddd, dd/mm/yyyy',dmRanning.RanningDay(nMes + 1,nAno)));
end;

procedure TfrmRanning.mnuSubirTablasClick(Sender: TObject);
begin
  TfrmSubeTablas.ShowForm;
end;

procedure TfrmRanning.mnuPresupuestosClick(Sender: TObject);
begin
  dmRanning.MantenimientoPresupuestos(True);
end;

procedure TfrmRanning.ApplicationException(Sender: TObject; E: Exception);
begin
  if Sender is TControl then
    ShowMessage('Excepción de clase ' + E.ClassName + ' en el objeto ' +
      TControl(Sender).Name + #13 + #10 + E.Message);

  HideProgress;
end;

procedure TfrmRanning.mnLetraNIFClick(Sender: TObject);

var
  sDNI: string;

begin
  sDNI := '';
  if not InputQuery('Cálculo de la letra de un DNI','DNI sin letra:',sDNI) then
    Exit;

  try
    StrToInt(sDNI);
  except
    ShowMessage('Número de DNI incorrecto');
    Exit;
  end;

  sDNI := sDNI + LetraNIF(sDNI);
  ShowMessage('El DNI completo es ' + sDNI + #13 + #10 +
    'Se ha copiado en el portapapeles');
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(sDNI));
end;

procedure TfrmRanning.mnPasaClientesAccessClick(Sender: TObject);
begin
  dmRanning.ActualizaClientesAccess;
end;

procedure TfrmRanning.mnClientesAccessClick(Sender: TObject);
begin
  TfrmClientesAccess.ShowForm;
end;

procedure TfrmRanning.mnProvMuniClick(Sender: TObject);
begin
  TfrmProvMuni.ShowForm;
end;

procedure TfrmRanning.mnCodigoColorClick(Sender: TObject);

var
  sColor: string;

begin
  if not InputQuery('Cálculo del código de color','Id color:',sColor) then
    Exit;

  if StrToIntDef(sColor,0) = 0 then Exit;

  ShowMessage(LowerCase(ToBase(sColor,10,BASE_CD_COLOR,DIGITOS_CD_COLOR)));
end;

procedure TfrmRanning.mnuSubirImagenesClick(Sender: TObject);
begin
  dmRanning.SubeImagenes(False);
end;

procedure TfrmRanning.MFileSubirImg(var Message: TMessage);
begin
  ActualizaBarraEstado;
end;

procedure TfrmRanning.ActualizaBarraEstado;
begin
  if dmRanning.ImagenesPendientes then
    sbRanning.SimpleText := 'Hay imágenes pendientes de subir a la web...'
  else
    sbRanning.SimpleText := '';
end;

{
procedure TfrmRanning.WndProc(var Message: TMessage);
begin
  if (Message.Msg = nMsgRanning) and (not Application.Terminated) then
    Application.Restore
  else
    inherited;
end;
}

procedure TfrmRanning.mnTipoComplementoClick(Sender: TObject);
begin
  TfrmTipoComplemento.ShowForm;
end;

procedure TfrmRanning.mnuVentanasMinimizarClick(Sender: TObject);

var
  nCont: Integer;

begin
  for nCont := MDIChildCount - 1 downto 0 do
    MDIChildren[nCont].Close;
end;

end.
