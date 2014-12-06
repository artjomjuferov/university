
program splash;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  SplashFrm in 'SplashFrm.pas' {SplashForm};

{$R *.RES}
begin
  Application.Initialize;
  { Create the splash screen }
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;   // Display the splash screen
  SplashForm.Update; // Update the splash screen to ensure it gets drawn

  { This while loop simply uses the TTimer component on the SplashForm
    to simulate a lengthy process. }
  while SplashForm.tmMainTimer.Enabled do
    Application.ProcessMessages;

  Application.CreateForm(TMainForm, MainForm);
  SplashForm.Hide;  // Hide the splash screen
  SplashForm.Free;  // Free the splash screen
  Application.Run;
end.
