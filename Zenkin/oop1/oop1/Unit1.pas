unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
   Forms, Dialogs, Point, Quad, StdCtrls, Menus;
//-----------------------------------------------------------
   type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
     procedure FormClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//-----------------------------------------------------------
var   Form1            : TForm1;
      mouse_x, mouse_y : Integer;
      FIG1             : Boolean;  

implementation
{$R *.DFM}
//-----------------------------------------------------------
procedure TForm1.FormClick( Sender: TObject );
var
mouse_point : TOCHKA;
mouse_quad  : KVADRAT;
begin
   if  FIG1 then 
   begin
   mouse_point := TOCHKA.init( mouse_x, mouse_y, clYellow, Form1 );
   mouse_point.Show;
   end
   else
   begin
   mouse_quad := KVADRAT.init( mouse_x, mouse_y, 30, clLime, Form1 );
   mouse_quad.show;
   end;
end;
//-----------------------------------------------------------
procedure TForm1.FormMouseDown( Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if  ( Button = mbLeft  ) then
   begin
   mouse_x := X;
   mouse_y := Y;
   end;
   if  ( Button = mbRight ) then
   PopupMenu1.Popup(X, Y);
end;
//-----------------------------------------------------------
procedure TForm1.N1Click( Sender: TObject );
begin
FIG1       := TRUE;
N1.Checked := TRUE;
end;
//-----------------------------------------------------------
procedure TForm1.N2Click( Sender: TObject );
begin
FIG1       := FALSE;
N2.Checked := TRUE;
end;
//-----------------------------------------------------------
procedure TForm1.N3Click( Sender: TObject );
begin
Form1.Refresh;
N3.Checked := TRUE;
end;
//-----------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
FIG1 := TRUE;
N1.Checked := TRUE;
end;
//-----------------------------------------------------------
end.
 