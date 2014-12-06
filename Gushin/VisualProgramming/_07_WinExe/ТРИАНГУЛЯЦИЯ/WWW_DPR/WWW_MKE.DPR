program Www_MKE;

uses
  Forms,
  MainWWW in 'MainWWW.pas' {frMainWWW},
  Un_WWW in 'Un_WWW.pas',
  TxtWWW in 'TxtWWW.pas' {frTxtWWW};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrMainWWW, frMainWWW);
  Application.CreateForm(TfrTxtWWW, frTxtWWW);
  Application.Run;
end.
