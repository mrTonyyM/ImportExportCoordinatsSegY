unit UImportFormModal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,UTSegY,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.TreeView,UProfileData,
  FMX.ListBox;

type
  TImportFormModal = class(TForm)
    edOpenImportFile: TEdit;
    btEdOpenImportFile: TEditButton;
    dgOpen2: TOpenDialog;
    cbxProfileName: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbxCDP: TComboBox;
    cbxCoordinateX: TComboBox;
    cbxCoordinateY: TComboBox;
    startImport: TButton;
    procedure btEdOpenImportFileClick(Sender: TObject);
    procedure edOpenImportFileChangeTracking(Sender: TObject);
    procedure readHeaderImportFile();
    procedure cbxCoordinateXChange(Sender: TObject);
    procedure cbxCoordinateYChange(Sender: TObject);
    procedure cbxCDPChange(Sender: TObject);
    procedure cbxProfileNameChange(Sender: TObject);
    procedure startImportClick(Sender: TObject);
    procedure importCoordinatesToSegY();

    procedure setTxtFileImport(txtFileImport:string);
    procedure setIndexProf(Index:Byte);
    procedure setIndexCDP(Index:Byte);
    procedure setIndex_X(Index:Byte);
    procedure setIndex_Y(Index:Byte);
  private
    FtxtFileImport:String;
    FindexProf,FindexCDP,Findex_X,Findex_Y:Byte;
  public
    property txtFileImport:String read FtxtFileImport write setTxtFileImport;
    property indexProf:Byte read FindexProf write setIndexProf;
    property indexCDP :Byte read FindexCDP  write setIndexCDP;
    property index_X  :Byte read Findex_X   write setIndex_X;
    property index_Y  :Byte read Findex_Y   write setIndex_Y;
  end;

var
  ImportFormModal: TImportFormModal;
  path:String;
implementation

{$R *.fmx}

procedure TImportFormModal.btEdOpenImportFileClick(Sender: TObject);
var
dir:String;
begin
if dgOpen2.Execute then
edOpenImportFile.Text:=dgopen2.FileName else exit;
  if SelectDirectory('УКАЖИТЕ ПУТЬ К СЕЙСМИЧЕСКИМ РАЗРЕЗАМ:','',dir)then
                                    path:=IncludeTrailingPathDelimiter(dir) else
                showmessage('Необходимо указать путь к сейсмическим разрезам!');

end;

procedure TImportFormModal.cbxCDPChange(Sender: TObject);
begin
  setIndexCDP(cbxCDP.ItemIndex);
end;

procedure TImportFormModal.cbxCoordinateXChange(Sender: TObject);
begin
  setIndex_X(cbxCoordinateX.ItemIndex);
end;

procedure TImportFormModal.cbxCoordinateYChange(Sender: TObject);
begin
  setIndex_Y(cbxCoordinateY.ItemIndex);
end;

procedure TImportFormModal.cbxProfileNameChange(Sender: TObject);
begin
  setIndexProf(cbxProfileName.ItemIndex);
end;

procedure TImportFormModal.edOpenImportFileChangeTracking(Sender: TObject);
begin
  setTxtFileImport(edOpenImportFile.Text);
  try
    readHeaderImportFile;
  except
    showmessage('При чтении заголовка произошла ощибка');
  end;
end;

procedure TImportFormModal.importCoordinatesToSegY;
var
dataFile:TDataFile;
segY:TSegY;
j,i:Cardinal;
begin
FormatSettings.decimalSeparator:='.';
dataFile:=TDataFile.Create;
  try
    try
      dataFile.read(TxtFileImport,indexProf,indexCDP,index_X,index_Y);      
    except
      showmessage('При чтении текстового файла произошла ошибка');
    end;
        for j := 0 to pred(dataFile.profiles.Count) do begin
          try
          SegY:=TSegY.Create(path+datafile.profiles[j].Name_ProFile+'.sgy');
          SegY.readSegY;
          for I := 0 to pred(segY.countRealTraces) do begin        
            if (segY.getCDPNum(i) = dataFile.profiles[j].CDPoints[i].Num_CDP) then begin
              segy.setX_S(i,LongInt(round(dataFile.profiles[j].CDPoints[i].Coord_X)));
              segy.setY_S(i,LongInt(round(dataFile.profiles[j].CDPoints[i].Coord_Y)));
              segy.setScale_Position(i,SmallInt(1));
            end else begin
              showmessage('Номер ОГТ SegY не соответсвует номеру ОГТ текстового файла'); break;
            end;
          end;
        finally
          segY.writeSegY;
          SegY.Free;
        end; 
      end;     
  finally
    dataFile.Free;
  end;
//  showmessage('Работа окончена!');
end;

procedure TImportFormModal.readHeaderImportFile();
var
tF:TStringList;
bufTf:TStringList;
i:Byte;
begin
cbxProfileName.Clear;
cbxCDP.Clear;
cbxCoordinateX.Clear;
cbxCoordinateY.Clear;
  if TxtFileImport<>'' then begin
    try
    tf:=TStringList.Create;
    bufTf:=TStringList.Create;
      try
      tF.LoadFromFile(TxtFileImport);
      except
      ShowMessage('При открытии файла что-то пошло не так. Проверьте существование файла');
      end;
    ExtractStrings([#9],[' '],PChar(tF[0]),bufTf);
      for I := 0 to pred (bufTf.Count) do begin
        cbxProfileName.Items.Add(bufTf[i]);
        cbxCDP.Items.Add(bufTf[i]);
        cbxCoordinateX.Items.Add(bufTf[i]);
        cbxCoordinateY.Items.Add(bufTf[i]);
      end;
    finally
      tf.Free;
      bufTf.Free;
    end;
  end else showmessage('Необходимо указать путь к текcтовому файлу');
end;

procedure TImportFormModal.setIndexCDP(Index: Byte);
begin
  self.FindexCDP:=Index;
end;

procedure TImportFormModal.setIndexProf(Index: Byte);
begin
  self.FindexProf:=Index;
end;

procedure TImportFormModal.setIndex_X(Index: Byte);
begin
  self.Findex_X:=Index;
end;

procedure TImportFormModal.setIndex_Y(Index: Byte);
begin
  self.Findex_Y:=Index;
end;

procedure TImportFormModal.setTxtFileImport(txtFileImport: string);
begin
self.FtxtFileImport:=txtFileImport;
end;

procedure TImportFormModal.startImportClick(Sender: TObject);
begin
  try
    importCoordinatesToSegY;
  except
    showMessage('При импорте координат произошла ошибка!');
  end;
  ImportFormModal.Close;
  showmessage('Работа окончена!');
end;

end.
