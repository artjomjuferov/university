unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Buttons;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Chart1: TChart;
    Series1: TLineSeries;
    Button1: TButton;
    Chart2: TChart;
    Series2: TLineSeries;
    BitBtn1: TBitBtn;
    Chart3: TChart;
    Series3: TLineSeries;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 const NN = 25;
var
  Form1: TForm1;
  Mas:array[1..NN]of real;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
   var i:integer;
begin
   Memo1.Lines.LoadFromFile('Readme.txt');
   for i:=1 to NN do
      Mas[i]:=1e-5*exp(i);
   
   Button1Click(Sender);
   end;

procedure TForm1.Button1Click(Sender: TObject);
   var i:integer;  st:string;
begin
    ListBox1.Clear;
    Series1.Clear;
    Series2.Clear;
    Series3.Clear;
   for i:=1 to NN do begin
      STR(Mas[i]:10:3,st);
      ListBox1.Items.Add(IntToStr(i)+' '+st);
      Series1.Add(Mas[i],IntToStr(i));
      Series2.Add(Mas[i],IntToStr(i));
      Series3.AddXY(Mas[i],i);
   end;
   with  Series3  do begin
    YValues.Order:=loAscending;
    YValues.Sort;
    Repaint;
  end;

end;

end.
