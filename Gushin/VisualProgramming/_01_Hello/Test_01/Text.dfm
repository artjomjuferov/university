object frText: TfrText
  Left = 150
  Top = 99
  BorderStyle = bsSingle
  Caption = #1047#1072#1076#1072#1085#1080#1077
  ClientHeight = 418
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 393
    Height = 401
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Monotype Corsiva'
    Font.Style = [fsBold, fsItalic]
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 416
    Top = 376
    Width = 129
    Height = 33
    TabOrder = 1
    Kind = bkClose
  end
end
