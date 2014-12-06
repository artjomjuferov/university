unit work;

interface
  const Nmax=100;
  n:Integer=10;
  a:Integer=1;
  b:Integer=1000;
  mas:array[1..100] of Integer;
  procedure FillMas;
implementation
  procedure FillMas();
  var
    i:integer;
  begin
    for i:=1 to n do
        mas[i]:=Trunc(a+(b-a)*random);
  end;

end.
