unit UArrayCoord;

interface
uses UTSegY;

type
  TArrayCoord = class
    min,max:Double;
    arrX:TArray<Double>;
    arrY:TArray<Double>;
    constructor Create(sgy:TSegY);
  end;

implementation

{ TArrayCoord }

constructor TArrayCoord.Create(sgy: TSegY);
var
i:integer;
begin

  setLength(arrX,sgy.TracesSegy.Count);
  setLength(arrY,sgy.TracesSegy.Count);
  for I := 0 to pred(sgy.TracesSegy.Count) do begin
    arrX[i]:=sgy.TracesSegy[i].getX_S;
    arrY[i]:=sgy.TracesSegy[i].getY_S;

  end;

end;

end.
