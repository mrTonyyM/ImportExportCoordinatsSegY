unit UCoordinateImportExport;

interface

uses UTWordsDictionary,FMX.Dialogs,System.SysUtils,Generics.Collections,Generics.Defaults,System.Classes,UProfileData,UTSegY,UInterfaceModel,UHeadersTraces;

type

  TCoordinator = class{(TInterfacedObject,ICoordinator)}
  private
    FarraySegYNames:TStringList;//при изменении содержимого в lb1 - обновляется массив имен файлов

    FGridWordStatusTrue:TArray<String>;//при изменении статуса чекбокса - надо чтобы массив тут же бы обновлялся

    FMultiplier:Double;

    FActualNumberSegY:Cardinal;

    FSaveName:String;
  public
    constructor Create();
    destructor Destroy;
    procedure extractCoordinatesToFile();

    procedure setArraySegYNames(arraySegYNames:TStringList);
    procedure setActualNumberSegY(Index:Cardinal);
    procedure setSaveName(SaveName:String);
    procedure setGridWordStatusTrue(GridWordStatusTrue:TArray<String>);
    procedure setMultiplier(multiplier:Double);
  private
    function getLineValues(NProf:String;WordsDictionary:TWordsDictionary):String;
    function getAllSegYValues(SegYFileName:String):TStringList;
 { properties }
  public
    property arraySegYNames:TStringList read FarraySegYNames write setArraySegYNames;
    property ActualNumberSegY:Cardinal read FactualNumberSegY write setActualNumberSegY;
    property GridWordStatusTrue:TArray<String> read FGridWordStatusTrue write setGridWordStatusTrue;
    property SaveName:String read FSaveName write setSaveName;
    property Multiplier:Double read FMultiplier write setMultiplier;
  end;

implementation

{ Coordinator }

constructor TCoordinator.Create();
begin
  FarraySegYNames:=TStringList.Create();
  FActualNumberSegY:=0;
end;

procedure TCoordinator.setActualNumberSegY(Index: Cardinal);
begin
  if FActualNumberSegY<>Index then begin
    FActualNumberSegY:=Index;
  end;
end;

procedure TCoordinator.setArraySegYNames(arraySegYNames:TStringList);
begin
	FArraySegYNames.Clear;
	FArraySegYNames.AddStrings(arraySegYNames);
end;

procedure TCoordinator.setGridWordStatusTrue(GridWordStatusTrue: TArray<String>);
begin
  self.FGridWordStatusTrue:=GridWordStatusTrue;
end;

procedure TCoordinator.setMultiplier(multiplier: Double);
begin
self.FMultiplier:=multiplier;
end;

procedure TCoordinator.setSaveName(SaveName: String);
begin
  self.FSaveName:=SaveName;
end;

destructor TCoordinator.Destroy;
begin
  FarraySegYNames.Free;
end;

procedure TCoordinator.extractCoordinatesToFile;
var
i:Cardinal;
sL:TStringList;
str:String;
begin
str:='N_Profile';
  try
    sL:=TStringList.Create();
    for i := Low (GridWordStatusTrue) to High (GridWordStatusTrue) do
      str:=str+#9+GridWordStatusTrue[i];
    sL.Add(str);
    str:='';
      for i := 0 to pred (arraySegYNames.Count) do begin
        sL.AddStrings(getAllSegYValues(arraySegYNames[i]));
      end;
  finally
    sl.SaveToFile(FSaveName);
    sL.free;
  end;
end;

function TCoordinator.getAllSegYValues(SegYFileName:String): TStringList;
var
i:Cardinal;
headersTraces:THeadersTraces;
begin
  try
    result:=TStringList.Create();
    headersTraces:=THeadersTraces.Create(SegYFileName,Multiplier);
    headersTraces.designHeadersFromSegY;
      for i := 0 to pred(headersTraces.arrayWordsDictionary.count) do begin
        result.add(getLineValues(changefileExt(extractfilename(SegYFileName),''),headersTraces.arrayWordsDictionary[i]));
      end;
  finally
    headersTraces.Free;
  end;

end;

function TCoordinator.getLineValues(NProf:String;WordsDictionary:TWordsDictionary): String;
var
i:Cardinal;
begin
result:='';
  for i := Low (GridWordStatusTrue) to High (GridWordStatusTrue) do begin
    result:=result+#9+WordsDictionary.Words[GridWordStatusTrue[i]].ToString;
  end;
  result:=NProf+result;
end;

end.
