program TEST_GRID;

uses
  Forms,
  Main_GR in 'Main_GR.pas' {frMain},
  UN_Rab in 'UN_Rab.pas',
  Avtor in 'Avtor.pas' {AboutBox},
  TASK in 'TASK.pas' {frTASK};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrMain, frMain);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrTASK, frTASK);
  Application.Run;
end.
