unit UProfileData;

interface
uses System.SysUtils,System.Classes,Generics.Collections,Generics.Defaults,UCDPoint,UTSegY;
type

TProfileData = class
  CDPoints:TObjectList<TCDPoint>;
  Name_ProFile:String;
  FcountCDP:Cardinal;
  constructor Create(Name_ProFile:String);
  destructor Destroy;
  function WriteTextCDPoints():TStringList;
end;

TDataFile = class
  profiles:TObjectList<TProfileData>;
  constructor Create();
  destructor Destroy();
  procedure read(TextFileName:String;indexProf,indexCDP,index_X,index_Y:Byte);
end;

implementation

{ TProfileData }

constructor TProfileData.Create(Name_ProFile:String);

  begin
    CDPoints:=TObjectList<TCDPoint>.Create;
    self.Name_Profile:=Name_Profile;

  end;

destructor TProfileData.Destroy;

  begin
    CDPoints.Free;

  end;

function TProfileData.WriteTextCDPoints():TStringList;
var
i:Integer;
begin
  result:=TStringList.Create;
  for I := 0 to pred(CDPoints.Count) do
    begin
      result.Add(CDPoints[i].transformString);

    end;
end;

{ TDataFile }

constructor TDataFile.Create;

  begin
    profiles:=TObjectList<TProfileData>.Create;

  end;

destructor TDataFile.Destroy;

  begin
    profiles.Free;

  end;

procedure TDataFile.read(TextFileName: String;indexProf,indexCDP,index_X,index_Y:Byte);
var
tf:TStringList;
i:Cardinal;
bufTF:TStringList;
Name_buf:String;
countProfiles:Cardinal;
  begin
    FormatSettings.DecimalSeparator := '.';
    countProfiles:=0;
    Name_buf:='undefined';
    tf:=TStringList.Create;
    bufTF:=TStringList.Create();
    try
    tf.LoadFromFile(TextFileName);
      for I := 1 to pred(tf.Count) do begin
      bufTf.Clear;
        if not Tf[i].IsEmpty then begin
          ExtractStrings([#9],[' '],PChar(Tf[i]),bufTF);
          if not Name_buf.Equals(bufTF[indexProf]) then begin
            profiles.Add(TProfileData.Create(bufTF[indexProf]));
            Name_buf:=bufTF[indexProf];
            inc(countProfiles);
          end;
          bufTF[index_X]:=stringReplace(bufTF[index_X],',','.',[]);
          bufTF[index_Y]:=stringReplace(bufTF[index_Y],',','.',[]);
          profiles[countprofiles-1].CDPoints.Add(TCDPoint.Create(trunc(bufTF[indexCDP].ToDouble),
                                                 bufTF[index_X].ToDouble,
                                                 bufTF[index_Y].ToDouble));
        end;
      end;
    finally
      tf.Free;
      bufTF.Free;
    end;
  end;

end.
