unit PARAMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, TeEngine, Series, TeeProcs, Chart, ComCtrls, ExtCtrls;

type
  TfrParams = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    BitBtn1: TBitBtn;
    Shape1: TShape;
    Shape6: TShape;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit2: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit11: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    EdInput: TEdit;
    Label2: TLabel;
    EdEps: TEdit;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    MasEdit:array[1..16]of TEdit;
    procedure GetEdits;
    procedure FillEdits;
  public
    { Public declarations }
    procedure PrepSeries;
  end;

var
  frParams: TfrParams;

implementation

{$R *.DFM}
   Uses UN_LIBMN;
{ TfrParams }

procedure TfrParams.PrepSeries;
   var i:integer;
begin
   Series1.Clear;
   for i:=1 to K_STEPS do
      Series1.Add(MasSTEP[i],IntToStr(i),clBlue);
end;



procedure TfrParams.Button1Click(Sender: TObject);
begin
     Edit1.text:='1';  Edit2.text:='1';
     Edit3.text:='11';  Edit4.text:='11';
     Edit7.text:='16';  Edit8.text:='16';
     Edit5.text:='21';  Edit6.text:='21';
     Edit9.text:='26';  Edit10.text:='26';
     Edit11.text:='31';  Edit12.text:='31'; Edit13.text:='31';  Edit14.text:='31';
     Edit15.text:='41';  Edit16.text:='41';
     GetEdits;//FillMas;
end;

procedure TfrParams.Button2Click(Sender: TObject);
begin
     Edit11.text:='1';  Edit3.text:='1';
     Edit1.text:='11';  Edit4.text:='11'; Edit15.text:='11';  Edit12.text:='11';
     Edit7.text:='16';  Edit9.text:='16';
     Edit13.text:='21';  Edit16.text:='21';
     Edit8.text:='26';  Edit10.text:='26';
     Edit2.text:='31';  Edit5.text:='31';
     Edit6.text:='41';  Edit14.text:='41';
     GetEdits; //FillMas;
end;

procedure TfrParams.Button3Click(Sender: TObject);
begin
     Edit11.text:='1';  Edit3.text:='1';
     Edit1.text:='1';  Edit4.text:='1'; Edit15.text:='1';  Edit12.text:='1';
     Edit7.text:='10';  Edit9.text:='10';
     Edit8.text:='10';  Edit10.text:='10';
     Edit2.text:='1';  Edit5.text:='1'; Edit13.text:='1';  Edit16.text:='1';
     Edit6.text:='1';  Edit14.text:='1';
     GetEdits; 
end;



procedure TfrParams.GetEdits;
var i,code:integer;
       r:real;
begin
   for i:=1 to Corners do begin
       Val(MasEdit[i].Text,r,code);
       if code=0 then MasCorners[i].t:=r;
   end;
   Val(EdInput.Text,r,code);
   if code=0 then t0:=r;
    Val(EdEps.Text,r,code);
   if code=0 then Epsilon:=r;
   FillMas;
end;

procedure TfrParams.FormCreate(Sender: TObject);
begin
    MasEdit[1]:=Edit1;
    MasEdit[2]:=Edit2;
    MasEdit[3]:=Edit3;
    MasEdit[4]:=Edit4;
    MasEdit[5]:=Edit5;
    MasEdit[6]:=Edit6;
    MasEdit[7]:=Edit7;
    MasEdit[8]:=Edit8;
    MasEdit[9]:=Edit9;
    MasEdit[10]:=Edit10;
    MasEdit[11]:=Edit11;
    MasEdit[12]:=Edit12;
    MasEdit[13]:=Edit13;
    MasEdit[14]:=Edit14;
    MasEdit[15]:=Edit15;
    MasEdit[16]:=Edit16;
    FillEdits;
end;

procedure TfrParams.FillEdits;
var i:integer; st:string;
begin
   for i:=1 to Corners do begin
      Str(MasCorners[i].t:5:1,st);
      MasEdit[i].Text:=st
   end;
   Str(t0:5:1,st);EdInput.Text:=st;
   Str(Epsilon:7:5,st);EdEps.Text:=st;
end;

procedure TfrParams.BitBtn2Click(Sender: TObject);
begin
   GetEdits;
end;

procedure TfrParams.BitBtn3Click(Sender: TObject);
begin
   FillEdits;
end;

end.
