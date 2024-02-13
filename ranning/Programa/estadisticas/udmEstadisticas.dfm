object dmEstadisticas: TdmEstadisticas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 196
  Top = 164
  Height = 575
  Width = 797
  object dbEstadisticas: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";User ID=Admin;Data ' +
      'Source=RANNING VENTA BD.mdb;Mode=Read;Extended Properties="";Jet' +
      ' OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:D' +
      'atabase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database L' +
      'ocking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glob' +
      'al Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OL' +
      'EDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fals' +
      'e;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact' +
      ' Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 41
    Top = 15
  end
  object sqlTotalVentasPorDia: TADOQuery
    Connection = dbEstadisticas
    AfterOpen = sqlTotalVentasPorDiaAfterOpen
    AfterClose = sqlTotalVentasPorDiaAfterClose
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'select fechaven,fpago,iva2,sum(total_bruto) as total_bruto,sum(t' +
        'otal_neto) as total_neto,'
      '  sum(gastos_envio) as gastos_envio'
      'from (select'
      '  fechaven,'
      '  fpago,'
      
        '  round(switch((iva = 0) and (fpago <> '#39'C'#39'),18,iva <> 0,iva * 10' +
        '0),2) as iva2,'
      '  round(sum(gastosenvio / 1.18),2) as gastos_envio,'
      
        '  round(sum(precioreal / (1 + iva)) + sum(gastosenvio / 1.18),2)' +
        ' as total_bruto,'
      '  round(sum(precioreal) + sum(gastosenvio),2) as total_neto'
      'from'
      '  ventas'
      '#where'
      'group by'
      '  fechaven,'
      '  fpago,'
      '  iva'
      ') where iva2 <> 0'
      'group by'
      '  fechaven,'
      '  fpago,'
      '  iva2'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 43
    Top = 61
  end
  object sqlFormasPago: TADOQuery
    Connection = dbEstadisticas
    DataSource = dsTotalVentasPorDia
    Parameters = <
      item
        Name = 'fpago'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select * from [formas de pago] fp where fp.fpago = :fpago')
    Left = 176
    Top = 60
  end
  object dsTotalVentasPorDia: TDataSource
    DataSet = sqlTotalVentasPorDia
    Left = 52
    Top = 109
  end
  object sqlVentasDiariasPorMes: TADOQuery
    Connection = dbEstadisticas
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'numero_mes'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = 0
      end
      item
        Name = 'anno'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = 0
      end>
    SQL.Strings = (
      
        'select fechaven,weekday(fechaven) as dia_semana,round(sum(precio' +
        'real),2) as venta_dia'
      'from ventas'
      
        'where (month(fechaven) = :numero_mes) and (year(fechaven) = :ann' +
        'o)'
      'group by fechaven')
    Left = 52
    Top = 163
  end
  object sqlVentasAlmacen: TADOQuery
    Connection = dbEstadisticas
    Parameters = <
      item
        Name = 'ano_fechaven'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '  round(sum(cantidad * precioven),2) as precio_bruto,'
      '  round(sum(precioreal),2) as pvp,'
      '  round(sum(cantidad * costebruto),2) as coste_ventas'
      'from'
      '  ventas'
      'where'
      ' year(fechaven) <= :ano_fechaven'
      ' ')
    Left = 291
    Top = 30
  end
  object sqlAlmacen: TADOQuery
    Connection = dbEstadisticas
    Parameters = <
      item
        Name = 'ano_fecha'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '  round(sum(cantidad * costebru),2) as coste'
      'from'
      '  stockin'
      'where'
      ' year(fechain) <= :ano_fecha')
    Left = 298
    Top = 100
  end
end
