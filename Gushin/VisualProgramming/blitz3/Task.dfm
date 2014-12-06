object AboutBox: TAboutBox
  Left = 519
  Top = 223
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 213
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 281
    Height = 161
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object ProductName: TLabel
      Left = 16
      Top = 16
      Width = 248
      Height = 20
      Caption = #1052#1086#1077' '#1079#1072#1076#1072#1085#1080#1077': '#1074#1099#1074#1077#1089#1090#1080' '#1075#1088#1072#1092#1080#1082' '#1089' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      IsControl = True
    end
  end
  object OKButton: TButton
    Left = 111
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
