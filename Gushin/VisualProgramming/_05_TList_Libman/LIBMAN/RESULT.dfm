object frResult: TfrResult
  Left = 192
  Top = 107
  BorderStyle = bsSingle
  Caption = 'Result'
  ClientHeight = 497
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnPaint = FormPaint
  OnResize = FormResize
  DesignSize = (
    536
    497)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 462
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'IZILINES'
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 529
        Height = 285
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TABLE'
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 285
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
    object TabSheet3: TTabSheet
      Caption = 'CONVERGENCE'
      ImageIndex = 2
      DesignSize = (
        529
        434)
      object Chart1: TChart
        Left = 0
        Top = 12
        Width = 529
        Height = 421
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        Legend.Visible = False
        View3D = False
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        Anchors = [akLeft, akTop, akRight]
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
  end
  object BitBtn1: TBitBtn
    Left = 448
    Top = 469
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkClose
  end
end
