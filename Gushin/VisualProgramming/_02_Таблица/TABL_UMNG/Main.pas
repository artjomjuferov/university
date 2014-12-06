unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    RadioGroup1: TRadioGroup;
    StringGrid2: TStringGrid;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var st:string;
begin
  if(ARow=0) then st:= IntToStr(ACol+1)
             else
  if(ACol=0) then st:= IntToStr(ARow+1)
             else
  if(ACol>0)and(ARow>0)then st:=IntToStr((ACol+1)*(ARow+1));
  with  StringGrid1.Canvas do begin
      Brush.Color:= clWhite;
      if(ARow=RadioGroup1.ItemIndex) then
                              Brush.Color:= clYellow;
      Font.Size := 14;
      FillRect(Rect);
      TextOut(Rect.Left, Rect.Top,st);
  end;  //with
end;

procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var st:string;
begin
   st := IntToStr((RadioGroup1.ItemIndex+1)*(ACol+1));
   with  StringGrid2.Canvas do begin
      Brush.Color:= clWhite; Font.Size := 14;
      FillRect(Rect); TextOut(Rect.Left, Rect.Top,st);
  end;  //with
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
    StringGrid1.Refresh; // ? Выделить строку цветом
    StringGrid2.Refresh;
end;

end.
