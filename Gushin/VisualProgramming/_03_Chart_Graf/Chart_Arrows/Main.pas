unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ArrowCha, ExtCtrls, TeeProcs, Chart, Buttons,
  StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Series1: TArrowSeries;
    Chart2: TChart;
    Series2: TArrowSeries;
    Chart3: TChart;
    ArrowSeries1: TArrowSeries;
    ListBox1: TListBox;
    Series3: TArrowSeries;
    Series4: TArrowSeries;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
   Uses Rab_Vect, Math;
procedure TForm1.Button1Click(Sender: TObject);
  var i : integer; s1, s2, s3, s4, st : string;
      rX, rY, rU, rV, sU, sV, SrModul, SrUgol : real;
begin
   N := StrToInt(Edit1.Text);
   FillMas;
   ListBox1.Clear; Series1.Clear;
   rX := 0;
   for i:=1 to N do begin
      STR(MasRec[i].Modul:5:0,s1);
      STR(MasRec[i].Ugol:5:0,s2);
      st := IntToStr(i) + s1+s2;
      ListBox1.Items.Add(st);
      rU := MasUV[i,1];  rV := MasUV[i,2];
      Series1.AddArrow(rX,0,rX + rU,rV,IntToStr(i));
      rX := rX + 10;
   end;

   Series2.Clear;    rX := 0; rY :=0; sU:=0; sV :=0;
   for i:=1 to N do begin
     rU := MasUV[i,1];  rV := MasUV[i,2];
     sU := sU + rU; sV := sV + rV;
      Series2.AddArrow(rX,rY,rX + rU,rY +rV,IntToStr(i));
      rX := rX + rU; rY := rY + rV;
   end;
   Series3.Clear;
   Series3.AddArrow(0,0,sU,sV);

   ArrowSeries1.Clear;    rX := 0; rY :=0;
   for i:=1 to N do begin
     rU := MasUV[i,1];  rV := MasUV[i,2];
      ArrowSeries1.AddArrow(rX,rY,rX + rU,rY +rV,'0');
   end;
    Series4.Clear;
    sU := sU/N; sV := sV/N;
    Series4.AddArrow(0,0,sU,sV);

    srModul := SQRT(sU*sU + sV*sV);
    srUgol  := arctan2(sV,sU)/Pi*180;
    STR(srModul:5:1,s1); STR(srUgol:5:1,s2);
    s1 := 'cpModul='+s1+'; cpUgol='+s2;
    StatusBar1.Panels[0].Text := s1;
 end;
end.
