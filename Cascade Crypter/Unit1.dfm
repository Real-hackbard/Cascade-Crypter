object Form1: TForm1
  Left = 296
  Top = 124
  Caption = 'Cascade Crypter'
  ClientHeight = 538
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 57
    Width = 559
    Height = 359
    TabStop = False
    Align = alClient
    BorderStyle = bsNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = Memo1Change
    ExplicitWidth = 555
    ExplicitHeight = 358
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 519
    Width = 559
    Height = 19
    Panels = <
      item
        Text = 'Line :'
        Width = 40
      end
      item
        Text = '0'
        Width = 100
      end
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Text = '...'
        Width = 50
      end>
    ExplicitTop = 518
    ExplicitWidth = 555
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 559
    Height = 103
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 415
    ExplicitWidth = 555
    DesignSize = (
      559
      103)
    object Label2: TLabel
      Left = 43
      Top = 73
      Width = 34
      Height = 13
      Caption = 'Buffer :'
    end
    object Label1: TLabel
      Left = 30
      Top = 46
      Width = 47
      Height = 13
      Caption = 'Multiplier :'
    end
    object Label4: TLabel
      Left = 17
      Top = 19
      Width = 60
      Height = 13
      Caption = 'Crypt Mode :'
    end
    object Button7: TButton
      Left = 472
      Top = 17
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Encrypt'
      TabOrder = 0
      TabStop = False
      OnClick = Button7Click
      ExplicitLeft = 468
    end
    object Button6: TButton
      Left = 472
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Decrypt'
      TabOrder = 1
      TabStop = False
      OnClick = Button6Click
      ExplicitLeft = 468
    end
    object SpinEdit1: TSpinEdit
      Left = 83
      Top = 70
      Width = 71
      Height = 22
      TabStop = False
      MaxValue = 8192
      MinValue = 0
      TabOrder = 2
      Value = 64
    end
    object ComboBox1: TComboBox
      Left = 83
      Top = 43
      Width = 71
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      TabStop = False
      Text = '2'
      Items.Strings = (
        '2'
        '4'
        '8'
        '16'
        '32')
    end
    object Button1: TButton
      Left = 391
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Text'
      TabOrder = 4
      TabStop = False
      OnClick = Button1Click
    end
    object ComboBox2: TComboBox
      Left = 83
      Top = 16
      Width = 71
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 5
      Text = 'Normal'
      OnChange = ComboBox2Change
      Items.Strings = (
        'Low'
        'Normal'
        'Hard')
    end
    object Button2: TButton
      Left = 310
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 6
      TabStop = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 391
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 7
      TabStop = False
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 310
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Abort'
      TabOrder = 8
      TabStop = False
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 555
    object Label3: TLabel
      Left = 8
      Top = 13
      Width = 218
      Height = 39
      Caption = 'Cascade Crypter'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Textdocument (*.TXT)|*.txt|All Files (*.*)|*.*'
    Left = 472
    Top = 112
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Textdocument (*.TXT)|*.txt'
    Left = 472
    Top = 176
  end
end
