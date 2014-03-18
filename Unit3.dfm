object Form3: TForm3
  Left = 330
  Top = 160
  BorderStyle = bsToolWindow
  Caption = 'Form3'
  ClientHeight = 465
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 184
    Top = 432
    Width = 40
    Height = 24
    Caption = #1079'/'#1083
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 232
    Top = 432
    Width = 40
    Height = 24
    Caption = #1085'/'#1072
    OnClick = SpeedButton2Click
  end
  object editMarks: TStringGrid
    Left = 0
    Top = 0
    Width = 278
    Height = 417
    Align = alTop
    ColCount = 2
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
    TabOrder = 0
    OnKeyPress = editMarksKeyPress
    OnKeyUp = editMarksKeyUp
    OnSelectCell = editMarksSelectCell
  end
  object Button1: TButton
    Left = 40
    Top = 432
    Width = 97
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 1
    OnClick = Button1Click
  end
end
