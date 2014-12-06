unit Unit2;

interface

uses
  Windows, Messages,Dialogs, SysUtils, Classes, Graphics, Controls, Forms, 
  StdCtrls;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

{$R *.DFM}

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
begin
   
   if Password.Text='GOA' then
       ShowMessage('Ok!')
   else ShowMessage('ERROR!!!');
end;

end.
 
