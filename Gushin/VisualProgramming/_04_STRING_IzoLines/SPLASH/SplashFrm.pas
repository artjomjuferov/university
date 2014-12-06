
unit SplashFrm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TSplashForm = class(TForm)
    tmMainTimer: TTimer;
    Image1: TImage;
    Label1: TLabel;
    procedure tmMainTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

procedure TSplashForm.tmMainTimerTimer(Sender: TObject);
begin
  tmMainTimer.Enabled := False;
end;

end.
