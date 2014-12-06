unit Work;

interface
  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Menus, Grids, TeEngine,
    Series, ExtCtrls, TeeProcs, Chart;

  var
    n:Integer=10;
    m:Integer=10;
    k:Integer=100;
    nomRow:integer=3;
    nomCol:integer=0;
    mas,mas1:array[1..12,1..12] of Integer;
    procedure Fill;
    procedure DrawChart(Chart:TChart;Series:TLineSeries;nomRow,nomCol:integer);
implementation
    procedure Fill();
    var
      i,j,max,sum,t,ii:integer;
    begin
      for i:=1 to n do
          for j:=1 to m do mas[i,j]:=Random(k);
      for i:=1 to n do begin
          max:=0;
          for j:=1 to m do
              if mas[i,j]>max then max:=mas[i,j];
          mas[i,m+1]:=max;
          sum:=0;
          while max>0 do begin
                sum:=sum+max mod 10;
                max:=max div 10;
          end;
          mas[i,m+2]:=sum;
      end;
      for j:=1 to m do begin
          max:=0;
          for i:=1 to m do
              if mas[i,j]>max then max:=mas[i,j];
          mas[n+1,j]:=max;
          sum:=0;
          while max>0 do begin
                sum:=sum+max mod 10;
                max:=max div 10;
          end;
          mas[n+2,j]:=sum;
      end;

      for i:=1 to n+2 do
          for j:=1 to m+2 do mas1[i,j]:=mas[i,j];

      for i:=1 to n do begin
          for j:=1 to m do begin
              if mas1[i,m+2]<mas1[j,m+2] then begin
                 for ii:=1 to m+2 do begin
                     t:=mas1[j,ii];
                     mas1[j,ii]:=mas1[i,ii];
                     mas1[i,ii]:=t;
                 end;
              end;
          end;
      end;
    end;

    procedure DrawChart(Chart:TChart;Series:TLineSeries;nomRow,nomCol:integer);
    var i:integer;
    begin
      Series.Clear;
      if nomRow<>0 then  begin
          Chart.Title.Text.Clear;
          Chart.Title.Text.Add(IntToStr(nomRow));
          for i:=1 to n do
              Series.Add(mas[nomRow,i],IntToStr(i),clRed)
      end
      else begin
          Chart.Title.Text.Clear;
          Chart.Title.Text.Add(IntToStr(nomCol));
          for i:=1 to m do
          Series.Add(mas[i,nomCol],IntToStr(i),clGreen);
      end;
    end;

end.
