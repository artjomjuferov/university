unit Resolv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, Buttons, ComCtrls;

type
  TfrResolv = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Grid1: TStringGrid;
    BitBtn1: TBitBtn;
    TabSheet3: TTabSheet;
    StringGrid2: TStringGrid;
    Image1: TPaintBox;
    procedure FormPaint(Sender: TObject);
    procedure Grid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frResolv: TfrResolv;
 
implementation

{$R *.DFM}
   Uses Uni_mke,Printers;
procedure TfrResolv.FormPaint(Sender: TObject);

begin
   With  Image1,Canvas do Begin
       Brush.Color:=clNavy;
       FillRect(ClientRect);
       IZOLINES(Canvas,'',
               { u0,  v0,     SX,       SY}
               10,Height-10,Width-20{Height-20},Height-20,
                          CO,  h_IZO,gl_IZO,0);
   end;

end;

procedure TfrResolv.Grid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
    var st:string; k:integer;
begin
  with Grid1.Canvas do begin
     if (ACol=0)and(ARow=0)then st:=''
                            else
      if (ACol=0)and(ARow>0)then st:=IntToStr(ARow-1)+'_'
                            else
     if (ACol>0)and(ARow=0) then
                 st:=IntToStr(ACol)
                            else
     if (ACol>0)and(ARow>0) then
                             begin
                 k:= (ARow-1)*10+ACol;
                 if (k>0)and(k<=NUZ) then  STR(CO[k]:8:3,st)
                 else st:=''; end;

     if (ACol=0)or(ARow=0) then begin
                        Font.Style:=[fsBold];
                        Brush.Color:=clSilver;
     end         else  begin
                        Font.Style:=[];
                        Brush.Color:=clWhite;
     end;
     (*
     k:= (ARow-1)*10+ACol;
     if k=NomMin then Brush.Color:=clAqua;
     if k=NomMax then Brush.Color:=clYellow;
     *)
      FillRect(Rect);
      TextOut(Rect.Left+5,Rect.Top,st);

   end;//with


end;




procedure TfrResolv.Button1Click(Sender: TObject);
begin
  Close
end;

procedure TfrResolv.Button2Click(Sender: TObject);
begin
    {} {} With Printer DO
     Begin
          Orientation := poLandscape;

         BeginDOC;

      Canvas.Font.Name:='Times new roman';
          Canvas.Font.Size:=8;

   {}IZOLINES(Canvas,'',
               { u0,v0,SX,  SY}
               50,1300,1500,1100,
                          CO,  h_IZO,gl_IZO,1);
          EndDOC;
     end;
end;

procedure TfrResolv.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var st:string; k:integer;
begin
  with StringGrid2.Canvas do begin
     if (ACol=0)and(ARow=0)then st:=''
                            else
      if (ACol=0)and(ARow>0)then st:=IntToStr(ARow)
                            else
     if (ACol>0)and(ARow=0) then
                 st:=IntToStr(ACol)
                            else
     if (ACol>0)and(ARow>0) then
                              STR(ARMAT[ACol]^[ARow]:8:3,st)
                 else st:='';

     if (ACol=0)or(ARow=0) then begin
                        Font.Style:=[fsBold];
                        Brush.Color:=clSilver;
     end         else  begin
                        Font.Style:=[];
                        Brush.Color:=clWhite;
     end;
     
      FillRect(Rect);
      TextOut(Rect.Left+5,Rect.Top,st);

   end;//with
end;

end.
