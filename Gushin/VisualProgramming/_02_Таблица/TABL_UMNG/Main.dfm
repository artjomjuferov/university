object Form1: TForm1
  Left = 192
  Top = 114
  Width = 783
  Height = 469
  Caption = #1058#1072#1073#1083#1080#1094#1072' '#1091#1084#1085#1086#1078#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 616
    Top = 384
    Width = 153
    Height = 41
    TabOrder = 0
    Kind = bkClose
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 593
    Height = 289
    ColCount = 9
    DefaultRowHeight = 30
    DefaultDrawing = False
    RowCount = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
  end
  object RadioGroup1: TRadioGroup
    Left = 624
    Top = 8
    Width = 137
    Height = 281
    Caption = #1057#1058#1056#1054#1050#1040
    ItemIndex = 2
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9')
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object StringGrid2: TStringGrid
    Left = 8
    Top = 320
    Width = 601
    Height = 41
    ColCount = 9
    DefaultRowHeight = 30
    DefaultDrawing = False
    RowCount = 1
    FixedRows = 0
    TabOrder = 3
    OnDrawCell = StringGrid2DrawCell
  end
end
