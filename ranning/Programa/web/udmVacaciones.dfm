object dmVacaciones: TdmVacaciones
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'wactVacaciones'
      PathInfo = '/wVacaciones'
      OnAction = dmVacacioneswactVacacionesAction
    end>
  Left = 242
  Top = 161
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
    Left = 111
    Top = 22
  end
  object htmlwVacaciones: TPageProducer
    OnHTMLTag = htmlwVacacionesHTMLTag
    Left = 36
    Top = 93
  end
  object sqlVacaciones: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from vacaciones '
      'where f_hasta >= curdate()'
      'order by f_desde')
    Params = <>
    Left = 220
    Top = 40
  end
end
