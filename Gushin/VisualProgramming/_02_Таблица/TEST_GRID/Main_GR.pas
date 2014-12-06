unit Main_GR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Menus, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, Grids;

type
  TfrMain = class(TForm)
    MainMenu1: TMainMenu;
    mnFile: TMenuItem;
    mnHelp: TMenuItem;
    Label1: TLabel;
    edM: TEdit;
    Label2: TLabel;
    edN: TEdit;
    Label3: TLabel;
    edK: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Series1: TLineSeries;
    StringGrid1: TStringGrid;
    mnAvtor: TMenuItem;
    mnTASK: TMenuItem;
    RadioGroup1: TRadioGroup;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure mnAvtorClick(Sender: TObject);
    procedure mnTASKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.dfm}
    Uses Un_Rab,Avtor,TASK;
procedure TfrMain.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
 var st:string;
begin
    if(ARow=0)and(ACol>0)and(ACol<n+1) then  st:=IntToStr(ACol)
              else
    if(ARow>0)and(ARow<m+1)and(ACol=0) then  st:=IntToStr(ARow)
              else
    if(ARow=0)and(ACol=n+1)then st:=' MIN'
                           else
    if(ARow=0)and(ACol=n+2)then st:=' MAX'
                           else
    if(ACol=0)and(ARow=m+1)then st:=' MIN'
                           else
    if(ACol=0)and(ARow=m+2)then st:=' MAX'
                           else

    if(ARow>0)and(ACol>0)and(ARow<m+1)and(ACol<n+1) then
                                 st:=IntToStr(Mas[ARow,ACol])
                           else
    if(ACol=n+1)and(ARow>0)and(ARow<m+1) then
                                 st:=IntToStr(MasRow[ARow,1])
                           else
    if(ACol=n+2)and(ARow>0)and(ARow<m+1) then
                                 st:=IntToStr(MasRow[ARow,2])
                           else
    if(ARow=m+1)and(ACol>0)and(ACol<n+1) then
                                 st:=IntToStr(MasCol[ACol,1])
                           else
    if(ARow=m+2)and(ACol>0)and(ACol<n+1) then
                                 st:=IntToStr(MasCol[ACol,2])
              else st:='';
    with StringGrid1.Canvas do begin
        Brush.Color:=clWhite;
         if(ARow=0)or(ACol=0) then  Brush.Color:=clCream;
       if(ARow>0)and(ACol>0)and(ARow<m+1)and(ACol<n+1) then
         case RadioGroup1.ItemIndex of
  0: Brush.Color:=clWhite;
  1:
       if (Mas[ARow,ACol] = MIN(Mas,m,n))then  Brush.Color:=clAqua
                                  else
       if (Mas[ARow,ACol] = MAX(Mas,m,n))then  Brush.Color:=clYellow
                                  else  Brush.Color:=clWhite;

  2:
       if Simple(Mas[ARow,ACol]) then Brush.Color:=clMoneyGreen
                       else Brush.Color:=clWhite;

  3:
       if Palindrome(Mas[ARow,ACol]) then Brush.Color:=clSkyBlue
                       else Brush.Color:=clWhite;

      end;//case
 if(ACol=n+1)and(ARow>0)and(ARow<m+1) then Brush.Color:=clAqua;
 if(ACol=n+2)and(ARow>0)and(ARow<m+1) then Brush.Color:=clYellow;
 if(ARow=m+1)and(ACol>0)and(ACol<n+1) then Brush.Color:=clAqua;
 if(ARow=m+2)and(ACol>0)and(ACol<n+1) then Brush.Color:=clYellow;
         FillRect(Rect);
         TextOut(Rect.Left,Rect.Top,st);
    end;//with
end;

procedure TfrMain.StringGrid1Click(Sender: TObject);

begin
   nomRow:=StringGrid1.Row; nomCol:= StringGrid1.Col;
   if  ((nomRow<>0)and(nomCol=0))or ((nomCol<>0)and(nomRow=0)) then begin
    Chart1.Visible:=TRUE;
    DrawChart(Chart1,Series1,nomRow,nomCol)
    end    else Chart1.Visible:=FALSE;
end;

procedure TfrMain.Button1Click(Sender: TObject);
begin
    m:=StrToInt(EdM.Text);
    n:=StrToInt(EdN.Text);
    k:=StrToInt(EdK.Text);
    FillMas;
    StringGrid1.RowCount:=M+3;
    StringGrid1.ColCount:=N+3;
    StringGrid1.Refresh;
    if  (nomRow<>0)or (nomCol<>0) then begin
    Chart1.Visible:=TRUE;
    DrawChart(Chart1,Series1,nomRow,nomCol)
    end    else Chart1.Visible:=FALSE;
end;

procedure TfrMain.RadioGroup1Click(Sender: TObject);
begin
   StringGrid1.Refresh;
end;

procedure TfrMain.mnAvtorClick(Sender: TObject);
begin
   AboutBox.ShowModal;
end;

procedure TfrMain.mnTASKClick(Sender: TObject);
begin
   frTASK.ShowModal;
end;

end.
