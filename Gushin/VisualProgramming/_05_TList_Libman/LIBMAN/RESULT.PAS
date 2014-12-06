unit Result;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, TeEngine, Series, TeeProcs,
  Chart;

type
  TfrResult = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
    Image1: TImage;
    StringGrid1: TStringGrid;
    TabSheet3: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frResult: TfrResult;

implementation

{$R *.DFM}
    Uses Un_Lab4;
procedure TfrResult.FormResize(Sender: TObject);
begin

   Image1.Height:=PageControl1.Height-30;
   Image1.Width:=Width-10;
   //StringGrid1.Height:= PageControl1.Height-30;
   //StringGrid1.Width:=  PageControl1.Width-10;

end;

procedure TfrResult.FormPaint(Sender: TObject);
begin
     with Image1,Canvas do begin
        Brush.Color:=clBlack;
        Rectangle(0,0,Width,Height);
        IZOTABL(Canvas,'',RabMas,m,n, Height,Height,0,Height, -1,20.0,TRUE);
     end;
end;

procedure TfrResult.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
  var st:string;
begin
   if (Acol=0)and(aRow>0) then Str(arow,st)
                          else
   if (Acol>0)and(aRow=0) then Str(acol,st)
                          else
   if (Acol>0)and(aRow>0)and(RabMas[arow,acol]<777) then
                                 Str(RabMas[arow,Acol]:4:1,st)
                          else
    if (Acol>0)and(aRow>0)and(RabMas[arow,acol]=777) then
                                 st:=''
                          else st:='';
   with  StringGrid1.Canvas do begin

        if (ARow=0)or(ACol=0) then  begin
                                     Brush.Color:=clSilver;
                                     Font.Name:='Small Fonts';
                                     Font.Size:=7;
                                     Font.Style:=[fsBold];
                                    end
                              else  begin
                                      Brush.Color:=clWhite;
                                      Font.Name:='Small Fonts';
                                      Font.Size:=7;
                                      Font.Style:=[];
                                     end;
         if (Acol>0)and(aRow>0)and(RabMas[arow,acol]=777) then
                                            Brush.Color:=clBlue;
        FillRect(rect);
        TextOut(rect.Left,Rect.Top,st);
   end;
end;

procedure TfrResult.FormActivate(Sender: TObject);
   var i:integer;
begin
    Series1.Clear;
    for i:=1 to kStep do
       Series1.Add(MasConverg[i],IntToStr(i));
end;

end.
