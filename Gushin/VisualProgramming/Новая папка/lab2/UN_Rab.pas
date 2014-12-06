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
       Index:integer=0;
       Mas,Mas1:TMas;
       MasCol,MasRow,MasRow1:TMasminMax;
       nomRow:integer=3;
       nomCol:integer=0;
       procedure FillMas;
       procedure DrawChart(Chart:TChart;Series:TLineSeries;nomRow,nomCol:integer);
       procedure DrawChart1(Chart:TChart;Series:TLineSeries;nomRow,nomCol:integer);
       function MAX(Mas:TMas;m,n:integer):integer;
implementation

function MAX(Mas:TMas;m,n:integer):integer;
var
  j,a:integer;
begin
  a:=Mas[m,1];
  for j:=1 to n do
      if Mas[m,j]>a then a:=Mas[m,j];
  MAX:=a;
end;

procedure FillMas;
var
  i,j,tmp,t,kk:integer;
begin
  for i:=1 to m do
      for j:=1 to n do begin
          Mas[i,j]:=random(k);
          Mas1[i,j]:=Mas[i,j];
      end;

  for i:=1 to m do begin //MinMax по строкам
      MasRow[i,1]:=Mas[i,1];
      MasRow[i,2]:=Mas[i,1];
      for j:=1 to n do
          if Mas[i,j]>MasRow[i,1] then MasRow[i,1]:=Mas[i,j];
      tmp:=MasRow[i,1];
      MasRow[i,2]:=0;
      while tmp>0 do begin
            MasRow[i,2]:=MasRow[i,2]+tmp mod 10;
            tmp:=tmp div 10;
      end;
  end;

  for i:=1 to m do begin
      MasRow1[i,1]:=MasRow[i,1];
      MasRow1[i,2]:=MasRow[i,2];
  end;

  //сортировка
  for i:=1 to m-1 do begin
      for j:=i+1 to m do begin
          if MasRow1[i,2]>MasRow1[j,2] then begin
              t:=MasRow1[i,2];
              MasRow1[i,2]:=MasRow1[j,2];
              MasRow1[j,2]:=t;
              t:=MasRow1[i,1];
              MasRow1[i,1]:=MasRow1[j,1];
              MasRow1[j,1]:=t;
              for kk:=1 to n do begin
                  t:=Mas1[i,kk];
                  Mas1[i,kk]:=Mas1[j,kk];
                  Mas1[j,kk]:=t;
              end;
          end;
      end;
  end;
end;

procedure DrawChart(Chart:TChart;Series:TLineSeries;nomRow,nomCol:integer);
var
  i:integer;
begin
  Series.Clear;
  case Index of
        0: if nomRow<>0 then  begin
           Chart.Title.Text.Clear;
           Chart.Title.Text.Add('Строка '+IntToStr(nomRow));
           for i:=1 to n do
               Series.Add(Mas[nomRow,i],IntToStr(i),clRed)
           end
           else begin
               Chart.Title.Text.Clear;
               Chart.Title.Text.Add('Столбец '+IntToStr(nomCol));
               for i:=1 to m do
                   Series.Add(Mas[i,nomCol],IntToStr(i),clGreen);
           end;
        1:begin
               Chart.Title.Text.Clear;
               Chart.Title.Text.Add('График суммы цифр максимумов строк');
               for i:=1 to m do
                   Series.Add(MasRow[i,2],IntToStr(i),clGreen);
          end;
  end;
end;

procedure DrawChart1(Chart:TChart;Series:TLineSeries;nomRow,nomCol:integer);
var
  i:integer;
begin
  Series.Clear;
  case Index of
        0: if nomRow<>0 then  begin
           Chart.Title.Text.Clear;
           Chart.Title.Text.Add('Строка '+IntToStr(nomRow));
           for i:=1 to n do
               Series.Add(Mas1[nomRow,i],IntToStr(i),clRed)
           end
           else begin
               Chart.Title.Text.Clear;
               Chart.Title.Text.Add('Столбец '+IntToStr(nomCol));
               for i:=1 to m do
                   Series.Add(Mas1[i,nomCol],IntToStr(i),clGreen);
           end;
        1:begin
               Chart.Title.Text.Clear;
               Chart.Title.Text.Add('График суммы цифр максимумов строк');
               for i:=1 to m do
                   Series.Add(MasRow1[i,2],IntToStr(i),clGreen);
          end;
  end;
end;


end.
