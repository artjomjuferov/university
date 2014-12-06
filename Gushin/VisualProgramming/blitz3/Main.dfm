object Form1: TForm1
  Left = 304
  Top = 373
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 782
  ClientWidth = 1459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  DesignSize = (
    1459
    782)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 24
    Width = 15
    Height = 13
    Caption = 'N='
  end
  object lbl2: TLabel
    Left = 168
    Top = 24
    Width = 13
    Height = 13
    Caption = 'L='
  end
  object cht1: TChart
    Left = 16
    Top = 56
    Width = 1225
    Height = 293
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1042#1077#1082#1090#1086#1088#1099)
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    object Series1: TArrowSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      EndXValues.DateTime = True
      EndXValues.Name = 'EndX'
      EndXValues.Multiplier = 1.000000000000000000
      EndXValues.Order = loNone
      EndYValues.DateTime = False
      EndYValues.Name = 'EndY'
      EndYValues.Multiplier = 1.000000000000000000
      EndYValues.Order = loNone
      StartXValues.DateTime = True
      StartXValues.Name = 'X'
      StartXValues.Multiplier = 1.000000000000000000
      StartXValues.Order = loAscending
      StartYValues.DateTime = False
      StartYValues.Name = 'Y'
      StartYValues.Multiplier = 1.000000000000000000
      StartYValues.Order = loNone
    end
  end
  object btn1: TButton
    Left = 320
    Top = 24
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Default = True
    TabOrder = 1
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 32
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edt2: TEdit
    Left = 184
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object cht2: TChart
    Left = 16
    Top = 356
    Width = 729
    Height = 385
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1057#1091#1084#1084#1072#1088#1085#1099#1081' '#1074#1077#1082#1090#1086#1088)
    AxisVisible = False
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 4
    Anchors = [akLeft, akRight, akBottom]
    object Series2: TArrowSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      EndXValues.DateTime = True
      EndXValues.Name = 'EndX'
      EndXValues.Multiplier = 1.000000000000000000
      EndXValues.Order = loNone
      EndYValues.DateTime = False
      EndYValues.Name = 'EndY'
      EndYValues.Multiplier = 1.000000000000000000
      EndYValues.Order = loNone
      StartXValues.DateTime = True
      StartXValues.Name = 'X'
      StartXValues.Multiplier = 1.000000000000000000
      StartXValues.Order = loAscending
      StartYValues.DateTime = False
      StartYValues.Name = 'Y'
      StartYValues.Multiplier = 1.000000000000000000
      StartYValues.Order = loNone
    end
    object Series4: TArrowSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.HorizSize = 10
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.VertSize = 10
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      EndXValues.DateTime = True
      EndXValues.Name = 'EndX'
      EndXValues.Multiplier = 1.000000000000000000
      EndXValues.Order = loNone
      EndYValues.DateTime = False
      EndYValues.Name = 'EndY'
      EndYValues.Multiplier = 1.000000000000000000
      EndYValues.Order = loNone
      StartXValues.DateTime = True
      StartXValues.Name = 'X'
      StartXValues.Multiplier = 1.000000000000000000
      StartXValues.Order = loAscending
      StartYValues.DateTime = False
      StartYValues.Name = 'Y'
      StartYValues.Multiplier = 1.000000000000000000
      StartYValues.Order = loNone
    end
  end
  object cht3: TChart
    Left = 752
    Top = 356
    Width = 697
    Height = 385
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1055#1088#1086#1075#1088#1077#1089#1089#1080#1074#1085#1099#1081' '#1074#1077#1082#1090#1086#1088)
    AxisVisible = False
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 5
    Anchors = [akRight, akBottom]
    object Series3: TArrowSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      EndXValues.DateTime = True
      EndXValues.Name = 'EndX'
      EndXValues.Multiplier = 1.000000000000000000
      EndXValues.Order = loNone
      EndYValues.DateTime = False
      EndYValues.Name = 'EndY'
      EndYValues.Multiplier = 1.000000000000000000
      EndYValues.Order = loNone
      StartXValues.DateTime = True
      StartXValues.Name = 'X'
      StartXValues.Multiplier = 1.000000000000000000
      StartXValues.Order = loAscending
      StartYValues.DateTime = False
      StartYValues.Name = 'Y'
      StartYValues.Multiplier = 1.000000000000000000
      StartYValues.Order = loNone
    end
    object Series5: TArrowSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.HorizSize = 10
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.VertSize = 10
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      EndXValues.DateTime = True
      EndXValues.Name = 'EndX'
      EndXValues.Multiplier = 1.000000000000000000
      EndXValues.Order = loNone
      EndYValues.DateTime = False
      EndYValues.Name = 'EndY'
      EndYValues.Multiplier = 1.000000000000000000
      EndYValues.Order = loNone
      StartXValues.DateTime = True
      StartXValues.Name = 'X'
      StartXValues.Multiplier = 1.000000000000000000
      StartXValues.Order = loAscending
      StartYValues.DateTime = False
      StartYValues.Name = 'Y'
      StartYValues.Multiplier = 1.000000000000000000
      StartYValues.Order = loNone
    end
  end
  object lst1: TListBox
    Left = 1248
    Top = 56
    Width = 201
    Height = 293
    Anchors = [akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 6
  end
  object btn2: TBitBtn
    Left = 1376
    Top = 748
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 7
    Kind = bkClose
  end
  object MainMenu1: TMainMenu
    Left = 712
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N4: TMenuItem
        Caption = #1047#1072#1076#1072#1085#1080#1077
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1040#1074#1090#1086#1088
        OnClick = N5Click
      end
    end
  end
end
