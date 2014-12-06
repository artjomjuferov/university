program lab1;

uses
  Forms,
  main in 'main.pas' {Form1},
  work in 'work.pas',
  About in 'About.pas' {AboutBox},
  About1 in 'About1.pas' {AboutBox1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox1, AboutBox1);
  Application.Run;
end.
