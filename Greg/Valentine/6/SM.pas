program SM;

{$APPTYPE CONSOLE}
{$R+,I+,Q+}

uses
  SysUtils;
type //T_array=array[1..10000000] of string;
    T_array1=array[1..10000000] of integer;
procedure quick_sort (a,b:integer; s:string; var x:T_array1);
var m,l,r,t1:integer;
    k:string;
begin
 if a>=b then exit;
 m:=random(b-a+1)+a;
 k:=s[x[m]];
 l:=a-1;
 r:=b+1;
 repeat
  repeat inc(l); until s[x[l]]>=k;
  repeat dec(r); until s[x[r]]<=k;
  if l>=r then break;
  //t1:=x1[l];
  //x1[l]:=x1[r];
  //x1[r]:=t1;
   t1:=x[l];
  x[l]:=x[r];
  x[r]:=t1;
 until false;
 l:=r;
 r:=l+1;
 quick_sort(a,l,s,x);
 quick_sort(r,b,s,x);
end;
var i,j,j1,n,h,k:integer;
    s:string;
    s1,s11,pos,start,size:T_array1;
    //c:T_array;
    flag:array[1..1000000] of boolean;
begin
  reset(input,'input.txt');
  rewrite(output,'output.txt');
  readln(s);
  s:=s+'$';
  n:=length(s);
  for i:=1 to n do s1[i]:=i;
  quick_sort(1,n,s,s1);

  for i:=1 to n do begin
      pos[s1[i]]:=i;
      flag[i]:=false;
  end;
  flag[1]:=true;
  start[1]:=1;
  for i:=2 to n do begin
      if s[s1[i]]<>s[s1[i-1]] then begin
         flag[i]:=true;
         start[i]:=i;
      end else start[i]:=start[i-1];
  end;
  h:=1;
  while h<n do begin
       fillchar(size,sizeof(size),0);
       for i:=1 to n do begin
           if s1[i]>h then begin
              j:=s1[i]-h ;
              k:=start[pos[j]];
              s11[k+size[k]]:=j;
              if size[k]>0 then begin
                 j1:=s11[k+size[k]-1];
                 if start[i]<>start[pos[j1+h]] then flag[k+size[k]]:=true;
              end;
              inc(size[k]);
           end;
           if (s1[i]+h)>n then s11[i]:=s1[i];
       end;
       for i:=1 to n do begin
          s1[i]:=s11[i];
          pos[s1[i]]:=i;
          if (flag[i]) then start[i]:=i else start[i]:=start[i-1];
       end;
       h:=h*2;
  end;
  for i:=2 to n do write(s1[i],' ');
end.
