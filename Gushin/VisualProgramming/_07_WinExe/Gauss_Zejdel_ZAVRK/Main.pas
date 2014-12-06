unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    StringGrid3: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Label5: TLabel;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
      Uses Un_ZZZ;
procedure TForm1.Button1Click(Sender: TObject);
   var st,s1:string;
begin
    N := StrToInt(Edit1.Text);
    if N>20 then begin N := 20; Edit1.Text := IntToStr(N); end;
    FillMas;
    NormMatr;

    if  not GAUSS_N(n,normmat, rb) then begin
            ShowMessage('НЕТ  РЕШЕНИЯ м.ГАУССА!');
            Exit;
    end;
    if  not ZEJDEL_N(n,normmat, rx, kk) then begin
            ShowMessage('НЕТ  РЕШЕНИЯ  м.ЗЕЙДЕЛЯ!');
            Exit;
    end;
    StringGrid1.ColCount := N+2;
    StringGrid1.RowCount := N+1;
    StringGrid1.Refresh;
    StringGrid2.ColCount := N+2;
    StringGrid2.RowCount := N+1;
    StringGrid2.Refresh;
    StringGrid3.ColCount := N+1;
    StringGrid3.Refresh;
    Label5.Caption := 'kk =' + IntToStr(kk);
  //-----------------------------------------
  Memo1.Clear;
    det_mat(n,normmat,D,p,c);
    st := 'Определитель равен D=P*10^C,  где Р=';
    str(p:12:10,s1); st:= st + s1 + ' C =';
    str(c:5:0,s1);   st:= st + s1;
    Memo1.Lines.Add(st);
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var st : string;
begin
   if (ACol = 0) and (ARow>0) then st := IntToStr(ARow)
                              else
   if (ACol > 0) and (ARow=0) then st := IntToStr(ACol)
                              else
   if (ACol > 0) and (ARow>0) then STR(ra[ARow,ACol]:6:2,st)
                              else st :='';
   with   StringGrid1.Canvas  do begin
        if   (ACol = 0) or (ARow=0) then  Brush.Color := clCream
                                    else  Brush.Color := clWhite;
        if (ACol > 0) and (ARow>0) and (ARow = ACol) then Brush.Color := clAqua;
        if (ACol = n+1) and (ARow>0)  then Brush.Color := clYellow;
        FillRect(Rect);
        TextOut(Rect.Left, Rect.Top,st);
   end; // with
end;

procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var st : string;
begin
   if (ACol = 0) and (ARow>0) then st := IntToStr(ARow)
                              else
   if (ACol > 0) and (ARow=0) then st := IntToStr(ACol)
                              else
   if (ACol > 0) and (ARow>0) then STR(normmat[ARow,ACol]:7:3,st)
                              else st :='';
   with   StringGrid2.Canvas  do begin
        if   (ACol = 0) or (ARow=0) then  Brush.Color := clCream
                                    else  Brush.Color := clWhite;
        if (ACol > 0) and (ARow>0) and (ARow = ACol) then Brush.Color := clAqua;
        if (ACol = n+1) and (ARow>0)  then Brush.Color := clYellow;
        FillRect(Rect);
        Font.Name :='SmallFonts'; Font.Size :=7;
        TextOut(Rect.Left, Rect.Top,st);
   end; // with
end;


procedure TForm1.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var st : string;
begin
   if (ACol = 0) and (ARow>0) then st := 'X[i]'
                              else
   if (ACol > 0) and (ARow=0) then st := IntToStr(ACol)
                              else
   if (ACol > 0) and  (ARow=1) then STR(rb[ACol]:7:3,st)
                              else
   if (ACol > 0) and  (ARow=2) then STR(rX[ACol]:7:3,st)
                              else st :='';
   with   StringGrid3.Canvas  do begin
        if   (ACol = 0) or (ARow=0) then  Brush.Color := clCream
                                    else  Brush.Color := clYellow;
        FillRect(Rect);
        Font.Name :='SmallFonts'; Font.Size :=7;
        TextOut(Rect.Left, Rect.Top,st);
   end; // with

end;

procedure TForm1.Button2Click(Sender: TObject);
   var st, s1 : string;
begin
//
   n := 3;  Edit1.Text := IntToStr(n);
   rmat[1,1] :=0;   rmat[1,2] :=1;  rmat[1,3] :=1;   rmat[1,4] :=5;
   rmat[2,1] :=1;   rmat[2,2] :=0;  rmat[2,3] :=1;   rmat[2,4] :=4;
   rmat[3,1] :=1;   rmat[3,2] :=1;  rmat[3,3] :=0;   rmat[3,4] :=3;
   ra := rmat;
   NormMatr;

    if  not GAUSS_N(n,normmat, rb) then begin
            ShowMessage('НЕТ  РЕШЕНИЯ  м.Гаусса!');
            Exit;
    end;
    if  not ZEJDEL_N(n,normmat, rx,kk) then begin
            ShowMessage('НЕТ  РЕШЕНИЯ  м.Зейделя!');
            Exit;
    end;
    StringGrid1.ColCount := N+2;
    StringGrid1.RowCount := N+1;
    StringGrid1.Refresh;
    StringGrid2.ColCount := N+2;
    StringGrid2.RowCount := N+1;
    StringGrid2.Refresh;
    StringGrid3.ColCount := N+1;
    StringGrid3.Refresh;
    Label5.Caption := 'kk =' + IntToStr(kk);
  //-----------------------------------------
  Memo1.Clear;
    det_mat(n,normmat,D,p,c);
    st := 'Определитель равен D=P*10^C,  где Р=';
    str(p:12:10,s1); st:= st + s1 + ' C =';
    str(c:5:0,s1);   st:= st + s1;
    Memo1.Lines.Add(st);  
end;

procedure TForm1.Button3Click(Sender: TObject);
   var i,j:integer;  st,s1 : string;
begin
//Определитель м. разложения на треугольные матрицы
 n:=10; Memo1.Clear;
  Memo1.Lines.Add('О П Р Е Д Е Л И Т Е Л Ь  Симметричной  Матрицы А');
        for i:=1 to n do begin
           st:='';
           for j:=1 to n do begin
             if i=j then rmat[i,j]:=1
                    else rmat[i,j]:=0.97;
                  str(rmat[i,j]:5:2,s1); st:= st + s1 + ' ';
                             end;
            Memo1.Lines.Add(st);     end;
     Memo1.Lines.Add ('================================================');
    det_mat(n,rmat,D,p,c);
    st := 'Определитель равен D=P*10^C,  где Р=';
    str(p:12:10,s1); st:= st + s1 + ' C =';
    str(c:5:0,s1);   st:= st + s1;
    Memo1.Lines.Add(st);
end;

end.
