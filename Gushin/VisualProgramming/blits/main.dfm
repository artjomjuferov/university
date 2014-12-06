object Form1: TForm1
  Left = 693
  Top = 322
  Width = 1305
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 139
    Height = 19
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1080#1089#1077#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 152
    Top = 8
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 280
    Top = 8
    Width = 75
    Height = 25
    Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 1208
    Top = 608
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object ListBox1: TListBox
    Left = 8
    Top = 40
    Width = 121
    Height = 585
    ItemHeight = 13
    TabOrder = 3
  end
  object ListBox2: TListBox
    Left = 136
    Top = 40
    Width = 121
    Height = 585
    ItemHeight = 13
    TabOrder = 4
  end
  object Chart1: TChart
    Left = 264
    Top = 40
    Width = 1017
    Height = 561
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1043#1088#1072#1092#1080#1082)
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 5
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
end
