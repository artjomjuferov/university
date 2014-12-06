unit Work;

interface
  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Menus, Author, Task, StdCtrls, Buttons, Clipbrd;

  var
    word1,word2:array[1..1000] of string;
    mas:array[1..1000] of Integer;
    n,m:integer;

  procedure analiz(Memo:TMemo);
  function del(s:string):string;
  function povtor(s:string):Boolean;

implementation
procedure analiz(Memo:TMemo);
var
  i,j:integer;
  s,w:string;
begin
  s:=Memo.Text;
  s:=s+'.';
  i:=1;
  n:=0;
  m:=0;
  while i<= Length(s) do begin
        if s[i] in ['A'..'Z','a'..'z','À'..'ß','à'..'ÿ','0'..'9'] then begin
            w:='';
            while s[i] in ['A'..'Z','a'..'z','À'..'ß','à'..'ÿ','0'..'9'] do begin
                  w:=w+s[i];
                  inc(i);
            end;
            if not povtor(w) then begin
                inc(n);
                word1[n]:=w;
            end
            else begin
                inc(m);
                word2[m]:=del(w);
            end;
        end
        else inc(i);
  end;

  for i:=1 to n do
      for j:=1 to n do
          if word1[i]<word1[j] then begin
              w:=word1[i];
              word1[i]:=word1[j];
              word1[j]:=w;
          end;
end;

 function povtor(s:string):boolean;
 var
  i,j:integer;
 begin
   result:=false;
   for i:=1 to Length(s) do
        for j:=1 to Length(s) do begin
            if i=j then continue;
            if s[i]=s[j] then begin
                result:=true;
                exit;
            end;
        end;
 end;

 function del(s:string):string;
 var
  i:Integer;
 begin
    i:=1;
    while i<=Length(s) do begin
        if s[i] in ['a','A','o','O','u','U','e','E','i','I','ó','Ó','å','Å','û','Û',
            'à','À','î','Î','ý','Ý','ÿ','ß','è','È','þ','Þ'] then begin
              Delete(s,i,1);
              Continue;
        end;
        inc(i);
    end;
    result:=s;
 end;
end.
