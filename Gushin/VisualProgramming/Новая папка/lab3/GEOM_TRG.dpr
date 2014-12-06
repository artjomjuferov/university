program GEOM_TRG;

uses
  Forms,
  Main in 'Main.pas' {frMain},
  Un_TRG in 'Un_TRG.pas',
  Author in 'F:\Lab4(blitz ñ TList)\Author.pas' {AboutBox},
  Task in 'F:\Lab4(blitz ñ TList)\Task.pas' {AboutBox1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrMain, frMain);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox1, AboutBox1);
  Application.Run;
end.
