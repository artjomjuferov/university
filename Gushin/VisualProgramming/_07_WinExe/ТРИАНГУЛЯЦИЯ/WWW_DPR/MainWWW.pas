unit MainWWW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Spin, ComCtrls;

type
  TfrMainWWW = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    CheckBox1: TCheckBox;
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton5: TSpeedButton;
    SaveDialog1: TSaveDialog;
    SpeedButton7: TSpeedButton;
    OpenDialog2: TOpenDialog;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    SpeedButton10: TSpeedButton;
    OpenDialog4: TOpenDialog;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Image1: TPaintBox;
    StatusBar1: TStatusBar;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox5: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpinEdit1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    
  private
    { Private declarations }
    flStartLine : boolean;
    m_iStartX, m_iStartY : integer;
    m_iOldX, m_iOldY : integer;
    procedure Delay(mlsec:integer);
  public
    { Public declarations }
  end;

var
  frMainWWW: TfrMainWWW;

implementation

{$R *.DFM}
   Uses Un_WWW, TxtWWW, Printers;
procedure TfrMainWWW.Button1Click(Sender: TObject);

  var MyBitmap:TBitmap;
begin
   MyBitmap:=TBitmap.Create;
   MyBitmap.LoadFromFile(n_fbmp);
   with Image1, Canvas do begin
      Brush.Color:=clWhite;
      FillRect(Rect(0,0,Width,Height));
      if CheckBox1.Checked then CopyMode:=cmSrcInvert
                           else CopyMode:=cmSrcCopy;
      StretchDraw(Rect(0,0,Width,Height),MyBitmap);
      CopyMode:=cmSrcCopy;
   end;//with
   MyBitmap.Free;
   flCountur:=FALSE;
   flBMP:=TRUE;
end;

procedure TfrMainWWW.FormResize(Sender: TObject);
begin
  Image1.Height:=ClientHeight-20;
  Image1.Width:=Image1.Height;
  LX:=Image1.Width;
  LY:=Image1.Height;
  GroupBox1.Left:=ClientWidth-185;
 
end;

procedure TfrMainWWW.FormDestroy(Sender: TObject);
var i:integer;
begin
   for i:=1 to 500 do  arList[i].Free;
   if flMKE then
      for i:=1 to 500 do  arListMKE[i].Free;
end;

procedure TfrMainWWW.FormCreate(Sender: TObject);
begin
   Set_List(arList);
   Set_List(arListMKE); flMKE:=TRUE;
   kUch:=0;
   minX:=minXSHABLON;
   maxX:=maxXSHABLON;
   minY:=minYSHABLON;
   maxY:=maxYSHABLON;
   RazX:=maxX-minX;
   RazY:=maxY-minY;
   rMark:=SpinEdit1.Value;
   Label3.Caption:='Mark='+IntToStr(rMark);
   Label1.Caption:='Tò-> ';
   Label2.Caption:='Ó÷-> ';
   Path_DATA:=ExtractFilePath(Application.ExeName)+'DATA\';
end;

procedure TfrMainWWW.FormPaint(Sender: TObject);
var i,j,k,u,v,u1,u2,v1,v2,Nom,rM1,rM2:integer;
      __p : pR;
begin
      with Image1,Canvas do BEGIN
           Brush.Color:=clWhite;
           FillRect(Rect(0,0,Width,Height));
           brush.Color:=clRed;
       

              if flPointsMKE and(not flElems)then begin
           Pen.Color:=clGreen;
           for i:=1 to kUchMKE do begin
              k:=arListMKE[i].Count;
              for j:=0 to k-2 do begin
                __p:=arListMKE[i].Items[j];
                   u1:=__p^.X;
                   v1:=__p^.Y;
                   rM1:=__p^.Mark;

                 __p:=arListMKE[i].Items[j+1];
                    u2:=__p^.X;
                    v2:=__p^.Y;
                    rM2:=__p^.Mark;
                if (rM1<>77)and(rM2<>77) then BEGIN
                 MoveTo(u1,v1);LineTo(u2,v2);
                END;
              end;
            end;
          Pen.Color:=clBlack;
          Brush.Color:=clRed;  
            for i:=1 to kUchMKE do begin
              k:=arListMKE[i].Count;
              for j:=0 to k-1 do begin
                __p:=arListMKE[i].Items[j];
                u:=__p^.X;
                v:=__p^.Y;
                 Ellipse(u-2,v-2,u+2,v+2);
              end;
            end;
        end;
         brush.Color:=clWhite;
       if flElems then
          DrawElems(Canvas,Width,Height,0,Height);
      END;//with
end;

procedure TfrMainWWW.CheckBox1Click(Sender: TObject);
begin
  Button1.Click;
end;

procedure TfrMainWWW.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var __p : pR;
      kk:integer;
      s1,s2:string;
begin

  if(Button = mbLeft)and(SpeedButton3.Down) then
    begin

         if(not flStartLine)then begin

                                   INC(kUchMKE);
                                   clear(arListMKE[kUchMKE]);
                                   ListBox1.Clear;
                            Label2.Caption:='Ó÷-> '+IntToStr(kUchMKE);
         end;

         flStartLine := TRUE;
         m_iStartX := X;
         m_iStartY := Y;
         m_iOldX := X;
         m_iOldY := Y;

         new (__p);
         __p^.x := X;
         __p^.y := Y;
         __p^.Mark:=rMark;
         Image1.Canvas.Ellipse(X-2,Y-2,X+2,Y+2);
         arListMKE[kUchMKE].add(__p);

         kk:= ListBox1.Items.Count+1;
         Str(__convert_x(X):10:4,s1);   Str(__convert_y(Y):10:4,s2);
         ListBox1.Items.Add(IntToStr(kk )+'   '+ s1+'   '+s2+
                                                    ' M '+IntToStr(rMark));
         Label1.Caption:='k='+IntToStr(kk);

    end;
end;



procedure TfrMainWWW.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if(Button = mbRight) and (flStartLine)and(SpeedButton3.Down) then
     begin
          flStartLine := FALSE;
          SpeedButton3.Down:=FALSE;
          flPointsMKE:=TRUE;
          Refresh;
     end;
end;

procedure TfrMainWWW.SpeedButton2Click(Sender: TObject);
begin
   frTxtWWW.PrepDATA;
   frTxtWWW.ShowModal;
end;

procedure TfrMainWWW.SpeedButton7Click(Sender: TObject);
var    s1,s2,n_frab:string;
       FF:TEXTFILE;
       i,j,k,kkk,rMark:integer;
       __p : pR;
       rX,rY:real;
begin
      OpenDialog2.InitialDir:=Path_DATA;
   if OpenDialog2.Execute then BEGIN
      n_frab:= OpenDialog2.FileName;
   AssignFile(FF,n_frab);Reset(FF);
   Readln(FF);Readln(FF);
   ListBox1.Clear; kkk:=0;
      NN:=0;NHole:=0;kUchWWW:=0;
   while not EOF(FF) do begin
       Readln(FF,kUchMKE,k);
       INC(kkk,k);
       ListBox1.Items.Add(IntToStr(kUchMKE)+'   '+IntToStr(k));
       arListMKE[kUchMKE].Clear;
       for i:=0 to k-1 do begin
            Readln(FF,j,rX,rY,rMark);
            if (i=0)and(rMark<>77)then begin
                                        INC(NN,k);
                                        INC(kUchWWW);
                                       end;
            if (i=0)and(rMark=77)then INC(NHole,k);
            new (__p);
            __p^.x :=__deconvert_x(rX);
            __p^.y :=__deconvert_y(rY);
            __p^.Mark:=rMark;
            arListMKE[kUchMKE].add(__p);
              Str(rX:10:4,s1);
              Str(rY:10:4,s2);
         ListBox1.Items.Add(IntToStr(i+1)+
                            '   '+ s1+'   '+s2+' M '+IntToStr(rMark));
       end;

   end;//while
   Label1.Caption:='Tò-> '+IntToStr(kkk);
   Label2.Caption:='Ó÷-> '+IntToStr(kUchMKE);

   CloseFile(FF);
   flBMP:=FALSE;
   flPointsMKE:=TRUE;
   FormPaint(Sender);
 END;//if
end;

procedure TfrMainWWW.SpeedButton5Click(Sender: TObject);
var n_f,s1,s2:string;
       FF:TEXTFILE;
       i,j,k:integer;
       __p : pR;
begin
       SaveDialog1.InitialDir:= Path_DATA;
    if SaveDialog1.Execute then begin
            n_f:=SaveDialog1.FileName;
            AssignFile(FF,n_f);Rewrite(FF);
            Writeln(FF,'0 1 0 1');
            Writeln(FF,'1 0 1 0');
            for i:=1 to kUchMKE do begin
                 k:=arListMKE[i].Count;
                 Writeln(FF,IntToStr(i)+' '+IntToStr(k));
                 for j:=0 to k-1 do begin
                      __p :=arListMKE[i].Items[j];
                     Str(__convert_x(__p^.X):10:4,s1);
                     Str(__convert_y(__p^.Y):10:4,s2);
                     Writeln(FF,IntToStr(j+1)+
                              ' '+s1+' '+s2+' ',__p^.Mark);
                 end;
            end;
            CloseFile(FF);
            ShowMessage('Ok!'+#10+n_f);
    end;//if
end;

procedure TfrMainWWW.SpinEdit1Click(Sender: TObject);
begin
   rMark:= SpinEdit1.Value;
   Label3.Caption:='Mark='+IntToStr(rMark);
end;

procedure TfrMainWWW.SpeedButton1Click(Sender: TObject);
begin
     flPointsMKE:=FALSE;
     flBMP:=FALSE;
     flElems:=FALSE;
     flCountur:=FALSE;
     ListBox1.Clear;
     Label1.Caption:='Tò-> ';
     Label2.Caption:='Ó÷-> ';
     kUch:=0;kUchMKE:=0;
     FormPaint(Sender);
end;

procedure TfrMainWWW.SpeedButton10Click(Sender: TObject);
  var n_f:string;
begin
   OpenDialog4.InitialDir:=Path_DATA;
   if OpenDialog4.Execute then begin
      n_f:= OpenDialog4.FileName;
      PrepareDataEle(n_f);
      flElems:=TRUE;
      StatusBar1.Panels[0].Text:='Óçëîâ='+IntToStr(NUZ);
      StatusBar1.Panels[1].Text:='Ýëåìåíòîâ='+IntToStr(NEL);
      FormPaint(Sender);
   end;
end;


procedure TfrMainWWW.SpeedButton4Click(Sender: TObject);
var st,s_area,s_angle,cmdl : String;
begin  if not flPOLY then Exit;

       s_area:=Trim(Edit2.Text);//0.05
       s_angle:=Trim(Edit1.Text);//27
       st:='q'+s_angle+'a'+s_area{+'Y'};
   cmdl:=ExtractFilePath(Application.ExeName)+'DATA/www.exe -'+st+' '+fn;
   ChDir(fp);
   WinExec(PChar(cmdl),SW_SHOW);
   Delay(2000);
   SysUtils.DeleteFile(ChangeFileExt(fn,'.nod'));
   SysUtils.DeleteFile(ChangeFileExt(fn,'.ele'));
   SysUtils.DeleteFile(ChangeFileExt(fn,'.sgm'));
   Delay(2000);
   if not RenameFile(ChangeFileExt(fn,'.1.node'),ChangeFileExt(fn,'.nod')) then
      ShowMessage('Error renaming node-file');
   if not RenameFile(ChangeFileExt(fn,'.1.ele'),ChangeFileExt(fn,'.ele')) then
      ShowMessage('Error renaming ele-file');
   if not RenameFile(ChangeFileExt(fn,'.1.poly'),ChangeFileExt(fn,'.sgm')) then
      ShowMessage('Error renaming poly-file');
   Delay(1000);
   //frTrngl.ShowModal(ChangeFileExt(fn,'.nod'),ChangeFileExt(fn,'.ele'),ChangeFileExt(fn,'.sgm'));
   ShowMessage('Ok!');
end;

procedure TfrMainWWW.Delay(mlsec: Integer);
var FirstTick : longint;
begin
   FirstTick:=GetTickCount;
   repeat
      Application.ProcessMessages;
   until GetTickCount-FirstTick>=mlsec;
end;

end.

