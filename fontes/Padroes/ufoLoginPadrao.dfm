object foLoginPadrao: TfoLoginPadrao
  Left = 640
  Top = 540
  Caption = 'Tela de acesso'
  ClientHeight = 297
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mmMenuTelaAcesso
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 12
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 242
    Height = 297
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    TabOrder = 0
    object lbUserNome: TLabel
      Left = 73
      Top = 112
      Width = 26
      Height = 12
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Nome'
    end
    object edUsuario: TEdit
      Left = 73
      Top = 58
      Width = 97
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 0
    end
    object edSenha: TEdit
      Left = 73
      Top = 88
      Width = 97
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnAcessar: TBitBtn
      Left = 84
      Top = 147
      Width = 60
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Acessar'
      TabOrder = 2
    end
  end
  object mmMenuTelaAcesso: TMainMenu
    Left = 184
    Top = 16
  end
end
