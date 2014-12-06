inherited AboutBox2: TAboutBox2
  Left = 247
  Top = 282
  Caption = 'AboutBox2'
  ClientHeight = 296
  ClientWidth = 369
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 353
    Height = 249
    inherited ProductName: TLabel
      Width = 231
      Height = 24
      Font.Height = -20
      ParentFont = False
    end
    inherited Copyright: TLabel
      Top = 48
      Width = 284
      Height = 120
      Caption = 
        '10. '#1042#1099#1074#1077#1089#1090#1080' '#1074' '#1087#1086#1088#1103#1076#1082#1077', '#1086#1073#1088#1072#1090#1085#1086#1084' '#1082'   '#1072#1083#1092#1072#1074#1080#1090#1085#1086#1084#1091', '#1089#1083#1086#1074#1072' '#1090#1077#1082#1089#1090#1072', '#1085 +
        #1077' '#1089#1086#1076#1077#1088#1078#1072#1097#1080#1077'  '#1087#1086#1074#1090#1086#1088#1103#1102#1097#1080#1093#1089#1103' '#1073#1091#1082#1074', '#1074' '#1086#1089#1090#1072#1083#1100#1085#1099#1093'   '#1089#1083#1086#1074#1072#1093' '#1091#1076#1072#1083#1080#1090#1100' '#1075 +
        #1083#1072#1089#1085#1099#1077' '#1073#1091#1082#1074#1099'.'#13#10
      WordWrap = True
    end
  end
  inherited OKButton: TButton
    Left = 144
    Top = 264
    Width = 82
    Height = 29
  end
end
