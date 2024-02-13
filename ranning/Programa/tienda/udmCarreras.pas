unit udmCarreras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDataset, Db, ZAbstractRODataset, ZAbstractDataset;

type
  TdmCarreras = class(TDataModule)
    sqlCarreras: TZQuery;
    sqlCarrerasInsert: TZReadOnlyQuery;
    sqlCarrerasUpdate: TZReadOnlyQuery;
    sqlCarrerasDelete: TZReadOnlyQuery;
    dsCarreras: TDataSource;
    sqlCarrerasid_carrera: TLargeintField;
    sqlCarrerasds_carrera: TStringField;
    sqlCarrerasid_provincia: TStringField;
    sqlCarrerasid_municipio: TStringField;
    sqlCarrerasds_distancia: TStringField;
    sqlCarrerasf_fecha: TDateField;
    sqlCarrerasnm_hora: TTimeField;
    sqlCarrerasit_tenemos_inscripcion: TStringField;
    sqlCarrerasnm_precio: TFloatField;
    sqlCarrerasds_pagina_web: TStringField;
    sqlCarrerasobservaciones: TMemoField;
    sqlCarrerasds_provincia: TStringField;
    sqlCarrerasds_municipio: TStringField;
    procedure sqlCarrerasBeforePost(DataSet: TDataSet);
    procedure sqlCarrerasBeforeDelete(DataSet: TDataSet);
    procedure sqlCarrerasNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCarreras: TdmCarreras = nil;

implementation

uses udmRanning;

{$R *.DFM}

procedure TdmCarreras.sqlCarrerasBeforePost(DataSet: TDataSet);
begin
  case DataSet.State of
    dsEdit: begin
      sqlCarrerasUpdate.ExecSQL;
      dmRanning.TablaModificada('carreras','id_carrera',
        DataSet.FieldByName('id_carrera').AsInteger,raModify);
    end;
    dsInsert: begin
      sqlCarrerasInsert.ExecSQL;
      dmRanning.TablaModificada('carreras','id_carrera',dmRanning.UltimoID,
        raInsert);
    end;
  end;
end;

procedure TdmCarreras.sqlCarrerasBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('¿Estás seguro de borrar este registro?',mtWarning,[mbYes,mbNo],0) = mrYes then begin
    sqlCarrerasDelete.ExecSQL;
    dmRanning.TablaModificada('carreras','id_carrera',
      DataSet.FieldByName('id_carrera').AsInteger,raDelete);
  end
  else
    Abort;
end;

procedure TdmCarreras.sqlCarrerasNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('f_fecha').AsDateTime := Date;
  DataSet.FieldByName('it_tenemos_inscripcion').AsString := CAMPO_NO_MARCADO;
end;

end.
