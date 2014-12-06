object Form1: TForm1
  Left = 192
  Top = 108
  Width = 966
  Height = 655
  Caption = #1043#1088#1072#1092#1080#1082'  '#1055#1086#1074#1086#1088#1086#1090'   '#1048#1085#1074#1077#1088#1089#1080#1103' '#1086#1089#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    958
    617)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 784
    Top = 16
    Width = 169
    Height = 561
    ItemHeight = 13
    TabOrder = 0
  end
  object Chart1: TChart
    Left = 24
    Top = 104
    Width = 441
    Height = 169
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Legend.Visible = False
    View3D = False
    TabOrder = 1
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
  end
  object Button1: TButton
    Left = 152
    Top = 288
    Width = 97
    Height = 33
    Caption = 'Fill All'
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object Chart2: TChart
    Left = 24
    Top = 360
    Width = 441
    Height = 169
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    LeftAxis.Logarithmic = True
    Legend.Visible = False
    View3D = False
    TabOrder = 3
    object Series2: TLineSeries
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
  end
  object BitBtn1: TBitBtn
    Left = 808
    Top = 583
    Width = 121
    Height = 34
    Anchors = [akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Kind = bkClose
  end
  object Chart3: TChart
    Left = 528
    Top = 104
    Width = 241
    Height = 465
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.LabelsAngle = 90
    BottomAxis.Logarithmic = True
    LeftAxis.Inverted = True
    Legend.Visible = False
    TopAxis.Logarithmic = True
    View3D = False
    TabOrder = 5
    object Series3: TLineSeries
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
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 601
    Height = 89
    Alignment = taCenter
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 6
  end
end
