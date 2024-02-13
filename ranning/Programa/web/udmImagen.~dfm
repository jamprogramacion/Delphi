object dmImagen: TdmImagen
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'wactImagen'
      PathInfo = '/wimagen'
      Producer = htmlwImagen
      OnAction = dmImagenwactImagenAction
    end
    item
      Name = 'wactBanner'
      PathInfo = '/wbanner'
      Producer = htmlwBanner
      OnAction = dmImagenwactBannerAction
    end>
  Left = 192
  Top = 139
  Height = 480
  Width = 696
  object htmlwImagen: TPageProducer
    OnHTMLTag = htmlwImagenHTMLTag
    Left = 57
    Top = 32
  end
  object htmlwBanner: TPageProducer
    OnHTMLTag = htmlwBannerHTMLTag
    Left = 65
    Top = 97
  end
end
