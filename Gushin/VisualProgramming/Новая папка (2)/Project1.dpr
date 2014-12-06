program Project1;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Rab in 'Rab.pas',
  About1 in 'About1.pas' {AboutBox1},
  About2 in 'About2.pas' {AboutBox2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox1, AboutBox1);
  Application.CreateForm(TAboutBox2, AboutBox2);
  Application.Run;
end.
