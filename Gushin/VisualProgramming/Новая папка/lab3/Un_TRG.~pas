unit Un_TRG;

interface
  uses
  SysUtils, Classes, Graphics,Math;
   Const NNN=500;
   Type
      tRec=record X,Y:real end;
      tMas=array[1..NNN]of tRec;
      tMatrix=array[0..1,0..1] of real;

   var k:integer=0;
       SelK:integer=0;
       Mas,SelMas,OutMas,forCircle,Selmas1:tMas;
       KolPoints:integer;
       flPoints:Boolean=FALSE;
       flOutPoints:Boolean=FALSE;
       flOutAB:Boolean=FALSE;
       flRmin:Boolean=FALSE;
       flRmin1:Boolean=FALSE;
       flRmax:Boolean=FALSE;
       Xc,Yc,Alpha,Xr,Yr,Xo,Yo,Xo1,Yo1,RMin,RMin1,Rmax,Xp,Yp,Xp1,Yp1:real;
       Matrix :tMatrix;
       LX,LY:integer;
       xcross,ycross:real;
   procedure DrawPoints(TargetCanvas:TCanvas;Mas:tMas;K:integer;
                        SX,SY,u0,v0:integer;Color:TColor);
   procedure DrawTRG(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
   procedure matrixRotate(var m: tMatrix; x:real);
   procedure ApplyMatToPoint(PointIn:TRec; var PointOut: TRec;
                          mat:tMatrix; Xc,Yc:real);
   procedure DrawOutAB(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
   procedure FindCross(P1,P2,P3,P4:TRec;var Xr,Yr:real);
   procedure FindAlphaA(P1,P2,P3:TRec;var Alpha:real);
   procedure DrawRmin(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
                        procedure DrawRmin1(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
   procedure DrawRmax(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
implementation

procedure DrawRmin(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
      var i,j,u1,v1,u2,v2,r:integer;
        cx,cy:real;
    begin
       with TargetCanvas do BEGIN
         Pen.Color:=clSilver;  cx:=SX;cy:=SY;
         Font.Color:=clBlack; Font.Name:='Small Fonts';
         Font.Size:=7;
         Brush.Color:=clFuchsia;
            u1:= u0+round(Xp*cx);
            v1:= v0-round(Yp*cy);
            Ellipse(u1-2,v1-2,u1+2,v1+2);

            u1:= u0+round(Xo*cx);
            v1:= v0-round(Yo*cy);
            Ellipse(u1-2,v1-2,u1+2,v1+2);

            Brush.Style:=bsClear;
            r:=round(Rmin*cx);
            Ellipse(u1-r,v1-r,u1+r,v1+r);
            Brush.Style:=bsSolid;
       END;//with
      end;

      procedure DrawRmin1(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
      var i,j,u1,v1,u2,v2,r:integer;
        cx,cy:real;
    begin
       with TargetCanvas do BEGIN
         Pen.Color:=clSilver;  cx:=SX;cy:=SY;
         Font.Color:=clBlack; Font.Name:='Small Fonts';
         Font.Size:=7;
         Brush.Color:=clFuchsia;
            u1:= u0+round(Xp1*cx);
            v1:= v0-round(Yp1*cy);
            Ellipse(u1-2,v1-2,u1+2,v1+2);

            u1:= u0+round(Xo1*cx);
            v1:= v0-round(Yo1*cy);
            Ellipse(u1-2,v1-2,u1+2,v1+2);

            Brush.Style:=bsClear;
            r:=round(Rmin1*cx);
            Ellipse(u1-r,v1-r,u1+r,v1+r);
            Brush.Style:=bsSolid;
       END;//with
      end;

   procedure DrawRmax(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
      var i,j,u1,v1,u2,v2,r:integer;
        cx,cy:real;
      begin
          with TargetCanvas do BEGIN
         Pen.Color:=clSilver;  cx:=SX;cy:=SY;
         Font.Color:=clBlack; Font.Name:='Small Fonts';
         Font.Size:=7;
         Brush.Color:=clFuchsia;


            u1:= u0+round(Xo*cx);
            v1:= v0-round(Yo*cy);
            Ellipse(u1-2,v1-2,u1+2,v1+2);

            Brush.Style:=bsClear;
            r:=round(Rmax*cx);
            Ellipse(u1-r,v1-r,u1+r,v1+r);
            Brush.Style:=bsSolid;
       END;//with
      end;
      
   procedure FindAlphaA(P1,P2,P3:TRec;var Alpha:real);
      var b,c,a2,b2,c2,CA:real;
      begin
         a2:=SQR(P2.X-P3.X)+SQR(P2.Y-P3.Y);
         b2:=SQR(P1.X-P3.X)+SQR(P1.Y-P3.Y);
         c2:=SQR(P1.X-P2.X)+SQR(P1.Y-P2.Y);
         b:=SQRT(b2);  c:=SQRT(c2);
         CA:=(b2+c2-a2)/2/b/c;
         Alpha:=Arccos(CA);

      end;


procedure FindCross(P1,P2,P3,P4:TRec;var Xr,Yr:real);
var
  D1,D2,D3,Lam,Xa,Xb1,Xb,Xc,Ya,Yb1,Yb,Yc,rr:real;
begin
  Xa:=P1.X;
  Xb1:=P2.X;
  Ya:=P1.Y;
  Yb1:=P2.Y;// A'B'
  Xb:=P3.X;
  Xc:=P4.X;
  Yb:=P3.Y;
  Yc:=P4.Y; // BC
  D1:=Ya-Yb1;
  D2:=Xb1-Xa;
  D3:=Xa*Yb1-Xb1*Ya;
  rr:= D1*(Xc-Xb)+D2*(Yc-Yb);
  if rr=0 then begin
    Xr:=Xc;
    Yr:=Ya;
  end
  else begin
    Lam:=-(D3+Xb*D1+Yb*D2)/rr;
    Xr:=Xb+Lam*(Xc-Xb);
    Yr:=Yb+Lam*(Yc-Yb);
  end;
end;


   procedure DrawOutAB(TargetCanvas:TCanvas;
                        SX,SY,u0,v0:integer);
    var i,j,u1,v1,u2,v2:integer;
        cx,cy:real;
    begin
       with TargetCanvas do BEGIN
         Pen.Color:=clSilver;  cx:=SX;cy:=SY;
         Font.Color:=clBlack; Font.Name:='Small Fonts';
         Font.Size:=7;
         Brush.Color:=clNavy;
            Pen.Style:=psDot;
            u1:= u0+round(Xr*cx);
            v1:= v0-round(Yr*cy);
            u2:= u0+round(Selmas[2].X*cx);
            v2:= v0-round(Selmas[2].Y*cy);
            MoveTo(u1,v1);LineTo(u2,v2);

            u1:= u0+round(Xr*cx);
            v1:= v0-round(Yr*cy);
            u2:= u0+round(Selmas[3].X*cx);
            v2:= v0-round(Selmas[3].Y*cy);
            MoveTo(u1,v1);LineTo(u2,v2);

            u1:= u0+round(Xr*cx);
            v1:= v0-round(Yr*cy);
            u2:= u0+round(Outmas[2].X*cx);
            v2:= v0-round(Outmas[2].Y*cy);
            MoveTo(u1,v1);LineTo(u2,v2);

            Pen.Style:=psSolid;
            u1:= u0+round(Outmas[1].X*cx);
            v1:= v0-round(Outmas[1].Y*cy);
            u2:= u0+round(Outmas[2].X*cx);
            v2:= v0-round(Outmas[2].Y*cy);
            MoveTo(u1,v1);LineTo(u2,v2);
        Brush.Color:=clWhite;
        for i:=1 to 2 do begin
            u1:= u0+round(Outmas[i].X*cx);
            v1:= v0-round(Outmas[i].Y*cy);
            Ellipse(u1-7,v1-7,u1+7,v1+7);
            TextOut(u1-4,v1-4,chr(Ord('A')+i-1));
        end;
        Brush.Color:=clYellow;
        u1:= u0+round(Xr*cx);
        v1:= v0-round(Yr*cy);
        Ellipse(u1-3,v1-3,u1+3,v1+3);
       END;//with
    end;

procedure matrixRotate(var m: tMatrix; x:real);
var
  sX,cX:real;

begin
  sX:=sin(x);cX:=cos(x);

  M[0,0]:=cX;   M[0,1]:=-sX;
  M[1,0]:=sX;   M[1,1]:=cX;

end;

   procedure ApplyMatToPoint(PointIn:TRec; var PointOut: TRec;
                          mat:tMatrix; Xc,Yc:real);
var
  x,y:real;
begin

  x:=((pointIn.x-Xc)*mat[0,0])+((PointIn.y-Yc)*mat[0,1]);
  y:=((pointIn.x-Xc)*mat[1,0])+((PointIn.y-Yc)*mat[1,1]);

   PointOut.x:=x+Xc;  PointOut.y:=y+Yc;
end;

procedure DrawTRG(TargetCanvas:TCanvas;SX,SY,u0,v0:integer);
var
  i,j,u1,v1,u2,v2:integer;
  cx,cy:real;
  p1,p2,p3,p4:TRec;
begin
  with TargetCanvas do BEGIN
    Pen.Color:=clBlack;(*Aqua*);
    cx:=SX;
    cy:=SY;
    Font.Color:=clBlack;
    Font.Name:='Small Fonts';
    Font.Size:=7;
    Brush.Color:=clWhite;
    for i:=1 to 3 do begin
        u1:=u0+round(forCircle[i].X*cx);
        v1:=v0-round(forCircle[i].Y*cy);
        j:=i+1;
        if j>3 then j:=1;
        u2:=u0+round(forCircle[j].X*cx);
        v2:=v0-round(forCircle[j].Y*cy);
        MoveTo(u1,v1);
        LineTo(u2,v2);
    end;
    MoveTo(u0+round(forCircle[2].X*cx),v0-round(forCircle[2].Y*cy));
    LineTo(u0+round(forCircle[4].X*cx),v0-round(forCircle[4].Y*cy));
    Xc:=0;
    Yc:=0;
    for i:=1 to 4 do begin
        u1:= u0+round(forCircle[i].X*cx);
        v1:= v0-round(forCircle[i].Y*cy);
        Xc:=Xc+forCircle[i].X / 3;
        Yc:=Yc+forCircle[i].Y / 3;
        Ellipse(u1-7,v1-7,u1+7,v1+7);
        TextOut(u1-4,v1-4,chr(Ord('A')+i-1));
    end;
  end;
end;

procedure DrawPoints(TargetCanvas:TCanvas;Mas:tMas;K:integer;
                        SX,SY,u0,v0:integer;Color:TColor);
   var i,u1,v1,u2,v2:integer;
       cx,cy:real;
   begin
      with TargetCanvas do BEGIN
         Brush.Color:=Color;
         cx:=SX;cy:=SY;
         for i:=1 to K do begin
            u1:= u0+round(mas[i].X*cx);
            v1:= v0-round(mas[i].Y*cy);
            Ellipse(u1-4,v1-4,u1+4,v1+4);
         end;
      END;//with
   end;
end.
