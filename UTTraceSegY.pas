unit UTTraceSegY;

interface
uses Generics.Collections,Format;

type

    TH240 = packed record
      IndexProfileTracesNum,IndexTapeTracesNum,FFID,FiledTraceNum,
      S_Energy,CDPNum,CDPTraceNum:LongWord;

      TraceID,TraceAcquisitionNum,HorStackedTraceNum,DataType:Word;

      Offset,Altitude_RP,Altitude_SP:LongInt;

      Deep_SP,Datum_RP,Datum_SP,Deep_Water_SP,Deep_Water_RP:LongWord;

      Scale_Altitude,Scale_Position:SmallInt;

      X_S,Y_S,X_R,Y_R:LongInt;

      TraceMeasurementSystem,V0,Vz,TauDeepS,TauDeepR:Word;

      StatS,StatR,FullApplyStat,TauTape,TauSourse:SmallInt;

      OM,MuteB,MuteE,Samples,SampleStep,GainType,GainConst,DpB,isCorr,TraceInitialFreq,TraceEndFreq,
      TraceSweepLength,TraceSweepCode,TraceSweepInitTaperLength,TraceSweepEndTaperLength,TraceTaperType,
      F_AntiAlaising,dB_AntiAlaising,F_Reject,dB_Reject,Fb_cliff,Fe_cliff,dB_Fb,dB_Fe,Year,Day,Hour,
      Minute,Sec,TimeCode,WeightFactor,NR_rollSwitch,NR_firstTrace,NR_lastTrace,NMissRP,NiCh:Word;

      X_C,Y_C:LongInt;

      inLine_no,xLine_no,S_LOC,S_Scale,b78,b79:LongWord;

      b80,b81,b82,b83,b84,b85,b86,b87,b88,b89,b90,b91,b92,b93:Word;
    end;

    TTraceSegY = class
      h240:TH240;
      data:TArrS;

      constructor Create();
      procedure readTrace(h240:TH240;data:TArrS);

      {setters}
      procedure setIndexProfileTracesNum(IndexProfileTracesNum:LongWord);
      procedure setIndexTapeTracesNum(IndexTapeTracesNum:LongWord);
      procedure setFFID(FFID:LongWord);
      procedure setFieldTraceNum(FieldTraceNum:LongWord);
      procedure setS_Energy(S_Energy:LongWord);
      procedure setCDPNum(CDPNum:LongWord);
      procedure setCDPTraceNum(CDPTraceNum:LongWord);
      procedure setTraceID(TraceID:Word);
      procedure setTraceAcquisitionNum(TraceAcquisitionNum:Word);
      procedure setHorStackedTraceNum(HorStackedTraceNum:Word);
      procedure setDataType(DataType:Word);
      procedure setOffset(Offset:LongInt);
      procedure setAltitude_RP(Altitude_RP:LongInt);
      procedure setAltitude_SP(Altitude_SP:LongInt);
      procedure setDeep_SP(Deep_SP:LongWord);
      procedure setDatum_RP(Datum_RP:LongWord);
      procedure setDatum_SP(Datum_SP:LongWord);
      procedure setDeep_Water_SP(Deep_Water_SP:LongWord);
      procedure setDeep_Water_RP(Deep_Water_RP:LongWord);
      procedure setScale_Altitude(Scale_Altitude:SmallInt);
      procedure setScale_Position(Scale_Position:SmallInt);
      procedure setX_S(X_S:LongInt);
      procedure setY_S(Y_S:LongInt);
      procedure setX_R(X_R:LongInt);
      procedure setY_R(Y_R:LongInt);
      procedure setTraceMeasurementSystem(TraceMeasurementSystem:Word);
      procedure setV0(V0:Word);
      procedure setVz(Vz:Word);
      procedure setTauDeepS(TauDeepS:Word);
      procedure setTauDeepR(TauDeepR:Word);
      procedure setStatS(StatS:SmallInt);
      procedure setStatR(StatR:SmallInt);
      procedure setFullApplyStat(FullApplyStat:SmallInt);
      procedure setTauTape(TauTape:SmallInt);
      procedure setTauSourse(TauSourse:SmallInt);
      procedure setOM(OM:Word);
      procedure setMuteB(MuteB:Word);
      procedure setMuteE(MuteE:Word);
      procedure setSamples(Samples:Word);
      procedure setSampleStep(SampleStep:Word);
      procedure setGainType(GainType:Word);
      procedure setGainConst(GainConst:Word);
      procedure setDpB(DpB:Word);
      procedure setisCorr(isCorr:Word);
      procedure setTraceInitialFreq(TraceInitialFreq:Word);
      procedure setTraceEndFreq(TraceEndFreq:Word);
      procedure setTraceSweepLength(TraceSweepLength:Word);
      procedure setTraceSweepCode(TraceSweepCode:Word);
      procedure setTraceSweepInitTaperLength(TraceSweepInitTaperLength:Word);
      procedure setTraceSweepEndTaperLength(TraceSweepEndTaperLength:Word);
      procedure setTraceTaperType(TraceTaperType:Word);
      procedure setF_AntiAlaising(F_AntiAlaising:Word);
      procedure setDB_AntiAlaising(dB_AntiAlaising:Word);
      procedure setF_Reject(F_Reject:Word);
      procedure setDB_Reject(dB_Reject:Word);
      procedure setFb_cliff(Fb_cliff:Word);
      procedure setFe_cliff(Fe_cliff:Word);
      procedure setDB_Fb(dB_Fb:Word);
      procedure setDB_Fe(dB_Fe:Word);
      procedure setYear(Year:Word);
      procedure setDay(Day:Word);
      procedure setHour(Hour:Word);
      procedure setMinute(Minute:Word);
      procedure setSec(Sec:Word);
      procedure setTimeCode(TimeCode:Word);
      procedure setWeightFactor(WeightFactor:Word);
      procedure setNR_rollSwitch(NR_rollSwitch:Word);
      procedure setNR_firstTrace(NR_firstTrace:Word);
      procedure setNR_lastTrace(NR_lastTrace:Word);
      procedure setNMissRP(NMissRP:Word);
      procedure setNiCh(NiCh:Word);
      procedure setX_C(X_C:LongInt);
      procedure setY_C(Y_C:LongInt);
      procedure setInLine_no(inLine_no:LongWord);
      procedure setXLine_no(xLine_no:LongWord);
      procedure setS_LOC(S_LOC:LongWord);
      procedure setS_Scale(S_Scale:LongWord);
      {getters}
      function getIndexProfileTracesNum():LongWord;
      function getIndexTapeTracesNum():LongWord;
      function getFFID():LongWord;
      function getFieldTraceNum():LongWord;
      function getS_Energy():LongWord;
      function getCDPNum():LongWord;
      function getCDPTraceNum():LongWord;
      function getTraceID():Word;
      function getTraceAcquisitionNum():Word;
      function getHorStackedTraceNum():Word;
      function getDataType():Word;
      function getOffset():LongInt;
      function getAltitude_RP():LongInt;
      function getAltitude_SP():LongInt;
      function getDeep_SP():LongWord;
      function getDatum_RP():LongWord;
      function getDatum_SP():LongWord;
      function getDeep_Water_SP():LongWord;
      function getDeep_Water_RP():LongWord;
      function getScale_Altitude():SmallInt;
      function getScale_Position():SmallInt;
      function getX_S():LongInt;
      function getY_S():LongInt;
      function getX_R():LongInt;
      function getY_R():LongInt;
      function getTraceMeasurementSystem():Word;
      function getV0():Word;
      function getVz():Word;
      function getTauDeepS():Word;
      function getTauDeepR():Word;
      function getStatS():SmallInt;
      function getStatR():SmallInt;
      function getFullApplyStat():SmallInt;
      function getTauTape():SmallInt;
      function getTauSourse():SmallInt;
      function getOM():Word;
      function getMuteB():Word;
      function getMuteE():Word;
      function getSamples():Word;
      function getSampleStep():Word;
      function getGainType():Word;
      function getGainConst():Word;
      function getDpB():Word;
      function getisCorr():Word;
      function getTraceInitialFreq():Word;
      function getTraceEndFreq():Word;
      function getTraceSweepLength():Word;
      function getTraceSweepCode():Word;
      function getTraceSweepInitTaperLength():Word;
      function getTraceSweepEndTaperLength():Word;
      function getTraceTaperType():Word;
      function getF_AntiAlaising():Word;
      function getDB_AntiAlaising():Word;
      function getF_Reject():Word;
      function getDB_Reject():Word;
      function getFb_cliff():Word;
      function getFe_cliff():Word;
      function getDB_Fb():Word;
      function getDB_Fe():Word;
      function getYear():Word;
      function getDay():Word;
      function getHour():Word;
      function getMinute():Word;
      function getSec():Word;
      function getTimeCode():Word;
      function getWeightFactor():Word;
      function getNR_rollSwitch():Word;
      function getNR_firstTrace():Word;
      function getNR_lastTrace():Word;
      function getNMissRP():Word;
      function getNiCh():Word;
      function getX_C():LongInt;
      function getY_C():LongInt;
      function getInLine_no():LongWord;
      function getXLine_no():LongWord;
      function getS_LOC():LongWord;
      function getS_Scale():LongWord;
    end;

implementation

{ TTraceSegY }

constructor TTraceSegY.Create();
begin

end;

function TTraceSegY.getTraceAcquisitionNum: Word;
begin
  result:=SwapW(h240.TraceAcquisitionNum);
end;

function TTraceSegY.getAltitude_RP: LongInt;
begin
  result:=swapW(h240.Altitude_RP);
end;

function TTraceSegY.getAltitude_SP: LongInt;
begin
  result:=swapW(h240.Altitude_SP);
end;

function TTraceSegY.getCDPNum: LongWord;
begin
  result:=swapW(h240.CDPNum);
end;

function TTraceSegY.getCDPTraceNum: LongWord;
begin
  result:=swapW(h240.CDPTraceNum);
end;

function TTraceSegY.getDataType: Word;
begin
  result:=swapW(h240.DataType);
end;

function TTraceSegY.getDatum_RP: LongWord;
begin
  result:=swapW(h240.Datum_RP);
end;

function TTraceSegY.getDatum_SP: LongWord;
begin
  result:=swapW(h240.Datum_SP);
end;

function TTraceSegY.getDay: Word;
begin
  result:=swapW(h240.Day);
end;

function TTraceSegY.getDB_AntiAlaising: Word;
begin
  result:=swapW(h240.dB_AntiAlaising);
end;

function TTraceSegY.getDB_Fb: Word;
begin
  result:=swapW(h240.dB_Fb);
end;

function TTraceSegY.getDB_Fe: Word;
begin
  result:=swapW(h240.dB_Fe);
end;

function TTraceSegY.getDB_Reject: Word;
begin
  result:=swapW(h240.dB_Reject);
end;

function TTraceSegY.getDeep_SP: LongWord;
begin
  result:=swapW(h240.Deep_SP);
end;

function TTraceSegY.getDeep_Water_RP: LongWord;
begin
  result:=swapW(h240.Deep_Water_RP);
end;

function TTraceSegY.getDeep_Water_SP: LongWord;
begin
  result:=swapW(h240.Deep_Water_SP);
end;

function TTraceSegY.getDpB: Word;
begin
  result:=swapW(h240.DpB);
end;

function TTraceSegY.getTraceEndFreq: Word;
begin
  result:=swapW(h240.TraceEndFreq);
end;

function TTraceSegY.getFb_cliff: Word;
begin
  result:=swapW(h240.Fb_cliff);
end;

function TTraceSegY.getFe_cliff: Word;
begin
  result:=swapW(h240.Fe_cliff);
end;

function TTraceSegY.getFFID: LongWord;
begin
  result:=swapW(h240.FFID);
end;

function TTraceSegY.getFieldTraceNum: LongWord;
begin
  result:=swapW(h240.FiledTraceNum);
end;

function TTraceSegY.getFullApplyStat: SmallInt;
begin
  result:=swapW(h240.FullApplyStat);
end;

function TTraceSegY.getF_AntiAlaising: Word;
begin
  result:=swapW(h240.F_AntiAlaising);
end;

function TTraceSegY.getF_Reject: Word;
begin
  result:=swapW(h240.F_Reject);
end;

function TTraceSegY.getGainConst: Word;
begin
  result:=swapW(h240.GainConst);
end;

function TTraceSegY.getGainType: Word;
begin
  result:=swapW(h240.GainType);
end;

function TTraceSegY.getHorStackedTraceNum: Word;
begin
  result:=swapW(h240.HorStackedTraceNum);
end;

function TTraceSegY.getHour: Word;
begin
  result:=swapW(h240.Hour);
end;

function TTraceSegY.getIndexProfileTracesNum: LongWord;
begin
  result:=swapW(h240.IndexProfileTracesNum);
end;

function TTraceSegY.getIndexTapeTracesNum: LongWord;
begin
  result:=swapW(h240.IndexTapeTracesNum);
end;

function TTraceSegY.getTraceInitialFreq: Word;
begin
  result:=swapW(h240.TraceInitialFreq);
end;

function TTraceSegY.getInLine_no: LongWord;
begin
  result:=swapW(h240.inLine_no);
end;

function TTraceSegY.getisCorr: Word;
begin
  result:=swapW(h240.isCorr);
end;

function TTraceSegY.getTraceMeasurementSystem: Word;
begin
  result:=swapW(h240.TraceMeasurementSystem);
end;

function TTraceSegY.getMinute: Word;
begin
  result:=swapW(h240.Minute);
end;

function TTraceSegY.getMuteB: Word;
begin
  result:=swapW(h240.MuteB);
end;

function TTraceSegY.getMuteE: Word;
begin
  result:=swapW(h240.MuteE);
end;

function TTraceSegY.getNiCh: Word;
begin
  result:=swapW(h240.NiCh);
end;

function TTraceSegY.getNMissRP: Word;
begin
  result:=swapW(h240.NMissRP);
end;

function TTraceSegY.getNR_lastTrace: Word;
begin
  result:=swapW(h240.NR_lastTrace);
end;

function TTraceSegY.getNR_rollSwitch: Word;
begin
  result:=swapW(h240.NR_rollSwitch);
end;

function TTraceSegY.getOffset: LongInt;
begin
  result:=swapW(h240.Offset);
end;

function TTraceSegY.getOM: Word;
begin
  result:=swapW(h240.OM);
end;

function TTraceSegY.getNR_firstTrace: Word;
begin
  result:=swapW(h240.NR_firstTrace);
end;

function TTraceSegY.getSamples: Word;
begin
  result:=swapW(h240.Samples);
end;

function TTraceSegY.getSampleStep: Word;
begin
  result:=swapW(h240.SampleStep);
end;

function TTraceSegY.getScale_Altitude: SmallInt;
begin
  result:=swapW(h240.Scale_Altitude);
end;

function TTraceSegY.getScale_Position: SmallInt;
begin
  result:=swapW(h240.Scale_Position);
end;

function TTraceSegY.getSec: Word;
begin
  result:=swapW(h240.Sec);
end;

function TTraceSegY.getStatR: SmallInt;
begin
  result:=swapW(h240.StatR);
end;

function TTraceSegY.getStatS: SmallInt;
begin
  result:=swapW(h240.StatS);
end;

function TTraceSegY.getTraceSweepCode: Word;
begin
  result:=swapW(h240.TraceSweepCode);
end;

function TTraceSegY.getTraceSweepEndTaperLength: Word;
begin
  result:=swapW(h240.TraceSweepEndTaperLength);
end;

function TTraceSegY.getTraceSweepInitTaperLength: Word;
begin
  result:=swapW(h240.TraceSweepInitTaperLength);
end;

function TTraceSegY.getTraceSweepLength: Word;
begin
  result:=swapW(h240.TraceSweepLength);
end;

function TTraceSegY.getS_Energy: LongWord;
begin
  result:=swapW(h240.S_Energy);
end;

function TTraceSegY.getS_LOC: LongWord;
begin
  result:=swapW(h240.S_LOC);
end;

function TTraceSegY.getS_Scale: LongWord;
begin
  result:=swapW(h240.S_Scale);
end;

function TTraceSegY.getTraceTaperType: Word;
begin
  result:=swapW(h240.TraceTaperType);
end;

function TTraceSegY.getTauDeepR: Word;
begin
  result:=swapW(h240.TauDeepR);
end;

function TTraceSegY.getTauDeepS: Word;
begin
  result:=swapW(h240.TauDeepS);
end;

function TTraceSegY.getTauSourse: SmallInt;
begin
  result:=swapW(h240.TauSourse);
end;

function TTraceSegY.getTauTape: SmallInt;
begin
  result:=swapW(h240.TauTape);
end;

function TTraceSegY.getTimeCode: Word;
begin
  result:=swapW(h240.TimeCode);
end;

function TTraceSegY.getTraceID: Word;
begin
  result:=swapW(h240.TraceID);
end;

function TTraceSegY.getV0: Word;
begin
  result:=swapW(h240.V0);
end;

function TTraceSegY.getVz: Word;
begin
  result:=swapW(h240.Vz);
end;

function TTraceSegY.getWeightFactor: Word;
begin
  result:=swapW(h240.WeightFactor);
end;

function TTraceSegY.getXLine_no: LongWord;
begin
  result:=swapW(h240.xLine_no);
end;

function TTraceSegY.getX_C: LongInt;
begin
  result:=swapW(h240.X_C);
end;

function TTraceSegY.getX_R: LongInt;
begin
  result:=swapW(h240.X_R);
end;

function TTraceSegY.getX_S: LongInt;
begin
  result:=swapW(h240.X_S);
end;

function TTraceSegY.getYear: Word;
begin
  result:=swapW(h240.Year);
end;

function TTraceSegY.getY_C: LongInt;
begin
  result:=swapW(h240.Y_C);
end;

function TTraceSegY.getY_R: LongInt;
begin
  result:=swapW(h240.Y_R);
end;

function TTraceSegY.getY_S: LongInt;
begin
  result:=swapW(h240.Y_S);
end;

procedure TTraceSegY.readTrace(h240: TH240; data: TArrS);
begin
  self.h240:=h240;
  self.data:=data;
end;

procedure TTraceSegY.setTraceAcquisitionNum(TraceAcquisitionNum: Word);
begin
  h240.TraceAcquisitionNum:=swapW(TraceAcquisitionNum);
end;

procedure TTraceSegY.setAltitude_RP(Altitude_RP: LongInt);
begin
  h240.Altitude_RP:=swapW(Altitude_RP);
end;

procedure TTraceSegY.setAltitude_SP(Altitude_SP: LongInt);
begin
  h240.Altitude_SP:=swapW(Altitude_SP);
end;

procedure TTraceSegY.setCDPNum(CDPNum: LongWord);
begin
  h240.CDPNum:=swapW(CDPNum);
end;

procedure TTraceSegY.setCDPTraceNum(CDPTraceNum: LongWord);
begin
  h240.CDPTraceNum:=swapW(CDPTraceNum);
end;

procedure TTraceSegY.setDataType(DataType: Word);
begin
  h240.DataType:=swapW(DataType);
end;

procedure TTraceSegY.setDatum_RP(Datum_RP: LongWord);
begin
  h240.Datum_RP:=swapW(Datum_RP);
end;

procedure TTraceSegY.setDatum_SP(Datum_SP: LongWord);
begin
  h240.Datum_SP:=swapW(Datum_SP);
end;

procedure TTraceSegY.setDay(Day: Word);
begin
  h240.Day:=swapW(Day);
end;

procedure TTraceSegY.setDB_AntiAlaising(dB_AntiAlaising: Word);
begin
  h240.dB_AntiAlaising:=swapW(dB_AntiAlaising);
end;

procedure TTraceSegY.setDB_Fb(dB_Fb: Word);
begin
  h240.dB_Fb:=swapW(dB_Fb);
end;

procedure TTraceSegY.setDB_Fe(dB_Fe: Word);
begin
  h240.dB_Fe:=swapW(dB_Fe);
end;

procedure TTraceSegY.setDB_Reject(dB_Reject: Word);
begin
  h240.dB_Reject:=swapW(dB_Reject);
end;

procedure TTraceSegY.setDeep_SP(Deep_SP: LongWord);
begin
  h240.Deep_SP:=swapW(Deep_SP);
end;

procedure TTraceSegY.setDeep_Water_RP(Deep_Water_RP: LongWord);
begin
  h240.Deep_Water_RP:=swapW(Deep_Water_RP);
end;

procedure TTraceSegY.setDeep_Water_SP(Deep_Water_SP: LongWord);
begin
  h240.Deep_Water_SP:=swapW(Deep_Water_SP);
end;

procedure TTraceSegY.setDpB(DpB: Word);
begin
  h240.DpB:=swapW(DpB);
end;

procedure TTraceSegY.setTraceEndFreq(TraceEndFreq: Word);
begin
  h240.TraceEndFreq:=swapW(TraceEndFreq);
end;

procedure TTraceSegY.setFb_cliff(Fb_cliff: Word);
begin
  h240.Fb_cliff:=swapW(Fb_cliff);
end;

procedure TTraceSegY.setFe_cliff(Fe_cliff: Word);
begin
  h240.Fe_cliff:=swapW(Fe_cliff);
end;

procedure TTraceSegY.setFFID(FFID: LongWord);
begin
  h240.FFID:=swapW(FFID);
end;

procedure TTraceSegY.setFieldTraceNum(FieldTraceNum: LongWord);
begin
  h240.FiledTraceNum:=swapW(FieldTraceNum);
end;

procedure TTraceSegY.setFullApplyStat(FullApplyStat: SmallInt);
begin
  h240.FullApplyStat:=swapW(FullApplyStat);
end;

procedure TTraceSegY.setF_AntiAlaising(F_AntiAlaising: Word);
begin
  h240.F_AntiAlaising:=swapW(F_AntiAlaising);
end;

procedure TTraceSegY.setF_Reject(F_Reject: Word);
begin
  h240.F_Reject:=swapW(F_Reject);
end;

procedure TTraceSegY.setGainConst(GainConst: Word);
begin
  h240.GainConst:=swapW(GainConst);
end;

procedure TTraceSegY.setGainType(GainType: Word);
begin
  h240.GainType:=swapW(GainType);
end;

procedure TTraceSegY.setHorStackedTraceNum(HorStackedTraceNum: Word);
begin
  h240.HorStackedTraceNum:=swapW(HorStackedTraceNum);
end;

procedure TTraceSegY.setHour(Hour: Word);
begin
  h240.Hour:=swapW(Hour);
end;

procedure TTraceSegY.setIndexProfileTracesNum(IndexProfileTracesNum: LongWord);
begin
  h240.IndexProfileTracesNum:=swapW(IndexProfileTracesNum);
end;

procedure TTraceSegY.setIndexTapeTracesNum(IndexTapeTracesNum: LongWord);
begin
  h240.IndexTapeTracesNum:=swapW(IndexTapeTracesNum);
end;

procedure TTraceSegY.setTraceInitialFreq(TraceInitialFreq: Word);
begin
  h240.TraceInitialFreq:=swapW(TraceInitialFreq);
end;

procedure TTraceSegY.setInLine_no(inLine_no: LongWord);
begin
  h240.inLine_no:=swapW(inLine_no);
end;

procedure TTraceSegY.setisCorr(isCorr: Word);
begin
  h240.isCorr:=swapW(isCorr);
end;

procedure TTraceSegY.setTraceMeasurementSystem(TraceMeasurementSystem: Word);
begin
  h240.TraceMeasurementSystem:=swapW(TraceMeasurementSystem);
end;

procedure TTraceSegY.setMinute(Minute: Word);
begin
  h240.Minute:=swapW(Minute);
end;

procedure TTraceSegY.setMuteB(MuteB: Word);
begin
  h240.MuteB:=swapW(MuteB);
end;

procedure TTraceSegY.setMuteE(MuteE: Word);
begin
  h240.MuteE:=swapW(MuteE);
end;

procedure TTraceSegY.setNiCh(NiCh: Word);
begin
  h240.NiCh:=swapW(NiCh);
end;

procedure TTraceSegY.setNMissRP(NMissRP: Word);
begin
  h240.NMissRP:=swapW(NMissRP);
end;

procedure TTraceSegY.setNR_lastTrace(NR_lastTrace: Word);
begin
  h240.NR_lastTrace:=swapW(NR_lastTrace);
end;

procedure TTraceSegY.setNR_rollSwitch(NR_rollSwitch: Word);
begin
  h240.NR_rollSwitch:=swapW(NR_rollSwitch);
end;

procedure TTraceSegY.setOffset(Offset: LongInt);
begin
  h240.Offset:=swapW(Offset);
end;

procedure TTraceSegY.setOM(OM: Word);
begin
  h240.OM:=swapW(OM);
end;

procedure TTraceSegY.setNR_firstTrace(NR_firstTrace: Word);
begin
  h240.NR_firstTrace:=swapW(NR_firstTrace);
end;

procedure TTraceSegY.setSamples(Samples: Word);
begin
  h240.Samples:=swapW(Samples);
end;

procedure TTraceSegY.setSampleStep(SampleStep: Word);
begin
  h240.SampleStep:=swapW(SampleStep);
end;

procedure TTraceSegY.setScale_Altitude(Scale_Altitude: SmallInt);
begin
  h240.Scale_Altitude:=swapW(Scale_Altitude);
end;

procedure TTraceSegY.setScale_Position(Scale_Position: SmallInt);
begin
  h240.Scale_Position:=swapW(Scale_Position);
end;

procedure TTraceSegY.setSec(Sec: Word);
begin
  h240.Sec:=swapW(Sec);
end;

procedure TTraceSegY.setStatR(StatR: SmallInt);
begin
  h240.StatR:=swapW(StatR);
end;

procedure TTraceSegY.setStatS(StatS: SmallInt);
begin
  h240.StatS:=swapW(StatS);
end;

procedure TTraceSegY.setTraceSweepCode(TraceSweepCode: Word);
begin
  h240.TraceSweepCode:=swapW(TraceSweepCode);
end;

procedure TTraceSegY.setTraceSweepEndTaperLength(TraceSweepEndTaperLength: Word);
begin
  h240.TraceSweepEndTaperLength:=swapW(TraceSweepEndTaperLength);
end;

procedure TTraceSegY.setTraceSweepInitTaperLength(TraceSweepInitTaperLength: Word);
begin
  h240.TraceSweepInitTaperLength:=swapW(TraceSweepInitTaperLength);
end;

procedure TTraceSegY.setTraceSweepLength(TraceSweepLength: Word);
begin
  h240.TraceSweepLength:=swapW(TraceSweepLength);
end;

procedure TTraceSegY.setS_Energy(S_Energy: LongWord);
begin
  h240.S_Energy:=swapW(S_Energy);
end;

procedure TTraceSegY.setS_LOC(S_LOC: LongWord);
begin
  h240.S_LOC:=swapW(S_LOC);
end;

procedure TTraceSegY.setS_Scale(S_Scale: LongWord);
begin
  h240.S_Scale:=swapW(S_Scale);
end;

procedure TTraceSegY.setTraceTaperType(TraceTaperType: Word);
begin
  h240.TraceTaperType:=swapW(TraceTaperType);
end;

procedure TTraceSegY.setTauDeepR(TauDeepR: Word);
begin
  h240.TauDeepR:=swapW(TauDeepR);
end;

procedure TTraceSegY.setTauDeepS(TauDeepS: Word);
begin
  h240.TauDeepS:=swapW(TauDeepS);
end;

procedure TTraceSegY.setTauSourse(TauSourse: SmallInt);
begin
  h240.TauSourse:=swapW(TauSourse);
end;

procedure TTraceSegY.setTauTape(TauTape: SmallInt);
begin
  h240.TauTape:=swapW(TauTape);
end;

procedure TTraceSegY.setTimeCode(TimeCode: Word);
begin
  h240.TimeCode:=swapW(TimeCode);
end;

procedure TTraceSegY.setTraceID(TraceID: Word);
begin
  h240.TraceID:=swapW(TraceID);
end;

procedure TTraceSegY.setV0(V0: Word);
begin
  h240.V0:=swapW(V0);
end;

procedure TTraceSegY.setVz(Vz: Word);
begin
  h240.Vz:=swapW(Vz);
end;

procedure TTraceSegY.setWeightFactor(WeightFactor: Word);
begin
   h240.WeightFactor:=swapW(WeightFactor);
end;

procedure TTraceSegY.setXLine_no(xLine_no: LongWord);
begin
  h240.xLine_no:=swapW(xLine_no);
end;

procedure TTraceSegY.setX_C(X_C: LongInt);
begin
  h240.X_C:=swapW(X_C);
end;

procedure TTraceSegY.setX_R(X_R: LongInt);
begin
  h240.X_R:=swapW(X_R);
end;

procedure TTraceSegY.setX_S(X_S: LongInt);
begin
  h240.X_S:=swapW(X_S);
end;

procedure TTraceSegY.setYear(Year: Word);
begin
  h240.Year:=swapW(Year);
end;

procedure TTraceSegY.setY_C(Y_C: LongInt);
begin
  h240.Y_C:=swapW(Y_C);
end;

procedure TTraceSegY.setY_R(Y_R: LongInt);
begin
  h240.Y_R:=swapW(Y_R);
end;

procedure TTraceSegY.setY_S(Y_S: LongInt);
begin
  h240.Y_S:=swapW(Y_S);
end;

end.
