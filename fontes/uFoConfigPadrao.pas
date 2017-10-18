unit uFoConfigPadrao;

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
  Vcl.Menus;

type

  TfoConfigPadrao = class(TForm)
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
    btn3: TToolButton;
    jopdOpenDir: TJvSelectDirectory;
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
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
    function validacampos(pForm : TForm): boolean;
    function LimpaCampos(pForm : TForm): boolean;
    procedure SalvarParametros;
    procedure AlteraEditaExcluiConfig;
    procedure LerParametros;
    procedure MsgStatus(pMsg : string; pCor : TColor = clBlack);
    function CarregaConfig(pTab : TConfigPadrao): Boolean; overload;
    procedure FormShowAlterar;
    procedure FormShowInserir;
    procedure FormShowDeletar;

//    function fOpenFileName(pFilter: array of string; pFilterName: array of string;var prFileName:string;pTitle : string = ''): Boolean;
//    function fOpenPath(var prDirectory: string; pTitle : string = ''): Boolean;
    procedure pEnableConfig(pForm : TForm;pEnable: boolean);
    function fCriarConfigPadrao:Boolean;
    procedure EditToTabela;
    procedure TabelaToEdit;
  public
    { Public declarations }
    FUsuarios : TUsuarios;
    ConfigId : integer;
    LastId   : integer;
  published
   property Usuarios : TUsuarios read FUsuarios write FUsuarios;
  end;

var
  foConfigPadrao : TfoConfigPadrao;
  wPathAux: string;
  SavStr : String;
implementation


{$R *.dfm}

procedure TfoConfigPadrao.AlteraEditaExcluiConfig;
begin
  if wOpe = opNil then
    exit;

  with daoConfigPadrao, tabConfigPadrao do
  begin
    case wOpe of
      opExcluir: begin
                   if MessageDlg('Deseja excluir a configura��o '+ DescriConfig, mtConfirmation, mbYesNo,0) = mrYes then
                     if fExcluirConfigPadrao(tabConfigPadrao) then
                     begin
                       statMSg.Panels[1].Text := 'Deletado!';
                       ModalResult := mrOK;
                       wOpe := opOK;
                     end;
                  end;

      opAlterar: begin
                   if fSalvarConfigPadrao(tabConfigPadrao) then
                   begin
                     statMSg.Panels[1].Text := 'Salvo!';
                     ModalResult := mrOK;
                     wOpe := opOK;
                   end;
                 end;

      opInserir: begin

                   if fInserirConfigPadrao(tabConfigPadrao) > 0 then
                   begin
                     statMSg.Panels[1].Text := 'Novo registo!';
                     ModalResult := mrOK;
                     wOpe := opOK;
                   end;
                 end;
    end;
  end;
end;

procedure TfoConfigPadrao.btn1Click(Sender: TObject);
begin
  if CarregaConfig(tabConfigpadrao) then
    MsgStatus('Configura��o Padr�o', clRed);
end;

procedure TfoConfigPadrao.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfoConfigPadrao.btn3Click(Sender: TObject);
begin
  LimpaCampos(foConfigPadrao);
  fCriarConfigPadrao;
end;

procedure TfoConfigPadrao.btnAplicarClick(Sender: TObject);
begin
  if Validacampos(foConfigPadrao) then
  begin
    AlteraEditaExcluiConfig;
  end;
end;

procedure TfoConfigPadrao.btnOKClick(Sender: TObject);
begin

  if wOpe = opOK then
     ModalResult := mrOk
end;

procedure TfoConfigPadrao.btnEditarClick(Sender: TObject);
begin
  pgcConfig.Enabled := true;
  pnlRodape.Enabled := false;
  statMSg.Panels[1].Text := 'Alterando!';

end;

procedure TfoConfigPadrao.btnExcluirClick(Sender: TObject);
begin
  wOpe := opExcluir;
  pEnableConfig(foConfigPadrao, false);
end;

procedure TfoConfigPadrao.btnGetDirBancoClick(Sender: TObject);
begin
  if fOpenFileName(['*.*fdb','*.*gbd'],['Firebird', 'Interbase'], wPathAux, 'Aponte o seu banco de dados') then
 begin
   edArquivo.Text := wPathAux;
   tabConfiguracoes.PathBD := wPathAux;
 end;
end;

procedure TfoConfigPadrao.btnInserirClick(Sender: TObject);
begin
  statMSg.Panels[1].Text := 'Inserindo!';
end;


procedure TfoConfigPadrao.btnOpen1Click(Sender: TObject);
begin
 if fOpenPath(wPathAux) then
 begin
   edNFePathSend.Text := wPathAux;
   tabConfiguracoes.NFePathSend := wPathAux;
 end;
end;

procedure TfoConfigPadrao.btnOpen2Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFePathReturn.Text := wPathAux;
    tabConfiguracoes.NFePathReturn := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpen3Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetEnvNFe.Text := wPathAux;
    tabConfiguracoes.PathRetEnvNFe := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpen4Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetCancNFe.Text := wPathAux;
    tabConfiguracoes.PathRetCancNFe := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpen5Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetInutNFe.Text := wPathAux;
    tabConfiguracoes.PathRetInutNFe := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFCe1Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFCePathSend.Text := wPathAux;
    tabConfiguracoes.NFCePathSend := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFCe2Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFCePathReturn.Text := wPathAux;
    tabConfiguracoes.NFCePathReturn := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFCe3Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetEnvNFCe.Text := wPathAux;
    tabConfiguracoes.PathRetEnvNFCe := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFCe4Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetCancNFCe.Text := wPathAux;
    tabConfiguracoes.PathRetCancNFCe := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFCe5Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetInutNFCe.Text := wPathAux;
    tabConfiguracoes.PathRetInutNFCe := wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFSe1Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFSePathSend.Text := wPathAux;
    tabConfiguracoes.NFSePathSend:= wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFSe2Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edNFSePathReturn.Text := wPathAux;
    tabConfiguracoes.NFSePathReturn:= wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFSe3Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetEnvNFSe.Text := wPathAux;
    tabConfiguracoes.PathRetEnvNFSe:= wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFSe4Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetCancNFSe.Text := wPathAux;
    tabConfiguracoes.PathRetCancNFSe:= wPathAux;
  end;
end;

procedure TfoConfigPadrao.btnOpenNFSe5Click(Sender: TObject);
begin
  if fOpenPath(wPathAux) then
  begin
    edPathRetInutNFSe.Text := wPathAux;
    tabConfiguracoes.PathRetInutNFSe:= wPathAux;
  end;
end;

function TfoConfigPadrao.CarregaConfig(pTab: TConfigPadrao): Boolean;
begin
  Result := false;
  try
    try
      pTab.IDusuario := 0;
      with pTab do
      begin
        daoConfigPadrao.fCarregaConfigPadrao(pTab, ['id']);
        TabelaToEdit;
        Result := true;
      end;
    except

    end;
  finally
  end;
end;


procedure TfoConfigPadrao.edArquivoExit(Sender: TObject);
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

procedure TfoConfigPadrao.edDescriConfigExit(Sender: TObject);
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

procedure TfoConfigPadrao.edExtAutNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtAutNFCe <> Text then
    begin
      ExtAutNFCe := Trim(Text);
    end;
  end;
end;

procedure TfoConfigPadrao.edExtAutNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtAutNFe <> Text then
    begin
      ExtAutNFe := Trim(Text);
    end;

  end;
end;

procedure TfoConfigPadrao.edExtAutNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtAutNFSe <> Text then
    begin
      ExtAutNFSe := Trim(Text);
    end;
  end;
end;

procedure TfoConfigPadrao.edExtCancNFCeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtCancNFCe <> Text then
    begin
      ExtCancNFCe := Trim(Text);
    end;
  end;
end;

procedure TfoConfigPadrao.edExtCancNFeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtCancNFe <> Text then
    begin
      ExtCancNFe := Trim(Text);
    end;
  end;
end;

procedure TfoConfigPadrao.edExtCancNFSeExit(Sender: TObject);
begin
  with tabConfiguracoes, TLabeledEdit(Sender) do
  begin
    if ExtCancNFSe <> Text then
    begin
      ExtCancNFSe := Trim(Text);
    end;
  end;
end;

procedure TfoConfigPadrao.edExtInutNFCeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edExtInutNFeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edExtInutNFSeExit(Sender: TObject);
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

procedure TfoConfigPadrao.EditToTabela;
begin
  if NOT Assigned(tabConfigpadrao) then
    exit;

  with tabConfigpadrao do
  begin
   UsuarioBD          := edUsuarioBD.Text;
   SenhaBD            := edSenhaBD.Text;
   PathBD             := ExtractFileDir(edArquivo.Text);
   NameBD            := ExtractFileName(edArquivo.Text);
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

procedure TfoConfigPadrao.edNFCePathReturnExit(Sender: TObject);
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

procedure TfoConfigPadrao.edNFCePathSendExit(Sender: TObject);
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

procedure TfoConfigPadrao.edNFePathReturnExit(Sender: TObject);
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

procedure TfoConfigPadrao.edNFePathSendExit(Sender: TObject);
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

procedure TfoConfigPadrao.edNFSePathReturnExit(Sender: TObject);
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

procedure TfoConfigPadrao.edNFSePathSendExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetCancNFCeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetCancNFeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetCancNFSeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetEnvNFCeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetEnvNFeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetEnvNFSeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetInutNFCeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetInutNFeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edPathRetInutNFSeExit(Sender: TObject);
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

procedure TfoConfigPadrao.edSenhaBDExit(Sender: TObject);
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

procedure TfoConfigPadrao.edUsuarioBDExit(Sender: TObject);
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

function TfoConfigPadrao.fCriarConfigPadrao: Boolean;
var
  dirAux, dirBD, dirEnvio, dirRetorno, dirRetEnv, dirRetCan, dirRetInu :string;

 procedure DiretorioBD;
 begin

  pgcConfig.TabIndex :=  tsConfigBD.TabIndex;
  edDescriConfig.Text    := fNomePC;
  edUsuarioBD.Text       := 'sysdba';
  edSenhaBD.Text         := 'masterkey';
  //    pOpenFileName(['*.fdb'],['Firebird'], dirAux, 'Aponte o seu banco de dados');
  dirBD := dirAux+'\bd';
  if not DirectoryExists(dirBD) then
    ForceDirectories(dirBD);

  edArquivo.Text := dirBD;
 end;

 procedure DiretorioNFE;
 begin
   with tabConfigpadrao do
   begin
      pgcConfig.TabIndex := tsConfigNFe.TabIndex;
     //Aba Configura NFe
     ExtAutNFe := 'retsai_*.txt';
     edExtAutNFe.Text  := ExtAutNFe;

     edExtCancNFe.Text :=  'retcan_*.txt';
     edExtInutNFe.Text :=  'retinut_*.txt';

     dirEnvio := dirAux +'\NFe\Envio';
     if not DirectoryExists(dirEnvio) then
       ForceDirectories(dirEnvio);

     edNFePathSend.Text := dirEnvio;

     dirRetorno := dirAux +'\NFe\Retorno';
     if not DirectoryExists(dirRetorno) then
       ForceDirectories(dirRetorno);

     edNFePathReturn.Text   := dirRetorno;

     dirRetEnv := dirRetorno +'\Enviado';
      if not DirectoryExists(dirRetEnv) then
        ForceDirectories(dirRetEnv);

      edPathRetEnvNFe.Text := dirRetEnv;

     dirRetCan := dirRetorno +'\Cancelado';
     if not DirectoryExists(dirRetCan) then
       ForceDirectories(dirRetCan);

     edPathRetCancNFe.Text := dirRetCan;

     dirRetInu := dirRetorno +'\Inutilizado';
     if not DirectoryExists(dirRetInu) then
       ForceDirectories(dirRetInu);

     edPathRetInutNFe.Text := dirRetInu;
   end;
 end;

 procedure DiretorioNFCE;
 begin
    pgcConfig.TabIndex := tsConfigNFCe.TabIndex;
   //Aba Configura NFCe
   edExtAutNFCe.Text  :=  'retsai_*.txt';
   edExtCancNFCe.Text :=  'retcan_*.txt';
   edExtInutNFCe.Text :=  'retinut_*.txt';

   dirEnvio := dirAux +'\NFCe\Envio';
   if not DirectoryExists(dirEnvio) then
     ForceDirectories(dirEnvio);

   edNFCePathSend.Text := dirEnvio;

   dirRetorno := dirAux +'\NFCe\Retorno';
   if not DirectoryExists(dirRetorno) then
     ForceDirectories(dirRetorno);

   edNFCePathReturn.Text   := dirRetorno;

   dirRetEnv := dirRetorno +'\Enviado';
    if not DirectoryExists(dirRetEnv) then
     ForceDirectories(dirRetEnv);

   edPathRetEnvNFCe.Text := dirRetEnv;

   dirRetCan := dirRetorno +'\Cancelado';
   if not DirectoryExists(dirRetCan) then
     ForceDirectories(dirRetCan);

   edPathRetCancNFCe.Text := dirRetCan;

   dirRetInu := dirRetorno +'\Inutilizado';
   if not DirectoryExists(dirRetInu) then
     ForceDirectories(dirRetInu);

   edPathRetInutNFCe.Text := dirRetInu;
 end;

 procedure DiretorioNFSE;
 begin
    pgcConfig.TabIndex := tsConfigNFe.TabIndex;
   //Aba Configura NFSe
   edExtAutNFSe.Text  :=  'retsai_*.txt';
   edExtCancNFSe.Text :=  'retcan_*.txt';
   edExtInutNFSe.Text :=  'retinut_*.txt';

   dirEnvio := dirAux +'\NFSe\Envio';
   if not DirectoryExists(dirEnvio) then
     ForceDirectories(dirEnvio);

   edNFSePathSend.Text := dirEnvio;

   dirRetorno := dirAux +'\NFSe\Retorno';
   if not DirectoryExists(dirRetorno) then
     ForceDirectories(dirRetorno);

   edNFSePathReturn.Text := dirRetorno;

   dirRetEnv := dirRetorno +'\Enviado';
    if not DirectoryExists(dirRetEnv) then
     ForceDirectories(dirRetEnv);

   edPathRetEnvNFSe.Text := dirRetEnv;

   dirRetCan := dirRetorno +'\Cancelado';
   if not DirectoryExists(dirRetCan) then
     ForceDirectories(dirRetCan);

   edPathRetCancNFSe.Text := dirRetCan;

   dirRetInu := dirRetorno +'\Inutilizado';
   if not DirectoryExists(dirRetInu) then
     ForceDirectories(dirRetInu);

   edPathRetInutNFSe.Text := dirRetInu;
end;

begin
  fOpenPath(dirAux,'Informe o diret�rio padr�o');

  if not DirectoryExists(dirAux) then
   if ForceDirectories(dirAux) then
     ShowMessage('GetLastError : '+ IntToStr(GetLastError));

  DiretorioBD;
  DiretorioNFE;
  DiretorioNFCE;
  DiretorioNFSE;
  EditToTabela;
end;

procedure TfoConfigPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TfoConfigPadrao.FormCreate(Sender: TObject);
begin
  if not Assigned(tabConfigpadrao) then
    tabConfigpadrao := TConfigPadrao.Create;

  pgcConfig.TabIndex := 0;
end;

procedure TfoConfigPadrao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfoConfigPadrao.FormKeyPress(Sender: TObject; var Key: Char);
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

end;

procedure TfoConfigPadrao.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfoConfigPadrao.FormShow(Sender: TObject);
begin
  LimpaCampos(foConfigPadrao);
  pgcConfig.TabIndex := 0;
  wOpe := opAlterar;
  FormShowAlterar;

end;

procedure TfoConfigPadrao.FormShowAlterar;
begin
  if not (CarregaConfig(tabConfigpadrao)) then
  begin
    MsgStatus('Configura��o padr�oa n�o foi defina', clBlue);
    wOpe := opInserir;
    FormShowInserir;
  end;
end;

procedure TfoConfigPadrao.FormShowDeletar;
begin

end;

procedure TfoConfigPadrao.FormShowInserir;
begin
   if edDescriConfig.CanFocus then
   begin
     edDescriConfig.SetFocus;
   end;
end;

procedure TfoConfigPadrao.LerParametros;
begin
  if FileExists(fArqIni) then
  begin
    edUsuarioBD.Text := getINI(fArqIni, 'BD', 'USUARIO', '');
    edSenhaBD.Text   := getINI(fArqIni, 'BD', 'SENHA', '');
    edArquivo.Text   := getINI(fArqIni, 'BD', 'ARQUIVO', '');
  end;
end;

function TfoConfigPadrao.LimpaCampos(pForm: TForm): boolean;
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

procedure TfoConfigPadrao.mniAjustarconfiguraopadro1Click(Sender: TObject);
begin

  foConfigPadrao := TfoConfigPadrao.Create(Application);
  try
    wOpe := opAlterar;
    daoConfigPadrao.fCarregaConfigPadrao(tabConfigPadrao,['id']);
    foConfigPadrao.ShowModal;

  finally
    foConfigPadrao.Free;
  end;
end;

procedure TfoConfigPadrao.MsgStatus(pMsg: string; pCor: TColor);
begin
  statMSg.Font.Color := pCor;
  statMSg.Panels[1].Text := Trim(pMsg);
end;

procedure TfoConfigPadrao.pEnableConfig(pForm : TForm; pEnable: boolean);
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

//function TfoConfigPadrao.pOpenFileName(pFilter: array of string;
//pFilterName: array of string;var prFileName:string;pTitle : string = ''): Boolean;
//var auxFilter, auxFilterName : string;
//    i : Integer;
// begin
//  dlgOpenDir := TOpenDialog.Create(Application);
//  try
//     dlgOpenDir.Filter :='';
//     for I := Low(pFilter) to High(pFilter) do
//     begin
//       dlgOpenDir.Filter := pFilterName[i] + '|' + pFilter[i]+'|';
//     end;
//
//     dlgOpenDir.FilterIndex := 0;
//     dlgOpenDir.Title := pTitle;
//     Result := dlgOpenDir.Execute;
//
//     if Result then
//       prFileName := dlgOpenDir.FileName
//     else
//       prFileName := '';
//  finally
//    dlgOpenDir.Free;
//  end;
//end;

//function TfoConfigPadrao.fOpenPath(var prDirectory: string; pTitle : string = ''): Boolean;
//begin
//  Result := false;
//  jopdOpenDir := TJvSelectDirectory.Create(Application);
//  jopdOpenDir.title := pTitle;
//
//  if prDirectory <> '' then
//    jopdOpenDir.InitialDir := prDirectory;
//
//  try
//     Result := jopdOpenDir.Execute;
//     if Result then
//       prDirectory := jopdOpenDir.Directory
//     else
//       prDirectory := '';
//  finally
//    dlgOpenDir.Free;
//  end;
//end;

procedure TfoConfigPadrao.SalvarParametros;
var
 wINI : string;
begin
  wINI := ExtractFileName(ChangeFileExt(Application.ExeName, 'INI'));
  wINI := GetCurrentDir +'\'+wIni;
  setINI(wINI, 'BD', 'USUARIO', Trim(edUsuarioBD.Text));
  setINI(wINI, 'BD', 'SENHA', Trim(edSenhaBD.Text));
  setINI(wINI, 'BD', 'ARQUIVO', Trim(edArquivo.Text));
end;

procedure TfoConfigPadrao.tabelaToEdit;
begin
  LimpaCampos(foConfigPadrao);
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
  end;

end;

function TfoConfigPadrao.validacampos(pForm : TForm): boolean;
var i,tabIdx,iTab : Integer;
    NameLabel, NameComp : string;

begin
   result := True;

  if not Assigned(pForm) then
  exit;

  for i:= 0 to pForm.ComponentCount-1 do                  //Percorre todos os componentes da tela
  begin
    if pForm.Components[i] is TTabSheet then              // Verifica se� TabSheet
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
            if TLabeledEdit(pForm.Components[i]).CanFocus then
            begin
              NameLabel :=  TLabeledEdit(pForm.Components[i]).EditLabel.Caption;
              MsgStatus('O Campo '+ NameLabel + ' est� vazio!', clRed);
              TLabeledEdit(pForm.Components[i]).SetFocus;
              result := False;
              Break;

            end;
        end;
      end
      else
       result := true;
  end;

  if result then
     MsgStatus('Valida��o OK', clBlack);

end;

end.