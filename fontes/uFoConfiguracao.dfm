object foConfiguracao: TfoConfiguracao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es do banco de dados'
  ClientHeight = 583
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = mm1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object pnlConfig: TPanel
    Left = 0
    Top = 37
    Width = 396
    Height = 474
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 529
    object pgcConfig: TPageControl
      Left = 1
      Top = 1
      Width = 394
      Height = 472
      Hint = 'Configura par'#226'metros do banco de dados'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = tsConfigBD
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = pgcConfigChange
      ExplicitWidth = 527
      object tsConfigBD: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Configura BD'
        ExplicitWidth = 519
        object btnGetDirBanco: TSpeedButton
          AlignWithMargins = True
          Left = 341
          Top = 255
          Width = 42
          Height = 25
          Caption = '...'
          Flat = True
          Layout = blGlyphTop
          OnClick = btnGetDirBancoClick
        end
        object edUsuarioBD: TLabeledEdit
          AlignWithMargins = True
          Left = 4
          Top = 176
          Width = 194
          Height = 24
          EditLabel.Width = 43
          EditLabel.Height = 16
          EditLabel.Caption = 'Usu'#225'rio'
          TabOrder = 1
          OnExit = edUsuarioBDExit
        end
        object edSenhaBD: TLabeledEdit
          AlignWithMargins = True
          Left = 4
          Top = 221
          Width = 194
          Height = 24
          EditLabel.Width = 36
          EditLabel.Height = 16
          EditLabel.Caption = 'Senha'
          TabOrder = 2
          OnExit = edSenhaBDExit
        end
        object edArquivo: TLabeledEdit
          AlignWithMargins = True
          Left = 4
          Top = 266
          Width = 332
          Height = 24
          EditLabel.Width = 144
          EditLabel.Height = 16
          EditLabel.Caption = 'Banco de dados GBD/FDB'
          TabOrder = 3
          OnExit = edArquivoExit
        end
        object edDescriConfig: TLabeledEdit
          AlignWithMargins = True
          Left = 4
          Top = 131
          Width = 332
          Height = 24
          EditLabel.Width = 128
          EditLabel.Height = 16
          EditLabel.Caption = 'Nome da configura'#231#227'o'
          TabOrder = 0
          OnExit = edDescriConfigExit
        end
      end
      object tsConfigNFCe: TTabSheet
        Hint = 'Configura par'#226'metros de notas fiscais de cumpom fiscal'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Configura NFCe'
        ImageIndex = 2
        ExplicitWidth = 519
        object edNFCePathEnvio: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 118
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 134
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio do XML Envio:'
          TabOrder = 1
          OnExit = edNFCePathEnvioExit
        end
        object edNFCePathProcessado: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 163
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 155
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML Processado: '
          TabOrder = 3
          OnExit = edNFCePathProcessadoExit
        end
        object edNFCePathRejeitado: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 208
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 140
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML Rejeitado:'
          TabOrder = 5
          OnExit = edNFCePathRejeitadoExit
        end
        object edNFCePathRetornoLido: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 253
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 170
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML de retorno lido:'
          TabOrder = 7
          OnExit = edNFCePathRetornoLidoExit
        end
        object edNFCePathPDFSalvo: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 296
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 165
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio arquivos PDF salvo:'
          TabOrder = 8
          OnExit = edNFCePathPDFSalvoExit
        end
        object btnOpenNFCe1: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 116
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 0
          OnClick = btnOpenNFCe1Click
        end
        object btnOpenNFCe2: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 161
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 2
          OnClick = btnOpenNFCe2Click
        end
        object btnOpenNFCe3: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 206
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 4
          OnClick = btnOpenNFCe3Click
        end
        object btnOpenNFCe4: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 251
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 6
          OnClick = btnOpenNFCe4Click
        end
        object btnOpenNFCe5: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 296
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 9
          OnClick = btnOpenNFCe5Click
        end
      end
      object tsConfigNFSe: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Configura NFSe'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        ExplicitWidth = 519
        object edNFSePathEnvio: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 118
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 134
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio do XML Envio:'
          TabOrder = 1
          OnExit = edNFSePathEnvioExit
        end
        object edNFSePathProcessado: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 163
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 155
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML Processado: '
          TabOrder = 3
          OnExit = edNFSePathProcessadoExit
        end
        object edNFSePathRejeitado: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 208
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 140
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML Rejeitado:'
          TabOrder = 5
          OnExit = edNFSePathRejeitadoExit
        end
        object edNFSePathRetornoLido: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 253
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 170
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML de retorno lido:'
          TabOrder = 7
          OnExit = edNFSePathRetornoLidoExit
        end
        object edNFSePathPDFSalvo: TLabeledEdit
          AlignWithMargins = True
          Left = 17
          Top = 298
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 165
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio arquivos PDF salvo:'
          TabOrder = 9
          OnExit = edNFSePathPDFSalvoExit
        end
        object btnOpenNFSe1: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 116
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 0
          OnClick = btnOpenNFSe1Click
        end
        object btnOpenNFSe2: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 161
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 2
          OnClick = btnOpenNFSe2Click
        end
        object btnOpenNFSe3: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 206
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 4
          OnClick = btnOpenNFSe3Click
        end
        object btnOpenNFSe4: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 251
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 6
          OnClick = btnOpenNFSe4Click
        end
        object btnOpenNFSe5: TBitBtn
          AlignWithMargins = True
          Left = 337
          Top = 296
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 8
          OnClick = btnOpenNFSe5Click
        end
      end
      object tsConfigNFe: TTabSheet
        Hint = 'Configura par'#226'metros de notas fiscais eletr'#244'nica'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Configura NFe'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        ExplicitWidth = 519
        object edNFePathEnvio: TLabeledEdit
          AlignWithMargins = True
          Left = 18
          Top = 119
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 134
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio do XML Envio:'
          TabOrder = 1
          OnExit = edNFePathEnvioExit
        end
        object edNFePathProcessado: TLabeledEdit
          AlignWithMargins = True
          Left = 18
          Top = 161
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 155
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML Processado: '
          TabOrder = 2
          OnExit = edNFePathProcessadoExit
        end
        object edNFePathRejeitado: TLabeledEdit
          AlignWithMargins = True
          Left = 18
          Top = 209
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 140
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML Rejeitado:'
          TabOrder = 5
          OnExit = edNFePathRejeitadoExit
        end
        object edNFePathRetornoLido: TLabeledEdit
          AlignWithMargins = True
          Left = 18
          Top = 254
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 170
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio XML de retorno lido:'
          TabOrder = 7
          OnExit = edNFePathRetornoLidoExit
        end
        object edNFePathPDFSalvo: TLabeledEdit
          AlignWithMargins = True
          Left = 18
          Top = 299
          Width = 312
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditLabel.Width = 165
          EditLabel.Height = 16
          EditLabel.Margins.Left = 4
          EditLabel.Margins.Top = 4
          EditLabel.Margins.Right = 4
          EditLabel.Margins.Bottom = 4
          EditLabel.Caption = 'Diret'#243'rio arquivos PDF salvo:'
          TabOrder = 9
          OnExit = edNFePathPDFSalvoExit
        end
        object btnOpen1: TBitBtn
          AlignWithMargins = True
          Left = 338
          Top = 117
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 0
          OnClick = btnOpen1Click
        end
        object btnOpen2: TBitBtn
          AlignWithMargins = True
          Left = 338
          Top = 162
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 3
          OnClick = btnOpen2Click
        end
        object btnOpen3: TBitBtn
          AlignWithMargins = True
          Left = 338
          Top = 207
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 4
          OnClick = btnOpen3Click
        end
        object btnOpen4: TBitBtn
          AlignWithMargins = True
          Left = 338
          Top = 252
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 6
          OnClick = btnOpen4Click
        end
        object btnOpen5: TBitBtn
          AlignWithMargins = True
          Left = 338
          Top = 297
          Width = 31
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '...'
          TabOrder = 8
          OnClick = btnOpen5Click
        end
      end
    end
  end
  object statMSg: TStatusBar
    Left = 0
    Top = 564
    Width = 396
    Height = 19
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <
      item
        Text = 'Situa'#231#227'o: '
        Width = 60
      end
      item
        Text = 'Nenhuma'
        Width = 50
      end>
    ExplicitWidth = 529
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 511
    Width = 396
    Height = 53
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    TabOrder = 3
    ExplicitWidth = 529
    DesignSize = (
      396
      53)
    object btn2: TBitBtn
      Left = 193
      Top = 14
      Width = 114
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancel'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btn2Click
      ExplicitLeft = 326
    end
    object btnOK: TBitBtn
      Left = -44
      Top = 6
      Width = 114
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&OK'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 89
    end
    object btnAplicar: TBitBtn
      Left = 75
      Top = 14
      Width = 113
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Aplicar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnAplicarClick
      ExplicitLeft = 208
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 36
    Width = 396
    Height = 1
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 529
  end
  object jtobMenuConfig: TJvToolBar
    Left = 0
    Top = 0
    Width = 396
    Height = 36
    ButtonHeight = 39
    ButtonWidth = 70
    Caption = 'Configura'#231#245'es por usuario'
    Images = ilCadastro
    ShowCaptions = True
    TabOrder = 0
    ExplicitTop = 8
    object btn1: TToolButton
      Left = 0
      Top = 0
      Caption = 'Padr'#227'o'
      ImageIndex = 3
      OnClick = btn1Click
    end
    object btnIniFile: TToolButton
      Left = 70
      Top = 0
      Caption = 'Arquivo INI'
      ImageIndex = 1
      OnClick = btnIniFileClick
    end
  end
  object jopdOpenDir: TJvSelectDirectory
    Left = 24
    Top = 464
  end
  object dlgOpenDir: TOpenDialog
    Left = 149
    Top = 464
  end
  object ilCadastro: TImageList
    Left = 108
    Top = 464
    Bitmap = {
      494C010104000C00040110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF2469D3002469D3001F5BC4001E5AC300FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF05710A0076F9A70076F9A7006FF39E005BE3830042CE610028B9
      3F0014A8240005710A00FFFFFFFFFFFFFFFFB4817600FEF3E300F8E7D3004946
      4500373C3E0051606100AE9C8200BFA88900D0B48D00E4C39300EDCB9600F3D1
      9900B7818300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFB
      DD00FEF9D800FCE4BB00F0D6A700BBC888009CBD6F0043A7360072BA5E00EFF6
      D400FDEECC00F2BF8900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF338D
      FB003F91F400A3B6CF00E3D0BB00F5CEAD00EBBEA200E9AA7A00F2BE8E002469
      D3002469D300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF05710A0076F9A70005710A0005710A0005710A000571
      0A0005710A0005710A00FFFFFFFFFFFFFFFFB4817600FFF7EB00F9EBDA00B0A5
      98001B617D00097CA80018556F0066625B00A7947900C5AC8600DCBD8D00EECD
      9500B7818300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B87F00F6D0
      A100FDF4D100FDEBC500FCDBB30044AB3800009402000E9A0F0010970B0057B6
      4E00FEF5DB00F4C28C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FAC
      E200FDDCB400FDDCB500FDDDB600F7D2B000F9D7B400E4A17200EFBB9100E0D6
      D2005D90DD00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C78D5001C78D5001C78
      D5001C78D5001C599600FFFFFFFF05710A0005710A00FFFFFFFFFFFFFFFFE4F0
      FC001C78D5001C78D5001C78D5001C78D500BA8E8500FFFCF400FAEFE400F2E5
      D6003872860029799A008D787F00956D6F00795953009D8B7300BAA38000D9BC
      8C00B47F8100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2BD8700F1BA
      8100F3C18A00F8D5A600FFE1BE0047AD3A000088000084CD8500FFF4EF0063B5
      5200B6C07900FDC08D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4187DA00FEE7
      CA00FEECD500FEEDD800FEEDD900F3D1B800E4AE8B00EEBA9000F9DDC200FCF0
      E400FEF6EF00D7E5F8005394EC00FFFFFFFF1C78D50082C6F90057BCFF004EB5
      FF004DB4FF001C599600FFFFFFFFFFFFFFFF05710A00FFFFFFFFFFFFFFFFE4F0
      FC002A95FF00369BFF00379CFF001C78D500BA8E8500FFFFFD00FBF4EC00FAEF
      E300A5B3B1007C707800E5A6A300C8929200A47272007657510095856C00AF99
      7800A8777900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C49200F5C7
      9600F4C39000F4BE8900FCC5960093C47B005CB95C0089CB8300FFFFFF00F7FE
      FC00CBCA9200F6BC8500FFFFFFFFFFFFFFFFFFFFFFFF3491FF00807F7600FEF2
      E200FEF2E300FEF3E500FEF3E600F3D7C300DD986E00F1C39E00FAE4CF00FDF4
      EC00FEF9F500FFFEFE00E5EFFD002E80ED001C78D5007DC3F70056BCFF004EB4
      FE004DB3FF001C599600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F0
      FC002893FF003499FF00359AFF001C78D500CB9A8200FFFFFF00FEF9F500FBF3
      EC00F4EBDF0085787C00EEB7B500DAA6A600C38E8E009E6E6E0073564F009383
      6B00996E6F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D0A800FBD2
      AD00FAD0A900FACEA600F6CDA100D0DFB800FFFFFF00E2F2DF0071C26E0066C0
      6600C8CB9200FAC18E00FFFFFFFFFFFFFFFFFFFFFFFF3478B70033CB6700FFFA
      F500FFFBF600FFFBF700F7E2D400E4B29400ECB78E00FBE7D400B1AFAA00F0ED
      EA00FFFDFB00FFFFFF00D6ACAC00328CF9001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C599600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F0
      FC001F8EFF002B95FF002C96FF001C78D500CB9A8200FFFFFF00FFFEFD00FDF8
      F400FBF3EC00F0E4D900A3797800E9B5B500D9A5A500C48F8F009D6D6D007759
      52008F676900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D4A800FDDEBF00FDDE
      BE00FDDBBB00FDDBBB00FFDEC50078BB610098D49800E7F5E6003EAD3B00008A
      00009AC17600FFCCA600F2BE8700FFFFFFFFFFFFFFFF347F6E0033CB6700FFFD
      FB00FFFDFB00FFFDFB00FAEEE700DB956B00DF986A00FCEDDE00FDF4EB00A4A6
      A400C7C8C700F9F2F200CD999900FFFFFFFF1C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C599600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F0
      FC00E4F0FC00E4F0FC00E4F0FC00E4F0FC00DCA88700FFFFFF00FFFFFF00FFFE
      FD00FEF9F400FBF3EB00E8D9CE009E747300E8B5B500D8A4A400C18D8D009D6C
      6C007D555600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D4A800FFEFD100FEEA
      CB00FEE9C900FEE7C800FFE7C900E2E2BE00169A14002BA12900089708000092
      000090C47800FFD9BC00F2BE8700FFFFFFFFFFFFFFFF0033FF00CFD9FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8B18B00ECB89300E2DDD600FEFAF600FFFE
      FE00FFFFFF0080BAFF003491FF00FFFFFFFF1C78D500629DCF003589CF003589
      CF003589CF001C5996001C5996001C5996001C5996001C5996001C599600FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCA88700FFFFFF00FFFFFF00FFFF
      FF00FFFEFD00FDF9F400FBF3EB00E0CFC500A1767600ECB9B900D6A2A200C68E
      8E00965F5D00585C6000FFFFFFFFFFFFFFFFFFFFFFFFFBE5BD00FFFCDF00FFF7
      D800FFF6D600FFF4D500FFF3D200FFF5DC00C5DFAD0042AB3B0043AE3B00AFD7
      9E00C5DCAA00FFE7C900F5C79300FFFFFFFFFFFFFFFF0033FF00FFFFFF00FFFF
      FF00FFFFFF0093C4FF0059A5FF0097BAE500FCECDD00B2B2AF00B2B3B100FFFF
      FF00FFFFFF004198FF003491FF00FFFFFFFF1C78D50086CCF90065CBFF005DC3
      FF005CC4FF003589CF0053BAFF0053BAFF004EB4FF004DB4FF001C78D500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFD00FDF8F300FDF6EC00DAC5BC00AC808000F3BCBB00A387
      8C003392B30019ADCC0019ADCC00FFFFFFFFFFFFFFFFFDF3D100FFFFE100FFFC
      DD00FFFDDE00FFFCDD00FFFCDE00FFFDDE00FFFFE800FFFFF000FFFFED00FFFF
      E700FFFAE000FFF7D700F6CE9D00FFFFFFFF3491FF003491FF003491FF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6CEFD00FFFEFE00CECF
      CE00F8F8F8003491FF00FFFFFFFFFFFFFFFF1C78D50084C9F70065CAFF005EC3
      FE005EC4FF003589CF0053BAFF0054BAFF004FB4FE004FB4FF001C78D500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900AA7A7100B2787300469C
      BA000FCAF40000A4E600021EAA0000009900FFFFFFFFFEF7D700FFFFE500FFFF
      E200FFFFE200FFFFE300FFFEE000FEF8D800FAE3B600F7CE9500F7CF9700F9E1
      B600FEF5D200FFFFE500F6D5A700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF78B6FF00FFFF
      FF00C0DDFF003491FF00FFFFFFFFFFFFFFFF1C78D50085CBF80064CBFF005EC6
      FF005EC7FF003589CF0053BAFF0055BDFF0050B7FF0050B7FF001C78D500FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDBD9200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B8857A00DCA76A0010A5
      CF0004A8E6000936C900092CC3000318AE00FFFFFFFFF7D8AB00FAE6C000FAE5
      BE00F9E1B900F8DAAE00F6CD9800F3BE8000F0B16A00F0B06700F0B37000F4BE
      8800FBCE9E00FDDDB400FBCEA000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3491FF00FFFFFFFFFFFFFFFFFFFFFFFF1C78D5009ECFF50092D7FD0088D2
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
  object mm1: TMainMenu
    Left = 69
    Top = 465
    object mniAjuste1: TMenuItem
      Caption = 'Ajuste'
      object mniAjustarconfiguraopadro1: TMenuItem
        Caption = 'Ajustar configura'#231#227'o padr'#227'o'
        OnClick = mniAjustarconfiguraopadro1Click
      end
    end
  end
end
