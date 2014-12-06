unit Work;

interface
type
  T_rec=record
          len,ang,x,y:Real;
  end;
var
  nMax:Integer=10;
  lMax:Integer=10;
  mas:array[1..10] of T_rec;
  procedure fillmas;

implementation
  procedure fillmas;
  var
    i:Integer;
  begin
    for i:=1 to nMax do begin
        mas[i].len:=Random(lMax);
        mas[i].ang:=Random(360);
        mas[i].x:=mas[i].len*Cos(mas[i].ang*Pi/180);
        mas[i].y:=mas[i].len*Sin(mas[i].ang*Pi/180);
    end;
  end;

end.
