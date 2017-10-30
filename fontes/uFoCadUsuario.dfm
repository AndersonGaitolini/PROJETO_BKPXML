inherited foCadUsuario: TfoCadUsuario
  Caption = 'Cadastro de usu'#225'rio e senha'
  ClientHeight = 259
  ClientWidth = 351
  OnCreate = FormCreate
  ExplicitWidth = 367
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 12
  inherited pnl1: TPanel
    Width = 351
    Height = 259
    ExplicitLeft = 7
    ExplicitWidth = 302
    ExplicitHeight = 224
    inherited lbUserNome: TLabel
      Left = 78
      Top = 30
      Width = 38
      Caption = 'Usu'#225'rio:'
      ExplicitLeft = 78
      ExplicitTop = 30
      ExplicitWidth = 38
    end
    object lb1: TLabel [1]
      Left = 84
      Top = 52
      Width = 32
      Height = 12
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Senha:'
    end
    object lb2: TLabel [2]
      Left = 48
      Top = 72
      Width = 68
      Height = 12
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Repita a senha:'
    end
    inherited btnAcessar: TBitBtn [3]
      Left = 57
      Top = 114
      Enabled = False
      TabOrder = 3
      Visible = False
      ExplicitLeft = 57
      ExplicitTop = 114
    end
    inherited edUsuario: TEdit [4]
      Left = 121
      Top = 25
      OnExit = edUsuarioExit
      ExplicitLeft = 121
      ExplicitTop = 25
    end
    inherited edSenha: TEdit [5]
      Left = 120
      Top = 49
      OnExit = edSenhaExit
      ExplicitLeft = 120
      ExplicitTop = 49
    end
    object edSenha2: TEdit
      Left = 121
      Top = 73
      Width = 97
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      PasswordChar = '*'
      TabOrder = 2
      OnExit = edSenha2Exit
    end
    object btnAplicar: TBitBtn
      Left = 121
      Top = 114
      Width = 60
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Aplicar'
      TabOrder = 4
      OnClick = btnAplicarClick
    end
    object btnCancelar: TBitBtn
      Left = 185
      Top = 114
      Width = 60
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&Cancelar'
      TabOrder = 5
    end
    object btnOK: TBitBtn
      Left = 57
      Top = 114
      Width = 60
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '&OK'
      Enabled = False
      TabOrder = 6
    end
  end
  inherited mmMenuTelaAcesso: TMainMenu
    Left = 256
    Top = 8
  end
end
