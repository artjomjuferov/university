unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    PaintBox4: TPaintBox;
    PaintBox5: TPaintBox;
    PaintBox6: TPaintBox;
    Memo1: TMemo;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
     Uses Un_RAB;
procedure TForm1.FormPaint(Sender: TObject);
begin
     with PaintBox1,Canvas do begin
        Brush.Color:=clNavy;
        FillRect(ClientRect);
        IZOTABL(Canvas,'',Mas1,m,n,Width,Height,0,Height,
                               -1,10,FALSE);

     end;
     with PaintBox2,Canvas do begin
        Brush.Color:=clNavy;
        FillRect(ClientRect);
        IZOTABL(Canvas,'',Mas2,m,n,Width,Height,0,Height,
                               -1,10,FALSE);
     end;
     with PaintBox3,Canvas do begin
        Brush.Color:=clNavy;
        FillRect(ClientRect);
        IZOTABL(Canvas,'',Mas3,m,n,Width,Height,0,Height,
                               -1,10,FALSE);
     end;
     with PaintBox4,Canvas do begin
        Brush.Color:=clNavy;
        FillRect(ClientRect);
        IZOTABL(Canvas,'',Mas4,m,n,Width,Height,0,Height,
                               -1,10,FALSE);
     end;
     with PaintBox5,Canvas do begin
        Brush.Color:=clNavy;
        FillRect(ClientRect);
        IZOTABL(Canvas,'',Mas5,m,n,Width,Height,0,Height,
                               -1,10,FALSE);
     end;
     with PaintBox6,Canvas do begin
        Brush.Color:=clNavy;
        FillRect(ClientRect);
        IZOTABL(Canvas,'',Mas6,m,n,Width,Height,0,Height,
                               -1,10,FALSE);
     end;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   FillMas(1,Mas1);
   FillMas(2,Mas2);
   FillMas(3,Mas3);
   FillMas(4,Mas4);
   FillMas(5,Mas5);
   FillMas(6,Mas6);
   Memo1.Lines.LoadFromFile('Functions.txt');
end;

end.
