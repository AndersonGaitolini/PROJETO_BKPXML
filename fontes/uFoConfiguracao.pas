unit uFoConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, JvBaseDlg, JvSelectDirectory,
  uMetodosUteis,
  Configuracoes,
  Vcl.ToolWin,
  JvExComCtrls,
  JvToolBar,
  System.ImageList,
  Vcl.ImgList,
  Vcl.DBCtrls,
  uDMnfebkp,Usuarios,uFoPrincipal,
  Data.DB, Datasnap.DBClient,Datasnap.Provider, Atributos, ConfigPadrao,
  Vcl.Menus,uFoConfigPadrao;

type

  TfoConfiguracao = class(TForm)
    pnlConfig: TPanel;
    pgcConfig: TPageControl;
    tsConfigBD: TTabSheet;
    btnGetDirBanco: TSpeedButton;
    edUsuarioBD: TLabeledEdit;
    edSenhaBD: TLabeledEdit;
    edArquivo: TLabeledEdit;
    tsConfigNFe: TTabSheet;
    edNFePathSend: TLabeledEdit;
    edNFePathReturn: TLabeledEdit;
    edPathRetEnvNFe: TLabeledEdit;
    edPathRetCancNFe: TLabeledEdit;
    edPathRetInutNFe: TLabeledEdit;
    edExtAutNFe: TLabeledEdit;
    edExtInutNFe: TLabeledEdit;
    edExtCancNFe: TLabeledEdit;
    btnOpen1: TBitBtn;
    btnOpen2: TBitBtn;
    btnOpen3: TBitBtn;
    btnOpen4: TBitBtn;
    btnOpen5: TBitBtn;
    tsConfigNFCe: TTabSheet;
    edNFCePathSend: TLabeledEdit;
    edNFCePathReturn: TLabeledEdit;
    edPathRetEnvNFCe: TLabeledEdit;
    edPathRetCancNFCe: TLabeledEdit;
    edPathRetInutNFCe: TLabeledEdit;
    edExtAutNFCe: TLabeledEdit;
    edExtInutNFCe: TLabeledEdit;
    edExtCancNFCe: TLabeledEdit;
    btnOpenNFCe1: TBitBtn;
    btnOpenNFCe2: TBitBtn;
    btnOpenNFCe3: TBitBtn;
    btnOpenNFCe4: TBitBtn;
    btnOpenNFCe5: TBitBtn;
    tsConfigNFSe: TTabSheet;
    edNFSePathSend: TLabeledEdit;
    edNFSePathReturn: TLabeledEdit;
    edPathRetEnvNFSe: TLabeledEdit;
    edPathRetCancNFSe: TLabeledEdit;
    edPathRetInutNFSe: TLabeledEdit;
    edExtAutNFSe: TLabeledEdit;
    edExtInutNFSe: TLabeledEdit;
    edExtCancNFSe: TLabeledEdit;
    btnOpenNFSe1: TBitBtn;
    btnOpenNFSe2: TBitBtn;
    btnOpenNFSe3: TBitBtn;
    btnOpenNFSe4: TBitBtn;
    btnOpenNFSe5: TBitBtn;
    jopdOpenDir: TJvSelectDirectory;
    dlgOpenDir: TOpenDialog;
    ilCadastro: TImageList;
    statMSg: TStatusBar;
    pnlRodape: TPanel;
    btn2: TBitBtn;
    btnOK: TBitBtn;
    pnlMenu: TPanel;
    jtobMenuConfig: TJvToolBar;
    btnAplicar: TBitBtn;
    edDescriConfig: TLabeledEdit;
    btn1: TToolButton;
    mm1: TMainMenu;
    mniAjuste1: TMenuItem;
    mniAjustarconfiguraopadro1: TMenuItem;
    btnIniFile: TToolButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOpen1Click(Sender: TObject);
    procedure btnGetDirBancoClick(Sender: TObject);
    procedure btnOpen2Click(Sender: TObject);
    procedure btnOpen3Click(Sender: TObject);
    procedure btnOpen4Click(Sender: TObject);
    procedure btnOpen5Click(Sender: TObject);
    procedure btnOpenNFCe1Click(Sender: TObject);
    procedure btnOpenNFCe2Click(Sender: TObject);
    procedure btnOpenNFCe3Click(Sender: TObject);
    procedure btnOpenNFCe4Click(Sender: TObject);
    procedure btnOpenNFCe5Click(Sender: TObject);
    procedure btnOpenNFSe1Click(Sender: TObject);
    procedure btnOpenNFSe2Click(Sender: TObject);
    procedure btnOpenNFSe3Click(Sender: TObject);
    procedure btnOpenNFSe4Click(Sender: TObject);
    procedure btnOpenNFSe5Click(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDescriConfigExit(Sender: TObject);
    procedure edUsuarioBDExit(Sender: TObject);
    procedure edSenhaBDExit(Sender: TObject);
    procedure edArquivoExit(Sender: TObject);
    procedure edNFePathSendExit(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edNFePathReturnExit(Sender: TObject);
    procedure edPathRetEnvNFeExit(Sender: TObject);
    procedure edPathRetCancNFeExit(Sender: TObject);
    procedure edPathRetInutNFeExit(Sender: TObject);
    procedure edNFCePathSendExit(Sender: TObject);
    procedure edNFCePathReturnExit(Sender: TObject);
    procedure edPathRetEnvNFCeExit(Sender: TObject);
    procedure edPathRetCancNFCeExit(Sender: TObject);
    procedure edPathRetInutNFCeExit(Sender: TObject);
    procedure edNFSePathSendExit(Sender: TObject);
    procedure edNFSePathReturnExit(Sender: TObject);
    procedure edPathRetEnvNFSeExit(Sender: TObject);
    procedure edPathRetCancNFSeExit(Sender: TObject);
    procedure edPathRetInutNFSeExit(Sender: TObject);
    procedure edExtInutNFeExit(Sender: TObject);
    procedure edExtAutNFeExit(Sender: TObject);
    procedure edExtCancNFeExit(Sender: TObject);
    procedure edExtAutNFCeExit(Sender: TObject);
    procedure edExtCancNFCeExit(Sender: TObject);
    procedure edExtInutNFCeExit(Sender: TObject);
    procedure edExtAutNFSeExit(Sender: TObject);
    procedure edExtCancNFSeExit(Sender: TObject);
    procedure edExtInutNFSeExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure mniAjustarconfiguraopadro1Click(Sender: TObject);
    procedure btnIniFileClick(Sender: TObject);
  private
    { Private declarations }
    function validacampos(pForm : TForm): boolean;
    function LimpaCampos(pForm : TForm): boolean;
    procedure SalvarParametros;
    procedure AlteraEditaExcluiConfig;
    procedure LerParametros;
    procedure MsgStatus(pMsg : string; pCor : TColor = clBlack);
    function CarregaConfig(pTab : TConfiguracoes; pIdUsuario : integer): Boolean; overload;
    function CarregaConfig(pTab : TConfiguracoes; pIdUsuario : integer; pDescriConfig : string): Boolean; overload;
    function CarregaConfigPadrao(pTab : TConfigPadrao): Boolean;
    function CarregaIniFile: Boolean;
    procedure FormShowAlterar;
    procedure FormShowInserir;
    procedure FormShowDeletar;

//    function pOpenFileName(var prFileName:string): Boolean;
//    function pOpenPath(var prDirectory:string):boolean;
    procedure pEnableConfig(pForm : TForm;pEnable: boolean);
    procedure EditToTabela;
    procedure TabelaToEdit;

  public
    { Public declarations }
    IDConfig : Integer; //temporario
    FUsuarios : TUsuarios;
    ConfigId : integer;
    LastId   : integer;
  published
   property Usuarios : TUsuarios read FUsuarios write FUsuarios;
  end;

var
  foConfiguracao : TfoConfiguracao;
  wPathAux: string;
  wOpe : TOperacao;
  SavStr : String;
implementation


{$R *.dfm}

procedure TfoConfiguracao.AlteraEditaExcluiConfig;
begin
  if wOpe = opNil then
    exit;

  with daoConfiguracoes, tabConfiguracoes do
  begin
    case wOpe of
      opExcluir: begin
                   if MessageDlg('Deseja excluir a configura��o '+ DescriConfig, mtConfirmation, mbYesNo,0) = mrYes then
                     if fExcluirConfiguracoes(tabConfiguracoes) then
                     begin
                       statMSg.Panels[1].Text := 'Deletado!';
                       wOpe := opOK;
                     end;
                  end;

      opAlterar: begin
                   tabUsuarios.ConfigSalva := tabConfiguracoes.id;
                   if fSalvarConfiguracoes(tabConfiguracoes) then
                   begin
                     statMSg.Panels[1].Text := 'Salvo!';
                     daoUsuarios.fSalvar(tabUsuarios);
                     wOpe := opOk;
                     btnAplicar.Enabled := false;
                     btnOK.Enabled := true;
                   end;
                 end;

      opInserir: begin
                   if fInserirConfiguracoes(tabConfiguracoes) > 0 then
                   begin
                     statMSg.Panels[1].Text := 'Novo registo!';
                     wOpe := opOk;
                   end;
                 end;
    end;
  end;
end;

procedure TfoConfiguracao.btn1Click(Sender: TObject);
begin
  if CarregaConfigPadrao(tabConfigpadrao) then
    MsgStatus('Configura��o Padr�o', clRed);
end;

procedure TfoConfiguracao.btn2Click(Sender: TObject);
begin
  //
end;

procedure TfoConfiguracao.btnAplicarClick(Sender: TObject);
begin
  if Validacampos(foConfiguracao) then
  begin
    EditToTabela;
    AlteraEditaExcluiConfig;
  end;
end;

procedure TfoConfiguracao.btnOKClick(Sender: TObject);
begin

  if wOpe = opOK then
     ModalResult := mrOk
end;

procedure TfoConfiguracao.btnEditarClick(Sender: TObject);
begin
  pgcConfig.Enabled := true;
  pnlRodape.Enabled := false;
  statMSg.Panels[1].Text := 'Alterando!';

end;

procedure TfoConfiguracao.btnExcluirClick(Sender: TObject);
begin
  wOpe := opExcluir;
  pEnableConfig(foConfiguracao, false);
end;

procedure TfoConfiguracao.btnGetDirBancoClick(Sender: TObject);
begin
  if fOpenFileName(['*.*fdb'],['Firebird'],wPathAux,'Selecione o Diret�rio do seu Banco de DADOS') then
 begin
   edArquivo.Text := wPathAux;
   tabConfiguracoes.PathBD := wPathAux;
 end;
end;

procedure TfoConfiguracao.btnIniFileClick(Sender: TObject);
begin
 if CarregaIniFile then
end;

procedure TfoConfiguracao.btnInserirClick(Sender: TObject);
begin
  statMSg.Panels[1].Text := 'Inserindo!';
end;


procedure TfoConfiguracao.btnOpen1Click(Sender: TObject);
begin
 if fOpenPath(wPathAux) then
 begin
   edNFePathSend.Text := wPathAux;
   tabConfiguracoes.NFePathSend := wPathAux;
 end;
end;

procedure TfoConfiguracao.btnOpen2Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFePathReturn.Text := wPathAux;
    tabConfiguracoes.NFePathReturn := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpen3Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetEnvNFe.Text := wPathAux;
    tabConfiguracoes.PathRetEnvNFe := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpen4Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetCancNFe.Text := wPathAux;
    tabConfiguracoes.PathRetCancNFe := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpen5Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetInutNFe.Text := wPathAux;
    tabConfiguracoes.PathRetInutNFe := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFCe1Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFCePathSend.Text := wPathAux;
    tabConfiguracoes.NFCePathSend := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFCe2Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFCePathReturn.Text := wPathAux;
    tabConfiguracoes.NFCePathReturn := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFCe3Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetEnvNFCe.Text := wPathAux;
    tabConfiguracoes.PathRetEnvNFCe := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFCe4Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetCancNFCe.Text := wPathAux;
    tabConfiguracoes.PathRetCancNFCe := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFCe5Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetInutNFCe.Text := wPathAux;
    tabConfiguracoes.PathRetInutNFCe := wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFSe1Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFSePathSend.Text := wPathAux;
    tabConfiguracoes.NFSePathSend:= wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFSe2Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFSePathReturn.Text := wPathAux;
    tabConfiguracoes.NFSePathReturn:= wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFSe3Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetEnvNFSe.Text := wPathAux;
    tabConfiguracoes.PathRetEnvNFSe:= wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFSe4Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetCancNFSe.Text := wPathAux;
    tabConfiguracoes.PathRetCancNFSe:= wPathAux;
  end;
end;

procedure TfoConfiguracao.btnOpenNFSe5Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetInutNFSe.Text := wPathAux;
    tabConfiguracoes.PathRetInutNFSe:= wPathAux;
  end;
end;

function TfoConfiguracao.CarregaConfigPadrao(pTab: TConfigPadrao): Boolean;
begin
  Result := false;
  try
    try
      pTab.IDusuario := 0;
      with pTab do
      begin
        daoConfigPadrao.fCarregaConfigPadrao(pTab, ['id']);

        with tabConfigpadrao do
        begin
          edUsuarioBD.Text       := UsuarioBD;
          edSenhaBD.Text         := SenhaBD;
          edArquivo.Text         := PathBD+'\'+NameBD;
          //Aba Configura NFe
          edNFePathSend.Text     := NFePathSend;
          edNFePathReturn.Text   := NFePathReturn;
          edPathRetEnvNFe.Text   := PathRetEnvNFe;
          edPathRetCancNFe.Text  := PathRetCancNFe;
          edPathRetInutNFe.Text  := PathRetInutNFe;
          edExtAutNFe.Text       := ExtAutNFe;
          edExtCancNFe.Text      := ExtCancNFe;
          edExtInutNFe.Text      := ExtInutNFe;
          //Aba Configura NFCe
          edNFCePathSend.Text    := NFCePathSend;
          edNFCePathReturn.Text  := NFCePathReturn;
          edPathRetEnvNFCe.Text  := PathRetEnvNFCe;
          edPathRetCancNFCe.Text := PathRetCancNFCe;
          edPathRetInutNFCe.Text := PathRetInutNFCe;
          edExtAutNFCe.Text      := ExtAutNFCe;
          edExtCancNFCe.Text     := ExtCancNFCe;
          edExtInutNFCe.Text     := ExtInutNFCe;
          //Aba Configura NFSe
          edNFSePathSend.Text    := NFSePathSend;
          edNFSePathReturn.Text  := NFSePathReturn;
          edPathRetEnvNFSe.Text  := PathRetEnvNFSe;
          edPathRetCancNFSe.Text := PathRetCancNFSe;
          edPathRetInutNFSe.Text := PathRetInutNFSe;
          edExtAutNFSe.Text      := ExtAutNFSe;
          edExtCancNFSe.Text     := ExtCancNFSe;
          edExtInutNFSe.Text     := ExtInutNFSe;
          Result := true;
        end;
      end;
    except

    end;
  finally
  end;
end;

function TfoConfiguracao.CarregaIniFile: Boolean;
var wFilePathIni : string;
begin
if fOpenFileName(['*.*ini'],['INI FIle'],wFilePathIni,'Localiza o INI File') then
 begin
  edUsuarioBD.Text       := 'sysdba';
  edSenhaBD.Text         := 'masterkey';
  edArquivo.Text         := '';
  edDescriConfig.Text    := fNomePC;
  //Aba Configura NFe
  edNFePathSend.Text     := getINI(wFilePathIni,'NFe','Caminho','');
  edNFePathReturn.Text   := getINI(wFilePathIni,'NFe','Retorno','');
  edPathRetEnvNFe.Text   := getINI(wFilePathIni,'NFe','Dir_RetornoEnv','');
  edPathRetCancNFe.Text  := getINI(wFilePathIni,'NFe','Dir_RetornoCanc','');
  edPathRetInutNFe.Text  := getINI(wFilePathIni,'NFe','Dir_RetornoInut','');
  edExtAutNFe.Text       := getINI(wFilePathIni,'NFe','Ext_Autorizacao','');
  edExtCancNFe.Text      := getINI(wFilePathIni,'NFe','Ext_Cancelamento','');
  edExtInutNFe.Text      := getINI(wFilePathIni,'NFe','Ext_Inutilizacao','');
  //Aba Configura NFCe
  edNFCePathSend.Text    := getINI(wFilePathIni,'NFCe','Caminho','');
  edNFCePathReturn.Text  := getINI(wFilePathIni,'NFCe','Retorno','');
  edPathRetEnvNFCe.Text  := getINI(wFilePathIni,'NFCe','Dir_RetornoEnv','');
  edPathRetCancNFCe.Text := getINI(wFilePathIni,'NFCe','Dir_RetornoCanc','');
  edPathRetInutNFCe.Text := getINI(wFilePathIni,'NFCe','Dir_RetornoInut','');
  edExtAutNFCe.Text      := getINI(wFilePathIni,'NFCe','Ext_Autorizacao','');
  edExtCancNFCe.Text     := getINI(wFilePathIni,'NFCe','Ext_Cancelamento','');
  edExtInutNFCe.Text     := getINI(wFilePathIni,'NFCe','Ext_Inutilizacao','');
  //Aba Configura NFSe
  edNFSePathSend.Text    := getINI(wFilePathIni,'NFSe','Caminho','');
  edNFSePathReturn.Text  := getINI(wFilePathIni,'NFSe','Retorno','');
  edPathRetEnvNFSe.Text  := getINI(wFilePathIni,'NFSe','Dir_RetornoEnv','');
  edPathRetCancNFSe.Text := getINI(wFilePathIni,'NFSe','Dir_RetornoCanc','');
  edPathRetInutNFSe.Text := getINI(wFilePathIni,'NFSe','Dir_RetornoInut','');
  edExtAutNFSe.Text      := getINI(wFilePathIni,'NFSe','Ext_Autorizacao','');
  edExtCancNFSe.Text     := getINI(wFilePathIni,'NFSe','Ext_Cancelamento','');
  edExtInutNFSe.Text     := getINI(wFilePathIni,'NFSe','Ext_Inutilizacao','');
 end;
end;

function TfoConfiguracao.CarregaConfig(pTab : TConfiguracoes; pIdUsuario : integer;
 pDescriConfig : string): Boolean;
begin
  Result := false;
  try
    try
      pTab.DescriConfig :=  pDescriConfig;
      pTab.IDusuario    := pIdUsuario;
      with pTab do
      begin

        daoConfiguracoes.fCarregaConfiguracoes(pTab, ['idusuario','DescriConfig']);

        with tabConfiguracoes do
        begin
          edUsuarioBD.Text       := UsuarioBD;
          edSenhaBD.Text         := SenhaBD;
          edArquivo.Text         := PathBD+'\'+NameBD;
          //Aba Configura NFe
          edNFePathSend.Text     := NFePathSend;
          edNFePathReturn.Text   := NFePathReturn;
          edPathRetEnvNFe.Text   := PathRetEnvNFe;
          edPathRetCancNFe.Text  := PathRetCancNFe;
          edPathRetInutNFe.Text  := PathRetInutNFe;
          edExtAutNFe.Text       := ExtAutNFe;
          edExtCancNFe.Text      := ExtCancNFe;
          edExtInutNFe.Text      := ExtInutNFe;
          //Aba Configura NFCe
          edNFCePathSend.Text    := NFCePathSend;
          edNFCePathReturn.Text  := NFCePathReturn;
          edPathRetEnvNFCe.Text  := PathRetEnvNFCe;
          edPathRetCancNFCe.Text := PathRetCancNFCe;
          edPathRetInutNFCe.Text := PathRetInutNFCe;
          edExtAutNFCe.Text      := ExtAutNFCe;
          edExtCancNFCe.Text     := ExtCancNFCe;
          edExtInutNFCe.Text     := ExtInutNFCe;
          //Aba Configura NFSe
          edNFSePathSend.Text    := NFSePathSend;
          edNFSePathReturn.Text  := NFSePathReturn;
          edPathRetEnvNFSe.Text  := PathRetEnvNFSe;
          edPathRetCancNFSe.Text := PathRetCancNFSe;
          edPathRetInutNFSe.Text := PathRetInutNFSe;
          edExtAutNFSe.Text      := ExtAutNFSe;
          edExtCancNFSe.Text     := ExtCancNFSe;
          edExtInutNFSe.Text     := ExtInutNFSe;
          Result := true;
        end;
      end;
    except

    end;
  finally
  end;
end;

function TfoConfiguracao.CarregaConfig(pTab : TConfiguracoes ;
 pIdUsuario : integer): Boolean;
begin
  Result := false;
  try
    try
      pTab.ID :=  pIdUsuario;
      with pTab do
      begin
        if not Assigned(ptab) then
          daoConfiguracoes.fCarregaConfiguracoes(pTab, ['id']);

        with pTab do
        begin
          edUsuarioBD.Text       := UsuarioBD;
          edSenhaBD.Text         := SenhaBD;
          edArquivo.Text         := PathBD+'\'+NameBD;
          //Aba Configura NFe
          edNFePathSend.Text     := NFePathSend;
          edNFePathReturn.Text   := NFePathReturn;
          edPathRetEnvNFe.Text   := PathRetEnvNFe;
          edPathRetCancNFe.Text  := PathRetCancNFe;
          edPathRetInutNFe.Text  := PathRetInutNFe;
          edExtAutNFe.Text       := ExtAutNFe;
          edExtCancNFe.Text      := ExtCancNFe;
          edExtInutNFe.Text      := ExtInutNFe;
          //Aba Configura NFCe
          edNFCePathSend.Text    := NFCePathSend;
          edNFCePathReturn.Text  := NFCePathReturn;
          edPathRetEnvNFCe.Text  := PathRetEnvNFCe;
          edPathRetCancNFCe.Text := PathRetCancNFCe;
          edPathRetInutNFCe.Text := PathRetInutNFCe;
          edExtAutNFCe.Text      := ExtAutNFCe;
          edExtCancNFCe.Text     := ExtCancNFCe;
          edExtInutNFCe.Text     := ExtInutNFCe;
          //Aba Configura NFSe
          edNFSePathSend.Text    := NFSePathSend;
          edNFSePathReturn.Text  := NFSePathReturn;
          edPathRetEnvNFSe.Text  := PathRetEnvNFSe;
          edPathRetCancNFSe.Text := PathRetCancNFSe;
          edPathRetInutNFSe.Text := PathRetInutNFSe;
          edExtAutNFSe.Text      := ExtAutNFSe;
          edExtCancNFSe.Text     := ExtCancNFSe;
          edExtInutNFSe.Text     := ExtInutNFSe;
          edDescriConfig.Text    := DescriConfig;
          Result := true;
        end;
      end;
    except

    end;
  finally
  end;
end;

procedure TfoConfiguracao.edArquivoExit(Sender: TObject);
var bdPath, bdSource :string;
begin

  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathBD+'\'+NameBD <> Text then
    begin
      PathBD := ExtractFileDir(Trim(Text));
      NameBD := ExtractFileName(Trim(Text));
    end;

//    ShowHint := False;
//    if Length(Text) > 255  then
//      if CanFocus then
//      begin
//        Hint := 'Este campo pode ter no m�ximo 255 caracteres.';
//        ShowHint := true;
//        SetFocus;
//      end;

   if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;

  pgcConfig.TabIndex := 1;
end;

procedure TfoConfiguracao.edDescriConfigExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if DescriConfig <> Text then
    begin
      DescriConfig := Trim(Text);
    end;

    ShowHint := False;
    if Length(Text) > 20  then
      if CanFocus then
      begin
        Hint := 'Este campo pode ter no m�ximo 20 caracteres.';
        ShowHint := true;
        SetFocus;
      end;
  end;
end;

procedure TfoConfiguracao.edExtAutNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtAutNFCe <> Text then
    begin
      ExtAutNFCe := Trim(Text);
    end;
  end;
end;

procedure TfoConfiguracao.edExtAutNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtAutNFe <> Text then
    begin
      ExtAutNFe := Trim(Text);
    end;

  end;
end;

procedure TfoConfiguracao.edExtAutNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtAutNFSe <> Text then
    begin
      ExtAutNFSe := Trim(Text);
    end;
  end;
end;

procedure TfoConfiguracao.edExtCancNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtCancNFCe <> Text then
    begin
      ExtCancNFCe := Trim(Text);
    end;
  end;
end;

procedure TfoConfiguracao.edExtCancNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtCancNFe <> Text then
    begin
      ExtCancNFe := Trim(Text);
    end;
  end;
end;

procedure TfoConfiguracao.edExtCancNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtCancNFSe <> Text then
    begin
      ExtCancNFSe := Trim(Text);
    end;
  end;
end;

procedure TfoConfiguracao.edExtInutNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtInutNFCe <> Text then
    begin
      ExtInutNFCe := Trim(Text);
    end;
  end;

  pgcConfig.TabIndex := 3;
end;

procedure TfoConfiguracao.edExtInutNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtInutNFe <> Text then
    begin
      ExtInutNFe := Trim(Text);
    end;
  end;

  pgcConfig.TabIndex := 2;
end;

procedure TfoConfiguracao.edExtInutNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtInutNFSe <> Text then
    begin
      ExtInutNFSe := Trim(Text);
    end;
  end;

 pgcConfig.TabIndex := 0;
end;

procedure TfoConfiguracao.EditToTabela;
begin
  if NOT Assigned(tabConfiguracoes) then
    exit;

  with tabConfiguracoes do
  begin
   DescriConfig       := edDescriConfig.Text;
//   IDusuario
   UsuarioBD          := Trim(edUsuarioBD.Text);
   SenhaBD            := edSenhaBD.Text;
   PathBD             := ExtractFileDir(edArquivo.Text);
   NameBD             := ExtractFileName(edArquivo.Text);

   //Aba Configura NFe
   NFePathSend        := edNFePathSend.Text;
   NFePathReturn      := edNFePathReturn.Text;
   PathRetEnvNFe      := edPathRetEnvNFe.Text;
   PathRetCancNFe     := edPathRetCancNFe.Text;
   PathRetInutNFe     := edPathRetInutNFe.Text;
   ExtAutNFe          := edExtAutNFe.Text;
   ExtCancNFe         := edExtCancNFe.Text;
   ExtInutNFe         := edExtInutNFe.Text;
  //Aba Configura NFCe
   NFCePathSend       := edNFCePathSend.Text;
   NFCePathReturn     := edNFCePathReturn.Text;
   PathRetEnvNFCe     := edPathRetEnvNFCe.Text;
   PathRetCancNFCe    := edPathRetCancNFCe.Text;
   PathRetInutNFCe    := edPathRetInutNFCe.Text;
   ExtAutNFCe         := edExtAutNFCe.Text;
   ExtCancNFCe        := edExtCancNFCe.Text;
   ExtInutNFCe        := edExtInutNFCe.Text;
  //Aba Configura NFSe
   NFSePathSend       := edNFSePathSend.Text;
   NFSePathReturn     := edNFSePathReturn.Text;
   PathRetEnvNFSe     := edPathRetEnvNFSe.Text;
   PathRetCancNFSe    := edPathRetCancNFSe.Text;
   PathRetInutNFSe    := edPathRetInutNFSe.Text;
   ExtAutNFSe         := edExtAutNFSe.Text;
   ExtCancNFSe        := edExtCancNFSe.Text;
   ExtInutNFSe        := edExtInutNFSe.Text;
  end;
end;

procedure TfoConfiguracao.edNFCePathReturnExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if NFCePathReturn <> Text then
    begin
      NFCePathReturn := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edNFCePathSendExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if NFCePathSend <> Text then
    begin
      NFCePathSend := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edNFePathReturnExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if NFePathReturn <> Text then
    begin
      NFePathReturn := Trim(Text);
    end;

//    ShowHint := False;
//    if Length(Text) > 255  then
//      if CanFocus then
//      begin
//        Hint := 'Este campo pode ter no m�ximo 255 caracteres.';
//        ShowHint := true;
//        SetFocus;
//      end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edNFePathSendExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if NFePathSend <> Text then
    begin
      NFePathSend := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edNFSePathReturnExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if NFSePathReturn <> Text then
    begin
      NFSePathReturn := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edNFSePathSendExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if NFSePathSend <> Text then
    begin
      NFSePathSend := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetCancNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetCancNFCe <> Text then
    begin
      PathRetCancNFCe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetCancNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetCancNFe <> Text then
    begin
      PathRetCancNFe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetCancNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetCancNFSe <> Text then
    begin
      PathRetCancNFSe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetEnvNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetEnvNFCe <> Text then
    begin
      PathRetEnvNFCe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetEnvNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetEnvNFe <> Text then
    begin
      PathRetEnvNFe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetEnvNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetEnvNFSe <> Text then
    begin
      PathRetEnvNFSe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetInutNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetInutNFCe <> Text then
    begin
      PathRetInutNFCe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetInutNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetInutNFe <> Text then
    begin
      PathRetInutNFe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edPathRetInutNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if PathRetInutNFSe <> Text then
    begin
      PathRetInutNFSe := Trim(Text);
    end;

    if (Trim(Text) <> '') and not (DirectoryExists(Trim(ExtractFileDir(Text)))) then
    if CanFocus then
    begin
      MsgStatus('Diret�rio informado n�o existe', clRed);
      SetFocus;
    end;
  end;
end;

procedure TfoConfiguracao.edSenhaBDExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if SenhaBD <> Text then
    begin
      SenhaBD := Trim(Text);
    end;

    ShowHint := False;
    if Length(Text) > 10  then
      if CanFocus then
      begin
        Hint := 'Este campo pode ter no m�ximo 10 caracteres.';
        ShowHint := true;
        SetFocus;
      end;
  end;
end;

procedure TfoConfiguracao.edUsuarioBDExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if UsuarioBD <> Text then
    begin
      UsuarioBD := Trim(Text);
    end;

    ShowHint := False;
    if Length(Text) > 15  then
      if CanFocus then
      begin
        Hint := 'Este campo pode ter no m�ximo 15 caracteres.';
        ShowHint := true;
        SetFocus;
      end;
  end;
end;

procedure TfoConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TfoConfiguracao.FormCreate(Sender: TObject);
begin
  if not Assigned(tabConfiguracoes) then
    tabConfiguracoes := TConfiguracoes.Create;


  pgcConfig.TabIndex := 0;
  //validacampos(foConfiguracao);

end;

procedure TfoConfiguracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{// key down                                    }
  if (Shift = [ssCtrl]) and (key = vk_return) then
  begin
    btnAplicarClick(Self);
    btnOKClick(Self);
  end;
   //ShowMessage('Voce apertou Crtl + Enter');
end;

procedure TfoConfiguracao.FormKeyPress(Sender: TObject; var Key: Char);
begin
{//Key press
if (key = #10) then
ShowMessage('Voce apertou Crtl + Enter');
}
  if key = #13 then  //Enter
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;


//  if Key = #27 then    //ESC
//  begin
//    case wOpe of
//      opExcluir,
//      opAlterar,
//      opInserir: begin
//                   if (MessageDlg('Deseja canselar a opera��o?', mtConfirmation, mbYesNo,0) = mrYes) then
//                     daoConfiguracoes.fCarregaConfiguracoes(tabConfiguracoes,['id']);
//                 end;
//
//    end;
//  end;
end;

procedure TfoConfiguracao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{// key up
if (Shift = [ssCtrl]) and (key = vk_return) then
ShowMessage('Voce apertou Crtl + Enter');}
  if key = VK_ESCAPE then
  begin
    if MessageDlg('Deseja cancelar a opera��o de inserir', mtConfirmation, mbYesNo,0) = mrNo then
    begin
       case wOpe of
        opInserir: begin

                   end;

        opAlterar: begin


                   end;

       end;
    end
    else
     ModalResult := mrCancel;

  end;

end;

procedure TfoConfiguracao.FormShow(Sender: TObject);
begin
  LimpaCampos(foConfiguracao);
  pgcConfig.TabIndex := 0;
  case wOpe of
    opInserir: FormShowInserir;
    opAlterar: FormShowAlterar;
  end;

end;

procedure TfoConfiguracao.FormShowAlterar;
begin

  btnOK.Enabled := not (CarregaConfig(tabConfiguracoes,tabConfiguracoes.Id));
end;

procedure TfoConfiguracao.FormShowDeletar;
begin

end;

procedure TfoConfiguracao.FormShowInserir;
begin
   if edDescriConfig.CanFocus then
   begin
     edDescriConfig.SetFocus;
   end;
end;

procedure TfoConfiguracao.LerParametros;
begin
  if FileExists(fArqIni) then
  begin
    edUsuarioBD.Text := getINI(fArqIni, 'BD', 'USUARIO', '');
    edSenhaBD.Text   := getINI(fArqIni, 'BD', 'SENHA', '');
    edArquivo.Text   := getINI(fArqIni, 'BD', 'ARQUIVO', '');
    IDConfig         := StrToIntDef (getINI(fArqIni, 'Config','id', ''),0);
  end;
end;

function TfoConfiguracao.LimpaCampos(pForm: TForm): boolean;
var i: Integer;
begin
   result := false;

  if not Assigned(pForm) then
  exit;

  for i:= 0 to pForm.ComponentCount-1 do  //Percorre todos os componentes da tela
  begin
    if pForm.Components[i] is TLabeledEdit then
      TLabeledEdit(pForm.Components[i]).Clear;
  end;

  result := true;
end;

procedure TfoConfiguracao.mniAjustarconfiguraopadro1Click(Sender: TObject);
begin

  foConfigPadrao := TfoConfigPadrao.Create(Application);
  try
    wOpe := opAlterar;
    daoConfigPadrao.fCarregaConfigPadrao(tabConfigPadrao,['id']);
    TabelaToEdit;
    foConfigPadrao.ShowModal;

  finally
    foConfigPadrao.Free;
  end;
end;

procedure TfoConfiguracao.MsgStatus(pMsg: string; pCor: TColor);
begin
  statMSg.Font.Color := pCor;
  statMSg.Panels[1].Text := Trim(pMsg);
end;

procedure TfoConfiguracao.pEnableConfig(pForm : TForm; pEnable: boolean);
var i : integer;
begin
  if not Assigned(pForm) then
    exit;

  for i:= 0 to pForm.ComponentCount-1 do
  begin
    if pForm.Components[i] is TTabSheet then
      TTabSheet(pForm.Components[i]).Enabled := pEnable;
  end;
end;

//function TfoConfiguracao.pOpenFileName(var prFileName:string): Boolean;
//begin
//  dlgOpenDir := TOpenDialog.Create(Application);
//  try
//     Result := dlgOpenDir.Execute;
//     if Result then
//       prFileName := dlgOpenDir.FileName
//     else
//       prFileName := '';
//  finally
//    dlgOpenDir.Free;
//  end;
//end;

//function TfoConfiguracao.pOpenPath(var prDirectory: string): Boolean;
//begin
//  Result := false;
//  jopdOpenDir := TJvSelectDirectory.Create(Application);
//  try
//     Result := jopdOpenDir.Execute;
//     if Result then
//       prDirectory := jopdOpenDir.Directory
//     else
//       prDirectory := '';
//  finally
//    jopdOpenDir.Free;
//  end;
//end;

procedure TfoConfiguracao.SalvarParametros;
var
 wINI : string;
begin
  wINI := ExtractFileName(ChangeFileExt(Application.ExeName, 'INI'));
  wINI := GetCurrentDir +'\'+wIni;
  setINI(wINI, 'BD', 'USUARIO', Trim(edUsuarioBD.Text));
  setINI(wINI, 'BD', 'SENHA', Trim(edSenhaBD.Text));
  setINI(wINI, 'BD', 'ARQUIVO', Trim(edArquivo.Text));
end;

procedure TfoConfiguracao.TabelaToEdit;
begin
  LimpaCampos(foConfiguracao);
  with tabConfiguracoes do
  begin
    edUsuarioBD.Text       := UsuarioBD;
    edSenhaBD.Text         := SenhaBD;
    edArquivo.Text         := PathBD+'\'+NameBD;
    //Aba Configura NFe
    edNFePathSend.Text     := NFePathSend;
    edNFePathReturn.Text   := NFePathReturn;
    edPathRetEnvNFe.Text   := PathRetEnvNFe;
    edPathRetCancNFe.Text  := PathRetCancNFe;
    edPathRetInutNFe.Text  := PathRetInutNFe;
    edExtAutNFe.Text       := ExtAutNFe;
    edExtCancNFe.Text      := ExtCancNFe;
    edExtInutNFe.Text      := ExtInutNFe;
    //Aba Configura NFCe
    edNFCePathSend.Text    := NFCePathSend;
    edNFCePathReturn.Text  := NFCePathReturn;
    edPathRetEnvNFCe.Text  := PathRetEnvNFCe;
    edPathRetCancNFCe.Text := PathRetCancNFCe;
    edPathRetInutNFCe.Text := PathRetInutNFCe;
    edExtAutNFCe.Text      := ExtAutNFCe;
    edExtCancNFCe.Text     := ExtCancNFCe;
    edExtInutNFCe.Text     := ExtInutNFCe;
    //Aba Configura NFSe
    edNFSePathSend.Text    := NFSePathSend;
    edNFSePathReturn.Text  := NFSePathReturn;
    edPathRetEnvNFSe.Text  := PathRetEnvNFSe;
    edPathRetCancNFSe.Text := PathRetCancNFSe;
    edPathRetInutNFSe.Text := PathRetInutNFSe;
    edExtAutNFSe.Text      := ExtAutNFSe;
    edExtCancNFSe.Text     := ExtCancNFSe;
    edExtInutNFSe.Text     := ExtInutNFSe;
  end;
end;

function TfoConfiguracao.validacampos(pForm : TForm): boolean;
var i,tabIdx,iTab : Integer;
    NameLabel, NameComp : string;
begin
   result := True;

  if not Assigned(pForm) then
  exit;

  for i:= 0 to pForm.ComponentCount-1 do  //Percorre todos os componentes da tela
  begin
//    NameComp := (pForm.Components[i]).
    if pForm.Components[i] is TTabSheet then  // Verifica se� TabSheet
    begin
      tabIdx := TTabSheet(pForm.Components[i]).TabIndex;  //Salva o tab order
      iTab := i;                                         //Salva o index da tab atual
    end;

    if pForm.Components[i] is TLabeledEdit then
      if Trim(TLabeledEdit(pForm.Components[i]).Text) = '' then
      begin
        if pForm.Components[iTab] is TTabSheet then
        begin
          pgcConfig.TabIndex := tabIdx;
//          if TTabSheet(pForm.Components[iTab]).CanFocus then
//            begin
//              TTabSheet(pForm.Components[iTab]).SetFocus;
              if TLabeledEdit(pForm.Components[i]).CanFocus then
              begin
                NameLabel :=  TLabeledEdit(pForm.Components[i]).EditLabel.Caption;
                MsgStatus('O Campo '+ NameLabel + ' est� vazio!', clRed);
//                ShowMessage('O Campo '+ NameLabel + ' est� vazio!' );
                TLabeledEdit(pForm.Components[i]).SetFocus;
                result := False;
                Break;

              end;
//            end;
        end;
      end
    else
    result := true;

  end;

  if result then
     MsgStatus('Valida��o OK', clBlack);

end;

end.