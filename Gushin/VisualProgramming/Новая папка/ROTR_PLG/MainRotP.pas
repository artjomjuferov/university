unit MainRotP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Menus;


type
  TfrMainRotP = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    ResetCube: TButton;
    XRot: TScrollBar;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    Animate1: TAnimate;
    Button1: TButton;
    Button2: TButton;
    Animate2: TAnimate;
    Animate3: TAnimate;
    mm: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject;var Action: TCloseAction);
     procedure Timer1Timer(Sender: TObject);
     procedure ResetCubeClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMainRotP: TfrMainRotP;

implementation

uses About, Task;

{$R *.DFM}

Type
   Matrix=array[0..1,0..1] of real;
   TRPoint=record x,y:real;  end;
Var
  DoubleBuffer : TBitmap;  BlankBuffer: TBitmap;
  PntsOut,PntsOut1:array[1..13] of TRPoint;
  Pnts,Pnts1:array[1..13] of TPoint;
  RPnts,RPnts1:array[1..13] of TRPoint;
  XAng:real;
  MyRect:TRect;
procedure matrixRotate(var m: Matrix; x:real);
var
  sX,cX:real;

begin
  sX:=sin(x);cX:=cos(x);

  M[0,0]:=cX;   M[0,1]:=-sX;
  M[1,0]:=sX;   M[1,1]:=cX;

end;
procedure ApplyMatToPoint(PointIn:TRPoint; var PointOut: TRPoint;
                          mat:Matrix;fl:Boolean);
var
  x,y:real;
begin
 if fl then begin
  x:=(pointIn.x*mat[0,0])+(PointIn.y*mat[0,1]);
  y:=(pointIn.x*mat[1,0])+(PointIn.y*mat[1,1]);
 end else begin
  x:=(pointIn.x*mat[0,0])+(PointIn.y*mat[1,0]);
  y:=(pointIn.x*mat[0,1])+(PointIn.y*mat[1,1]);
 end;
   PointOut.x:=x;  PointOut.y:=y;
end;
procedure InitPLG;
begin // COORDINATES  REAL!
  RPnts[1].X:=-100;   RPnts[1].y:=-150;
  RPnts[2].X:=100;    RPnts[2].y:= -150;
  RPnts[3].X:=100;    RPnts[3].y:=0;
  RPnts[4].X:=150;    RPnts[4].y:=0;
  RPnts[5].X:=150;    RPnts[5].y:=100;
  RPnts[6].X:=0;      RPnts[6].y:=100;
  RPnts[7].X:=0;      RPnts[7].y:=150;
  RPnts[8].X:=-100;   RPnts[8].y:=150;
  RPnts[9].X:=-100;   RPnts[9].y:=100;
  RPnts[10].X:=-150;  RPnts[10].y:=100;
  RPnts[11].X:=-150;  RPnts[11].y:=-100;
  RPnts[12].X:=-100;  RPnts[12].y:=-100;


  RPnts1[1].X:=-50;  RPnts1[1].y:=-50;
  RPnts1[2].X:=50;   RPnts1[2].y:= -50;
  RPnts1[3].X:=50;   RPnts1[3].y:=50;
  RPnts1[4].X:=-50;  RPnts1[4].y:=50;
end;

procedure DrawPLG;
begin

     DoubleBuffer.Canvas.Pen.Color:=clWhite;
     Pnts[13]:=Pnts[1];
     DoubleBuffer.Canvas.PolyLine(Slice(Pnts,13));
     Pnts1[5]:=Pnts1[1];
     DoubleBuffer.Canvas.PolyLine(Slice(Pnts1,5));
end;
procedure TfrMainRotP.FormCreate(Sender:TObject);
   var i,X,Y:integer;
begin
  MyRect:=RECT(0,0,600,600);
  DoubleBuffer:=TBitmap.Create;
  DoubleBuffer.Height:=600;  DoubleBuffer.Width:=600;

  BlankBuffer:=TBitmap.Create;
  BlankBuffer.Height:=600;    BlankBuffer.Width:=600;
   BlankBuffer.Canvas.Brush.Color:= clNavy;
   BlankBuffer.Canvas.rectangle(0,0,600,600);//Clear + Frame
   for i:=1 to 1000 do begin
       BlankBuffer.Canvas.Brush.Color:=Random(1000000);
       X:=random(600);Y:=random(600);
       BlankBuffer.Canvas.Ellipse(X-2,Y-2,X+2,Y+2);
   end;

  InitPLG;    XAng:=0;
end;
procedure TfrMainRotP.FormClose(Sender:Tobject; var Action:TCloseAction);
begin
  BlankBuffer.Free; DoubleBuffer.Free;
end;
procedure TfrMainRotP.Timer1Timer(Sender:TObject);
var
  M:Matrix;    Count,i:Integer;
Begin
  XAng:=XAng+XRot.Position;
  matrixRotate(m,(PI*XAng)/180);
  for i:=1 to 12 do    begin
     ApplyMatToPoint(RPnts[i],PntsOut[i],M,TRUE);
    Pnts[i]:=Point(trunc(PntsOut[i].x+270),trunc(PntsOut[i].y+270));
  end;
  for i:=1 to 4 do    begin
     ApplyMatToPoint(RPnts1[i],PntsOut1[i],M,FALSE);
    Pnts1[i]:=
    Point(trunc(PntsOut1[i].x+270),trunc(PntsOut1[i].y+270));
  end;

   //CLEAR DoubleBuffer
  DoubleBuffer.Canvas.CopyRect(MyRECT,BlankBuffer.Canvas,MyRECT);

  DrawPLG;
  PaintBox1.Canvas.CopyRect(MyRECT, DoubleBuffer.Canvas,MyRECT);
end;
procedure TfrMainRotP.ResetCubeClick(Sender:TObject);
begin
  XRot.Position:=0;   XAng:=0;

end;
procedure TfrMainRotP.CheckBox1Click(Sender: TObject);
begin
   Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TfrMainRotP.Button2Click(Sender: TObject);
begin
     Animate1.Stop;  Animate2.Stop;  Animate3.Stop;
end;

procedure TfrMainRotP.Button1Click(Sender: TObject);
begin
    Animate1.Open:=TRUE;
    Animate1.Active:=TRUE;
    Animate2.Open:=TRUE;
    Animate2.Active:=TRUE;
    Animate3.Open:=TRUE;
    Animate3.Active:=TRUE;



end;

procedure TfrMainRotP.N6Click(Sender: TObject);
begin
AboutBox.showmodal;
end;

procedure TfrMainRotP.N5Click(Sender: TObject);
begin
Form1.showmodal;
end;

procedure TfrMainRotP.N3Click(Sender: TObject);
begin
Application.Terminate;
end;

end.

