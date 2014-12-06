unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Work, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls,
  Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


end.
