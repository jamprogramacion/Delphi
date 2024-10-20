unit udmImagen;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, Inifiles;

type
  TdmImagen = class(TWebModule)
    htmlwImagen: TPageProducer;
    htmlwBanner: TPageProducer;
    procedure WebModuleCreate(Sender: TObject);
    procedure htmlwImagenHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmImagenwactImagenAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure htmlwBannerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure dmImagenwactBannerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    fImg: TIniFile;
    function Imagen: string;
    function ImagenAnt: string;
    function ImagenPos: string;
    procedure CargaListaImagenes;
    function NombreImagen(const sNumImg: string): string;
    function NombreImagenHtml(const sNumImg: string): string;
  public
    { Public declarations }
  end;

var
  dmImagen: TdmImagen;

implementation

uses uComun, jpeg;

{$R *.DFM}

procedure TdmImagen.WebModuleCreate(Sender: TObject);
begin
  htmlwImagen.HTMLFile := PATH_PLANTILLAS + 'wimagen.php';
  htmlwBanner.HTMLFile := PATH_PLANTILLAS + 'wbanner.php';
  fImg := nil;
end;

procedure TdmImagen.htmlwImagenHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  CargaListaImagenes;
  if LowerCase(TagString) = 'imagen' then
    ReplaceText := Imagen
  else if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'texto_imagen' then
    ReplaceText := fImg.ReadString('Text',Request.QueryFields.Values['act'],'')
  else if LowerCase(TagString) = 'img_ant' then
    ReplaceText := ImagenAnt
  else if LowerCase(TagString) = 'img_pos' then
    ReplaceText := ImagenPos;
end;

procedure TdmImagen.dmImagenwactImagenAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.ContentType := 'text/html';
  Response.Content := htmlwImagen.Content;
end;

function TdmImagen.Imagen: string;

var
  sImg: string;
  jpgImg: TJPEGImage;

begin
  CargaListaImagenes;
  sImg := NombreImagenHtml(fImg.ReadString('Img',Request.QueryFields.Values['act'],'1'));

  jpgImg := TJPEGImage.Create;
  try
    jpgImg.LoadFromFile(NombreImagen(fImg.ReadString('Img',
      Request.QueryFields.Values['act'],'1')));
    Result := '<img class="con_borde_fino" src="' + sImg + '" height="' +
      IntToStr(jpgImg.Height) + '" width="' + IntToStr(jpgImg.Width) + '">';
  finally
    jpgImg.Free;
  end;
end;

function TdmImagen.ImagenAnt: string;

var
  sImg: string;

begin
  Result := '';
  if Request.QueryFields.Values['act'] = '1' then Exit;

  CargaListaImagenes;
  sImg := NombreImagenHtml(fImg.ReadString('Img',
    IntToStr(StrToInt(Request.QueryFields.Values['act']) - 1),'1'));

  Result := '<a href="../wwwImagen.exe/wimagen?path=' + Request.QueryFields.Values['path'] +
    '&list=' + Request.QueryFields.Values['list'] + '&act=' +
    IntToStr(StrToInt(Request.QueryFields.Values['act']) - 1) + '">' +
    '<< Imagen anterior</a>';
end;

function TdmImagen.ImagenPos: string;

var
  sImg: string;

begin
  Result := '';
  if Request.QueryFields.Values['act'] = fImg.ReadString('Params','UltImg','') then
    Exit;

  CargaListaImagenes;
  sImg := NombreImagenHtml(fImg.ReadString('Img',
    IntToStr(StrToInt(Request.QueryFields.Values['act']) + 1),'1'));

  Result := '<a href="../wwwImagen.exe/wimagen?path=' + Request.QueryFields.Values['path'] +
    '&list=' + Request.QueryFields.Values['list'] + '&act=' +
    IntToStr(StrToInt(Request.QueryFields.Values['act']) + 1) + '">' +
    'Imagen posterior >></a>';
end;

procedure TdmImagen.CargaListaImagenes;
begin
  if not Assigned(fImg) then
    fImg := TIniFile.Create(PATH_IMG_LIST + Request.QueryFields.Values['list']);
end;

function TdmImagen.NombreImagen(const sNumImg: string): string;
begin
  Result := PATH_HTML + StringReplace(Request.QueryFields.Values['path'] +
    fImg.ReadString('Params','Pre','') + sNumImg +
    fImg.ReadString('Params','Suf',''),'/','\',[rfReplaceAll]);
end;

function TdmImagen.NombreImagenHtml(const sNumImg: string): string;
begin
  Result := HTML_ROOT + Request.QueryFields.Values['path'] +
    fImg.ReadString('Params','Pre','') + sNumImg +
    fImg.ReadString('Params','Suf','');
end;

procedure TdmImagen.htmlwBannerHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if LowerCase(TagString) = 'include' then
    ReplaceText := IncludeFile(TagParams.Values['file'])
  else if LowerCase(TagString) = 'include_banner' then
    ReplaceText := IncludeFile('cgi-bin\_img_list\' + Request.QueryFields.Values['banner_list'] + '.js')
  else if LowerCase(TagString) = 'storage_var' then
    ReplaceText := Request.QueryFields.Values['banner_list']
  else if LowerCase(TagString) = 'banner_img' then
    ReplaceText := Request.QueryFields.Values['banner'];
end;

procedure TdmImagen.dmImagenwactBannerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.ContentType := 'text/html';
  Response.Content := htmlwBanner.Content;
end;

end.
