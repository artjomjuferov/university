unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Author, Task, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    btn1: TBitBtn;
    stat1: TStatusBar;
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.N5Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  AboutBox1.ShowModal;
end;


end.
