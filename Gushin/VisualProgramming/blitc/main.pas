unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, work,
  Buttons, Menus, About, About1;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    ListBox1: TListBox;
    ListBox2: TListBox;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Series2: TLineSeries;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i,count,tmp,p,j,t:integer;
begin
  val(Edit1.Text,n,p);
  Fill(n);
  ListBox1.Clear;
  ListBox2.Clear;
  Series1.Clear;
  Series2.Clear;

  for i:=1 to n do begin
      ListBox1.Items.Add(IntToStr(i)+' '+IntToStr(mas[i]));
      Series1.Add(mas[i],IntToStr(i),clRed);
  end;

  count := 0;
  for i:=1 to n do begin
    tmp := mas[i];
    while tmp>0 do begin
      count := tmp mod 10;
      tmp:=tmp div 10;
    end;
    if count =6 then
      Break;
  end;

  if count=6 then begin
     for i:=1 to n do
         for j:=1 to n do
              if mas[i]>mas[j] then begin
                 t:=mas[i];
                 mas[i]:=mas[j];
                 mas[j]:=t;
              end;
  end;

  for i:=1 to n do begin
      ListBox2.Items.Add(IntToStr(i)+' '+IntToStr(mas[i]));
      Series2.Add(mas[i],IntToStr(i),clBlue);
  end;
end;


procedure TForm1.N1Click(Sender: TObject);
begin
    AboutBox.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  s:string;
begin
   Edit1.Text:=IntToStr(n);
   Button1Click(Sender);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  AboutBox1.ShowModal;
end;

end.
