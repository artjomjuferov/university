unit U_MKE03;

interface
  uses  Windows, SysUtils, Classes, Graphics,Dialogs;
  const mNEL=7000;mNUZ=7000; mLG=1200; QAD=-1;
  const   N_ISELAND=5; N_List=200;
          mShirMSV=150;// ширина матрицы связности
          mKol_TT=10;
          MTT=4000;//MAX Шагов по времени
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
   tMasPiramid= array[1..mNUZ]of TList;
 TYPE    TMSV=array[1..mNEL,1..3]of integer;
         TVEC=array[1..mNUZ]of real;UK=^TVEC;
         TMuk=array[1..300]of UK;
         tMasElemArea=array[1..mNEL]of real;
         tTabSGM=array[1..mNUZ,1..3]of integer;
         tTabFront=array[1..mNUZ,1..2]of integer;
         tMasSTR=array[1..mNUZ]of string[20];
         tMasNom=array[1..mNUZ]of integer;
         tCenterHoles=array[1..10,1..2]of real;
         tMas_TT=array[1..mKol_TT]of integer;
         tMasTT=array[0..MTT]of real;
         tArTT=array[1..10]of tMasTT;//контрольные тт (сходимость)

  Var
//   =========   MKE  =========================
    AMat,ARMat,RMat:TMuk;
    
//---------------------------------------------
    ArTT:tArTT;
    Mas_TT:tMas_TT=(38,202,195,190,382,439,391,400,25,1);
    Mas_Write:array[0..11]of tVec;
    CenterHoles : tCenterHoles ;
    InterPoints,Piramides:TList;
    NomPiramid,NomABS1,NomABS2,RabISELANDS:integer;
    MasPiramid:tMasPiramid;
    MasElemArea:tMasElemArea;
    MinElemArea,MaxElemArea:real;
    NumberField,RabPATH,PathWrite:string;
    msv, msvNew:TMSV;
    ShMSV,ShMSVNew:integer;
    MasNom:tMasNom;
    MasMarks:tTabFront;
    NEL,NUZ,LG,MS , kFrontPoint,kInterPoints :integer;
    NN:integer;
    fn,fp,n_fnod:string;
    flPOLY:Boolean;
    X,Y, XNew,YNew,CO:tVec;
    rVec,BVec, UUU,VVV,UUU_x,VVV_y:TVec;
    ZZZ,ZZZ_x,ZZZ_y,FFF, FFF_x, FFF_y : tVec;
    Diag,rDiag:tVec;
    NSEGM:integer;
    MasKESegm:tTabSgm;
    arList,NewArList:tMas;
    arListSegm:tMasSegm;
    arListFront:tMasSegm;
    minX,maxX,minY,maxY,RazX,RazY:real;
    LX,LY:integer;
    clMy:array[0..30]of TColor;
    flElems:Boolean=FALSE;
    flSegms:Boolean=FALSE;
    flInterPoints:Boolean=FALSE;
    flMiMa:Boolean=FALSE;
    flPrint:integer=0;
    flWrite:Boolean=FALSE;
    flINIT :Boolean=FALSE;
    flDrawKSI:Boolean=FALSE;
    flDraw:Boolean=FALSE;
    flHHH:Boolean=FALSE;
    flDiffusionXY:Boolean=FALSE;
//========   PARAMS  =============
   Kol_TT:integer=5;
    dT:real=0.005;
    KIT:Integer=2;
    nTT:integer=500;  //ШАГОВ
   aCO1,aCO2:real;//2 коэффициента диффузии
   aZZZ_x:real=1;
   aZZZ_y:real=1;
   u_vel :real=0;
   v_vel :real=0;
   //Граничные константы
   C1_gr:real=0;     C2_gr:real=10;
   QP:real=1;//Поток через границу "4444"
   flStream:boolean=FALSE;
   flStream1:boolean=FALSE;
   Modul,UGOL:real;
   N0,ncReal:integer;
   dn:integer=25;
   dnt:integer=50;
   GlobTT:real=0;
   IndxPRN:integer=0;//Сделано Контрольных шагов
   IndxVariant:integer=0;// Вариант счета
   MinArea,MaxArea,CO_Min,CO_Max:real;
   NomMinArea,NomMaxArea,NomMin,NomMax:integer;

//================================
   procedure AssignMem;
   procedure FreeDinMem;
//================================
 procedure SORT_Nods(xak,yak:tVec;NN:integer;var MasNom:tMasNom);
 procedure ChangeMatSV(MatSV:tMSV;NEL:integer; MasNom:tMasNom;NN:integer;
                                            var MatSVNew:tMSV);
 Function NewNom(OldNom:integer):integer;
 Function ShirMSV(MatSV:tMSV;NEL:integer):integer;
 procedure set_list(var arList:tMas);
 procedure set_listSegm(var arListSegm:tMasSegm);
 procedure clear(var __l : TList);
 procedure DrawElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
 procedure DrawMiMaxElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
 procedure DrawSegms(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
 procedure DrawFillSegm(TargetCanvas:TCanvas; SX,SY,u0,v0,Nom_Isl:integer);
 procedure DrawFront(TargetCanvas:TCanvas; SX,SY,u0,v0,Nom_Isl:integer);
 procedure NewDrawFront(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
 procedure DrawFrontTT(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
 procedure DrawStreamBoundary(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
 procedure PrepareDataEle(n_f:string);
 procedure MiMax(x:tvec; var xmin,xmax:real);
 procedure IZOLINES(TargetCanvas:TCanvas;zv:tVec;SX,SY,u0,v0:integer;
                                      hh,izo_gr:real; flprn:integer);
 function  ElemArea(NomElem:integer):real;
 procedure TestAreas;
 procedure  __XYDerivation(MasPiramid:tMasPiramid;
                          FFF:tVec;XorY:integer;var rFFF:tVec);
  procedure DrawInterPoints(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
  procedure FindNearestUZ(rX,rY:real;var NomUZ:integer);

  procedure GlobARMat;

  procedure BandSol;
  procedure ValGranic;
  
  function ATA2(u,v,dAlpha:real):real;
  function Area(ii,jj,kk:integer):Double;
  procedure Draw_TT(TargetCanvas:TCanvas;SX,SY,u0,v0:integer);
  procedure N_Graf(TargetCanvas:TCanvas;ArTT:tArTT;
                                 M,N,kPRN,dn,dnt:integer;
                                 SX,SY,u0,v0:integer;flMIMA:Boolean;
                                 flPrint:integer);
 procedure STRELA(TargetCanvas:TCanvas;u0,v0,sx,sy:integer;
                                                  modul,ugol:real);
 procedure SHAG_dt;
  procedure VisualBand(TargetCanvas:TCanvas;MSV:tMSV;
                                       SX,SY,u0,v0,kPrint:integer);
  implementation
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

 procedure SHAG_dt;
    var

          Q,s,dux,duy:real;
          i,j,m,ii,jj,kk,k,im,il,ic,id,ir:integer;
          x1,x2,x3,y1,y2,y3,del,d,DL:real;
          a1,a2,a3,b1,b2,b3,bi,bj,bk:real;

    begin
       for k:=1 to nel do begin
           ii:=msv[k,1];jj:=msv[k,2];kk:=msv[k,3];
                x1:=x[ii];x2:=x[jj];x3:=x[kk];
                y1:=y[ii];y2:=y[jj];y3:=y[kk];
                del:=x2*y3+x1*y2+x3*y1-x2*y1-x3*y2-x1*y3;
                d:=del/2; {Пл. элемента }
                b1:=(y2-y3)/del;a1:=(x3-x2)/del;
                b2:=(y3-y1)/del;a2:=(x1-x3)/del;
                b3:=(y1-y2)/del;a3:=(x2-x1)/del;
           dux:=b1*co[ii]+b2*co[jj]+b3*co[kk];
           duy:=a1*co[ii]+a2*co[jj]+a3*co[kk];
           Q:=QAd*(u_vel*dux+v_vel*duy)*d/3;
           bvec[ii]:=bvec[ii]+Q;
           bvec[jj]:=bvec[jj]+Q;
           bvec[kk]:=bvec[kk]+Q;
         end;//k

    for i:=1 to nuz do begin
             s:=0; k:=i-1;
       for j:=2 to ms do begin  m:=j+i-1;
              if m<=nuz then s:=s+RMat[j]^[i]*co[m];
              if k>0 then begin  s:=s+RMat[j]^[k]*co[k];
                                   k:=k-1; end;
       end;{j}
                  bvec[i]:=s+RMat[1]^[i]*co[i]+2*bvec[i];
    end;{ i }
       // УЧЕТ  ПОТОКА  ЧЕРЕЗ  "4444"
       if flStream1 then
       for i:=1 to NSEGM do
            if MasKESegm[i,3]=4 then begin
               ii:=MasKESegm[i,1]; // OLD numbers!!!
               jj:=MasKESegm[i,2];
               ii:=NewNom(ii); // New number after sorting
               jj:=NewNom(jj); // New number after sorting

               if(Y[ii]=1)or(Y[jj]=1) then Continue;
               if(Y[ii]=0)or(Y[jj]=0) then Continue;
            DL:=SQRT(SQR(X[ii]-X[jj])+SQR(Y[ii]-Y[jj]));
            bvec[ii]:=bvec[ii] + QP*DL/2;
            bvec[jj]:=bvec[jj] + QP*DL/2;
        end;
        {УЧЕТ  ГР.УСЛОВИЙ 1-го РОДА}

    ValGranic;
        {Р Е Ш Е Н И Е   С И С Т Е М Ы}
 		BandSol;

 for i:=1 to nuz do  co[i]:=bvec[i];
      //ВОССТАНОВЛЕНИЕ  МАССИВОВ
      bvec:=rvec;
      for i:=1 to nuz do  for j:=1 to ms do
             amat[j]^[i]:=armat[j]^[i];
    end;
 procedure STRELA(TargetCanvas:TCanvas;u0,v0,sx,sy:integer;
                                                  modul,ugol:real);
      Type StrelType=array[1..8,1..2] of integer;
      Const Strel:StrelType=
            ((-100,-10),(20,-10),(20,-20),(100,0),
             (20,20),(20,10),(-100,10),(-100,-10));
      Var   RabStrel:array[1..8]of tPoint;      u1,v1,i:integer;
           x,y,xr,yr:integer;a1,a2,a3,a4,sa:real;
  Begin    sa:=ugol;
         a1:=cos(sa);a2:=sin(sa);    a3:=-a2;    a4:=a1;
         u1:=sx div 2 +u0;         v1:=v0-sy div 2 ;
   for i:=1 to 8 do begin    x:=Strel[i,1];y:=Strel[i,2];
     xr:=round(x*modul);yr:=y; x:=round(a1*xr+a2*yr)+u1;
     y:=round(a3*xr+a4*yr)+v1;
     RabStrel[i].x:=x; RabStrel[i].y:=y;
          end; {i}
    TargetCanvas.Brush.Color:=clAqua;
    TargetCanvas.Polygon(RabStrel);
    TargetCanvas.PolyLine(RabStrel);
    TargetCanvas.Brush.Color:=clWhite;
   End;{STRELA}
 //-------------------------------------------------------------
 procedure N_Graf(TargetCanvas:TCanvas;ArTT:tArTT;
                                 M,N,kPRN,dn,dnt:integer;
                                 SX,SY,u0,v0:integer;flMIMA:Boolean;
                                 flPrint:integer);
      const cv:array[0..10]of TColor=( clPurple,
              clWhite,clYellow,clAqua,clFuchsia,
              clLime,clGreen,clRed,clGray,
              clTeal,clBlue);
            ps:array[0..10]of TPenStyle=
                 (psDot,psSolid, psDot,psDash,  psDashDot, psDashDotDot,
                  psSolid, psDash, psDot, psDashDot, psDashDotDot);
       var i,j,k,nT,u1,u2,v1,v2,u00,v00,uc,vc,un,vn,ru:integer;
           cx,cy,minY,maxY,Razmax,delta,round_delta:real;
           ymaC,ymiC,ry,ymi,yma,cyF,Fmi,Fma,cyA,Ami,Ama,r:real;
           st:string;
       procedure MiMax(x:tArTT; var xmin,xmax:real);
          var i,j:integer;
          Begin xmin:=x[1,0]; xmax:=x[1,0];
                for i:=1 to M do
                  for j:=0 to N do begin
                   if x[i,j]<xmin then xmin:=x[i,j];
                   if x[i,j]>xmax then xmax:=x[i,j];
                                    end;
         End;{MiMax}
       begin
          MiMax(ArTT,minY,maxY);
  if flMIMA then begin
          if minY<0 then ymi:=int((minY-0.99))
             else ymi:=int(minY);
     if maxY>0 then yma:= int((maxY+0.99))
             else yma:= int(maxY);
  end else begin
     ymi:=minY;yma:=maxY;
  end;
     if ymi=yma then begin
         ymi:=ymi-1;
         yma:=yma+1;
     end;
     u1:=u0;u2:=u0+SX-80;v1:=v0-SY+17;v2:=v0-16;
     u00:=u1;un:=u2; v00:=v2;vn:=v1;
     cx:=(u2-u1)/(N);
     cy:=(v2-v1)/(yma-ymi);

       with TargetCanvas do BEGIN
               Font.Name:='Small Fonts'; Font.Size:=7;
               //Colors lines

               for i:=1 to M do begin
                  ru:=u0+SX-30;
                  if flPrint=0 then Font.Color:=cv[i]
                               else begin
                                    Font.Color:=clBlack;
                                    Pen.Color:=clBlack;
                                    Pen.Style:=ps[i];
                                    MoveTo(ru,i*20);LineTo(ru+10,i*20);
                                    end;
                  TextOut(u0+SX-40,i*20,IntToStr(i));
                  
               end;
              Pen.Style:=psSolid;
           if  flPrint=0 then Font.Color:=clWhite
                         else Font.Color:=clBlack;
           if  flPrint=0 then Pen.Color:=clWhite
                         else Pen.Color:=clBlack;
               Rectangle(u1,v1,u2,v2);

       if  flPrint=0 then Pen.Color:=clWhite
                      else Pen.Color:=clBlack;
       Pen.Width:=1; Pen.Style:=psSolid;
       Font.Size:=7;
         for i:=0 to N do begin
       uc:=u00+round(i*cx);vc:=v00+3;
         j:=0;
         if i mod dn =0 then  j:=2;
         if (i=0)or(i mod dnt =0) then begin j:=4;
             STR(i*kPRN,st);TextOut(uc-2,vc,St);
             Pen.Style:=psDot;Pen.Color:=clGreen;
             MoveTo(uc,v1);if i>0 then LineTo(uc,v2);
             Pen.Style:=psSolid;

             if  flPrint=0 then Pen.Color:=clWhite
                            else Pen.Color:=clBlack;
                                       end;
          if j>0 then begin
            MoveTo(uc,v00);LineTo(uc,v00+j);
                         end;
                            end;
   {Вертикальная ось}
  if flMIMA then BEGIN
  ry:=ymi;k:=0;while ry<=yma+0.01 do BEGIN
           uc:=un;vc:=v00-round((ry-ymi)*cy);
           MoveTo(uc,vc);
           if k mod 5=0 then begin
                     LineTo(uc+7,vc);
                     Str(ry:5:1,st);TextOut(uc+7,vc-10,st);
                     if (k>0)and(ry<yma-0.01) then begin
                         Pen.Style:=psDot;Pen.Color:=clGreen;
                         MoveTo(u00,vc); LineTo(un,vc);
                         Pen.Style:=psSolid;
                         if  flPrint=0 then Pen.Color:=clWhite
                                        else Pen.Color:=clBlack;
                     end
                             end
                        else LineTo(uc+3,vc);
           ry:=ry+0.1;Inc(k);       END;
  END else
     for i:=1 to 5 do begin
          ry:=(yma-ymi)/4*(i-1);
          uc:=un;vc:=v00-round(ry*cy);
          if  flPrint=0 then Pen.Color:=clWhite
                        else Pen.Color:=clBlack;
          Pen.Style:=psSolid;
          MoveTo(uc,vc);LineTo(uc+7,vc);
          Str(ymi+ry:7:3,st);TextOut(uc+7,vc-10,st);
          Pen.Style:=psDot;Pen.Color:=clGreen;
          MoveTo(u00,vc);
          if i in [2,3,4] then LineTo(un,vc);
          Pen.Style:=psSolid;
  END;
 //--------..К Р И В Ы Е --------------
              for i:=1 to M do begin
                 if flPrint=0 then Pen.Color:=cv[i]
                              else begin
                                     Pen.Color:=clBlack;
                                     Pen.Style:=ps[i];
                 end;

                 for j:=0 to N-1 do begin
                    u1:=u00+round(j*cx);u2:=u1+round(cx);
                    v1:=v00-round((ArTT[i,j]-Ymi)*cy);
                    v2:=v00-round((ArTT[i,j+1]-Ymi)*cy);
                    MoveTo(u1,v1);LineTo(u2,v2);
                 end;
              end;
              Pen.Style:= psSolid;
       END;//with
end;
  procedure Draw_TT(TargetCanvas:TCanvas;SX,SY,u0,v0:integer);
     var i,x1,y1,ii,Kol:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=1;  Brush.Color:=clRed;
       Kol:=Kol_TT;
           for i:=1 to Kol do begin
               ii:=Mas_TT[i]; //New number!!!
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               Ellipse(x1-4,y1-4,x1+4,y1+4);
           end;//i
          Brush.Color:=clWhite;
    end;{with}
    end;//Draw_TT

  function Area(ii,jj,kk:integer):Double;
      Var x1,x2,x3,y1,y2,y3,r:Double;
    Begin
       x1:=x[ii];  x2:=x[jj];x3:=x[kk];
       y1:=y[ii];  y2:=y[jj];y3:=y[kk];
       r:=x2*y3+x1*y2+x3*y1-x2*y1-x3*y2-x1*y3;
       Area:=r;
    End;
   function ATA2(u,v,dAlpha:real):real;
        var arc,ATA:real;
    begin if((v=0) and(u>=0)) then ATA:=0
             else
          if((v=0) and (u<0)) then ATA:=Pi
             else
          if ((u=0) and (v>0)) then ATA:=Pi/2
             else
          if ((u=0) and (v<0)) then ATA:=3*Pi/2
             else
          begin  arc:=arctan(u/v);
             if ((v>0) and (u>0)) then ATA:=Pi/2-arc
              else
             if ((v>0) and (u<0)) then ATA:=Pi/2-arc
              else
             if ((v<0) and (u>0)) then ATA:=3*Pi/2-arc
              else
             if ((v<0) and (u<0)) then ATA:=3*Pi/2-arc
          end;ATA2:=ATA+dAlpha;
       end;{ ATA2 }

procedure ValGranic;
    var   i,k,kf,k1,ir,nt,iKind:integer;
          rVGT,rY,rH:real;
        begin

           kf:=MS-1;  rVGT:=0;
           LG:=kFrontPoint;
           for k:=1 to LG do begin
               nt:=MasMarks[k,1];// OLD numbers!!!
               nt:=NewNom(nt); //after Sorting
               iKind:= MasMarks[k,2]; //PointMarks

    // УЧЕТ  ПОТОКА = QP через "4444" и 000 на остальных границах
        if flStream1 and (iKind<>4)then
                 rVGT:=0          else  Continue;
(*
    // УЧЕТ  ПОТОКА = 0  через "4444"
         if(flStream)and(iKind=4) then Continue;
    // ВАРИАНТЫ  СЧЕТА
        if flStream1 and (iKind<>2)then Continue;
        if flStream1 and (iKind=2)then BEGIN
           rVGT:=1
        END                        else

         Case IndxVariant of
       0: //F(x)
          rVGT:=10*X[nt];
       1: //F(y)
          rVGT:=10*(1-Y[nt]);
       2: // [C1,C2]
          if (iKind in[1..4]) then  rVGT:=C1_gr
                              else  rVGT:=C2_gr;
         End;//case

   *)
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
//===================   MKE  =======================
    procedure AssignMem;
   var i:integer;
   begin
        For i:=1 to mShirMSV do begin
                     New(AMat[i]);
                     New(ARMat[i]);
                     New(RMat[i]);
        end;
   end;
   procedure FreeDinMem;
   var i:integer;
   begin
        For i:=1 to mShirMSV do begin
                     Dispose(AMat[i]);
                     Dispose(ARMat[i]);
                     Dispose(RMat[i]);
        end;
   end;
procedure GlobARMat; { }
              label 1;
         var   s,dm:array[1..3,1..3] of real;
               i,j,ii,jj,kk,k,im,il,ic,id,ir:integer;
               x1,x2,x3,y1,y2,y3,del,d:real;
               a1,a2,a3,b1,b2,b3,bi,bj,bk:real;  q,pt:real;
      {----------------------------------------------------------}
         begin  for i:=1 to nuz do begin
                bvec[i]:=0;co[i]:=0;
            for j:=1 to ms do begin
                amat[j]^[i]:=0;rmat[j]^[i]:=0;
                            end;{j} end;{ i }
       {-----------------------------------}
            pt:=2.0/dt;
            for k:=1 to nel do begin
                ii:=msv[k,1];jj:=msv[k,2];kk:=msv[k,3];
                x1:=x[ii];x2:=x[jj];x3:=x[kk];
                y1:=y[ii];y2:=y[jj];y3:=y[kk];
                del:=x2*y3+x1*y2+x3*y1-x2*y1-x3*y2-x1*y3;
                d:=del/2; { }
                b1:=(y2-y3)/del;a1:=(x3-x2)/del;
                b2:=(y3-y1)/del;a2:=(x1-x3)/del;
                b3:=(y1-y2)/del;a3:=(x2-x1)/del;
                   {  }
                s[1,1]:=(b1*b1*aco1+a1*a1*aco2)*d;
                s[1,2]:=(b1*b2*aco1+a1*a2*aco2)*d;s[2,1]:=s[1,2];
                s[1,3]:=(b1*b3*aco1+a1*a3*aco2)*d;s[3,1]:=s[1,3];
                s[2,2]:=(b2*b2*aco1+a2*a2*aco2)*d;
                s[2,3]:=(b2*b3*aco1+a2*a3*aco2)*d;s[3,2]:=s[2,3];
                s[3,3]:=(b3*b3*aco1+a3*a3*aco2)*d;
          {НЕСТАЦИОНАРНЫЙ  ВКЛАД}
              Q:=d/12;
              for i:=1 to 3 do for j:=1 to 3 do
                 if i=j then dm[i,j]:=2*Q
                        else dm[i,j]:=Q;
           { amat  rmat}
                for im:=1 to 3 do begin
                   ir:=msv[k,im];
                   for il:=1 to 3 do begin
                      ic:=msv[k,il];id:=ic-(ir-1);
                      if id<1 then goto 1;
             amat[id]^[ir]:=amat[id]^[ir]+s[im,il]+pt*dm[im,il];
             rmat[id]^[ir]:=rmat[id]^[ir]-s[im,il]+pt*dm[im,il];
               1:    end; { il }   end; { im }
             end;  {  k  }
      end; { GlobARMat }
  {---------------------------------------------------------------}
 procedure BandSol; { }
         var   c:array[1..mShirMSV] of real;
               n,i,j,k,l,ll:integer;
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
//================================================================
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
               Ellipse(x1-2,y1-2,x1+2,y1+2);
           end;//i
          Brush.Color:=clWhite;
    end;{with}
    end;//DrawFrontTT

  procedure DrawStreamBoundary(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
     var i,x1,y1,x2,y2,ii,jj,Kol,nom1:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=1;  Brush.Color:=clRed; Pen.Color:=clRed;
       Kol:=NSEGM;
           for i:=1 to Kol do
               if MasKESegm[i,3]=4 then begin
               ii:=MasKESegm[i,1]; // OLD numbers!!!
               jj:=MasKESegm[i,2];
               ii:=NewNom(ii); // New number after sorting
               jj:=NewNom(jj); // New number after sorting
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               x2:=u0+round((X[jj]-minX)*cx);
               y2:=v0-round((Y[jj]-minY)*cy);
               if(Y[ii]=1)or(Y[jj]=1) then Continue;
               if(Y[ii]=0)or(Y[jj]=0) then Continue;
               MoveTo(x1,y1);LineTo(x2,y2);
               Ellipse(x1-4,y1-4,x1+4,y1+4);
               Ellipse(x2-4,y2-4,x2+4,y2+4);
           end;//i
          Brush.Color:=clWhite;
    end;{with}
    end;//DrawStreamBoundary

  procedure FindNearestUZ(rX,rY:real;var NomUZ:integer);
     var i:integer;
         Dist,s:real;
     begin
        Dist:=1e20;
        for i:=1 to NUZ do begin
           s:=SQR(rX-X[i])+SQR(rY-Y[i]);
           if s<Dist then begin
                    Dist:=s;NomUZ:=i;
           end;
        end;
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
               Ellipse(x1-2,y1-2,x1+2,y1+2);
           end;//i
          Brush.Color:=clWhite;
    end;{with}
    end;//DrawInterPoints
   procedure  __XYDerivation(MasPiramid:tMasPiramid;
                          FFF:tVec;XorY:integer;var rFFF:tVec);
      var  KolPoints,KolElem,NomUZ,NomElem:integer;
           i,j,k,kNew:integer;
           ii,jj,kk:integer;
           x1,x2,x3,y1,y2,y3,z1,z2,z3,SSS,SElem,r:real;
           _p:^integer;
      begin
         KolPoints:=NUZ;
         for i:=1 to KolPoints do begin
             kNew:=i;//NewNom(i);
              SSS:=0;
             KolElem:=MasPiramid[i].Count;
             for j:=0 to KolElem-1 do begin
                 _p:=MasPiramid[i].Items[j];
                 NomElem:=_p^;
                 SElem:= MasElemArea[NomElem];
                 ii:=MSV[NomElem,1]; jj:=MSV[NomElem,2]; kk:=MSV[NomElem,3];
                 x1:= X[ii]; x2:= X[jj]; x3:= X[kk];
                 y1:= Y[ii]; y2:= Y[jj]; y3:= Y[kk];
                 z1:= FFF[ii]; z2:= FFF[jj]; z3:= FFF[kk];
                 if XorY=1 then
                   SSS:=SSS+((z1*y2+z2*y3+z3*y1)-(z1*y3+z2*y1+z3*y2))/SElem
                           else
                   SSS:=SSS+((x1*z2+x2*z3+x3*z1)-(x1*z3+x2*z1+x3*z2))/SElem;
             end;//j
             rFFF[kNew]:=SSS/KolElem;

         end;//i
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
{==============================================================================}
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
{----------------------------------------------------------------}
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
//---------------------------------------------------------------
function ShirMSV(MatSV:tMSV;NEL:integer):integer;
     var i,ii,jj,kk,max:integer;
     begin   max:=0;
          for i:=1 to NEL do begin
             ii:=MatSV[i,1];jj:=MatSV[i,2];kk:=MatSV[i,3];
          if abs(ii-jj)>max then max:=abs(ii-jj);
          if abs(kk-jj)>max then max:=abs(kk-jj);
          if abs(ii-kk)>max then max:=abs(ii-kk);
                               end;
       ShirMSV:=max+1;// 12.08.'03
     end;
//================================================================
       procedure MiMax(x:tvec; var xmin,xmax:real);
          var i:integer;
          Begin xmin:=x[1]; xmax:=x[1];
                for i:=1 to nuz do begin
                   if x[i]<xmin then xmin:=x[i];
                   if x[i]>xmax then xmax:=x[i];
                                    end;
         End;{MiMax}
 //------------------------------------------------------------------
procedure IZOLINES(TargetCanvas:TCanvas;zv:tVec; SX,SY,u0,v0:integer;
                               hh,izo_gr:real; flprn:integer);
   const
            eps=1e-3;
   const aIZOLINE_COLORS : array [0..20]of TColor = (clAqua   , $00ffd900,
												  $00ffb900, $00ff9000,
                                                  $00ff7000, $00ff4700,
                                                  $00ff2000, $00e00000,
                                                  $00c00000, $00b00000,
                                                  $00a00000, $00900000,
                                                  $00800000, $00700000,
                                                  $00600000, $00500000,
                                                  $00400000, $00300000,
                                                  $00200000, $00100000,
                                                  $00000000);
       var    i,kizo,kcvet,ii,jj,kk:integer;
            xi,xj,xk,yi,yj,yk,zi,zj,zk,cx,cy:real;
            zmin,zmax,izo,h:real;
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
                 if flPRN=1 then //Цвета глубин
                    TargetCanvas.Pen.Color:=aIZOLINE_COLORS[kcvet];
                if abs(izo-izo_gr)<1e-3 then TargetCanvas.Pen.Width:=3
                                        else TargetCanvas.Pen.Width:=2;

                fl1:=false;fl2:=false;fl3:=false;
         {First side}if (abs(zi-zj)>1e-3)and((zi-izo)*(zj-izo)<=0)
                            then{Interpol}   begin fl1:=true;
                            xr1:=xi+(xj-xi)/(zj-zi)*(izo-zi);
                            yr1:=yi+(yj-yi)/(zj-zi)*(izo-zi);
                            xr1:=xr1-minX;
                            yr1:=yr1-minY;
                            u1:=u0+round(xr1*cx);
                            v1:=v0-round(yr1*cy);
                                             end;
         {Second side}if(abs(zj-zk)>1e-3)and((zk-izo)*(zj-izo)<=0)
                            then{Interpol}   begin  fl2:=true;
                            xr2:=xj+(xk-xj)/(zk-zj)*(izo-zj);
                            yr2:=yj+(yk-yj)/(zk-zj)*(izo-zj);
                            xr2:=xr2-minX;
                            yr2:=yr2-minY;
                            u2:=u0+round(xr2*cx);
                            v2:=v0-round(yr2*cy);
                                             end;
          {Third side}if(abs(zk-zi)>1e-3)and((zi-izo)*(zk-izo)<=0)
                            then{Interpol}  begin   fl3:=true;
                            xr3:=xk+(xi-xk)/(zi-zk)*(izo-zk);
                            yr3:=yk+(yi-yk)/(zi-zk)*(izo-zk);
                            xr3:=xr3-minX;
                            yr3:=yr3-minY;
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
  {===========================================================}
         Begin { IzoLines}
       cx:=SX/RazX;   cy:=SY/RazY;
       MiMax(zv,zmin,zmax);  if zmin=zmax then EXIT;

  if hh<0 then begin
        h:=(zmax-zmin)/19;kizo:=20;end
          else begin       h:=hh;
                           kizo:=round((zmax-zmin+hh/2)/hh)+1;
                           zmin:=round((zmin-hh/2)/hh)*hh;{Кратно h!}
                                end;

    for i:=1 to nel do begin
          ii:=msv[i,1];jj:=msv[i,2];kk:=msv[i,3];
          zi:=zv[ii];zj:=zv[jj];zk:=zv[kk];
          xi:=x[ii];xj:=x[jj];xk:=x[kk];
          yi:=y[ii];yj:=y[jj];yk:=y[kk];
          IZOTRG(TargetCanvas);
                          END;
       End; {IZOLINES}
//-------------------------------------------------------------------
procedure DrawElems(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
	 var i,x1,x2,x3,y1,y2,y3:integer;
             ii,jj,kk:integer;
             cx,cy:real;
   begin
       With TargetCanvas do begin
          pen.Color:=clSilver;
          //Pen.Color:=clWhite;
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
{----------------------------------------------------------------------}
procedure DrawFront(TargetCanvas:TCanvas; SX,SY,u0,v0,Nom_Isl:integer);
	 var i,j,x1,y1,ii,Kol:integer;
             cx,cy:real;
             __pUZ:^integer;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=1; Brush.Color:=clLime;
       if Nom_Isl=0 then begin//Coast
        For i:=1 to  4 do begin
           Kol:=arListFront[i].Count;
           for j:=0 to Kol-1 do begin
               __pUZ:=arListFront[i].Items[j];
               ii:=__pUZ^;  //OLD number
               ii:=MasNom[ii];
               // X[i], Y[i] NEW!!! after interchange
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               Ellipse(x1-3,y1-3,x1+3,y1+3);
           end;//j
        end;//i
       end else begin //Iselands
          Kol:= arListFront[Nom_Isl+4].Count;
          for j:=0 to Kol-1 do begin
               __pUZ:=arListFront[Nom_Isl+4].Items[j];
               ii:=__pUZ^;
               ii:=MasNom[ii];
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               Ellipse(x1-3,y1-3,x1+3,y1+3);
           end;//j
       end;//if
       Brush.Color:=clWhite;
    end;{with}
    end;//DrawFront
{----------------------------------------------------------------------}
procedure NewDrawFront(TargetCanvas:TCanvas; SX,SY,u0,v0:integer);
	 var i,j,x1,y1,ii,Kol:integer;
             cx,cy:real;
             __pUZ:^integer;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=1;Brush.Color:=clLime;

        For i:=1 to  4+rabIselands do begin
           Kol:=arListFront[i].Count;
           for j:=0 to Kol-1 do begin
               __pUZ:=arListFront[i].Items[j];
               ii:=__pUZ^; //OLD
               x1:=u0+round((XNew[ii]-minX)*cx);
               y1:=v0-round((YNew[ii]-minY)*cy);
               Ellipse(x1-2,y1-2,x1+2,y1+2);
           end;//j
        end;//i
        Brush.Color:=clWhite;
    end;{with}
    end;//NewDrawFront
procedure DrawFillSegm(TargetCanvas:TCanvas; SX,SY,u0,v0,Nom_Isl:integer);
	 var i,j,x1,y1,x2,y2,x3,y3,ii,jj,kk,Kol:integer;
             cx,cy:real;
             __pSegm:pRecSegm;
             arElem:array[1..4]of TPoint;
   begin
       With TargetCanvas do begin
          cx:=SX/RazX;   cy:=SY/RazY;
       Pen.Width:=1;   Pen.Color:=clBlack;
       if Nom_Isl=0 then Brush.Color:=clLime
                    else Brush.Color:=clFuchsia;
       if Nom_Isl=0 then begin//Coast
        For i:=1 to  4 do begin
           Kol:=arListSegm[i].Count;
           for j:=0 to Kol-1 do begin
               __pSegm:=arListSegm[i].Items[j];
               ii:=__pSegm.ii;
               jj:=__pSegm.jj;
               kk:=__pSegm.kk;
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               x2:=u0+round((X[jj]-minX)*cx);
               y2:=v0-round((Y[jj]-minY)*cy);
               x3:=u0+round((X[kk]-minX)*cx);
               y3:=v0-round((Y[kk]-minY)*cy);
               //Draw
           arElem[1]:=Point(x1,y1);
           arElem[2]:=Point(x2,y2);
           arElem[3]:=Point(x3,y3);
           arElem[4]:=Point(x1,y1);
           Polygon(arElem);
           PolyLine(arElem);
           end;//j
        end;//i
       end else begin //Iseland
          Kol:= arListSegm[Nom_Isl+4].Count;
          for j:=0 to Kol-1 do begin
              __pSegm:=arListSegm[Nom_Isl+4].Items[j];
               ii:=__pSegm.ii;//ii:=MasNom[ii];
               jj:=__pSegm.jj;//jj:=MasNom[jj];
               kk:=__pSegm.kk;//kk:=MasNom[kk];
               x1:=u0+round((X[ii]-minX)*cx);
               y1:=v0-round((Y[ii]-minY)*cy);
               x2:=u0+round((X[jj]-minX)*cx);
               y2:=v0-round((Y[jj]-minY)*cy);
               x3:=u0+round((X[kk]-minX)*cx);
               y3:=v0-round((Y[kk]-minY)*cy);
               //Draw
           arElem[1]:=Point(x1,y1);
           arElem[2]:=Point(x2,y2);
           arElem[3]:=Point(x3,y3);
           arElem[4]:=Point(x1,y1);
           Polygon(arElem);
           PolyLine(arElem);
           end;//j
       end;//if
       Brush.Color:=clWhite;
    end;{with}
    end;//DrawFillSegm
//==============================================================
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

  assignFile(f,n_fsgm);Reset(f);
  Readln(f);//Empty
  Readln(f,NSEGM);
  for i:=1 to NSEGM do
      Readln(f,k,MasKESegm[i,1],MasKESegm[i,2],MasKESegm[i,3]);
  Readln(f,k);//Holes or ISLANDS!!!
  RabIselands:=k;
  if k>0 then
    for i:=1 to k do
      Readln(f,Mark,CenterHoles[i,1],CenterHoles[i,2]);
  CloseFile(f);
//----------------   NewNumbers!!!  -------------------------
       SORT_Nods(X,Y,NUZ,MasNom); // СОРТИРОВКА по Х,У-> MasNom
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
                ii:=NewNom(k1); jj:=NewNom(k2);//Новые номера
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
// СПИСКИ ТТ. ГРАНИЦ  по типу меток
    for i:=1 to kFrontPoint do begin
           k1:=MasMarks[i,1];
           Mark:=MasMarks[i,2];
                ii:=NewNom(k1);//Новый номер узла границы
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
End;
//------------------------------------------------------------
procedure Set_list(var arList:tMas);
  var i:integer;
begin
   for i:=1 to N_List do
     arList[i]:=TList.Create;
end;
procedure clear(var __l : TList);
var i : integer;
begin
     for i := 0 to __l.Count - 1 do
         dispose(__l.Items[i]);

     __l.clear;
end;
procedure Set_listSegm(var arListSegm:tMasSegm);
  var i:integer;
begin
   for i:=1 to N_ISELAND+4 do
     arListSegm[i]:=TList.Create;
end;
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
