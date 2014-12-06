unit MainStac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TfrMainStac = class(TForm)
    MainMenu1: TMainMenu;
    mn_File: TMenuItem;
    Razdel: TMenuItem;
    mn_Calculation: TMenuItem;
    mn_Param: TMenuItem;
    nod1: TMenuItem;
    OpenDialog2: TOpenDialog;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox1: TCheckBox;
    PaintBox1: TPaintBox;
    BitBtn1: TBitBtn;
    mn_Out: TMenuItem;
    RadioGroup1: TRadioGroup;
    CheckBox4: TCheckBox;
    procedure mn_OutClick(Sender: TObject);
   
    procedure mn_CalculationClick(Sender: TObject);
    procedure mn_ParamClick(Sender: TObject);
    procedure nod1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMainStac: TfrMainStac;

implementation

{$R *.DFM}
    Uses Uni_mke,  Resolv, Params;
procedure TfrMainStac.mn_OutClick(Sender: TObject);
begin
    Close
end;

procedure TfrMainStac.mn_CalculationClick(Sender: TObject);
begin
   ResolvDif; // Â¯ÂÌËÂ Á‡‰‡˜Ë ƒ»‘‘”«»»
   //ShowMessage('Ok!Solv');
   frResolv.StringGrid2.RowCount:=NUZ+1;
   frResolv.StringGrid2.ColCount:=MS+1;
   frResolv.Grid1.RowCount:=(NUZ+9)div 10+1;
   frResolv.ShowModal;
end;

procedure TfrMainStac.mn_ParamClick(Sender: TObject);
begin
  frParams.ShowModal;
end;

procedure TfrMainStac.nod1Click(Sender: TObject);
var _p:^integer;
      i,j,Kol,M1,M2:integer;
      st,s1,s2:string;
begin
   OpenDialog2.InitialDir:=PathWrite;
   if OpenDialog2.Execute then begin
      st:=ExtractFileName(OpenDialog2.FileName);
      Caption:='Ã≈“Œƒ   ŒÕ≈◊Õ€’   ›À≈Ã≈Õ“Œ¬' +' '+st;

      Screen.Cursor := crHourglass;
      PrepareDataEle(st);//—≈“ ¿ ...
      
      Screen.Cursor := crDefault;
      flElems:=TRUE;  flSegms:=TRUE;flInterPoints:=TRUE;
      StatusBar1.Panels[0].Text:=' NUZ='+IntToStr(NUZ)+
                                 ' NEL='+IntToStr(NEL)+
                                 ' FrontPP='+IntToStr(NSEGM)+
                                 ' ShMSV='+IntToStr(ShMSV)+
                                 ' ShMSVNew='+IntToStr(ShMSVNew);
      CheckBox1.Color:=clLime;
      CheckBox2.Color:=clLime;
      CheckBox3.Color:=clLime;
      CheckBox4.Color:=clLime;
      CheckBox7.Color:=clLime;
      CheckBox8.Color:=clLime;
      M1:=arListFront[1].Count +
          arListFront[2].Count +
          arListFront[3].Count +
          arListFront[4].Count; //““ „. ‚ÌÂ¯
      M2:=arListFront[5].Count; //““ „. ‚ÌÛÚ
      StatusBar1.Panels[1].Text:= '““ ‚ÌÂ¯->'+IntToStr(M1)+
                                '; ““ ‚ÌÛÚ->'+IntToStr(M2);
      TestAreas;
      STR(MinArea:6:4,s1);STR(MaxArea:6:4,s2);
      StatusBar1.Panels[2].Text:='MinAr='+ s1+' '+'MaxAr='+s2;
      flNODES:=TRUE;
      Refresh;
   end;

end;

procedure TfrMainStac.FormCreate(Sender: TObject);
   var i:integer;
begin
   PathWrite:= ExtractFilePath(Application.ExeName)+'DATA\';
//------  —Œ«ƒ¿Õ»≈  —œ»— Œ¬  ƒÀﬂ   *.nod  ------------------
   Set_List(arList);
   Set_List(NewArList);
   //RabPath:= ExtractFilePath(Application.ExeName);
   for i:=1 to mNUZ do  MasPiramid[i]:=TList.Create;
   for i:=1 to N_ISELAND+4 do arListFront[i]:=TList.Create;
   for i:=1 to N_ISELAND+4 do arListSegm[i]:=TList.Create;
   InterPoints:=TList.Create;
   Piramides:=TList.Create;
   //AssignMem;
end;

procedure TfrMainStac.FormPaint(Sender: TObject);
begin
   with PaintBox1,Canvas do begin
      Brush.Color:=clTeal;
      FillRect(ClientRect);
   if flNODES  then BEGIN
      if flElems and CheckBox1.Checked then BEGIN
          DrawElems(Canvas,Width{Height}-20,Height-20,10,Height-10);
          if CheckBox8.Checked then
               DrawMiMaxElems(Canvas,Width{Height}-20,Height-20,10,Height-10);
       END;
       if flSegms and CheckBox2.Checked then
          DrawFrontTT(Canvas,Width{Height}-20,Height-20,10,Height-10);
       if flInterPoints and CheckBox3.Checked then
          DrawInterPoints(Canvas,Width{Height}-20,Height-20,10,Height-10);
       if CheckBox4.Checked then
            DrawSegms(Canvas,Width-20,Height-20,10,Height-10);
            
       if CheckBox7.Checked then
           VisualBand(Canvas,MSV,300,300,Width-310,Height-10,0);
       

   END;//NODES
   end;//with
end;

procedure TfrMainStac.FormDestroy(Sender: TObject);
  var i:integer;
begin
  //--------- Œ—¬Œ¡Œ∆ƒ≈Õ»≈   —œ»— Œ¬   *.nod ----------
   for i:=1 to N_List do  arList[i].Free;
   for i:=1 to N_List do  NewArList[i].Free;
   for i:=1 to mNUZ do  MasPiramid[i].Free;
   for i:=1 to N_ISELAND+4 do arListFront[i].Free;
   for i:=1 to N_ISELAND+4 do arListSegm[i].Free;
   InterPoints.Free;
   Piramides.Free;
    // ------   œ¿Ãﬂ“‹   ƒÀﬂ   Ã¿“–»÷  --------------------
       For i:=1 to 300 do Dispose(AMat[i]);
       For i:=1 to 300 do Dispose(ARMat[i]);
end;

procedure TfrMainStac.RadioGroup1Click(Sender: TObject);
begin
   Variant:=RadioGroup1.ItemIndex;
end;

end.
