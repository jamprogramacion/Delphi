unit ufrmStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMMDICHILDBASE, DBCtrls, ExtCtrls, uJAMContainers, Grids, DBGrids,
  StdCtrls, Mask, JAMDBLabelEdit, uJAMDBControls, Buttons, OleCtnrs, db,
  Menus, ComCtrls, ExtDlgs;

type
  TfrmStock = class(TfrmMDIChildBase)
    JAMPanel1: TJAMPanel;
    dbnStock: TDBNavigator;
    dbgStock: TDBGrid;
    pnCombos: TJAMPanel;
    dbeFEntrada: TJAMDBLabelEdit;
    dbeNmCoste: TJAMDBLabelEdit;
    dbeNmIVA: TJAMDBLabelEdit;
    dbeNmPVP: TJAMDBLabelEdit;
    dbeNmCantidad: TJAMDBLabelEdit;
    dbeNmPortes: TJAMDBLabelEdit;
    dbeNmDescuentoCoste: TJAMDBLabelEdit;
    lblTalla: TLabel;
    dbcbTalla: TJAMDBIdComboBox;
    btnTallas: TButton;
    Label4: TLabel;
    lblMargen: TStaticText;
    Label5: TLabel;
    lblPVPFinal: TStaticText;
    SpeedButton1: TSpeedButton;
    lblGanancia: TStaticText;
    Label6: TLabel;
    lblDescMaximo: TStaticText;
    Label7: TLabel;
    dbnProductos: TDBNavigator;
    lblImagen: TLabel;
    mnuImagen: TPopupMenu;
    mnuImagenActualizar: TMenuItem;
    mnuImagenDetalle: TMenuItem;
    imgProducto: TImage;
    dlgImagenProducto: TOpenPictureDialog;
    mnuImagenSeleccionar: TMenuItem;
    mnuImagenBorrar: TMenuItem;
    JAMDBLabelEdit1: TJAMDBLabelEdit;
    mnuProductos: TMainMenu;
    mnuEtiquetas: TMenuItem;
    mnuEtiquetasProducto: TMenuItem;
    mnuEtiquetasOferta: TMenuItem;
    mnuEtiquetasArchivo: TMenuItem;
    JAMPanel2: TJAMPanel;
    JAMDBLabelEdit2: TJAMDBLabelEdit;
    mnuPresupuestos: TMenuItem;
    mnuInsertaProducto: TMenuItem;
    dbcbTemporada: TJAMDBIdComboBox;
    Label8: TLabel;
    mnuUtilidades: TMenuItem;
    mnuUtilidadesEnlaceImagen: TMenuItem;
    DBText1: TDBText;
    DBText2: TDBText;
    btnColores: TButton;
    lblPrecioOferta: TStaticText;
    lblPrecioOfertaLbl: TLabel;
    btnVariosColores: TButton;
    btnOferta: TSpeedButton;
    mnuStock: TPopupMenu;
    mnuInsertaPedido: TMenuItem;
    mnuInsertaTallaPedido: TMenuItem;
    dbeNmDescuentoOferta: TJAMDBLabelEdit;
    procedure dbnStockClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnTallasClick(Sender: TObject);
    procedure dbeNmCosteExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbcbDescuentoChange(Sender: TObject);
    procedure dbeNmPVPChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgStockTitleClick(Column: TColumn);
    procedure mnuImagenActualizarClick(Sender: TObject);
    procedure mnuImagenDetalleClick(Sender: TObject);
    procedure dbgStockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuImagenSeleccionarClick(Sender: TObject);
    procedure mnuImagenBorrarClick(Sender: TObject);
    procedure mnuImagenPopup(Sender: TObject);
    procedure mnuEtiquetasProductoClick(Sender: TObject);
    procedure mnuEtiquetasArchivoClick(Sender: TObject);
    //procedure mnuEtiquetasClick(Sender: TObject);
    procedure mnuPresupuestosClick(Sender: TObject);
    procedure mnuInsertaProductoClick(Sender: TObject);
    procedure dbnStockBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure mnuUtilidadesEnlaceImagenClick(Sender: TObject);
    procedure btnColoresClick(Sender: TObject);
    procedure btnVariosColoresClick(Sender: TObject);
    procedure btnOfertaClick(Sender: TObject);
    procedure mnuInsertaPedidoClick(Sender: TObject);
    procedure dbnProductosClick(Sender: TObject; Button: TNavigateBtn);
    procedure mnuInsertaTallaPedidoClick(Sender: TObject);
    procedure dbeFEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    nIdProd: Integer;
    slTallas: TStringList;
    slColores: TStringList;
    rMargen: Extended;
    lInsertando: Boolean;
    sImagen: TFileName;

    procedure MRefresh(var Message: TMessage); message MSG_REFRESH;
    procedure MTallas(var Message: TMessage); message MSG_TALLAS;
    procedure MColores(var Message: TMessage); message MSG_COLORES;
    procedure CargaImagenProducto;
    procedure StockAfterScroll(DataSet: TDataSet);
    procedure ActualizaPVPFinal;
    procedure ActualizaTitulo;
    procedure ActualizaCantidad(Key: Word);
    function ImagenProducto: TFileName;
    function ImagenProductoPequena: TFileName;
    procedure BorraImagenProducto(lPreguntar: Boolean);
    procedure mnuEtiquetasOfertaDescClick(Sender: TObject);
    procedure ActualizaCambioProducto;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class procedure ShowForm; overload; override;
    class procedure ShowForm(nIdProducto: Integer); reintroduce; overload;
  end;

implementation

uses udmProductos, ufrmTallas, uCommon, uJAMIntf, ufrmImagenProducto,
  udmRanning, gifimage, jpeg, ufrmEtiquetas, uqrpEtiquetasOferta, FileCtrl,
  Clipbrd, ufrmSelColores, ZDataset;

{$R *.DFM}

var
  frmStock: TfrmStock = nil;

{ TfrmStock }

constructor TfrmStock.Create(AOwner: TComponent);
begin
  inherited;

  lInsertando := False;
  slTallas := TStringList.Create;
  slColores := TStringList.Create;
  dmProductos.StockAfterScrollEvent := StockAfterScroll;
  PostDataset := dbgStock.DataSource.DataSet;
  DatasetList.Add(dbgStock.DataSource.DataSet);
  DatasetList.Add(dmProductos.sqlMarcasTipoProductoMargen);
  DatasetList.Add(dmProductos.sqlPedidosMarca);
  CombosPanelList.Add(pnCombos);
  sImagen := '';
end;

class procedure TfrmStock.ShowForm;
begin
  if not Assigned(frmStock) then begin
    frmStock := TfrmStock.Create(Application);
    frmStock.Id := nvStock;
  end;

  frmStock.nIdProd := -1;

  frmStock.RefreshData([frmStock.Id]);
  frmStock.WindowState := wsNormal;
  frmStock.Show;
end;

procedure TfrmStock.MRefresh(var Message: TMessage);
begin
  inherited;

  if not Boolean(Message.Result) then Exit;

  if nIdProd <> -1 then
    dmProductos.sqlProductos.Locate('id_producto',nIdProd,[]);

  FillAllLists(pnCombos);
  ActualizaTitulo;
  btnTallas.Enabled := dbgStock.DataSource.DataSet.RecordCount <> 0;
  CargaImagenProducto;
  rMargen := dmProductos.MargenProducto(
    dmProductos.sqlProductos.FieldByName('id_marca').AsInteger,
    dmProductos.sqlProductos.FieldByName('id_tipo_producto').AsInteger);
  lblMargen.Caption := FloatToStr(rMargen) + ' %';
  ActualizaPVPFinal;
end;

class procedure TfrmStock.ShowForm(nIdProducto: Integer);
begin
  ShowForm;

  frmStock.nIdProd := nIdProducto;
  frmStock.dbgStock.DataSource.DataSet.Locate('id_producto',frmStock.nIdProd,[]);
end;

procedure TfrmStock.dbnStockClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  nIdProd := dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger;
  case Button of
    nbPost, nbDelete: RefreshData([Id]);
    nbInsert: ActualizaCombos;
    nbCancel: ActualizaPVPFinal;
  end;
end;

procedure TfrmStock.btnTallasClick(Sender: TObject);
begin
  lInsertando := True;
  TfrmTallas.ShowForm(Handle,slTallas);
end;

procedure TfrmStock.MTallas(var Message: TMessage);
begin
  if slTallas.Count <> 0 then begin
    nIdProd := dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger;
    dmProductos.InsertaTallas(slTallas);
    RefreshData([Id]);
  end;
  lInsertando := False;
end;

destructor TfrmStock.Destroy;
begin
  slTallas.Free;
  slColores.Free;

  inherited;
end;

procedure TfrmStock.CargaImagenProducto;

var
  sImg: TFileName;

begin
  sImg := dmProductos.ImagenProducto(
    dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString);
  if sImg = sImagen then Exit;

  sImagen := sImg;
  if sImg <> IMG_NO_DISPONIBLE then
    lblImagen.Caption := ExtractFileName(sImg)
  else
    lblImagen.Caption := '';
  lblImagen.Hint := lblImagen.Caption;

  imgProducto.Picture.LoadFromFile(sImg);
end;

procedure TfrmStock.dbeNmCosteExit(Sender: TObject);
begin
  if not (dbeNmCoste.DataSource.State in dsEditModes) then
   dbeNmCoste.DataSource.Edit;
  dbeNmPVP.Field.AsFloat :=
    dbeNmCoste.DataSource.DataSet.FieldByName('nm_coste').AsFloat * (1 +
    rMargen / 100);
end;

procedure TfrmStock.StockAfterScroll(DataSet: TDataSet);
begin
  ActualizaCambioProducto;
end;

procedure TfrmStock.FormActivate(Sender: TObject);
begin
  if lInsertando or (not Assigned(frmStock)) or (PostDataset.State in dsEditModes) then
    Exit;

  RefreshData([Id]);
end;

procedure TfrmStock.ActualizaPVPFinal;

var
  rGanancia: Extended;
  rMargenReal: Extended;
  rCosteReal: Extended;
  rDescMax: Extended;
  rDescOferta: Extended;
  rPrecioOferta: Extended;

begin
  if dbeNmPVP.DataSource.DataSet.IsEmpty then Exit;

  try
    if Assigned(dbeNmPVP.Field) then
      lblPVPFinal.Caption := dmRanning.FormateaPrecio(dbeNmPVP.Field.AsFloat *
        (1 - StrToFloat(dbeNmDescuentoOferta.Text) / 100));
  except
    lblPVPFinal.Caption := '';
  end;
  try
    if Assigned(dbeNmDescuentoCoste.Field) and Assigned(dbeNmIVA.Field) and
       Assigned(dbeNmDescuentoOferta.Field) then begin
      if dbeNmDescuentoCoste.Field.AsFloat = 0 then
        rCosteReal := dbeNmCoste.Field.AsFloat
      else 
        rCosteReal := dbeNmCoste.Field.AsFloat * (1 -
          dbeNmDescuentoCoste.Field.AsFloat / 100);
      rMargenReal := (dbeNmPVP.Field.AsFloat - rCosteReal) * 100 / rCosteReal;

      rGanancia := dbeNmPVP.Field.AsFloat *
      (1 - dbeNmDescuentoOferta.Field.AsFloat / 100) /
      (1 + dbeNmIVA.Field.AsFloat / 100) - rCosteReal;
      lblGanancia.Caption := dmRanning.FormateaPrecio(rGanancia) + ' (' +
      FloatToStrF(rGanancia * 100 / rCosteReal,ffFixed,5,2) + '%)';
    end
    else
      lblGanancia.Caption := '';
  except
    lblGanancia.Caption := '';
  end;
  try
    rDescMax := 100 - 100 * (1 + dbeNmIVA.Field.AsFloat / 100) /
      (1 + rMargenReal / 100);
    lblDescMaximo.Caption := FloatToStrF(rDescMax,ffFixed,5,2) + '%';
  except
    lblDescMaximo.Caption := '';
  end;

  rDescOferta := dmProductos.DescuentoOferta;
  lblPrecioOferta.Visible := rDescOferta <> 0;
  lblPrecioOfertaLbl.Visible := rDescOferta <> 0;
  if rDescOferta = 0 then Exit;

  lblPrecioOferta.Caption := dmRanning.FormateaPrecio(dmProductos.sqlOfertas.FieldByName('nm_precio_final_oferta')) +
    ' (' + dmRanning.FormateaPorcentaje(rDescOferta) + ')';
end;

procedure TfrmStock.dbcbDescuentoChange(Sender: TObject);
begin
  ActualizaPVPFinal;
end;

procedure TfrmStock.dbeNmPVPChange(Sender: TObject);
begin
  ActualizaPVPFinal;
end;

procedure TfrmStock.SpeedButton1Click(Sender: TObject);
begin
  if not (dbeNmCantidad.DataSource.State in dsEditModes) then
   dbeNmCantidad.DataSource.Edit;
  dbeNmCantidad.Field.AsInteger := 0;
end;

procedure TfrmStock.dbgStockTitleClick(Column: TColumn);

const
   asCAMPOS_DS: array[0..3] of string = ('ds_talla','cd_color_marca','ds_color',
     'ds_temporada');
   asCAMPOS_ID: array[0..3] of string = ('id_talla','id_color','cd_color',
     'id_temporada');

var
  dbSel: TDBGrid;
  sqlSel: TDataSet;
  slId: TStringList;
  fldCampo: TField;
  fldCampoMsg: TField;
  nPos: Integer;
  sUltimo: TBookmarkStr;
  lTodos: Boolean;

begin
  slId := nil;
  dbSel := TDBGrid(Column.Grid);
  lTodos := dbSel.SelectedRows.Count = 1;
  sqlSel := Column.Field.DataSet;
  sUltimo := sqlSel.Bookmark;
  nPos := PosArray(Column.FieldName,asCAMPOS_DS);
  if nPos = (Low(asCAMPOS_DS) - 1) then begin
    fldCampo := sqlSel.FieldByName(Column.Field.FieldName);
    fldCampoMsg := fldCampo;
  end
  else begin
    fldCampo := sqlSel.FieldByName(asCAMPOS_ID[nPos]);
    fldCampoMsg := Column.Field;
  end;
  sqlSel.DisableControls;
  try
    slId := TStringList.Create;
    sqlSel.First;
    while not sqlSel.Eof do begin
      if lTodos or dbSel.SelectedRows.CurrentRowSelected then
        slId.Add(sqlSel.FieldByName('id').AsString);
      sqlSel.Next;
    end;
    sqlSel.Bookmark := sUltimo;
    if not dmProductos.CopiaValorTodos(fldCampo,fldCampoMsg,slId.CommaText) then
      Exit;
  finally
    slId.Free;
    sqlSel.EnableControls;
  end;

  RefreshData([Id]);
end;

procedure TfrmStock.ActualizaTitulo;
begin
  Caption := 'Stock. ' +
    dmProductos.sqlProductos.FieldByName('cd_producto').AsString + ' - ' +
    dmProductos.sqlProductos.FieldByName('ds_marca').AsString + ' - ' +
    dmProductos.sqlProductos.FieldByName('ds_producto').AsString + ' (' +
    dmProductos.sqlProductos.FieldByName('ds_tipo_sexo').AsString + ')';
  lblTalla.Caption :=
    dbcbTalla.ListDataSource.DataSet.FieldByName('ds_tipo_talla').AsString;
end;

procedure TfrmStock.mnuImagenActualizarClick(Sender: TObject);
begin
  sImagen := '';
  CargaImagenProducto;
end;

procedure TfrmStock.mnuImagenDetalleClick(Sender: TObject);
begin
  TfrmImagenProducto.ShowForm(ImagenProducto);
end;

procedure TfrmStock.ActualizaCantidad(Key: Word);

const
  TECLA_MENOS = 189;
  TECLA_MAS = 187;
  TECLAS_CANTIDAD = [VK_SUBTRACT,VK_ADD,TECLA_MENOS,TECLA_MAS];
  TECLAS_NUMEROS = [Ord('0')..Ord('9')];
  TECLAS_NUMERICO = [VK_NUMPAD0,VK_NUMPAD1,VK_NUMPAD2,VK_NUMPAD3,VK_NUMPAD4,
    VK_NUMPAD5,VK_NUMPAD6,VK_NUMPAD7,VK_NUMPAD8,VK_NUMPAD9];

begin
  if not (Key in (TECLAS_CANTIDAD + TECLAS_NUMEROS + TECLAS_NUMERICO)) then Exit;

  case Key of
    VK_NUMPAD0: Key := Ord('0');
    VK_NUMPAD1: Key := Ord('1');
    VK_NUMPAD2: Key := Ord('2');
    VK_NUMPAD3: Key := Ord('3');
    VK_NUMPAD4: Key := Ord('4');
    VK_NUMPAD5: Key := Ord('5');
    VK_NUMPAD6: Key := Ord('6');
    VK_NUMPAD7: Key := Ord('7');
    VK_NUMPAD8: Key := Ord('8');
    VK_NUMPAD9: Key := Ord('9');
  end;

  if not (dbeNmCantidad.DataSource.State in dsEditModes) then
    dbeNmCantidad.DataSource.Edit;

  case Key of
    VK_SUBTRACT, TECLA_MENOS: if dbeNmCantidad.Field.AsInteger > 0 then
      dbeNmCantidad.Field.AsInteger := dbeNmCantidad.Field.AsInteger - 1;
    VK_ADD, TECLA_MAS: dbeNmCantidad.Field.AsInteger :=
      dbeNmCantidad.Field.AsInteger + 1;
  else
    dbeNmCantidad.Field.AsInteger := StrToInt(Chr(Key));
  end;
end;

procedure TfrmStock.dbgStockKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ActualizaCantidad(Key);
end;


procedure TfrmStock.mnuImagenSeleccionarClick(Sender: TObject);

var
  imgOrigen: TPicture;
  imgGif: TGIFImage;
  sImg: TFileName;
  sImgPeq: TFileName;
  sImgDir: TFileName;
  sCdProd: string;

begin
  sImg := ImagenProducto;
  sImgPeq := ImagenProductoPequena;

  if FileExists(sImg) or FileExists(sImgPeq) then
    if MessageDlg('La imagen de este producto ya existe. ¿Quieres borrarla?',mtWarning,[mbYes,mbNo],0) = mrYes then
      BorraImagenProducto(False)
    else
      Exit;

  sCdProd := dmProductos.sqlProductos.FieldByName('cd_producto').AsString;
  dlgImagenProducto.Filter := 'All images (*.gif;*.jpg;*.jpeg;*.bmp)|*.gif;' +
    '*.jpg;*.jpeg;*.bmp|' + GraphicFilter(TGIFImage) + '|' +
    GraphicFilter(TJPEGImage) + '|' + GraphicFilter(TBitmap);

  dlgImagenProducto.Title := 'Imagen del producto ' + sCdProd + ' (' +
    dbgStock.DataSource.DataSet.FieldByName('cd_color_fabricante').AsString + ')';
  sImgDir := dmRanning.PathFotosProductos + 
    dmProductos.sqlProductos.FieldByName('cd_marca').AsString;
  if DirectoryExists(sImgDir) then dlgImagenProducto.InitialDir := sImgDir;
  if not dlgImagenProducto.Execute then Exit;

  if Pos(ExtractFileExt(dlgImagenProducto.FileName),GraphicFileMask(TGIFImage)) <> 0 then begin
    if not DirectoryExists(ExtractFileDir(sImg)) then
      CreateDir(ExtractFileDir(sImg));
    if CopyFile(PChar(dlgImagenProducto.FileName),PChar(sImg),True) then
      dmProductos.CambiaFechaFichero(sImg,Now)
    else
      RaiseLastWin32Error;
  end;

  imgOrigen := nil;
  imgGif := TGIFImage.Create;
  try
    imgOrigen := TPicture.Create;
    imgGif.ColorReduction := rmQuantize;
    imgGif.DitherMode := dmFloydSteinberg;
    if Pos(ExtractFileExt(dlgImagenProducto.FileName),GraphicFileMask(TGIFImage)) = 0 then begin
      imgOrigen.LoadFromFile(dlgImagenProducto.FileName);
      imgGif.Assign(imgOrigen);
      if not DirectoryExists(ExtractFileDir(sImg)) then
        CreateDir(ExtractFileDir(sImg));
      imgGif.SaveToFile(sImg);
    end
    else
      imgGif.LoadFromFile(dlgImagenProducto.FileName);
    imgOrigen.Bitmap.Height := 75;
    imgOrigen.Bitmap.Width := 75;
    imgOrigen.Bitmap.Canvas.StretchDraw(Rect(0,0,imgOrigen.Bitmap.Width,
      imgOrigen.Bitmap.Height),imgGif.Bitmap);
    imgGif.Clear;
    imgGif.Assign(imgOrigen.Bitmap);
      if not DirectoryExists(ExtractFileDir(sImgPeq)) then
        CreateDir(ExtractFileDir(sImgPeq));
    imgGif.SaveToFile(sImgPeq);
  finally
    imgOrigen.Free;
    imgGif.Free;
  end;

  dmRanning.ImagenModificada(LowerCase(dmProductos.NombreImagenProducto(
    dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString)));

  sImagen := '';
  CargaImagenProducto;
end;

function TfrmStock.ImagenProducto: TFileName;
begin
  Result := LowerCase(dmRanning.PathImages + PATH_IMG_PRODUCTOS +
    dmProductos.NombreImagenProducto(
    dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString));
end;

function TfrmStock.ImagenProductoPequena: TFileName;
begin
  Result := LowerCase(dmRanning.PathImages + PATH_IMG_P_PRODUCTOS +
    dmProductos.NombreImagenProductoPequena(
    dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString));
end;

procedure TfrmStock.mnuImagenBorrarClick(Sender: TObject);
begin
  BorraImagenProducto(True);
end;

procedure TfrmStock.BorraImagenProducto(lPreguntar: Boolean);
begin
  if lPreguntar then
    if MessageDlg('¿Estás seguro de borrar la imagen de este producto?',mtWarning,[mbYes,mbNo],0) <> mrYes then
      Exit;

  DeleteFile(ImagenProducto);
  DeleteFile(ImagenProductoPequena);
end;

procedure TfrmStock.mnuImagenPopup(Sender: TObject);
begin
  mnuImagenBorrar.Enabled := FileExists(ImagenProducto) or
    FileExists(ImagenProductoPequena);
end;

procedure TfrmStock.mnuEtiquetasProductoClick(Sender: TObject);
begin
  TfrmEtiquetas.Add(dbgStock.DataSource.DataSet,'id_producto',rpActual);
  RefreshData([nvEtiquetas]);
end;

procedure TfrmStock.mnuEtiquetasArchivoClick(Sender: TObject);
begin
  TfrmEtiquetas.ShowForm;
end;

procedure TfrmStock.mnuEtiquetasOfertaDescClick(Sender: TObject);
begin
  TqrpEtiquetasOferta.PrintLabels(TMenuItem(Sender).Tag / 100);
end;

{
procedure TfrmStock.mnuEtiquetasClick(Sender: TObject);

var
  mnuDesc: TMenuItem;
  rDesc: Extended;

begin
  if not dmProductos.sqlDescuentos.Active then dmProductos.sqlDescuentos.Open;
  dmProductos.sqlDescuentos.First;
  mnuEtiquetasOferta.Clear;
  while not dmProductos.sqlDescuentos.Eof do begin
    rDesc := dmProductos.sqlDescuentos.FieldByName('nm_descuento').AsFloat;
    if (Trunc(rDesc) = rDesc) and ((Trunc(rDesc) mod 5) = 0) then begin
      mnuDesc := TMenuItem.Create(mnuEtiquetasOferta);
      mnuDesc.Caption :=
        dmProductos.sqlDescuentos.FieldByName('nm_descuento').AsString + '%';
      mnuDesc.Tag :=
        Trunc(dmProductos.sqlDescuentos.FieldByName('nm_descuento').AsFloat * 100);
      mnuDesc.OnClick := mnuEtiquetasOfertaDescClick;
      mnuEtiquetasOferta.Add(mnuDesc);
    end;
    Application.ProcessMessages;
    dmProductos.sqlDescuentos.Next;
  end;
end;
}

procedure TfrmStock.mnuPresupuestosClick(Sender: TObject);
begin
  mnuInsertaProducto.Enabled := WindowOpened(Id,nvPresupuesto,True);
end;

procedure TfrmStock.mnuInsertaProductoClick(Sender: TObject);

var
  pProducto: TProductoVenta;
  DataSet: TDataSet;

begin
  if MessageDlg('¿Estás seguro de añadir este producto al presupuesto actual?',
     mtWarning,[mbYes,mbNo],0) <> mrYes then
    Exit;

  DataSet := dbgStock.DataSource.DataSet;
  pProducto := TProductoVenta.Create(DataSet.FieldByName('id_producto').AsInteger,
    DataSet.FieldByName('id_talla').AsInteger,DataSet.FieldByName('nm_pvp').AsFloat,
    DataSet.FieldByName('nm_descuento').AsInteger,
    DataSet.FieldByName('cd_color').AsString);
  PostMessage(GetWindowHandle(nvPresupuesto),MSG_PRODUCTO_PRESUPUESTO,
    Integer(pProducto),0);
end;

procedure TfrmStock.dbnStockBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then dbeNmCoste.SetFocus;
end;

procedure TfrmStock.mnuUtilidadesEnlaceImagenClick(Sender: TObject);

var
  sEnlace: string;

begin
  sEnlace := StringReplace(LowerCase(dmRanning.ServidorWeb + '\_images\productos\' +
    dmProductos.NombreImagenProducto(
    dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString)),'\','/',
    [rfReplaceAll]);
  Clipboard.Clear;
  Clipboard.SetTextBuf(PChar(sEnlace));
  ShowMessage(sEnlace + #13 + #10 +  #13 + #10 +
    'El enlace se ha copiado en el portapapeles');
end;

procedure TfrmStock.MColores(var Message: TMessage);
begin
  if Message.WParam = COLORES_OK then begin
    dbgStock.DataSource.DataSet.Edit;
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString :=
      StringReplace(slColores.CommaText,',','',[rfReplaceAll]);
    dbgStock.DataSource.DataSet.FieldByName('ds_color').AsString :=
      dmRanning.DescColor(dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString);
  end;
  lInsertando := False;
end;

procedure TfrmStock.btnColoresClick(Sender: TObject);
begin
  lInsertando := True;
  dmRanning.SeparaCdColor(dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString,
    slColores);
  TfrmSelColores.ShowForm(Handle,slColores);
end;

procedure TfrmStock.btnVariosColoresClick(Sender: TObject);

var
  sColores: string;
  nColores: Integer;

begin
  sColores := '1';
  if InputQuery('Alta de varios colores','Número de colores',sColores) then begin
    nColores := StrToIntDef(sColores,0);
    if nColores > 0 then dmProductos.InsertaColores(nColores);
    RefreshData([Id]);
  end;
end;

procedure TfrmStock.btnOfertaClick(Sender: TObject);
begin
  dmRanning.OfertaLanzamiento(dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('id_temporada').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('f_entrada').AsDateTime);
end;

procedure TfrmStock.mnuInsertaPedidoClick(Sender: TObject);

var
  sPedido: string;
  nPedido: Integer;

begin
  sPedido := '';
  if not InputQuery('Alta del producto en un pedido','Número de pedido:',sPedido) then Exit;

  nPedido := StrToIntDef(sPedido,0);
  if nPedido = 0 then Exit;

  dmProductos.AltaPedidoDetalle(nPedido,
    dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString);

  ShowMessage('Alta del producto en el pedido realizada');
end;

procedure TfrmStock.mnuInsertaTallaPedidoClick(Sender: TObject);

var
  sPedido: string;
  nPedido: Integer;
  sqlNumPedido: TZReadOnlyQuery;

begin
  sqlNumPedido := dmRanning.ComandoSQL('select distinct p.id_pedido, p.ds_pedido ' +
    'from pedidos p, pedidos_detalle pd where (p.id_pedido = pd.id_pedido) and ' +
    '(p.id_temporada = ' + dbgStock.DataSource.DataSet.FieldByName('id_temporada').AsString +
    ') and (pd.cd_producto = ' +
    QuotedStr(dbgStock.DataSource.DataSet.FieldByName('cd_producto').AsString) +
    ') and (pd.cd_color = ' +
    QuotedStr(dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString) +
    ')',csResultado);
  if not sqlNumPedido.IsEmpty then
    sPedido := sqlNumPedido.FieldByName('id_pedido').AsString
  else
    sPedido := '';
  dmRanning.ComandoSQLFree(sqlNumPedido);
  if not InputQuery('Alta de la talla en un pedido','Número de pedido:',sPedido) then Exit;

  nPedido := StrToIntDef(sPedido,0);
  if nPedido = 0 then Exit;

  dmProductos.AltaPedidoDetalle(nPedido,
    dbgStock.DataSource.DataSet.FieldByName('id_producto').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('id_talla').AsInteger,
    dbgStock.DataSource.DataSet.FieldByName('cd_color').AsString);

  ShowMessage('Alta de la talla en el pedido realizada');
end;

procedure TfrmStock.ActualizaCambioProducto;
begin
  if not Active then Exit;

  CargaImagenProducto;
  ActualizaPVPFinal;
  ActualizaTitulo;
end;

procedure TfrmStock.dbnProductosClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  ActualizaCambioProducto;
end;

procedure TfrmStock.dbeFEntradaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [Ord('h'), Ord('H')]) and (ssCtrl in Shift) then begin
    TDBEdit(Sender).DataSource.Edit;
    TDBEdit(Sender).Field.AsDateTime := Date;
  end;
end;

end.
