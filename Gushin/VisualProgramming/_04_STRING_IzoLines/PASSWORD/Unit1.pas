unit Unit1;

interface

uses
  Windows, Messages,Dialogs, SysUtils, Classes, Graphics, Controls, Forms, 
  StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
   Uses Unit2;
procedure TForm1.Button1Click(Sender: TObject);
begin
   PasswordDlg.Password.Text:='';
   
   PasswordDlg.ShowModal;
   
end;

end.
