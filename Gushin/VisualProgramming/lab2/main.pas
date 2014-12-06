unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Author, Task, Work, Grids, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Chart1: TChart;
    Series1: TLineSeries;
    RadioGroup1: TRadioGroup;
    StringGrid2: TStringGrid;
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.N2Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  AboutBox1.ShowModal;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
begin
  if (ARow=0) and (ACol>0) and (ACol<m+1) then s:=IntToStr(ACol)
  else if (ARow>0) and (ARow<n+1) and (ACol=0) then s:=IntToStr(ARow)
  else if (ARow=n+1) and (ACol=0) then s:='Max:'
  else if (ARow=n+2) and (ACol=0) then s:='Sum:'
  else if (ARow=0) and (ACol=m+1) then s:='Max:'
  else if (ARow=0) and (ACol=m+2) then s:='Sum:'
  else if (ARow>0) and (ACol>0) then s:=IntToStr(mas[ARow,ACol])
  else s:='';
  with StringGrid1.Canvas do begin
       Brush.Color:=clWhite;
       if(ARow=0)or(ACol=0) then  Brush.Color:=clCream;
       if(ARow=n+1)or(ACol=m+1) then  Brush.Color:=clRed;
       if(ARow=n+2)or(ACol=m+2) then  Brush.Color:=clYellow;
       FillRect(Rect);
       TextOut(Rect.Left,Rect.Top,s);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  m:=StrToInt(Edit1.Text);
  n:=StrToInt(Edit2.Text);
  k:=StrToInt(Edit3.Text);
  Fill;
  StringGrid1.RowCount:=m+3;
  StringGrid1.ColCount:=n+3;
  StringGrid1.Refresh;
  if (nomRow<>0) or (nomCol<>0) then begin
      Chart1.Visible:=true;
      DrawChart(Chart1,Series1,nomRow,nomCol);
  end
  else Chart1.Visible:=false;
  StringGrid2.RowCount:=m+3;
  StringGrid2.ColCount:=n+3;
  StringGrid2.Refresh;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text:=IntToStr(m);
  Edit2.Text:=IntToStr(n);
  Edit3.Text:=IntToStr(k);
  Button1Click(Sender);
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
   nomRow:=StringGrid1.Row;
   nomCol:= StringGrid1.Col;
   if ((nomRow<>0) and (nomCol=0)) or ((nomCol<>0) and (nomRow=0)) then begin
       Chart1.Visible:=true;
       DrawChart(Chart1,Series1,nomRow,nomCol)
   end
   else Chart1.Visible:=false;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  StringGrid1.Refresh;
  
end;

procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var
  s:string;
begin
  if (ARow=0) and (ACol>0) and (ACol<m+1) then s:=IntToStr(ACol)
  else if (ARow>0) and (ARow<n+1) and (ACol=0) then s:=IntToStr(ARow)
  else if (ARow=n+1) and (ACol=0) then s:='Max:'
  else if (ARow=n+2) and (ACol=0) then s:='Sum:'
  else if (ARow=0) and (ACol=m+1) then s:='Max:'
  else if (ARow=0) and (ACol=m+2) then s:='Sum:'
  else if (ARow>0) and (ACol>0) then s:=IntToStr(mas1[ARow,ACol])
  else s:='';
  with StringGrid2.Canvas do begin
       Brush.Color:=clWhite;
       if(ARow=0)or(ACol=0) then  Brush.Color:=clCream;
       if(ARow=n+1)or(ACol=m+1) then  Brush.Color:=clRed;
       if(ARow=n+2)or(ACol=m+2) then  Brush.Color:=clYellow;
       FillRect(Rect);
       TextOut(Rect.Left,Rect.Top,s);
  end;
end;


end.
