unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ToolWin, StdCtrls, Buttons, ImgList, Menus, Author, Task;

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
    ImageList2: TImageList;
    Panel5: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Button1: TButton;
    Button2: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    procedure FormPaint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.DFM}

Uses Un_TRG;

procedure TfrMain.FormPaint(Sender: TObject);
begin
   with PaintBox1, Canvas do begin
       Brush.Color:=clWhite;//clNavy;
       FillRect(ClientRect);
       if KolPoints>0 then DrawPoints(Canvas,Mas,K,Width,Height,0,Height,clBlack);
       if flRmin then DrawRmin(Canvas,Width,Height,0,Height);
       if flRmin1 then DrawRmin1(Canvas,Width,Height,0,Height);
       if SelK>0 then DrawTRG(Canvas,Width,Height,0,Height);
   end;
end;

procedure TfrMain.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var rX,rY:real;
      LX,LY:integer;
begin
  if ToolButton1.Down and (Button=mbLeft) then begin
      LX:=PaintBox1.Width;
      LY:=PaintBox1.Height;
      inc(k);
      ListBox1.Items.Add(IntToStr(k)+' '+InttoStr(X)+' '+InttoStr(Y));
      rX:=X/LX;
      rY:=1-Y/LY;
      mas[k].X:=rX;
      mas[k].Y:=rY;
      with PaintBox1.Canvas do begin
            Brush.Color:=clAqua;
            Pen.Color:= clNavy;
            Ellipse(X-2,Y-2,X+2,Y+2);
      end;
  end else
    if ToolButton1.Down and (Button=mbRight) then begin
        ToolButton1.Down:=false;
        KolPoints:=k;
        StatusBar1.Panels[1].Text:='KolPoints='+InttoStr(KolPoints);
        Refresh;
    end
    else Refresh;
end;

procedure TfrMain.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  StatusBar1.Panels[0].Text:='X='+InttoStr(X)+'; Y='+InttoStr(Y);
end;

procedure TfrMain.ToolButton4Click(Sender: TObject);
begin
   k:=0;
   ListBox1.Clear;
   SelK:=0;
   ListBox2.Clear;
   flOutPoints:=FALSE;
   flOutAB:=FALSE;
   flRmin:=FALSE;
   flRmax:=FALSE;
   StatusBar1.Panels[0].Text:='';
   StatusBar1.Panels[1].Text:='';
   StatusBar1.Panels[2].Text:='';
   Refresh;
end;

procedure TfrMain.SpeedButton1Click(Sender: TObject);
   var i,k:integer;
begin
  if ListBox1.Items.Count<2 then Exit;
  ListBox2.Clear;
  k:=ListBox1.Items.Count-1;
  if ListBox1.SelCount=0 then begin
    SelK:=k+1;
    for i:=0 to k do begin
      ListBox2.Items.Add(ListBox1.Items[i]);
      SelMas[i+1]:=Mas[i+1];
      SelMas1[i+1]:=Mas[i+1];
      forCircle[i+1]:=Mas[i+1];
    end;
  end
  else begin
    for i:=0 to k do
    if ListBox1.Selected[i] then begin
      Inc(SelK);
      ListBox2.Items.Add(ListBox1.Items[i]);
      SelMas[SelK]:=Mas[i+1];
      SelMas1[SelK]:=Mas[i+1];
      forCircle[SelK]:=Mas[i+1];
    end;
  end;
  Refresh;
end;

procedure TfrMain.FormResize(Sender: TObject);
begin
   LX:=Panel2.Width;
   LY:=Panel2.Height;
   if LY<LX then LX:=LY;
   PaintBox1.Width:=LX;
   PaintBox1.Height:=LX;
end;

procedure TfrMain.Button1Click(Sender: TObject);
var
  UgA,UgC:real;
  Po:TRec;
  cx,cy:real;
begin
  cx:=Width;
  cy:=Height;
  FindCross(Selmas[1],Selmas[3],Selmas[2],Selmas[4],Selmas[3].x,Selmas[3].y);
  flOutAB:=FALSE;
  flOutPoints:=FALSE;
  flRmax:=FALSE;
  //��������� ����������
  FindAlphaA(Selmas[1],Selmas[2],Selmas[3],UgA);// ���� ������� �
  Alpha:=UgA/2;// ���� �������� �B
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[1].X;
  Yc:= Selmas[1].Y;//������ A!
  OutMas[1]:=Selmas[1];//A'
  ApplyMatToPoint(Selmas[2],OutMas[2],Matrix,Xc,Yc); //B'

  FindAlphaA(Selmas[3],Selmas[1],Selmas[2],UgC);// ���� ������� C
  Alpha:=UgC/2;// ���� �������� CA
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas[3].X;  Yc:= Selmas[3].Y;//������ C!
  ApplyMatToPoint(Selmas[1],OutMas[3],Matrix,Xc,Yc);//A'
  OutMas[4]:=Selmas[3]; //C'
  FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo,Yo);
  Po.X:=Xo; Po.Y:=Yo;  Xc:=Xo;Yc:=Yo;
  Alpha:=-(Pi/2-UgA/2);
  matrixRotate(Matrix,Alpha);
  ApplyMatToPoint(Selmas[1],OutMas[2],Matrix,Xc,Yc); //A'
  OutMas[1]:=Po;
  FindCross(OutMas[1],OutMas[2],Selmas[1],SelMas[3],Xp,Yp);
  Rmin:=SQRT(SQR(Xp-Xo)+SQR(Yp-Yo));
  flRmin:=TRUE;
  Refresh;

end;

procedure TfrMain.Button2Click(Sender: TObject);
var
  UgA,UgC:real;
  Po:TRec;
  cx,cy:real;
begin
  cx:=Width;
  cy:=Height;
  FindCross(Selmas1[1],Selmas1[3],Selmas1[2],Selmas1[4],Selmas1[1].x,Selmas1[1].y);
  flOutAB:=FALSE;
  flOutPoints:=FALSE;
  flRmax:=FALSE;
  //��������� ����������
  FindAlphaA(Selmas1[1],Selmas1[2],Selmas1[3],UgA);// ���� ������� �
  Alpha:=UgA/2;// ���� �������� �B
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas1[1].X;
  Yc:= Selmas1[1].Y;//������ A!
  OutMas[1]:=Selmas1[1];//A'
  ApplyMatToPoint(Selmas1[2],OutMas[2],Matrix,Xc,Yc); //B'

  FindAlphaA(Selmas1[3],Selmas1[1],Selmas1[2],UgC);// ���� ������� C
  Alpha:=UgC/2;// ���� �������� CA
  matrixRotate(Matrix,Alpha);
  Xc:= Selmas1[3].X;  Yc:= Selmas1[3].Y;//������ C!
  ApplyMatToPoint(Selmas1[1],OutMas[3],Matrix,Xc,Yc);//A'
  OutMas[4]:=Selmas1[3]; //C'
  FindCross(OutMas[1],OutMas[2],OutMas[3],OutMas[4],Xo1,Yo1);
  Po.X:=Xo1; Po.Y:=Yo1;  Xc:=Xo1;Yc:=Yo1;
  Alpha:=-(Pi/2-UgA/2);
  matrixRotate(Matrix,Alpha);
  ApplyMatToPoint(Selmas1[1],OutMas[2],Matrix,Xc,Yc); //A'
  OutMas[1]:=Po;
  FindCross(OutMas[1],OutMas[2],Selmas1[1],SelMas1[3],Xp1,Yp1);
  Rmin1:=SQRT(SQR(Xp1-Xo1)+SQR(Yp1-Yo1));
  flRmin1:=TRUE;
  Refresh;
end;

procedure TfrMain.N3Click(Sender: TObject);
begin
  AboutBox1.ShowModal;
end;

procedure TfrMain.N4Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TfrMain.N6Click(Sender: TObject);
var n_f,st:string;
    i:integer;
begin
    dlgSave1.InitialDir:=ExtractFilePath(Application.ExeName);
    dlgSave1.Filter:= 'Text File (*.txt)|*.txt';
    if dlgSave1.Execute then Begin
        n_f:= dlgSave1.FileName;
        st:=ExtractFileName(n_f);
        st:='_'+st;
        ListBox2.Items.SaveToFile(dlgSave1.FileName);
        ShowMessage('Save as ' + st);
    end;
end;


procedure TfrMain.N5Click(Sender: TObject);
var n_f:string;
begin
    dlgOpen1.InitialDir:=ExtractFilePath(Application.ExeName);
    if dlgOpen1.Execute then Begin
          n_f := dlgOpen1.FileName;
        ListBox1.Clear;
        ListBox1.Items.LoadFromFile(n_f);
    end;
end;
end.
