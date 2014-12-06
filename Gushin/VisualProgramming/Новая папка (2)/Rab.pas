unit Rab;

interface

const NMAX=100;

var n:integer=NMAX;
    a:integer=1;
    b:integer=1000;
    x:array[1..NMAX] of integer;

procedure fillmas(m:integer);
function prime(m:integer):boolean;

implementation

procedure fillmas(m:integer);
var i:integer;
begin
  for i:=1 to m do
      x[i]:=Trunc(a+(b-a)*random);
end;
function prime(m:integer):boolean;
var i:integer;
begin
  result:=false;
  if m<2 then exit;
  if not odd(m) and (m<>2) then exit;
  i:=3;
  while i<=sqrt(m) do begin
        if m mod i=0 then exit;
        inc(i);
  end;
  result:=true;
end;
end.

