unit UI_ESegYCoordinates;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UCDPoint,Generics.Collections,Generics.Defaults,
  FMX.Controls.Presentation, FMX.StdCtrls,UProfileData,FMX.Layouts,FMX.ListBox,Format,
  FMX.Edit,UTSegY, UCoordinateImportExport,UTWordsDictionary,UImportFormModal,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  FMX.TabControl, FMX.Ani ;

type

  TForm1 = class(TForm)
    Open1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btExportCoord: TButton;
    btOpen: TButton;
    dgSave1: TSaveDialog;
    btImportCoord: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edCoord_X: TEdit;
    Label4: TLabel;
    edNum_CDP: TEdit;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    Label5: TLabel;
    btOpenTXT: TButton;
    Label3: TLabel;
    edDelitel: TEdit;
    edNTrace: TEdit;
    Label6: TLabel;
    pPaint: TPanel;
    TabControl1: TTabControl;
    TabLB: TTabItem;
    TabTraceHeader: TTabItem;
    LB1: TListBox;
    edExt: TEdit;
    Label7: TLabel;
    GridWord: TStringGrid;
    CheckColumn1: TCheckColumn;
    StrWord: TStringColumn;
    DiscriptionWord: TStringColumn;
    Panel4: TPanel;
    Panel5: TPanel;

    procedure btOpenClick(Sender: TObject);
    procedure btOpenTXTClick(Sender: TObject);
    procedure btExportCoordClick(Sender: TObject);
    procedure btImportCoordClick(Sender: TObject);
    procedure LB1ItemClick(const Sender: TCustomListBox;const Item: TListBoxItem);
    procedure GridWordHeaderClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

    FCoordinator:TCoordinator;

  public
    { Public declarations }

    function exportSegYCoordinates2(File_NAme:String):TStringList;
    procedure Myproc(StringList:TStringList);
    function getWordsTrue():TArray<String>;
    function getMultiplier():Double;
    procedure createArrayXY();
    procedure fillGrid();

//    setters

//    properties
end;

var
  Form1: TForm1;
//  ImportFormModal:TImportFormModal;
  ClickGridHeader:ShortInt = -1;
  arrX:TArray<Double>;
  arrY:TArray<Double>;
  discriptionArrayWords:array of String = ['Порядковый номер трассы внутри профиля',
  'Порядковый номер трассы внутри диска','Номер сейсмограммы','Номер трассы в исходной сейсмограмме',
  'Номер возбуждения на одной точке','Номер ОГТ','Номер трассы в ОГТ','Код трассы:1-сейсмическая',
  'Количество накоплений','Количество горизонтальных накоплений','1-производство; 2-тест','Удаление',
  'Высота приемников','Высота источника','Глубина взрывной скважины','Уровень приведения для приемников',
  'Уровень приведени для источника','Глубина водного слоя для источника','Глубина водного слоя для приемника',
  'Скаляр для высот и глубин','Скаляр для координат','Координата X источника','Координата Y источника',
  'Координата X приемника','Координата Y приемника','1-длина; 2-секунды дуги','V0','Vz',
  'Поправка времени за заглубление источника','Поправка времени за заглубление приемника',
  'Статическая поправка источника','Статическая поправка источника','Суммарная статическая поправка',
  'Временная задержка А','Временная задержка В','Отметка момента','Время начального мьютинга',
  'Время конечного мьютинга','Количество дискретов','Шаг дискретизации в мксек','Тип усиления','Константа усиления',
  'Усиление регистрации','1-корреляция выполнена; 2-нет','Начальная частота свипа','Конечная частота свипа',
  'Длина свипа в млсек','Тип свипа:1-линейный; 2-параболический;3-экспотенциальный','Длина начального конуса свипа, млсек',
  'Длина конечного конуса свипа, млсек','Тип конуса: 1-линейный;2-cos^2','Частота антиаляйсингового фильтра',
  'Крутизна антиаляйсингового фильтра','Частота режекторного фильтра','Крутизна режекторного фильтра',
  'Нижняя частота среза','Верхняя частота среза','Крутизна нижнего среза','Крутизна верхнего среза','Год','День',
  'Час','Минута','Секунда','Код времени: 1-локальное;2-GMT','Весовой фактор','Номер сейсмоприемников',
  'Первый номер приемника в сейсмограмма','Последний номер приемника в сейсмограмма','Число неработающих приемников',
  'Число мнимых каналов','Координата X ОГТ','Координата Y ОГТ','Номер inLine','Номер xLine','Номер источника',
  'Скаляр источника'];
  stringArrayWords:TArray<String> = ['IndexProfileTracesNum','IndexTapeTracesNum','FFID','FieldTraceNum',
      'S_Energy','CDPNum','CDPTraceNum','TraceID','TraceAcquisitionNum','HorStackedTraceNum','DataType',
      'Offset','Altitude_RP','Altitude_SP','Deep_SP','Datum_RP','Datum_SP','Deep_Water_SP','Deep_Water_RP',
      'Scale_Altitude','Scale_Position','X_S','Y_S','X_R','Y_R','TraceMeasurementSystem','V0','Vz','TauDeepS',
      'TauDeepR','StatS','StatR','FullApplyStat','TauTape','TauSourse','OM','MuteB','MuteE','Samples','SampleStep',
      'GainType','GainConst','DpB','isCorr','TraceInitialFreq','TraceEndFreq','TraceSweepLength','TraceSweepCode',
      'TraceSweepInitTaperLength','TraceSweepEndTaperLength','TraceTaperType','F_AntiAlaising','dB_AntiAlaising',
      'F_Reject','dB_Reject','Fb_cliff','Fe_cliff','dB_Fb','dB_Fe','Year','Day','Hour','Minute','Sec','TimeCode',
      'WeightFactor','NR_rollSwitch','NR_firstTrace','NR_lastTrace','NMissRP','NiCh','X_C','Y_C','inLine_no',
      'xLine_no','S_LOC','S_Scale'];


implementation

{$R *.fmx}

procedure TForm1.btImportCoordClick(Sender: TObject);
var
tf:TStringList;
i:Cardinal;
ext:String;
begin
ext:=extractfileext(lb1.Items[0]);
  if not ((ext.Equals('.txt')) or  (ext.Equals('.dat')) or (ext.Equals('.DAT'))) then begin
    showMessage('Неверный тип данных');
    exit;
  end;
  if path='' then begin
  showmessage('Необходимо указать путь к разрезу! Используйте кнопку "Открыть текст"');
  exit;
  end;

  for I := 0 to pred(lb1.Count) do begin
    try
    tf:=TStringList.Create();
    tf.LoadFromFile(lb1.Items[I]);
      try
        myProc(tf);
      except;
        showmessage('Работа была прервана!');
        exit;
      end;
    finally
    progressbar1.Value:=0;
    tf.Free;
    end;
  showmessage('Работа окончена!');
  end;

end;

procedure TForm1.btOpenClick(Sender: TObject);
var
bufSL:TStringList;
begin
  try
    bufSL:=TStringList.Create();
      if open1.Execute then begin
        bufSL.AddStrings(open1.Files);
        FCoordinator.setArraySegYNames(bufSL);
        lb1.Items:=open1.Files;
      end else exit;
  finally
    bufSL.Free;
  end;
end;

procedure TForm1.btOpenTXTClick(Sender: TObject);
begin
  ImportFormModal.showModal();
end;

procedure TForm1.btExportCoordClick(Sender: TObject);
var
ext:String;
begin

ext:=extractfileext(lb1.Items[0]);
  if not ((ext.Equals('.sgy')) or (ext.Equals('.seg')) or (ext.Equals('.segy'))) then begin
    showMessage('Неверный тип данных');
    exit;
  end;
    try
      if dgSave1.Execute then
          FCoordinator.setSaveName(dgSave1.FileName);
          FCoordinator.setGridWordStatusTrue(getWordsTrue);
          FCoordinator.setMultiplier(getMultiplier);
          FCoordinator.extractCoordinatesToFile;
    except
      showmessage('Работа была прервана!');
      exit;
    end;
    showmessage('Работа окончена!');
end;

function TForm1.exportSegYCoordinates2(File_NAme:String):TStringList;
{var
rf:TFileStream;
NRealTraces:Cardinal;
NSamples:Word;
NCDP:LongWord;
Trace_Num:LongWord;
ScalePosition:Double;
readScalePosition:SmallInt;
readCoordX,readCoordY:LongInt;
CoordX, CoordY:Double;
i:Cardinal; }
begin
{FormatSettings.DecimalSeparator:='.';
   result:=TStringList.Create();

      try
        rf:=TFileStream.Create(File_NAme,fmOpenRead);
        rf.Seek(3220,sofromBeginning);
        rf.ReadBuffer(NSamples,NSamples.Size);
        NSamples:=swapW(NSamples);
        NRealTraces:=trunc((rf.Size-3600)/(240+4*NSamples));
        rf.Seek(3600,sofromBeginning);
          for I := 0 to pred(NrealTraces) do begin
          rf.Seek(edNTrace.Text.ToInteger-1,soFromCurrent);
          rf.ReadBuffer(Trace_Num,Trace_Num.Size);
          Trace_Num:=SwapW(Trace_Num);
          rf.Seek(edNum_CDP.Text.ToInteger-(edNTrace.Text.ToInteger+4),sofromCurrent);//-1 и -4 которые мы считали для номера трассы
          rf.ReadBuffer(NCDP,NCDP.Size);
          NCDP:=swapW(NCDP);
          rf.Seek(70-(edNum_CDP.Text.ToInteger+3),sofromCurrent);              //кол-во байт между позицией после чтения CDP и множителем координат
          rf.ReadBuffer(readScalePosition,readScalePosition.Size);
          readScalePosition:=swapW(readScalePosition);
          if readScalePosition<0 then ScalePosition:=abs(1/readScalePosition);
          if readScalePosition>0 then ScalePosition:=readScalePosition;
          if readScalePosition=0 then ScalePosition:=1;
          rf.Seek(edCoord_X.Text.ToInteger-1-72,sofromCurrent);
          rf.ReadBuffer(readCoordX,readCoordX.Size);
          rf.ReadBuffer(readCoordY,readCoordY.Size);
          if edDelitel.Text.ToInteger=0 then begin
            CoordX:=swapW(readCoordX)*ScalePosition;
            CoordY:=swapW(readCoordY)*ScalePosition;
          end else begin
            if edDelitel.Text.ToInteger<0 then ScalePosition:=abs(1/edDelitel.Text.ToInteger);
            if edDelitel.Text.ToInteger>0 then ScalePosition:=edDelitel.Text.ToInteger;
            CoordX:=swapW(readCoordX)*ScalePosition;
            CoordY:=swapW(readCoordY)*ScalePosition;
          end;
          rf.Seek(240-(edCoord_X.Text.ToInteger+7)+4*Nsamples,sofromCurrent);
          result.Add(changeFileExt(extractfilename(File_Name),'')+#9+Trace_Num.ToString+#9+NCDP.ToString+#9+CoordX.ToString+#9+CoordY.ToString);
          end;
      finally
      rf.Free;
      end; }
end;

procedure TForm1.fillGrid();
var
i:Cardinal;
WordsDictionary:TWordsDictionary;
segy:TSegY;
begin
GridWord.RowCount:=77;
  try
  segy:=TSegY.Create(FCoordinator.arraySegYNames[FCoordinator.ActualNumberSegY]);
  segy.readSegY;
    try
    WordsDictionary:=TWordsDictionary.Create(segy.TracesSegy[0],1);
    WordsDictionary.designWords;
      for i := 0 to pred(WordsDictionary.Words.count) do begin
        Application.ProcessMessages();
        GridWord.Cells[0,i]:='false';
        GridWord.Cells[1,i]:=WordsDictionary.Words[StringArrayWords[i]].ToString;
        GridWord.Cells[2,i]:=discriptionArrayWords[i];
      end;
    finally
      WordsDictionary.Free;
    end;
  finally
  segy.Free;
  end;
end;

 procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCoordinator.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
FCoordinator:=TCoordinator.Create();
end;

procedure TForm1.GridWordHeaderClick(Column: TColumn);
var
i:integer;
begin
ClickGridHeader:=(-1)*ClickGridHeader;
  for I := 0 to High(stringArrayWords) do begin
    if ClickGridHeader = 1 then
      GridWord.Cells[0,i]:='true' else
      GridWord.Cells[0,i]:='false';
  end;
end;

procedure TForm1.createArrayXY;
var
i,j,countX,countY:integer;
sgy:TSegY;
begin
{  countX:=0;
  countY:=0;
  for I := 0 to pred(lb1.Count) do begin
    try
    sgy:=TSegY.Create(lb1.Items[i]);
      for j:= 0 to pred(sgy.ListTraces.Count) do begin
        setLength(arrX,length(arrX)+1);
        setLength(arrY,length(arrX)+1);
        arrX[countX]:=sgy.ListTraces[j].x_s;
        arrY[countY]:=sgy.ListTraces[j].y_s;
        inc(countX);
        inc(countY);
      end;
    finally
      sgy.Free;
    end;
  end;  }
end;

procedure TForm1.LB1ItemClick(const Sender: TCustomListBox;const Item: TListBoxItem);
begin
  FCoordinator.setActualNumberSegY(lb1.ItemIndex);
  fillGrid();
end;

procedure TForm1.Myproc(StringList: TStringList);
{var
NRealTraces:Cardinal;
NSamples:Word;
NCDP:LongWord;
ScalePosition:Double;
readScalePosition:SmallInt;
CoordX,CoordY:LongInt;
Trace_Num:Cardinal;
i,j:Cardinal;
profiles:TArray<TProfileData>;
bufString:TStringList;
f:TFileStream;
Name_buf:String;
countProfiles:Cardinal;}
begin
{FormatSettings.DecimalSeparator := '.';
countProfiles:=0;
Name_buf:='undefined';
  try
    bufString:=TStringList.Create();
    for I := 1 to pred(StringList.Count) do begin
      bufString.Clear;
      ExtractStrings([#9],[' '],PChar(StringList[i]),bufString);
      if not Name_buf.Equals(bufString[0]) then begin
      setLength(profiles,length(profiles)+1);
      profiles[countProfiles]:=TProfileData.Create;
      profiles[countProfiles].Name_Profile:=bufString[0]+edExt.Text;
      Name_Buf:=bufString[0];
      inc(countProfiles);
      end;

//      profiles[high(profiles)].CDPoints.Add(TCDPoint.Create({bufString[0],trunc(bufString[1].ToDouble),bufString[2].ToInteger,
//                          bufString[2].ToDouble,bufString[3].ToDouble));
    end;
  finally
  bufString.Free;
  end;                                                                 }

 {   for i := Low(profiles) to High(profiles) do begin
//      profiles[i].CDPoints   //TODO на всякий случай сортировка cdp по номеру трасы
      try
      f:=TFileStream.Create(path+profiles[i].Name_Profile,fmOpenReadWrite,fmShareCompat);
//      showmessage(path+profiles[i].Name_Profile);
      f.Seek(3220,sofromBeginning);
      f.ReadBuffer(NSamples,NSamples.Size);
      NSamples:=swapW(NSamples);
      NRealTraces:=trunc((f.Size-3600)/(240+4*NSamples));
      f.Seek(3600,sofromBeginning);
        if profiles[i].CDPoints.Count<>NrealTraces then begin
        showmessage('Количество трас файла '+profiles[i].Name_Profile+' не соответствует количеству трас в SegY');
        profiles[i].Free;
        exit;
        end;
          for j := 0 to pred(NrealTraces) do begin
            f.Seek(edNTrace.Text.ToInteger-1,soFromCurrent);
            f.ReadBuffer(Trace_Num,Trace_Num.Size);
            {Trace_Num:=SwapW(Trace_Num);
            if Trace_Num<>profiles[i].CDPoints[j].Num_Trace then begin
              showMessage('Порядковый номер трассы профиля '+profiles[i].Name_Profile+' не соответствует порядковому номеру трасы в SegY');
              profiles[i].Free;
              exit;
            end;  }

  {        f.Seek(edNum_CDP.Text.ToInteger-(edNTrace.Text.ToInteger+4),sofromCurrent);
          f.ReadBuffer(NCDP,sizeof(NCDP));
          NCDP:=swapW(NCDP);
//            if NCDP<>profiles[i].CDPoints[j].Num_CDP then begin
//              showMessage('Номер CDP профиля '+profiles[i].Name_Profile+' не соответствует номеру CDP в SegY');//TODO сделать проц проверки
//              profiles[i].Free;
//              exit;
//            end;
//          f.Seek(70-(edNum_CDP.Text.ToInteger+3),sofromCurrent);
//
//            if edDelitel.Text.ToInteger=0 then begin
//              f.ReadBuffer(readScalePosition,readScalePosition.Size);
//              readScalePosition:=swapW(readScalePosition);
//              if readScalePosition>0 then ScalePosition:=1/readScalePosition;
//              if readScalePosition<0 then ScalePosition:=abs(readScalePosition);
//              if readScalePosition=0 then ScalePosition:=1;
//              CoordX:=trunc(profiles[i].CDPoints[j].Coord_X*ScalePosition);
//              CoordX:=swapW(CoordX);
//              CoordY:=trunc(profiles[i].CDPoints[j].Coord_Y*ScalePosition);
//              CoordY:=swapW(CoordY);
//              f.Seek(edCoord_X.Text.ToInteger-1-72,sofromCurrent);
//              f.WriteBuffer(CoordX,CoordX.Size);
//              f.WriteBuffer(CoordY,CoordY.Size);
//            end else begin
//              if edDelitel.Text.ToInteger>0 then ScalePosition:=1/edDelitel.Text.ToInteger;
//              if edDelitel.Text.ToInteger<0 then ScalePosition:=abs(edDelitel.Text.ToInteger);
//              readScalePosition:=edDelitel.Text.ToInteger();
//              readScalePosition:=swapW(readScalePosition);
//              f.WriteBuffer(readScalePosition,readScalePosition.Size);
//              CoordX:=trunc(profiles[i].CDPoints[j].Coord_X*ScalePosition);
//              CoordX:=swapW(CoordX);
//              CoordY:=trunc(profiles[i].CDPoints[j].Coord_Y*ScalePosition);
//              CoordY:=swapW(CoordY);
              f.Seek(edCoord_X.Text.ToInteger-1-72,sofromCurrent);
              f.WriteBuffer(CoordX,CoordX.Size);
              f.WriteBuffer(CoordY,CoordY.Size);
            end;
          f.Seek(240-(edCoord_X.Text.ToInteger+7)+4*Nsamples,sofromCurrent);
//          end;
      finally
        f.Free;
        profiles[i].Free;
      end;
    end;}
end;

function TForm1.getMultiplier: Double;
var
multiplier:Double;
begin
  multiplier:=gridWord.Cells[1,20].ToDouble;
  if (multiplier=0) then multiplier:=1;
  if (multiplier<0) then multiplier:=abs(1/multiplier);
  result:=multiplier;
end;

function TForm1.getWordsTrue():TArray<String>;
var
i:Cardinal;
begin
  for i := low(StringArrayWords) to high (StringArrayWords) do begin
    if (GridWord.Cells[0,i] = 'false') then continue
    else begin
    setLength(result,length(result)+1);
    result[high(result)]:=StringArrayWords[i];
    end;
  end;
end;

end.
