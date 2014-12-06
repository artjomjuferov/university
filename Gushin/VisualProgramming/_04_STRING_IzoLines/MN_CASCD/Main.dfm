object Form1: TForm1
  Left = 278
  Top = 161
  Width = 544
  Height = 405
  Caption = 'Demo PopupMenu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu2
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'OBJECT'
    TabOrder = 0
    OnMouseDown = Button1MouseDown
  end
  object Memo1: TMemo
    Left = 16
    Top = 224
    Width = 505
    Height = 97
    Alignment = taCenter
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Lines.Strings = (
      #1044#1083#1103' '#1074#1099#1079#1086#1074#1072' '#1074#1089#1087#1083#1099#1074#1072#1102#1097#1077#1075#1086' '
      #1084#1077#1085#1102' '#1085#1072#1078#1072#1090#1100' '#1085#1072' '#1082#1085#1086#1087#1082#1077' '
      #1087#1088#1072#1074#1091#1102' '#1082#1083#1072#1074#1080#1096#1091' '#1084#1099#1096#1082#1080)
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 408
    Top = 328
    Width = 121
    Height = 33
    TabOrder = 2
    Kind = bkClose
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 256
    Top = 160
    object mn_1: TMenuItem
      Caption = #1055#1055'_1'
      object mn_1_1: TMenuItem
        Caption = #1055#1055'_1_1'
        object mn_1_1_1: TMenuItem
          Caption = #1055#1055'_1_1_1'
          OnClick = mn_1_1_1Click
        end
      end
      object mn_1_2: TMenuItem
        Caption = #1055#1055'_1_2'
        object mn_1_2_1: TMenuItem
          Caption = #1055#1055'_1_2_1'
          OnClick = mn_1_2_1Click
        end
      end
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 128
    Top = 128
    object mnC1: TMenuItem
      Caption = 'C1'
      object mnC1_1: TMenuItem
        Caption = 'C1_1'
        OnClick = mnC1_1Click
      end
    end
    object mnC2: TMenuItem
      Caption = 'C2'
      OnClick = mnC2Click
    end
  end
end
