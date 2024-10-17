program ImportData;

{$R *.dres}

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmImportData in 'udmImportData.pas' {dmImportData: TDataModule},
  ufrmUsersImport in 'ufrmUsersImport.pas' {frmUsersImport},
  Vcl.Themes,
  Vcl.Styles,
  udmUsersImport in 'udmUsersImport.pas' {dmUsersImport: TDataModule},
  udmEventsImport in 'udmEventsImport.pas' {dmEventsImport: TDataModule},
  uIdentDocuments in '..\..\..\Delphi\JAMUtils\uIdentDocuments.pas',
  ufrmEventsImport in 'ufrmEventsImport.pas' {frmEventsImport},
  ufrmUsersList in 'ufrmUsersList.pas' {frmUsersList},
  udmElements in 'udmElements.pas' {dmElements: TDataModule},
  ufrmElements in 'ufrmElements.pas' {frmElements},
  udmUsersElementsImport in 'udmUsersElementsImport.pas' {dmUsersElementsImport: TDataModule},
  ufrmUsersElementsImport in 'ufrmUsersElementsImport.pas' {frmUsersElementsImport},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Introducción de datos en Whyuon';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmImportData, dmImportData);
  Application.CreateForm(TdmUsersImport, dmUsersImport);
  Application.CreateForm(TdmEventsImport, dmEventsImport);
  Application.CreateForm(TdmUsersElementsImport, dmUsersElementsImport);
  Application.Run;
end.
