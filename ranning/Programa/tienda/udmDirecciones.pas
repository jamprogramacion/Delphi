unit udmDirecciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZAbstractRODataset, ZDataset, ZAbstractDataset;

type
  TdmDirecciones = class(TDataModule)
    dsProvincias: TDataSource;
    dsMunicipios: TDataSource;
    sqlProvincias: TZReadOnlyQuery;
    sqlMunicipios: TZReadOnlyQuery;
    sqlProvinciasid_autonomia: TStringField;
    sqlProvinciasid_provincia: TStringField;
    sqlProvinciasds_provincia: TStringField;
    sqlProvinciasds_matricula: TStringField;
    sqlMunicipiosid_provincia: TStringField;
    sqlMunicipiosid_municipio: TStringField;
    sqlMunicipiosds_municipio: TStringField;
    sqlTiposVia: TZReadOnlyQuery;
    dsTiposVia: TDataSource;
    sqlTiposViaid_tipo_via: TStringField;
    sqlTiposViads_tipo_via: TStringField;
    sqlMunicipiosds_cp: TStringField;
    sqlMunicipiosUpdate: TZReadOnlyQuery;
    sqlMunicipiosid: TLargeintField;
    dsDirecciones: TDataSource;
    sqlDirecciones: TZQuery;
    sqlDireccionesInsert: TZReadOnlyQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    sqlDireccionesUpdate: TZReadOnlyQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    sqlDireccionesid_direccion: TLargeintField;
    sqlDireccionesid_provincia: TStringField;
    sqlDireccionesid_municipio: TStringField;
    sqlDireccionesds_municipio: TStringField;
    sqlDireccionesid_tipo_via: TStringField;
    sqlDireccionesds_nombre_via: TStringField;
    sqlDireccionesds_numero: TStringField;
    sqlDireccionesds_cp: TStringField;
    sqlDireccionesds_cp_extranjero: TStringField;
    sqlDireccionesds_resto_direccion: TStringField;
    sqlDireccionesds_provincia: TStringField;
    sqlDireccionesmunicipio: TStringField;
    sqlDireccionesds_tipo_via: TStringField;
    sqlDireccionesDelete: TZReadOnlyQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    sqlDireccionesds_direccion: TStringField;
    procedure sqlDireccionesUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sqlDireccionesBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlDireccionesBeforeDelete(DataSet: TDataSet);
  private
    FIdCliente: Integer;
    function GetIdCliente: Integer;
    procedure SetIdCliente(const Value: Integer);
  public
    procedure ActualizaCP(const sCP: string);
    class function DireccionCompleta(nIdCliente: Integer): string;

    property IdCliente: Integer read GetIdCliente write SetIdCliente;
  end;

var
  dmDirecciones: TdmDirecciones = nil;

implementation

uses udmRanning, udmClientes, uCommon;

{$R *.DFM}

{ TdmDirecciones }

procedure TdmDirecciones.ActualizaCP(const sCP: string);
begin
  sqlMunicipiosUpdate.ParamByName('cp').AsString := sCP;
  sqlMunicipiosUpdate.ExecSQL;
  dmRanning.TablaModificada('municipios','id',
    sqlMunicipios.FieldByName('id').AsInteger,raModify);
end;

procedure TdmDirecciones.sqlDireccionesUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

procedure TdmDirecciones.sqlDireccionesBeforePost(DataSet: TDataSet);

var
  nUltDir: Integer;

begin
  case DataSet.State of
    dsEdit: begin
      sqlDireccionesUpdate.ExecSQL;
      dmRanning.TablaModificada('direcciones','id_direccion',
        DataSet.FieldByName('id_direccion').AsInteger,raModify);
    end;
    dsInsert: begin
      sqlDireccionesInsert.ExecSQL;
      nUltDir := dmRanning.UltimoID;
      dmRanning.TablaModificada('direcciones','id_direccion',nUltDir,raInsert);
      if FIdCliente <> -1 then begin
        dmRanning.ComandoSQL('insert into clientes_direcciones (id_cliente,' +
          'id_direccion) values (' + IntToStr(FIdCliente) + ',' +
          IntToStr(nUltDir) + ')',csEjecutar);
        dmRanning.TablaModificada('clientes_direcciones','id_direccion',
          nUltDir,raInsert);
      end;
    end;
  end;
end;

function TdmDirecciones.GetIdCliente: Integer;
begin
  Result := FIdCliente;
end;

procedure TdmDirecciones.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TdmDirecciones.DataModuleCreate(Sender: TObject);
begin
  FIdCliente := -1;
end;

procedure TdmDirecciones.sqlDireccionesBeforeDelete(DataSet: TDataSet);
begin
  dmRanning.TablaModificada('direcciones','id_direccion',
    DataSet.FieldByName('id_direccion').AsInteger,raDelete);

  dmRanning.ComandoSQL('delete from clientes_direcciones where id_direccion = ' +
    DataSet.FieldByName('id_direccion').AsString,csEjecutar);
  dmRanning.TablaModificada('clientes_direcciones','id_direccion',
    DataSet.FieldByName('id_direccion').AsInteger,raDelete);
end;

class function TdmDirecciones.DireccionCompleta(nIdCliente: Integer): string;

var
  sqlDir: TZReadOnlyQuery;
  nIdDir: Integer;
  sDir: string;
  sCliente: string;
  slCol: TStringList;

begin
  Result := '';
  sCliente := TdmClientes.NombreCompletoClienteEsp(nIdCliente);
  nIdDir := -1;
  sqlDir := dmRanning.ComandoSQL('select d.*,p.ds_provincia,' +
    'ifnull(m.ds_municipio,d.ds_municipio) municipio from ' +
    'clientes_direcciones cd left join direcciones d on ' +
    'cd.id_direccion = d.id_direccion left join provincias p on ' +
    'd.id_provincia = p.id_provincia left join municipios m on ' +
    '(d.id_provincia = m.id_provincia) and (d.id_municipio = m.id_municipio) ' +
    'where id_cliente = ' + IntToStr(nIdCliente),csResultado);
  if sqlDir.RecordCount > 1 then begin
    slCol := TStringList.Create;
    try
      slCol.Add('id_tipo_via=Tipo v�a');
      slCol.Add('ds_nombre_via=V�a');
      slCol.Add('ds_numero=N�mero');
      slCol.Add('ds_resto_direccion=Resto direcci�n');
      slCol.Add('ds_cp=CP');
      slCol.Add('municipio=Municipio');
      slCol.Add('ds_provincia=Provincia');
      slCol.Add('ds_cp_extranjero=CP extranjero');
      if SelectDataSetOption('Selecciona una de las direcciones del cliente',sqlDir,slCol) = mrOk then
        nIdDir := sqlDir.FieldByName('id_direccion').AsInteger;
    finally
      slCol.Free;
    end;
  end
  else
    nIdDir := sqlDir.FieldByName('id_direccion').AsInteger;

  if nIdDir = -1 then Exit;

  if nIdDir <> sqlDir.FieldByName('id_direccion').AsInteger then
    sqlDir.Locate('id_direccion',nIdDir,[]);

  sDir := sCliente + #13 + #10 + sqlDir.FieldByName('id_tipo_via').AsString +
    ' ' + Trim(sqlDir.FieldByName('ds_nombre_via').AsString) + ' ' +
    Trim(sqlDir.FieldByName('ds_numero').AsString);
  if Trim(sqlDir.FieldByName('ds_resto_direccion').AsString) <> '' then
    sDir := sDir + ', ' + sqlDir.FieldByName('ds_resto_direccion').AsString;
  if Trim(sqlDir.FieldByName('ds_cp').AsString) <> '' then
    sDir := sDir + #13 + #10 + Trim(sqlDir.FieldByName('ds_cp').AsString) + ' ' +
    Trim(sqlDir.FieldByName('municipio').AsString) + ' (' +
    sqlDir.FieldByName('ds_provincia').AsString + ')'
  else begin
    sDir := sDir + #13 + #10 + sqlDir.FieldByName('ds_cp_extranjero').AsString;
    if Trim(sqlDir.FieldByName('municipio').AsString) <> '' then
      sDir := sDir + ' ' + Trim(sqlDir.FieldByName('municipio').AsString);
    if Trim(sqlDir.FieldByName('ds_provincia').AsString) <> '' then
      sDir := sDir + ' (' + Trim(sqlDir.FieldByName('ds_provincia').AsString) + ')';
  end;
  dmRanning.ComandoSQLFree(sqlDir);

  Result := sDir;
end;

end.
