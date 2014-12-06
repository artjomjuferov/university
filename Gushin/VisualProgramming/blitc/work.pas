unit work;

interface
  const
    Nmax=1000;
  type
    T_array=array[1..Nmax] of Integer;
  var
    a:integer=1;
    b:integer=1000;
    n:integer=100;
    mas,mas1:T_array;
    procedure Fill(m:integer);
    function Equal(x:Integer):Boolean;
implementation
    procedure Fill(m:integer);
    var
      i:Integer;
    begin
      for i:=1 to m do
          mas[i]:=Trunc(a+(b-a)*random);
    end;
    function Equal(x:Integer):Boolean;
    var
      s:string;
      c:Char;
      i:integer;
    begin
      Str(x,s);
      result:=false;
      c:=s[1];
      for i:=2 to Length(s) do
          if s[i]<>c then exit;
      result:=true;
    end;

end.
