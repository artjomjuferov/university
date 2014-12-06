unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus;

type
  TfrMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    SpeedButton3: TSpeedButton;
    ListBox1: TListBox;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    mm: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.DFM}
   Uses  UN_LIBMN, Params, About, Task;
procedure TfrMain.FormCreate(Sender: TObject);
begin
  MyRect:=RECT(0,0,700,700);
  W:=700; H:=700;
  DoubleBuffer:=TBitmap.Create;
  DoubleBuffer.Height:=700;  DoubleBuffer.Width:=700;

  BlankBuffer:=TBitmap.Create;
  BlankBuffer.Height:=700;    BlankBuffer.Width:=700;
  BlankBuffer.Canvas.Brush.Color:=clWhite;
  BlankBuffer.Canvas.rectangle(0,0,700,700);//Clear + Frame

  SpeedButton1Click(Sender);
  
end;

procedure TfrMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    BlankBuffer.Free; DoubleBuffer.Free;
end;

procedure TfrMain.SpeedButton1Click(Sender: TObject);
begin
  //PrepData
  FillMas;
  K_STEPS:=0;
  Panel3.Caption:='K = 0';
  ListBox1.Clear;
  flBegin:=TRUE;
  flBreak:= FALSE; CheckBox1.Checked := FALSE;
  Refresh;
end;

procedure TfrMain.FormPaint(Sender: TObject);
begin
    with PaintBox1,Canvas do Begin
       Brush.Color:=clWhite;
       FillRect(ClientRect);
       if flBegin then
          IZOTABL(Canvas,'',Mas,m,n,W,H,0,H,1,5,FALSE);
    End;//with
end;

procedure TfrMain.SpeedButton2Click(Sender: TObject);
  //Without Timer!!!
  var st:string;
begin
  Repeat
   Application.ProcessMessages;
   if flBreak then Break;
   D:=0;
   STEP_LIBMAN(D);  STR(D:12:8,st); MasSTEP[K_STEPS]:=D;
   ListBox1.Items.Add(IntToStr(K_STEPS)+' '+st);    ListBox1.Refresh;
   Panel3.Caption:='K = '+IntToStr(K_STEPS);   Panel3.Refresh;
//CLEAR DoubleBuffer
  DoubleBuffer.Canvas.CopyRect(MyRECT,BlankBuffer.Canvas,MyRECT);
// Draw New DoubleBuffer
  IZOTABL(DoubleBuffer.Canvas,'',RabMas,m,n,W,H,0,H,1,5,FALSE);
// Copy To CANVAS
  PaintBox1.Canvas.CopyRect(MyRECT, DoubleBuffer.Canvas,MyRECT);
// CONTROL Epsilon
 until ((D<Epsilon)or(K_STEPS>K_Max));
end;

procedure TfrMain.SpeedButton3Click(Sender: TObject);
begin
  with frParams do begin
     PrepSeries;
     ShowModal;
  end;
end;

procedure TfrMain.CheckBox1Click(Sender: TObject);
begin
    flBreak :=  CheckBox1.Checked;
end;

procedure TfrMain.N5Click(Sender: TObject);
begin
AboutBox.showmodal;
end;

procedure TfrMain.N6Click(Sender: TObject);
begin
Form1.showmodal;
end;

procedure TfrMain.N3Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
