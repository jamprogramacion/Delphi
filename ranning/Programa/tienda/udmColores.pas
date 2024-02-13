unit udmColores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdmColores = class(TDataModule)
    sqlColores: TZQuery;
    sqlColoresid_color: TLargeintField;
    sqlColoresds_color: TStringField;
    sqlColoresUpdate: TZReadOnlyQuery;
    sqlColoresInsert: TZReadOnlyQuery;
    sqlColoresDelete: TZReadOnlyQuery;
    dsColores: TDataSource;
    sqlColorStock: TZReadOnlyQuery;
    sqlHuecoCdColor: TZReadOnlyQuery;
    sqlHuecoCdColorcd_color: TStringField;
    procedure sqlColoresBeforeDelete(DataSet: TDataSet);
    procedure sqlColoresBeforePost(DataSet: TDataSet);
    procedure sqlColoresUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
  public
    {
    function UltCdColor: string;
    }
    function CdColor(nCdColor: Integer): string;
    procedure CambiaOrdenColores(const sCampo: string);
  end;

var
  dmColores: TdmColores = nil;

implementation

uses udmRanning, uCommon, uConst;

{$R *.DFM}

procedure TdmColores.sqlColoresBeforeDelete(DataSet: TDataSet);
begin
  if not sqlColorStock.Active then sqlColorStock.Open;
  if sqlColorStock.FieldByName('nm_producto').AsInteger <> 0 then begin
    ShowMessage('No se puede borrar este color porque hay productos en stock ' +
      'que lo tienen');
    Abort;
  end;

  if MessageDlg('¿Estás seguro de borrar este registro?',mtWarning,[mbYes,mbNo],0) = mrYes then begin
    sqlColoresDelete.ExecSQL;
    dmRanning.TablaModificada('colores','id_color',
      DataSet.FieldByName('id_color').AsInteger,raDelete);
  end;
end;

procedure TdmColores.sqlColoresBeforePost(DataSet: TDataSet);
begin
  case DataSet.State of
    dsEdit: begin
      sqlColoresUpdate.ExecSQL;
      dmRanning.TablaModificada('colores','id_color',
        DataSet.FieldByName('id_color').AsInteger,raModify);
    end;
    dsInsert: begin
      sqlColoresInsert.ExecSQL;
      dmRanning.TablaModificada('colores','id_color',dmRanning.UltimoID,raInsert);
    end;
  end;
end;

procedure TdmColores.sqlColoresUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
end;

function TdmColores.CdColor(nCdColor: Integer): string;
begin
  Result := LowerCase(ToBase(IntToStr(nCdColor),10,BASE_CD_COLOR,DIGITOS_CD_COLOR));
end;

{
function TdmColores.UltCdColor: string;

var
  nCont: Integer;
  nUlt: Integer;

begin
  if sqlHuecoCdColor.Active then sqlHuecoCdColor.Close;
  sqlHuecoCdColor.Open;
  sqlHuecoCdColor.Last;
  nUlt := ToDecimal(sqlHuecoCdColor.FieldByName('cd_color').AsString,BASE_CD_COLOR);
  sqlHuecoCdColor.First;
  nCont := 1;
  while (nCont <= nUlt) and (sqlHuecoCdColor.Locate('cd_color',CdColor(nCont),[])) do
   Inc(nCont);

  Result := CdColor(nCont);
end;
}
procedure TdmColores.CambiaOrdenColores(const sCampo: string);

var
  sAnt: Integer;

begin
  sAnt := sqlColores.FieldByName('id_color').AsInteger;
  sqlColores.DisableControls;
  try
    if sqlColores.Active then sqlColores.Close;
    sqlColores.SQL.Text := 'select * from colores order by ' + sCampo +
      ' for update';
    sqlColores.Open;
    sqlColores.Locate('id_color',sAnt,[]);
  finally
    sqlColores.EnableControls;
  end;
end;

end.
