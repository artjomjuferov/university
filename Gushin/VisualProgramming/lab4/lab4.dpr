program lab4;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Author in 'Author.pas' {AboutBox},
  Task in 'Task.pas' {AboutBox2},
  Work in 'Work.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox2, AboutBox2);
  Application.Run;
end.
