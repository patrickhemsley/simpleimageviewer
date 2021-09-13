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
  KeyPreview = True
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
    object Label1: TLabel
      Left = 50
      Height = 13
      Top = 40
      Width = 42
      Caption = 'SHIFT-O'
      ParentColor = False
    end
    object Label2: TLabel
      Left = 200
      Height = 13
      Top = 40
      Width = 71
      Caption = 'Open Directory'
      ParentColor = False
    end
    object Label3: TLabel
      Left = 50
      Height = 13
      Top = 100
      Width = 80
      Caption = 'DOWN ARROW'
      ParentColor = False
    end
    object Label4: TLabel
      Left = 200
      Height = 13
      Top = 100
      Width = 51
      Caption = 'First Image'
      ParentColor = False
    end
    object Label5: TLabel
      Left = 50
      Height = 13
      Top = 60
      Width = 60
      Caption = 'UP ARROW'
      ParentColor = False
    end
    object Label6: TLabel
      Left = 200
      Height = 13
      Top = 60
      Width = 52
      Caption = 'Last Image'
      ParentColor = False
    end
    object Label7: TLabel
      Left = 50
      Height = 13
      Top = 80
      Width = 71
      Caption = 'LEFT ARROW'
      ParentColor = False
    end
    object Label8: TLabel
      Left = 200
      Height = 13
      Top = 80
      Width = 73
      Caption = 'Previous Image'
      ParentColor = False
    end
    object Label9: TLabel
      Left = 50
      Height = 13
      Top = 120
      Width = 42
      Caption = 'ESCAPE'
      ParentColor = False
    end
    object Label10: TLabel
      Left = 200
      Height = 13
      Top = 120
      Width = 68
      Caption = 'Close Program'
      ParentColor = False
    end
    object Label11: TLabel
      Left = 50
      Height = 13
      Top = 140
      Width = 42
      Caption = 'SHIFT-R'
      ParentColor = False
    end
    object Label12: TLabel
      Left = 200
      Height = 13
      Top = 140
      Width = 72
      Caption = 'Rename Image'
      ParentColor = False
    end
  end
end
