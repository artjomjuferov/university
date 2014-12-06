object Form1: TForm1
  Left = 245
  Top = 204
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 776
  ClientWidth = 1560
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
    1560
    776)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 144
    Height = 19
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'  '#1095#1080#1089#1077#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 288
    Top = 8
    Width = 75
    Height = 25
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object Chart1: TChart
    Left = 328
    Top = 40
    Width = 1225
    Height = 697
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1043#1088#1072#1092#1080#1082)
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    Color = clWhite
    TabOrder = 1
    Anchors = [akLeft, akTop, akRight, akBottom]
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
  object ListBox1: TListBox
    Left = 4
    Top = 40
    Width = 153
    Height = 729
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 2
  end
  object ListBox2: TListBox
    Left = 163
    Top = 40
    Width = 153
    Height = 729
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 1479
    Top = 744
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 4
    Kind = bkClose
  end
  object Edit1: TEdit
    Left = 160
    Top = 8
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object MainMenu1: TMainMenu
    object N2: TMenuItem
      Caption = #1060#1072#1081#1083
      object N3: TMenuItem
        Caption = #1047#1072#1076#1072#1085#1080#1077
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object N1: TMenuItem
      Caption = #1054#1073' '#1072#1074#1090#1086#1088#1077
      OnClick = N1Click
    end
  end
end
