object dmRanning: TdmRanning
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 225
  Top = 205
  Height = 480
  Width = 696
  object dbRanning: TZConnection
    Protocol = 'mysql-5'
    HostName = 'localhost'
    Port = 3306
    Database = 'ranning'
    User = 'root'
    Password = 'apunto'
    AutoCommit = False
    BeforeConnect = dbRanningBeforeConnect
    Left = 27
    Top = 19
  end
  object dbWeb: TZConnection
    Protocol = 'mysql-5'
    HostName = 'lldd075.servidoresdns.net'
    Port = 3306
    Database = 'qaa834'
    User = 'qaa834'
    Password = 'BBDDqaa82292'
    BeforeConnect = dbWebBeforeConnect
    Left = 35
    Top = 95
  end
  object Metadata: TZSQLMetadata
    Connection = dbRanning
    MetadataType = mdTables
    Left = 109
    Top = 96
  end
  object sqlRanning: TZReadOnlyQuery
    Connection = dbRanning
    Params = <>
    Left = 211
    Top = 26
  end
  object sqlWebInsert: TZReadOnlyQuery
    Connection = dbWeb
    Params = <>
    DataSource = dsRanning
    Left = 235
    Top = 87
  end
  object dsRanning: TDataSource
    DataSet = sqlRanning
    Left = 277
    Top = 27
  end
  object sqlSubirTablas: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from subir_tablas where ds_tabla = :ds_tabla')
    Params = <
      item
        DataType = ftString
        Name = 'ds_tabla'
        ParamType = ptInput
      end>
    Left = 367
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'ds_tabla'
        ParamType = ptInput
      end>
    object sqlSubirTablasds_tabla: TStringField
      FieldName = 'ds_tabla'
      Required = True
      Size = 64
    end
    object sqlSubirTablasds_campo_id: TStringField
      FieldName = 'ds_campo_id'
      Required = True
      Size = 64
    end
    object sqlSubirTablasid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object sqlSubirTablasit_accion: TStringField
      FieldName = 'it_accion'
      Required = True
      Size = 1
    end
  end
  object sqlWebDelete: TZReadOnlyQuery
    Connection = dbWeb
    Params = <>
    DataSource = dsRanning
    Left = 239
    Top = 193
  end
  object sqlWebUpdate: TZReadOnlyQuery
    Connection = dbWeb
    Params = <>
    DataSource = dsRanning
    Left = 237
    Top = 136
  end
  object sqlSubir: TZReadOnlyQuery
    Connection = dbRanning
    Params = <>
    Left = 124
    Top = 163
  end
  object dbAccess: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";User ID=Admin;Data ' +
      'Source=\\mostrador\RANNING\RANNING VENTA BD.mdb;Mode=Share Deny ' +
      'None;Extended Properties="";Jet OLEDB:System database="";Jet OLE' +
      'DB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Eng' +
      'ine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Pa' +
      'rtial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:' +
      'New Database Password="";Jet OLEDB:Create System Database=False;' +
      'Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on ' +
      'Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet' +
      ' OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    BeforeConnect = dbAccessBeforeConnect
    Left = 36
    Top = 211
  end
  object sqlClientes: TADOQuery
    Connection = dbAccess
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from clientes order by idecli')
    Left = 49
    Top = 280
    object sqlClientesIDECLI: TSmallintField
      FieldName = 'IDECLI'
    end
    object sqlClientesNUMCLIANTERIOR: TSmallintField
      FieldName = 'NUMCLI ANTERIOR'
    end
    object sqlClientesCLIENTE: TWideStringField
      FieldName = 'CLIENTE'
      Size = 75
    end
    object sqlClientesNIF: TWideStringField
      FieldName = 'NIF'
      Size = 15
    end
    object sqlClientesFECHANACIMIENTO: TDateTimeField
      FieldName = 'FECHA NACIMIENTO'
    end
    object sqlClientesDIRECLI: TWideStringField
      FieldName = 'DIRECLI'
      Size = 80
    end
    object sqlClientesCODIGOP: TWideStringField
      FieldName = 'CODIGOP'
      Size = 50
    end
    object sqlClientesCIUDAD: TWideStringField
      FieldName = 'CIUDAD'
      Size = 50
    end
    object sqlClientesTELECLI: TWideStringField
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
      FieldName = 'DESCUENTO'
    end
    object sqlClientesTALLAPIE: TWideStringField
      FieldName = 'TALLA PIE'
      Size = 4
    end
    object sqlClientesTALLATEXTIL: TWideStringField
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
    object sqlClientesCL_TIPO: TWideStringField
      FieldName = 'CL_TIPO'
      Size = 50
    end
    object sqlClientesCompraInicial: TFloatField
      FieldName = 'CompraInicial'
    end
    object sqlClientesEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object sqlClientesSexo: TFloatField
      FieldName = 'Sexo'
    end
    object sqlClientesIdCliRef: TSmallintField
      FieldName = 'IdCliRef'
    end
    object sqlClientesPuntosInicial: TIntegerField
      FieldName = 'PuntosInicial'
    end
  end
  object dsClientes: TDataSource
    DataSet = sqlClientes
    Left = 49
    Top = 331
  end
  object sqlClientesAccessUpdate: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'update clientes_access set'
      '  ds_nombre_completo = :cliente,'
      '  ds_nif = :nif,'
      '  f_nacimiento = :fechanacimiento,'
      '  ds_direccion_completa = :direcli,'
      '  ds_cp = :codigop,'
      '  ds_ciudad = :ciudad,'
      '  ds_telefono = :telecli,'
      '  nm_descuento_inicial = :descuento * 100,'
      '  ds_email = :email,'
      '  nm_compra_inicial = :comprainicial,'
      '  nm_compras = :compras,'
      '  nm_puntos_inicial = :puntosinicial'
      'where'
      '  cod_cliente = :idecli')
    Params = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nif'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechanacimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'direcli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigop'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ciudad'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telecli'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'descuento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'email'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'comprainicial'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'compras'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'puntosinicial'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'idecli'
        ParamType = ptInput
      end>
    Left = 149
    Top = 282
    ParamData = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nif'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechanacimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'direcli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigop'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ciudad'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telecli'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'descuento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'email'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'comprainicial'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'compras'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'puntosinicial'
        ParamType = ptInput
      end
      item
        DataType = ftInterface
        Name = 'idecli'
        ParamType = ptInput
      end>
  end
  object sqlClientesAccessInsert: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'insert into clientes_access'
      '  (cod_cliente,'
      '  ds_nombre_completo,'
      '  ds_nif,'
      '  f_nacimiento,'
      '  ds_direccion_completa,'
      '  ds_cp,'
      '  ds_ciudad,'
      '  ds_telefono,'
      '  nm_descuento_inicial,'
      '  ds_email,'
      '  nm_compra_inicial,'
      '  nm_compras,'
      '  nm_puntos_inicial)'
      'values'
      '  (:idecli,'
      '  :cliente,'
      '  :nif,'
      '  :fechanacimiento,'
      '  :direcli,'
      '  :codigop,'
      '  :ciudad,'
      '  :telecli,'
      '  :descuento * 100,'
      '  :email,'
      '  :comprainicial,'
      '  :compras,'
      '  :puntosinicial)'
      ' ')
    Params = <
      item
        DataType = ftInteger
        Name = 'idecli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nif'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechanacimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'direcli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigop'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ciudad'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telecli'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'descuento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'email'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'comprainicial'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'compras'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'puntosinicial'
        ParamType = ptInput
      end>
    Left = 150
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idecli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nif'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechanacimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'direcli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigop'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ciudad'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telecli'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'descuento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'email'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'comprainicial'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'compras'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'puntosinicial'
        ParamType = ptInput
      end>
  end
  object sqlClientesCompras: TADOQuery
    Connection = dbAccess
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select idecli,sum(precioreal) as nm_compras from ventas '
      'group by idecli'
      'order by idecli')
    Left = 111
    Top = 235
    object sqlClientesComprasidecli: TSmallintField
      FieldName = 'idecli'
    end
    object sqlClientesComprasnm_compras: TFloatField
      FieldName = 'nm_compras'
    end
  end
  object sqlClientesAccess: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select count(id_cliente) nCliente '
      'from clientes_access'
      'where cod_cliente = :idecli')
    Params = <
      item
        DataType = ftInteger
        Name = 'idecli'
        ParamType = ptInput
      end>
    Left = 264
    Top = 303
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idecli'
        ParamType = ptInput
      end>
  end
  object sqlColores: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select ds_color from colores where id_color = :id_color')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_color'
        ParamType = ptInput
      end>
    Left = 362
    Top = 99
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_color'
        ParamType = ptInput
      end>
  end
  object ftpImages: TNMFTP
    Host = 'ftp.ranning.com'
    Port = 21
    ReportLevel = 0
    OnConnectionFailed = ftpImagesConnectionFailed
    UserID = 'ranning.com'
    Password = 'DJ1012apunto'
    OnFailure = ftpImagesFailure
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = True
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 332
    Top = 179
  end
  object ftpPedidos: TNMFTP
    Host = 'ftp.ranning.com'
    Port = 21
    ReportLevel = 0
    OnConnectionFailed = ftpImagesConnectionFailed
    UserID = 'ranning.com'
    Password = 'DJ1012apunto'
    OnFailure = ftpPedidosFailure
    Vendor = 2411
    ParseList = False
    ProxyPort = 0
    Passive = True
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 369
    Top = 238
  end
  object sqlOfertasLanzamiento: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from ofertas'
      'where'
      '  id_producto <> 0'
      'order by'
      '  id_producto')
    Params = <>
    Left = 378
    Top = 298
    object sqlOfertasLanzamientoid_oferta: TLargeintField
      FieldName = 'id_oferta'
    end
    object sqlOfertasLanzamientoid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlOfertasLanzamientoid_tipo_producto: TLargeintField
      FieldName = 'id_tipo_producto'
      Required = True
    end
    object sqlOfertasLanzamientoid_tipo_complemento: TLargeintField
      FieldName = 'id_tipo_complemento'
      Required = True
    end
    object sqlOfertasLanzamientoid_tipo_deporte: TLargeintField
      FieldName = 'id_tipo_deporte'
      Required = True
    end
    object sqlOfertasLanzamientoid_temporada: TIntegerField
      FieldName = 'id_temporada'
      Required = True
    end
    object sqlOfertasLanzamientoid_marca: TLargeintField
      FieldName = 'id_marca'
      Required = True
    end
    object sqlOfertasLanzamientoid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
      Required = True
    end
    object sqlOfertasLanzamientof_inicio: TDateField
      FieldName = 'f_inicio'
    end
    object sqlOfertasLanzamientof_fin: TDateField
      FieldName = 'f_fin'
    end
    object sqlOfertasLanzamientoid_descuento: TLargeintField
      FieldName = 'id_descuento'
      Required = True
    end
    object sqlOfertasLanzamientods_oferta: TStringField
      FieldName = 'ds_oferta'
      Size = 255
    end
    object sqlOfertasLanzamientonm_descuento: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'nm_descuento'
    end
  end
end
