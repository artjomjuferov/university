object Form1: TForm1
  Left = 389
  Top = 598
  Width = 1052
  Height = 681
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1036
    643)
  PixelsPerInch = 96
  TextHeight = 13
  object Task_text: TMemo
    Left = 80
    Top = 16
    Width = 809
    Height = 577
    Color = clGreen
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    Lines.Strings = (
      'Task_text')
    ParentFont = False
    TabOrder = 0
  end
  object exit_button: TBitBtn
    Left = 936
    Top = 600
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkClose
  end
end
