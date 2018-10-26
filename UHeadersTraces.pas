unit UHeadersTraces;

interface
uses System.SysUtils,Generics.Collections,Generics.Defaults,UTSegY,UTTraceSegY,UTWordsDictionary;
type

  THeadersTraces = class
    NameSegY:String;
    arrayWordsDictionary:TObjectList<TWordsDictionary>;
    multiplier:Double;
    constructor Create(NameSegY:String;multiplier:Double);
    destructor Destroy;
    procedure designHeadersFromSegY();
  end;

implementation

{ THeadersTraces }

constructor THeadersTraces.Create(NameSegY:String;multiplier:Double);
begin
self.NameSegY:=NameSegY;
arrayWordsDictionary:=TObjectList<TWordsDictionary>.Create;
self.multiplier:=multiplier;
end;

procedure THeadersTraces.designHeadersFromSegY;
var
i:Cardinal;
SegY:TsegY;
begin
  try
    segY:=TSegY.Create(self.NameSegY);
    segY.readSegY;
      for I := 0 to pred(segY.countRealTraces) do begin
        arrayWordsDictionary.add(TWordsDictionary.Create(segY.TracesSegY[i],multiplier));
        arrayWordsDictionary[i].designWords;
      end;
  finally
    segY.Free;
  end;
end;

destructor THeadersTraces.Destroy;
begin
arrayWordsDictionary.Free;
end;

end.
