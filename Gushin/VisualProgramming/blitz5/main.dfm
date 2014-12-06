object Form1: TForm1
  Left = 299
  Top = 203
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 620
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  DesignSize = (
    814
    620)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 19
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mmo1: TMemo
    Left = 8
    Top = 40
    Width = 483
    Height = 529
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object btn2: TBitBtn
    Left = 729
    Top = 584
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkClose
  end
  object btn1: TButton
    Left = 320
    Top = 8
    Width = 97
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
  end
  object edt1: TEdit
    Left = 104
    Top = 8
    Width = 209
    Height = 25
    TabOrder = 3
  end
  object lst1: TListBox
    Left = 499
    Top = 40
    Width = 305
    Height = 529
    Anchors = [akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 4
  end
  object MainMenu1: TMainMenu
    Left = 384
    Top = 56
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        OnClick = N2Click
      end
      object N6: TMenuItem
        Caption = #1042#1099#1093#1086#1076
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
  object dlgOpen1: TOpenDialog
    Filter = '*.txt|*.txt'
    Left = 336
    Top = 56
  end
end
