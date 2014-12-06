unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Rab,
  Menus, About1, About2;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Button1: TButton;
    MainMenu1: TMainMenu;
    mnFile: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text:='10';
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j,o,tmp:integer;
    flag:boolean;
begin
  val(Edit1.Text,n,o);
  fillmas(n);
  ListBox1.Clear;
  ListBox2.Clear;
  Series1.Clear;
  Series2.Clear;
  for i:=1 to n do begin
    //str(x[i],s);
    ListBox1.Items.Add(InttoStr(i)+' '+IntToStr(x[i]));
    Series1.Add(x[i],IntToStr(i),clRed);
  end;
  flag:=false;
  for i:=1 to n do
      if not(prime(x[i])) then begin
         flag:=true;
         break;
      end;
  if flag=true then begin
    for i:=1 to n-1 do
        for j:=i+1 to n do
            if x[i]>x[j] then begin
               tmp:=x[i];
               x[i]:=x[j];
               x[j]:=tmp;
            end;
  end;
  for i:=1 to n do begin
    ListBox2.Items.Add(InttoStr(i)+' '+IntToStr(x[i]));
    Series2.Add(x[i],IntToStr(i),clGreen);
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  AboutBox1.ShowModal;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  AboutBox2.ShowModal;
end;

end.
