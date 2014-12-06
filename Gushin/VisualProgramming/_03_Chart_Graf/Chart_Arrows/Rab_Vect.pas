unit Rab_Vect;

interface
  Uses SysUtils;
  const NN = 100;
        MaxModul = 10;
  Type TRec = record Modul,Ugol : real; end;
       TMasRec = array[1..NN] of TRec;
       TMasUV = array[1..NN,1..2] of real;
  var MasRec : TMasRec;
      MasUV  : TMasUV;
      N : integer = 10;
  procedure FillMas;


implementation
  procedure FillMas;
    var i: integer; rModul, rUgol : real;
        rU, rV : real;
    begin
        for i:=1 to N do begin
          rModul := random(MaxModul);
          rUgol  := random(360);
          MasRec[i].Modul := rModul;
          MasRec[i].Ugol  := rUgol;

          rU := rModul*Cos(rUgol*Pi/180);
          rV := rModul*Sin(rUgol*Pi/180);
          MasUV[i,1] := rU; MasUV[i,2] := rV;
        end;
    end;


end.
