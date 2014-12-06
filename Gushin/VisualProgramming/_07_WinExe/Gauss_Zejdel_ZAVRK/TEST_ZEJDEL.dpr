program TEST_ZEJDEL;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Un_ZZZ in 'Un_ZZZ.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
