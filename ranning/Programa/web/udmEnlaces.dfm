object dmEnlaces: TdmEnlaces
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Default = True
      Name = 'wactEnlaces'
      PathInfo = '/wenlaces'
      OnAction = dmEnlacesWebActionItem1Action
    end>
  Left = 237
  Top = 151
  Height = 480
  Width = 696
  object dbRanning: TZConnection
    Protocol = 'mysql-4.1'
    HostName = 'despacho'
    Port = 3306
    Database = 'ranning'
    User = 'root'
    Password = 'apunto'
    AutoCommit = False
    BeforeConnect = dbRanningBeforeConnect
    Left = 113
    Top = 22
  end
  object htmlwEnlaces: TPageProducer
    OnHTMLTag = htmlwEnlacesHTMLTag
    Left = 115
    Top = 70
  end
  object sqlEnlaces: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from marcas where it_activa = '#39'X'#39' order by rand()')
    Params = <>
    Left = 22
    Top = 68
  end
  object sqlMarcas: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from marcas where it_activa = '#39'X'#39' order by ds_marca')
    Params = <>
    Left = 190
    Top = 25
  end
end
