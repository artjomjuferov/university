{$APPTYPE CONSOLE}
{$R+,Q+}

uses
  SysUtils,Math;

const eps=1e-6;
       eps1=1e-9;
type
  T_array=array[1..100,1..100] of real;
  T_array1=array[1..100]of real;

function normiration(x:T_array1;n:integer):T_array1;
var
  i:integer;
  sum:real;
begin
  sum:=0;
  for i:=1 to n do sum:=sum+power(x[i],2);
  sum:=Power(Sum,0.5);
  for i:=1 to n do x[i]:=x[i]/sum;
  Result:=x;
end;

function matMult(A:T_array; f:T_array1; n:integer):T_array1;
var
  i,j:integer;
  x:T_array1;
begin
  fillchar(x,sizeof(x),0);
  for i:=1 to n do
      for j:=1 to n do x[i]:=x[i]+A[i,j]*f[j];
  result:=x;
end;

function scalarMult(x,y:T_array1;n:integer):real;
var
  i:integer;
  sum:real;
begin
  sum:=0;
  for i:=1 to n do sum:=sum+x[i]*y[i];
  result:=sum;
end;

function solveSLAE(R:T_array;f:T_array1;n:integer):T_array1;
var
  v,z:T_array1;
  sum:real;
  i,j:integer;
begin
  fillchar(v,sizeof(v),0);
  for i:=1 to n do begin
      sum:=0;
      for j:=1 to i-1 do sum:=sum+R[i,j]*v[j];
      v[i]:=(f[i]-sum)/R[i,i];
  end;
  for i:=n downto 1 do begin
      sum:=0;
      for j:=n downto i+1 do sum:=sum+R[j,i]*z[j];
      z[i]:=(v[i]-sum)/R[i,i];
  end;
  result:=z;
end;

function max_eigenvalue(A:T_array; n:integer):real;
var
  i:integer;
  lambda1,lambda2:real;
  z,_z:T_array1;
begin
  //начальное приближение собственного вектора
  for i:=1 to n do z[i]:=1;
  z:=normiration(z,n);
  _z:=matMult(A,z,n);
  lambda1:=scalarMult(_z,z,n);
  repeat
    lambda2:=lambda1;
    z:=normiration(_z,n);
    _z:=matMult(A,z,n);
    lambda1:=scalarMult(_z,z,n)/scalarMult(z,z,n);
  until abs(lambda1/lambda2-1)<eps1;
  writeln('max is ',lambda1);
  result:=lambda1;
end;

function min_eigenvalue(var A:T_array;n:integer):real;//ћетод обратных »тераций
var
  z,_z:T_array1;
  R,Rt:T_array;
  i,j,jj:integer;
  sum,lambda1,lambda2:real;
begin
  //разложение по ’олецкому
  fillchar(R,sizeof(R),0);
  fillchar(Rt,sizeof(Rt),0);

  for j:=1 to n do
      for i:=j to n do begin
          sum:=0;
          if i=j then begin
              for jj:=1 to i-1 do sum:=sum+power(R[i,jj],2);
              R[i,j]:=sqrt(A[i,j]-sum);
          end
          else begin
              for jj:=1 to j-1 do sum:=sum+R[i,jj]*R[j,jj];
              R[i,j]:=(A[i,j]-sum)/R[j,j];
          end;
      end;

  //начальное приближение собственного вектора
  for i:=1 to n do z[i]:=1;
  z:=normiration(z,n);
  _z:=solveSLAE(R,z,n);
  lambda1:=1/scalarMult(_z,z,n);
  //начинаем итерационно искать наименьшее собственное значение
  repeat
    lambda2:=lambda1;
    z:=normiration(_z,n);
    _z:=solveSLAE(R,z,n);
    lambda1:=scalarMult(z,z,n)/scalarMult(_z,z,n);
  until abs(lambda1/lambda2-1)<eps1;
  writeln('min is ',lambda1);
  result:=lambda1;
end;

procedure simple_iteration(h:T_array;f:T_array1;gamma1,gamma2:real;n:integer);
var
  f0,x,_x:T_array1;
  i,j,k:integer;
  tay,sum,max:real;
  flag:boolean;
begin
  //зададим начальное приближение
  for i:=1 to n do x[i]:=1;

  tay:=2/(gamma1+gamma2);
  k:=0;
  while true do begin
        inc(k);
        for i:=1 to n do begin
            sum:=0;
            for j:=1 to n do sum:=sum+h[i,j]*x[j];
            _x[i]:=x[i]-tay*(sum-f[i]);
        end;

        max:=0;
        for i:=1 to n do
            if Abs(_x[i]-x[i])>max then max:=Abs(_x[i]-x[i]);

        if max<eps then Break;
        x:=_x;
  end;

  for i:=1 to n do write(x[i],' ');

  writeln;
  //проверка
  for i:=1 to n do begin
      sum:=0;
      for j:=1 to n do sum:=sum+h[i,j]*x[j];
      writeln(i,' ',abs(sum-f[i]));
  end;
  writeln(' iteration: ', k);
end;

procedure iteration_cheb(h:T_array;f:T_array1;gamma1,gamma2:real;n:integer);
var
    tay,sum,tay0,ksi,p0,M,p1,q,max:real;
    i,k,j,nn:integer;
    x,_x,f0:T_array1;
    seeq:array[0..20] of integer;
    seeq_num:integer;
begin
  //начальное приближение
  for i:=1 to n do x[i]:=1;

  tay0:=2/(gamma1+gamma2);
  ksi:=gamma1/gamma2;
  p0:=(1-ksi)/(1+ksi);

  seeq[0]:=1;
  seeq[1]:=16;
  seeq[2]:=8;
  seeq[3]:=9;
  seeq[4]:=3;
  seeq[5]:=14;
  seeq[6]:=6;
  seeq[7]:=11;
  seeq[8]:=2;
  seeq[9]:=15;
  seeq[10]:=7;
  seeq[11]:=10;
  seeq[12]:=4;
  seeq[13]:=13;
  seeq[14]:=5;
  seeq[15]:=12;

  k:=0;
  seeq_num:=0;
  while true do begin
        inc(k);
        M:=cos((((2*seeq[seeq_num]-1)*pi)/32));
        tay:=tay0/(1+p0*M);
        for i:=1 to n do begin
            sum:=0;
            for j:=1 to n do sum:=sum+h[i,j]*x[j];
            _x[i]:=x[i]-tay*(sum-f[i]);
        end;

        max:=0;
        for i:=1 to n do
            if Abs(_x[i]-x[i])>max then max:=Abs(_x[i]-x[i]);
        if max<eps then Break;

        x:=_x;
        seeq_num:=seeq_num+1;
        seeq_num:=seeq_num mod 16;

  end;

  for i:=1 to n do write(x[i],' ');

  writeln;
  //проверка
  for i:=1 to n do begin
      sum:=0;
      for j:=1 to n do sum:=sum+h[i,j]*x[j];
      writeln(i,' ',abs(sum-f[i]));
  end;
  writeln(' iteration: ', k);

end;


var i,j,n,n_cheb,n_mpi:integer;
    h:T_array;
    ksi,gamma1,gamma2:real;
    f:T_array1;
begin
  reset(input,'input.txt');
  rewrite(output,'output.txt');

  n:=5;
  //заполн€ем матрицу √ильберта
  for i:=1 to n do
      for j:=1 to n do h[i,j]:=1/((i+j)-1);

  //for i:=1 to n do h[i,i]:=i;
  //и вектор свободных членов
  for i:=1 to n do f[i]:=random(n+2)+1;

  {n:=3;
  Read(n);
  for i:=1 to n do
      for j:=1 to n do Read(h[i,j]);
  for i:=1 to n do f[i]:=random(n+2)+1;}

  //ищем минимальное и максимальное собственное значение
  gamma1:=min_eigenvalue(h,n);
  gamma2:=max_eigenvalue(h,n);

  //оценка
  ksi:=gamma1/gamma2;
  n_cheb:=Trunc(Ln(2/eps)/(2*power(ksi,0.5)))+1;
  n_mpi:=Trunc(Ln(1/eps)/(2*ksi))+1;

  Writeln(' ол-во итераций (ћѕ»): ',n_mpi);
  Writeln(' ол-во итераций (чебышев): ',n_cheb);

  //решение методом простых итераций
  simple_iteration(h,f,gamma1,gamma2,n);

  //решение методом простых итераций
  iteration_cheb(h,f,gamma1,gamma2,n);
end.
