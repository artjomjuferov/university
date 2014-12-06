unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ToolWin, StdCtrls, Buttons, ImgList, Menus;
const Digit=['0'..'9'];
type
  TfrMain = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    ImageList1: TImageList;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    ListBox2: TListBox;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Panel4: TPanel;
    ImageList2: TImageList;
    Panel5: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    procedure FormPaint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.DFM}
 Uses Un_TRG,About_Box,Task;
procedure TfrMain.FormPaint(Sender: TObject);
begin
   with PaintBox1, Canvas do begin
       Brush.Color:=clWhite;//clNavy;
       FillRect(ClientRect);
       if KolPoints>0 then
        DrawPoints(Canvas,Mas,K,Width,Height,0,Height,clBlack(*Yellow*));
       
       if flOutPoints then
        DrawOutTRG(Canvas,Width,Height,0,Height);

       if SelK>0 then
        DrawTRG(Canvas,Width,Height,0,Height);
        if myDrawAb then begin
          MyDrawOutAB(Canvas,Width,Height,0,Height);
        end;
        if myOk then myDrawRmin(Canvas,Width,Height,0,Height);
        if mySqr then MyDrawSQr(Canvas,Width,Height,0,Height);
   end;//with
end;

procedure TfrMain.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var rX,rY:real;
      LX,LY:integer;
begin
  if ToolButton1.Down and(Button=mbLeft)then BEGIN
   LX:=PaintBox1.Width;LY:= PaintBox1.Height;
   Inc(k);
   ListBox1.Items.Add(IntToStr(k)+' '+InttoStr(X)+' '+InttoStr(Y));
   rX:=X/LX; rY:=1-Y/LY;
   mas[k].X:=rX; mas[k].Y:=rY;
   with PaintBox1.Canvas do begin
        Brush.Color:=clAqua; Pen.Color:= clNavy;
        Ellipse(X-2,Y-2,X+2,Y+2);
   end;
   END    else
   if ToolButton1.Down and(Button=mbRight)then BEGIN
      ToolButton1.Down:=FALSE;
      KolPoints:=k;
      StatusBar1.Panels[1].Text:=
                        'KolPoints='+InttoStr(KolPoints);
      Refresh;
   END else Refresh;

end;

procedure TfrMain.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   StatusBar1.Panels[0].Text:='X='+InttoStr(X)+
                            '; Y='+InttoStr(Y);
end;

procedure TfrMain.ToolButton2Click(Sender: TObject);
begin
   k:=0;  ListBox1.Clear;
   SelK:=0;ListBox2.Clear;
   flOutPoints:=FALSE;
   flOutAB:=FALSE;
   flRmin:=FALSE;
    flRmax:=FALSE;
    myDraw:=false;
    myDrawAb:=false;
    myOk:=false;
    mySqr:=false;
    Panel4.Caption:='';
    StatusBar1.Panels[0].Text:='';
    StatusBar1.Panels[1].Text:='';
    StatusBar1.Panels[2].Text:='';
   Refresh;
end;

procedure TfrMain.SpeedButton1Click(Sender: TObject);
   var i,k:integer;
   st:string;
begin
   myOk:=false;
   mySqr:=false;

if ListBox1.Items.Count<2 then Exit;
       ListBox2.Clear; k:=  ListBox1.Items.Count-1;

      if ListBox1.SelCount=0 then begin
         SelK:=k+1;
         for i:=0 to k do   begin
            ListBox2.Items.Add(ListBox1.Items[i]);
            SelMas[i+1]:=Mas[i+1];
         end;
      end else begin


    for i:=0 to k do
       if ListBox1.Selected[i] then begin
          Inc(SelK);
          ListBox2.Items.Add(ListBox1.Items[i]);
          SelMas[Selk]:=Mas[i+1];
       end;
    end;
    Refresh;
end;

function max(a,b:real):real;
begin
  if a<b then max:=a
  else max:=b;
end;

procedure TfrMain.ToolButton6Click(Sender: TObject);
  var i:integer;
     mx:real;
     Po:TRec;
     st:string;
begin
  flOutPoints:=FALSE;

  FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// угол вершины A ?
  Alpha:=UgA/2;// ???? ???????? ?B
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//?????? A!
  OutMas[1]:=Selmas[1];//A'
  ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'

  FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// угол вершины C
  Alpha:=UgC/2;// ???? ???????? CA
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//?????? C!
  ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
  OutMas[4]:=Selmas[3]; //C'
  FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);

  Po.X:=Xo; Po.Y:=Yo;

  UgB:=180-ugA-ugC;

  mx:=max(uga,max(ugb,ugc));

  a:=false;
  b:=false;
  c:=false;

  if mx=uga then begin
    FindCross(Selmas[1],Po,Selmas[2],Selmas[3],Xo,Yo);
    a:=true;
  end;
  if mx=ugb then begin
    FindCross(Selmas[2],Po,Selmas[3],Selmas[1],Xo,Yo);
    b:=true;
  end;
  if mx=ugc then begin
    FindCross(Selmas[3],Po,Selmas[2],Selmas[1],Xo,Yo);
    c:=true;
  end;
  MyX:=Xo;
  MyY:=Yo;

  myDrawAb:=true;

  Panel4.Caption:='Биссектриса из большего угла';
  Refresh;
end;

procedure TfrMain.ToolButton7Click(Sender: TObject);
     var  Po,tmp:TRec;
       st:string;
begin
   flOutPoints:=FALSE;
   flRmax:=FALSE;
    //Вписанная

    Po.X:=MyX;
    Po.Y:=MyY;

    if a then begin
      tmp:=Selmas[3];
      Selmas[3]:=Po;
      FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// Угол вершины А
      Alpha:=UgA/2;// Угол поворота АB
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//Вокруг A!
      OutMas[1]:=Selmas[1];//A'
      ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'
      FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// Угол вершины C
      Alpha:=UgC/2;// Угол поворота CA
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг C!
      ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
      OutMas[4]:=Selmas[3]; //C'
      FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
      selmas[3]:=tmp;

      Xd:=Xo;
      Yd:=Yo;


      tmp:=Selmas[2];
      Selmas[2]:=Po;
      FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// Угол вершины А
      Alpha:=UgA/2;// Угол поворота АB
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//Вокруг A!
      OutMas[1]:=Selmas[1];//A'
      ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'
      FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// Угол вершины C
      Alpha:=UgC/2;// Угол поворота CA
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг C!
      ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
      OutMas[4]:=Selmas[3]; //C'
      FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
      selmas[2]:=tmp;
    end;

    if b then begin
      tmp:=Selmas[2];
      Selmas[2]:=Po;
      FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// Угол вершины А
      Alpha:=UgA/2;// Угол поворота АB
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//Вокруг A!
      OutMas[1]:=Selmas[1];//A'
      ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'
      FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// Угол вершины C
      Alpha:=UgC/2;// Угол поворота CA
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг C!
      ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
      OutMas[4]:=Selmas[3]; //C'
      FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
      selmas[1]:=tmp;

      Xd:=Xo;
      Yd:=Yo;

      tmp:=Selmas[3];
      Selmas[3]:=Po;
      FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// Угол вершины А
      Alpha:=UgA/2;// Угол поворота АB
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//Вокруг A!
      OutMas[1]:=Selmas[1];//A'
      ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'
      FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// Угол вершины C
      Alpha:=UgC/2;// Угол поворота CA
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг C!
      ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
      OutMas[4]:=Selmas[3]; //C'
      FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
      selmas[3]:=tmp;
    end;


    if c then begin
      tmp:=Selmas[2];
      Selmas[2]:=Po;
      FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// Угол вершины А
      Alpha:=UgA/2;// Угол поворота АB
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//Вокруг A!
      OutMas[1]:=Selmas[1];//A'
      ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'
      FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// Угол вершины C
      Alpha:=UgC/2;// Угол поворота CA
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг C!
      ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
      OutMas[4]:=Selmas[3]; //C'
      FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
     selmas[2]:=tmp;

      Xd:=Xo;
      Yd:=Yo;


     tmp:=Selmas[1];
     Selmas[1]:=Po;
      FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// Угол вершины А
      Alpha:=UgA/2;// Угол поворота АB
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[1].X;  Yc:= Selmas[1].Y;//Вокруг A!
      OutMas[1]:=Selmas[1];//A'
      ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'
      FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// Угол вершины C
      Alpha:=UgC/2;// Угол поворота CA
      matrixRotate(Matrix,Alpha);
      Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//Вокруг C!
      ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
      OutMas[4]:=Selmas[3]; //C'
      FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
     selmas[1]:=tmp;
    end;

    Xd1:=Xo;
    Yd1:=Yo;

  Panel4.Caption:='Вписанная окружность';
  myOk:=TRUE;
 // mySqr:=true;
  Refresh;

end;


procedure TfrMain.FormResize(Sender: TObject);
begin
   LX:=Panel2.Width;LY:=Panel2.Height;
   if LY<LX then LX:=LY;
   PaintBox1.Width:=LX;
   PaintBox1.Height:=LX;
end;

procedure TfrMain.N2Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TfrMain.N6Click(Sender: TObject);
begin
  Halt;
end;

procedure TfrMain.N1Click(Sender: TObject);
begin
  Form1.ShowModal;
end;


procedure TfrMain.N3Click(Sender: TObject);
var n_f,st:string;
    i:integer;
begin
    SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
    SaveDialog1.Filter:= 'Text File (*.txt)|*.txt';
    if SaveDialog1.Execute then Begin
        n_f:= SaveDialog1.FileName;
        st:=ExtractFileName(n_f);
        st:='_'+st;
        ListBox2.Items.SaveToFile(SaveDialog1.FileName);
        ShowMessage('Save as ' + st);
   end;

end;


procedure TfrMain.N4Click(Sender: TObject);
var n_f,st,tmp:string;
    i,j,d,t,g,d1:integer;
begin
    OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
    if OpenDialog1.Execute then Begin
          n_f := OpenDialog1.FileName;
        ListBox1.Clear;
        ListBox1.Items.LoadFromFile(n_f);

        ListBox2.Clear; d:=  ListBox1.Items.Count-1;

        //unpack
        for i:=0 to d do begin
          st:=ListBox1.Items[i];
          j:=1;
          d1:=1;
          while j<=length(st) do begin
              if st[j] in digit then begin
                tmp:='';
                while st[j] in digit do begin
                  tmp:=tmp+st[j];
                  inc(j);
                end;
                if d1=2 then begin
                    Val(tmp,t,g);
                    Mas[i+1].X:=t/981;
                   // ShowMessage('X'+tmp);
                end;
                if d1=3 then begin
                    Val(tmp,t,g);
                    Mas[i+1].Y:=(-t+981) /981;
                   // ShowMessage('Y'+tmp);
                end;
                inc(d1);
              end
              else inc(j);
          end;
          end;

     d:= ListBox1.Items.Count-1;
     k:=d+1;
     for i:=0 to d do  begin
          Inc(SelK);
          ListBox2.Items.Add(ListBox1.Items[i]);
          SelMas[i+1]:=Mas[i+1];
       end;

    Refresh;




   end;
end;

end.
