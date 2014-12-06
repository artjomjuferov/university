unit TASK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrTASK = class(TForm)
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frTASK: TfrTASK;

implementation

{$R *.dfm}

procedure TfrTASK.FormCreate(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('Task.txt');
end;

end.
