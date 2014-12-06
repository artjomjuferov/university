unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Task, About, ExtCtrls, ImgList,
  ToolWin, ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    New1: TMenuItem;
    Save: TMenuItem;
    Help1: TMenuItem;
    ask1: TMenuItem;
    About1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    PaintBox1: TPaintBox;
    ListBox1: TListBox;
    ListBox2: TListBox;
    SpeedButton1: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ImageList2: TImageList;
    Load: TMenuItem;
    Exit1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure ask1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
    init;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
     form1.Close();
end;

procedure TForm1.ask1Click(Sender: TObject);
begin
      form2.ShowModal;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
    aboutbox.ShowModal;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
    with PaintBox1, Canvas do begin
       Brush.Color:=clWhite;//clNavy;
       FillRect(ClientRect);
       if (cnt > 0) then DrawPoint(PaintBox1,Width,Height,0,Height,clgreen);
       //if (FlagCircle = true) then DrawRmax(canvas,Width,Height,0,Height);
       if (FlagNormal = true) then begin
         DrawNormal(canvas,Width,Height,0,Height,t2[1],t2[2],p1);
         DrawNormal(canvas,Width,Height,0,Height,t2[1],t2[2],p2);
       end;
       if (FlagTriangle = true) then DrawTriangle(Canvas,Width,Height,0,Height);
       if (FlagMiddle = True) then Middleline(Canvas,paintBox1.Width,paintBox1.Height,0,paintBox1.Height,p1,p2);
   end;//with
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   tx,ty : integer;
begin
     if (toolbutton1.Down) and (Button = mbLeft) then begin
         tx := PaintBox1.Width;
         ty := PaintBox1.Height;
         inc(cnt);
         ListBox1.Items.Add(inttostr(cnt) + ' ' + inttostr(x) + ' ' + inttostr(y));
         t[cnt].x := x / tx;
         t[cnt].y := 1 - y / ty;
         with PaintBox1.Canvas do begin
               brush.color := clGreen;
               Ellipse(x - 2,y - 2,x + 2,y + 2);
         end;
     end
     else
     if (toolButton1.Down) and (Button = mbRight) then StatusBar1.Panels[1].Text := ' ол-во точек ' + inttostr(cnt)
     else refresh;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
     if (toolButton1.Down = false) then begin
        cnt := 0;
        ListBox1.Clear;
        ListBox2.Clear;
        FlagTriangle := false;
        FlagNormal := false;
     end;
     refresh;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
   n,i : integer;
begin
     if ListBox1.Count < 3 then exit;
     if ListBox1.SelCount > 2 then begin
        cntPoint := 0;
        ListBox2.Clear;
        n := ListBox1.Items.Count - 1;
        for i := 0 to n do
            if ListBox1.Selected[i] then begin
               inc(cntPoint);
               t2[cntPoint] := t[i+1];
               ListBox2.Items.Add(ListBox1.Items[i]);
            end;
        FlagTriangle := true;
     end;
     refresh;
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
      StatusBar1.Panels[0].Text:='X='+InttoStr(X)+ '; Y='+InttoStr(Y);
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
     FlagTriangle := false;
     cnt := 0;
     cntPoint := 0;
     ListBox1.Clear;
     ListBox2.Clear;
     FlagNormal := false;
     FlagMiddle := false;
     StatusBar1.Panels[1].Text := '';
     StatusBar1.Panels[0].Text := '';
     panel3.Caption := '';
     refresh;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  if (FlagTriangle = false) then exit;
  matrixRotate(Matrix,Pi/2);
  makepoint(p1,p2,1,2);
  FlagMiddle:=True;
  Panel3.Caption:='—редн€€ лини€';
  Refresh;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
     flagNormal := true;
     Panel3.Caption := '—редн€€ лини€ + ѕерпендикул€ры + ќкружности';
     refresh;
end;


procedure TForm1.LoadClick(Sender: TObject);
var
   f : textFile;
   tx,ty,x,y : integer;
begin
     AssignFile(f, fileNameinput);
     reset(f);
     tx := PaintBox1.Width;
     ty := PaintBox1.Height;
     toolbutton1.Down := true;
     while not seekeof(f) do begin
           read(f,x,y);
           inc(cnt);
           ListBox1.Items.Add(inttostr(cnt) + ' ' + inttostr(x) + ' ' + inttostr(y));
           t[cnt].x := x / tx;
           t[cnt].y := 1 - y / ty;
     end;
     CloseFile(f);
     refresh;
end;

procedure TForm1.SaveClick(Sender: TObject);
var
   f : textFile;
   n,u1,v1,i : integer;
begin
   AssignFile(f, fileNameoutput);
   rewrite(f);
   n := ListBox1.Items.Count - 1;
   for i := 0 to n do begin
       u1:= round(t[i + 1].x * paintBox1.Width);
       v1:= paintBox1.Height - round(t[i + 1].y * paintBox1.Height);
       writeln(f,u1,' ',v1);
   end;
   closefile(f);

end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
     form1.Close;
end;

procedure TForm1.FormResize(Sender: TObject);
var
   Lx,Ly : integer;
begin
   LX:=Panel1.Width;LY:=Panel1.Height;
   if LY<LX then LX:=LY;
   PaintBox1.Width:=LX - 50;
   PaintBox1.Height:=LX - 50;
end;

end.

