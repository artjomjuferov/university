unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Label5: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    Label6: TLabel;
    Edit4: TEdit;
    Chart1: TChart;
    Series1: TLineSeries;
    MainMenu1: TMainMenu;
    mnFile: TMenuItem;
    mnHelp: TMenuItem;
    mnAvtor: TMenuItem;
    mnText: TMenuItem;
    mnRazdel: TMenuItem;
    mnOut: TMenuItem;
    mnOpen: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure mnAvtorClick(Sender: TObject);
    procedure mnTextClick(Sender: TObject);
    procedure mnOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
   Uses Rab_Unit01,Avtor,Text;
procedure TForm1.FormCreate(Sender: TObject);
begin
   Edit1.Text:=IntToStr(a);
   Edit2.Text:=IntToStr(b);
   Label4.Caption:='c = '+IntToStr(a*b);
   Edit3.Text:=IntToStr(N);
   Edit4.Text:=IntToStr(K);
   //Fillmas;
   Button2Click(Sender);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   a:=StrToInt(Edit1.Text);
   b:=StrToInt(Edit2.Text);
   c:=a*b;
   Label4.Caption:='c = '+IntToStr(c);
end;

procedure TForm1.Button2Click(Sender: TObject);
   var i:integer;
begin
   N:=StrToInt(Edit3.Text);
   K:=StrToInt(Edit4.Text);
   FillMas;
   ListBox1.Clear;  Series1.Clear;
   for i:=1 to N do  begin
      ListBox1.Items.Add(IntToStr(i)+' '+IntToStr(Mas[i]));
      Series1.Add(Mas[i],IntToStr(i),clRed);
   end;

end;

procedure TForm1.mnAvtorClick(Sender: TObject);
begin
   AboutBox.ShowModal;
end;

procedure TForm1.mnTextClick(Sender: TObject);
begin
   frText.ShowModal;
end;

procedure TForm1.mnOutClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
