unit Format;

interface

uses  Windows;
 type
  TArrLW=array of LongWord;
  TArrL=array of LongInt;
  TArrD=array of Double;
  TArrS=array of Single;
  TArrE=array of Extended;
 
 function SwapW(Value: Word): Word;overload;assembler;
 function SwapW(Value: SmallInt): SmallInt;overload;assembler;
 function SwapW(Value:LongWord):LongWord;overload;assembler;
 function SwapW(Value:LongInt):LongInt;overload;assembler;

 function SwapW(Value: Int64): Int64;overload;assembler;
 function swapF(Value:LongWord):Single;overload;
 //function swapF(Value:int64):double;overload;

 function SwapW_Fl(Value:LongWord):Single;overload;assembler;
 function SwapFlt(Value:Single):Single;
 function SwapSingle(Value: Single): Single;
 function SwapDBL(Value:Double):Double;

 function SwapIBMFloat(Value:Longint):Single;

implementation

// свопирование для java
// ival = bswap(*(int*)(&pData[1]));
// fval = *(float*)&ival;

function SwapW(Value: Word): Word;overload;assembler;
asm
 XCHG al,ah
end;

function SwapW(Value: SmallInt): SmallInt;overload;assembler;
asm
 XCHG al,ah
end;

function SwapW(Value:LongWord):LongWord;overload;assembler;
 asm
 bswap eax
 end;

function SwapW(Value:LongInt):LongInt;overload;assembler;
 asm
 bswap eax
 end;

 function SwapW_Fl(Value:LongWord):Single;overload;assembler;
 asm
 bswap eax
 end;
 
 function SwapW(Value: Int64): Int64;overload; assembler;
asm
  mov edx, [esp+8]
  bswap edx
  mov eax, [esp+12]
  bswap eax
end;

function swapflt(Value:single):single;
var
dd:array [0..3] of  byte absolute value;
temp:byte;
i:integer;
begin

                          for i:=0 to 1 do begin
                          temp:=dd[i];
                          dd[i]:=dd[3-i];
                          dd[3-i]:=temp;
                          end;
                          result:=value;


end;

function SwapSingle(Value: Single): Single;
Type
  Bytes = packed array[0..3] of Byte;

begin
  Bytes(Result)[0]:= Bytes(Value)[3];
  Bytes(Result)[1]:= Bytes(Value)[2];
  Bytes(Result)[2]:= Bytes(Value)[1];
  Bytes(Result)[3]:= Bytes(Value)[0];

end;

function SwapF(Value:LongWord):Single;overload;
begin
  result:=(SwapW(Value));
end;

function swapDBL(Value:double):double;
var
dd:array [0..7] of  byte absolute value;
temp:byte;
i:integer;
begin

                          for i:=0 to 3 do begin
                          temp:=dd[i];
                          dd[i]:=dd[7-i];
                          dd[7-i]:=temp;
                          end;
                          result:=value;
end;

function SwapDouble(Value: Double): Double;
type
  Bytes = packed array[0..7] of Byte;

begin
  Bytes(Result)[0]:= Bytes(Value)[7];
  Bytes(Result)[1]:= Bytes(Value)[6];
  Bytes(Result)[2]:= Bytes(Value)[5];
  Bytes(Result)[3]:= Bytes(Value)[4];
  Bytes(Result)[4]:= Bytes(Value)[3];
  Bytes(Result)[5]:= Bytes(Value)[2];
  Bytes(Result)[6]:= Bytes(Value)[1];
  Bytes(Result)[7]:= Bytes(Value)[0];
end;

function SwapIBMFloat(Value:longint):single;
var
dd:array [0..2] of  byte ;
s,e:byte;
mantis:single;
i:integer;
begin
     Value:=SwapW(Value);
     s:=(Value shr 31);
     if s=0 then i:=1
     else i:=-1;

     e:=(Value shr 24) and 127;

     dd[0]:=(Value shl 8) shr 24;

     dd[1]:=(Value shl 16) shr 24;

     dd[2]:=(Value shl 24) shr 24;

     mantis:=dd[0]/256+dd[1]/256/256+dd[2]/256/256/256;

     result:=i*mantis*exp((e-64)*ln(16));
 

end;

end.
