object Form7: TForm7
  Left = 197
  Top = 302
  BorderStyle = bsToolWindow
  Caption = #1055#1088#1077#1076#1084#1077#1090#1080
  ClientHeight = 225
  ClientWidth = 139
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = #1043#1088#1091#1087#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 70
    Height = 13
    Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 88
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 128
    Width = 121
    Height = 41
    Caption = #1057#1077#1084#1077#1089#1090#1088
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '1'
      '2')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 192
    Width = 121
    Height = 25
    Caption = #1057#1090#1074#1086#1088#1080#1090#1080' '#1089#1087#1080#1089#1086#1082
    TabOrder = 3
    OnClick = Button1Click
  end
end
