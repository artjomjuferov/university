program Test_01;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Rab_Unit01 in 'Rab_Unit01.pas',
  Avtor in 'Avtor.pas' {AboutBox},
  Text in 'Text.pas' {frText};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrText, frText);
  Application.Run;
end.
