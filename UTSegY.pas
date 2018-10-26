unit UTSegY;

interface
uses Generics.Collections,Generics.Defaults,UTTraceSegY,System.Classes,System.SysUtils,Format;

type

TGetFunc = function (Index:Cardinal):Int64 of object;

    TH3200 = packed record
      byte:array [1..3200] of Byte;
    end;

    TH400 = packed record
      JobID,NumProfile,NumTape:LongWord;
      NumTraces,NumServiceTraces,SampleStep,FieldSampleStep,Samples,FieldSamples,
      DataFormat,FoldCDP,SortCode,AcquisitionNumber,InitialFreq,
      EndFreq,SweepLength,SweepCode,SweepChanelTraceNumber,SweepInitTaperLength,
      SweepEndTaperLength,TaperType,TraceCorrelationDate,BinaryGain,RecoveryGain,
      MeasurementSystem,SignalImp_CodPolarity,CodPolarity:Word;
      noUsed:array [1..340] of Byte;
    end;

    TSegY = class
      h3200:TH3200;
      h400:TH400;
      fileName:String;
      countRealTraces:Cardinal;
      samples:Word;
      TracesSegy:TObjectList<TTraceSegY>;

    public
      constructor Create(fileName:String);
      destructor Destroy();
      procedure readSegY;
      procedure writeSegY;

    {setters}

      procedure setNumProfile(NumProfile:LongWord);
      procedure setNumTape(NumTape:LongWord);
      procedure setNumTraces(NumTraces:Word);
      procedure setNumServiceTraces(NumServiceTraces:Word);
      procedure setTapeSampleStep(TapeSampleStep:Word);
      procedure setFieldSampleStep(FieldSampleStep:Word);
      procedure setTapeSamples(TapeSamples:Word);
      procedure setFieldSamples(FieldSamples:Word);
      procedure setDataFormat(DataFormat:Word);
      procedure setFoldCDP(FoldCDP:Word);
      procedure setSortCode(SortCode:Word);
      procedure setAcquisitionNumber(AcquisitionNumber:Word);
      procedure setInitialFreq(InitialFreq:Word);
      procedure setEndFreq(EndFreq:Word);
      procedure setSweepLength(SweepLength:Word);
      procedure setSweepCode(SweepCode:Word);
      procedure setSweepChanelTraceNumber(SweepChanelTraceNumber:Word);
      procedure setSweepInitTaperLength(SweepInitTaperLength:Word);
      procedure setSweepEndTaperLength(SweepEndTaperLength:Word);
      procedure setTaperType(TaperType:Word);
      procedure setTraceCorrelationDate(TraceCorrelationDate:Word);
      procedure setBinaryGain(BinaryGain:Word);
      procedure setRecoveryGain(RecoveryGain:Word);
      procedure setMeasurementSystem(MeasurementSystem:Word);

      procedure setIndexProfileTracesNum(Index:Cardinal; IndexProfileTracesNum:LongWord);
      procedure setIndexTapeTracesNum(Index:Cardinal; IndexTapeTracesNum:LongWord);
      procedure setFFID(Index:Cardinal; FFID:LongWord);
      procedure setFieldTraceNum(Index:Cardinal; FieldTraceNum:LongWord);
      procedure setS_Energy(Index:Cardinal; S_Energy:LongWord);
      procedure setCDPNum(Index:Cardinal; CDPNum:LongWord);
      procedure setCDPTraceNum(Index:Cardinal; CDPTraceNum:LongWord);
      procedure setTraceID(Index:Cardinal; TraceID:Word);
      procedure setTraceAcquisitionNum(Index:Cardinal; TraceAcquisitionNum:Word);
      procedure setHorStackedTraceNum(Index:Cardinal; HorStackedTraceNum:Word);
      procedure setDataType(Index:Cardinal; DataType:Word);
      procedure setOffset(Index:Cardinal; Offset:LongInt);
      procedure setAltitude_RP(Index:Cardinal; Altitude_RP:LongInt);
      procedure setAltitude_SP(Index:Cardinal; Altitude_SP:LongInt);
      procedure setDeep_SP(Index:Cardinal; Deep_SP:LongWord);
      procedure setDatum_RP(Index:Cardinal; Datum_RP:LongWord);
      procedure setDatum_SP(Index:Cardinal; Datum_SP:LongWord);
      procedure setDeep_Water_SP(Index:Cardinal; Deep_Water_SP:LongWord);
      procedure setDeep_Water_RP(Index:Cardinal; Deep_Water_RP:LongWord);
      procedure setScale_Altitude(Index:Cardinal; Scale_Altitude:SmallInt);
      procedure setScale_Position(Index:Cardinal; Scale_Position:SmallInt);
      procedure setX_S(Index:Cardinal; X_S:LongInt);
      procedure setY_S(Index:Cardinal; Y_S:LongInt);
      procedure setX_R(Index:Cardinal; X_R:LongInt);
      procedure setY_R(Index:Cardinal; Y_R:LongInt);
      procedure setTraceMeasurementSystem(Index:Cardinal; TraceMeasurementSystem:Word);
      procedure setV0(Index:Cardinal; V0:Word);
      procedure setVz(Index:Cardinal; Vz:Word);
      procedure setTauDeepS(Index:Cardinal; TauDeepS:Word);
      procedure setTauDeepR(Index:Cardinal; TauDeepR:Word);
      procedure setStatS(Index:Cardinal; StatS:SmallInt);
      procedure setStatR(Index:Cardinal; StatR:SmallInt);
      procedure setFullApplyStat(Index:Cardinal; FullApplyStat:SmallInt);
      procedure setTauTape(Index:Cardinal; TauTape:SmallInt);
      procedure setTauSourse(Index:Cardinal; TauSourse:SmallInt);
      procedure setOM(Index:Cardinal; OM:Word);
      procedure setMuteB(Index:Cardinal; MuteB:Word);
      procedure setMuteE(Index:Cardinal; MuteE:Word);
      procedure setSamples(Index:Cardinal; Samples:Word);
      procedure setSampleStep(Index:Cardinal; SampleStep:Word);
      procedure setGainType(Index:Cardinal; GainType:Word);
      procedure setGainConst(Index:Cardinal; GainConst:Word);
      procedure setDpB(Index:Cardinal; DpB:Word);
      procedure setisCorr(Index:Cardinal; isCorr:Word);
      procedure setTraceInitialFreq(Index:Cardinal; TraceInitialFreq:Word);
      procedure setTraceEndFreq(Index:Cardinal; TraceEndFreq:Word);
      procedure setTraceSweepLength(Index:Cardinal; TraceSweepLength:Word);
      procedure setTraceSweepCode(Index:Cardinal; TraceSweepCode:Word);
      procedure setTraceSweepInitTaperLength(Index:Cardinal; TraceSweepInitTaperLength:Word);
      procedure setTraceSweepEndTaperLength(Index:Cardinal; TraceSweepEndTaperLength:Word);
      procedure setTraceTaperType(Index:Cardinal; TraceTaperType:Word);
      procedure setF_AntiAlaising(Index:Cardinal; F_AntiAlaising:Word);
      procedure setDB_AntiAlaising(Index:Cardinal; dB_AntiAlaising:Word);
      procedure setF_Reject(Index:Cardinal; F_Reject:Word);
      procedure setDB_Reject(Index:Cardinal; dB_Reject:Word);
      procedure setFb_cliff(Index:Cardinal; Fb_cliff:Word);
      procedure setFe_cliff(Index:Cardinal; Fe_cliff:Word);
      procedure setDB_Fb(Index:Cardinal; dB_Fb:Word);
      procedure setDB_Fe(Index:Cardinal; dB_Fe:Word);
      procedure setYear(Index:Cardinal; Year:Word);
      procedure setDay(Index:Cardinal; Day:Word);
      procedure setHour(Index:Cardinal; Hour:Word);
      procedure setMinute(Index:Cardinal; Minute:Word);
      procedure setSec(Index:Cardinal; Sec:Word);
      procedure setTimeCode(Index:Cardinal; TimeCode:Word);
      procedure setWeightFactor(Index:Cardinal; WeightFactor:Word);
      procedure setNR_rollSwitch(Index:Cardinal; NR_rollSwitch:Word);
      procedure setNR_firstTrace(Index:Cardinal; NR_firstTrace:Word);
      procedure setNR_lastTrace(Index:Cardinal; NR_lastTrace:Word);
      procedure setNMissRP(Index:Cardinal; NMissRP:Word);
      procedure setNiCh(Index:Cardinal; NiCh:Word);
      procedure setX_C(Index:Cardinal; X_C:LongInt);
      procedure setY_C(Index:Cardinal; Y_C:LongInt);
      procedure setInLine_no(Index:Cardinal; inLine_no:LongWord);
      procedure setXLine_no(Index:Cardinal; xLine_no:LongWord);
      procedure setS_LOC(Index:Cardinal; S_LOC:LongWord);
      procedure setS_Scale(Index:Cardinal; S_Scale:LongWord);
      {getters}
      function getNumProfile():LongWord;
      function getNumTape():LongWord;
      function getNumTraces():Word;
      function getNumServiceTraces():Word;
      function getTapeSampleStep():Word;
      function getFieldSampleStep():Word;
      function getTapeSamples():Word;
      function getFieldSamples():Word;
      function getDataFormat():Word;
      function getFoldCDP():Word;
      function getSortCode():Word;
      function getAcquisitionNumber():Word;
      function getInitialFreq():Word;
      function getEndFreq():Word;
      function getSweepLength():Word;
      function getSweepCode():Word;
      function getSweepChanelTraceNumber():Word;
      function getSweepInitTaperLength():Word;
      function getSweepEndTaperLength():Word;
      function getTaperType():Word;
      function getTraceCorrelationDate():Word;
      function getBinaryGain():Word;
      function getRecoveryGain():Word;
      function getMeasurementSystem():Word;

      function getIndexProfileTracesNum(Index:Cardinal):LongWord;
      function getIndexTapeTracesNum(Index:Cardinal):LongWord;
      function getFFID(Index:Cardinal):LongWord;
      function getFieldTraceNum(Index:Cardinal):LongWord;
      function getS_Energy(Index:Cardinal):LongWord;
      function getCDPNum(Index:Cardinal):LongWord;
      function getCDPTraceNum(Index:Cardinal):LongWord;
      function getTraceID(Index:Cardinal):Word;
      function getTraceAcquisitionNum(Index:Cardinal):Word;
      function getHorStackedTraceNum(Index:Cardinal):Word;
      function getDataType(Index:Cardinal):Word;
      function getOffset(Index:Cardinal):LongInt;
      function getAltitude_RP(Index:Cardinal):LongInt;
      function getAltitude_SP(Index:Cardinal):LongInt;
      function getDeep_SP(Index:Cardinal):LongWord;
      function getDatum_RP(Index:Cardinal):LongWord;
      function getDatum_SP(Index:Cardinal):LongWord;
      function getDeep_Water_SP(Index:Cardinal):LongWord;
      function getDeep_Water_RP(Index:Cardinal):LongWord;
      function getScale_Altitude(Index:Cardinal):SmallInt;
      function getScale_Position(Index:Cardinal):SmallInt;
      function getX_S(Index:Cardinal):LongInt;
      function getY_S(Index:Cardinal):LongInt;
      function getX_R(Index:Cardinal):LongInt;
      function getY_R(Index:Cardinal):LongInt;
      function getTraceMeasurementSystem(Index:Cardinal):Word;
      function getV0(Index:Cardinal):Word;
      function getVz(Index:Cardinal):Word;
      function getTauDeepS(Index:Cardinal):Word;
      function getTauDeepR(Index:Cardinal):Word;
      function getStatS(Index:Cardinal):SmallInt;
      function getStatR(Index:Cardinal):SmallInt;
      function getFullApplyStat(Index:Cardinal):SmallInt;
      function getTauTape(Index:Cardinal):SmallInt;
      function getTauSourse(Index:Cardinal):SmallInt;
      function getOM(Index:Cardinal):Word;
      function getMuteB(Index:Cardinal):Word;
      function getMuteE(Index:Cardinal):Word;
      function getSamples(Index:Cardinal):Word;
      function getSampleStep(Index:Cardinal):Word;
      function getGainType(Index:Cardinal):Word;
      function getGainConst(Index:Cardinal):Word;
      function getDpB(Index:Cardinal):Word;
      function getisCorr(Index:Cardinal):Word;
      function getTraceInitialFreq(Index:Cardinal):Word;
      function getTraceEndFreq(Index:Cardinal):Word;
      function getTraceSweepLength(Index:Cardinal):Word;
      function getTraceSweepCode(Index:Cardinal):Word;
      function getTraceSweepInitTaperLength(Index:Cardinal):Word;
      function getTraceSweepEndTaperLength(Index:Cardinal):Word;
      function getTraceTaperType(Index:Cardinal):Word;
      function getF_AntiAlaising(Index:Cardinal):Word;
      function getDB_AntiAlaising(Index:Cardinal):Word;
      function getF_Reject(Index:Cardinal):Word;
      function getDB_Reject(Index:Cardinal):Word;
      function getFb_cliff(Index:Cardinal):Word;
      function getFe_cliff(Index:Cardinal):Word;
      function getDB_Fb(Index:Cardinal):Word;
      function getDB_Fe(Index:Cardinal):Word;
      function getYear(Index:Cardinal):Word;
      function getDay(Index:Cardinal):Word;
      function getHour(Index:Cardinal):Word;
      function getMinute(Index:Cardinal):Word;
      function getSec(Index:Cardinal):Word;
      function getTimeCode(Index:Cardinal):Word;
      function getWeightFactor(Index:Cardinal):Word;
      function getNR_rollSwitch(Index:Cardinal):Word;
      function getNR_firstTrace(Index:Cardinal):Word;
      function getNR_lastTrace(Index:Cardinal):Word;
      function getNMissRP(Index:Cardinal):Word;
      function getNiCh(Index:Cardinal):Word;
      function getX_C(Index:Cardinal):LongInt;
      function getY_C(Index:Cardinal):LongInt;
      function getInLine_no(Index:Cardinal):LongWord;
      function getXLine_no(Index:Cardinal):LongWord;
      function getS_LOC(Index:Cardinal):LongWord;
      function getS_Scale(Index:Cardinal):LongWord;

    end;

implementation

{ TSegY }

constructor TSegY.Create(fileName:String);
begin
  TracesSegY:=TObjectList<TTraceSegY>.Create();
  self.fileName:=fileName;
end;

procedure TSegY.readSegY;
var
segFile:TFileStream;
bufH240:TH240;
bufData:TArrS;
i:Cardinal;
begin
  try
      segFile:=TFileStream.Create(self.fileName,fmOpenRead);
      segFile.ReadBuffer(h3200,sizeof(h3200));
      segFile.ReadBuffer(h400, sizeof(h400 ));
      samples:=SwapW(h400.Samples);
      countRealTraces:=trunc((segFile.Size-3600) / (240+4*samples));
      for i := 0 to pred(countRealTraces) do begin
          segFile.ReadBuffer(bufH240,sizeof(bufH240));
          setLength(bufData,samples);
          segFile.ReadBuffer(bufData[0],sizeof(bufData)*samples);
          TracesSegy.Add(TTraceSegY.Create);
          TracesSegy[i].readTrace(bufH240,bufData);
      end;
  finally
    segFile.Free;
  end;
end;

destructor TSegY.Destroy;
begin
TracesSegY.Free;
end;

function TSegY.getTraceAcquisitionNum (Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceAcquisitionNum;
end;

function TSegY.getAcquisitionNumber(): Word;
begin
  result:=swapW(h400.AcquisitionNumber);
end;

function TSegY.getAltitude_RP(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getAltitude_RP;
end;

function TSegY.getAltitude_SP(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getAltitude_SP;
end;

function TSegY.getBinaryGain(): Word;
begin
  result:=swapW(h400.BinaryGain);
end;

function TSegY.getCDPNum(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getCDPNum;
end;

function TSegY.getCDPTraceNum(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getCDPTraceNum;
end;

function TSegY.getDataFormat(): Word;
begin
  result:=swapW(h400.DataFormat);
end;

function TSegY.getDataType(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getDataType;
end;

function TSegY.getDatum_RP(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getDatum_RP;
end;

function TSegY.getDatum_SP(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getDatum_SP;
end;

function TSegY.getDay(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getDay;
end;

function TSegY.getDB_AntiAlaising(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getDB_AntiAlaising;
end;

function TSegY.getDB_Fb(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getDB_Fb;
end;

function TSegY.getDB_Fe(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getDB_Fe;
end;

function TSegY.getDB_Reject(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getDB_Reject;
end;

function TSegY.getDeep_SP(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getDeep_SP;
end;

function TSegY.getDeep_Water_RP(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getDeep_Water_RP;
end;

function TSegY.getDeep_Water_SP(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getDeep_Water_SP;
end;

function TSegY.getDpB(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getDpB;
end;

function TSegY.getEndFreq(): Word;
begin
  result:=swapW(h400.EndFreq);
end;

function TSegY.getFoldCDP(): Word;
begin
  result:=swapW(h400.FoldCDP);
end;

function TSegY.getFullApplyStat(Index:Cardinal): SmallInt;
begin
  result:=TracesSegy[Index].getFullApplyStat;
end;

function TSegY.getF_AntiAlaising(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getF_AntiAlaising;
end;

function TSegY.getF_Reject(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getF_Reject;
end;

function TSegY.getGainConst(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getGainConst;
end;

function TSegY.getGainType(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getGainType;
end;

function TSegY.getHorStackedTraceNum(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getHorStackedTraceNum;
end;

function TSegY.getHour(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getHour;
end;

function TSegY.getIndexProfileTracesNum(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getIndexProfileTracesNum;
end;

function TSegY.getIndexTapeTracesNum(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getIndexTapeTracesNum;
end;

function TSegY.getInitialFreq(): Word;
begin
  result:=swapW(h400.InitialFreq);
end;

function TSegY.getInLine_no(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getInLine_no;
end;

function TSegY.getisCorr(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getisCorr;
end;

function TSegY.getMeasurementSystem(): Word;
begin
  result:=swapW(h400.MeasurementSystem);
end;

function TSegY.getMinute(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getMinute;
end;

function TSegY.getMuteB(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getMuteB;
end;

function TSegY.getMuteE(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getMuteE;
end;

function TSegY.getNiCh(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getNiCh;
end;

function TSegY.getNMissRP(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getNMissRP;
end;

function TSegY.getNR_lastTrace(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getNR_lastTrace;
end;

function TSegY.getNR_rollSwitch(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getNR_rollSwitch;
end;

function TSegY.getNumProfile(): LongWord;
begin
  result:=swapW(h400.NumProfile);
end;

function TSegY.getNumServiceTraces(): Word;
begin
  result:=swapW(h400.NumServiceTraces);
end;

function TSegY.getNumTape(): LongWord;
begin
  result:=swapW(h400.NumTape);
end;

function TSegY.getNumTraces(): Word;
begin
  result:=swapW(h400.NumTraces);
end;

function TSegY.getFb_cliff(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getFb_cliff;
end;

function TSegY.getFe_cliff(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getFe_cliff;
end;

function TSegY.getFFID(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getFFID;
end;

function TSegY.getOffset(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getOffset;
end;

function TSegY.getOM(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getOM;
end;

function TSegY.getFieldSamples(): Word;
begin
  result:=swapW(h400.FieldSamples);
end;

function TSegY.getFieldSampleStep(): Word;
begin
  result:=swapW(h400.FieldSampleStep);
end;

function TSegY.getFieldTraceNum(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getFieldTraceNum;
end;

function TSegY.getRecoveryGain(): Word;
begin
  result:=swapW(h400.RecoveryGain);
end;

function TSegY.getNR_firstTrace(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getNR_firstTrace;
end;

function TSegY.getSamples(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getSamples;
end;

function TSegY.getSampleStep(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getSampleStep;
end;

function TSegY.getScale_Altitude(Index:Cardinal): SmallInt;
begin
  result:=TracesSegy[Index].getScale_Altitude;
end;

function TSegY.getScale_Position(Index:Cardinal): SmallInt;
begin
  result:=TracesSegy[Index].getScale_Position;
end;

function TSegY.getSec(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getSec;
end;

function TSegY.getSortCode(): Word;
begin
  result:=swapW(h400.SortCode);
end;

function TSegY.getStatR(Index:Cardinal): SmallInt;
begin
  result:=TracesSegy[Index].getStatR;
end;

function TSegY.getStatS(Index:Cardinal): SmallInt;
begin
  result:=TracesSegy[Index].getStatS;
end;

function TSegY.getSweepChanelTraceNumber(): Word;
begin
  result:=swapW(h400.SweepChanelTraceNumber);
end;

function TSegY.getSweepCode(): Word;
begin
  result:=swapW(h400.SweepCode);
end;

function TSegY.getSweepEndTaperLength(): Word;
begin
  result:=swapW(h400.SweepEndTaperLength);
end;

function TSegY.getSweepInitTaperLength(): Word;
begin
  result:=swapW(h400.SweepInitTaperLength);
end;

function TSegY.getSweepLength(): Word;
begin
  result:=swapW(h400.SweepLength);
end;

function TSegY.getS_Energy(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getS_Energy;
end;

function TSegY.getS_LOC(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getS_LOC;
end;

function TSegY.getS_Scale(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getS_Scale;
end;

function TSegY.getTaperType(): Word;
begin
  result:=swapW(h400.TaperType);
end;

function TSegY.getTapeSamples(): Word;
begin
  result:=swapW(h400.Samples);
end;

function TSegY.getTapeSampleStep(): Word;
begin
  result:=swapW(h400.SampleStep);
end;

function TSegY.getTauDeepR(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTauDeepR;
end;

function TSegY.getTauDeepS(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTauDeepS;
end;

function TSegY.getTauSourse(Index:Cardinal): SmallInt;
begin
  result:=TracesSegy[Index].getTauSourse;
end;

function TSegY.getTauTape(Index:Cardinal): SmallInt;
begin
  result:=TracesSegy[Index].getTauTape;
end;

function TSegY.getTimeCode(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTimeCode;
end;

function TSegY.getTraceCorrelationDate(): Word;
begin
  result:=swapW(h400.TraceCorrelationDate);
end;

function TSegY.getTraceEndFreq(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceEndFreq;
end;

function TSegY.getTraceID(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceID;
end;

function TSegY.getTraceInitialFreq(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceInitialFreq;
end;

function TSegY.getTraceMeasurementSystem(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceMeasurementSystem;
end;

function TSegY.getTraceSweepCode(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceSweepCode;
end;

function TSegY.getTraceSweepEndTaperLength(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceSweepEndTaperLength;
end;

function TSegY.getTraceSweepInitTaperLength(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceSweepInitTaperLength;
end;

function TSegY.getTraceSweepLength(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceSweepLength;
end;

function TSegY.getTraceTaperType(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getTraceTaperType;
end;

function TSegY.getV0(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getV0;
end;

function TSegY.getVz(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getVz;
end;

function TSegY.getWeightFactor(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getWeightFactor;
end;

function TSegY.getXLine_no(Index:Cardinal): LongWord;
begin
  result:=TracesSegy[Index].getXLine_no;
end;

function TSegY.getX_C(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getX_C;
end;

function TSegY.getX_R(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getX_R;
end;

function TSegY.getX_S(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getX_S;
end;

function TSegY.getYear(Index:Cardinal): Word;
begin
  result:=TracesSegy[Index].getYear;
end;

function TSegY.getY_C(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getY_C;
end;

function TSegY.getY_R(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getY_R;
end;

function TSegY.getY_S(Index:Cardinal): LongInt;
begin
  result:=TracesSegy[Index].getY_S;
end;

procedure TSegY.setTraceAcquisitionNum(Index:Cardinal; TraceAcquisitionNum: Word);
begin
  TracesSegY[Index].setTraceAcquisitionNum(TraceAcquisitionNum);
end;

procedure TSegY.setAcquisitionNumber(AcquisitionNumber: Word);
begin
  h400.AcquisitionNumber:=swapW(AcquisitionNumber);
end;

procedure TSegY.setAltitude_RP(Index:Cardinal; Altitude_RP: LongInt);
begin
  TracesSegY[Index].setAltitude_RP(Altitude_RP);
end;

procedure TSegY.setAltitude_SP(Index:Cardinal; Altitude_SP: LongInt);
begin
  TracesSegY[Index].setAltitude_SP(Altitude_SP);
end;

procedure TSegY.setBinaryGain(BinaryGain: Word);
begin
  h400.BinaryGain:=swapW(BinaryGain);
end;

procedure TSegY.setCDPNum(Index:Cardinal; CDPNum: LongWord);
begin
  TracesSegY[Index].setCDPNum(CDPNum);
end;

procedure TSegY.setCDPTraceNum(Index:Cardinal; CDPTraceNum: LongWord);
begin
  TracesSegY[Index].setCDPTraceNum(CDPTraceNum);
end;

procedure TSegY.setDataFormat(DataFormat: Word);
begin
  h400.DataFormat:=swapW(DataFormat);
end;

procedure TSegY.setDataType(Index:Cardinal; DataType: Word);
begin
  TracesSegY[Index].setDataType(DataType);
end;

procedure TSegY.setDatum_RP(Index:Cardinal; Datum_RP: LongWord);
begin
  TracesSegY[Index].setDatum_RP(Datum_RP);
end;

procedure TSegY.setDatum_SP(Index:Cardinal; Datum_SP: LongWord);
begin
  TracesSegY[Index].setDatum_SP(Datum_SP);
end;

procedure TSegY.setDay(Index:Cardinal; Day: Word);
begin
  TracesSegY[Index].setDay(Day);
end;

procedure TSegY.setDB_AntiAlaising(Index:Cardinal; dB_AntiAlaising: Word);
begin
  TracesSegY[Index].setDB_AntiAlaising(dB_AntiAlaising);
end;

procedure TSegY.setDB_Fb(Index:Cardinal; dB_Fb: Word);
begin
  TracesSegY[Index].setDB_Fb(dB_Fb);
end;

procedure TSegY.setDB_Fe(Index:Cardinal; dB_Fe: Word);
begin
  TracesSegY[Index].setDB_Fe(dB_Fe);
end;

procedure TSegY.setDB_Reject(Index:Cardinal; dB_Reject: Word);
begin
  TracesSegY[Index].setDB_Reject(dB_Reject);
end;

procedure TSegY.setDeep_SP(Index:Cardinal; Deep_SP: LongWord);
begin
  TracesSegY[Index].setDeep_SP(Deep_SP);
end;

procedure TSegY.setDeep_Water_RP(Index:Cardinal; Deep_Water_RP: LongWord);
begin
  TracesSegY[Index].setDeep_Water_RP(Deep_Water_RP);
end;

procedure TSegY.setDeep_Water_SP(Index:Cardinal; Deep_Water_SP: LongWord);
begin
  TracesSegY[Index].setDeep_Water_SP(Deep_Water_SP);
end;

procedure TSegY.setDpB(Index:Cardinal; DpB: Word);
begin
  TracesSegY[Index].setDpB(DpB);
end;

procedure TSegY.setEndFreq(EndFreq: Word);
begin
  h400.EndFreq:=swapW(EndFreq);
end;

procedure TSegY.setFoldCDP(FoldCDP: Word);
begin
  h400.FoldCDP:=swapW(FoldCDP);
end;

procedure TSegY.setFullApplyStat(Index:Cardinal; FullApplyStat: SmallInt);
begin
  TracesSegY[Index].setFullApplyStat(FullApplyStat);
end;

procedure TSegY.setF_AntiAlaising(Index:Cardinal; F_AntiAlaising: Word);
begin
  TracesSegY[Index].setF_AntiAlaising(F_AntiAlaising);
end;

procedure TSegY.setF_Reject(Index:Cardinal; F_Reject: Word);
begin
  TracesSegY[Index].setF_Reject(F_Reject);
end;

procedure TSegY.setGainConst(Index:Cardinal; GainConst: Word);
begin
  TracesSegY[Index].setGainConst(GainConst);
end;

procedure TSegY.setGainType(Index:Cardinal; GainType: Word);
begin
  TracesSegY[Index].setGainType(GainType);
end;

procedure TSegY.setHorStackedTraceNum(Index:Cardinal; HorStackedTraceNum: Word);
begin
  TracesSegY[Index].setHorStackedTraceNum(HorStackedTraceNum);
end;

procedure TSegY.setHour(Index:Cardinal; Hour: Word);
begin
  TracesSegY[Index].setHour(Hour);
end;

procedure TSegY.setIndexProfileTracesNum(Index:Cardinal; IndexProfileTracesNum: LongWord);
begin
  TracesSegY[Index].setIndexProfileTracesNum(IndexProfileTracesNum);
end;

procedure TSegY.setIndexTapeTracesNum(Index:Cardinal; IndexTapeTracesNum: LongWord);
begin
  TracesSegY[Index].setIndexTapeTracesNum(IndexTapeTracesNum);
end;

procedure TSegY.setInitialFreq(InitialFreq: Word);
begin
  h400.InitialFreq:=swapW(InitialFreq);
end;

procedure TSegY.setInLine_no(Index:Cardinal; inLine_no: LongWord);
begin
  TracesSegY[Index].setInLine_no(inLine_no);
end;

procedure TSegY.setisCorr(Index:Cardinal; isCorr: Word);
begin
  TracesSegY[Index].setisCorr(isCorr);
end;

procedure TSegY.setMeasurementSystem(MeasurementSystem: Word);
begin
  h400.MeasurementSystem:=swapW(MeasurementSystem);
end;

procedure TSegY.setMinute(Index:Cardinal; Minute: Word);
begin
  TracesSegY[Index].setMinute(Minute);
end;

procedure TSegY.setMuteB(Index:Cardinal; MuteB: Word);
begin
  TracesSegY[Index].setMuteB(MuteB);
end;

procedure TSegY.setMuteE(Index:Cardinal; MuteE: Word);
begin
  TracesSegY[Index].setMuteE(MuteE);
end;

procedure TSegY.setNiCh(Index:Cardinal; NiCh: Word);
begin
  TracesSegY[Index].setNiCh(NiCh);
end;

procedure TSegY.setNMissRP(Index:Cardinal; NMissRP: Word);
begin
  TracesSegY[Index].setNMissRP(NMissRP);
end;

procedure TSegY.setNR_lastTrace(Index:Cardinal; NR_lastTrace: Word);
begin
  TracesSegY[Index].setNR_lastTrace(NR_lastTrace);
end;

procedure TSegY.setNR_rollSwitch(Index:Cardinal; NR_rollSwitch: Word);
begin
  TracesSegY[Index].setNR_rollSwitch(NR_rollSwitch);
end;

procedure TSegY.setNumProfile(NumProfile: LongWord);
begin
  h400.NumProfile:=swapW(NumProfile);
end;

procedure TSegY.setNumServiceTraces(NumServiceTraces: Word);
begin
  h400.NumServiceTraces:=swapW(NumServiceTraces);
end;

procedure TSegY.setNumTape(NumTape: LongWord);
begin
  h400.NumTape:=swapW(NumTape);
end;

procedure TSegY.setNumTraces(NumTraces: Word);
begin
  h400.NumTraces:=swapW(NumTraces);
end;

procedure TSegY.setFb_cliff(Index:Cardinal; Fb_cliff: Word);
begin
  TracesSegY[Index].setFb_cliff(Fb_cliff);
end;

procedure TSegY.setFe_cliff(Index:Cardinal; Fe_cliff: Word);
begin
  TracesSegY[Index].setFe_cliff(Fe_cliff);
end;

procedure TSegY.setFFID(Index:Cardinal; FFID: LongWord);
begin
  TracesSegY[Index].setFFID(FFID);
end;

procedure TSegY.setOffset(Index:Cardinal; Offset: LongInt);
begin
  TracesSegY[Index].setOffset(Offset);
end;

procedure TSegY.setOM(Index:Cardinal; OM: Word);
begin
  TracesSegY[Index].setOM(OM);
end;

procedure TSegY.setFieldSamples(FieldSamples: Word);
begin
  h400.FieldSamples:=swapW(FieldSamples);
end;

procedure TSegY.setFieldSampleStep(FieldSampleStep: Word);
begin
  h400.FieldSampleStep:=swapW(FieldSampleStep);
end;

procedure TSegY.setFieldTraceNum(Index:Cardinal; FieldTraceNum: LongWord);
begin
  TracesSegY[Index].setFieldTraceNum(FieldTraceNum);
end;

procedure TSegY.setRecoveryGain(RecoveryGain: Word);
begin
  h400.RecoveryGain:=swapW(RecoveryGain);
end;

procedure TSegY.setNR_firstTrace(Index:Cardinal; NR_firstTrace: Word);
begin
  TracesSegY[Index].setNR_firstTrace(NR_firstTrace);
end;

procedure TSegY.setSamples(Index:Cardinal; Samples: Word);
begin
  TracesSegY[Index].setSamples(Samples);
end;

procedure TSegY.setSampleStep(Index:Cardinal; SampleStep: Word);
begin
  TracesSegY[Index].setSampleStep(SampleStep);
end;

procedure TSegY.setScale_Altitude(Index:Cardinal; Scale_Altitude: SmallInt);
begin
  TracesSegY[Index].setScale_Altitude(Scale_Altitude);
end;

procedure TSegY.setScale_Position(Index:Cardinal; Scale_Position: SmallInt);
begin
  TracesSegY[Index].setScale_Position(Scale_Position);
end;

procedure TSegY.setSec(Index:Cardinal; Sec: Word);
begin
  TracesSegY[Index].setSec(Sec);
end;

procedure TSegY.setSortCode(SortCode: Word);
begin
  h400.SortCode:=swapW(SortCode);
end;

procedure TSegY.setStatR(Index:Cardinal; StatR: SmallInt);
begin
  TracesSegY[Index].setStatR(StatR);
end;

procedure TSegY.setStatS(Index:Cardinal; StatS: SmallInt);
begin
  TracesSegY[Index].setStatS(StatS);
end;

procedure TSegY.setSweepChanelTraceNumber(SweepChanelTraceNumber: Word);
begin
  h400.SweepChanelTraceNumber:=swapW(SweepChanelTraceNumber);
end;

procedure TSegY.setSweepCode(SweepCode: Word);
begin
  h400.SweepCode:=swapW(SweepCode);
end;

procedure TSegY.setSweepEndTaperLength(SweepEndTaperLength: Word);
begin
  h400.SweepEndTaperLength:=swapW(SweepEndTaperLength);
end;

procedure TSegY.setSweepInitTaperLength(SweepInitTaperLength: Word);
begin
  h400.SweepInitTaperLength:=swapW(SweepInitTaperLength);
end;

procedure TSegY.setSweepLength(SweepLength: Word);
begin
  h400.SweepLength:=swapW(SweepLength);
end;

procedure TSegY.setS_Energy(Index:Cardinal; S_Energy: LongWord);
begin
  TracesSegY[Index].setS_Energy(S_Energy);
end;

procedure TSegY.setS_LOC(Index:Cardinal; S_LOC: LongWord);
begin
  TracesSegY[Index].setS_LOC(S_LOC);
end;

procedure TSegY.setS_Scale(Index:Cardinal; S_Scale: LongWord);
begin
  TracesSegY[Index].setS_Scale(S_Scale);
end;

procedure TSegY.setTaperType(TaperType: Word);
begin
  h400.TaperType:=swapW(TaperType);
end;

procedure TSegY.setTapeSamples(TapeSamples: Word);
begin
  h400.Samples:=swapW(TapeSamples);
end;

procedure TSegY.setTapeSampleStep(TapeSampleStep: Word);
begin
  h400.SampleStep:=swapW(TapeSampleStep);
end;

procedure TSegY.setTauDeepR(Index:Cardinal; TauDeepR: Word);
begin
  TracesSegY[Index].setTauDeepR(TauDeepR);
end;

procedure TSegY.setTauDeepS(Index:Cardinal; TauDeepS: Word);
begin
  TracesSegY[Index].setTauDeepS(TauDeepS);
end;

procedure TSegY.setTauSourse(Index:Cardinal; TauSourse: SmallInt);
begin
  TracesSegY[Index].setTauSourse(TauSourse);
end;

procedure TSegY.setTauTape(Index:Cardinal; TauTape: SmallInt);
begin
  TracesSegY[Index].setTauTape(TauTape);
end;

procedure TSegY.setTimeCode(Index:Cardinal; TimeCode: Word);
begin
  TracesSegY[Index].setTimeCode(TimeCode);
end;

procedure TSegY.setTraceCorrelationDate(TraceCorrelationDate: Word);
begin
  h400.TraceCorrelationDate:=swapW(TraceCorrelationDate);
end;

procedure TSegY.setTraceEndFreq(Index:Cardinal; TraceEndFreq: Word);
begin
  TracesSegY[Index].setTraceEndFreq(TraceEndFreq);
end;

procedure TSegY.setTraceID(Index:Cardinal; TraceID: Word);
begin
  TracesSegY[Index].setTraceID(TraceID);
end;

procedure TSegY.setTraceInitialFreq(Index:Cardinal; TraceInitialFreq: Word);
begin
  TracesSegY[Index].setTraceInitialFreq(TraceInitialFreq);
end;

procedure TSegY.setTraceMeasurementSystem(Index:Cardinal; TraceMeasurementSystem: Word);
begin
  TracesSegY[Index].setTraceMeasurementSystem(TraceMeasurementSystem);
end;

procedure TSegY.setTraceSweepCode(Index:Cardinal; TraceSweepCode: Word);
begin
  TracesSegY[Index].setTraceSweepCode(TraceSweepCode);
end;

procedure TSegY.setTraceSweepEndTaperLength(Index:Cardinal; TraceSweepEndTaperLength: Word);
begin
  TracesSegY[Index].setTraceSweepEndTaperLength(TraceSweepEndTaperLength);
end;

procedure TSegY.setTraceSweepInitTaperLength(Index:Cardinal; TraceSweepInitTaperLength: Word);
begin
  TracesSegY[Index].setTraceSweepInitTaperLength(TraceSweepInitTaperLength);
end;

procedure TSegY.setTraceSweepLength(Index:Cardinal; TraceSweepLength: Word);
begin
  TracesSegY[Index].setTraceSweepLength(TraceSweepLength);
end;

procedure TSegY.setTraceTaperType(Index:Cardinal; TraceTaperType: Word);
begin
  TracesSegY[Index].setTraceTaperType(TraceTaperType);
end;

procedure TSegY.setV0(Index:Cardinal; V0: Word);
begin
  TracesSegY[Index].setV0(V0);
end;

procedure TSegY.setVz(Index:Cardinal; Vz: Word);
begin
  TracesSegY[Index].setVz(Vz);
end;

procedure TSegY.setWeightFactor(Index:Cardinal; WeightFactor: Word);
begin
  TracesSegY[Index].setWeightFactor(WeightFactor);
end;

procedure TSegY.setXLine_no(Index:Cardinal; xLine_no: LongWord);
begin
  TracesSegY[Index].setXLine_no(xLine_no);
end;

procedure TSegY.setX_C(Index:Cardinal; X_C: LongInt);
begin
  TracesSegY[Index].setX_C(X_C);
end;

procedure TSegY.setX_R(Index:Cardinal; X_R: LongInt);
begin
  TracesSegY[Index].setX_R(X_R);
end;

procedure TSegY.setX_S(Index:Cardinal; X_S: LongInt);
begin
  TracesSegY[Index].setX_S(X_S);
end;

procedure TSegY.setYear(Index:Cardinal; Year: Word);
begin
  TracesSegY[Index].setYear(Year);
end;

procedure TSegY.setY_C(Index:Cardinal; Y_C: LongInt);
begin
  TracesSegY[Index].setY_C(Y_C);
end;

procedure TSegY.setY_R(Index:Cardinal; Y_R: LongInt);
begin
  TracesSegY[Index].setY_R(Y_R);
end;

procedure TSegY.setY_S(Index:Cardinal; Y_S: LongInt);
begin
  TracesSegY[Index].setY_S(Y_S);
end;

procedure TSegY.writeSegY;
var
fW:TFileStream;
i:Cardinal;
begin
try
  fW:=TFileStream.Create(fileName,fmOpenWrite);
  fW.WriteBuffer(h3200,sizeof(h3200));
  fw.WriteBuffer(h400,sizeof(h400));
  for I := 0 to pred(countRealTraces) do begin
    fW.WriteBuffer(TracesSegy[i].h240, sizeof(TracesSegy[i].h240));
    fW.WriteBuffer(TracesSegy[i].data[0], sizeof(TracesSegy[i].data)*samples);
  end;
finally
  fw.Free;
end;
end;

end.
