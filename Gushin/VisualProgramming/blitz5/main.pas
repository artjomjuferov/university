unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Author, Task;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    btn2: TBitBtn;
    mmo1: TMemo;
    dlgOpen1: TOpenDialog;
    N6: TMenuItem;
    btn1: TButton;
    edt1: TEdit;
    lst1: TListBox;
    lbl1: TLabel;
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
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

procedure TForm1.N4Click(Sender: TObject);
begin
  AboutBox1.ShowModal;
end;

procedure TForm1.N2Click(Sender: TObject);
var n_f:string;
begin
   dlgOpen1.InitialDir:=ExtractFilePath(Application.ExeName);
   if dlgOpen1.Execute then begin
      n_f:= dlgOpen1.FileName;
      mmo1.Lines.LoadFromFile(n_f);
   end;
end;

end.
