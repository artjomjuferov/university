program LIBMAN;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Un_lab4 in 'Un_lab4.pas',
  Result in 'Result.pas' {frResult},
  About in 'About.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrResult, frResult);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
