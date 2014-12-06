object frMain: TfrMain
  Left = 192
  Top = 114
  BorderStyle = bsSingle
  Caption = 'TEST  TStringGrid'
  ClientHeight = 513
  ClientWidth = 704
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
    704
    513)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 42
    Height = 24
    Caption = 'M = '
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 128
    Top = 8
    Width = 40
    Height = 24
    Caption = 'N = '
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 240
    Top = 8
    Width = 38
    Height = 24
    Caption = 'K = '
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object edM: TEdit
    Left = 56
    Top = 8
    Width = 41
    Height = 28
    Color = clAqua
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
    Left = 176
    Top = 8
    Width = 41
    Height = 28
    Color = clAqua
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
    Left = 288
    Top = 8
    Width = 41
    Height = 28
    Color = clAqua
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
    Left = 352
    Top = 8
    Width = 73
    Height = 25
    Caption = 'Apply'
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
    Left = 616
    Top = 479
    Width = 81
    Height = 33
    Anchors = [akRight, akBottom]
    TabOrder = 4
    Kind = bkClose
  end
  object Chart1: TChart
    Left = 8
    Top = 352
    Width = 599
    Height = 154
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
    Left = 584
    Top = 40
    Width = 89
    Height = 257
    Caption = 'CLR_TABLE'
    ItemIndex = 0
    Items.Strings = (
      'None'
      'Min_Max'
      'Simple'
      'Palindrome')
    TabOrder = 7
    OnClick = RadioGroup1Click
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
