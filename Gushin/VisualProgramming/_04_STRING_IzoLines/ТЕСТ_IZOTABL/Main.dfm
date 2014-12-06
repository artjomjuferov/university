object Form1: TForm1
  Left = 53
  Top = 147
  BorderStyle = bsSingle
  Caption = 'TEST  FIELDS'
  ClientHeight = 701
  ClientWidth = 1115
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClick = FormPaint
  OnCreate = FormCreate
  OnPaint = FormPaint
  DesignSize = (
    1115
    701)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 838
    Top = 0
    Width = 277
    Height = 701
    Align = alRight
    TabOrder = 0
    DesignSize = (
      277
      701)
    object BitBtn1: TBitBtn
      Left = 128
      Top = 654
      Width = 113
      Height = 42
      Anchors = [akLeft, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Kind = bkClose
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 953
    Height = 633
    Color = clNavy
    TabOrder = 1
    OnClick = FormPaint
    object PaintBox1: TPaintBox
      Left = 8
      Top = 8
      Width = 300
      Height = 300
      OnClick = FormPaint
    end
    object PaintBox2: TPaintBox
      Left = 8
      Top = 320
      Width = 300
      Height = 300
    end
    object PaintBox3: TPaintBox
      Left = 320
      Top = 8
      Width = 300
      Height = 300
    end
    object PaintBox4: TPaintBox
      Left = 320
      Top = 320
      Width = 300
      Height = 300
    end
    object PaintBox5: TPaintBox
      Left = 632
      Top = 8
      Width = 300
      Height = 300
    end
    object PaintBox6: TPaintBox
      Left = 632
      Top = 320
      Width = 300
      Height = 300
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 640
    Width = 945
    Height = 47
    Anchors = [akLeft, akTop, akBottom]
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 2
    OnClick = FormPaint
  end
end
