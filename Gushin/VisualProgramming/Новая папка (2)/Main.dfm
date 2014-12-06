object Form1: TForm1
  Left = 410
  Top = 225
  Width = 1165
  Height = 598
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 12
    Height = 13
    Caption = 'n='
  end
  object Edit1: TEdit
    Left = 40
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 24
    Top = 120
    Width = 145
    Height = 353
    ItemHeight = 13
    TabOrder = 1
  end
  object ListBox2: TListBox
    Left = 232
    Top = 120
    Width = 153
    Height = 361
    ItemHeight = 13
    TabOrder = 2
  end
  object Chart1: TChart
    Left = 504
    Top = 120
    Width = 529
    Height = 409
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 3
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
  object Button1: TButton
    Left = 216
    Top = 64
    Width = 75
    Height = 25
    Caption = #1057#1095#1077#1090
    TabOrder = 4
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 488
    Top = 128
    object mnFile: TMenuItem
      Caption = 'file'
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object N1: TMenuItem
        Caption = #1091#1089#1083#1086#1074#1080#1077
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N2Click
      end
    end
  end
end
