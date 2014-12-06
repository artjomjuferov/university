unit Un_RAB;

interface
     Uses Windows,SysUtils,Graphics;
   const m=41;n=41;
   type tMas=array[1..m,1..n]of real;


   var Mas1,Mas4,
       Mas2,Mas5,
       Mas3,Mas6 :tMas;
       MyColor:array[1..31]of TColor;//COLORS of IZOLINES

       flResult:Boolean=FALSE;
   procedure FillMas(Variant:integer;var Mas:TMas);
   procedure IZOTABL(TargetCanvas:TCanvas;zagl:string;z:tMas;m,n:integer;
                               SX,SY,u0,v0:integer;
                               hh,izo_gr:real; Legenda:Boolean);

implementation
   procedure FillMas(Variant:integer;var Mas:TMas);
      var ii,i,j:integer;
          t:real;
    begin
        for i:=1 to m do
           for j:=1 to n do begin
        Case  Variant of
      1: t:=i;
      2: t:=j;
      3: t:=SQRT(SQR(i-21)+SQR(j-21));
      4: t:=Sin((j-1)*2*Pi/(n-1))*Cos(Pi/2-(i-1)*Pi/(m-1));
      5: t:=Sin((j-1)*2*Pi/(n-1))*Sin((i-1)*2*Pi/(m-1));
      6: t:=SQRT(i*j);
        end;//case

      Mas[i,j]:=t;
      end;
    end;
procedure IZOTABL(TargetCanvas:TCanvas;zagl:string;z:tMas;m,n:integer;
                               SX,SY,u0,v0:integer;
                               hh,izo_gr:real;
                               Legenda:Boolean);
   const    eps=1e-3;

       var    i,j,u1,u2,v1,v2,u3,v3,kizo:integer;
            xi,xj,xk,yi,yj,yk,zi,zj,zk,cx,cy:real;
            xmin,xmax,ymin,ymax,zmin,zmax,izo,h:real;
            st:string;  cl:TColor;
     {--------------------------------------------}
        function x(j:integer):real;
          begin x:=(1.0/(n-1))*(j-1);end;{ x }

     {--------------------------------------------}
       function y(i:integer):real;
          begin y:=1.0-(1.0/(m-1))*(i-1);end;{ y }

          {--------------------------------------------------------------------}
 procedure IZOTRG(TargetCanvas:TCanvas);
          var i,u1,u2,u3,v1,v2,v3:integer;
              xr1,xr2,xr3,yr1,yr2,yr3:real;
              fl1,fl2,fl3:boolean;
              cl:TColor;
              BEGIN
          if (abs(zi-zj)<1e-7) and(abs( zi-zk)<1e-7) then exit;

   {Main loop}for i:=1 to kizo do begin
                izo:=zmin+(i-1)*h;  cl:=myColor[i];
                TargetCanvas.Pen.Color:=cl;
                if abs(izo-izo_gr)<1e-3 then TargetCanvas.Pen.Width:=3
                                        else TargetCanvas.Pen.Width:=2;

                fl1:=false;fl2:=false;fl3:=false;
         {First side}if (abs(zi-zj)>1e-3)and((zi-izo)*(zj-izo)<=0)
                            then{Interpol}   begin fl1:=true;
                            xr1:=xi+(xj-xi)/(zj-zi)*(izo-zi);
                            yr1:=yi+(yj-yi)/(zj-zi)*(izo-zi);
                            u1:=u0+round(xr1*cx);
                            v1:=v0-round(yr1*cy);
                                             end;
         {Second side}if(abs(zj-zk)>1e-3)and((zk-izo)*(zj-izo)<=0)
                            then{Interpol}   begin  fl2:=true;
                            xr2:=xj+(xk-xj)/(zk-zj)*(izo-zj);
                            yr2:=yj+(yk-yj)/(zk-zj)*(izo-zj);
                            u2:=u0+round(xr2*cx);
                            v2:=v0-round(yr2*cy);
                                             end;
          {Third side}if(abs(zk-zi)>1e-3)and((zi-izo)*(zk-izo)<=0)
                            then{Interpol}  begin   fl3:=true;
                            xr3:=xk+(xi-xk)/(zi-zk)*(izo-zk);
                            yr3:=yk+(yi-yk)/(zi-zk)*(izo-zk);
                            u3:=u0+round(xr3*cx);
                            v3:=v0-round(yr3*cy);
                                             end;
   if fl1 and fl2 then Begin
                        TargetCanvas.MoveTo(u1,v1);
                        TargetCanvas.LineTo(u2,v2);
                        End;
   if fl1 and fl3 then Begin
                        TargetCanvas.MoveTo(u1,v1);
                        TargetCanvas.LineTo(u3,v3);
                        End;
   if fl2 and fl3 then Begin
                        TargetCanvas.MoveTo(u2,v2);
                        TargetCanvas.LineTo(u3,v3);
                        End;
                                end;{Loop izolines}
           TargetCanvas.Pen.Width:=1;
       end;{IZOTRG}
{----------------------------------------------------------------------}

 procedure FillTRG;{Заполнение треугольника "конопушками" -> берег }
      var arr_trg:array[1..3]of tPoint;
       begin   With arr_trg[1] do begin
       x:=u0+round(xi*sx);   y:=v0-round(yi*sy); end;
               With arr_trg[2] do begin
       x:=u0+round(xj*sx);   y:=v0-round(yj*sy); end;
               With arr_trg[3] do begin
       x:=u0+round(xk*sx);   y:=v0-round(yk*sy); end;
      TargetCanvas.Pen.Color:=clSilver;
      TargetCanvas.Brush.Color:=clSilver;
      TargetCanvas.Brush.Style:=bsDiagCross;
      TargetCanvas.Polygon(arr_trg);
      TargetCanvas.Pen.Color:=clBlack;
      TargetCanvas.Brush.Style:=bsClear;
       end;
  {===========================================================}
         Begin { IzoTabl}
       TargetCanvas.Pen.Color:=clBlack;
       u1:=u0;v1:=v0-SY;u2:=u0+SX; v2:=v0;
       TargetCanvas.Rectangle(u1,v1,u2,v2);
       TargetCanvas.TextOut((u1+u2) div 2 -Length(zagl) div 2,
                                                        v1-15,zagl);

           cx:=SX;cy:=SY;
          zmin:=1e10; zmax:=-1e10;
    for i:=1 to m do for j:=1 to n do
      if z[i,j]<777 then begin
       if z[i,j]<zmin then zmin:=z[i,j];
       if z[i,j]>zmax then zmax:=z[i,j];
                        end;
 

  
  if hh<0 then begin
        h:=(zmax-zmin)/24;kizo:=25;end
          else begin       h:=hh;
                           kizo:=round((zmax-zmin+hh/2)/hh)+1;
                           zmin:=round((zmin-hh/2)/hh)*hh;{Кратно h!}
                                end;
    {LEGENDA}if Legenda then 
          for i:=1 to kizo do begin
                izo:=zmin+(i-1)*h;  cl:=myColor[i];
                TargetCanvas.Pen.Color:=cl;
                TargetCanvas.Font.Color:=clWhite;
                if abs(izo-izo_gr)<1e-3 then TargetCanvas.Pen.Width:=3
                                        else TargetCanvas.Pen.Width:=2;
               STR(izo:6:3,st);
               with TargetCanvas do begin
                   MoveTo(u0+SX+70,i*18);LineTo(u0+SX+100,i*18);
                   TextOut(u0+SX+105,i*18-5 ,st);
               end;//with
          end;



   For i:=1 to m-1 do
      for j:=1 to n-1 do BEGIN
       xi:=x(j);xj:=x(j);xk:=x(j+1);
       yi:=y(i);yj:=y(i+1);yk:=y(i);
       zi:=z[i,j];zj:=z[i+1,j];zk:=z[i,j+1];
       if (zi<777)and(zj<777)and(zk<777) then IZOTRG(TargetCanvas)
                                      else FillTRG;{}
       xi:=x(j);xj:=x(j+1);xk:=x(j+1);
       yi:=y(i+1);yj:=y(i+1);yk:=y(i);
       zi:=z[i+1,j];zj:=z[i+1,j+1];zk:=z[i,j+1];
       if (zi<777)and(zj<777)and(zk<777) then IZOTRG(TargetCanvas)
                                      else FillTRG;{}
                          END;
       End; {IZOTABL}

 Begin  //SHKALA COLORS
   myColor[1]:=RGB(0,0,250);
   myColor[2]:=RGB(0,50,250);
   myColor[3]:=RGB(0,100,250);
   myColor[4]:=RGB(0,150,250);
   myColor[5]:=RGB(0,200,250);
   myColor[6]:=RGB(0,250,250);
   myColor[7]:=RGB(0,250,200);
   myColor[8]:=RGB(0,250,150);
   myColor[9]:=RGB(0,250,100);
   myColor[10]:=RGB(0,250,50);

   myColor[11]:=RGB(0,250,0);
   myColor[12]:=RGB(50,250,0);
   myColor[13]:=RGB(100,250,0);
   myColor[14]:=RGB(150,250,0);
   myColor[15]:=RGB(200,250,0);
   myColor[16]:=RGB(250,250,0);
   myColor[17]:=RGB(250,200,0);
   myColor[18]:=RGB(250,150,0);
   myColor[19]:=RGB(250,100,0);
   myColor[20]:=RGB(250,50,0);

   myColor[21]:=RGB(250,0,0);
   myColor[22]:=RGB(250,0,50);
   myColor[23]:=RGB(250,0,100);
   myColor[24]:=RGB(250,0,150);
   myColor[25]:=RGB(250,0,200);
   myColor[26]:=RGB(250,0,250);
   myColor[27]:=RGB(200,0,250);
   myColor[28]:=RGB(150,0,250);
   myColor[29]:=RGB(100,0,250);
   myColor[30]:=RGB(50,0,250);
   myColor[31]:=RGB(0,0,250);

end.
