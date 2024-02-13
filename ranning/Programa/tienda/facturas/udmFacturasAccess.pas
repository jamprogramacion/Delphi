unit udmFacturasAccess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB;

type
  TdmFacturasAccess = class(TDataModule)
    dbAccess: TADOConnection;
    sqlVentas: TADOQuery;
    sqlClientes: TADOQuery;
    sqlProductos: TADOQuery;
    dsVentas: TDataSource;
    dsClientes: TDataSource;
    dsProductos: TDataSource;
    sqlVentasOPERACION: TFloatField;
    sqlVentasFECHAVEN: TDateTimeField;
    sqlVentasFechaGrabacion: TDateTimeField;
    sqlVentasIDEPRO: TWideStringField;
    sqlVentasCOLOR: TWideStringField;
    sqlVentasTALLA: TWideStringField;
    sqlVentasCANTIDAD: TFloatField;
    sqlVentasPRECIOVEN: TFloatField;
    sqlVentasPRECIOUNIT: TFloatField;
    sqlVentasDESCUENTO: TFloatField;
    sqlVentasPRECIOREAL: TFloatField;
    sqlVentasIDECLI: TSmallintField;
    sqlVentasFPAGO: TWideStringField;
    sqlVentasOBSERVA: TMemoField;
    sqlVentasGASTOSVENTA: TFloatField;
    sqlVentasVENDEDOR: TWideStringField;
    sqlVentasComision: TFloatField;
    sqlVentasCosteBruto: TFloatField;
    sqlVentasIVA: TFloatField;
    sqlVentasGastosEnvio: TFloatField;
    sqlVentasCosteEnvio: TFloatField;
    sqlVentasDestinoEnvio: TIntegerField;
    sqlClientesIDECLI: TSmallintField;
    sqlClientesNUMCLIANTERIOR: TSmallintField;
    sqlClientesCLIENTE: TWideStringField;
    sqlClientesNIF: TWideStringField;
    sqlClientesFECHANACIMIENTO: TDateTimeField;
    sqlClientesDIRECLI: TWideStringField;
    sqlClientesCODIGOP: TWideStringField;
    sqlClientesCIUDAD: TWideStringField;
    sqlClientesTELECLI: TWideStringField;
    sqlClientesCLUB: TWideStringField;
    sqlClientesGIMNASIO: TWideStringField;
    sqlClientesPROMOCION: TWideStringField;
    sqlClientesNUM_SOCIO: TWideStringField;
    sqlClientesDESCUENTO: TFloatField;
    sqlClientesTALLAPIE: TWideStringField;
    sqlClientesTALLATEXTIL: TWideStringField;
    sqlClientesTARJETA: TWordField;
    sqlClientesFECHAACTU: TDateTimeField;
    sqlClientesOBSERVA: TMemoField;
    sqlClientesCORREO: TWordField;
    sqlClientesEMAIL: TWideStringField;
    sqlClientesCL_TIPO: TWideStringField;
    sqlClientesCompraInicial: TFloatField;
    sqlProductosIDEPRO: TWideStringField;
    sqlProductosPRODUCTO: TWideStringField;
    sqlProductosTIPOPRO: TSmallintField;
    sqlProductosSEX_PROD: TFloatField;
    sqlProductosUSO: TWideStringField;
    sqlProductosPISADA: TWideStringField;
    sqlProductosIVA: TFloatField;
    sqlProductosIvaCobrado: TFloatField;
    sqlProductosCARACTER: TMemoField;
    sqlProductosUTILIDAD: TMemoField;
    sqlProductosIDEPROV: TIntegerField;
    sqlProductosACTIVO: TSmallintField;
    sqlProductosPROMOCION: TSmallintField;
    sqlProductosFECHAENTRADA: TDateTimeField;
    sqlProductoscolor: TWideStringField;
    sqlProductostalla: TWideStringField;
    sqlProductoscantidad: TFloatField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OpenDatabase;
    procedure RefreshData;
  end;

var
  dmFacturasAccess: TdmFacturasAccess;

implementation

{$R *.DFM}

procedure TdmFacturasAccess.DataModuleDestroy(Sender: TObject);
begin
  dbAccess.Close;
end;

procedure TdmFacturasAccess.OpenDatabase;
begin
  dbAccess.Open;
  sqlVentas.Open;
  sqlClientes.Open;
  sqlProductos.Open;
end;

procedure TdmFacturasAccess.RefreshData;
begin
  sqlVentas.Requery;
end;

end.
