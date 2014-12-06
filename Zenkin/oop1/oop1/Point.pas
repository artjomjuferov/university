unit Point;
interface
uses Forms, Graphics, Windows;
//----------------------------------------------
type  TOCHKA  = class   // предок;
      protected
      forma : TForm;    // форма, где рисуется точка;
      x, y  : integer;  // координаты точки;
      cvet  : TColor;   // её цвет;
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
// методы класса TOCHKA
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