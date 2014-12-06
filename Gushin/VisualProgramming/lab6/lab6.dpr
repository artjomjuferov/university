{$APPTYPE CONSOLE}
{$R+,Q+}

uses
  SysUtils;

type
  T_array=array[0..15] of real;

procedure progonka(alpha,beta,gamma,delta:T_array;n:integer;var u:T_array);
var
  i:integer;
  p,q:T_array;
begin
  u[0]:=3/7;
  //u[0]:=1;
  p[1]:=gamma[1]/beta[1];
  q[1]:=-delta[1]/beta[1];
  for i:=2 to n-1 do begin
      p[i]:=gamma[i]/(beta[i]-alpha[i]*p[i-1]);
      q[i]:=(alpha[i]*q[i-1]-delta[i])/(beta[i]-alpha[i]*p[i-1]);
  end;

  //for i:=1 to n do writeln('p',i,'=',p[i]);
  //for i:=1 to n do writeln('q',i,'=',q[i]);
  u[n]:=(alpha[n]*q[n-1]-delta[n])/(beta[n]-alpha[n]*p[n-1]);
  for i:=n downto 2 do u[i-1]:=p[i-1]*u[i]+q[i-1];
end;

var
  alpha,beta,gamma,delta,x,u,e:T_array;
  mobr:array[1..15,1..15] of real;
  n,i,j,k:integer;
  h,sum:real;

begin
  Rewrite(output,'output.txt');

  n:=15;
  h:=0.3/n;
  for i:=1 to n do begin
      x[i]:=0.7+i*h;
      alpha[i]:=(2*x[i]+h)/(2*h*h*x[i]);
      beta[i]:=(-2*x[i]*x[i]-3*h*h)/(x[i]*x[i]*h*h);
      gamma[i]:=(2*x[i]-h)/(2*h*h*x[i]);
      delta[i]:=3/(x[i]*x[i]);

      {x[i]:=1+i*h;
      alpha[i]:=(1-h);
      beta[i]:=-(2+3*x[i]*h*h);
      gamma[i]:=(1+h);
      delta[i]:=h*h*(2-8*x[i])/(x[i]*x[i]*x[i]);}
  end;
  alpha[1]:=0;
  gamma[n]:=0;

  //проверка достаточного условия применимости метода прогонки
  for i:=1 to n-1 do begin
      if abs(beta[i])>abs(alpha[i])+abs(gamma[i]) then writeln(i,' good')
      else writeln(i,' bad');
  end;

  progonka(alpha,beta,gamma,delta,n,u);

  for i:=1 to n-1 do
      writeln(alpha[i]*u[i-1]-beta[i]*u[i]+gamma[i]*u[i+1]-delta[i]);


  //вычисление обратной матрицы
  Reset(input,'input.txt');

  {for i:=2 to n do a[i,i-1]:=alpha[i];
  for i:=1 to n do a[i,i]:=-beta[i];
  for i:=1 to n-1 do a[i,i+1]:=gamma[i];}

  //проверка достаточного условия применимости метода прогонки
  for i:=1 to n do begin
      if abs(beta[i])>=abs(alpha[i])+abs(gamma[i]) then writeln(i,' good')
      else writeln(i,' bad');
  end;

  for i:=1 to n do
      for j:=1 to n do mobr[i,j]:=0;

  for i:=1 to n do begin
      for j:=1 to n do
          if i=j then e[j]:=1
          else e[j]:=0;
      progonka(alpha,beta,gamma,e,n,u);
      for j:=1 to n-1 do
          writeln(alpha[j]*u[j-1]-beta[j]*u[j]+gamma[j]*u[j+1]-e[j]);
      for j:=1 to n do mobr[j,i]:=u[j];
  end;

 { for i:=1 to n do begin
      for j:=1 to n do write(a[i,j]:5:5,' ');
      writeln;
  end;  }
  for i:=1 to n do begin
      for j:=1 to n do write(mobr[i,j]:5:5,' ');
      writeln;
  end;

  {for i:=1 to n do
      for j:=1 to n do begin
          sum:=0;
          for k:=1 to n do sum:=sum+a[i,k]*mobr[k,j];
          result[i,j]:=sum;
      end;
  for i:=1 to n do result[i,i]:=result[i,i]-1;

  for i:=1 to n do begin
      for j:=1 to n do write(result[i,j],' ');
      writeln;
  end; }
end.
