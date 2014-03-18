object Form1: TForm1
  Left = 211
  Top = 213
  Width = 928
  Height = 480
  Caption = 'Form1'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 912
    Height = 421
    Align = alClient
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      23
      133
      64)
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Caption = #1042#1110#1076#1082#1088#1080#1090#1080
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1074' Excel'
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1047#1072#1082#1088#1080#1090#1080
        OnClick = N6Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N13: TMenuItem
        Caption = #1044#1088#1091#1082
        OnClick = N13Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #1042#1080#1093#1110#1076
        OnClick = N7Click
      end
    end
    object N2: TMenuItem
      Caption = #1057#1090#1091#1076#1077#1085#1090#1080
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1088#1077#1076#1084#1077#1090#1080
      OnClick = N3Click
    end
    object N15: TMenuItem
      Caption = #1054#1073#1095#1080#1089#1083#1080#1090#1080
      OnClick = N15Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.xlsx'
    Filter = 
      'Microsoft Excel 2007-2013(.xlsx)|*.xlsx|Microsoft Excel 2003(.xl' +
      's)|*.xls'
    Left = 24
  end
  object OpenDialog1: TOpenDialog
    Filter = #1060#1072#1081#1083#1080' Microsoft Excel(*.xls; *.xlsx)|*.xls; *.xlsx'
    Left = 48
  end
end
