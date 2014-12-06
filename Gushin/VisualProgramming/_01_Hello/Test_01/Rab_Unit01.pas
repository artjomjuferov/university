unit Rab_Unit01;

interface
   const NN=500;
   Type TMas=array[1..NN]of integer;
   var a:integer=2;
       b:integer=2;
       c:integer;
       Mas:TMas;
       N:integer=100;
       K:integer=1000;
       procedure FillMas;
implementation
       procedure FillMas;
           var i:integer;
         begin
           for i:=1 to N do Mas[i]:=Random(k);
         end;
end.
