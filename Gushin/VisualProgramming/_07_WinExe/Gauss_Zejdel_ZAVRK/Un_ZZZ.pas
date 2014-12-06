unit Un_ZZZ;

interface
    Uses SysUtils;
    Const NN = 50;
    Type tmat=array[1..NN,1..NN+1]of real;
        tvec =array[1..NN]of real;
   var  n : integer =20; {Т Е С Т   -> X=(1, 2, 3)}
   var
     mat:array[1..3,1..3]of real=
      ((1,2,3),(3,2,1),(1,1,2));
     b:array[1..3]of real=(14, 10, 9);
     mat2:array[1..2,1..2]of real = ((1,5),(5,1));
     b2:array[1..2]of real =(11,7);

   var 
       rmat,trgmat,l,ra, normmat:tmat;
       rb, trgb:tvec;
       rx:tvec;
       kk:integer;  // Итераций Зейделя
       D,p,c : real;
   function GAUSS_N(n:integer;a:tmat;var v:tvec):Boolean;
   function Zejdel_N(n:integer;normmat:tmat;var x:tvec; var kk:integer):Boolean;
   procedure FillMas;
   procedure NormMatr;
   procedure det_mat(n:integer;a:tmat;var D,p,c:real);
implementation
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


   procedure NormMatr;
      var i,j,k: integer; c : tmat; d: tvec; r: real;
      begin
        for i:=1 to n do
          for j:=1 to n do begin
              c[i,j]:=0;
              for k:=1 to n do
                  c[i,j]:=c[i,j]+ra[k,i]*ra[k,j];
       end;
       for i:=1 to n do begin
          d[i]:=0;
          for k:=1 to n do
              d[i]:=d[i]+ra[k,i]*ra[k,n+1];
       end;

       for i:=1 to n do begin
          r:=c[i,i]; d[i]:=d[i]/r;
          for j:=1 to n do
              c[i,j]:=c[i,j]/r;
       end;
      
       normmat := c;
       for i:=1 to n do normmat[i,n+1] := d[i];
      end;
   procedure FillMas;
      var i,j: integer; r : real;
      begin
        for i:=1 to N do   for j:=1 to N do
            if (i<>j) then rmat[i,j] := 100 * random else rmat[i,j] := random;
        for i:=1 to N do rmat[i,n+1] := 10 * random;
        ra := rmat;
      end;


   function GAUSS_N(n:integer;a:tmat;var v:tvec):Boolean;
     var i,j,k:integer;
     Begin
        GAUSS_N:=false;
        for k:=1 to n-1 do Begin{1}
           if a[k,k]=0 then exit;
           a[k,n+1]:=a[k,n+1]/a[k,k];
           for j:=k+1 to n do begin{2}
              a[k,j]:=a[k,j]/a[k,k];

              for i:=k+1 to n do
                 a[i,j]:=a[i,j]-a[i,k]*a[k,j];

              a[j,n+1]:=a[j,n+1]-a[j,k]*a[k,n+1]
                               end;{2}
                             End;{1}
              //trgmat := a;
            {Обратный ход}
            a[n,n+1]:=a[n,n+1]/a[n,n];
            for i:=n-1 downto 1 do
              for j:=i+1 to n do
                 a[i,n+1]:=a[i,n+1]-a[i,j]*a[j,n+1];
             for i:=1 to n do v[i]:=a[i,n+1];
             GAUSS_N:=true;
     End;

  function Zejdel_N(n:integer;normmat:tmat;var x:tvec; var kk:integer):Boolean;
     const kLIMIT=30000; eps = 1e-6;
     var Y:tVec; i,j,k:integer; r,maxdel:real;
     Begin
        ZEJDEL_N:=TRUE;
        for i:=1 to n do x[i]:=normmat[i,n+1];
       kk:=0;
       Repeat
          maxdel:=0;
          for i:=1 to n do begin
             y[i]:=normmat[i,n+1];
             for j:=1 to n do
                 if i<>j then y[i]:=y[i]-normmat[i,j]*x[j];
             r:=abs(y[i]-x[i]);if r>maxdel then maxdel:=r;
             x[i]:=y[i];
          end;
          Inc(kk);  if kk>kLIMIT then begin ZEJDEL_N:=FALSE;Exit end;
       until maxdel<eps;

     End;

end.
