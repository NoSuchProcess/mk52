object Form1: TForm1
  Left = 244
  Top = 348
  Width = 708
  Height = 215
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1080#1082#1072' '#1052#1050' 52 ('#1088#1077#1078#1080#1084' '#1052#1050' 61 4bit)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 16
    Top = 24
    Width = 220
    Height = 41
  end
  object Label1: TLabel
    Left = 312
    Top = 8
    Width = 17
    Height = 13
    Caption = 'x<0'
  end
  object Label2: TLabel
    Left = 369
    Top = 8
    Width = 12
    Height = 13
    Caption = 'L0'
  end
  object Label3: TLabel
    Left = 416
    Top = 8
    Width = 27
    Height = 13
    Caption = 'sin [x]'
  end
  object Label4: TLabel
    Left = 472
    Top = 8
    Width = 33
    Height = 13
    Caption = 'cos {x}'
  end
  object Label5: TLabel
    Left = 528
    Top = 8
    Width = 31
    Height = 13
    Caption = 'tg max'
  end
  object Label6: TLabel
    Left = 584
    Top = 8
    Width = 17
    Height = 13
    Caption = 'sqrt'
  end
  object Label7: TLabel
    Left = 640
    Top = 8
    Width = 16
    Height = 13
    Caption = '1/x'
  end
  object Label8: TLabel
    Left = 312
    Top = 48
    Width = 17
    Height = 13
    Caption = 'x=0'
  end
  object Label9: TLabel
    Left = 369
    Top = 48
    Width = 12
    Height = 13
    Caption = 'L1'
  end
  object Label10: TLabel
    Left = 416
    Top = 48
    Width = 34
    Height = 13
    Caption = 'sin-1 |x|'
  end
  object Label11: TLabel
    Left = 464
    Top = 48
    Width = 44
    Height = 13
    Caption = 'cos-1 '#1047#1053
  end
  object Label12: TLabel
    Left = 528
    Top = 48
    Width = 35
    Height = 13
    Caption = 'tg-1  o/'
  end
  object Label13: TLabel
    Left = 584
    Top = 48
    Width = 25
    Height = 13
    Caption = 'pi  o/'
  end
  object Label14: TLabel
    Left = 640
    Top = 48
    Width = 17
    Height = 13
    Caption = 'x^2'
  end
  object Label15: TLabel
    Left = 312
    Top = 88
    Width = 23
    Height = 13
    Caption = 'x>=0'
  end
  object Label16: TLabel
    Left = 369
    Top = 88
    Width = 12
    Height = 13
    Caption = 'L2'
  end
  object Label17: TLabel
    Left = 424
    Top = 88
    Width = 17
    Height = 13
    Caption = 'e^x'
  end
  object Label18: TLabel
    Left = 480
    Top = 88
    Width = 8
    Height = 13
    Caption = 'lg'
  end
  object Label19: TLabel
    Left = 528
    Top = 88
    Width = 38
    Height = 13
    Caption = 'ln  o/ //'
  end
  object Label20: TLabel
    Left = 576
    Top = 88
    Width = 46
    Height = 13
    Caption = 'x^y  o/ //'
  end
  object Label21: TLabel
    Left = 640
    Top = 88
    Width = 30
    Height = 13
    Caption = 'Bx '#1057#1063
  end
  object Label22: TLabel
    Left = 312
    Top = 128
    Width = 23
    Height = 13
    Caption = 'x><0'
  end
  object Label23: TLabel
    Left = 369
    Top = 128
    Width = 12
    Height = 13
    Caption = 'L3'
  end
  object Label24: TLabel
    Left = 408
    Top = 128
    Width = 50
    Height = 13
    Caption = '10^x '#1053#1054#1055
  end
  object Label25: TLabel
    Left = 480
    Top = 128
    Width = 17
    Height = 13
    Caption = 'O ^'
  end
  object Label26: TLabel
    Left = 528
    Top = 128
    Width = 30
    Height = 13
    Caption = #1040#1042#1058' v'
  end
  object Label27: TLabel
    Left = 584
    Top = 128
    Width = 36
    Height = 13
    Caption = #1055#1056#1043' (+)'
  end
  object Label28: TLabel
    Left = 640
    Top = 128
    Width = 39
    Height = 13
    Caption = 'CF '#1048#1053#1042
  end
  object Label29: TLabel
    Left = 488
    Top = 168
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object Label30: TLabel
    Left = 545
    Top = 168
    Width = 6
    Height = 13
    Caption = 'b'
  end
  object Label31: TLabel
    Left = 600
    Top = 168
    Width = 6
    Height = 13
    Caption = 'c'
  end
  object Label32: TLabel
    Left = 656
    Top = 168
    Width = 6
    Height = 13
    Caption = 'd'
  end
  object Label33: TLabel
    Left = 686
    Top = 112
    Width = 6
    Height = 13
    Caption = 'e'
  end
  object Button1: TButton
    Left = 408
    Top = 144
    Width = 49
    Height = 25
    Caption = '0'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 368
    Top = 296
    Width = 201
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 368
    Top = 392
    Width = 201
    Height = 137
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 408
    Top = 104
    Width = 49
    Height = 25
    Caption = '1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 464
    Top = 104
    Width = 49
    Height = 25
    Caption = '2'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 520
    Top = 104
    Width = 49
    Height = 25
    Caption = '3'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button5: TButton
    Left = 408
    Top = 64
    Width = 49
    Height = 25
    Caption = '4'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button6: TButton
    Left = 464
    Top = 64
    Width = 49
    Height = 25
    Caption = '5'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button7: TButton
    Left = 520
    Top = 64
    Width = 49
    Height = 25
    Caption = '6'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button8: TButton
    Left = 408
    Top = 24
    Width = 49
    Height = 25
    Caption = '7'
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button9: TButton
    Left = 464
    Top = 24
    Width = 49
    Height = 25
    Caption = '8'
    TabOrder = 10
    OnClick = Button1Click
  end
  object Button10: TButton
    Left = 520
    Top = 24
    Width = 49
    Height = 25
    Caption = '9'
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button11: TButton
    Left = 576
    Top = 64
    Width = 49
    Height = 25
    Caption = '+'
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button12: TButton
    Left = 576
    Top = 24
    Width = 49
    Height = 25
    Caption = '-'
    TabOrder = 13
    OnClick = Button1Click
  end
  object Button13: TButton
    Left = 632
    Top = 64
    Width = 49
    Height = 25
    Caption = '*'
    TabOrder = 14
    OnClick = Button1Click
  end
  object Button14: TButton
    Left = 632
    Top = 24
    Width = 49
    Height = 25
    Caption = '/'
    TabOrder = 15
    OnClick = Button1Click
  end
  object Button15: TButton
    Left = 576
    Top = 104
    Width = 49
    Height = 25
    Caption = '<->'
    TabOrder = 16
    OnClick = Button1Click
  end
  object Button16: TButton
    Left = 464
    Top = 144
    Width = 49
    Height = 25
    Caption = '.'
    TabOrder = 17
    OnClick = Button1Click
  end
  object Button17: TButton
    Left = 520
    Top = 144
    Width = 49
    Height = 25
    Caption = '/-/'
    TabOrder = 18
    OnClick = Button1Click
  end
  object Button18: TButton
    Left = 576
    Top = 144
    Width = 49
    Height = 25
    Caption = #1042#1055
    TabOrder = 19
    OnClick = Button1Click
  end
  object Button19: TButton
    Left = 632
    Top = 144
    Width = 49
    Height = 25
    Caption = #1057#1093
    TabOrder = 20
    OnClick = Button1Click
  end
  object Button20: TButton
    Left = 632
    Top = 104
    Width = 49
    Height = 25
    Caption = #1042'x'
    TabOrder = 21
    OnClick = Button1Click
  end
  object Button21: TButton
    Left = 296
    Top = 144
    Width = 49
    Height = 25
    Caption = #1057'/'#1055
    TabOrder = 22
    OnClick = Button1Click
  end
  object Button22: TButton
    Left = 352
    Top = 104
    Width = 49
    Height = 25
    Caption = #1041#1055
    TabOrder = 23
    OnClick = Button1Click
  end
  object Button23: TButton
    Left = 296
    Top = 104
    Width = 49
    Height = 25
    Caption = #1042'/0'
    TabOrder = 24
    OnClick = Button1Click
  end
  object Button24: TButton
    Left = 352
    Top = 144
    Width = 49
    Height = 25
    Caption = #1055#1055
    TabOrder = 25
    OnClick = Button1Click
  end
  object Button25: TButton
    Left = 352
    Top = 64
    Width = 49
    Height = 25
    Caption = #1061#1055
    TabOrder = 26
    OnClick = Button1Click
  end
  object Button26: TButton
    Left = 296
    Top = 24
    Width = 49
    Height = 25
    Caption = #1064#1043'->'
    TabOrder = 27
    OnClick = Button1Click
  end
  object Button27: TButton
    Left = 352
    Top = 24
    Width = 49
    Height = 25
    Caption = #1055#1061
    TabOrder = 28
    OnClick = Button1Click
  end
  object Button28: TButton
    Left = 296
    Top = 64
    Width = 49
    Height = 25
    Caption = '<-'#1064#1043
    TabOrder = 29
    OnClick = Button1Click
  end
  object Button29: TButton
    Left = 240
    Top = 64
    Width = 49
    Height = 25
    Caption = #1050
    TabOrder = 30
    OnClick = Button1Click
  end
  object Button30: TButton
    Left = 240
    Top = 24
    Width = 49
    Height = 25
    Caption = 'F'
    TabOrder = 31
    OnClick = Button1Click
  end
  object Button31: TButton
    Left = 16
    Top = 264
    Width = 49
    Height = 25
    Caption = 'Step'
    TabOrder = 32
    OnClick = Button31Click
  end
  object Button32: TButton
    Left = 152
    Top = 264
    Width = 49
    Height = 25
    Caption = 'KeyUp'
    TabOrder = 33
    OnClick = Button32Click
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 296
    Width = 337
    Height = 233
    ColCount = 15
    DefaultColWidth = 20
    DefaultRowHeight = 20
    RowCount = 10
    TabOrder = 34
  end
  object Button33: TButton
    Left = 80
    Top = 264
    Width = 49
    Height = 25
    Caption = 'Step42'
    TabOrder = 35
    OnClick = Button33Click
  end
  object Button34: TButton
    Left = 224
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Button34'
    TabOrder = 36
    OnClick = Button34Click
  end
  object Button35: TButton
    Left = 320
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 37
    OnClick = Button35Click
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 128
    Width = 121
    Height = 41
    TabOrder = 38
    object RadioButton1: TRadioButton
      Left = 8
      Top = 16
      Width = 25
      Height = 17
      Caption = #1056
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 40
      Top = 16
      Width = 41
      Height = 17
      Caption = #1043#1056#1044
      TabOrder = 1
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 88
      Top = 16
      Width = 25
      Height = 17
      Caption = #1043
      TabOrder = 2
      OnClick = RadioButton3Click
    end
  end
  object Button36: TButton
    Left = 240
    Top = 144
    Width = 49
    Height = 25
    Caption = 'Save'
    TabOrder = 39
    OnClick = Button36Click
  end
  object Button37: TButton
    Left = 240
    Top = 104
    Width = 49
    Height = 25
    Caption = 'Load'
    TabOrder = 40
    OnClick = Button37Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 200
    Top = 72
  end
  object OpenDialog1: TOpenDialog
    Left = 160
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    Left = 128
    Top = 72
  end
end
