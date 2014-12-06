unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    PaintBox1: TPaintBox;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormPaint(Sender: TObject);
  var i,r,xc,yc:integer;
   Rec: TRect;
begin
    with PaintBox1, Canvas do begin
     Brush.Color:=clWhite;
     FillRect(ClientRect);

  //�����
     for i:=1 to 10 do
     Pixels[10+i*10,10]:=clRed;
//�����
     pen.Color:=clNavy;Pen.Width:=2;
     MoveTo(250,20);LineTo(150,140);
     Pen.Style:=psDot; Pen.Width:=1;
     MoveTo(250,40);LineTo(150,160);
     //�������������
     pen.Color:=clGreen; Pen.Style:=psSolid;
     Brush.Color:=clYellow;
     Rectangle(20,30,40,50);
     //�����������"  �������������
     Brush.Style:=bsClear;
     Rectangle(50,30,70,50);
     //������
     Brush.Style:=bsSolid; Brush.Color:=clYellow;
     Ellipse(20,70,70,90);
//����������
     Brush.Style:=bsClear;
     R:=20;  xc:=100;yc:=100;
     Ellipse(xc-r,yc-r,xc+r,yc+r);
//�������������
     Pen.Color:=clNavy; pen.Width:=2;
      Polyline([Point(40, 110), Point(20, 160), Point(70, 130),
    Point(10, 130), Point(60, 160), Point(40, 110)]);
//�������
    Brush.Color:=clFuchsia;
    Polygon([Point(110, 10), Point(180, 10),
    Point(200, 50), Point(150, 120)]);
//����
  Rec := ClientRect;
  Arc(Rec.Left, Rec.Top, Rec.Right, Rec.Bottom,
   Rec.Right, Rec.Bottom, Rec.Right, Rec.Top);
   //������
   Brush.Style:=bsBDiagonal;//bsDiagCross;
   Brush.Color:=clGreen;
   Pie(Rec.Left, Rec.Top, Rec.Right, Rec.Bottom,
     Rec.Left, Rec.Bottom, Rec.Right, Rec.Bottom);
     // �����
     Pen.Color:=clRed; Brush.Style:=bsDiagCross;
     Chord(Rec.Left, Rec.Top, Rec.Right, Rec.Bottom,
   Rec.Right, Rec.Bottom, Rec.Right, Rec.Top);
   end;//with
end;

end.
