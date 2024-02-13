object dmFacturasAccess: TdmFacturasAccess
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 239
  Top = 182
  Height = 480
  Width = 696
  object dbAccess: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\\mostrador\VENTAS ' +
      'RANNING\RANNING VENTA BD.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 29
    Top = 14
  end
  object sqlVentas: TADOQuery
    Connection = dbAccess
    Parameters = <>
    SQL.Strings = (
      'select * from ventas'
      'order by operacion')
    Left = 107
    Top = 13
    object sqlVentasOPERACION: TFloatField
      DisplayLabel = 'Operación'
      FieldName = 'OPERACION'
    end
    object sqlVentasFECHAVEN: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHAVEN'
    end
    object sqlVentasFechaGrabacion: TDateTimeField
      FieldName = 'FechaGrabacion'
    end
    object sqlVentasIDEPRO: TWideStringField
      DisplayLabel = 'Producto'
      FieldName = 'IDEPRO'
    end
    object sqlVentasCOLOR: TWideStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 50
    end
    object sqlVentasTALLA: TWideStringField
      DisplayLabel = 'Talla'
      FieldName = 'TALLA'
      Size = 10
    end
    object sqlVentasCANTIDAD: TFloatField
      DisplayLabel = 'Uds'
      FieldName = 'CANTIDAD'
    end
    object sqlVentasPRECIOVEN: TFloatField
      DisplayLabel = 'PVP'
      FieldName = 'PRECIOVEN'
    end
    object sqlVentasPRECIOUNIT: TFloatField
      FieldName = 'PRECIOUNIT'
    end
    object sqlVentasDESCUENTO: TFloatField
      DisplayLabel = 'Desc'
      FieldName = 'DESCUENTO'
    end
    object sqlVentasPRECIOREAL: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIOREAL'
    end
    object sqlVentasIDECLI: TSmallintField
      DisplayLabel = 'Cliente'
      FieldName = 'IDECLI'
    end
    object sqlVentasFPAGO: TWideStringField
      FieldName = 'FPAGO'
      Size = 2
    end
    object sqlVentasOBSERVA: TMemoField
      FieldName = 'OBSERVA'
      BlobType = ftMemo
    end
    object sqlVentasGASTOSVENTA: TFloatField
      FieldName = 'GASTOS VENTA'
    end
    object sqlVentasVENDEDOR: TWideStringField
      FieldName = 'VENDEDOR'
      Size = 50
    end
    object sqlVentasComision: TFloatField
      FieldName = 'Comision'
    end
    object sqlVentasCosteBruto: TFloatField
      FieldName = 'CosteBruto'
    end
    object sqlVentasIVA: TFloatField
      FieldName = 'IVA'
    end
    object sqlVentasGastosEnvio: TFloatField
      FieldName = 'GastosEnvio'
    end
    object sqlVentasCosteEnvio: TFloatField
      FieldName = 'CosteEnvio'
    end
    object sqlVentasDestinoEnvio: TIntegerField
      FieldName = 'DestinoEnvio'
    end
  end
  object sqlClientes: TADOQuery
    Connection = dbAccess
    DataSource = dsVentas
    Parameters = <
      item
        Name = 'idecli'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from clientes'
      'where idecli = :idecli')
    Left = 182
    Top = 15
    object sqlClientesIDECLI: TSmallintField
      DisplayLabel = 'Cliente'
      FieldName = 'IDECLI'
    end
    object sqlClientesNUMCLIANTERIOR: TSmallintField
      FieldName = 'NUMCLI ANTERIOR'
    end
    object sqlClientesCLIENTE: TWideStringField
      DisplayLabel = 'Nombre completo'
      FieldName = 'CLIENTE'
      Size = 75
    end
    object sqlClientesNIF: TWideStringField
      FieldName = 'NIF'
      Size = 15
    end
    object sqlClientesFECHANACIMIENTO: TDateTimeField
      DisplayLabel = 'F. Nac.'
      FieldName = 'FECHA NACIMIENTO'
    end
    object sqlClientesDIRECLI: TWideStringField
      DisplayLabel = 'Dirección completa'
      FieldName = 'DIRECLI'
      Size = 80
    end
    object sqlClientesCODIGOP: TWideStringField
      DisplayLabel = 'Cod Postal'
      FieldName = 'CODIGOP'
      Size = 50
    end
    object sqlClientesCIUDAD: TWideStringField
      DisplayLabel = 'Población'
      FieldName = 'CIUDAD'
      Size = 50
    end
    object sqlClientesTELECLI: TWideStringField
      DisplayLabel = 'Teléfono'
      FieldName = 'TELECLI'
      Size = 50
    end
    object sqlClientesCLUB: TWideStringField
      FieldName = 'CLUB'
      Size = 50
    end
    object sqlClientesGIMNASIO: TWideStringField
      FieldName = 'GIMNASIO'
      Size = 50
    end
    object sqlClientesPROMOCION: TWideStringField
      FieldName = 'PROMOCION'
      Size = 50
    end
    object sqlClientesNUM_SOCIO: TWideStringField
      FieldName = 'NUM_SOCIO'
      Size = 50
    end
    object sqlClientesDESCUENTO: TFloatField
      DisplayLabel = 'Desc. Inic.'
      FieldName = 'DESCUENTO'
    end
    object sqlClientesTALLAPIE: TWideStringField
      DisplayLabel = 'Talla pie'
      FieldName = 'TALLA PIE'
      Size = 4
    end
    object sqlClientesTALLATEXTIL: TWideStringField
      DisplayLabel = 'Talla textil'
      FieldName = 'TALLA TEXTIL'
      Size = 4
    end
    object sqlClientesTARJETA: TWordField
      FieldName = 'TARJETA'
    end
    object sqlClientesFECHAACTU: TDateTimeField
      FieldName = 'FECHA ACTU'
    end
    object sqlClientesOBSERVA: TMemoField
      FieldName = 'OBSERVA'
      BlobType = ftMemo
    end
    object sqlClientesCORREO: TWordField
      FieldName = 'CORREO'
    end
    object sqlClientesEMAIL: TWideStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 50
    end
    object sqlClientesCL_TIPO: TWideStringField
      FieldName = 'CL_TIPO'
      Size = 50
    end
    object sqlClientesCompraInicial: TFloatField
      DisplayLabel = 'Compra inic.'
      FieldName = 'CompraInicial'
    end
  end
  object sqlProductos: TADOQuery
    Connection = dbAccess
    DataSource = dsVentas
    Parameters = <
      item
        Name = 'operacion'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select p.*,v.color,v.talla,v.cantidad '
      'from productos p, ventas v'
      'where (p.idepro = v.idepro) and (v.operacion = :operacion)'
      'order by p.idepro,v.color,v.talla')
    Left = 256
    Top = 17
    object sqlProductosIDEPRO: TWideStringField
      DisplayLabel = 'Cod. prod.'
      FieldName = 'IDEPRO'
      Size = 30
    end
    object sqlProductosPRODUCTO: TWideStringField
      DisplayLabel = 'Producto'
      FieldName = 'PRODUCTO'
      Size = 50
    end
    object sqlProductosTIPOPRO: TSmallintField
      FieldName = 'TIPOPRO'
    end
    object sqlProductosSEX_PROD: TFloatField
      FieldName = 'SEX_PROD'
    end
    object sqlProductosUSO: TWideStringField
      FieldName = 'USO'
      Size = 50
    end
    object sqlProductosPISADA: TWideStringField
      FieldName = 'PISADA'
      Size = 50
    end
    object sqlProductosIVA: TFloatField
      FieldName = 'IVA'
    end
    object sqlProductosIvaCobrado: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'IvaCobrado'
    end
    object sqlProductosCARACTER: TMemoField
      FieldName = 'CARACTER'
      BlobType = ftMemo
    end
    object sqlProductosUTILIDAD: TMemoField
      FieldName = 'UTILIDAD'
      BlobType = ftMemo
    end
    object sqlProductosIDEPROV: TIntegerField
      FieldName = 'IDEPROV'
    end
    object sqlProductosACTIVO: TSmallintField
      FieldName = 'ACTIVO'
    end
    object sqlProductosPROMOCION: TSmallintField
      FieldName = 'PROMOCION'
    end
    object sqlProductosFECHAENTRADA: TDateTimeField
      FieldName = 'FECHA ENTRADA'
    end
    object sqlProductoscolor: TWideStringField
      DisplayLabel = 'Color'
      FieldName = 'color'
      Size = 50
    end
    object sqlProductostalla: TWideStringField
      DisplayLabel = 'Talla'
      FieldName = 'talla'
      Size = 10
    end
    object sqlProductoscantidad: TFloatField
      DisplayLabel = 'Uds'
      FieldName = 'cantidad'
    end
  end
  object dsVentas: TDataSource
    DataSet = sqlVentas
    Left = 116
    Top = 68
  end
  object dsClientes: TDataSource
    DataSet = sqlClientes
    Left = 181
    Top = 69
  end
  object dsProductos: TDataSource
    DataSet = sqlProductos
    Left = 255
    Top = 70
  end
end
