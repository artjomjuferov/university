unit TxtWWW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrTxtWWW = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrepDATA;
  end;

var
  frTxtWWW: TfrTxtWWW;

implementation

{$R *.DFM}
Uses Un_WWW;
     procedure TfrTxtWWW.PrepDATA;
       var st,s1,s2:string;
           i,j,rMark,k,kkk,kOld:integer;
           __p : pR;
       begin
         st:=IntToStr(NN)+' 2 0 1';
         Memo1.Clear;
         Memo1.Lines.Add(st); kkk:=0;
         for i:=1 to kUchWWW do begin
             k:=arListMKE[i].Count;
             for j:=0 to k-1 do begin
                INC(kkk);
                __p:= arListMKE[i].Items[j];
                rMark:=__p^.Mark;
                Str(__convert_x(__p^.X):10:5,s1);
                Str(__convert_y(__p^.Y):10:5,s2);
                st:=IntToStr(kkk)+' '+s1+' '+s2+' '+IntToStr(rMark);
                Memo1.Lines.Add(st);
             end;//j
         end;//i
         Memo1.Lines.Add(IntToStr(kkk)+' 1');//Сегментов
         kkk:=0;
         k:=arListMKE[1].Count; kOld:=0;
         for j:=1 to k-1 do begin
            INC(kkk);
            st:=IntToStr(kkk)+' '+
                IntToStr(kOld+j)+' '+IntToStr(kOld+j+1)+' 1';
            Memo1.Lines.Add(st);
         end;
         INC(kOld,k);
         k:=arListMKE[2].Count;
         for j:=1 to k+1 do begin
            INC(kkk);
            st:=IntToStr(kkk)+' '+
                IntToStr(kOld+j-1)+' '+IntToStr(kOld+j)+' 2';
            Memo1.Lines.Add(st);
         end;
         INC(kOld,k);
         k:=arListMKE[3].Count;
         for j:=1 to k-1 do begin
            INC(kkk);
            st:=IntToStr(kkk)+' '+
                IntToStr(kOld+j)+' '+IntToStr(kOld+j+1)+' 3';
            Memo1.Lines.Add(st);
         end;
         INC(kOld,k);
         k:=arListMKE[4].Count;
         for j:=1 to k+1 do begin
            INC(kkk);
            if j<k+1 then
            st:=IntToStr(kkk)+' '+
                IntToStr(kOld+j-1)+' '+IntToStr(kOld+j)+' 4'
                     else
            st:=IntToStr(kkk)+' '+
                IntToStr(kOld+j-1)+'   1    4';//Замыкание!
            Memo1.Lines.Add(st);
         end;
         INC(kOld,k);
//---------  ISELANDS -----------------------------------
         for i:=5 to kUchWWW do begin
              k:=arListMKE[i].Count;
              for j:=1 to k do begin
                 INC(kkk);
                 if j<k then
            st:=IntToStr(kkk)+' '+
                IntToStr(kOld+j)+' '+IntToStr(kOld+j+1)+' '+
                IntToStr(i)
                     else
            st:=IntToStr(kkk)+' '+
                IntToStr(kOld+j)+'  '+IntToStr(kOld+1)+' '+
                IntToStr(i);//Замыкание!
            Memo1.Lines.Add(st);
         end;//j
          INC(kOld,k);
         end;//i

         Memo1.Lines.Add(IntToStr(NHole));//Островов
         k:=arListMKE[kUchWWW+1].Count;
         for j:=0 to k-1 do begin
                __p:= arListMKE[kUchWWW+1].Items[j];
                Str(__convert_x(__p^.X):10:5,s1);
                Str(__convert_y(__p^.Y):10:5,s2);
                st:=IntToStr(j+1)+' '+s1+' '+s2;
                Memo1.Lines.Add(st);
         end;
        
       end;
procedure TfrTxtWWW.SpeedButton1Click(Sender: TObject);
  var i,k:integer;
      n_f:string;
      FF:TEXTFILE;
begin
    SaveDialog1.InitialDir:=Path_DATA;
   if SaveDialog1.Execute then begin
         n_f:=Savedialog1.FileName;
         AssignFile(FF,n_f);Rewrite(FF);
         k:=Memo1.Lines.Count;
         for i:=0 to k-1 do
            writeln(FF,Memo1.Lines[i]);
         CloseFile(FF);


         ShowMessage('Ok!'#10+n_f);

   end;//if
end;

procedure TfrTxtWWW.SpeedButton4Click(Sender: TObject);
var i,k:integer;
      n_f:string;
      FF:TEXTFILE;
begin
       SaveDialog1.InitialDir:=Path_DATA;
   if SaveDialog1.Execute then begin
         n_f:=SaveDialog1.FileName;

         AssignFile(FF,n_f);Rewrite(FF);
         k:=Memo1.Lines.Count;
         for i:=0 to k-1 do
            writeln(FF,Memo1.Lines[i]);
         CloseFile(FF);
         //ДЛЯ  Т Р И А Н Г У Л Я Ц И И
         fn:=n_f;
         fp:=ExtractFilePath(fn);
         flPOLY:=TRUE;
         ShowMessage('Ok!'#10+n_f);
         
   end;//if
end;

end.
