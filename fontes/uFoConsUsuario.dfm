inherited foConsUsuario: TfoConsUsuario
  Caption = 'MAXXML Consulta usu'#225'rios'
  ClientHeight = 275
  ClientWidth = 357
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 373
  ExplicitHeight = 314
  PixelsPerInch = 96
  TextHeight = 12
  inherited pnlCentral: TPanel
    Width = 357
    Height = 191
    ExplicitWidth = 341
    ExplicitHeight = 191
    inherited dbgConsulta: TDBGrid
      Width = 355
      Height = 189
      DataSource = DM_NFEDFE.dsUsuarios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      OnDblClick = btnAlterarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SENHA'
          Title.Caption = 'Senha'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CONFIGSALVA'
          Title.Caption = 'Configura'#231#227'o'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited statMsg: TStatusBar
    Top = 256
    Width = 357
    ExplicitTop = 256
    ExplicitWidth = 341
  end
  inherited JvToolBar1: TJvToolBar
    Width = 357
    Images = ilCadastro
    ExplicitWidth = 341
    object btnInserir: TToolButton
      Left = 0
      Top = 0
      Caption = 'btnInserir'
      ImageIndex = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TToolButton
      Left = 97
      Top = 0
      Caption = 'btnAlterar'
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 194
      Top = 0
      Caption = 'btnExcluir'
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
  end
  object ilCadastro: TImageList
    Left = 556
    Top = 16
    Bitmap = {
      494C010104000C00FC0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF05710A00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF05710A0005710A00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF5CA9900F6D1A100F5CB9900F3C18B00F2C08800F3C38E00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF05710A0076F9A70005710A0005710A0005710A000571
      0A0005710A0005710A00FFFFFFFFFFFFFFFFB7818300FDEFD900F4E1C900E4CF
      B400D1BCA000CDB79800DAC09A00E4C59900E9C89600EDCB9600EECC9700F3D1
      9900B7818300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF0
      CC00FEF6D500FCE6BE00F6D5A600FCC69600FFC49500FDD6AE00FFE2BF00FEE2
      BA00F4C59000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF1E74E8002E72D6005181CD005B76B300245FC400FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF05710A0076F9A70076F9A7006FF39E005BE3830042CE610028B9
      3F0014A8240005710A00FFFFFFFFFFFFFFFFB4817600FEF3E300F8E7D3004946
      4500373C3E0051606100AE9C8200BFA88900D0B48D00E4C39300EDCB9600F3D1
      9900B7818300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFB
      DD00FEF9D800FCE4BB00F0D6A700BBC888009CBD6F0043A7360072BA5E00EFF6
      D400FDEECC00F2BF8900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4A94F00078A3DC00B2BAC700D2C4BC00E6BDA200F4AE7600B7A6A3003973
      D000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF05710A0076F9A70005710A0005710A0005710A000571
      0A0005710A0005710A00FFFFFFFFFFFFFFFFB4817600FFF7EB00F9EBDA00B0A5
      98001B617D00097CA80018556F0066625B00A7947900C5AC8600DCBD8D00EECD
      9500B7818300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B87F00F6D0
      A100FDF4D100FDEBC500FCDBB30044AB3800009402000E9A0F0010970B0057B6
      4E00FEF5DB00F4C28C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF298FFF007AAD
      EA00FBDDB600FFE0B800FFE5BA00FFDCB600ECB79100E29B6A00FDCEA200EEDE
      D0007AA2E000337BE100FFFFFFFFFFFFFFFFFFFFFFFF1C78D5001C78D5001C78
      D5001C78D5001C599600FFFFFFFF05710A0005710A00FFFFFFFFFFFFFFFFE4F0
      FC001C78D5001C78D5001C78D5001C78D500BA8E8500FFFCF400FAEFE400F2E5
      D6003872860029799A008D787F00956D6F00795953009D8B7300BAA38000D9BC
      8C00B47F8100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2BD8700F1BA
      8100F3C18A00F8D5A600FFE1BE0047AD3A000088000084CD8500FFF4EF0063B5
      5200B6C07900FDC08D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4282C800D6C7
      B200FFEFD300FEECD400FDE9D200F3D5BD00E3A88200ECB18300FADFC400FFEF
      DE00FFFBF000B9D2F300468EEE00FFFFFFFF1C78D50082C6F90057BCFF004EB5
      FF004DB4FF001C599600FFFFFFFFFFFFFFFF05710A00FFFFFFFFFFFFFFFFE4F0
      FC002A95FF00369BFF00379CFF001C78D500BA8E8500FFFFFD00FBF4EC00FAEF
      E300A5B3B1007C707800E5A6A300C8929200A47272007657510095856C00AF99
      7800A8777900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C49200F5C7
      9600F4C39000F4BE8900FCC5960093C47B005CB95C0089CB8300FFFFFF00F7FE
      FC00CBCA9200F6BC8500FFFFFFFFFFFFFFFFFFFFFFFF318FFF00BD8E5700FFE5
      B500FEF7EF00FEF6EA00FBEBDD00EECBB300DE986C00EFBE9900FDECDA00FFF6
      EE00FFFBF800FFFFFF00AEC6EA002578E7001C78D5007DC3F70056BCFF004EB4
      FE004DB3FF001C599600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F0
      FC002893FF003499FF00359AFF001C78D500CB9A8200FFFFFF00FEF9F500FBF3
      EC00F4EBDF0085787C00EEB7B500DAA6A600C38E8E009E6E6E0073564F009383
      6B00996E6F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D0A800FBD2
      AD00FAD0A900FACEA600F6CDA100D0DFB800FFFFFF00E2F2DF0071C26E0066C0
      6600C8CB9200FAC18E00FFFFFFFFFFFFFFFFFFFFFFFF2E84D40088C47400FFF8
      EC00FFFBF700FFFBF600F9E7DB00E7B89C00E8AB8000F6D8BF00C5C1BB00E3DF
      DB00FEFEFD00FFFFFE00C6A7A9004283DC001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C599600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F0
      FC001F8EFF002B95FF002C96FF001C78D500CB9A8200FFFFFF00FFFEFD00FDF8
      F400FBF3EC00F0E4D900A3797800E9B5B500D9A5A500C48F8F009D6D6D007759
      52008F676900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D4A800FDDEBF00FDDE
      BE00FDDBBB00FDDBBB00FFDEC50078BB610098D49800E7F5E6003EAD3B00008A
      00009AC17600FFCCA600F2BE8700FFFFFFFFFFFFFFFF2B898E007CDC9F00FFFF
      FF00FFFEFC00FEFCF900F3DBCB00E2A78200EAB38C00FEEBDB00F6F1EB00C9CA
      C800D0D1CF00F7F4F3009893B5003A91FB001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C599600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F0
      FC00E4F0FC00E4F0FC00E4F0FC00E4F0FC00DCA88700FFFFFF00FFFFFF00FFFE
      FD00FEF9F400FBF3EB00E8D9CE009E747300E8B5B500D8A4A400C18D8D009D6C
      6C007D555600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D4A800FFEFD100FEEA
      CB00FEE9C900FEE7C800FFE7C900E2E2BE00169A14002BA12900089708000092
      000090C47800FFD9BC00F2BE8700FFFFFFFFFFFFFFFF1455D000CEDFF200FFFF
      FF00FFFFFF00FEFDFB00EDD6CB00E3AC8700F5CEAD00E8E1DA00FCF8F500FFFF
      FF00EFEEED00B5D4F9003A91FB00FFFFFFFF1C78D500629DCF003589CF003589
      CF003589CF001C5996001C5996001C5996001C5996001C5996001C599600FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCA88700FFFFFF00FFFFFF00FFFF
      FF00FFFEFD00FDF9F400FBF3EB00E0CFC500A1767600ECB9B900D6A2A200C68E
      8E00965F5D00585C6000FFFFFFFFFFFFFFFFFFFFFFFFFBE5BD00FFFCDF00FFF7
      D800FFF6D600FFF4D500FFF3D200FFF5DC00C5DFAD0042AB3B0043AE3B00AFD7
      9E00C5DCAA00FFE7C900F5C79300FFFFFFFF2C7EEA00355DF300FFFFFF00E1EF
      FF00BADAFF0098C7FF004BA0FF0077ABEB00DFE0E400DDD7CE00C4C4C200E7E7
      E700FFFFFF0071B2FF00288CFF00FFFFFFFF1C78D50086CCF90065CBFF005DC3
      FF005CC4FF003589CF0053BAFF0053BAFF004EB4FF004DB4FF001C78D500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFD00FDF8F300FDF6EC00DAC5BC00AC808000F3BCBB00A387
      8C003392B30019ADCC0019ADCC00FFFFFFFFFFFFFFFFFDF3D100FFFFE100FFFC
      DD00FFFDDE00FFFCDD00FFFCDE00FFFDDE00FFFFE800FFFFF000FFFFED00FFFF
      E700FFFAE000FFF7D700F6CE9D00FFFFFFFF2F8EFF0053A1FF0068AEFF0073B3
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D8DFF00B1D6FF00F1F1F000DFD9
      CE00D9E9FA003F97FF00FFFFFFFFFFFFFFFF1C78D50084C9F70065CAFF005EC3
      FE005EC4FF003589CF0053BAFF0054BAFF004FB4FE004FB4FF001C78D500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900AA7A7100B2787300469C
      BA000FCAF40000A4E600021EAA0000009900FFFFFFFFFEF7D700FFFFE500FFFF
      E200FFFFE200FFFFE300FFFEE000FEF8D800FAE3B600F7CE9500F7CF9700F9E1
      B600FEF5D200FFFFE500F6D5A700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D8DFF00BFDD
      FF0076B4FE002B8CFF00FFFFFFFFFFFFFFFF1C78D50085CBF80064CBFF005EC6
      FF005EC7FF003589CF0053BAFF0055BDFF0050B7FF0050B7FF001C78D500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDBD9200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B8857A00DCA76A0010A5
      CF0004A8E6000936C900092CC3000318AE00FFFFFFFFF7D8AB00FAE6C000FAE5
      BE00F9E1B900F8DAAE00F6CD9800F3BE8000F0B16A00F0B06700F0B37000F4BE
      8800FBCE9E00FDDDB400FBCEA000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF2D8DFF00FFFFFFFFFFFFFFFFFFFFFFFF1C78D5009ECFF50092D7FD0088D2
      FC008CD5FD00629DCF0085CEFD0085CEFD0080C9FC0084CBFD001C78D500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDBD9200FCF7F400FCF7F300FBF6
      F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B8857A00CF9B8600FFFF
      FFFF077DCD004860F100204ADD000416AA00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B66F00F3BD8200F9CB
      9B00FBCD9F00FBCB9B00FBCB9B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF001C78D5001C78D5001C78
      D5001C78D5001C78D5001C78D5001C78D5001C78D5001C78D500FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDBD9200DCA88700DCA88700DCA8
      8700DCA88700DCA88700DCA88700DCA88700DCA88700B8857A00FFFFFFFFFFFF
      FFFFFFFFFFFF3E4BDB00192DC400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE
      9F00FBCE9F00FBCE9F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
