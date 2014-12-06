unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    mn_1: TMenuItem;
    mn_1_1: TMenuItem;
    mn_1_2: TMenuItem;
    mn_1_1_1: TMenuItem;
    mn_1_2_1: TMenuItem;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    PopupMenu2: TPopupMenu;
    mnC1: TMenuItem;
    mnC2: TMenuItem;
    mnC1_1: TMenuItem;
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mn_1_1_1Click(Sender: TObject);
    procedure mn_1_2_1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnC1_1Click(Sender: TObject);
    procedure mnC2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var L,H:integer;
begin
  if Button= mbRight then
        PopUpMenu1.Popup(Form1.Left+Button1.Left+Button1.Width ,
                      Form1.Top+Button1.Top +Button1.Height);
end;

procedure TForm1.mn_1_1_1Click(Sender: TObject);

begin

   ShowMessage(' Нажат пункт 1_1_1');


end;

procedure TForm1.mn_1_2_1Click(Sender: TObject);
begin
    ShowMessage(' Нажат пункт 1_2_1');
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
    //ShowMessage('Ok! PopupMenu');
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if Button= mbRight then
        PopUpMenu2.Popup(Form1.Left+Memo1.Left ,
                      Form1.Top+200);
end;

procedure TForm1.mnC1_1Click(Sender: TObject);
begin
      ShowMessage (' Нажат пункт C1_1');
end;

procedure TForm1.mnC2Click(Sender: TObject);
begin
     ShowMessage (' Нажат пункт C2');
end;

end.
