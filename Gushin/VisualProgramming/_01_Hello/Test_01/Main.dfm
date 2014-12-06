object Form1: TForm1
  Left = 105
  Top = 162
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' 01'
  ClientHeight = 426
  ClientWidth = 688
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
    688
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 117
    Height = 37
    Caption = 'Hello!!!'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 600
    Top = 396
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 0
    Kind = bkClose
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 257
    Height = 89
    Caption = '2 x 2'
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 18
      Height = 13
      Caption = 'a = '
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 18
      Height = 13
      Caption = 'b = '
    end
    object Label4: TLabel
      Left = 176
      Top = 32
      Width = 18
      Height = 13
      Caption = #1089' = '
    end
    object Edit1: TEdit
      Left = 32
      Top = 24
      Width = 33
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 32
      Top = 48
      Width = 33
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 88
      Top = 32
      Width = 57
      Height = 25
      Caption = #1057#1095#1105#1090
      Default = True
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 585
    Height = 285
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1043#1088#1072#1092#1080#1082' 1D '#1084#1072#1089#1089#1080#1074#1072
    TabOrder = 2
    DesignSize = (
      585
      285)
    object Label5: TLabel
      Left = 8
      Top = 24
      Width = 20
      Height = 13
      Caption = 'N = '
    end
    object Label6: TLabel
      Left = 8
      Top = 48
      Width = 19
      Height = 13
      Caption = 'K = '
    end
    object ListBox1: TListBox
      Left = 8
      Top = 72
      Width = 113
      Height = 205
      Anchors = [akLeft, akTop, akBottom]
      ItemHeight = 13
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 32
      Top = 24
      Width = 33
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Button2: TButton
      Left = 72
      Top = 24
      Width = 49
      Height = 17
      Caption = 'FillMas'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit4: TEdit
      Left = 32
      Top = 48
      Width = 33
      Height = 21
      TabOrder = 3
      Text = 'Edit1'
    end
    object Chart1: TChart
      Left = 128
      Top = 24
      Width = 449
      Height = 253
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      Legend.Visible = False
      View3D = False
      Color = clWhite
      TabOrder = 4
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
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 48
    object mnFile: TMenuItem
      Caption = 'File'
      object mnOpen: TMenuItem
        Bitmap.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C000000000000000000000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C0000000000420042004200420042004200420042004200001F7C
          1F7C1F7C1F7C0000E07F00000042004200420042004200420042004200420000
          1F7C1F7C1F7C0000FF7FE07F0000004200420042004200420042004200420042
          00001F7C1F7C0000E07FFF7FE07F000000420042004200420042004200420042
          004200001F7C0000FF7FE07FFF7FE07F00000000000000000000000000000000
          0000000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00001F7C1F7C
          1F7C1F7C1F7C0000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F00001F7C1F7C
          1F7C1F7C1F7C0000E07FFF7FE07F00000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C0000
          1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        Caption = 'Open'
      end
      object mnRazdel: TMenuItem
        Caption = '-'
      end
      object mnOut: TMenuItem
        Bitmap.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00377777777788
          F8F8780000004444400777FFF4444400000033334D5008FFF433330000003333
          45D50FFFF4333300000033334D5D0FFFF43333000000333345D50FEFE4333300
          000033334D5D0FFFF43333000000333345D50FEFE4333300000033334D5D0FFF
          F43333000000333345D50FEFE4333300000033334D5D0EFEF433330000003333
          45D50FEFE4333300000033334D5D0EFEF4333300000033334444444444333300
          00003333333333333333330000003333330000003333330000003333330AAAA0
          333333000000333333000000333333000000}
        Caption = 'Exit'
        OnClick = mnOutClick
      end
    end
    object mnHelp: TMenuItem
      Caption = 'Help'
      object mnAvtor: TMenuItem
        Bitmap.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF1FFFFF
          FFFFFFFFFFFFFF1FFFFFFFFFFFF11FFFFF999FFFFFFF111FFFFFFFFFFFFF1FF9
          99FFF999FFF11FFFFFFFFFFFFFFF1F9FFFFFFFFF9F11FFFFFFFFFFFFFFFFF9FF
          FFFFFFFFF9FFFFFFFFFFFFFFFFFF9FFFFFFFFFFFFF9FFFFFFFFFFFFFFFFF9FFF
          FFFFFFFFFF9FFFFFFFFFFFFFFFF9FFF00000000FFFF9FFFFFFFFFFFFFFF9F000
          FFFFFF00FFF9FFFFFFFFFFFFFF9F00FFFFFFFFF00FFF9FFFFFFFFFFFFF9F0FFF
          FFFFFFFF00FF9FFFFFFFFFFFF09FFFFFFFFFFFFFF00F9FFFFFFFFFF0009FFF00
          00000FFFFFFF900FFFFFFFF0F9FFFF0FFFFFFFFFFFFFF900FFFFFFF0F9FFFF00
          FFFFFFFFFFFFF9F0FFFFFFF0F9FFFFF000FFFFFFFFFFF9F0FFFFFFF0F9FFFFFF
          F00FFFFFFFFFF9F0FFFFFFF0F9FFFFFFFF0FFFFFFFFFF9F0FFFFFFF0F9FFFFFF
          FF0FFFFFFFFFF9F0FFFFFFF0F9FFFFCCFF0FFFFCCFFFF9F0FFFFFFF0F09FFFCC
          FF0FFFFCCFFF90F0FFFFFFF0009F0FFFFFFFF0FFFF0F9000FFFFFFFFFF9F00FF
          F0FFF00FF0FF9FBBFFFFFFFBBF9FF00000FFFF0000FF9BBBFFFFFFFBBFF9FFFF
          FFFFFFFFFFF9FBBBBFFFFFFBBBB9FFFFFFFFFFFFFFF9FBBFBFFFFFFBFFFF9FFF
          FFFFFFFFFF9FFBBBBFFFFFFBBBBB9FFFFFFFFFFFFF9BBBBBFFFFFFFBBBBFF9FF
          FFFFFFFFF9FFBBBFFFFFFFFFFBBBBB9FFFFFFFFF9BBFFBFFFFFFFFFFFFBBFFB9
          99FFF999BBBBBBFFFFFFFFFFFFBBBBBFFF999FFFBBFFFFFFFFFF}
        Caption = 'Avtor'
        OnClick = mnAvtorClick
      end
      object mnText: TMenuItem
        Bitmap.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFF0000FFFFCCCCFFFFFFFCCFFF0000CCFCCCCCFFFFFFCCCFFF0000CCCC
          CCCCCFFCCCCCCCFF0000CCCCCFFCCCCCCCCFCCFF0000FCCCFFFFCCCCCFFFFFFF
          0000FFCCFFFFCCCFFFFFFFFF0000FFFFFFFFFFCFFFFCCCCF0000FFFFFFFFFFFF
          FFCCCCCF0000FFFFCCCCCCCCFFCCCCFF0000FCCCCCCCCCCCCFCCFFFF0000FCCC
          CCFFFFFCCCCCFFFF0000FFFCFFFFFFFFFCCCFFFF0000FFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFF0000FFCCCCCFFCCCCCFFFFFF0000FCCCCCCCCCCC
          CCCCFFFF0000CCCCFFCCCCCFFFCCCFFF0000CCCFFFFFCCFFFFFFCFFF0000FFCF
          FFFFFFFFFFFFFFFF0000}
        Caption = 'Text'
        OnClick = mnTextClick
      end
    end
  end
end
