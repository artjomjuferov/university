unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  WinExec(PChar('calc.exe'),SW_ShowMaximized);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    ShellExecute(Application.MainForm.Handle,nil,PChar('notepad.exe'),
        nil,nil,SW_ShowNormal);
end;

procedure TForm1.Button3Click(Sender: TObject);
  var st:string;
begin
      st:=ExtractFilePath(Application.ExeName);
     ShellExecute(Application.MainForm.Handle,nil,PChar('my.doc'), nil,
     PChar(st), SW_ShowNormal);

end;

procedure TForm1.Button4Click(Sender: TObject);
    var st:string;
begin     
     st:='C:\Program Files\IrfanView\i_view32.exe';
     WinExec(PChar(st),SW_ShowMaximized);
end;

procedure TForm1.Button5Click(Sender: TObject);
var st:string;
begin
       st:=ExtractFilePath(Application.ExeName);
     ShellExecute(Application.MainForm.Handle,nil,nil,PChar(st), nil,
     SW_ShowMaximized);
end;

procedure TForm1.Button6Click(Sender: TObject);
  var s1,s2:string;
begin
    s1:='data.xls' ;
    s2:=ExtractFilePath(Application.ExeName)+'DATA_XLS\';
   ShellExecute(Application.MainForm.Handle,PChar('open'),PChar(s1),
                    nil,PChar(s2),SW_ShowNormal);
end;

end.
