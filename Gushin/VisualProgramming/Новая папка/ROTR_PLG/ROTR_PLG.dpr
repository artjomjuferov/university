program ROTR_PLG;

uses
  Forms,
  MainRotP in 'MainRotP.pas' {frMainRotP};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrMainRotP, frMainRotP);
  Application.Run;
end.
