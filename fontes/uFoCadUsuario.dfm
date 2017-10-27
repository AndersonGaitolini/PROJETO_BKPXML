inherited foCadUsuario: TfoCadUsuario
  Caption = 'Cadastro de usu'#225'rio e senha'
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnl1: TPanel
    ExplicitTop = -8
    inherited lbUserNome: TLabel
      Left = 68
      Top = 117
      ExplicitLeft = 68
      ExplicitTop = 117
    end
    inherited lbUSerNivelAcesso: TLabel
      Top = 211
      ExplicitTop = 211
    end
    object lb1: TLabel [2]
      Left = 65
      Top = 145
      Width = 36
      Height = 16
      Caption = 'Senha'
    end
    object lb2: TLabel [3]
      Left = 16
      Top = 173
      Width = 85
      Height = 16
      Caption = 'Repita a senha'
    end
    inherited edUsuario: TEdit
      Left = 116
      Top = 113
      ExplicitLeft = 116
      ExplicitTop = 113
    end
    inherited edSenha: TEdit
      Left = 116
      Top = 141
      ExplicitLeft = 116
      ExplicitTop = 141
    end
    inherited btnAcessar: TBitBtn
      Left = 114
      Top = 242
      TabOrder = 3
      ExplicitLeft = 114
      ExplicitTop = 242
    end
    object ed1: TEdit
      Left = 116
      Top = 169
      Width = 122
      Height = 24
      PasswordChar = '*'
      TabOrder = 2
    end
  end
end
