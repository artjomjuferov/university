unit Un_WWW;

interface
  uses  Windows, SysUtils, Classes, Graphics;
  const n_fbmp='My_BMP.bmp';
        
  TYPE
   tRec=record X,Y,Mark:integer end;
   pR=^tRec;
   tMas=array[1..500]of TList;
const mNEL=10000;mNUZ=10000; mLG=3000; m=1500;n=1500;
 TYPE    TMSV=array[1..mNEL,1..3]of integer;
         TVEC=array[1..mNUZ]of real; UK=^TVEC;
         TMG=array[1..mLG]of WORD;
         tMVGT=array[1..mLG]of real;
         TMuk=array[1..300]of UK;{}
  Var
    Path_DATA:string; 
    msv:TMSV;
    NEL,NUZ,LG,MS ,kVORTEX :integer;
    X,Y : tVec;
    arList,arListMKE:tMas;
    kUch:integer;//Ó×ÀÑÒÊÎÂ
    kUchMKE:integer;
    minX,maxX,minY,maxY,RazX,RazY:real;
    LX,LY:integer;
    flCountur:Boolean=FALSE;
    flBMP:Boolean=FALSE;
    flMKE:Boolean=FALSE;
    flPointsMKE:Boolean=FALSE;
    flElems:Boolean=FALSE;
    rMark:integer=1;
//---------- äëÿ WWW.exe ---------------------
    NN,NSeg,NHole,kUchWWW:integer;
    Mas_N:array[1..20]of integer;
    fn,fp:string;
    flPOLY:Boolean=FALSE;

Var
   minXSHABLON:real=0.0;
   maxXSHABLON:real=1.0;
   minYSHABLON:real=0.0;
   maxYSHABLON:real=1.0;
 //procedure DrawLine(Canva : TCanvas; x_b, y_b, x_e, y_e : integer);
 procedure set_list(var arList:tMas);
 procedure clear(var __l : TList);
 function __convert_x(__x : integer): real;
 function __convert_y(__y : integer): real;  
 function __deconvert_x(__x : real): integer;
 function __deconvert_y(__y : real): integer;
 
 procedure DrawElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
 procedure PrepareData(n_f:string);
 procedure PrepareDataEle(n_f:string);
implementation
{---------------------------------------------------------------}
procedure DrawElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
	 var i,x1,x2,x3,y1,y2,y3:integer;
             ii,jj,kk:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          //pen.Color:=clSilver;
          pen.Color := clBlack;
          cx:=SX/RazX;   cy:=SY/RazY;
        For i:=1 to   NEL do begin
           ii:=msv[i,1];jj:=msv[i,2];kk:=msv[i,3];
           x1:=u0+round((X[ii]-minX)*cx); y1:=v0-round((Y[ii]-minY)*cy);
           x2:=u0+round((X[jj]-minX)*cx); y2:=v0-round((Y[jj]-minY)*cy);
           x3:=u0+round((X[kk]-minX)*cx); y3:=v0-round((Y[kk]-minY)*cy);

           MoveTo(x1,y1);
           LineTo(x2,y2);LineTo(x3,y3);LineTo(x1,y1);
                       end;{ i }
        pen.Color:=clBlack;
    end;{with}
    end;//DrawElems
{----------------------------------------------------------------------}
 procedure PrepareData(n_f:string);
   var
      i,k:integer;
      F:TEXTFILE;
    Begin
  assignFile(f,n_f);Reset(f);
  Readln(f,NUZ,NEL);
  for i:=1 to nuz do      Readln(f,x[i],y[i]);
  for i:=1 to nel do 	  Readln(f,k,msv[i,1],msv[i,2],msv[i,3]);
   CloseFile(f);
End;
{----------------------------------------------------------------------}
 procedure PrepareDataEle(n_f:string); //n_f --> *.nod
   var
      i,k:integer;
      F:TEXTFILE;  st,n_fele:string;
 Begin
  st:=n_f;
  n_fele:=Copy(st,1,Length(st)-3)+'ele';//n_fele --> *.ele
  assignFile(f,n_f);Reset(f);
  Readln(f,NUZ);
  for i:=1 to nuz do      Readln(f,k,x[i],y[i]);
  CloseFile(f);

  assignFile(f,n_fele);Reset(f);
  Readln(f,NEL);
  for i:=1 to nel do 	  Readln(f,k,msv[i,1],msv[i,2],msv[i,3]);
  CloseFile(f);
End;
   //----------------------------------------------------------------------
procedure DrawLine(Canva : TCanvas; x_b, y_b, x_e, y_e : integer);
var old_pen : HPen;
    old_rop : integer;
begin
     old_pen := SelectObject(Canva.Handle, GetStockObject(BLACK_PEN));
     old_rop := SetROP2(Canva.Handle,R2_NOT);

     MoveToEx(Canva.Handle, x_b, y_b, NIL);
     LineTo(Canva.Handle, x_e, y_e);

     SetROP2(Canva.Handle, old_rop);
     SelectObject(Canva.Handle, old_pen);
end;
//-------------------------------------------------------------
procedure clear(var __l : TList);
var i : integer;
begin
     for i := 0 to __l.Count - 1 do
         dispose(__l.Items[i]);

     __l.clear;
end;
   //-----------------------------------------------------------------
   function __convert_x(__x : integer): real;
begin
     Result := minX + __x / LX * RazX;
end;

function __convert_y(__y : integer): real;
begin
     Result :=maxY - __y / LY * RazY;
end;
//------------------------------------------------------------
function __deconvert_x(__x : real): integer;
begin
     Result:=round((__x-minX)*LX/RazX);
end;

function __deconvert_y(__y : real): integer;
begin
     Result:=round((maxY-__y)*LY/RazY);
end;
//------------------------------------------------------------
procedure Set_list(var arList:tMas);
  var i:integer;
begin
   for i:=1 to 500 do
     arList[i]:=TList.Create;
end;
end.
