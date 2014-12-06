unit Params;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TfrParams = class(TForm)
    btClose: TButton;
    Box1: TGroupBox;
    Box1_2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    btEdit: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
   
    procedure btCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);



    procedure btEditClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frParams: TfrParams;

implementation

{$R *.DFM}
  Uses Uni_mke;
procedure TfrParams.btCloseClick(Sender: TObject);
begin

   Close
end;

procedure TfrParams.FormActivate(Sender: TObject);
   var st:string;
begin

   STR(Aco1:5:2,st);  Edit6.Text:=st;
   STR(Aco2:5:2,st);  Edit7.Text:=st;
   STR(Qgl:5:2,st);  Edit8.Text:=st;
   STR(h_IZO:5:1,st);  Edit1.Text:=st;
   STR(gl_IZO:5:1,st);  Edit2.Text:=st;
   STR(CC1:5:1,st);  Edit3.Text:=st;
   STR(CC2:5:1,st);  Edit4.Text:=st;
     end;




procedure TfrParams.btEditClick(Sender: TObject);
  var code:integer; st:string;
begin
  //—бор параметров из EDIT's
   st:=Edit6.Text;Val(st,Aco1,code);
   st:=Edit7.Text;Val(st,Aco2,code);
   st:=Edit8.Text;Val(st,Qgl,code);
   st:=Edit1.Text;Val(st,h_IZO,code);
   st:=Edit2.Text;Val(st,gl_IZO,code);
   st:=Edit3.Text;Val(st,CC1,code);
   st:=Edit4.Text;Val(st,CC2,code);
end;


end.
