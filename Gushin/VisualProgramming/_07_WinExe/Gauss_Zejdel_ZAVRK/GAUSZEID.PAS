program Gen_SYS_LIN_UR;{Генератор данных систем линейных уравнений}
   {$X+}
   Uses CRT;
   const n=7;{Порядок системы}
         K=25;{Вариантов задач}
         n_f='s_lin_Ur.txt';{Файл подготовленных задач}
   Type tmat=array[1..10,1..10]of real; tvec =array[1..10]of real;
{---------------------------------------------------------------------}
  function fr:real;
     const A=-10;B=10;
     begin  fr:=a+(b-a)*Random end;
{---------------------------------------------------------------------}
   function GAUSS(n:integer;a:tmat;b:tvec;var v:tvec):Boolean;
     var i,j,k:integer;
         r:real; fl:boolean;
     Begin
        GAUSS:=false;
        for k:=1 to n-1 do Begin{1}
               {Поиск ведущего элемента}
           if a[k,k]=0 then begin{a}
                fl:=false;
                for i:=k+1 to n do
                      if abs(a[i,k])>0 then begin{b}
                          fl:=true;{нашли !!!}
                          for j:=1 to n do begin{c}
                             r:=a[k,j];a[k,j]:=a[i,j];a[i,j]:=r;
                                           end;{c}
                             r:=b[k];b[k]:=b[i];b[i]:=r;
                             break;
                                             end;{b}
                          if not fl then  exit;{Нет ведущего}
                             end;{a}
{ --------  прямой ход ----------------------}
           b[k]:=b[k]/a[k,k];
           for j:=k+1 to n do begin{2}
              a[k,j]:=a[k,j]/a[k,k];

              for i:=k+1 to n do
                 a[i,j]:=a[i,j]-a[i,k]*a[k,j];

              b[j]:=b[j]-a[j,k]*b[k]
                               end;{2}
                             End;{1}
            {Обратный ход}
            b[n]:=b[n]/a[n,n];
            for i:=n-1 downto 1 do
              for j:=i+1 to n do  b[i]:=b[i]-a[i,j]*b[j];
             v:=b;GAUSS:=true;
     End;
 {----------------------------------------------------------------------}
Function ZEIDEL(const A:tMat; const B:tVec;N:integer; Eps:real;
                                        var X:tVec; var KK:word):Boolean;
    const kLIMIT=30000;
    var C:tMat;D,Y:tVec; i,j,k:integer; r,maxdel:real;
    begin
       ZEIDEL:=TRUE;
       for i:=1 to n do
          for j:=1 to n do begin
              c[i,j]:=0;
              for k:=1 to n do
                  c[i,j]:=c[i,j]+a[k,i]*a[k,j];
       end;
       for i:=1 to n do begin
          d[i]:=0;
          for k:=1 to n do
              d[i]:=d[i]+a[k,i]*b[k];
       end;
       for i:=1 to n do begin
          r:=c[i,i]; d[i]:=d[i]/r;
          for j:=1 to n do
              c[i,j]:=c[i,j]/r;
       end;
       for i:=1 to n do x[i]:=d[i];
       kk:=0;
       Repeat
          maxdel:=0;
          for i:=1 to n do begin
             y[i]:=d[i];
             for j:=1 to n do
                 if i<>j then y[i]:=y[i]-c[i,j]*x[j];
             r:=abs(y[i]-x[i]);if r>maxdel then maxdel:=r;
             x[i]:=y[i];
          end;
          Inc(kk);  if kk>kLIMIT then begin ZEIDEL:=FALSE;Exit end;
       until maxdel<eps;
    end;
{---------------------------------------------------------------------}
     procedure det_mat(n:integer;a:tmat;var D,p,c:real);
        var i,j,k,l:integer;   s,r:real;
            y:array[1..10,1..10]of real;
        Begin    p:=1;c:=0;D:=1;
        for i:=1 to n do Begin{1}
           y[i,1]:=a[i,1];
           for j:=2 to n do begin{2}
              if i>=j then k:=j-1 else k:=i-1;
              s:=0;  for l:=1 to k do s:=s+y[i,l]*y[l,j];
              y[i,j]:=a[i,j]-s;
              if j>i then y[i,j]:=y[i,j]/y[i,i];
                             end{2};
          r:=y[i,i];D:=D*r;
          while abs(r)<1 do begin
                              r:=10*r;
                              c:=c-1;
                            end;
         p:=r*p;
         while abs(p)>10 do begin
                              p:=p/10;
                              c:=c+1;
                           end;
                        End;{1}
     END;{Det_Mat}
{-------------------------------------------------------------------}
  var f:TEXT;
      a:tmat;
      b,x:tvec; D,P,C:real;
      i,j,l:integer; kk:WORD;
   Begin ClrScr;
      Assign(f,n_f);Rewrite(f);
      Randomize;
    for l:=1 to k do BEGIN
      writeln('*',l);
      writeln(' ':5,'Решить систему линейных уравнений  AX=B');
      writeln(' ':5,'Матрица А',' ':12,' ':(n-3)*6,'вектор В');
      writeln(f,'*',l);
      writeln(f,' ':5,'Решить систему линейных уравнений  AX=B');
      writeln(f,' ':5,'Матрица А',' ':12,' ':(n-3)*6,'вектор В');
      for i:=1 to n do begin
        for j:=1 to n do begin
           a[i,j]:=fr;write(a[i,j]:6:2); write(f,a[i,j]:6:2);
                          end;
        b[i]:=fr;  writeln(b[i]:13:2);writeln(f,b[i]:13:2);
                         end;
    det_mat(n,a,D,p,c);
  writeln('Определитель равен D=P*10^C,  где Р=',p:12:10,'  C=',c:5:0);
  writeln(D,'-------------------------------------------------');
      if GAUSS(n,a,b,x) then  begin write('Р Е Ш Е Н И Е ->');
               for i:=1 to n do write(x[i]:6:2);writeln;
             end              else  writeln('Р Е Ш Е Н И Я  Н Е Т !');
      if ZEIDEL(a,b,n,1e-5,x,kk) then  begin write('Р Е Ш Е Н И Е ->');
               for i:=1 to n do write(x[i]:6:2);writeln('  kk=',kk);
             end              else  begin
                     writeln('Р Е Ш Е Н И Я  Н Е Т ! kk=',kk);
               for i:=1 to n do write(x[i]:6:2);writeln;
             end;
  writeln('--------------------------------------------------------');
writeln;  Repeat until Keypressed;While Keypressed do Readkey;
writeln(f,'--------------------------------------------------------');
writeln(f);              END;Close(f);writeln('Press any Key...');
Repeat until KeyPressed;
end.
