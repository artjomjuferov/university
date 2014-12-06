object frMain: TfrMain
  Left = 249
  Top = 218
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#1088#1072#1073#1086#1090#1072' '#8470'2'
  ClientHeight = 528
  ClientWidth = 1420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = Button1Click
  DesignSize = (
    1420
    528)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 25
    Height = 24
    Caption = 'N='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 8
    Width = 27
    Height = 24
    Caption = 'M='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 200
    Top = 8
    Width = 23
    Height = 24
    Caption = 'K='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edM: TEdit
    Left = 56
    Top = 8
    Width = 41
    Height = 28
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '10'
  end
  object edN: TEdit
    Left = 144
    Top = 8
    Width = 41
    Height = 28
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '10'
  end
  object edK: TEdit
    Left = 232
    Top = 8
    Width = 57
    Height = 28
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '100'
  end
  object Button1: TButton
    Left = 312
    Top = 8
    Width = 113
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 1332
    Top = 486
    Width = 81
    Height = 33
    Anchors = [akRight, akBottom]
    TabOrder = 4
    Kind = bkClose
  end
  object Chart1: TChart
    Left = 8
    Top = 352
    Width = 1305
    Height = 169
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'TChart')
    LeftAxis.StartPosition = 3.000000000000000000
    LeftAxis.EndPosition = 97.000000000000000000
    Legend.Visible = False
    View3D = False
    Color = clWhite
    TabOrder = 5
    Anchors = [akLeft, akTop, akRight, akBottom]
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
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
  object StringGrid1: TStringGrid
    Left = 8
    Top = 40
    Width = 545
    Height = 297
    ColCount = 13
    DefaultColWidth = 40
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 13
    FixedRows = 0
    TabOrder = 6
    OnClick = StringGrid1Click
    OnDrawCell = StringGrid1DrawCell
  end
  object RadioGroup1: TRadioGroup
    Left = 576
    Top = 40
    Width = 169
    Height = 81
    Caption = #1056#1072#1076#1080#1086#1082#1085#1086#1087#1082#1080
    ItemIndex = 0
    Items.Strings = (
      #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1074#1099#1076#1077#1083#1103#1090#1100
      #1042#1099#1076#1077#1083#1080#1090#1100' '#1084#1072#1082#1089#1080#1084#1091#1084#1099)
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
  object StringGrid2: TStringGrid
    Left = 768
    Top = 40
    Width = 545
    Height = 297
    ColCount = 13
    DefaultColWidth = 40
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 13
    FixedRows = 0
    TabOrder = 8
    OnClick = StringGrid2Click
    OnDrawCell = StringGrid2DrawCell
  end
  object MainMenu1: TMainMenu
    Left = 464
    Top = 8
    object mnFile: TMenuItem
      Caption = 'File'
    end
    object mnHelp: TMenuItem
      Caption = 'Help'
      object mnAvtor: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = mnAvtorClick
      end
      object mnTASK: TMenuItem
        Caption = #1059#1089#1083#1086#1074#1080#1077
        OnClick = mnTASKClick
      end
    end
  end
end
