object Form1: TForm1
  Left = 195
  Top = 242
  BorderStyle = bsSingle
  Caption = #1040#1051#1043#1054#1056#1048#1058#1052'  '#1056#1045#1064#1045#1053#1048#1071'  '#1057#1051#1040#1059'   '#1084'. '#1047#1045#1049#1044#1045#1051#1071' ('#1047#1072#1074#1072#1088#1099#1082#1080#1085')'
  ClientHeight = 644
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = Button1Click
  DesignSize = (
    904
    644)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 768
    Top = 32
    Width = 34
    Height = 24
    Caption = 'N ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 384
    Width = 267
    Height = 15
    Caption = #1052' '#1040' '#1058' '#1056' '#1048' '#1062' '#1040'   '#1053' '#1054' '#1056' '#1052' '#1040' '#1051' '#1068' '#1053' '#1054' '#1049'   '#1060' '#1054' '#1056' '#1052' '#1067
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 144
    Top = 560
    Width = 278
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = #1050' '#1054' '#1056' '#1053' '#1048'   '#1057' '#1048' '#1057' '#1058' '#1045' '#1052' '#1067' ('#1084'.'#1043#1072#1091#1089#1089#1072' '#1080' '#1084'.'#1047#1077#1081#1076#1077#1083#1103')'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 136
    Top = 8
    Width = 190
    Height = 15
    Caption = #1048' '#1057' '#1061' '#1054' '#1044' '#1053' '#1040' '#1071'      '#1052' '#1040' '#1058' '#1056' '#1048' '#1062' '#1040'   '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 800
    Top = 224
    Width = 39
    Height = 24
    Caption = 'kk ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 24
    Width = 737
    Height = 329
    ColCount = 22
    DefaultColWidth = 32
    DefaultRowHeight = 14
    DefaultDrawing = False
    RowCount = 21
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
  end
  object StringGrid2: TStringGrid
    Left = 8
    Top = 400
    Width = 737
    Height = 145
    Anchors = [akLeft, akTop, akBottom]
    ColCount = 21
    DefaultColWidth = 32
    DefaultRowHeight = 14
    DefaultDrawing = False
    RowCount = 21
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnDrawCell = StringGrid2DrawCell
  end
  object BitBtn1: TBitBtn
    Left = 802
    Top = 603
    Width = 97
    Height = 33
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkClose
  end
  object Edit1: TEdit
    Left = 816
    Top = 32
    Width = 65
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = '20'
  end
  object Button1: TButton
    Left = 768
    Top = 80
    Width = 105
    Height = 25
    Caption = 'Apply'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object StringGrid3: TStringGrid
    Left = 8
    Top = 579
    Width = 705
    Height = 49
    Anchors = [akLeft, akBottom]
    ColCount = 21
    DefaultColWidth = 32
    DefaultRowHeight = 14
    DefaultDrawing = False
    RowCount = 3
    TabOrder = 5
    OnDrawCell = StringGrid3DrawCell
  end
  object Button2: TButton
    Left = 768
    Top = 120
    Width = 105
    Height = 25
    Caption = 'TEST_3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 760
    Top = 264
    Width = 137
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 7
  end
  object Button3: TButton
    Left = 768
    Top = 160
    Width = 105
    Height = 33
    Caption = 'Determin'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = Button3Click
  end
end
