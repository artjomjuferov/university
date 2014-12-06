object Form1: TForm1
  Left = 192
  Top = 148
  Width = 870
  Height = 640
  Caption = #1040#1053#1040#1051#1048#1047'   '#1058#1045#1050#1057#1058#1040
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  DesignSize = (
    862
    576)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 328
    Top = 336
    Width = 41
    Height = 33
    Anchors = [akLeft, akBottom]
    Glyph.Data = {
      76020000424D7602000000000000760000002800000020000000200000000100
      0400000000000002000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      CCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCCCCFFFFFFFFFFFFFFFFFFFFCCCC
      CCCCCCCCCFFFFFFFFFFFFFFFFFFCCCCCCCCCCCCCCCFFFFFFFFFFFFFFFFCCCCCC
      CCCCCCCCCCCFFFFFFFFFFFFFFCCCCCCCCCCCCCCCCCCCFFFFFFFFFFFFCCCCCCCC
      CCCCCCCCCCCCCFFFFFFFFFFCCCCCCCCCCCCCCCCCCCCCCCFFFFFFFFCCCCCCCCCC
      CCCCCCCCCCCCCCCFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFC
      CCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCCCFFFFFFFFFFFFF}
    OnClick = SpeedButton1Click
  end
  object BitBtn1: TBitBtn
    Left = 744
    Top = 536
    Width = 113
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&'#1042#1067#1061#1054#1044
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Kind = bkClose
  end
  object Memo1: TMemo
    Left = 8
    Top = 0
    Width = 625
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 8
    Top = 368
    Width = 625
    Height = 201
    Anchors = [akLeft, akRight, akBottom]
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Memo2')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 640
    Top = 0
    Width = 217
    Height = 524
    Anchors = [akTop, akRight, akBottom]
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 20
    ParentFont = False
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 88
    object mnFile: TMenuItem
      Caption = 'File'
      object mnOpen: TMenuItem
        Caption = 'Open...'
        OnClick = mnOpenClick
      end
      object mnSave: TMenuItem
        Caption = 'Save...'
        OnClick = mnSaveClick
      end
      object Razdel: TMenuItem
        Caption = '-'
      end
      object mnOut: TMenuItem
        Caption = 'Exit'
      end
    end
    object mnHelp: TMenuItem
      Caption = 'Help'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 208
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    Left = 304
    Top = 88
  end
end
