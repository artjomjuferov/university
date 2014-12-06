program MKE_STAC;

uses
  Forms,
  MainStac in 'MainStac.pas' {frMainStac},
  Uni_mke in 'Uni_mke.pas',
  Params in 'Params.pas' {frParams},
  Resolv in 'Resolv.pas' {frResolv};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrMainStac, frMainStac);
  Application.CreateForm(TfrParams, frParams);
  Application.CreateForm(TfrResolv, frResolv);
  Application.Run;
end.
