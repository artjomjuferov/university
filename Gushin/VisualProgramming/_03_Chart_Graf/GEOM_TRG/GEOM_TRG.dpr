program GEOM_TRG;

uses
  Forms,
  Main in 'Main.pas' {frMain},
  Un_TRG in 'Un_TRG.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrMain, frMain);
  Application.Run;
end.
