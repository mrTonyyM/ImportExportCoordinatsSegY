unit UTWordsDictionary;

interface
uses System.SysUtils,Generics.Collections,Generics.Defaults,UTSegY,UTTraceSegY;

type
  TWordsDictionary = class
    Words:TDictionary<String,Double>;
    TraceSegY: TTraceSegY;
    multiplier:Double;
    constructor Create(TraceSegY: TTraceSegY;multiplier:Double);
    destructor Destroy;
    procedure designWords;
    function getWordsDictionary():TDictionary<String,Double>;
  end;

implementation

{ TWordsDictionary }

constructor TWordsDictionary.Create(TraceSegY: TTraceSegY;multiplier:Double);
begin
  Words:=TDictionary<String,Double>.Create;
  self.TraceSegY:=TraceSegY;
  self.multiplier:=multiplier;
end;

procedure TWordsDictionary.designWords;
begin
    with words do begin
  add('IndexProfileTracesNum',TraceSegY.getIndexProfileTracesNum);
  add('IndexTapeTracesNum',TraceSegY.getIndexTapeTracesNum);
  add('FFID',TraceSegY.getFFID);
  add('FieldTraceNum',TraceSegY.getFieldTraceNum);
  add('S_Energy',TraceSegY.getS_Energy);
  add('CDPNum',TraceSegY.getCDPNum);
  add('CDPTraceNum',TraceSegY.getCDPTraceNum);
  add('TraceID',TraceSegY.getTraceID);
  add('TraceAcquisitionNum',TraceSegY.getTraceAcquisitionNum);
  add('HorStackedTraceNum',TraceSegY.getHorStackedTraceNum);
  add('DataType',TraceSegY.getDataType);
  add('Offset',TraceSegY.getOffset);
  add('Altitude_RP',TraceSegY.getAltitude_RP);
  add('Altitude_SP',TraceSegY.getAltitude_SP);
  add('Deep_SP',TraceSegY.getDeep_SP);
  add('Datum_RP',TraceSegY.getDatum_RP);
  add('Datum_SP',TraceSegY.getDatum_SP);
  add('Deep_Water_SP',TraceSegY.getDeep_Water_SP);
  add('Deep_Water_RP',TraceSegY.getDeep_Water_RP);
  add('Scale_Altitude',TraceSegY.getScale_Altitude);
  add('Scale_Position',TraceSegY.getScale_Position);
  add('X_S',TraceSegY.getX_S*multiplier);
  add('Y_S',TraceSegY.getY_S*multiplier);
  add('X_R',TraceSegY.getX_R*multiplier);
  add('Y_R',TraceSegY.getY_R*multiplier);
  add('TraceMeasurementSystem',TraceSegY.getTraceMeasurementSystem);
  add('V0',TraceSegY.getV0);
  add('Vz',TraceSegY.getVz);
  add('TauDeepS',TraceSegY.getTauDeepS);
  add('TauDeepR',TraceSegY.getTauDeepR);
  add('StatS',TraceSegY.getStatS);
  add('StatR',TraceSegY.getStatR);
  add('FullApplyStat',TraceSegY.getFullApplyStat);
  add('TauTape',TraceSegY.getTauTape);
  add('TauSourse',TraceSegY.getTauSourse);
  add('OM',TraceSegY.getOM);
  add('MuteB',TraceSegY.getMuteB);
  add('MuteE',TraceSegY.getMuteE);
  add('Samples',TraceSegY.getSamples);
  add('SampleStep',TraceSegY.getSampleStep);
  add('GainType',TraceSegY.getGainType);
  add('GainConst',TraceSegY.getGainConst);
  add('DpB',TraceSegY.getDpB);
  add('isCorr',TraceSegY.getIsCorr);
  add('TraceInitialFreq',TraceSegY.getTraceInitialFreq);
  add('TraceEndFreq',TraceSegY.getTraceEndFreq);
  add('TraceSweepLength',TraceSegY.getTraceSweepLength);
  add('TraceSweepCode',TraceSegY.getTraceSweepCode);
  add('TraceSweepInitTaperLength',TraceSegY.getTraceSweepInitTaperLength);
  add('TraceSweepEndTaperLength',TraceSegY.getTraceSweepEndTaperLength);
  add('TraceTaperType',TraceSegY.getTraceTaperType);
  add('F_AntiAlaising',TraceSegY.getF_AntiAlaising);
  add('dB_AntiAlaising',TraceSegY.getDB_AntiAlaising);
  add('F_Reject',TraceSegY.getF_Reject);
  add('dB_Reject',TraceSegY.getDB_Reject);
  add('Fb_cliff',TraceSegY.getFb_cliff);
  add('Fe_cliff',TraceSegY.getFe_cliff);
  add('dB_Fb',TraceSegY.getDB_Fb);
  add('dB_Fe',TraceSegY.getDB_Fe);
  add('Year',TraceSegY.getYear);
  add('Day',TraceSegY.getDay);
  add('Hour',TraceSegY.getHour);
  add('Minute',TraceSegY.getMinute);
  add('Sec',TraceSegY.getSec);
  add('TimeCode',TraceSegY.getTimeCode);
  add('WeightFactor',TraceSegY.getWeightFactor);
  add('NR_rollSwitch',TraceSegY.getNR_rollSwitch);
  add('NR_firstTrace',TraceSegY.getNR_firstTrace);
  add('NR_lastTrace',TraceSegY.getNR_lastTrace);
  add('NMissRP',TraceSegY.getNMissRP);
  add('NiCh',TraceSegY.getNiCh);
  add('X_C',TraceSegY.getX_C);
  add('Y_C',TraceSegY.getY_C);
  add('inLine_no',TraceSegY.getInLine_no);
  add('xLine_no',TraceSegY.getXLine_no);
  add('S_LOC',TraceSegY.getS_LOC);
  add('S_Scale',TraceSegY.getS_Scale);
  end;
end;

destructor TWordsDictionary.Destroy;
begin
  TraceSegY.Free;
  Words.Free;
end;

function TWordsDictionary.getWordsDictionary: TDictionary<String, Double>;
begin
result:=words;
end;

end.
