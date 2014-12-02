object Form1: TForm1
  Left = 219
  Top = 143
  Width = 649
  Height = 418
  Caption = ' simple OOP'
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 120
  TextHeight = 16
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 88
    object N1: TMenuItem
      Caption = #1090#1086#1095#1082#1072
      RadioItem = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1082#1074#1072#1076#1088#1072#1090
      RadioItem = True
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1086#1095#1080#1089#1090#1080#1090#1100
      RadioItem = True
      OnClick = N3Click
    end
  end
end
