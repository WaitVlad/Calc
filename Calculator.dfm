object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculator 1.0.1'
  ClientHeight = 336
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  ShowHint = True
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 3
    Height = 15
  end
  object Button1: TButton
    Left = 8
    Top = 39
    Width = 89
    Height = 66
    Caption = '1'
    TabOrder = 0
    OnClick = InsertNum
  end
  object Button2: TButton
    Left = 103
    Top = 39
    Width = 89
    Height = 66
    Caption = '2'
    TabOrder = 1
    OnClick = InsertNum
  end
  object ButtonPlus: TButton
    Left = 293
    Top = 39
    Width = 116
    Height = 66
    Caption = 'Plus'
    TabOrder = 2
    OnClick = ButtonPlusClick
  end
  object ButtonCancel: TButton
    Left = 413
    Top = 183
    Width = 66
    Height = 138
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object ButtonResult: TButton
    Left = 151
    Top = 255
    Width = 136
    Height = 66
    Caption = '='
    TabOrder = 4
    OnClick = ButtonResultClick
  end
  object Button3: TButton
    Left = 198
    Top = 39
    Width = 89
    Height = 66
    Caption = '3'
    TabOrder = 5
    OnClick = InsertNum
  end
  object Button4: TButton
    Left = 8
    Top = 111
    Width = 89
    Height = 66
    Caption = '4'
    TabOrder = 6
    OnClick = InsertNum
  end
  object Button5: TButton
    Left = 103
    Top = 111
    Width = 89
    Height = 66
    Caption = '5'
    TabOrder = 7
    OnClick = InsertNum
  end
  object Button6: TButton
    Left = 198
    Top = 111
    Width = 89
    Height = 66
    Caption = '6'
    TabOrder = 8
    OnClick = InsertNum
  end
  object Button7: TButton
    Left = 8
    Top = 183
    Width = 89
    Height = 66
    Caption = '7'
    TabOrder = 9
    OnClick = InsertNum
  end
  object Button8: TButton
    Left = 103
    Top = 183
    Width = 89
    Height = 66
    Caption = '8'
    TabOrder = 10
    OnClick = InsertNum
  end
  object Button9: TButton
    Left = 198
    Top = 183
    Width = 89
    Height = 66
    Caption = '9'
    TabOrder = 11
    OnClick = InsertNum
  end
  object Button0: TButton
    Left = 8
    Top = 255
    Width = 137
    Height = 66
    Caption = '0'
    TabOrder = 12
    OnClick = InsertNum
  end
  object ButtonMinus: TButton
    Left = 293
    Top = 111
    Width = 116
    Height = 66
    Caption = 'Minus'
    TabOrder = 13
    OnClick = ButtonMinusClick
  end
  object ButtonMult: TButton
    Left = 293
    Top = 183
    Width = 116
    Height = 66
    Caption = 'Multiplication'
    TabOrder = 14
    OnClick = ButtonMultClick
  end
  object ButtonDiv: TButton
    Left = 293
    Top = 255
    Width = 116
    Height = 66
    Caption = 'Division'
    TabOrder = 15
    OnClick = ButtonDivisClick
  end
  object MainMenu1: TMainMenu
    Left = 416
    Top = 136
    object N1: TMenuItem
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      object N4: TMenuItem
        Caption = #1057#1083#1086#1078#1077#1085#1080#1077
        OnClick = ButtonPlusClick
      end
      object N5: TMenuItem
        Caption = #1042#1099#1095#1080#1090#1072#1085#1080#1077
        OnClick = ButtonMinusClick
      end
      object N6: TMenuItem
        Caption = #1059#1084#1085#1086#1078#1077#1085#1080#1077
        OnClick = ButtonMultClick
      end
      object N7: TMenuItem
        Caption = #1044#1077#1083#1077#1085#1080#1077
        OnClick = ButtonDivisClick
      end
      object N8: TMenuItem
        Caption = #1057#1090#1077#1088#1077#1090#1100
        OnClick = ButtonCancelClick
      end
      object N9: TMenuItem
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        OnClick = ButtonResultClick
      end
    end
    object N2: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      object N10: TMenuItem
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
        OnClick = N10Click
      end
    end
    object N3: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N3Click
    end
  end
end
