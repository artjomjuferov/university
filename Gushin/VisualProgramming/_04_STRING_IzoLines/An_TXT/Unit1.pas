unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Menus, Clipbrd;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mnFile: TMenuItem;
    mnHelp: TMenuItem;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    Memo2: TMemo;
    ListBox1: TListBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    mnOpen: TMenuItem;
    mnSave: TMenuItem;
    Razdel: TMenuItem;
    mnOut: TMenuItem;
    procedure mnOpenClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure mnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
   Uses Un_Rab;
procedure TForm1.mnOpenClick(Sender: TObject);
   var n_f:string;
begin
   OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
   if OpenDialog1.Execute then begin
         n_f:= OpenDialog1.FileName;
         Memo1.Lines.LoadFromFile(n_f);
         Caption:='¿Õ¿À»«  “≈ —“¿ '+ExtractFileName(n_f);
   end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
   var i:integer;
begin
   Clipboard.Clear;
   Memo1.CopyToClipboard;
   Memo2.Clear;
   Memo2.PasteFromClipboard;
   ANALIZ(MEMO2,n);// n - Count NewWords
   ListBox1.Clear;
   if n<>0 then
      for i:=1 to n do
          ListBox1.Items.Add(IntToStr(i)+' '+NewWords[i])
           else ListBox1.Items.Add ('EMPTY');
end;

procedure TForm1.mnSaveClick(Sender: TObject);
var n_f:string;  i:integer; FF:TEXTFILE;
begin
   if n=0 then begin
          ShowMessage('EMPTY');
          Exit;
   end;
   SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
   if SaveDialog1.Execute then begin
       n_f := SaveDialog1.FileName;
       AssignFile(FF,n_f); Rewrite(FF);
       for i:=0 to ListBox1.Items.Count-1 do
          Writeln(FF,ListBox1.Items[i]);
      ShowMessage('SaveAs '+ExtractFileName(n_f));
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+
                                        'TASK.txt');
   Memo2.Clear;
   Memo2.Lines.Add('¬€¡–¿“‹  ‘–¿√Ã≈Õ“  “≈ —“¿');
end;

end.
