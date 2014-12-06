program ChartArrows;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Rab_Vect in 'Rab_Vect.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
