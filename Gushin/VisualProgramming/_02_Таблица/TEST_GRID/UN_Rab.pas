unit UN_Rab;

interface
  uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Menus, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, Grids;
  
  Type tMas=array[1..10,1..10]of integer;
       tMasMinMax=array[1..10,1..2]of integer;
  var  m:integer=10;
       n:integer=10;
       k:integer=100;
       Mas:TMas;
       MasCol,MasRow:TMasminMax;
       nomRow:integer=3;
       nomCol:integer=0;
       procedure FillMas;
       procedure DrawChart(Chart:TChart;Series:TLineSeries;
                                        nomRow,nomCol:integer);
       function Simple(a:integer):Boolean;
       function Palindrome(a:integer):Boolean;
       function MIN(Mas:TMas;m,n:integer):integer;
       function MAX(Mas:TMas;m,n:integer):integer;
implementation
       function MIN(Mas:TMas;m,n:integer):integer;
          var i,j,a:integer;
          begin
             a:=Mas[1,1];
             for i:=1 to m do
                for j:=1 to n do
                   if Mas[i,j]<a then a:=Mas[i,j];
             MIN:=a;
          end;
       function MAX(Mas:TMas;m,n:integer):integer;
          var i,j,a:integer;
          begin
             a:=Mas[1,1];
             for i:=1 to m do
                for j:=1 to n do
                   if Mas[i,j]>a then a:=Mas[i,j];
             MAX:=a;
          end;
       procedure FillMas;
          var i,j:integer;
          begin
             for i:=1 to m do
                 for j:=1 to n do
                     Mas [i,j]:=random(k);
             for i:=1 to m do begin //MinMax ÔÓ ÒÚÓÍ‡Ï
                MasRow[i,1]:=Mas[i,1]; MasRow[i,2]:=Mas[i,1];
                for j:=1 to n do begin
                  if Mas[i,j]>MasRow[i,2] then MasRow[i,2]:= Mas[i,j];
                  if Mas[i,j]<MasRow[i,1] then MasRow[i,1]:= Mas[i,j];
                end;
             end;
             for j:=1 to n do begin //MinMax ÔÓ ÒÚÓÎ·ˆ‡Ï
                MasCol[j,1]:=Mas[1,j]; MasCol[j,2]:=Mas[1,j];
                for i:=1 to m do begin
                  if Mas[i,j]>MasCol[j,2] then MasCol[j,2]:= Mas[i,j];
                  if Mas[i,j]<MasCol[j,1] then MasCol[j,1]:= Mas[i,j];
                end;
             end;

          end;
       procedure DrawChart(Chart:TChart;Series:TLineSeries;
                                         nomRow,nomCol:integer);
            var i:integer;
          begin
            Series.Clear;
            if nomRow<>0 then  begin
               Chart.Title.Text.Clear;
               Chart.Title.Text.Add('—“–Œ ¿ '+IntToStr(nomRow));
               for i:=1 to n do
                  Series.Add(Mas[nomRow,i],IntToStr(i),clRed)
                     end    else begin
               Chart.Title.Text.Clear;
               Chart.Title.Text.Add('—“ŒÀ¡≈÷ '+IntToStr(nomCol));
               for i:=1 to m do
                  Series.Add(Mas[i,nomCol],IntToStr(i),clGreen);
            end;
          end;
         function Simple(a:integer):Boolean;
           var i:integer;
           begin
              Result:=FALSE;
              if a<4 then begin Result:=TRUE; Exit; end;
              for i:=2 to a-1 do
                if (a mod i =0) then Exit;
              Result:=TRUE;
           end;
         function Palindrome(a:integer):Boolean;
           var i:integer; st:string;
           begin
              Result:=FALSE;if a<11 then Exit;
              st:=IntToStr(a);
              for i:=1 to (Length(st) div 2) do
                 if (st[i]<>st[Length(st)-i+1])then Exit;
              Result:=TRUE;
           end;
end.
