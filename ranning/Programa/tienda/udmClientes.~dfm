object dmClientes: TdmClientes
  OldCreateOrder = False
  Left = 192
  Top = 136
  Height = 560
  Width = 792
  object sqlClientes: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    OnUpdateRecord = sqlClientesUpdateRecord
    BeforePost = sqlClientesBeforePost
    BeforeDelete = sqlClientesBeforeDelete
    OnNewRecord = sqlClientesNewRecord
    SQL.Strings = (
      'select'
      '  c.*,'
      '  ts.ds_tipo_sexo,'
      '  cl.ds_club,'
      
        '  concat(trim(c.ds_nombre),'#39' '#39',trim(c.ds_primer_apellido),'#39' '#39',tr' +
        'im(c.ds_segundo_apellido)) ds_nombre_completo,'
      
        '  concat(trim(c.ds_nombre_esp),'#39' '#39',trim(c.ds_primer_apellido_esp' +
        '),'#39' '#39',trim(c.ds_segundo_apellido_esp)) ds_nombre_completo_esp'
      'from'
      '  clientes c'
      '  left join tipos_sexo ts on c.id_tipo_sexo = ts.id_tipo_sexo'
      '  left join clubes cl on c.id_club = cl.id_club'
      'order by'
      '  c.ds_primer_apellido,'
      '  c.ds_segundo_apellido,'
      '  c.ds_nombre'
      'for update'
      ' '
      ' ')
    Params = <>
    Left = 34
    Top = 22
    object sqlClientesid_cliente: TLargeintField
      DisplayLabel = 'Cliente'
      FieldName = 'id_cliente'
    end
    object sqlClientescod_cliente_access: TIntegerField
      DisplayLabel = 'Cliente Access'
      FieldName = 'cod_cliente_access'
    end
    object sqlClientesds_primer_apellido: TStringField
      DisplayLabel = 'Primer apellido'
      FieldName = 'ds_primer_apellido'
      Required = True
      Size = 30
    end
    object sqlClientesds_segundo_apellido: TStringField
      DisplayLabel = 'Segundo apellido'
      FieldName = 'ds_segundo_apellido'
      Size = 30
    end
    object sqlClientesds_nombre: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'ds_nombre'
      Required = True
      Size = 30
    end
    object sqlClientesds_dni: TStringField
      DisplayLabel = 'DNI'
      FieldName = 'ds_dni'
      Size = 15
    end
    object sqlClientesid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
      Required = True
    end
    object sqlClientesf_nacimiento: TDateField
      DisplayLabel = 'F. nacimiento'
      FieldName = 'f_nacimiento'
    end
    object sqlClientesid_club: TLargeintField
      FieldName = 'id_club'
    end
    object sqlClientesds_email: TStringField
      DisplayLabel = 'email'
      FieldName = 'ds_email'
      Size = 255
    end
    object sqlClientesds_telefono: TStringField
      DisplayLabel = 'Teléfono'
      FieldName = 'ds_telefono'
      Size = 25
    end
    object sqlClientesds_fax: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'ds_fax'
      Size = 9
    end
    object sqlClientesf_ultima_actualizacion: TDateTimeField
      DisplayLabel = 'Última actualización'
      FieldName = 'f_ultima_actualizacion'
    end
    object sqlClientesnm_compras_inicial: TFloatField
      DisplayLabel = 'Compras iniciales'
      FieldName = 'nm_compras_inicial'
      Required = True
    end
    object sqlClientesobservaciones: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object sqlClientesds_primer_apellido_esp: TStringField
      DisplayLabel = 'Primer apellido'
      FieldName = 'ds_primer_apellido_esp'
      Required = True
      OnChange = sqlClientesNombreEspChange
      Size = 30
    end
    object sqlClientesds_segundo_apellido_esp: TStringField
      DisplayLabel = 'Segundo apellido'
      FieldName = 'ds_segundo_apellido_esp'
      OnChange = sqlClientesNombreEspChange
      Size = 30
    end
    object sqlClientesds_nombre_esp: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'ds_nombre_esp'
      Required = True
      OnChange = sqlClientesNombreEspChange
      Size = 30
    end
    object sqlClientesds_tipo_sexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'ds_tipo_sexo'
      Size = 15
    end
    object sqlClientesds_club: TStringField
      DisplayLabel = 'Club'
      FieldName = 'ds_club'
      Size = 100
    end
    object sqlClientesnm_descuento: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'nm_descuento'
      Required = True
    end
    object sqlClientesds_nombre_completo: TStringField
      FieldName = 'ds_nombre_completo'
      Size = 92
    end
    object sqlClientesds_nombre_completo_esp: TStringField
      FieldName = 'ds_nombre_completo_esp'
      Size = 92
    end
  end
  object dsClientes: TDataSource
    DataSet = sqlClientes
    Left = 41
    Top = 72
  end
  object sqlClientesInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into clientes'
      '  (ds_primer_apellido,'
      '  ds_segundo_apellido,'
      '  ds_nombre,'
      '  ds_dni,'
      '  id_tipo_sexo,'
      '  f_nacimiento,'
      '  id_club,'
      '  nm_descuento,'
      '  ds_email,'
      '  ds_telefono,'
      '  ds_fax,'
      '  f_ultima_actualizacion,'
      '  observaciones,'
      '  nm_compras_inicial,'
      '  ds_primer_apellido_esp,'
      '  ds_segundo_apellido_esp,'
      '  ds_nombre_esp)'
      'values'
      '  (:ds_primer_apellido,'
      '  :ds_segundo_apellido,'
      '  :ds_nombre,'
      '  :ds_dni,'
      '  :id_tipo_sexo,'
      '  :f_nacimiento,'
      '  :id_club,'
      '  :nm_descuento,'
      '  :ds_email,'
      '  :ds_telefono,'
      '  :ds_fax,'
      '  :f_ultima_actualizacion,'
      '  :observaciones,'
      '  :nm_compras_inicial,'
      '  :ds_primer_apellido_esp,'
      '  :ds_segundo_apellido_esp,'
      '  :ds_nombre_esp)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_nacimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_club'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_ultima_actualizacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_compras_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_esp'
        ParamType = ptUnknown
      end>
    DataSource = dsClientes
    Left = 144
    Top = 31
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_nacimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_club'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_ultima_actualizacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_compras_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_esp'
        ParamType = ptUnknown
      end>
  end
  object sqlClientesUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update clientes set'
      '  ds_primer_apellido = :ds_primer_apellido,'
      '  ds_segundo_apellido = :ds_segundo_apellido,'
      '  ds_nombre = :ds_nombre,'
      '  ds_dni = :ds_dni,'
      '  id_tipo_sexo = :id_tipo_sexo,'
      '  f_nacimiento = :f_nacimiento,'
      '  id_club = :id_club,'
      '  nm_descuento = :nm_descuento,'
      '  ds_email = :ds_email,'
      '  ds_telefono = :ds_telefono,'
      '  ds_fax = :ds_fax,'
      '  f_ultima_actualizacion = :f_ultima_actualizacion,'
      '  nm_compras_inicial = :nm_compras_inicial,'
      '  observaciones = :observaciones,'
      '  ds_primer_apellido_esp = :ds_primer_apellido_esp,'
      '  ds_segundo_apellido_esp = :ds_segundo_apellido_esp,'
      '  ds_nombre_esp = :ds_nombre_esp'
      'where'
      '  id_cliente = :id_cliente'
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_nacimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_club'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_ultima_actualizacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_compras_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end>
    DataSource = dsClientes
    Left = 236
    Top = 31
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_nacimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_club'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_descuento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_telefono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'f_ultima_actualizacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_compras_inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observaciones'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_primer_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_segundo_apellido_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_esp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end>
  end
  object sqlClientesDelete: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'delete from clientes where id_cliente = :id_cliente')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end>
    DataSource = dsClientes
    Left = 340
    Top = 30
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end>
  end
  object sqlTiposSexo: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from tipos_sexo order by ds_tipo_sexo')
    Params = <>
    Left = 54
    Top = 144
    object sqlTiposSexoid_tipo_sexo: TLargeintField
      FieldName = 'id_tipo_sexo'
    end
    object sqlTiposSexods_tipo_sexo: TStringField
      FieldName = 'ds_tipo_sexo'
      Required = True
      Size = 15
    end
  end
  object dsTiposSexo: TDataSource
    DataSet = sqlTiposSexo
    Left = 56
    Top = 191
  end
  object sqlClubes: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from clubes order by ds_club')
    Params = <>
    Left = 151
    Top = 144
    object sqlClubesid_club: TLargeintField
      FieldName = 'id_club'
    end
    object sqlClubesid_tipo_club: TLargeintField
      FieldName = 'id_tipo_club'
      Required = True
    end
    object sqlClubesds_club: TStringField
      FieldName = 'ds_club'
      Required = True
      Size = 100
    end
    object sqlClubesid_direccion: TLargeintField
      FieldName = 'id_direccion'
    end
    object sqlClubesds_telefono: TStringField
      FieldName = 'ds_telefono'
      Size = 9
    end
    object sqlClubesds_fax: TStringField
      FieldName = 'ds_fax'
      Size = 9
    end
    object sqlClubesid_descuento_club: TLargeintField
      FieldName = 'id_descuento_club'
      Required = True
    end
    object sqlClubesid_descuento_socios: TLargeintField
      FieldName = 'id_descuento_socios'
      Required = True
    end
    object sqlClubesid_contacto: TLargeintField
      FieldName = 'id_contacto'
    end
  end
  object dsClubes: TDataSource
    DataSet = sqlClubes
    Left = 153
    Top = 191
  end
  object sqlFacturas: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    OnUpdateRecord = sqlFacturasUpdateRecord
    BeforePost = sqlFacturasBeforePost
    AfterPost = sqlFacturasAfterPost
    OnNewRecord = sqlFacturasNewRecord
    SQL.Strings = (
      'select'
      '  f.*,'
      '  c.ds_primer_apellido,'
      '  c.ds_segundo_apellido,'
      '  c.ds_nombre,'
      '  c.ds_dni,'
      '  c.id_direccion'
      'from'
      '  facturas f,'
      '  clientes c'
      'where'
      '  f.id_cliente = c.id_cliente'
      'order by'
      '  f.cd_factura'
      'for update')
    Params = <>
    Left = 43
    Top = 257
    object sqlFacturasid_factura: TLargeintField
      FieldName = 'id_factura'
    end
    object sqlFacturasf_factura: TDateField
      DisplayLabel = 'Fecha'
      FieldName = 'f_factura'
      Required = True
    end
    object sqlFacturascd_factura: TStringField
      DisplayLabel = 'Num factura'
      FieldName = 'cd_factura'
      Required = True
      Size = 10
    end
    object sqlFacturasid_cliente: TLargeintField
      FieldName = 'id_cliente'
      Required = True
    end
    object sqlFacturasds_primer_apellido: TStringField
      FieldName = 'ds_primer_apellido'
      Size = 30
    end
    object sqlFacturasds_segundo_apellido: TStringField
      FieldName = 'ds_segundo_apellido'
      Size = 30
    end
    object sqlFacturasds_nombre: TStringField
      FieldName = 'ds_nombre'
      Size = 30
    end
    object sqlFacturasds_dni: TStringField
      DisplayLabel = 'DNI'
      FieldName = 'ds_dni'
      Size = 15
    end
    object sqlFacturasds_direccion: TStringField
      DisplayLabel = 'Dirección'
      FieldKind = fkCalculated
      FieldName = 'ds_direccion'
      Size = 264
      Calculated = True
    end
    object sqlFacturasds_cliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkCalculated
      FieldName = 'ds_cliente'
      Size = 90
      Calculated = True
    end
    object sqlFacturasid_factura_anulada: TLargeintField
      FieldName = 'id_factura_anulada'
    end
    object sqlFacturasid_factura_nueva: TLargeintField
      FieldName = 'id_factura_nueva'
    end
    object sqlFacturasnm_gastos_envio: TFloatField
      DisplayLabel = 'Gastos envío'
      FieldName = 'nm_gastos_envio'
      Required = True
    end
  end
  object dsFacturas: TDataSource
    DataSet = sqlFacturas
    Left = 50
    Top = 307
  end
  object sqlFacturasInsert: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'insert into facturas'
      '  (f_factura,'
      '  cd_factura,'
      '  id_cliente,'
      '  id_factura_anulada,'
      '  id_factura_nueva,'
      '  nm_gastos_envio)'
      'values'
      '  (:f_factura,'
      '  :cd_factura,'
      '  :id_cliente,'
      '  :id_factura_anulada,'
      '  :id_factura_nueva,'
      '  :nm_gastos_envio)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'f_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_anulada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_nueva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end>
    DataSource = dsFacturas
    Left = 155
    Top = 306
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'f_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_anulada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_nueva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end>
  end
  object sqlFacturasUpdate: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update facturas set'
      '  f_factura = :f_factura,'
      '  cd_factura = :cd_factura,'
      '  id_cliente = :id_cliente,'
      '  id_factura_anulada = :id_factura_anulada,'
      '  id_factura_nueva = :id_factura_nueva,'
      '  nm_gastos_envio = :nm_gastos_envio'
      'where'
      '  id_factura = :id_factura')
    Params = <
      item
        DataType = ftUnknown
        Name = 'f_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_anulada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_nueva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end>
    DataSource = dsFacturas
    Left = 244
    Top = 306
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'f_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_factura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_anulada'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura_nueva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nm_gastos_envio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end>
  end
  object sqlImpresionFactura: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select distinct'
      '  f.*,'
      '  c.ds_primer_apellido,'
      '  c.ds_segundo_apellido,'
      '  c.ds_nombre,'
      '  c.ds_dni,'
      '  fd.*,'
      '  p.ds_producto,'
      '  concat(m.cd_marca,p.cd_producto) cod_prod,'
      
        '  if(co.cd_color <> '#39'00'#39',concat(co.cd_color,'#39' - '#39',co.ds_color),'#39 +
        'Color único'#39') color,'
      
        '  if(fd.id_talla <> 0,if(p.id_tipo_producto = 1,tp.nm_talla_pie_' +
        'usa,tt.ds_talla_textil),'#39'Talla única'#39') ds_talla,'
      
        '  if(p.id_tipo_producto = 1,tp.nm_orden,tt.nm_orden) nm_orden_ta' +
        'lla'
      'from'
      '  facturas f,'
      '  clientes c,'
      '  facturas_detalle fd,'
      '  productos p,'
      '  colores co,'
      '  tallas_textil tt,'
      '  tallas_pie tp,'
      '  marcas m'
      'where'
      '  (f.id_factura = :id_factura) and'
      '  (f.id_cliente = c.id_cliente) and'
      '  (f.id_factura = fd.id_factura) and'
      '  (fd.id_producto = p.id_producto) and'
      '  (fd.id_color = co.id_color) and'
      
        '  if(p.id_tipo_producto = 1,fd.id_talla = tp.id_talla_pie,fd.id_' +
        'talla = tt.id_talla_textil) and'
      '  (p.id_marca = m.id_marca)'
      'order by'
      '  cod_prod,'
      '  p.ds_producto,'
      '  color,'
      '  nm_orden_talla'
      ' '
      ' '
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end>
    DataSource = dsFacturas
    Left = 52
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end>
    object sqlImpresionFacturaid_factura: TLargeintField
      FieldName = 'id_factura'
    end
    object sqlImpresionFacturaf_factura: TDateField
      FieldName = 'f_factura'
      Required = True
    end
    object sqlImpresionFacturacd_factura: TStringField
      FieldName = 'cd_factura'
      Required = True
      Size = 10
    end
    object sqlImpresionFacturaid_cliente: TLargeintField
      FieldName = 'id_cliente'
      Required = True
    end
    object sqlImpresionFacturaid_factura_anulada: TLargeintField
      FieldName = 'id_factura_anulada'
    end
    object sqlImpresionFacturaid_factura_nueva: TLargeintField
      FieldName = 'id_factura_nueva'
    end
    object sqlImpresionFacturads_primer_apellido: TStringField
      FieldName = 'ds_primer_apellido'
      Required = True
      Size = 30
    end
    object sqlImpresionFacturads_segundo_apellido: TStringField
      FieldName = 'ds_segundo_apellido'
      Size = 30
    end
    object sqlImpresionFacturads_nombre: TStringField
      FieldName = 'ds_nombre'
      Required = True
      Size = 30
    end
    object sqlImpresionFacturads_dni: TStringField
      FieldName = 'ds_dni'
      Size = 15
    end
    object sqlImpresionFacturaid_direccion: TLargeintField
      FieldName = 'id_direccion'
    end
    object sqlImpresionFacturaid_factura_1: TLargeintField
      FieldName = 'id_factura_1'
      Required = True
    end
    object sqlImpresionFacturaid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlImpresionFacturaid_color: TLargeintField
      FieldName = 'id_color'
      Required = True
    end
    object sqlImpresionFacturaid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlImpresionFacturanm_cantidad: TIntegerField
      FieldName = 'nm_cantidad'
      Required = True
    end
    object sqlImpresionFacturanm_precio_unitario: TFloatField
      FieldName = 'nm_precio_unitario'
      Required = True
    end
    object sqlImpresionFacturanm_precio_total: TFloatField
      FieldName = 'nm_precio_total'
      Required = True
    end
    object sqlImpresionFacturanm_descuento: TFloatField
      FieldName = 'nm_descuento'
      Required = True
    end
    object sqlImpresionFacturanm_descuento_total: TFloatField
      FieldName = 'nm_descuento_total'
      Required = True
    end
    object sqlImpresionFacturanm_precio_pagado: TFloatField
      FieldName = 'nm_precio_pagado'
      Required = True
    end
    object sqlImpresionFacturanm_iva: TFloatField
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlImpresionFacturanm_iva_total: TFloatField
      FieldName = 'nm_iva_total'
      Required = True
    end
    object sqlImpresionFacturads_producto: TStringField
      FieldName = 'ds_producto'
      Required = True
      Size = 100
    end
    object sqlImpresionFacturacolor: TStringField
      FieldName = 'color'
      Required = True
      Size = 63
    end
    object sqlImpresionFacturads_talla: TStringField
      FieldName = 'ds_talla'
      Required = True
    end
    object sqlImpresionFacturanm_orden_talla: TLargeintField
      FieldName = 'nm_orden_talla'
      Required = True
    end
    object sqlImpresionFacturads_direccion: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_direccion'
      Size = 264
      Calculated = True
    end
    object sqlImpresionFacturads_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_cliente'
      Size = 90
      Calculated = True
    end
    object sqlImpresionFacturacod_prod: TStringField
      FieldName = 'cod_prod'
      Required = True
      Size = 25
    end
    object sqlImpresionFacturanm_gastos_envio: TFloatField
      FieldName = 'nm_gastos_envio'
      Required = True
    end
  end
  object dsImpresionFactura: TDataSource
    DataSet = sqlImpresionFactura
    Left = 55
    Top = 410
  end
  object sqlFacturasDetalle: TZQuery
    Connection = dmRanning.dbRanning
    CachedUpdates = True
    SQL.Strings = (
      'select distinct'
      '  fd.*,'
      '  m.ds_marca,'
      '  p.cd_producto,'
      '  p.ds_producto,'
      '  c.ds_color,'
      
        '  if(p.id_tipo_producto = 1,tp.nm_talla_pie_usa,tt.ds_talla_text' +
        'il) ds_talla,'
      
        '  if(p.id_tipo_producto = 1,tp.nm_orden,tt.nm_orden) nm_orden_ta' +
        'lla'
      'from'
      '  facturas_detalle fd,'
      '  marcas m,'
      '  productos p,'
      '  colores c,'
      '  tallas_textil tt,'
      '  tallas_pie tp'
      'where'
      '  (fd.id_factura = :id_factura) and'
      '  (fd.id_producto = p.id_producto) and'
      '  (p.id_marca = m.id_marca) and'
      '  (fd.id_color = c.id_color) and'
      
        '  if(p.id_tipo_producto = 1,fd.id_talla = tp.id_talla_pie,fd.id_' +
        'talla = tt.id_talla_textil)'
      'order by'
      '  m.ds_marca,'
      '  p.cd_producto,'
      '  c.ds_color,'
      '  nm_orden_talla'
      ''
      ' '
      ' '
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end>
    DataSource = dsFacturas
    Left = 144
    Top = 253
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_factura'
        ParamType = ptUnknown
      end>
    object sqlFacturasDetalleid_factura: TLargeintField
      FieldName = 'id_factura'
      Required = True
    end
    object sqlFacturasDetalleid_producto: TLargeintField
      FieldName = 'id_producto'
      Required = True
    end
    object sqlFacturasDetalleid_color: TLargeintField
      FieldName = 'id_color'
      Required = True
    end
    object sqlFacturasDetalleid_talla: TLargeintField
      FieldName = 'id_talla'
      Required = True
    end
    object sqlFacturasDetallenm_cantidad: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'nm_cantidad'
      Required = True
    end
    object sqlFacturasDetallenm_precio_unitario: TFloatField
      DisplayLabel = 'PVP c/u'
      FieldName = 'nm_precio_unitario'
      Required = True
    end
    object sqlFacturasDetallenm_precio_total: TFloatField
      DisplayLabel = 'PVP'
      FieldName = 'nm_precio_total'
      Required = True
    end
    object sqlFacturasDetallenm_descuento: TFloatField
      DisplayLabel = '% Descuento'
      FieldName = 'nm_descuento'
      Required = True
    end
    object sqlFacturasDetallenm_descuento_total: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'nm_descuento_total'
      Required = True
    end
    object sqlFacturasDetallenm_precio_pagado: TFloatField
      DisplayLabel = 'A pagar'
      FieldName = 'nm_precio_pagado'
      Required = True
    end
    object sqlFacturasDetallenm_iva: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'nm_iva'
      Required = True
    end
    object sqlFacturasDetallenm_iva_total: TFloatField
      DisplayLabel = 'IVA'
      FieldName = 'nm_iva_total'
      Required = True
    end
    object sqlFacturasDetalleds_marca: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'ds_marca'
      Required = True
      Size = 50
    end
    object sqlFacturasDetallecd_producto: TStringField
      DisplayLabel = 'Código'
      FieldName = 'cd_producto'
      Required = True
    end
    object sqlFacturasDetalleds_producto: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'ds_producto'
      Required = True
      Size = 100
    end
    object sqlFacturasDetalleds_color: TStringField
      DisplayLabel = 'Color'
      FieldName = 'ds_color'
      Required = True
      Size = 50
    end
    object sqlFacturasDetalleds_talla: TStringField
      DisplayLabel = 'Talla'
      FieldName = 'ds_talla'
      Required = True
    end
    object sqlFacturasDetallenm_orden_talla: TLargeintField
      FieldName = 'nm_orden_talla'
      Required = True
    end
  end
  object dsFacturasDetalle: TDataSource
    DataSet = sqlFacturasDetalle
    Left = 264
    Top = 258
  end
  object dsProvincias: TDataSource
    DataSet = sqlProvincias
    Left = 249
    Top = 407
  end
  object dsMunicipios: TDataSource
    DataSet = sqlMunicipios
    Left = 360
    Top = 403
  end
  object sqlProvincias: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from provincias order by ds_provincia')
    Params = <>
    Left = 255
    Top = 356
    object sqlProvinciasid_autonomia: TStringField
      FieldName = 'id_autonomia'
      Required = True
      Size = 2
    end
    object sqlProvinciasid_provincia: TStringField
      DisplayLabel = 'Cod provincia'
      FieldName = 'id_provincia'
      Required = True
      Size = 2
    end
    object sqlProvinciasds_provincia: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'ds_provincia'
      Required = True
      Size = 30
    end
    object sqlProvinciasds_matricula: TStringField
      DisplayLabel = 'Matrícula'
      FieldName = 'ds_matricula'
      Required = True
      Size = 2
    end
  end
  object sqlMunicipios: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      
        'select * from municipios where id_provincia = :id_provincia orde' +
        'r by ds_municipio')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end>
    DataSource = dsProvincias
    Left = 358
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end>
    object sqlMunicipiosid_provincia: TStringField
      FieldName = 'id_provincia'
      Required = True
      Size = 2
    end
    object sqlMunicipiosid_municipio: TStringField
      DisplayLabel = 'Cod municipio'
      FieldName = 'id_municipio'
      Required = True
      Size = 3
    end
    object sqlMunicipiosds_municipio: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'ds_municipio'
      Required = True
      Size = 50
    end
  end
  object sqlTiposVia: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select * from tipos_vial order by ds_tipo_via')
    Params = <>
    Left = 475
    Top = 361
    object sqlTiposViaid_tipo_via: TStringField
      DisplayLabel = 'Cod tipo vía'
      FieldName = 'id_tipo_via'
      Required = True
      Size = 5
    end
    object sqlTiposViads_tipo_via: TStringField
      DisplayLabel = 'Tipo vía'
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
  end
  object dsTiposVia: TDataSource
    DataSet = sqlTiposVia
    Left = 480
    Top = 411
  end
  object sqlClientesAccess: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select '
      '  ca.*,'
      '  ca.nm_compras + ca.nm_compra_inicial nm_compra_total,'
      '  dv.nm_descuento'
      'from '
      '  clientes_access ca,'
      '  descuentos_ventas dv'
      'where'
      
        '  (concat(ca.cod_cliente,upper(ca.ds_nombre_completo)) regexp up' +
        'per(:busqueda)) and'
      
        '  (floor(ca.nm_compras + ca.nm_compra_inicial) between dv.nm_des' +
        'de and dv.nm_hasta)'
      'order by '
      '  ca.ds_nombre_completo')
    Params = <
      item
        DataType = ftString
        Name = 'busqueda'
        ParamType = ptInput
      end>
    Left = 434
    Top = 30
    ParamData = <
      item
        DataType = ftString
        Name = 'busqueda'
        ParamType = ptInput
      end>
    object sqlClientesAccessid_cliente: TLargeintField
      FieldName = 'id_cliente'
    end
    object sqlClientesAccesscod_cliente: TSmallintField
      DisplayLabel = 'Cod. cliente'
      FieldName = 'cod_cliente'
      Required = True
    end
    object sqlClientesAccessds_nombre_completo: TStringField
      DisplayLabel = 'Nombre completo'
      FieldName = 'ds_nombre_completo'
      Required = True
      Size = 75
    end
    object sqlClientesAccessds_nif: TStringField
      DisplayLabel = 'NIF'
      FieldName = 'ds_nif'
      Size = 15
    end
    object sqlClientesAccessf_nacimiento: TDateField
      DisplayLabel = 'F. nacimiento'
      FieldName = 'f_nacimiento'
    end
    object sqlClientesAccessds_direccion_completa: TStringField
      DisplayLabel = 'Dirección completa'
      FieldName = 'ds_direccion_completa'
      Size = 85
    end
    object sqlClientesAccessds_cp: TStringField
      DisplayLabel = 'CP'
      FieldName = 'ds_cp'
      Size = 5
    end
    object sqlClientesAccessds_ciudad: TStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'ds_ciudad'
      Size = 50
    end
    object sqlClientesAccessds_telefono: TStringField
      DisplayLabel = 'Teléfono'
      FieldName = 'ds_telefono'
      Size = 50
    end
    object sqlClientesAccessnm_descuento_inicial: TFloatField
      DisplayLabel = 'Desc. ini.'
      FieldName = 'nm_descuento_inicial'
      Required = True
    end
    object sqlClientesAccessds_email: TStringField
      DisplayLabel = 'email'
      FieldName = 'ds_email'
      Size = 255
    end
    object sqlClientesAccessnm_compras: TFloatField
      DisplayLabel = 'Compra total'
      FieldName = 'nm_compras'
      Required = True
    end
    object sqlClientesAccessnm_compra_inicial: TFloatField
      DisplayLabel = 'Compra ini.'
      FieldName = 'nm_compra_inicial'
      Required = True
    end
    object sqlClientesAccessnm_compra_total: TFloatField
      DisplayLabel = 'Compra total'
      FieldName = 'nm_compra_total'
      Required = True
    end
    object sqlClientesAccessnm_descuento: TFloatField
      DisplayLabel = 'Desc. acum.'
      FieldName = 'nm_descuento'
      Required = True
    end
  end
  object dsClientesAccess: TDataSource
    DataSet = sqlClientesAccess
    Left = 435
    Top = 75
  end
  object sqlDireccionesClientes: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  d.*,'
      '  p.ds_provincia,'
      '  ifnull(m.ds_municipio,d.ds_municipio) municipio,'
      '  tv.ds_tipo_via'
      'from'
      '  clientes_direcciones cd'
      '  left join direcciones d on cd.id_direccion = d.id_direccion'
      '  left join provincias p on d.id_provincia = p.id_provincia'
      
        '  left join municipios m on (d.id_provincia = m.id_provincia) an' +
        'd (d.id_municipio = m.id_municipio)'
      '  left join tipos_vial tv on d.id_tipo_via = tv.id_tipo_via'
      'where'
      '  cd.id_cliente = :id_cliente '
      ' '
      ' ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end>
    DataSource = dsClientes
    Left = 410
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente'
        ParamType = ptUnknown
      end>
    object sqlDireccionesClientesid_direccion: TLargeintField
      FieldName = 'id_direccion'
    end
    object sqlDireccionesClientesid_provincia: TStringField
      FieldName = 'id_provincia'
      Size = 2
    end
    object sqlDireccionesClientesid_municipio: TStringField
      FieldName = 'id_municipio'
      Size = 5
    end
    object sqlDireccionesClientesds_municipio: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'ds_municipio'
      Size = 100
    end
    object sqlDireccionesClientesid_tipo_via: TStringField
      DisplayLabel = 'Tipo Vía'
      FieldName = 'id_tipo_via'
      Size = 5
    end
    object sqlDireccionesClientesds_nombre_via: TStringField
      DisplayLabel = 'Vía'
      FieldName = 'ds_nombre_via'
      Size = 50
    end
    object sqlDireccionesClientesds_numero: TStringField
      DisplayLabel = 'Número'
      FieldName = 'ds_numero'
      Size = 5
    end
    object sqlDireccionesClientesds_cp: TStringField
      DisplayLabel = 'CP'
      FieldName = 'ds_cp'
      Size = 5
    end
    object sqlDireccionesClientesds_cp_extranjero: TStringField
      DisplayLabel = 'CP extranjero'
      FieldName = 'ds_cp_extranjero'
      Size = 10
    end
    object sqlDireccionesClientesds_resto_direccion: TStringField
      DisplayLabel = 'Resto dirección'
      FieldName = 'ds_resto_direccion'
      Size = 100
    end
    object sqlDireccionesClientesds_provincia: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'ds_provincia'
      Required = True
      Size = 30
    end
    object sqlDireccionesClientesmunicipio: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'municipio'
      Required = True
      Size = 100
    end
    object sqlDireccionesClientesds_tipo_via: TStringField
      DisplayLabel = 'Tipo Vía largo'
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
  end
  object dsDireccionesClientes: TDataSource
    DataSet = sqlDireccionesClientes
    Left = 414
    Top = 301
  end
  object sqlBusquedaClientes: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'select'
      '  id_cliente, '
      
        '  concat(trim(ds_nombre),'#39' '#39',trim(ds_primer_apellido),'#39' '#39',ifnull' +
        '(trim(ds_segundo_apellido),'#39#39')) ds_nombre_completo'
      'from'
      '  clientes'
      'where'
      
        '  concat(trim(ds_nombre),'#39' '#39',trim(ds_primer_apellido),'#39' '#39',ifnull' +
        '(trim(ds_segundo_apellido),'#39#39')) like :ds_nombre')
    Params = <
      item
        DataType = ftString
        Name = 'ds_nombre'
        ParamType = ptInput
      end>
    Left = 151
    Top = 82
    ParamData = <
      item
        DataType = ftString
        Name = 'ds_nombre'
        ParamType = ptInput
      end>
  end
  object sqlCopiaDirAPresupuesto: TZReadOnlyQuery
    Connection = dmRanning.dbRanning
    SQL.Strings = (
      'update carrito_presupuesto set'
      '  id_provincia = :id_provincia,'
      '  id_municipio = :id_municipio,'
      '  id_tipo_via = :id_tipo_via,'
      '  ds_nombre_via = :ds_nombre_via,'
      '  ds_numero = :ds_numero,'
      '  ds_cp = :ds_cp,'
      '  ds_cp_extranjero = :ds_cp_extranjero,'
      '  ds_resto_direccion = :ds_resto_direccion,'
      '  ds_municipio = :ds_municipio'
      'where'
      '  id_cliente_web = :id_cliente_web'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    DataSource = dsDireccionesClientes
    Left = 443
    Top = 207
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_provincia'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_tipo_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_nombre_via'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_cp_extranjero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_resto_direccion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_municipio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    object LargeintField1: TLargeintField
      FieldName = 'id_direccion'
    end
    object StringField1: TStringField
      FieldName = 'id_provincia'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'id_municipio'
      Size = 5
    end
    object StringField3: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'ds_municipio'
      Size = 100
    end
    object StringField4: TStringField
      DisplayLabel = 'Tipo Vía'
      FieldName = 'id_tipo_via'
      Size = 5
    end
    object StringField5: TStringField
      DisplayLabel = 'Vía'
      FieldName = 'ds_nombre_via'
      Size = 50
    end
    object StringField6: TStringField
      DisplayLabel = 'Número'
      FieldName = 'ds_numero'
      Size = 5
    end
    object StringField7: TStringField
      DisplayLabel = 'CP'
      FieldName = 'ds_cp'
      Size = 5
    end
    object StringField8: TStringField
      DisplayLabel = 'CP extranjero'
      FieldName = 'ds_cp_extranjero'
      Size = 10
    end
    object StringField9: TStringField
      DisplayLabel = 'Resto dirección'
      FieldName = 'ds_resto_direccion'
      Size = 100
    end
    object StringField10: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'ds_provincia'
      Required = True
      Size = 30
    end
    object StringField11: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'municipio'
      Required = True
      Size = 100
    end
    object StringField12: TStringField
      DisplayLabel = 'Tipo Vía largo'
      FieldName = 'ds_tipo_via'
      Required = True
      Size = 24
    end
  end
end
