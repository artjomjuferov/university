unit init;

interface

uses
      Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Task, About, ExtCtrls, ImgList,
  ToolWin, ComCtrls;

type
    Point = record
        x,y : real;
    end;
    TPoint = array[1..10000] of Point;
    TMatrix=array[0..1,0..1] of real;
var
    fileNameinput : string = '1.txt';
    fileNameoutput : string = '2.txt';
    t,t2,OutMas: Tpoint;
    cnt,r : integer;
    ans,p1,p2 : Point;
    CntPoint : integer = 0;
    FlagTriangle : boolean = false;
    FlagCircle : boolean = false;
    FlagNormal: boolean = false;
    FlagMiddle: boolean = false;
    Matrix: TMatrix;
    xc,yc,xo,yo,Rmax : real;
procedure DrawTriangle(TargetCanvas : TCanvas; SX,SY,u0,v0 : integer);
procedure DrawPoint(Targetpaint : TpaintBox;sx,sy,u0,v0 :integer;color : Tcolor);
procedure MatrixRotate(var m : Tmatrix; x : real);
procedure DrawNormal(TargetCanvas : TCanvas;sx,sy,u0,v0:integer;b,e,q:point);
procedure Middleline(TargetCanvas : TCanvas;sx,sy,u0,v0 : integer;b,e:point);
procedure makepoint(var p1,p2:Point;i,j:integer);



implementation

procedure DrawTriangle(TargetCanvas : TCanvas; SX,SY,u0,v0 : integer);
var
   i,u1,v1,u2,v2 : integer;
   cx,cy : real;
begin
       with TargetCanvas do begin
            Pen.Color := clblue;
            cx := SX;
            cy := SY;
            //Brush.Color := clwhite;
            t2[4] := t2[1];
            for i := 1 to 3 do begin
                u1:= u0 + round(t2[i].X * cx);
                v1:= v0 - round(t2[i].Y * cy);
                u2:= u0 + round(t2[i+1].X * cx);
                v2:= v0 - round(t2[i+1].Y * cy);
                MoveTo(u1,v1);
                LineTo(u2,v2);
            end;
       end;//with
end;

procedure DrawPoint(Targetpaint : TpaintBox;sx,sy,u0,v0 :integer;color : Tcolor);
var
   i,u1,v1 : integer;
begin
     with Targetpaint.Canvas do begin
          pen.color := color;
          brush.Color := color;
          for i := 1 to cnt do begin
              u1 := u0 + round(t[i].x * sx);
              v1 := v0 - round(t[i].y * sy);
              ellipse(u1 - 2,v1 - 2,u1 + 2,v1 + 2);
          end;
     end;
end;

procedure makepoint(var p1,p2:Point;i,j:integer);
var j1:integer;
begin
  j1:=6-i-j;
  p1.X:=0.5*(t2[i].X+t2[j1].X);
  p1.Y:=0.5*(t2[i].Y+t2[j1].Y);
  p2.x:=0.5*(t2[j].X+t2[j1].x);
  p2.y:=0.5*(t2[j].y+t2[j1].y);
end;

procedure MatrixRotate(var m : Tmatrix; x : real);
var
   sx,cx : real;
begin
    sX:=sin(x);
    cX:=cos(x);
    M[0,0]:=cX;
    M[0,1]:=-sX;
    M[1,0]:=sX;
    M[1,1]:=cX;
end;


procedure drawnormal(TargetCanvas : TCanvas;sx,sy,u0,v0 : integer;b,e,q:point);
var
   u1,v1,u2,v2 : integer;
   k,b1 : real;
begin
    k:=(b.x-e.x)/(e.y-b.y);
    b1:=q.y-k*q.x;
    ans.x:=(-b1-b.x*(e.y-b.y)/(e.x-b.x)+b.y)/(k+1/k);
    ans.y:=k*ans.x+b1;
   with TargetCanvas do begin
        u1 := u0 + round(q.x * sx);
        v1 := v0 - round(q.y * sy);
        u2 := u0 + round(ans.x * sx);
        v2 := v0 - round(ans.y * sy);
        pen.color := clgreen;
        MoveTo(u1,v1);
        LineTo(u2,v2);
        Pen.Color := clSilver;
          Font.Color:=clBlack;
          Font.Name:='Small Fonts';
          Font.Size:=7;
        Brush.Color:=clFuchsia;
          Ellipse(u2 - 2,v2 - 2,u2 + 2,v2 + 2);
          Brush.Style := bsClear;
          u1:=u0+round(t2[3].x*sx);
          v1:=v0-round(t2[3].y*sy);
          r := Round(Sqrt((u1-u2)*(u1-u2)+(v1-v2)*(v1-v2)));
          Ellipse(u2 - r,v2 - r,u2 + r,v2 + r);
          Brush.Style:=bsSolid;
    end;


end;

procedure Middleline(TargetCanvas:TCanvas;sx,sy,u0,v0 : integer;b,e:point);
var
   u1,v1,u2,v2 : integer;
   cx,cy : real;
begin
       with TargetCanvas do begin
            Pen.Color := clred;
            cx := SX;
            cy := SY;
            //Brush.Color := clwhite;
                u1:= u0 + round(b.x * cx);
                v1:= v0 - round(b.y * cy);
                u2:= u0 + round(e.x * cx);
                v2:= v0 - round(e.y * cy);
                MoveTo(u1,v1);
                LineTo(u2,v2);
       end;//with
end;






end.
