program blitz4;

uses
  Forms,
  Main in '..\lab4\Main.pas' {Form1},
  Author in '..\lab4\Author.pas' {AboutBox},
  Task in '..\lab4\Task.pas' {AboutBox2},
  Work in '..\lab4\Work.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox2, AboutBox2);
  Application.Run;
end.
