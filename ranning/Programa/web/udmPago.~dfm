object dmPago: TdmPago
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Name = 'wactPago'
      PathInfo = '/wPago'
      Producer = htmlwPago
    end
    item
      Name = 'wactTPV'
      PathInfo = '/wTPV'
      Producer = htmlwTPV
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Left = 215
  Top = 163
  Height = 480
  Width = 696
  object htmlwPago: TPageProducer
    Left = 35
    Top = 15
  end
  object dbRanning: TZConnection
    Protocol = 'mysql-4.1'
    HostName = 'despacho'
    Port = 3306
    Database = 'ranning'
    User = 'root'
    Password = 'apunto'
    AutoCommit = False
    BeforeConnect = dbRanningBeforeConnect
    Left = 427
    Top = 17
  end
  object sqlTransaccionInsert: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'insert into transacciones ('
      '  nm_importe,'
      '  ds_localizador,'
      '  f_transaccion)'
      'values ('
      '  :nm_importe,'
      '  :ds_localizador,'
      '  :f_transaccion)'
      '')
    Params = <
      item
        DataType = ftFloat
        Name = 'nm_importe'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_localizador'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'f_transaccion'
        ParamType = ptInput
      end>
    Left = 69
    Top = 82
    ParamData = <
      item
        DataType = ftFloat
        Name = 'nm_importe'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_localizador'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'f_transaccion'
        ParamType = ptInput
      end>
  end
  object sqlIdTransaccion: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select id_transaccion'
      'from transacciones'
      'where ds_localizador = :ds_localizador'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'ds_localizador'
        ParamType = ptInput
      end>
    Left = 74
    Top = 132
    ParamData = <
      item
        DataType = ftString
        Name = 'ds_localizador'
        ParamType = ptInput
      end>
  end
  object htmlwTPV: TPageProducer
    OnHTMLTag = htmlwTPVHTMLTag
    Left = 127
    Top = 22
  end
end
