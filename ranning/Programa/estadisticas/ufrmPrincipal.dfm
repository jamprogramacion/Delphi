object frmPrincipal: TfrmPrincipal
  Left = 362
  Top = 242
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Informes y estad�sticas de ventas'
  ClientHeight = 155
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mnuEstadisticas
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object mnuEstadisticas: TMainMenu
    Left = 248
    Top = 70
    object mnuInformes: TMenuItem
      Caption = 'Informes'
      object mnuInformesTotalVentasPorDia: TMenuItem
        Caption = 'Total ventas por d�a'
        OnClick = mnuInformesTotalVentasPorDiaClick
      end
      object mnuInformesTotalVentasPorDiaSinIVA0: TMenuItem
        Caption = 'Total ventas por d�a (sin contar IVA 0)'
        Enabled = False
        OnClick = mnuInformesTotalVentasPorDiaSinIVA0Click
      end
      object mnuInformesVentasAlmacen: TMenuItem
        Caption = 'Ventas y stock en almac�n'
        OnClick = mnuInformesVentasAlmacenClick
      end
    end
    object mnuGraficos: TMenuItem
      Caption = 'Gr�ficos'
      object mnuGraficosVentasDiariasPorMes: TMenuItem
        Caption = 'Ventas diar�as en un mes'
        OnClick = mnuGraficosVentasDiariasPorMesClick
      end
    end
    object mnuSalir: TMenuItem
      Caption = 'Salir'
      OnClick = mnuSalirClick
    end
  end
end
