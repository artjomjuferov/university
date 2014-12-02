unit Quad;
interface
uses Point, Forms, Graphics, Windows;
//-----------------------------------------------------------
type  KVADRAT   = class( TOCHKA )  // наследник TOCHKA;
      protected
      side_quad   : word;          // сторона квадрата;
      public
      constructor init(  xn, yn, a  : integer;
                         color      : TColor;
                         F          : TForm
                       );
      procedure   show;  override;
      end;

implementation
//-----------------------------------------------------------
constructor KVADRAT.init( xn, yn, a : Integer;
                          color     : TColor;
                          F         : TForm
                        );
begin
inherited init( xn, yn, color, F );
side_quad := a;
end;
//-----------------------------------------------------------
procedure KVADRAT.show;
var half_side: Integer;
begin
half_side := side_quad div 2;
   with forma.canvas do
   begin
   brush.Style  := bsClear;
   pen.Color    := cvet;
   Rectangle( x - half_side, y - half_side,
              x + half_side, y + half_side  );
   end;
end;
//-----------------------------------------------------------
end.
