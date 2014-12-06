unit Point;
interface
uses Forms, Graphics, Windows;
//----------------------------------------------
type  TOCHKA  = class   // ������;
      protected
      forma : TForm;    // �����, ��� �������� �����;
      x, y  : integer;  // ���������� �����;
      cvet  : TColor;   // � ����;
      public
      constructor  Init( xn, yn : integer;
                         color  : TColor;
                         F      : TForm
                        );
      procedure    Show;  virtual;
      end;
//------------------------------------------------------------
implementation
//------------------------------------------------------------
// ������ ������ TOCHKA
//------------------------------------------------------------
constructor TOCHKA.Init(  xn, yn : integer;
                          color  : TColor;
                          F      : TForm
                        );
begin
inherited Create;
x     := xn;
y     := yn;
cvet  := color;
forma := F;
end;
//------------------------------------------------------------
procedure TOCHKA.Show;
begin
   with forma.canvas do
   begin
   pen.Color := cvet;
   ellipse( x - 5, y - 5, x + 5, y + 5 );
   pixels[x, y] := cvet;
   end;
end;
//------------------------------------------------------------
end.