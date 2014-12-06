object AboutBox1: TAboutBox1
  Left = 248
  Top = 174
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
    object lblComments: TLabel
      Left = 8
      Top = 8
      Width = 265
      Height = 60
      Caption = #1047#1072#1076#1072#1085#1080#1077' '#1076#1083#1103' '#1084#1086#1077#1081' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
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
