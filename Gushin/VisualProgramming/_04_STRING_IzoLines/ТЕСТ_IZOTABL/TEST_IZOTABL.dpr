program TEST_IZOTABL;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Un_RAB in 'Un_RAB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
