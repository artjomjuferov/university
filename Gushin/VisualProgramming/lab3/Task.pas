unit Task;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox1 = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    lblComments: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox1: TAboutBox1;

implementation

{$R *.dfm}

end.
 
