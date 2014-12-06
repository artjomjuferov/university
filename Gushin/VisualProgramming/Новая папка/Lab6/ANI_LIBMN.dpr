program ANI_LIBMN;

uses
  Forms,
  Main in 'Main.pas' {frMain},
  UN_LIBMN in 'UN_LIBMN.PAS',
  PARAMS in 'PARAMS.pas' {frParams},
  About in 'About.pas' {AboutBox},
  Task in 'Task.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrMain, frMain);
  Application.CreateForm(TfrParams, frParams);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
