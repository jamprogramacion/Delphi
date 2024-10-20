object dmMail: TdmMail
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Default = True
      Name = 'wactMail'
      PathInfo = '/wmail'
      Producer = htmlwMail
      OnAction = dmMailwactMailAction
    end
    item
      Name = 'wactMailCiente'
      PathInfo = '/wmail_cliente'
      Producer = htmlwMailCliente
      OnAction = dmMailwactMailCienteAction
    end
    item
      Name = 'wactMailExt'
      PathInfo = '/wmail_ext'
      Producer = htmlwMailExt
      OnAction = dmMailwactMailExtAction
    end
    item
      Name = 'wactMailPresupuesto'
      PathInfo = '/wmail_presupuesto'
      Producer = htmlwMailPresupuesto
      OnAction = dmMailwactMailPresupuestoAction
    end>
  Left = 243
  Top = 153
  Height = 498
  Width = 727
  object smtp: TJAMSMTP
    Host = 'smtp.ranning.com'
    Port = 25
    ReportLevel = 0
    OnConnect = smtpConnect
    UserID = 'xam408c'
    PostMessage.FromAddress = 'ventaweb@ranning.com'
    PostMessage.FromName = 'Venta web'
    PostMessage.LocalProgram = 'wwwMail'
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'iso-8859-1'
    OnSuccess = smtpSuccess
    Password = 'MAILvent2292'
    OnPwdAuthenticationFailed = smtpPwdAuthenticationFailed
    Left = 12
    Top = 20
  end
  object htmlwMail: TPageProducer
    OnHTMLTag = htmlwMailHTMLTag
    Left = 89
    Top = 19
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
    Left = 167
    Top = 18
  end
  object htmlwMailPresupuesto: TPageProducer
    OnHTMLTag = htmlwMailPresupuestoHTMLTag
    Left = 89
    Top = 77
  end
  object sqlCarritoPresupuesto: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'insert into carrito_presupuesto ('
      '  id_cliente_web,'
      '  f_fecha_compra,'
      '  id_estado_pedido,'
      '  ds_email,'
      '  ds_primer_apellido,'
      '  ds_segundo_apellido,'
      '  ds_nombre,'
      '  it_canarias,'
      '  ds_cp,'
      '  id_provincia,'
      '  id_municipio,'
      '  ds_municipio,'
      '  ds_resto_direccion,'
      '  id_tipo_via,'
      '  ds_nombre_via,'
      '  ds_numero,'
      '  ds_dni,'
      '  ds_telefono,'
      '  id_cliente,'
      '  id_agencia_transporte,'
      '  id_forma_pago,'
      '  nm_gastos_envio,'
      '  ds_observaciones)'
      'values ('
      '  :id_cliente_web,'
      '  :f_fecha_compra,'
      '  :id_estado_pedido,'
      '  :ds_email,'
      '  :ds_primer_apellido,'
      '  :ds_segundo_apellido,'
      '  :ds_nombre,'
      '  :it_canarias,'
      '  :ds_cp,'
      '  :id_provincia,'
      '  :id_municipio,'
      '  :ds_municipio,'
      '  :ds_resto_direccion,'
      '  :id_tipo_via,'
      '  :ds_nombre_via,'
      '  :ds_numero,'
      '  :ds_dni,'
      '  :ds_telefono,'
      '  :id_cliente,'
      '  :id_agencia_transporte,'
      '  :id_forma_pago,'
      '  :nm_gastos_envio,'
      '  :ds_observaciones)')
    Params = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'f_fecha_compra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_estado_pedido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_email'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_primer_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_segundo_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'it_canarias'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_cp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_provincia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_municipio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_municipio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_resto_direccion'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_tipo_via'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_nombre_via'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_numero'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_dni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_telefono'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_agencia_transporte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_forma_pago'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_gastos_envio'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = 'ds_observaciones'
        ParamType = ptInput
      end>
    Left = 72
    Top = 149
    ParamData = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'f_fecha_compra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_estado_pedido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_email'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_primer_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_segundo_apellido'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'it_canarias'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_cp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_provincia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_municipio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_municipio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_resto_direccion'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_tipo_via'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_nombre_via'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_numero'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_dni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ds_telefono'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_agencia_transporte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_forma_pago'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nm_gastos_envio'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = 'ds_observaciones'
        ParamType = ptInput
      end>
  end
  object sqlClienteExiste: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select id_cliente_web from carrito_presupuesto '
      'where id_cliente_web = :id_cliente_web')
    Params = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    Left = 181
    Top = 277
    ParamData = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
  end
  object sqlProvincias: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select id_provincia,ds_provincia from provincias '
      'order by ds_provincia')
    Params = <>
    Left = 261
    Top = 21
  end
  object sqlCarrito: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select distinct'
      '  ca.cd_color,'
      '  m.ds_marca,'
      '  concat(m.cd_marca,p.cd_producto) ds_cod_producto,'
      '  p.ds_producto,'
      '  t.ds_talla,'
      '  ca.nm_descuento,'
      '  ca.nm_pvp,'
      '  ca.nm_cantidad,'
      
        '  (1 - ca.nm_descuento / 100) * ca.nm_pvp * ca.nm_cantidad nm_pr' +
        'ecio_final,'
      '  ifnull(s.cd_color_fabricante,'#39#39') cd_color_fabricante,'
      '  tt.ds_tipo_talla'
      'from'
      '  marcas m,'
      '  productos p,'
      '  tallas t,'
      '  carrito ca,'
      '  stock s,'
      '  tipos_tallas tt'
      'where'
      '  (ca.id_cliente_web = :id_cliente_web) and'
      '  (ca.id_producto = p.id_producto) and'
      '  (ca.id_talla = t.id_talla) and'
      '  (ca.id_producto = s.id_producto) and'
      '  (ca.cd_color = s.cd_color) and'
      '  (ca.id_talla = s.id_talla) and'
      '  (t.id_tipo_talla = tt.id_tipo_talla) and'
      '  (p.id_marca = m.id_marca)'
      ' '
      ''
      '')
    Params = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
    Left = 145
    Top = 212
    ParamData = <
      item
        DataType = ftString
        Name = 'id_cliente_web'
        ParamType = ptInput
      end>
  end
  object sqlVacaciones: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from vacaciones'
      
        'where date_add(curdate(),interval 1 day) between f_desde and dat' +
        'e_add(f_hasta,interval 1 day)')
    Params = <>
    Left = 366
    Top = 24
  end
  object sqlFestivos: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select f_festivo,ds_festivo from festivos'
      
        'where date_add(curdate(),interval 1 day) between f_festivo and d' +
        'ate_add(f_festivo,interval 1 day)')
    Params = <>
    Left = 374
    Top = 88
  end
  object htmlwMailCliente: TPageProducer
    OnHTMLTag = htmlwMailClienteHTMLTag
    Left = 70
    Top = 257
  end
  object sqlMunicipios: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select id_provincia,id_municipio,ds_municipio from municipios'
      'where id_provincia = :id_provincia'
      'order by ds_municipio')
    Params = <
      item
        DataType = ftString
        Name = 'id_provincia'
        ParamType = ptInput
      end>
    Left = 237
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'id_provincia'
        ParamType = ptInput
      end>
  end
  object sqlCP: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select ds_cp from municipios'
      
        'where (id_provincia = :id_provincia) and (id_municipio = :id_mun' +
        'icipio)'
      '')
    Params = <
      item
        DataType = ftString
        Name = 'id_provincia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_municipio'
        ParamType = ptInput
      end>
    Left = 327
    Top = 194
    ParamData = <
      item
        DataType = ftString
        Name = 'id_provincia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_municipio'
        ParamType = ptInput
      end>
  end
  object sqlTiposVia: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from tipos_vial'
      'order by ds_tipo_via')
    Params = <>
    Left = 247
    Top = 174
  end
  object smtpMuni: TJAMSMTP
    Host = 'smtp.ranning.com'
    Port = 25
    ReportLevel = 0
    OnConnect = smtpConnect
    UserID = 'xam408c'
    PostMessage.FromAddress = 'ventaweb@ranning.com'
    PostMessage.FromName = 'Venta web'
    PostMessage.ToBlindCarbonCopy.Strings = (
      'ventaweb@ranning.com')
    PostMessage.Subject = 'Municipios'
    PostMessage.LocalProgram = 'wwwMail'
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'iso-8859-1'
    Password = 'MAILvent2292'
    Left = 13
    Top = 68
  end
  object sqlFormasPago: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  a.id_agencia_transporte,'
      '  a.id_forma_pago,'
      '  fp.ds_forma_pago,'
      '  a.ds_agencia_transporte,'
      '  a.nm_gastos_envio,'
      '  a.it_envio_extranjero,'
      '  a.nm_comision_reembolso,'
      '  a.nm_fijo_reembolso,'
      '  a.nm_minimo_comision,'
      '  concat(fp.ds_forma_pago,'#39'. '#39',a.ds_agencia_transporte) ds_envio'
      'from'
      '  agencias_transporte a,'
      '  formas_pago fp'
      'where'
      '  (a.id_forma_pago = fp.id_forma_pago) and'
      '  (a.it_activo = '#39'X'#39')'
      'order by'
      '  a.ds_agencia_transporte,'
      '  a.nm_gastos_envio desc'
      ' ')
    Params = <>
    Left = 298
    Top = 254
  end
  object htmlwMailExt: TPageProducer
    OnHTMLTag = htmlwMailExtHTMLTag
    Left = 184
    Top = 69
  end
  object smtpExt: TJAMSMTP
    Host = 'smtp.ranning.com'
    Port = 25
    ReportLevel = 0
    OnConnect = smtpConnect
    UserID = 'xam408c'
    PostMessage.FromName = 'Ranning'
    PostMessage.LocalProgram = 'wwwMail'
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'iso-8859-1'
    OnSuccess = smtpExtSuccess
    Password = ' LL ? '#39'W,?                                   '
    Left = 151
    Top = 128
  end
  object sqlCorreoExterno: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      
        'select *,aes_decrypt(ds_smtp_pwd,ds_smtp_user) ds_pwd from corre' +
        'o_externo '
      'where id_correo_externo = :id_correo_externo')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_correo_externo'
        ParamType = ptInput
      end>
    Left = 258
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_correo_externo'
        ParamType = ptInput
      end>
  end
  object sqlClientes: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  c.*,'
      '  d.*,'
      '  p.ds_provincia,'
      
        '  if(m.ds_municipio <> '#39#39',m.ds_municipio,d.ds_municipio) municip' +
        'io'
      'from'
      '  clientes c'
      
        '  left join clientes_direcciones cd on c.id_cliente = cd.id_clie' +
        'nte'
      '  left join direcciones d on cd.id_direccion = d.id_direccion'
      '  left join provincias p on d.id_provincia = p.id_provincia'
      
        '  left join municipios m on (p.id_provincia = m.id_provincia) an' +
        'd (d.id_municipio = m.id_municipio)'
      'where'
      '  (c.ds_dni = :ds_dni) or'
      '  (c.ds_email = :ds_email)')
    Params = <
      item
        DataType = ftString
        Name = 'ds_dni'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end>
    Left = 293
    Top = 307
    ParamData = <
      item
        DataType = ftString
        Name = 'ds_dni'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ds_email'
        ParamType = ptUnknown
      end>
  end
  object htmlwMailOk: TPageProducer
    OnHTMLTag = htmlwMailOkHTMLTag
    Left = 87
    Top = 313
  end
  object sqlTotalPedido: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      
        '  sum(round((1 - ca.nm_descuento / 100) * ca.nm_pvp,2) * ca.nm_c' +
        'antidad) nm_total'
      'from'
      '  carrito ca'
      'where'
      '  ca.id_cliente_web = :id_cliente_web')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end>
    Left = 417
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_cliente_web'
        ParamType = ptUnknown
      end>
  end
  object sqlGastosEnvio: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * '
      'from'
      '  gastos_envio'
      'where '
      '  (id_agencia_transporte = :id_agencia_transporte) and'
      '  (id_forma_pago = :id_forma_pago) and'
      '  (:nm_total between nm_desde and nm_hasta)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_total'
        ParamType = ptInput
      end>
    DataSource = dsFormasPago
    Left = 373
    Top = 311
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_agencia_transporte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_forma_pago'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nm_total'
        ParamType = ptInput
      end>
  end
  object dsFormasPago: TDataSource
    DataSet = sqlFormasPago
    Left = 239
    Top = 241
  end
  object sqlGastosEnvioSuplemento: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select'
      '  g.*'
      'from'
      '  gastos_envio_suplemento g,'
      '  provincias p'
      'where'
      '  (p.id_provincia = :id_provincia) and'
      '  (p.id_autonomia = g.id_autonomia) and'
      '  (id_agencia_transporte = :id_agencia_transporte)')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_provincia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_agencia_transporte'
        ParamType = ptInput
      end>
    DataSource = dsFormasPago
    Left = 429
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_provincia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_agencia_transporte'
        ParamType = ptInput
      end>
  end
end
