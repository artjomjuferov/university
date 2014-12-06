unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ArrowCha, ExtCtrls, TeeProcs, Chart, Work,
  StdCtrls, Buttons, Menus, Author, Task;

type
  TForm1 = class(TForm)
    cht1: TChart;
    Series1: TArrowSeries;
    btn1: TButton;
    edt1: TEdit;
    edt2: TEdit;
    cht2: TChart;
    Series2: TArrowSeries;
    cht3: TChart;
    Series3: TArrowSeries;
    lst1: TListBox;
    Series4: TArrowSeries;
    Series5: TArrowSeries;
    btn2: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  i,step:Integer;
  x1,y1:real;
  s1,s2,s3,s4:string;
begin
  nMax:=StrToInt(edt1.text);
  lMax:=StrToInt(edt2.text);
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  lst1.Clear;
  fillmas;
  step:=0;
  for i:=1 to nMax do begin
      Series1.AddArrow(step,0,step+mas[i].x,mas[i].y,IntToStr(i));
      step:=step+lMax;
  end;

  x1:=0;
  y1:=0;
  for i:=1 to nMax do begin
      Series2.AddArrow(x1,y1,x1+mas[i].x,y1+mas[i].y,IntToStr(i));
      x1:=x1+mas[i].x;
      y1:=y1+mas[i].y;
  end;
  Series4.AddArrow(0,0,x1,y1,IntToStr(nMax+1));

  x1:=0;
  y1:=0;
  for i:=1 to nMax do begin
      Series3.AddArrow(0,0,mas[i].x,mas[i].y,'0');
      x1:=x1+mas[i].x;
      y1:=y1+mas[i].y;
      Str(mas[i].len:0:0,s1);
      Str(mas[i].ang:0:0,s2);
      Str(mas[i].x:0:0,s3);
      Str(mas[i].y:0:0,s4);
      lst1.Items.Add(IntToStr(i)+' '+s1+' '+s2+' '+s3+' '+s4);
  end;
  x1:=x1/nMax;
  y1:=y1/nMax;
  Series5.AddArrow(0,0,x1,y1,'0');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edt1.text:=IntToStr(nMax);
  edt2.text:=IntToStr(lMax);
  btn1Click(Sender);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  AboutBox1.ShowModal;
end;

end.
