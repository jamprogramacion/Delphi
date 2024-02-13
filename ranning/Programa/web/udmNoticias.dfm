object dmNoticias: TdmNoticias
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Default = True
      Name = 'wactNoticias'
      PathInfo = '/wnoticias'
      Producer = htmlTblNoticias
      OnAction = dmNoticiaswactNoticiasAction
    end
    item
      Name = 'wactNoticiasDetalle'
      PathInfo = '/wnoticia_detalle'
      OnAction = dmNoticiaswactNoticiasDetalleAction
    end>
  Left = 219
  Top = 164
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
  object sqlNoticias: TZReadOnlyQuery
    Connection = dbRanning
    SQL.Strings = (
      'select * from noticias'
      'order by f_suceso desc,nm_orden desc')
    Params = <>
    Left = 33
    Top = 315
  end
  object htmlTblNoticias: TDataSetTableProducer
    Columns = <
      item
        FieldName = 'f_suceso'
        Title.Caption = 'F. Suceso'
      end
      item
        FieldName = 'f_publicacion'
        Title.Caption = 'F. Publicación'
      end
      item
        FieldName = 'ds_titular'
        Title.Caption = 'Titular'
      end>
    MaxRows = -1
    DataSet = sqlNoticias
    TableAttributes.Custom = 'class="productos"'
    OnFormatCell = htmlTblNoticiasFormatCell
    Left = 109
    Top = 313
  end
  object htmlwNoticias: TPageProducer
    OnHTMLTag = htmlwNoticiasHTMLTag
    Left = 186
    Top = 314
  end
  object htmlNoticiaDetalle: TPageProducer
    OnHTMLTag = htmlNoticiaDetalleHTMLTag
    Left = 265
    Top = 318
  end
end
