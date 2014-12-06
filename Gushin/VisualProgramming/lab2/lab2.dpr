program lab2;

uses
  Forms,
  main in 'main.pas' {Form1},
  author in 'author.pas' {AboutBox},
  task in 'task.pas' {AboutBox1},
  Work in 'Work.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox1, AboutBox1);
  Application.Run;
end.
