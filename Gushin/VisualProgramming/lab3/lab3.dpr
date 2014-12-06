program lab3;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Author in 'Author.pas' {AboutBox},
  Task in 'Task.pas' {AboutBox1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox1, AboutBox1);
  Application.Run;
end.
