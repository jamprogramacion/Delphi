object dmCarreras: TdmCarreras
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Default = True
      Name = 'wactCarreras'
      PathInfo = '/wcarreras'
      Producer = htmlwCarreras
      OnAction = dmCarreraswactCarrerasAction
    end>
  Left = 192
  Top = 139
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
  object htmlTblCarreras: TDataSetTableProducer
    Columns = <
      item
        FieldName = 'f_fecha'
        Title.Caption = 'Fecha'
      end
      item
        FieldName = 'hora'
        Title.Caption = 'Hora'
      end
      item
        FieldName = 'ds_provincia'
        Title.Caption = 'Provincia'
      end
      item
        FieldName = 'ds_municipio'
        Title.Caption = 'Municipio'
      end
      item
        FieldName = 'ds_carrera'
        Title.Caption = 'Carrera'
      end
      item
        Custom = 'class="al_derecha"'
        FieldName = 'ds_distancia'
        Title.Caption = 'Distancia'
      end
      item
        Custom = 'class="al_derecha"'
        FieldName = 'precio'
        Title.Caption = 'Precio'
      end
      item
        FieldName = 'observaciones'
        Title.Caption = 'Observaciones'
      end>
    MaxRows = -1
    DataSet = sqlCarreras
    TableAttributes.Custom = 'class="productos"'
    OnFormatCell = htmlTblCarrerasFormatCell
    Left = 107
    Top = 180
  end
  object sqlCarreras: TZReadOnlyQuery
    Connection = dbRanning
    BeforeOpen = sqlCarrerasBeforeOpen
    SQL.Strings = (
      'select'
      '  p.ds_provincia,'
      '  m.ds_municipio,'
      '  c.ds_carrera,'
      '  c.ds_distancia,'
      '  c.f_fecha,'
      '  if(c.nm_hora = '#39'0:00:00'#39','#39#39',c.nm_hora) hora,'
      '  c.it_tenemos_inscripcion,'
      '  if(c.nm_precio = 0,null,c.nm_precio) precio,'
      '  c.observaciones,'
      '  c.ds_pagina_web'
      'from'
      '  carreras c,'
      '  provincias p,'
      '  municipios m'
      'where'
      '  (c.id_provincia = p.id_provincia) and'
      '  (c.id_provincia = m.id_provincia) and'
      '  (c.id_municipio = m.id_municipio) and'
      '  (c.f_fecha >= :f_fecha)'
      'order by'
      '  c.f_fecha,'
      '  c.nm_hora,'
      '  p.ds_provincia,'
      '  m.ds_municipio')
    Params = <
      item
        DataType = ftDate
        Name = 'f_fecha'
        ParamType = ptInput
      end>
    Left = 38
    Top = 183
    ParamData = <
      item
        DataType = ftDate
        Name = 'f_fecha'
        ParamType = ptInput
      end>
  end
  object htmlwCarreras: TPageProducer
    OnHTMLTag = htmlwCarrerasHTMLTag
    Left = 178
    Top = 180
  end
end
