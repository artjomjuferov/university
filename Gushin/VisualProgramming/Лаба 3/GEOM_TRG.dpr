program GEOM_TRG;

uses
  Forms,
  Main in 'Main.pas' {frMain},
  Un_TRG in 'Un_TRG.pas',
  About_Box in 'About_Box.pas' {AboutBox},
  Task in 'Task.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrMain, frMain);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
