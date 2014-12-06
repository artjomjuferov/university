object Form1: TForm1
  Left = 357
  Top = 152
  BorderStyle = bsSingle
  Caption = 'TEMPERATURE'
  ClientHeight = 515
  ClientWidth = 773
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
    773
    515)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 515
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 679
      Height = 513
      ActivePage = TabSheet1
      Align = alClient
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Region'
        object Shape1: TShape
          Left = 24
          Top = 8
          Width = 480
          Height = 480
        end
        object Shape2: TShape
          Left = 24
          Top = 8
          Width = 120
          Height = 120
          Brush.Color = clBlue
        end
        object Shape3: TShape
          Left = 384
          Top = 8
          Width = 120
          Height = 120
          Brush.Color = clBlue
        end
        object Shape4: TShape
          Left = 25
          Top = 368
          Width = 120
          Height = 120
          Brush.Color = clBlue
        end
        object Shape5: TShape
          Left = 384
          Top = 368
          Width = 121
          Height = 120
          Brush.Color = clBlue
        end
        object Shape6: TShape
          Left = 210
          Top = 200
          Width = 120
          Height = 120
          Brush.Color = clBlue
        end
        object Label1: TLabel
          Left = 528
          Top = 152
          Width = 97
          Height = 13
          Caption = #1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1087#1086#1083#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 528
          Top = 216
          Width = 101
          Height = 13
          Caption = #1058#1086#1095#1085#1086#1089#1090#1100' Epsilon'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Edit1: TEdit
          Tag = 1
          Left = 144
          Top = 8
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 0
          Text = 'Edit1'
        end
        object Edit2: TEdit
          Tag = 2
          Left = 336
          Top = 8
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 1
          Text = 'Edit1'
        end
        object Edit3: TEdit
          Tag = 3
          Left = 8
          Top = 128
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 2
          Text = 'Edit1'
        end
        object Edit4: TEdit
          Tag = 4
          Left = 144
          Top = 112
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 3
          Text = 'Edit1'
        end
        object Edit5: TEdit
          Tag = 5
          Left = 336
          Top = 112
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 4
          Text = 'Edit1'
        end
        object Edit6: TEdit
          Tag = 6
          Left = 480
          Top = 128
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 5
          Text = 'Edit1'
        end
        object Edit7: TEdit
          Tag = 7
          Left = 160
          Top = 192
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 6
          Text = 'Edit1'
        end
        object Edit8: TEdit
          Tag = 8
          Left = 336
          Top = 192
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 7
          Text = 'Edit1'
        end
        object Edit9: TEdit
          Tag = 9
          Left = 160
          Top = 320
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 8
          Text = 'Edit1'
        end
        object Edit10: TEdit
          Tag = 10
          Left = 336
          Top = 320
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 9
          Text = 'Edit1'
        end
        object Edit11: TEdit
          Tag = 11
          Left = 8
          Top = 344
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 10
          Text = 'Edit1'
        end
        object Edit12: TEdit
          Tag = 12
          Left = 144
          Top = 368
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 11
          Text = 'Edit1'
        end
        object Edit13: TEdit
          Tag = 13
          Left = 336
          Top = 368
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 12
          Text = 'Edit1'
        end
        object Edit14: TEdit
          Tag = 14
          Left = 480
          Top = 344
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 13
          Text = 'Edit1'
        end
        object Edit15: TEdit
          Tag = 15
          Left = 144
          Top = 464
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 14
          Text = 'Edit1'
        end
        object Edit16: TEdit
          Tag = 16
          Left = 336
          Top = 464
          Width = 49
          Height = 21
          Color = clYellow
          TabOrder = 15
          Text = 'Edit1'
        end
        object BitBtn2: TBitBtn
          Left = 568
          Top = 40
          Width = 65
          Height = 25
          TabOrder = 16
          OnClick = BitBtn2Click
          Kind = bkOK
        end
        object BitBtn3: TBitBtn
          Left = 568
          Top = 88
          Width = 65
          Height = 25
          TabOrder = 17
          OnClick = BitBtn3Click
          Kind = bkCancel
        end
        object EdInput: TEdit
          Tag = 16
          Left = 552
          Top = 168
          Width = 49
          Height = 21
          Color = clLime
          TabOrder = 18
          Text = '1'
        end
        object EdEps: TEdit
          Tag = 16
          Left = 552
          Top = 232
          Width = 49
          Height = 21
          Color = clAqua
          TabOrder = 19
          Text = '0.001'
        end
        object GroupBox1: TGroupBox
          Left = 544
          Top = 272
          Width = 121
          Height = 89
          Caption = '       '#1058#1045#1057#1058' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 20
          object Button1: TButton
            Left = 8
            Top = 24
            Width = 105
            Height = 17
            Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1099#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 8
            Top = 40
            Width = 105
            Height = 17
            Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1099#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 8
            Top = 56
            Width = 105
            Height = 17
            Caption = #1062#1077#1085#1090#1088#1072#1083#1100#1085#1099#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = Button3Click
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Array'
        ImageIndex = 1
        object StringGrid1: TStringGrid
          Left = 0
          Top = 0
          Width = 671
          Height = 485
          Align = alClient
          ColCount = 42
          DefaultColWidth = 20
          DefaultRowHeight = 13
          DefaultDrawing = False
          RowCount = 42
          TabOrder = 0
          OnDrawCell = StringGrid1DrawCell
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 688
    Top = 0
    Width = 85
    Height = 515
    Align = alRight
    TabOrder = 1
    DesignSize = (
      85
      515)
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 16
      Width = 73
      Height = 33
      Caption = #1057#1063#1045#1058
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 12
      Top = 480
      Width = 65
      Height = 23
      Anchors = [akRight, akBottom]
      TabOrder = 0
      Kind = bkClose
    end
    object ListBox1: TListBox
      Left = 8
      Top = 56
      Width = 73
      Height = 422
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      IntegralHeight = True
      ItemHeight = 11
      ParentFont = False
      TabOrder = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 552
    Top = 440
    object mn_Rezult: TMenuItem
      Caption = 'REZULT'
      OnClick = mn_RezultClick
    end
    object mn_Help: TMenuItem
      Caption = 'HELP'
      OnClick = mn_HelpClick
    end
  end
end
