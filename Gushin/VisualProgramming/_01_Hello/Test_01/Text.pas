unit Text;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrText = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frText: TfrText;

implementation

{$R *.dfm}

procedure TfrText.FormCreate(Sender: TObject);
begin
   Memo1.Clear;
   Memo1.Lines.LoadFromFile('MyText.txt');
end;

end.
