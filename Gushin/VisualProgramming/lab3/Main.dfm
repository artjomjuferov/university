object Form1: TForm1
  Left = 271
  Top = 214
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 617
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
  DesignSize = (
    1289
    617)
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TBitBtn
    Left = 1208
    Top = 568
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 0
    Kind = bkClose
  end
  object stat1: TStatusBar
    Left = 0
    Top = 598
    Width = 1289
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 1168
    Top = 560
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1047#1072#1076#1072#1085#1080#1077
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N5: TMenuItem
        Caption = #1054#1073' '#1072#1074#1090#1086#1088#1077
        OnClick = N5Click
      end
    end
  end
end
