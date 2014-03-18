object Form6: TForm6
  Left = 193
  Top = 113
  BorderStyle = bsToolWindow
  Caption = #1055#1088#1077#1076#1084#1077#1090#1080
  ClientHeight = 513
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object subjects: TStringGrid
    Left = 0
    Top = 0
    Width = 256
    Height = 513
    Align = alClient
    ColCount = 2
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
    TabOrder = 0
    OnSelectCell = subjectsSelectCell
  end
  object MainMenu1: TMainMenu
    Left = 64
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Caption = #1053#1086#1074#1080#1081' '#1089#1087#1080#1086#1082
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1110#1076#1082#1088#1080#1090#1080' '#1089#1087#1080#1089#1086#1082
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1089#1087#1080#1089#1086#1082
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082'...'
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #1042#1080#1093#1110#1076
        OnClick = N9Click
      end
    end
    object N2: TMenuItem
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
      object N10: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1080#1090#1080' '#1088#1103#1076#1086#1082
        object N13: TMenuItem
          Caption = #1055#1077#1088#1077#1076' '#1074#1080#1076#1110#1083#1077#1085#1080#1084
          OnClick = N13Click
        end
        object N14: TMenuItem
          Caption = #1055#1110#1089#1083#1103' '#1074#1080#1076#1110#1083#1077#1085#1086#1075#1086
          OnClick = N14Click
        end
      end
      object N11: TMenuItem
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1088#1103#1076#1086#1082
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1074#1089#1077
        OnClick = N12Click
      end
    end
    object N3: TMenuItem
      Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1072#1090#1080
      OnClick = N3Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1110' '#1092#1072#1081#1083#1080'(.txt)|*.txt'
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1110' '#1092#1072#1081#1083#1080'(.txt)|*.txt'
    Left = 32
  end
end
