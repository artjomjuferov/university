unit Uni_mke;

interface
      uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls;

   var //parameters
         aco1:real=1.0;   aco2:real=1.0;
         Qgl:real=0.0;
         h_IZO:real=-1;  gl_IZO:real=50;
         CC1:real=0;CC2:real=10;
//---------------------------------------------------------------------
 CONST   mNEL=10000;mNUZ=10000; mLG=2000; m=3000;n=3000;
 TYPE    TMSV=array[1..mNEL,1..3]of integer;
         TVEC=array[1..mNUZ]of real; UK=^TVEC;
         TMG=array[1..mLG]of WORD;
         tMVGT=array[1..mLG]of real;
         TMuk=array[1..300]of UK;{}
   VAR   msv,MSVNew:TMSV;
         XScr,YScr , XNew,YNew: tVec;
         rvec,BVec,CO,X,Y:TVEC;
         Variant:integer=0;
         
         minx,maxx,   miny,maxy,RazX,RazY :real;
         NGT: TMG; vgt:tMVGT;
         AMat,ARMAT:TMuk;
         arGrid1:array[1..2,1..4]of string;
         arGrid2:array[1..4]of string;
         clMy:array[0..30]of TColor;
  VAR
    CAPofGRAPH,PathWrite:string;
var  NEL,NUZ,LG,MS,ShMSV,ShMSVNew, kFrontPoint,kInterPoints :integer;
     flNumberDots   :Boolean;
//-------------------   U_MKE03  --------------------
    const   N_ISELAND=5; N_List=200;
            mShirMSV=150;// ¯ËËÌ‡ Ï‡ÚËˆ˚ Ò‚ˇÁÌÓÒÚË
    TYPE
   tRec=record X,Y,Mark:integer end;
   pR=^tRec;
   tRecXY=record X,Y:real end;
   tRecXYM=record X,Y:real;Mark:integer end;
   pRXY=^tRecXY;
   pRXYM=^tRecXYM;
   tRecSegm=record ii,jj,kk:integer; UGOL:real end;
   pRecSegm=^tRecSegm;
   tMas=array[1..N_List]of TList;
   tMasSegm=array[1..N_ISELAND+4]of TList;
   tTabFront=array[1..mNUZ,1..2]of integer;
   tTabSGM=array[1..mNUZ,1..3]of integer;
   tMasPiramid= array[1..mNUZ]of TList;
   tMasElemArea=array[1..mNEL]of real;
   tCenterHoles=array[1..10,1..2]of real;
   tMasNom=array[1..mNUZ]of integer;
   tMasSTR=array[1..mNUZ]of string[20];
VAR
    MasNom:tMasNom;
    CenterHoles : tCenterHoles ;
    InterPoints,Piramides:TList;
    NomPiramid,NomABS1,NomABS2,RabISELANDS:integer;
    MasPiramid:tMasPiramid;
    MasElemArea:tMasElemArea;
    MasMarks:tTabFront;
    MasKESegm:tTabSgm;
    arList,NewArList:tMas;
    arListFront:tMasSegm;
    arListSegm:tMasSegm;
//---------------------------------------
    flElems:Boolean=FALSE;
    flSegms:Boolean=FALSE;
    flInterPoints:Boolean=FALSE;
    flNODES:Boolean=FALSE;
    flMiMa:Boolean=FALSE;
    MinArea,MaxArea,CO_Min,CO_Max:real;
    MinElemArea,MaxElemArea:real;
   NomMinArea,NomMaxArea,NomMin,NomMax,NSEGM:integer;

//---------------------------------------
  procedure MiMax(x:tvec; var xmin,xmax:real);
   procedure ResolvDif;
   procedure IZOLINES(TargetCanvas:TCanvas;zagl:string; u0,v0,SX,SY:integer;
                                       zv:tVec; hh,izo_gr:real; flprn:integer);
   procedure PrepareDataEle(n_f:string);
   procedure SORT_Nods(xak,yak:tVec;NN:integer;var MasNom:tMasNom);
   procedure ChangeMatSV(MatSV:tMSV;NEL:integer; MasNom:tMasNom;NN:integer;
                                            var MatSVNew:tMSV);
   function ShirMSV(MatSV:tMSV;NEL:integer):integer;
   Function NewNom(OldNom:integer):integer;
   function Area(ii,jj,kk:integer):Double;
   function  ElemArea(NomElem:integer):real;
   procedure Set_list(var arList:tMas);
   procedure TestAreas;
   procedure DrawMiMaxElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
   procedure DrawElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
   procedure DrawFrontTT(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
   procedure DrawInterPoints(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
   procedure VisualBand(TargetCanvas:TCanvas;MSV:tMSV;
                                       SX,SY,u0,v0,kPrint:integer);
   procedure DrawSegms(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
  implementation
  procedure DrawSegms(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
	 var i,x1,x2,y1,y2:integer;
             ii,jj,kk:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=2;
        For i:=1 to   NSEGM do begin
           //  ii, jj  OLD numbers
           ii:=MasKESegm[i,1];jj:=MasKESegm[i,2];kk:=MasKESegm[i,3];
           Case kk of
           1:   pen.Color:=clBlue;
           2:   pen.Color:=clYellow;
           3:   pen.Color:=clAqua;
           4:   pen.Color:=clFuchsia;
             else
           pen.Color:=clRed;
           End;//Case
           // XNew, YNew - OLD!!!   after interchange
           x1:=u0+round((XNew[ii]-minX)*cx);
           y1:=v0-round((YNew[ii]-minY)*cy);
           x2:=u0+round((XNew[jj]-minX)*cx);
           y2:=v0-round((YNew[jj]-minY)*cy);
           MoveTo(x1,y1);  LineTo(x2,y2);
        end;{ i }
        Pen.Color:=clBlack; Pen.Width:=1;
    end;{with}
    end;//DrawSegms
   procedure ValGranic(Variant:integer);
    var   i,k,kkk,kf,k1,ir,nt,iKind,rNT,ii,jj,kk,LG1,LG2:integer;
          rVGT,rY,rH:real;rYmin,rYmax,rXmin:real;
          _p:^integer;
        begin
           kf:=MS-1;
          FOR kkk:=1 to 4 do begin
           LG1:=arListFront[kkk].Count-1;

           for k:=0 to LG1 do begin
               _p:=arListFront[kkk][k];
               nt:=_p^;// NEW numbers!!!
               Case Variant of
          0: begin
               rVGT:=X[nt];
             end;
          1: begin
               rVGT:=Y[nt];
             end;
          2: begin
               rVGT:=CC1;
             end;
              end;//case
               for k1:=1 to kf do begin
                           ir:=nt-k1;
                           if ir>=1 then begin
                       bvec[ir]:=bvec[ir]-amat[k1+1]^[ir]*rVGT;
                       amat[k1+1]^[ir]:=0;
                           end ;//if
                       ir:=nt+k1;
                           if ir<=nuz  then begin
                       bvec[ir]:=bvec[ir]-amat[k1+1]^[nt]*rVGT;
                       amat[k1+1]^[nt]:=0;
                           end;//if
               end; // k1
               amat[1]^[nt]:=1;bvec[nt]:=rVGT;
           end;//  k
          end;//kkk
          LG2:=arListFront[5].Count-1;
           for k:=0 to LG2 do begin
               _p:=arListFront[5][k];
               nt:=_p^;// NEW numbers!!!
               Case Variant of
          0: begin
               rVGT:=X[nt];
             end;
          1: begin
               rVGT:=Y[nt];
             end;
          2: begin
               rVGT:=CC2;
             end;
              end;//case
               for k1:=1 to kf do begin
                           ir:=nt-k1;
                           if ir>=1 then begin
                       bvec[ir]:=bvec[ir]-amat[k1+1]^[ir]*rVGT;
                       amat[k1+1]^[ir]:=0;
                           end ;//if
                       ir:=nt+k1;
                           if ir<=nuz  then begin
                       bvec[ir]:=bvec[ir]-amat[k1+1]^[nt]*rVGT;
                       amat[k1+1]^[nt]:=0;
                           end;//if
               end; // k1
               amat[1]^[nt]:=1;bvec[nt]:=rVGT;
           end;//  k
    end;

   procedure VisualBand(TargetCanvas:TCanvas;MSV:tMSV;
                                       SX,SY,u0,v0,kPrint:integer);
     var i,ii,jj,kk,u1,v1:integer;
         cx,cy:real;
     begin
        with TargetCanvas do begin
            if kPrint<>0 then Brush.Color:=clWhite
                         else Brush.Color:=clNavy;
            Rectangle(u0,v0-SY,u0+SX,v0);
            Pen.Color:=clYellow;
            cx:=SX/NUZ;cy:=cx;
            for i:=1 to NEL do begin
                 ii:=MSV[i,1];jj:=MSV[i,2];kk:=MSV[i,3];
                 u1:=u0+round(ii*cx);
                 v1:=v0-SY+round(jj*cy);
                 Ellipse(u1-1,v1-1,u1+1,v1+1);
                 v1:=v0-SY+round(kk*cy);
                 Ellipse(u1-1,v1-1,u1+1,v1+1);

                 u1:=u0+round(jj*cx);
                 v1:=v0-SY+round(ii*cy);
                 Ellipse(u1-1,v1-1,u1+1,v1+1);
                 v1:=v0-SY+round(kk*cy);
                 Ellipse(u1-1,v1-1,u1+1,v1+1);

                 u1:=u0+round(kk*cx);
                 v1:=v0-SY+round(jj*cy);
                 Ellipse(u1-1,v1-1,u1+1,v1+1);
                 v1:=v0-SY+round(ii*cy);
                 Ellipse(u1-1,v1-1,u1+1,v1+1);
            end;
            Pen.Color:=clBlack;
        end;//with
     end;

   procedure DrawInterPoints(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
	 var i,x1,y1,ii,Kol:integer;
             cx,cy:real;
             __pUZ:^integer;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=1;  Brush.Color:=clFuchsia;
       Kol:=InterPoints.Count-1;
           for i:=0 to Kol do begin
               __pUZ:=InterPoints.Items[i];
               ii:=__pUZ^;  //OLD number
               ii:=NewNom(ii); // New number after sorting
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               Ellipse(x1-3,y1-3,x1+3,y1+3);
           end;//i
          Brush.Color:=clWhite;
    end;{with}
    end;//DrawInterPoints

   procedure DrawFrontTT(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
     var i,x1,y1,ii,Kol:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=1;  Brush.Color:=clLime;
       Kol:=kFrontPoint;
           for i:=1 to Kol do begin
               ii:=MasMarks[i,1];// OLD numbers!!!
               ii:=NewNom(ii); // New number after sorting
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               Ellipse(x1-4,y1-4,x1+4,y1+4);
           end;//i
          Brush.Color:=clWhite;
    end;{with}
    end;//DrawInterPoints

   procedure DrawElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
	 var i,x1,x2,x3,y1,y2,y3:integer;
             ii,jj,kk:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          //pen.Color:=clSilver;
          Pen.Color:=clWhite;
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
//-------------------------------------------------------------------
procedure DrawMiMaxElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
	 var i,x1,x2,x3,y1,y2,y3:integer;
             ii,jj,kk:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          pen.Color:=clSilver;
          //Pen.Color:=clWhite;
          cx:=SX/RazX;   cy:=SY/RazY; Pen.Color:=clRed;
        i:=NomMinArea;
           ii:=msv[i,1];jj:=msv[i,2];kk:=msv[i,3];
           x1:=u0+round((X[ii]-minX)*cx); y1:=v0-round((Y[ii]-minY)*cy);
           x2:=u0+round((X[jj]-minX)*cx); y2:=v0-round((Y[jj]-minY)*cy);
           x3:=u0+round((X[kk]-minX)*cx); y3:=v0-round((Y[kk]-minY)*cy);

           MoveTo(x1,y1);
           LineTo(x2,y2);LineTo(x3,y3);LineTo(x1,y1);
        i:=NomMaxArea;
           ii:=msv[i,1];jj:=msv[i,2];kk:=msv[i,3];
           x1:=u0+round((X[ii]-minX)*cx); y1:=v0-round((Y[ii]-minY)*cy);
           x2:=u0+round((X[jj]-minX)*cx); y2:=v0-round((Y[jj]-minY)*cy);
           x3:=u0+round((X[kk]-minX)*cx); y3:=v0-round((Y[kk]-minY)*cy);

           MoveTo(x1,y1);
           LineTo(x2,y2);LineTo(x3,y3);LineTo(x1,y1);
        pen.Color:=clBlack;
    end;{with}
    end;//DrawElems

   procedure TestAreas;
    var i:integer; r:real;
    begin
    MinArea:=1e10;MaxArea:=-1e10;
       for i:=1 to NEL do begin
          r:=ElemArea(i);
          if r>MaxArea then begin
                              MaxArea:=r;
                              NomMinArea:=i;
          end;
          if r<MinArea then begin
                              MinArea:=r;
                              NomMaxArea:=i;
          end;
       end;
    end;

   procedure Set_list(var arList:tMas);
  var i:integer;
begin
   for i:=1 to N_List do
     arList[i]:=TList.Create;
end;
   function  ElemArea(NomElem:integer):real;
     var ii,jj,kk:integer;
         x1,x2,x3,y1,y2,y3:real;
     begin
        ii:=MSV[NomElem,1]; jj:=MSV[NomElem,2]; kk:=MSV[NomElem,3];
        x1:= X[ii]; x2:= X[jj]; x3:= X[kk];
        y1:= Y[ii]; y2:= Y[jj]; y3:= Y[kk];
        Result:=((x1*y2+x2*y3+x3*y1)-(x1*y3+x2*y1+x3*y2))/2;
     end;

    function Area(ii,jj,kk:integer):Double;
      Var x1,x2,x3,y1,y2,y3,r:Double;
    Begin
       x1:=x[ii];  x2:=x[jj];x3:=x[kk];
       y1:=y[ii];  y2:=y[jj];y3:=y[kk];
       r:=x2*y3+x1*y2+x3*y1-x2*y1-x3*y2-x1*y3;
       Area:=r;
    End;

   Function NewNom(OldNom:integer):integer;
    var i,k:integer;
   Begin
      k:=0;
      for i:=1 to NUZ do
         if OldNom=MasNom[i] then begin
                   k:=i; Break;
         end;
      NewNom:=k;
   End;

   function ShirMSV(MatSV:tMSV;NEL:integer):integer;
     var i,ii,jj,kk,max:integer;
     begin   max:=0;
          for i:=1 to NEL do begin
             ii:=MatSV[i,1];jj:=MatSV[i,2];kk:=MatSV[i,3];
          if abs(ii-jj)>max then max:=abs(ii-jj);
          if abs(kk-jj)>max then max:=abs(kk-jj);
          if abs(ii-kk)>max then max:=abs(ii-kk);
                               end;
       ShirMSV:=max;
     end;

   Procedure ChangeMatSV(MatSV : tMSV; NEL : integer; MasNom : tMasNom;
                      NN : integer; var MatSVNew : tMSV);
var i,j,k,l,new : Integer;
begin
   for i:=1 to NEL do
      for j:=1 to 3 do begin
         k:=MatSV[i,j];
         new:=0;
         for l:=1 to NN do
            if k=MasNom[l] then begin new:=l; break; end;
         MatSVNew[i,j]:=new;
      end;
end;

   procedure SORT_Nods(xak,yak:tVec;NN:integer;var MasNom:tMasNom);
     var i,j,k:integer;st,s1,s2:string;
         Xrab,Yrab: real;
         MasSTR:tMasSTR;
     begin

        for i:=1 to NN do begin
           Xrab:=xak[i];
           Yrab:=yak[i];
           MasNom[i]:=i;
           STR(xrab:8:4,s1);STR(yrab:8:4,s2);
           MasSTR[i]:=s1+s2;
        end;

        for i:=1 to NN-1 do
          for j:=i+1 to NN do
             if MasSTR[i]>MasSTR[j] then begin
                   st:=MasSTR[i];MasSTR[i]:=MasSTR[j];MasSTR[j]:=st;
                   k:=MasNom[i];MasNom[i]:=MasNom[j];MasNom[j]:=k;
                                          end;
     end;

   procedure PrepareDataEle(n_f:string); //n_f --> *.nod
   var
      k,Kol,kNew:integer;
      F:TEXTFILE;  st,n_fele,n_fsgm:string;
      _p,__pUZ:^integer;
      i,j,k1,k2,Mark,l,ll,ll1:integer;
      kk1,kk2,kk3,ii,jj,kk,ijk,ir:integer;
      __pSegm:pRecSegm;

      fl1,fl2:Boolean;
      r:real;
      mn     : set of byte;
 Begin
  st:=n_f;
  n_fele:=Copy(st,1,Length(st)-3)+'ele';//n_fele --> *.ele
  n_fsgm:=Copy(st,1,Length(st)-3)+'sgm';//n_fsgm --> *.sgm

  assignFile(f,n_f);Reset(f);
  Readln(f,NUZ,k,kk); kFrontPoint:=0;InterPoints.Clear;

  for i:=1 to nuz do  begin

                Readln(f,k,x[i],y[i],Mark); //INITIAL X[i], Y[i]

           if Mark >0 then begin
                  INC(kFrontPoint);
                  MasMarks[kFrontPoint,1]:=i;// OLD numbers!!!
                  MasMarks[kFrontPoint,2]:=Mark;
           end                        else begin
                  New(_p);_p^:=i;
                  InterPoints.Add(_p);// OLD numbers!!!
           end;
  end;
  CloseFile(f);
//================   RAZMAX   =======================
    MiMax(x,  minX,maxX);
    MiMax(y,  minY,maxY);
    RazX:=maxX-minX;RazY:=MaxY-MinY;
//===================================================
  assignFile(f,n_fele);Reset(f);
  Readln(f,NEL);
  for i:=1 to NEL do   Readln(f,k,msv[i,1],msv[i,2],msv[i,3]);
  CloseFile(f);

  assignFile(f,n_fsgm);Reset(f);   //SEGMENTS
  Readln(f);//Empty
  Readln(f,NSEGM);
  for i:=1 to NSEGM do
      Readln(f,k,MasKESegm[i,1],MasKESegm[i,2],
                                       MasKESegm[i,3]); //MARKERS
  Readln(f,k);//Holes or ISLANDS!!!
  RabIselands:=k;
  if k>0 then
    for i:=1 to k do
      Readln(f,Mark,CenterHoles[i,1],CenterHoles[i,2]);
  CloseFile(f);
//----------------   NewNumbers!!!  -------------------------
       SORT_Nods(X,Y,NUZ,MasNom); // —Œ–“»–Œ¬ ¿ ÔÓ ’,”-> MasNom
        for i:=1 to NUZ do begin  // Xnew, YNew with MasNom  (*)
           XNew[i]:=X[MasNom[i]];
           YNew[i]:=Y[MasNom[i]];
        end;
// Change places X[i], Y[i]   and  XNew[i], YNew[i]
        for i:=1 to NUZ do begin //X[i], Y[i]  with MasNom!!!  (*)
           r:=X[i]; X[i]:=XNew[i];XNew[i]:=r;//For DrawSegm
           r:=Y[i]; Y[i]:=YNew[i];YNew[i]:=r;
        end;

       ChangeMatSV(MSV,NEL,MasNom,NUZ,MSVNew);
       ShMSV:=ShirMSV(MSV,NEL);
       ShMSVNew:=ShirMSV(MSVNew,NEL);
       MS:= ShMSVNew;// For calculation!!!
       MSV:=MSVNew;
//====================  MasPiramid  =============
    for i:=1 to NUZ do begin
       k:=NewNom(i);
       MasPiramid[k].Clear;
       for j:=1 to NEL do begin
         ii:=MSV[j,1];jj:=MSV[j,2];kk:=MSV[j,3];
         if(ii=k)or(jj=k)or(kk=k) then begin
            New(_p);_p^:=j;
            MasPiramid[k].Add(_p);
         end;
       end;
    end;

    for i:=1 to N_ISELAND+4 do arListFront[i].Clear;
    for i:=1 to N_ISELAND+4 do arListSegm[i].Clear;
for i:=1 to NSEGM do begin
           k1:=MasKESegm[i,1];
           k2:=MasKESegm[i,2];
           Mark:=MasKESegm[i,3];
           if Mark in [1..N_ISELAND+4] then begin
           //--------------------------------------------------
                ii:=NewNom(k1); jj:=NewNom(k2);//ÕÓ‚˚Â ÌÓÏÂ‡
            // Find third nod
            for l:=1 to NEL do begin {l}
               fl1:=FALSE; fl2:=FALSE;
               kk1:=0; kk2:=0; kk3:=0;
               for ll:=1 to 3 do
                  if ii=MSVNew[l,ll] then begin{if ii}
                     fl1:=TRUE;
                     kk1:=ll;
                     for ll1:=1 to 3 do
                        if jj=MSVNew[l,ll1] then begin {if jj}
                           fl2:=TRUE;
                           kk2:=ll1;
                           mn:=[1,2,3]-[kk1]-[kk2];
                           for ijk:=1 to 3 do
                              if ijk in mn then kk3:=ijk;//Third nod
                           kk1:=MSvNew[l,kk1];
                           kk2:=MSvNew[l,kk2];
                           kk3:=MSvNew[l,kk3];
                           if Area(kk1,kk2,kk3)<0 then begin
                              ir:=kk1; kk1:=kk2; kk2:=ir;
                           end;
                           Break;
                        end;{if jj}
               end;{if ii}
                 if fl1 and fl2 then  begin //*
                  New(__pSegm);
                __pSegm.ii:=kk1;
                __pSegm.jj:=kk2;
                __pSegm.kk:=kk3;
                  r:=0;//UGOL_GRADUS(kk2,kk1);
                __pSegm.Ugol:=r;
                  arListSegm[Mark].Add(__pSegm);
                  Break;
                end;//*
            end;//l
           end;//if Mark
    end;//i
// —œ»— » ““. √–¿Õ»÷  ÔÓ ÚËÔÛ ÏÂÚÓÍ
    for i:=1 to kFrontPoint do begin
           k1:=MasMarks[i,1];
           Mark:=MasMarks[i,2];
                ii:=NewNom(k1);//ÕÓ‚˚È ÌÓÏÂ ÛÁÎ‡ „‡ÌËˆ˚
                New(__pUZ);
                __pUZ^:=ii;
                  arListFront[Mark].Add(__pUZ);
      end;//i
//===================  MasElemArea  =================
  MinElemArea:=1e10;MaxElemArea:=-1e10;
  for i:=1 to NEL do begin
       MasElemArea[i]:=ElemArea(i);
       if MasElemArea[i]<MinElemArea then MinElemArea:=MasElemArea[i];
       if MasElemArea[i]>MaxElemArea then MaxElemArea:=MasElemArea[i];
  end;
      // ------   œ¿Ãﬂ“‹   ƒÀﬂ   Ã¿“–»÷  --------------------
        For i:=1 to 300 do New(AMat[i]);
        For i:=1 to 300 do New(ARMat[i]);
        For i:=1 to 300 do for j:=1 to NUZ do AMat[i]^[j]:=0;
        For i:=1 to NUZ do begin CO[i]:=0;BVec[i]:=0;end;

End;

       procedure MiMax(x:tvec; var xmin,xmax:real);
          var i:integer;
          Begin xmin:=x[1]; xmax:=x[1];
                for i:=1 to nuz do begin
                   if x[i]<xmin then xmin:=x[i];
                   if x[i]>xmax then xmax:=x[i];
                                    end;
         End;{MiMax}
   {---------------------------------------------------------------}
  procedure SHIR(Var MS:integer); {  }
             var  ix,k,iy1,iy2,iy3,iy:integer;
           begin   ix:=0;
              for k:=1 to nel do begin
                 iy1:=abs(msv[k,1]-msv[k,2]);
                 iy2:=abs(msv[k,2]-msv[k,3]);
                 iy3:=abs(msv[k,3]-msv[k,1]);
                 iy:=iy1;if iy2>iy then iy:=iy2;
                         if iy3>iy then iy:=iy3;
                 if iy>ix then ix:=iy;    end; { k }
                               ms:=ix+1;
         end; { SHIR }
 {---------------------------------------------------------------}
 procedure BandSol; { }
         var   c:array[1..300] of real;  n,i,j,k,l,ll:integer;
         begin   n:=nuz;
            for k:=1 to n do begin
               bvec[k]:=bvec[k]/amat[1]^[k];if k=n then Break;
               for j:=2 to ms do begin
                  c[j]:=amat[j]^[k];
                  amat[j]^[k]:=amat[j]^[k]/amat[1]^[k];end; { j }
               for l:=2 to ms do begin
                  i:=k+l-1;if n<i then Continue;
                  j:=0;
                  for ll:=l to ms do begin
                     j:=j+1;
                     amat[j]^[i]:=amat[j]^[i]-c[l]*amat[ll]^[k];
                  end;
                  bvec[i]:=bvec[i]-c[l]*bvec[k];
               end;  {  l  }
            end; { k }
            Repeat
               k:=k-1;if k=0 then Exit;
               for j:=2 to ms do begin
                  l:=k+j-1;if n<l then Continue;
                  bvec[k]:=bvec[k]-amat[j]^[k]*bvec[l];
               end; { j }
            until false;
                end; { BandSol }
   {--------------------------------------------------------}
 procedure GlobARMat; { }
              label 1;
         var   s:array[1..3,1..3] of real;
               i,j,ii,jj,kk,k,im,il,ic,id,ir:integer;
               x1,x2,x3,y1,y2,y3,del,d:real;
               a1,a2,a3,b1,b2,b3,bi,bj,bk:real;  q,pt:real;
    {-----------------------------------------------------------}
         begin  for i:=1 to nuz do begin
                bvec[i]:=0;co[i]:=0;
            for j:=1 to ms do  amat[j]^[i]:=0;
         end;{ i }
       {-----------------------------------}
            for k:=1 to nel do begin
                ii:=msv[k,1];jj:=msv[k,2];kk:=msv[k,3];
                x1:=x[ii];x2:=x[jj];x3:=x[kk];
                y1:=y[ii];y2:=y[jj];y3:=y[kk];
                del:=x2*y3+x1*y2+x3*y1-x2*y1-x3*y2-x1*y3;
                d:=del/2; { }
                b1:=(y2-y3)/del;a1:=(x3-x2)/del;
                b2:=(y3-y1)/del;a2:=(x1-x3)/del;
                b3:=(y1-y2)/del;a3:=(x2-x1)/del;
                   {† }
                s[1,1]:=(b1*b1*aco1+a1*a1*aco2)*d;
                s[1,2]:=(b1*b2*aco1+a1*a2*aco2)*d;s[2,1]:=s[1,2];
                s[1,3]:=(b1*b3*aco1+a1*a3*aco2)*d;s[3,1]:=s[1,3];
                s[2,2]:=(b2*b2*aco1+a2*a2*aco2)*d;
                s[2,3]:=(b2*b3*aco1+a2*a3*aco2)*d;s[3,2]:=s[2,3];
                s[3,3]:=(b3*b3*aco1+a3*a3*aco2)*d;
           { amat}
                for im:=1 to 3 do begin
                   ir:=msv[k,im];
                   for il:=1 to 3 do begin
                      ic:=msv[k,il];id:=ic-(ir-1);
                      if id>=1 then
                           amat[id]^[ir]:=amat[id]^[ir]+s[im,il];
                   end; { il }
                end; { im }

              Q:=QGl*2*d/3;
                bvec[ii]:=bvec[ii]+Q;
                bvec[jj]:=bvec[jj]+Q;
                bvec[kk]:=bvec[kk]+Q;
        
             end;  {  k  }
      end; { GlobARMat }
   {------------------------------------------------------------}
 procedure ResolvDif;{ }
    label 5;
    var   nc,kc,m,ktpot,k11,k12:integer;
          Q,s,dux,duy,cmin,cmax:real;
          i,j,ii,jj,kk,k,im,il,ic,id,ir:integer;
          x1,x2,x3,y1,y2,y3,del,d:real;
          a1,a2,a3,b1,b2,b3,bi,bj,bk:real;
          st,s1,s2,s3,s4:string;
 {-------------------------------------------------------}
 procedure CoMiMax(var cmin,cmax:real);{ min max }
   var i:integer;
   begin   cmin:=co[1];cmax:=co[1];
           for i:=1 to nuz do begin
              if co[i]<cmin then cmin:=co[i];
              if co[i]>cmax then cmax:=co[i]; end;
    end;{ CoMiMax }
{--------------------------------------------------------}
 Begin

  SHIR(MS);{}
  GlobARMat; {}
  for i:=1 to nuz do
      for j:=1 to ms do
                armat[j]^[i]:=amat[j]^[i];

        {”◊≈“  √–.”—ÀŒ¬»… 1-„Ó –Œƒ¿}
                ValGranic(variant);
        {– ≈ ÿ ≈ Õ » ≈   — » — “ ≈ Ã €}
 		BandSol;

 for i:=1 to nuz do  co[i]:=bvec[i];{}

  End { ResolvDif };
{-------------------------------------------------------------------------}
procedure IZOLINES(TargetCanvas:TCanvas;zagl:string; u0,v0,SX,SY:integer;
                          zv:tVec;     hh,izo_gr:real; flprn:integer);
   const    cvet:array[1..10] of TColor=
                       (clNavy,clBlack,clGreen,clBlack,clFuchsia,clBlack,
                        clRed,clBlack,clOlive,clBlack);
            eps=1e-3;

       var    i,kizo,kcvet,ii,jj,kk, kp:integer;
            xi,xj,xk,yi,yj,yk,zi,zj,zk,cx,cy:real;
            xmin,xmax,ymin,ymax,zmin,zmax,izo,h:real;
            st:string;
{------------------------------------------------------------}
       procedure TRIANGL(cvt:TColor;uc,vc,sx,sy:integer);
          var i,x1,x2,x3,y1,y2,y3:integer;
              ii,jj,kk:integer;

           begin
              MiMax(x,xmin,xmax);MiMax(y,ymin,ymax);
              cx:=(xmax-xmin)/sx; cy:=(ymax-ymin)/sy;
            With    TargetCanvas do Begin
              Pen.Color:=cvt;  Pen.Style:=psDot;
        for i:=1 to nel do begin
           ii:=msv[i,1];jj:=msv[i,2];kk:=msv[i,3];
           x1:=uc+round((x[ii]-xmin)/cx);
           y1:=vc-round((y[ii]-ymin)/cy);
           x2:=uc+round((x[jj]-xmin)/cx);
           y2:=vc-round((y[jj]-ymin)/cy);
           x3:=uc+round((x[kk]-xmin)/cx);
           y3:=vc-round((y[kk]-ymin)/cy);
           MoveTo(x1,y1);LineTo(x2,y2); LineTo(x3,y3);LineTo(x1,y1);
                       end;{ i } Pen.Style:=psSolid;
           End;//with
      end;{TRIANGL}

          {--------------------------------------------------------------------}
 procedure IZOTRG(TargetCanvas:TCanvas);
          var i,u1,u2,u3,v1,v2,v3:integer;
              xr1,xr2,xr3,yr1,yr2,yr3:real;
              fl1,fl2,fl3:boolean;

              BEGIN

          if (abs(zi-zj)<1e-7) and(abs( zi-zk)<1e-7) then exit;
   {Main loop}for i:=1 to kizo do begin
                izo:=zmin+(i-1)*h;
                 kcvet:=i mod 20;if kcvet=0 then kcvet:=20;
                 TargetCanvas.Pen.Color:=clMy[kcvet];
                if abs(izo-izo_gr)<1e-3 then TargetCanvas.Pen.Width:=2
                                        else TargetCanvas.Pen.Width:=1;

                fl1:=false;fl2:=false;fl3:=false;
         {First side}if (abs(zi-zj)>1e-3)and((zi-izo)*(zj-izo)<=0)
                            then{Interpol}   begin fl1:=true;
                            xr1:=xi+(xj-xi)/(zj-zi)*(izo-zi);
                            yr1:=yi+(yj-yi)/(zj-zi)*(izo-zi);
                            xr1:=xr1-xmin;
                            yr1:=yr1-ymin;
                            u1:=u0+round(xr1/cx);
                            v1:=v0-round(yr1/cy);
                                             end;
         {Second side}if(abs(zj-zk)>1e-3)and((zk-izo)*(zj-izo)<=0)
                            then{Interpol}   begin  fl2:=true;
                            xr2:=xj+(xk-xj)/(zk-zj)*(izo-zj);
                            yr2:=yj+(yk-yj)/(zk-zj)*(izo-zj);
                            xr2:=xr2-xmin;
                            yr2:=yr2-ymin;
                            u2:=u0+round(xr2/cx);
                            v2:=v0-round(yr2/cy);
                                             end;
          {Third side}if(abs(zk-zi)>1e-3)and((zi-izo)*(zk-izo)<=0)
                            then{Interpol}  begin   fl3:=true;
                            xr3:=xk+(xi-xk)/(zi-zk)*(izo-zk);
                            yr3:=yk+(yi-yk)/(zi-zk)*(izo-zk);
                            xr3:=xr3-xmin;
                            yr3:=yr3-ymin;
                            u3:=u0+round(xr3/cx);
                            v3:=v0-round(yr3/cy);
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
  {===========================================================}
         Begin { IzoLines}
    with  TargetCanvas  do BEGIN
       TRIANGL(clGray,u0,v0,sx,sy);
       MiMax(zv,zmin,zmax);

  if hh<0 then begin
        h:=(zmax-zmin)/19;kizo:=20;end
          else begin       h:=hh;
                           kizo:=round((zmax-zmin+hh/2)/hh)+1;
                           zmin:=round((zmin-hh/2)/hh)*hh;{ ‡ÚÌÓ h!}
                                end;
       Font.Name:='Times New Roman';Font.Size:=10;
   {Main loop}for i:=1 to kizo do begin
                izo:=zmin+(i-1)*h;
                kcvet:=i mod 20;if kcvet=0 then kcvet:=20;
                Pen.Color:=clMy[kcvet];
                if abs(izo-izo_gr)<1e-3 then Pen.Width:=2
                                        else Pen.Width:=1;
         Str(izo:6:1,st);
         if flPRN=1 then Begin
                TextOut(u0+SX+5,v0-SY+i*30,st);
                MoveTo(u0+SX+100,v0-SY+i*30+15);
                LineTo(u0+SX+170,v0-SY+i*30+15);
         End        else Begin
                Font.Color:=clWhite;
                TextOut(u0+SX+5,v0-SY+i*20,st);
                MoveTo(u0+SX+60,v0-SY+i*20+5);
                LineTo(u0+SX+100,v0-SY+i*20+5);
         end;
                                    end;

    for i:=1 to nel do begin
          ii:=msv[i,1];jj:=msv[i,2];kk:=msv[i,3];
          zi:=zv[ii];zj:=zv[jj];zk:=zv[kk];
          xi:=x[ii];xj:=x[jj];xk:=x[kk];
          yi:=y[ii];yj:=y[jj];yk:=y[kk];
          IZOTRG(TargetCanvas);
                          END;   Font.Size:=8;
    END;//with
       End; {IZOLINES}
BEGIN
       clMy[30]:=RGB(0,0,250);
       clMy[29]:=RGB(50,0,250);
       clMy[28]:=RGB(100,0,250);
       clMy[27]:=RGB(150,0,250);
       clMy[26]:=RGB(200,0,250);
       clMy[25]:=RGB(250,0,250);

       clMy[24]:=RGB(250,0,200);
       clMy[23]:=RGB(250,0,150);
       clMy[22]:=RGB(250,0,100);
       clMy[21]:=RGB(250,0,50);
       clMy[20]:=RGB(250,0,0);
       clMy[19]:=RGB(250,50,0);
       clMy[18]:=RGB(250,100,0);
       clMy[17]:=RGB(250,150,0);
       clMy[16]:=RGB(250,200,0);
       clMy[15]:=RGB(250,250,0);

       clMy[14]:=RGB(200,250,0);
       clMy[13]:=RGB(150,250,0);
       clMy[12]:=RGB(100,250,0);
       clMy[11]:=RGB(50,250,0);
       clMy[10]:=RGB(0,250,0);

       clMy[9]:=RGB(0,250,50);
       clMy[8]:=RGB(0,250,100);
       clMy[7]:=RGB(0,250,150);
       clMy[6]:=RGB(0,250,200);
       clMy[5]:=RGB(0,250,250);

       clMy[4]:=RGB(0,200,250);
       clMy[3]:=RGB(0,150,250);
       clMy[2]:=RGB(0,100,250);
       clMy[1]:=RGB(0,50,250);
       clMy[0]:=RGB(0,0,250);

end.
