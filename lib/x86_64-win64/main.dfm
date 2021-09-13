object MainForm: TMainForm
  Left = 530
  Height = 330
  Top = 381
  Width = 507
  Caption = 'Simple Image Viewer'
  ClientHeight = 330
  ClientWidth = 507
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  LCLVersion = '2.0.12.0'
  object Panel3: TPanel
    Left = 0
    Height = 330
    Top = 0
    Width = 507
    Align = alClient
    ClientHeight = 330
    ClientWidth = 507
    Color = clBlack
    ParentColor = False
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Height = 328
      Top = 1
      Width = 505
      Align = alClient
      Stretch = True
    end
    object HelpMemo: TMemo
      Left = 48
      Height = 161
      Top = 40
      Width = 345
      Color = clBlack
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Lines.Strings = (
        'CTRL-O               Open Directory'
        'UP ARROW         Last Image    '
        'LEFT ARROW     Previous Image  '
        'RIGHT ARROW   Next Image  '
        'DOWN ARROW  First Image'
        'ESCAPE               Close Program'
      )
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TabStop = False
    end
  end
end
