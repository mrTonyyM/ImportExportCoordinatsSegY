program I_ESegYCoordinates;

uses
  System.StartUpCopy,
  FMX.Forms,
  UI_ESegYCoordinates in 'UI_ESegYCoordinates.pas' {Form1},
  Format in 'Format.pas',
  UCDPoint in 'StringTextDate\UCDPoint.pas',
  UProfileData in 'UProfileData.pas',
  UArrayCoord in 'UArrayCoord.pas',
  UTSegY in 'UTSegY.pas',
  UTTraceSegY in 'UTTraceSegY.pas',
  UInterfaceModel in 'Interfaces\UInterfaceModel.pas',
  UCoordinateImportExport in 'UCoordinateImportExport.pas',
  UHeadersTraces in 'UHeadersTraces.pas',
  UTWordsDictionary in 'UTWordsDictionary.pas',
  UImportFormModal in 'UImportFormModal.pas' {ImportFormModal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TImportFormModal, ImportFormModal);
  Application.Run;
end.
