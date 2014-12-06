object Form1: TForm1
  Left = 354
  Top = 193
  Align = alRight
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 682
  ClientWidth = 1289
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
    1289
    682)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 19
    Caption = 'M = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 120
    Top = 8
    Width = 33
    Height = 19
    Caption = 'N = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 248
    Top = 8
    Width = 26
    Height = 19
    Caption = 'K ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 1208
    Top = 649
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 0
    Kind = bkClose
  end
  object Edit1: TEdit
    Left = 40
    Top = 8
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 152
    Top = 8
    Width = 73
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 280
    Top = 8
    Width = 73
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 376
    Top = 8
    Width = 75
    Height = 21
    Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 40
    Width = 545
    Height = 353
    Align = alCustom
    Anchors = [akLeft, akTop, akBottom]
    ColCount = 13
    DefaultColWidth = 40
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 13
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    TabOrder = 5
    OnClick = StringGrid1Click
    OnDrawCell = StringGrid1DrawCell
  end
  object Chart1: TChart
    Left = 8
    Top = 400
    Width = 1097
    Height = 274
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 6
    Anchors = [akLeft, akBottom]
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
  object RadioGroup1: TRadioGroup
    Left = 1112
    Top = 0
    Width = 169
    Height = 89
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1073#1086#1088' '#1088#1077#1078#1080#1084#1072
    Items.Strings = (
      #1054#1089#1086#1073#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
      #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1075#1088#1072#1092#1080#1082#1072)
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
  object StringGrid2: TStringGrid
    Left = 560
    Top = 40
    Width = 545
    Height = 353
    Anchors = [akLeft, akTop, akBottom]
    BiDiMode = bdLeftToRight
    ColCount = 13
    DefaultColWidth = 40
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 13
    FixedRows = 0
    ParentBiDiMode = False
    TabOrder = 8
    OnDrawCell = StringGrid2DrawCell
  end
  object MainMenu1: TMainMenu
    Left = 1168
    Top = 648
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object Help1: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N1: TMenuItem
        Caption = #1059#1089#1083#1086#1074#1080#1077
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #1054#1073' '#1072#1074#1090#1086#1088#1077
        OnClick = N2Click
      end
    end
  end
end
