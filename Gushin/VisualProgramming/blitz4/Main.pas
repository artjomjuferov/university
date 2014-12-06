unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Author, Task, StdCtrls, Buttons, Clipbrd, Work;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Memo2: TMemo;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N6: TMenuItem;
    N7: TMenuItem;
    lst1: TListBox;
    cht1: TChart;
    Series1: TPieSeries;
    Series2: TBarSeries;
    lnsrsSeries3: TLineSeries;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.N4Click(Sender: TObject);
begin
  AboutBox2.ShowModal;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('input.txt');
  Memo2.Clear;
  Memo2.Lines.Add('Выберите фрагмент!');
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  i:integer;
begin
    Memo1.CopyToClipboard;
    Memo2.Clear;
    Memo2.PasteFromClipboard;
    analiz(Memo2);
    ListBox1.Clear;
    if n<>0 then
       for i:=1 to n do ListBox1.Items.Add(IntToStr(i)+' '+word1[i])
    else ListBox1.Items.Add ('Слов без повторяющихся букв нет');
    ListBox1.Items.Add ('-------------------------');
    if m<>0 then
       for i:=1 to m do ListBox1.Items.Add(IntToStr(i)+' '+word2[i])
    else ListBox1.Items.Add ('Все слова состоят из неповторяющихся букв');
end;

procedure TForm1.N2Click(Sender: TObject);
   var n_f:string;
begin
   OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
   if OpenDialog1.Execute then begin
      n_f:= OpenDialog1.FileName;
      Memo1.Lines.LoadFromFile(n_f);
      Caption:='АНАЛИЗ  ТЕКСТА -> '+ExtractFileName(n_f);
	    Memo2.Clear;
   	  Memo2.Lines.Add('ВЫБРАТЬ  ФРАГМЕНТ');
   end;
end;

procedure TForm1.N6Click(Sender: TObject);
var n_f:string;  i:integer; FF:TEXTFILE;
begin
   {if n=0 then begin
      ShowMessage('EMPTY');
      Exit;
   end; }
   SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
   if SaveDialog1.Execute then begin
       n_f:=SaveDialog1.FileName;
       AssignFile(FF,n_f);
       Rewrite(FF);
       for i:=0 to ListBox1.Items.Count-1 do
           Writeln(FF,ListBox1.Items[i]);
       CloseFile(FF);
       ShowMessage('SaveAs '+ExtractFileName(n_f));
   end;
end;

end.
