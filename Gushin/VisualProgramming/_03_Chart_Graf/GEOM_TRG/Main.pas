unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ToolWin, StdCtrls, Buttons, ImgList;

type
  TfrMain = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    ImageList1: TImageList;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    ListBox2: TListBox;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    Panel4: TPanel;
    ImageList2: TImageList;
    Panel5: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Button1: TButton;
    procedure FormPaint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.DFM}
 Uses Un_TRG;
procedure TfrMain.FormPaint(Sender: TObject);
begin
   with PaintBox1, Canvas do begin
       Brush.Color:=clWhite;//clNavy;
       FillRect(ClientRect);
       if KolPoints>0 then
        DrawPoints(Canvas,Mas,K,Width,Height,0,Height,clBlack(*Yellow*));
       
       if flOutPoints then
        DrawOutTRG(Canvas,Width,Height,0,Height);
       if flOutAB then
        DrawOutAB(Canvas,Width,Height,0,Height);
       if flRmin then
        DrawRmin(Canvas,Width,Height,0,Height);
       if flRmax then
        DrawRmax(Canvas,Width,Height,0,Height);
       if SelK>0 then
        DrawTRG(Canvas,Width,Height,0,Height);
   end;//with
end;

procedure TfrMain.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var rX,rY:real;
      LX,LY:integer;
begin
  if ToolButton1.Down and(Button=mbLeft)then BEGIN
   LX:=PaintBox1.Width;LY:= PaintBox1.Height;
   Inc(k);
   ListBox1.Items.Add(IntToStr(k)+' '+InttoStr(X)+' '+InttoStr(Y));
   rX:=X/LX; rY:=1-Y/LY;
   mas[k].X:=rX; mas[k].Y:=rY;
   with PaintBox1.Canvas do begin
        Brush.Color:=clAqua; Pen.Color:= clNavy;
        Ellipse(X-2,Y-2,X+2,Y+2);
   end;
   END    else
   if ToolButton1.Down and(Button=mbRight)then BEGIN
      ToolButton1.Down:=FALSE;
      KolPoints:=k;
      StatusBar1.Panels[1].Text:=
                        'KolPoints='+InttoStr(KolPoints);
      Refresh;
   END else Refresh;

end;

procedure TfrMain.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   StatusBar1.Panels[0].Text:='X='+InttoStr(X)+
                            '; Y='+InttoStr(Y);
end;

procedure TfrMain.ToolButton4Click(Sender: TObject);
begin
   k:=0;  ListBox1.Clear;
   SelK:=0;ListBox2.Clear;
   flOutPoints:=FALSE;
   flOutAB:=FALSE;
   flRmin:=FALSE;
    flRmax:=FALSE;
    Panel4.Caption:='';
    StatusBar1.Panels[0].Text:='';
    StatusBar1.Panels[1].Text:='';
    StatusBar1.Panels[2].Text:='';
   Refresh;
end;

procedure TfrMain.SpeedButton1Click(Sender: TObject);
   var i,k:integer;
begin if ListBox1.Items.Count<2 then Exit;
       ListBox2.Clear; k:=  ListBox1.Items.Count-1;
      if ListBox1.SelCount=0 then begin
         SelK:=k+1;
         for i:=0 to k do   begin
            ListBox2.Items.Add(ListBox1.Items[i]);
            SelMas[i+1]:=Mas[i+1];
         end;
      end else begin

    for i:=0 to k do
       if ListBox1.Selected[i] then begin
          Inc(SelK);
          ListBox2.Items.Add(ListBox1.Items[i]);
          SelMas[SelK]:=Mas[i+1];
       end;
    end;//if
    Refresh;
end;

procedure TfrMain.ToolButton6Click(Sender: TObject);
  var i:integer;
begin
   flRmin:=FALSE;
    flRmax:=FALSE;
  //Поворот на 30 градусов  треугольника
  flOutAB:=FALSE;
  Alpha:=30*Pi/180;
  matrixRotate(Matrix,Alpha);
  for i:=1 to 3 do
     ApplyMatToPoint(Selmas[i],OutMas[i],Matrix,Xc,Yc);
  flOutPoints:=TRUE;
  Panel4.Caption:='Поворот треугольника на 30 градусов  ';
  Refresh;
end;

procedure TfrMain.ToolButton7Click(Sender: TObject);
  var i:integer;
begin
   flRmin:=FALSE;
    flRmax:=FALSE;
  //Поворот АВ на 90 градусов
  flOutPoints:=FALSE;
  Alpha:=90*Pi/180;
  matrixRotate(Matrix,Alpha);
  Xc:= (Selmas[1].X+Selmas[2].X)/2;
  Yc:= (Selmas[1].Y+Selmas[2].Y)/2;
  for i:=1 to 2 do
     ApplyMatToPoint(Selmas[i],OutMas[i],Matrix,Xc,Yc);
  FindCross(OutMas[1],OutMas[2],SelMas[2],SelMas[3],Xr,Yr);
  flOutAB:=TRUE;
  Panel4.Caption:='Поворот AB на 90 градусов  ';
  Refresh;
end;

procedure TfrMain.FormResize(Sender: TObject);
begin
   LX:=Panel2.Width;LY:=Panel2.Height;
   if LY<LX then LX:=LY;
   PaintBox1.Width:=LX;
   PaintBox1.Height:=LX;
end;

procedure TfrMain.ToolButton8Click(Sender: TObject);
   var i:integer;
begin
    flRmin:=FALSE;
    flRmax:=FALSE;
 //Поворот АВ на 30 градусов  относительно т. А
  flOutPoints:=FALSE;
  Alpha:=30*Pi/180;
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[1].X;
  Yc:= Selmas[1].Y;
  for i:=1 to 2 do
     ApplyMatToPoint(Selmas[i],OutMas[i],Matrix,Xc,Yc);
  FindCross(OutMas[1],OutMas[2],SelMas[2],SelMas[3],Xr,Yr);
  flOutAB:=TRUE;
  Panel4.Caption:='Поворот AB на 30 градусов вокруг т.А ';
  Refresh;
end;

procedure TfrMain.ToolButton9Click(Sender: TObject);
   var i:integer;
begin
   flRmin:=FALSE;
    flRmax:=FALSE;
 //Поворот АВ на 90 градусов  относительно т. А
  flOutPoints:=FALSE;
  Alpha:=90*Pi/180;
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[1].X;
  Yc:= Selmas[1].Y;
  for i:=1 to 2 do
     ApplyMatToPoint(Selmas[i],OutMas[i],Matrix,Xc,Yc);
  FindCross(OutMas[1],OutMas[2],SelMas[2],SelMas[3],Xr,Yr);
  flOutAB:=TRUE;
  Panel4.Caption:='Поворот АВ на 90 градусов  относительно т.А';
  Refresh;

end;

procedure TfrMain.ToolButton10Click(Sender: TObject);
var i:integer;
begin
   flRmin:=FALSE;
    flRmax:=FALSE;
  //Сдвиг стороны  треугольника
  flOutPoints:=FALSE;
  OutMas[1]:=SelMas[1];// A -> B
  OutMas[2].X:=SelMas[3].X+SelMas[2].X-SelMas[1].X;
  OutMas[2].Y:=SelMas[3].Y+SelMas[2].Y-SelMas[1].Y;
  Xr:= OutMas[2].X;  Yr:= OutMas[2].Y;
  flOutAB:=TRUE;
  Panel4.Caption:='Сдвиг стороны  треугольника(параллелограмм)';
  Refresh;
end;

procedure TfrMain.ToolButton11Click(Sender: TObject);
begin
    flOutPoints:=FALSE;
    flRmin:=FALSE;
    flRmax:=FALSE;
 //Высота из т.С (т. Косинусов)
 FindAlphaA(Selmas[1],Selmas[2],Selmas[3],Alpha);// Угол вершины А
 Alpha:=Pi/2-Alpha;// Угол поворота СА
 matrixRotate(Matrix,Alpha);
  Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг С!
  ApplyMatToPoint(Selmas[1],OutMas[1],Matrix,Xc,Yc);
  ApplyMatToPoint(Selmas[3],OutMas[2],Matrix,Xc,Yc);
  FindCross(OutMas[1],OutMas[2],SelMas[1],SelMas[2],Xr,Yr);
  Panel4.Caption:='Высота из т.С (т. Косинусов)';
  flOutAB:=TRUE;
  Refresh;

end;

procedure TfrMain.ToolButton12Click(Sender: TObject);
   var UgA,UgC:real;
       Po:TRec;
begin
   flOutAB:=FALSE;
   flOutPoints:=FALSE;
   flRmax:=FALSE;
  //Вписанная окружность
  FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// Угол вершины А
  Alpha:=UgA/2;// Угол поворота АB
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//Вокруг A!
  OutMas[1]:=Selmas[1];//A'
  ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'

  FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// Угол вершины C
  Alpha:=UgC/2;// Угол поворота CA
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг C!
  ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
  OutMas[4]:=Selmas[3]; //C'
  FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
  Po.X:=Xo; Po.Y:=Yo;  Xc:=Xo;Yc:=Yo;
  Alpha:=-(Pi/2-UgA/2);
  matrixRotate(Matrix,Alpha);
  ApplyMatToPoint(Selmas[1],OutMas[2],Matrix,Xc,Yc); //A'
  OutMas[1]:=Po;
  FindCross(OutMas[1],OutMas[2],Selmas[1],SelMas[3],Xp,Yp);
  Rmin:=SQRT(SQR(Xp-Xo)+SQR(Yp-Yo));
  Panel4.Caption:='Вписанная окружность';
  flRmin:=TRUE;
  Refresh;

end;

procedure TfrMain.ToolButton13Click(Sender: TObject);
   var X1,X2,Y1,Y2:real;
begin
    flOutAB:=FALSE;
   flOutPoints:=FALSE;
   flRmin:=FALSE;
  //Описанная окружность
  matrixRotate(Matrix,Pi/2);
  Xc:=(Selmas[1].X+Selmas[2].X)/2;
  Yc:=(Selmas[1].Y+Selmas[2].Y)/2;
   ApplyMatToPoint(Selmas[1],OutMas[1],Matrix,Xc,Yc); //A'
   ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'
  Xc:=(Selmas[1].X+Selmas[3].X)/2;
  Yc:=(Selmas[1].Y+Selmas[3].Y)/2;
   ApplyMatToPoint(Selmas[3],OutMas[3],Matrix,Xc,Yc); //C'
   ApplyMatToPoint(Selmas[1],OutMas[4],Matrix,Xc,Yc); //A'
  FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
  RMax:= SQRT(SQR(Selmas[1].X-Xo)+SQR(Selmas[1].Y-Yo));
  Panel4.Caption:='Описанная окружность';
  flRmax:=TRUE;
  Refresh;
end;

procedure TfrMain.ToolButton5Click(Sender: TObject);
begin
    flRmin:=FALSE;
    flRmax:=FALSE;
  //Сдвиг стороны  треугольника
  flOutPoints:=FALSE;
  OutMas[1]:=SelMas[1];// A -> B
  OutMas[2].X:=SelMas[3].X+SelMas[2].X-SelMas[1].X;
  OutMas[2].Y:=SelMas[3].Y+SelMas[2].Y-SelMas[1].Y;
  Xr:= OutMas[2].X;  Yr:= OutMas[2].Y;
  
  FindCross(OutMas[1],OutMas[2],SelMas[2],SelMas[3],Xr,Yr);
  flOutAB:=TRUE;
  Panel4.Caption:='Пересечение диагоналей параллелограмма';
  Refresh;
end;
procedure TfrMain.Button1Click(Sender: TObject);
  var p1,p2,p3,a,b:tRec;
      r,x1,x2,x3,y1,y2,y3,SS1,SS2:real;
      s1,s2:string;
begin
//Тест площади тр-ка по ф. |p2-p1; p3-p1|
    p1:=SelMas[1]; p2:=SelMas[2]; p3:=SelMas[3];
    a.x:=p2.X - p1.X; a.y:=p2.y - p1.y;
    b.x:= p3.X - p1.X; b.y:=p3.y - p1.y;
    SS2:=a.x*b.y-b.x*a.y;
//  OLD method with determinate
    x1:=p1.X; x2:=p2.X; x3:=p3.X;
    y1:=p1.y; y2:=p2.y; y3:=p3.y;
    SS1:=x1*y2+x2*y3+x3*y1-x1*y3-x2*y1-x3*y2;
    STR(SS1:7:3,s1);  STR(SS2:7:3,s2);
    StatusBar1.Panels[2].Text:='SS1 ='+s1+'; SS2 ='+s2;
    Panel4.Caption:='SS1 -> определитель; SS2 -> векторное произв.';
end;

end.
