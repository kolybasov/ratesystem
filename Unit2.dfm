object Form2: TForm2
  Left = 424
  Top = 289
  BorderStyle = bsToolWindow
  Caption = #1054#1089#1085#1086#1074#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
  ClientHeight = 234
  ClientWidth = 138
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 152
    Width = 78
    Height = 13
    Caption = #1053#1072#1074#1095#1072#1083#1100#1085#1080#1081' '#1088#1110#1082
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 70
    Height = 13
    Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1080
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 44
    Height = 13
    Caption = #1057#1077#1084#1077#1089#1090#1088
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 240
    Width = 121
    Height = 24
    Caption = #1042#1110#1076#1082#1088#1080#1090#1080
    OnClick = SpeedButton1Click
  end
  object Year: TEdit
    Left = 8
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '20'
    OnKeyPress = YearKeyPress
  end
  object Speciality: TComboBox
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = #1055#1088#1086#1075#1088#1072#1084#1110#1089#1090#1080
    Items.Strings = (
      #1055#1088#1086#1075#1088#1072#1084#1110#1089#1090#1080
      #1041#1091#1093#1075#1072#1083#1090#1077#1088#1080
      #1052#1072#1081#1089#1090#1088#1080)
  end
  object Group: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = GroupKeyPress
  end
  object Term: TComboBox
    Left = 8
    Top = 120
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = '1'
    Items.Strings = (
      '1'
      '2')
  end
  object Button1: TButton
    Left = 8
    Top = 200
    Width = 121
    Height = 25
    Caption = #1057#1090#1074#1086#1088#1080#1090#1080
    TabOrder = 4
    OnClick = Button1Click
  end
end
