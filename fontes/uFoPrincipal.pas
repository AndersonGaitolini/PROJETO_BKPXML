unit uFoPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,uDMnfebkp,
  Vcl.StdCtrls, Vcl.ToolWin, FireDAC.Comp.Client, Lm_bkpdfe, Datasnap.DBClient, usuarios,
  uMetodosUteis, uPadraoCons, GerarClasse, ufoGerarClasse,System.DateUtils,
  FireDAC.Phys.Intf, FireDAC.Stan.Option, FireDAC.Stan.Intf, JvComponentBase,
  JvTrayIcon, IPPeerClient, REST.Backend.PushTypes, System.JSON,
  System.PushNotification, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Backend.BindSource, REST.Backend.PushDevice,System.TypInfo, Vcl.Buttons,uRotinas,
  Vcl.DBCtrls, Vcl.AppEvnts, JvBaseDlg, JvSelectDirectory;

type
  TOrdena = (ordCodigo, ordData, ordChave);

//type
//  TDBGrid = class(Vcl.DBGrids.TDBGrid)
//  private
//    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
//  end;

  TfoPrincipal = class(TForm)
    ilPrincipal: TImageList;
    tmrHora: TTimer;
    mmExpSelecao: TMenuItem;
    ilMenu: TImageList;
    pnlMenu: TPanel;
    edConfiguracao: TEdit;
    EvaAlertas: TFDEventAlerter;
    tiTryIcon: TJvTrayIcon;
    btnCarregaConfig: TSpeedButton;
    dlgSaveXML: TSaveDialog;
    mmExpTodos: TMenuItem;
    lbDataIni: TLabel;
    dtpDataFiltroINI: TDateTimePicker;
    lbDataFIm: TLabel;
    dtpDataFiltroFin: TDateTimePicker;
    lbConfig: TLabel;
    pmSelecionar: TPopupMenu;
    mmSelTodos: TMenuItem;
    mmSelTodosExportar: TMenuItem;
    mmDeletarTodos: TMenuItem;
    mmDelTodosSelecionados: TMenuItem;
    mmDescmarcarSelTodos: TMenuItem;
    pnlControles: TPanel;
    btnEnvioArq: TButton;
    btnEnvioLote: TButton;
    btnEnvioExt: TButton;
    btnXMLEnvioExtLote: TButton;
    btnCanEnvioLote: TButton;
    btnCanEnvioArq: TButton;
    btnCanEnvioExt: TButton;
    btnCanExetendLote: TButton;
    btnSIMULACAO: TButton;
    TrayIconBkpNfe: TTrayIcon;
    appEventBKPNFE: TApplicationEvents;
    FDEventAlerter1: TFDEventAlerter;
    pnlLegenda: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape17: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Shape4: TShape;
    Label1: TLabel;
    btnFiltrar: TButton;
    mmAcoes: TMenuItem;
    mmExpXMLPDFSelecao: TMenuItem;
    mmRefazAutorizacaoSelecao: TMenuItem;
    mmRefazAutorizacaoTodos: TMenuItem;
    mmLinhaGrupoRefaz: TMenuItem;
    mmLinhaGrupoDel: TMenuItem;
    mmN3: TMenuItem;
    mmMarcarTodos: TMenuItem;
    mmExpPDFSelecao: TMenuItem;
    mmExpPDFTodos: TMenuItem;
    mmLinhaGrupoExpPDF: TMenuItem;
    mmExpXMLPDFTodos: TMenuItem;
    mmConfigurar: TMenuItem;
    mmConfgDiretorios: TMenuItem;
    mmConfigUsaurios: TMenuItem;
    mmDelRefazAutTodos: TMenuItem;
    pmExportar: TPopupMenu;
    mmN1: TMenuItem;
    mniTrocarUsuario: TMenuItem;
    mniN1: TMenuItem;
    pnl1: TPanel;
    dbgNfebkp: TDBGrid;
    statPrincipal: TStatusBar;
    pmFiltroData: TPopupMenu;
    mmDataEmissao: TMenuItem;
    mmDataAlteracao: TMenuItem;
    mmDataRecebimento: TMenuItem;
    jopdDirDir: TJvSelectDirectory;
    dlgOpenPrinc: TOpenDialog;
    mmHabiltaLogs: TMenuItem;
    mmTodosArquivos: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mniConfigBDClick(Sender: TObject);
    procedure mniReconectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgNfebkpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mmGeraclasseClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure dbgNfebkpTitleClick(Column: TColumn);
    procedure btnInserirClick(Sender: TObject);
    procedure btnProcRetornoClick(Sender: TObject);
    procedure btnProcessaEnvioClick(Sender: TObject);
    procedure btnCarregaConfigClick(Sender: TObject);
    procedure dbgNfebkpDblClick(Sender: TObject);
    procedure btnPelaChaveClick(Sender: TObject);
    procedure mmExpTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgNfebkpColExit(Sender: TObject);
    procedure dbgNfebkpKeyPress(Sender: TObject; var Key: Char);
    procedure dbgNfebkpKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmSelTodosClick(Sender: TObject);
    procedure mmSelTodosExportarClick(Sender: TObject);
    procedure mmExpSelecaoClick(Sender: TObject);
    procedure mmDescmarcarSelTodosClick(Sender: TObject);
    procedure pmExportaPopup(Sender: TObject);
    procedure dbgNfebkpMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure pmSelecionarPopup(Sender: TObject);
    procedure mmDelTodosSelecionadosClick(Sender: TObject);
    procedure mmDeletarTodosClick(Sender: TObject);
    procedure btnEnvioArqClick(Sender: TObject);
    procedure btnEnvioLoteClick(Sender: TObject);
    procedure btnEnvioExtClick(Sender: TObject);
    procedure btnXMLEnvioExtLoteClick(Sender: TObject);
    procedure btnCanEnvioArqClick(Sender: TObject);
    procedure btnCanEnvioLoteClick(Sender: TObject);
    procedure btnCanEnvioExtClick(Sender: TObject);
    procedure btnCanExetendLoteClick(Sender: TObject);
    procedure btnSIMULACAOClick(Sender: TObject);
    procedure appEventBKPNFEMinimize(Sender: TObject);
    procedure TrayIconBkpNfeDblClick(Sender: TObject);
    procedure FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
      const AEventName: string; const AArgument: Variant);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmMarcarTodosClick(Sender: TObject);
    procedure mmRefazAutorizacaoTodosClick(Sender: TObject);
    procedure mmConfgDiretoriosClick(Sender: TObject);
    procedure mmDelRefazAutTodosClick(Sender: TObject);
    procedure mmRefazAutorizacaoSelecaoClick(Sender: TObject);
    procedure mniTrocarUsuarioClick(Sender: TObject);
    procedure mmConfigUsauriosClick(Sender: TObject);
    procedure dtpDataFiltroINIExit(Sender: TObject);
    procedure dtpDataFiltroINIKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpDataFiltroFinKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmFiltroDataPopup(Sender: TObject);
    procedure mmDataEmissaoClick(Sender: TObject);
    procedure mmDataAlteracaoClick(Sender: TObject);
    procedure mmDataRecebimentoClick(Sender: TObject);
    procedure mmTodosArquivosClick(Sender: TObject);
  private
    { Private declarations }
    wVisible: boolean;
    wFieldFiltros : TFieldFiltros;
    procedure pCarregaConfigUsuario(pIDConfig: Integer);
    procedure fFiltroEmissaoXML;
    procedure pDataFiltro;
    procedure pStatusBarProgress;
    procedure pSalveName(pFieldName: string; var wFileName: string);
    procedure pSelecaoChave(var pLista: TStringList);
    procedure pSelTodasLinhas;
    procedure pDeleteRowsSelectGrid;
    procedure pRemoveSelTodasLinhas;
    procedure pIniciaGrid;
    procedure pMenuFiltroData(pFieldFiltros : TFieldFiltros);

  public
    { Public declarations }

  published
    function OpenTabela:boolean;
  end;

var
  foPrincipal : TfoPrincipal;
  wLastColunm,AtualColunm,i  : Integer;
  wUpDown,
  wLastOrderBy: TOrdenaBy;
  wLoadXML : TLoadXML;
  SLXMLEnv :TStringList;
  wListaSelecionados : TStringList;

implementation

uses

uFoConsConfiguracao, uFoConfiguracao, Configuracoes, uFoXMLSimulacao, ufoLogin, uFoCadUsuario, uFoConsUsuario;

{$R *.dfm}

procedure TfoPrincipal.appEventBKPNFEMinimize(Sender: TObject);
begin
//  Self.Hide;
//  Self.WindowState := wsMinimized;
//  TrayIconBkpNfe.Visible := TRUE;
//  TrayIconBkpNfe.Animate := True;
end;

procedure TfoPrincipal.btnCarregaConfigClick(Sender: TObject);
begin
  foConsConfiguracoes := TfoConsConfiguracoes.Create(Application);
try
  with foConsConfiguracoes do
  begin
    Usuarios := tabUsuarios;
    evtTelaUsuarios := etuEditar;
    ShowModal;
  end;
  pCarregaConfigUsuario(tabConfiguracoes.Id);

finally
  FreeAndNil(foConsConfiguracoes);
end;
end;

procedure TfoPrincipal.btnCanEnvioArqClick(Sender: TObject);
var wFilename: string;
begin
  fOpenFile('Selecione o XML de Cancelamento', wFilename,['XML | *.*xml'],1);
  fLoadXMLNFe(tabConfiguracoes,txCan_, False, wFilename);
  btnFiltrarClick(Sender);
end;

procedure TfoPrincipal.btnCanEnvioExtClick(Sender: TObject);
var wFilename: string;
begin
  fOpenFile('Selecione o XML de Cancelamento processado', wFilename,['XML | *.*xml'],1);
  fLoadXMLNFe(tabConfiguracoes,txCan_Ext, False, wFilename);
  btnFiltrarClick(Sender);
end;

procedure TfoPrincipal.btnCanEnvioLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txCan_Lote, True);
  btnFiltrarClick(Sender);
end;

procedure TfoPrincipal.btnCanExetendLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txCan_ExtLote, True);
  btnFiltrarClick(Sender);
end;

procedure TfoPrincipal.btnEnvioArqClick(Sender: TObject);
var wFilename: string;
begin
  wFilename := 'Env_Nfe';
  fOpenFile('Selecione o XML de Envio', wFilename,['XML | *.*xml'],1);
  fLoadXMLNFe(tabConfiguracoes, txNFE_Env, false, wFilename);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnEnvioExtClick(Sender: TObject);
var wFilename: string;
begin
  wFilename := 'Env_Nfe';
  fOpenFile('Selecione o XML de Envio processado', wFilename,['XML | *.*xml'],1);
  fLoadXMLNFe(tabConfiguracoes,txNFe_EnvExt, False, wFilename);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnEnvioLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txNFE_EnvLote, True);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnFiltrarClick(Sender: TObject);
begin
  fFiltroEmissaoXML;
  dbgNfebkp.Refresh;
end;

procedure TfoPrincipal.btnInserirClick(Sender: TObject);
begin
  if not Assigned(tabConfiguracoes) then
    tabConfiguracoes := TConfiguracoes.Create;
end;

procedure TfoPrincipal.btnPelaChaveClick(Sender: TObject);
var wFilename: string;
begin
//  fOpenFileName(['XML | *.*xml'],['XML Arquivo | *.*xml'], wFilename,'Selecione o XML');
//  fLoadXMLNFe(tabConfiguracoes,[txTodos],false,wFilename);
//  pDataFiltro;
//  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnProcessaEnvioClick(Sender: TObject);
begin
//  if fLoadXMLNFe(tabConfiguracoes,[txNFE_EnvLote],True) then
//  begin
//   pDataFiltro;
//   DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date, '','');
//  end;
end;

procedure TfoPrincipal.btnProcRetornoClick(Sender: TObject);
begin
  if fLoadXMLNFe(tabConfiguracoes,txRet_Sai,True) then
  begin
    pDataFiltro;
    DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
  end;
end;

procedure TfoPrincipal.btnSIMULACAOClick(Sender: TObject);
var wProcess: integer;
begin
  foXMLSimulcao := TfoXMLSimulcao.Create(Application);
  try
    wProcess:= fNumProcessThreads;
    foXMLSimulcao.ShowModal;
    pDataFiltro;
    DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
    LastColunm := dbgNfebkp.SelectedIndex;
  finally
    foXMLSimulcao.Free;
  end;
end;

procedure TfoPrincipal.btnXMLEnvioExtLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txNFe_EnvExtLote, True);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');

end;

procedure TfoPrincipal.pCarregaConfigUsuario(pIDConfig: Integer);
begin
  if not Assigned(tabConfiguracoes) then
    tabConfiguracoes := TConfiguracoes.Create;

  tabConfiguracoes.id := pIDConfig;
  daoConfiguracoes.fCarregaConfiguracoes(tabConfiguracoes,['id']);

  edConfiguracao.Visible   := wVisible;
  lbConfig.Visible         := wVisible;
  btnCarregaConfig.Visible := wVisible;
  edConfiguracao.Text := tabConfiguracoes.DescriConfig;
end;

procedure TfoPrincipal.pDataFiltro;
var y,m,d: word;
begin
  DecodeDate(now,y,m,d);
  dtpDataFiltroINI.DateTime := EncodeDate(y,m,01);
  dtpDataFiltroFin.DateTime := EncodeDate(y,m,DaysInMonth(Now));
end;

procedure TfoPrincipal.pDeleteRowsSelectGrid;
begin
  if dbgNfebkp.SelectedRows.Count > 1 then
  begin
    if wListaSelecionados.Count = 0 then
      pSelecaoChave(wListaSelecionados);

    if MessageDlg('Voc� est� prestes a deletar '+ IntToStr(wListaSelecionados.Count) +' arquivos.'+#10#13+
                   'Confirma ?',
       mtConfirmation, [mbNo, mbYesToAll],0 )= mrYesToAll then
      if fDeleteObjetoXML(wListaSelecionados) then
        dbgNfebkp.Refresh;;
  end
  else
  if dbgNfebkp.SelectedRows.Count = 1 then
  begin
    if MessageDlg('Deseja excluir o XML selecionado ?', mtConfirmation, [mbNo, mbYes],0 ) = mrYes then
      if fDeleteObjetoXML(wListaSelecionados) then
        dbgNfebkp.Refresh;;
  end;
end;

procedure TfoPrincipal.pIniciaGrid;
begin
  with dbgNfebkp do
  begin
    Columns[i].Title.Color := 15391680; //clInfoBk;
    Columns[i].Title.Font.Color := clBlack;
    Columns[i].Title.Font.Name := 'Arial';
    Columns[i].Title.Font.Size  := 9;
    Columns[i].Title.Font.Style := [];
  end;
end;

procedure TfoPrincipal.pMenuFiltroData(pFieldFiltros: TFieldFiltros);

 procedure pCheck(pEmissao, pAlteracao, pReceb: boolean);
 begin
  mmDataEmissao.Checked     := pEmissao;
  mmDataAlteracao.Checked   := pAlteracao;
  mmDataRecebimento.Checked := pReceb;
  mmTodosArquivos.Checked   := (not(pEmissao) and not(pAlteracao) and (pReceb));
 end;
begin

  wFieldFiltros := pFieldFiltros;
  case pFieldFiltros of

       ffDATARECTO: pCheck(false, false, True);
     ffDATAEMISSAO: pCheck(true, false, false);
   ffDATAALTERACAO: pCheck(false, true, false);
  else
    pCheck(false, false, false);
  end;
end;

procedure TfoPrincipal.pmExportaPopup(Sender: TObject);
var wHabilita : boolean;

  procedure pMenuMaster(pAtiva : boolean);
  var i, j, k: integer;
  begin

      with TMainMenu(Sender) do
      begin
        for I := 0 to Items.Count-1 do
        begin
          if Items[i].Name = 'mmAcoes' then
          begin
            for j := 0 to TMainMenu(sender).Items[i].Count -1 do
            begin
               if TMainMenu(Sender).Items[i].Items[j].Tag = 2 then
               begin
                 TMainMenu(Sender).Items[i].Items[j].Enabled := pAtiva;
                 TMainMenu(Sender).Items[i].Items[j].Visible := pAtiva;
               end;
            end;
          end;

          if Items[i].Name = 'mmConfigurar' then
          begin
            Items[I].Enabled := pAtiva;
            Items[I].Visible := pAtiva;

            exit;
          end;

        end;
      end;

  end;

begin
  pSelecaoChave(wListaSelecionados);
  wVisible := fMaster(tabUsuarios);
  pCarregaConfigUsuario(tabUsuarios.ConfigSalva);
  pMenuMaster(wVisible);
end;

procedure TfoPrincipal.pmFiltroDataPopup(Sender: TObject);
var i, j, k: integer;
begin
  if True then


end;

procedure TfoPrincipal.pmSelecionarPopup(Sender: TObject);
//  var wI,wJ : Integer;
//      wSTR1,wSTR2 : String;
begin
//  wI := dbgNfebkp.SelectedRows.Count;
//  wJ := dbgNfebkp.DataSource.DataSet.RecordCount;
//  wSTR1 := IntToStr(wI);
//  wSTR2 := IntToStr(wJ);
//
//  if wI < 0 then
//  begin
//    mmSelTodos.Caption := 'Selecionar &todos ('+wSTR2+')';
//    mmSelTodosExportar.Caption := 'Selecionar todos e &exportar ('+wSTR2+')';
//  end;
end;

procedure TfoPrincipal.mmConfgDiretoriosClick(Sender: TObject);
begin
  foConsConfiguracoes := TfoConsConfiguracoes.Create(Application);
try
  evtTelaUsuarios := etuEditar;

  foConsConfiguracoes.Usuarios := tabUsuarios;
  foConsConfiguracoes.ShowModal;
  pCarregaConfigUsuario(tabUsuarios.ConfigSalva);
finally
  FreeAndNil(foConsConfiguracoes);
end;
end;

procedure TfoPrincipal.mmConfigUsauriosClick(Sender: TObject);
begin
  FoConsUsuario := TfoConsUsuario.Create(Application);
  try
    FoConsUsuario.ShowModal;

    pCarregaConfigUsuario(tabUsuarios.ConfigSalva);
    statPrincipal.Panels[0].Text := 'Usu�rio: '+ tabUsuarios.Usuario;

  finally
    FreeAndNil(FoConsUsuario);
  end;
end;

procedure TfoPrincipal.mmDataAlteracaoClick(Sender: TObject);
begin
  pMenuFiltroData(ffDATAALTERACAO);
end;

procedure TfoPrincipal.mmDataEmissaoClick(Sender: TObject);
begin
  pMenuFiltroData(ffDATAEMISSAO);
end;

procedure TfoPrincipal.mmDataRecebimentoClick(Sender: TObject);
begin
  pMenuFiltroData(ffDATARECTO);
end;

procedure TfoPrincipal.mmDeletarTodosClick(Sender: TObject);
begin
  pSelTodasLinhas;
  pSelecaoChave(wListaSelecionados);
  if wListaSelecionados.Count > 1 then
  begin
    if MessageDlg('Voc� est� prestes a deletar todos'+ IntToStr(wListaSelecionados.Count) +' arquivos.',
       mtConfirmation, [mbNo, mbYesToAll],0 )= mrYesToAll then
      fDeleteObjetoXML(wListaSelecionados);
  end;

 dbgNfebkp.Refresh;
end;

procedure TfoPrincipal.mmDelRefazAutTodosClick(Sender: TObject);
begin
  pSelTodasLinhas;
  pSelecaoChave(wListaSelecionados);
  fDeleteObjetoXML(wListaSelecionados);
  if fLoadXMLNFe(tabConfiguracoes,txNFe_EnvExt,true,'','') then
  begin
    dbgNfebkp.Refresh;
  end;

end;

procedure TfoPrincipal.mmDelTodosSelecionadosClick(Sender: TObject);
begin
  if wListaSelecionados.Count <> dbgNfebkp.SelectedRows.Count then
    pSelecaoChave(wListaSelecionados);

  if dbgNfebkp.SelectedRows.Count = wListaSelecionados.Count then
  begin
    if MessageDlg('Voc� est� prestes a deletar '+ IntToStr(wListaSelecionados.Count) +' arquivos.',
       mtConfirmation, [mbNo, mbYesToAll],0 )= mrYesToAll then
      fDeleteObjetoXML(wListaSelecionados);
  end
  else
  if wListaSelecionados.Count = 1 then
  begin
    if MessageDlg('Deseja excluir o arquivo XML ?', mtConfirmation, [mbNo, mbYes],0 ) = mrYes then
      fDeleteObjetoXML(wListaSelecionados);
  end;

  dbgNfebkp.Refresh;
end;

procedure TfoPrincipal.mmExpTodosClick(Sender: TObject);
begin
  pSelTodasLinhas;
  pSelecaoChave(wListaSelecionados);
  if dbgNfebkp.SelectedRows.Count = wListaSelecionados.Count then
    fExportaLoteXML(wListaSelecionados);
end;

procedure TfoPrincipal.mmExpSelecaoClick(Sender: TObject);
begin
  if dbgNfebkp.SelectedRows.Count = wListaSelecionados.Count then
    fExportaLoteXML(wListaSelecionados);
end;

procedure TfoPrincipal.dbgNfebkpTitleClick(Column: TColumn);
//var
//  sIndexName: string;
//  oOrdenacao: TIndexOptions;
//  i: smallint;
//begin
//  try
//    // retira a formata��o em negrito de todas as colunas
//    for i := 0 to dbgNfebkp.Columns.Count - 1 do
//      dbgNfebkp.Columns[i].Title.Font.Style := [];
//
//    // configura a ordena��o ascendente ou descendente
//    if DM_NFEDFE.cdsBkpdfe.IndexName = Column.FieldName + '_ASC' then
//    begin
//      sIndexName := Column.FieldName + '_DESC';
//      oOrdenacao := [ixDescending];
//    end
//    else
//    begin
//      sIndexName := Column.FieldName + '_ASC';
//      oOrdenacao := [];
//    end;
//
//    DM_NFEDFE.cdsBkpdfe.Open;
//
//    // adiciona a ordena��o no DataSet, caso n�o exista
//    if DM_NFEDFE.cdsBkpdfe.IndexDefs.IndexOf(sIndexName) < 0 then
//      DM_NFEDFE.cdsBkpdfe.AddIndex(sIndexName, Column.FieldName, oOrdenacao);
//
//    DM_NFEDFE.cdsBkpdfe.IndexDefs.Update;
//
//    // formata o t�tulo da coluna em negrito
//    Column.Title.Font.Style := [fsBold];
//
//    // atribui a ordena��o selecionada
//    DM_NFEDFE.cdsBkpdfe.IndexName := sIndexName;
//
//
//
//    DM_NFEDFE.cdsBkpdfe.close;
//    DM_NFEDFE.cdsBkpdfe.Open;
//
//    DM_NFEDFE.cdsBkpdfe.First;
//    dbgNfebkp.Refresh;
//  except
//
//  end;
//end;

var iFirst, iLast: Integer;
    wDataINI, wDataFIN,DtAUX1,DtAUX2 : TDate;
    wValue1, wValue2, wValueAux : string;
    wFieldOrd : TFieldFiltros;
    wFieldFiltro : TFieldFiltros;
begin
  iFirst := 1;
  iLast := dbgNfebkp.DataSource.DataSet.RecordCount;
  wFieldOrd := TConvert<TFieldFiltros>.StrConvertEnum('ff'+Column.FieldName);
  wDataINI := dtpDataFiltroINI.Date;
  wDataFIN := dtpDataFiltroFIN.Date;

 wFieldFiltro := TConvert<TFieldFiltros>.StrConvertEnum('ff'+dbgNfebkp.Columns[Column.Index].FieldName);

  case wFieldFiltro of

   ffDATARECTO,
   ffDATAEMISSAO,
   ffDATAALTERACAO:
           begin
             dbgNfebkp.DataSource.DataSet.First;
             DtAUX1 := dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsDateTime;
             dbgNfebkp.DataSource.DataSet.Last;
             DtAUX2 := dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsDateTime;
             if DtAUX1 <= DtAUX2 then
             begin
               DateTimeToString(wValueAux, 'yyyy/mm/dd',DtAUX1);
               DateTimeToString(wValue2, 'yyyy/mm/dd', DtAUX2);
             end
             else
             begin
               DateTimeToString(wValueAux, 'yyyy/mm/dd',DtAUX2);
               DateTimeToString(wValue2, 'yyyy/mm/dd', DtAUX1);
             end;

             if wValueAux <> '' then
               wValueAux := QuotedStr(wValueAux);

             if wValue2 <> '' then
               wValue2 := QuotedStr(wValue2);
           end;

    ffIDF_DOCUMENTO:
       begin
         dbgNfebkp.DataSource.DataSet.First;
         wValueAux := IntToStr(dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsInteger);
         dbgNfebkp.DataSource.DataSet.Last;
         wValue2 := IntToStr(dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsInteger);
       end;

    ffTIPO,
    ffCHAVE,
    ffMOTIVO,
    ffMOTIVOCANC,
    ffPROTOCOLOAUT,
    ffTIPOAMBIENTE,
    ffPROTOCOLOCANC,
    ffPROTOCOLORECTO,
    ffEMAILSNOTIFICADOS:
    begin
     dbgNfebkp.DataSource.DataSet.First;
     wValueAux := dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsString;
     dbgNfebkp.DataSource.DataSet.Last;
     wValue2 := dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsString;

     if wValueAux <> '' then
       wValueAux := QuotedStr(wValueAux);

     if wValue2 <> '' then
       wValue2 := QuotedStr(wValue2);
    end;

    ffXMLENVIO,
    ffXMLEXTEND,
    ffXMLENVIOCANC,
    ffXMLEXTENDCANC:
    begin
     dbgNfebkp.DataSource.DataSet.First;
     wValueAux := IntToStr(dbgNfebkp.DataSource.DataSet.FieldByName('id').AsInteger);
     dbgNfebkp.DataSource.DataSet.Last;
     wValue2 := IntToStr(dbgNfebkp.DataSource.DataSet.FieldByName('id').AsInteger);
    end;
  end;

  if wValueAux > wValue2 then
  begin
    wValue1 := wValue2;
    wValue2 := wValueAux;
  end
  else
  wValue1 := wValueAux;

  if wLastOrderBy = obyNone then
    wLastOrderBy:= obyASCENDENTE;

  DaoObjetoXML.fFiltraOrdena(wFieldOrd,wLastOrderBy, Column.FieldName,wDataINI, wDataFIN,'','');

  if wLastOrderBy = obyASCENDENTE then
    wLastOrderBy := obyDESCEDENTE
  else
   wLastOrderBy := obyASCENDENTE;

  if wLastColunm >= 0 then
    dbgNfebkp.Columns[wLastColunm].Title.Font.Style := [];

  dbgNfebkp.Columns[Column.Index].Title.Font.Style := [fsBold];
  wLastColunm := Column.Index;

  dbgNfebkp.Refresh;
end;

procedure TfoPrincipal.dtpDataFiltroFinKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
   dtpDataFiltroFin.DateTime := now;
end;

procedure TfoPrincipal.dtpDataFiltroINIExit(Sender: TObject);
var y,m,d: word;
    wDateIni : Tdate;
begin
  DecodeDate(dtpDataFiltroINI.Date,y,m,d);
//  dtpDataFiltroINI.DateTime := EncodeDate(y,m,01);
  dtpDataFiltroFin.DateTime := EncodeDate(y,m,DaysInMonth(dtpDataFiltroINI.Date));
end;

procedure TfoPrincipal.dtpDataFiltroINIKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
   dtpDataFiltroINI.DateTime := now;
end;

procedure TfoPrincipal.FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const AArgument: Variant);
begin
  If (UpperCase(AEventName) = 'NOVO_XML') then
  begin
  //<Executa tratamento para novo cliente cadastrado>

    if Self.WindowState = wsMinimized then
      Self.WindowState := wsNormal;

    self.BringToFront;
  end
end;

procedure TfoPrincipal.fFiltroEmissaoXML;
begin
 if wFieldFiltros = ffTODOS then
   DaoObjetoXML.fFiltraOrdena(ffTODOS, wLastOrderBy,'Dataemissao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);

 if dtpDataFiltroINI.Date > dtpDataFiltroFin.Date then
     dtpDataFiltroFin.Date := dtpDataFiltroINI.Date;

  if dtpDataFiltroINI.Date <= dtpDataFiltroFin.Date then
    DaoObjetoXML.fFiltraOrdena(wFieldFiltros, wLastOrderBy,'Dataemissao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
end;

procedure TfoPrincipal.dbgNfebkpColExit(Sender: TObject);
begin
//   if dbgNfebkp.SelectedField.FieldName = dbchkCHECKBOX.DataField then
//     dbchkCHECKBOX.Visible := False
end;

procedure TfoPrincipal.dbgNfebkpDblClick(Sender: TObject);
var wStream : TStream;
    wFileName : String;
begin
   with (Sender as TDBGrid) do
   if SelectedField.IsBlob then
   begin
     if (MessageDlg('Deseja salvar o XML?', mtConfirmation, [mbYes, mbNo],0)= mrNo) then
       exit;

     SelectedField.DataSet.Edit;
     wStream := TMemoryStream.Create;
     wStream := SelectedField.DataSet.CreateBlobStream(SelectedField, bmReadWrite);
     pSalveName(SelectedField.FieldName, wFileName);
     dlgSaveXML.Filter := 'XML | *.xml';
     dlgSaveXML.Title :=  'Salve o arquivo: '+ Columns[SelectedField.Index].Title.Caption;
     dlgSaveXML.InitialDir := ExtractFileDir(wFileName);
     dlgSaveXML.FileName := wFileName;

     if dlgSaveXML.Execute then
     begin
       pDecompress(wStream, dlgSaveXML.FileName);
     end;
   end;
end;

procedure TfoPrincipal.dbgNfebkpDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  const IsChecked : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var wStream : TStream;
    wFileName : String;
    wRow: integer;
  procedure pSetColorLinhas;
  var wStatus : Integer;
  begin
    with (Sender as TDBGrid) do
    begin
      Canvas.Font.Style := [];

      if (gdFocused in State) then
      begin
       Canvas.Brush.Color := clWebLightYellow;
       Canvas.Font.Style := [];
       Canvas.FillRect(Rect);
       Canvas.Font.Color:= clBlack;
       Canvas.TextOut(Rect.Left, Rect.Top,Column.Field.AsString);
       Canvas.FillRect(Rect);
      end;

      if (gdFixed in State) then
      begin
       Canvas.Brush.Color := clFuchsia;
       Canvas.Font.Style := [];
       Canvas.FillRect(Rect);
       Canvas.Font.Color:= clwhite;
       Canvas.TextOut(Rect.Left, Rect.Top,Column.Field.AsString);
       Canvas.FillRect(Rect);
      end;

      if (gdSelected in State) then
      begin
       Canvas.Brush.Color := clMedGray;
       Canvas.Font.Style := [];
       Canvas.FillRect(Rect);
       Canvas.Font.Color:= clWhite;
       Canvas.TextOut(Rect.Left, Rect.Top,Column.Field.AsString);
       Canvas.FillRect(Rect);
      end;

      wStatus := DataSource.DataSet.FieldByName('STATUS').AsInteger;
      case wStatus of
        0: Canvas.Font.Color := clBlack;    //XML Envio Processado
        1: Canvas.Font.Color := clNavy;     //XML Envio
        2: Canvas.Font.Color := clRed;      //XML Cancel. Processado
        3: Canvas.Font.Color := clPurple;    //XML Envio Cancelamento
        4: Canvas.Font.Color := clBlue;     //Denegada
        5: Canvas.Font.Color := clFuchsia;  //Inutilizada
      else
        Canvas.Font.Color := clGray;
      end;

     Canvas.FillRect(Rect);
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

//  procedure pDesenhaCheckBox;
//  var    DrawState, Check: Integer;
//         DrawRect, R: TRect;
//  begin
//    if (gdFocused in State) then
//    begin
//     if (Column.Field.FieldName = dbchkCHECKBOX.DataField) then
//     begin
//      dbchkCHECKBOX.Left := Rect.Left + dbgNfebkp.Left + 2;
//      dbchkCHECKBOX.Top := Rect.Top + dbgNfebkp.top + 2;
//      dbchkCHECKBOX.Width := Rect.Right - Rect.Left;
//      dbchkCHECKBOX.Height := Rect.Bottom - Rect.Top;
//      dbchkCHECKBOX.Visible := True;
//     end
//    end
//    else
//    begin
//     if (Column.Field.FieldName = dbchkCHECKBOX.DataField) then
//     begin
//       DrawRect:=Rect;
//       InflateRect(DrawRect,-1,-1);
//       DrawState := Column.Field.AsINTEGER;
//       dbgNfebkp.Canvas.FillRect(Rect);
//       DrawFrameControl(dbgNfebkp.Canvas.Handle, DrawRect,
//       DFC_BUTTON, DrawState);
//     end;
//    end;
//  end;

begin
  pSetColorLinhas;
//  pDesenhaCheckBox;
end;

procedure TfoPrincipal.dbgNfebkpKeyPress(Sender: TObject; var Key: Char);
var wOK : Boolean;
    wMR,I : Integer;
begin
  if (key = Chr(9)) then
   Exit;

//  if (dbgNfebkp.SelectedField.FieldName = dbchkCHECKBOX.DataField) then
//  begin
//    dbchkCHECKBOX.SetFocus;
//    SendMessage(dbchkCHECKBOX.Handle, WM_Char, word(Key), 0);
//  end;
end;

procedure TfoPrincipal.dbgNfebkpKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 46 then
  begin
    if((Trim(tabUsuarios.Usuario) = 'master') and (tabUsuarios.Senha = fSenhaAtual(''))) then
      pDeleteRowsSelectGrid;
  end;
end;

procedure TfoPrincipal.dbgNfebkpMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
//  var wI: Integer;
begin
//  if Button = mbRight then
//  begin
//    wI := dbgNfebkp.SelectedRows.Count;
//    if wI > 0 then
//    begin
//      dbgNfebkp.PopupMenu := pmExporta;
//    end
//    else
//    begin
//      dbgNfebkp.PopupMenu := pmSelecionar;
//    end;
//  end;
end;

procedure TfoPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(wListaSelecionados);
  DM_NFEDFE.conConexaoFD.Connected := false;
end;

procedure TfoPrincipal.FormCreate(Sender: TObject);
var i:Integer;
    dts : TDataSet;

//  procedure pIniciaDBCheckBox;
//  begin
//    dbchkCHECKBOX.DataSource := DM_NFEDFE.dsBkpdfe;
//    dbchkCHECKBOX.DataField := 'CHECKBOX';
//    dbchkCHECKBOX.Visible := False;
//    dbchkCHECKBOX.Color := dbgNfebkp.Color;
//    dbchkCHECKBOX.Caption := '';
//  end;

begin
  foPrincipal.Caption := 'SOUIS MAXXML Vers�o 1.0 - beta';

//  pStatusBarProgress;
  pIniciaGrid;

  if not Assigned(DaoObjetoXML) then
    DaoObjetoXML := TDaoBkpdfe.create;

  if not Assigned(ObjetoXML) then
    ObjetoXML := TLm_bkpdfe.Create;

  if not Assigned(tabConfiguracoes) then
    tabConfiguracoes := TConfiguracoes.Create;

  if not Assigned(daoConfiguracoes) then
    daoConfiguracoes := TDaoConfiguracoes.Create;

  dts := DM_NFEDFE.Dao.ConsultaTab(tabUsuarios, ['id']);
  i:= dts.FieldByName('configsalva').AsInteger;
  dts.Free;

  wVisible := fMaster(tabUsuarios);
  pCarregaConfigUsuario(i);
  statPrincipal.Panels[0].Text := 'Usu�rio: '+ tabUsuarios.Usuario;

  wLoadXML := lxNone;
  wLastColunm := -1;
  wLastOrderBy := obyNone;
  wFieldFiltros := ffDATAEMISSAO;
  pMenuFiltroData(wFieldFiltros);

//  pIniciaDBCheckBox;
  wListaSelecionados := TStringList.Create;


end;

procedure TfoPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    if MessageDlg('Deseja sair?', mtConfirmation, mbYesNo,0) = mrYes then
     Close;
  end
end;

procedure TfoPrincipal.FormShow(Sender: TObject);
begin
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAEMISSAO,wLastOrderBy,'Dataemissao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
  dbgNfebkp.Refresh;
end;

procedure TfoPrincipal.pSalveName(pFieldName: string; var wFileName: string);
begin
  if (pFieldName = 'XMLENVIO')  or ( pFieldName = 'XMLEXTEND') then
   wFileName := 'Env_NFe'+dbgNfebkp.Fields[1].AsString + '.xml';

  if (pFieldName = 'XMLENVIOCANC') or (pFieldName = 'XMLEXTENDCANC' ) then
   wFileName := 'Can_'+dbgNfebkp.Fields[1].AsString + '.xml';
end;

procedure TfoPrincipal.pSelecaoChave(var pLista: TStringList);
var I : Integer;
    wObjXML :TLm_bkpdfe;
    wSLAux : TStringList;
begin
  if not Assigned(pLista) then
    pLista := TStringList.Create
  else
  begin
    FreeAndNil(pLista);
    pLista := TStringList.Create;
  end;

  with DM_NFEDFE do
  begin
    for i := 0 to  dbgNfebkp.SelectedRows.Count - 1 do
    begin
      if dbgNfebkp.SelectedRows.IndexOf(dbgNfebkp.SelectedRows.Items[i]) > -1 then
      begin
        dbgNfebkp.DataSource.DataSet.Bookmark := dbgNfebkp.SelectedRows.Items[i];

        if pLista.IndexOf(dbgNfebkp.DataSource.DataSet.FieldByName('chave').AsString) < 0 then
        begin
          wObjXML := TLm_bkpdfe.Create;
          wObjXML.Chave := dbgNfebkp.DataSource.DataSet.FieldByName('chave').AsString;
          DaoObjetoXML.fConsultaObjXML(wObjXML,['chave']);
          pLista.AddObject(wObjXML.Chave, wObjXML);
        end;
      end;
    end;
  end;
end;

procedure TfoPrincipal.pSelTodasLinhas;
var
 wlLinha: Integer;
begin
  with dbgNfebkp.DataSource.DataSet do
  begin
    First;
    for wlLinha := 0 to RecordCount - 1 do
    begin
      dbgNfebkp.SelectedRows.CurrentRowSelected := True;
      Next;
    end;
  end;
end;


procedure TfoPrincipal.pRemoveSelTodasLinhas;
var
wlLinha: Integer;
begin
  with dbgNfebkp.DataSource.DataSet do
  begin
    First;
    for wlLinha := 0 to RecordCount - 1 do
    begin
      dbgNfebkp.SelectedRows.CurrentRowSelected := False;
      Next;
    end;
  end;

//  dbgNfebkp.SelectedRows.Refresh;
end;

procedure TfoPrincipal.pStatusBarProgress;
//var
// ProgressBarStyle: integer;
begin
//  statPrincipal.Panels[3].Style := psOwnerDraw;
//  ProgressBar1.Parent := statPrincipal;
//  ProgressBarStyle := GetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE);
//  ProgressBarStyle := ProgressBarStyle - WS_EX_STATICEDGE;
//  SetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE, ProgressBarStyle);
//  ProgressBar1.Position := 0;
//  ProgressBar1.Max := 100;
end;

procedure TfoPrincipal.mmGeraclasseClick(Sender: TObject);
begin
 foGeraClasse := TfoGeraClasse.Create(Application);
 try
   foGeraClasse.ShowModal;
 finally
   foGeraClasse.Free;
 end;
end;

procedure TfoPrincipal.mmMarcarTodosClick(Sender: TObject);
begin
  pSelTodasLinhas;
end;

procedure TfoPrincipal.mmRefazAutorizacaoSelecaoClick(Sender: TObject);
begin
  if dbgNfebkp.SelectedRows.Count = wListaSelecionados.Count then
  begin
    tabConfiguracoes.NFePathProcessado := jopdDirDir.Directory;


    if fLoadXMLNFeLista(wListaSelecionados)then
    begin
      dbgNfebkp.Refresh;
      ShowMessage('Autoriza��es selecionadas reprocessadas!');
    end;
  end;
end;

procedure TfoPrincipal.mmRefazAutorizacaoTodosClick(Sender: TObject);
begin
//  pSelTodasLinhas;
   jopdDirDir := TJvSelectDirectory.Create(Application);
   jopdDirDir.InitialDir := GetCurrentDir;
   jopdDirDir.Title := 'Seleceione o diret�rio dos Processados.';
  if jopdDirDir.Execute then
    tabConfiguracoes.NFePathProcessado := jopdDirDir.Directory;

  if fLoadXMLNFe(tabConfiguracoes,txNFe_EnvExt,true,'','') then
  begin
    dbgNfebkp.Refresh;
    ShowMessage('Autoriza��es reprocessadas!');
  end;

end;

procedure TfoPrincipal.mmDescmarcarSelTodosClick(Sender: TObject);
begin
  pRemoveSelTodasLinhas;
end;

procedure TfoPrincipal.mmSelTodosClick(Sender: TObject);
var wI: Integer;
begin
  pSelTodasLinhas;
end;

procedure TfoPrincipal.mmSelTodosExportarClick(Sender: TObject);
begin
  pSelTodasLinhas;
  pSelecaoChave(wListaSelecionados);
  fExportaLoteXML(wListaSelecionados);
end;

procedure TfoPrincipal.mniConfigBDClick(Sender: TObject);
begin
  foConfiguracao := TfoConfiguracao.Create(application);
  try
    foConfiguracao.Usuarios := tabUsuarios;
    foConfiguracao.IDConfig := tabUsuarios.Id;
    foConfiguracao.showmodal;
  finally
    foConfiguracao.Free;
  end;
end;

procedure TfoPrincipal.mniReconectarClick(Sender: TObject);
var statusCon : string;
begin
  if ConexaoBD(DM_NFEDFE.conConexaoFD, DM_NFEDFE.fddrfbDriver) then
   statusCon := 'Conectado'
  else
   statusCon := 'Desconecado';
  statPrincipal.Panels[1].text := statusCon;
end;

procedure TfoPrincipal.mniTrocarUsuarioClick(Sender: TObject);
var wShowResult : Byte;
begin
  foLogin := TfoLogin.Create(Application);
  try
    wShowResult := foLogin.ShowModal;

    if wShowResult = mrOk then
    begin
      wVisible := fMaster(tabUsuarios);
      pCarregaConfigUsuario(tabUsuarios.ConfigSalva);
      statPrincipal.Panels[0].Text := 'Usu�rio: '+ tabUsuarios.Usuario;
    end
    else
    Application.Terminate;

  finally
    FreeAndNil(foLogin);
  end;
end;

procedure TfoPrincipal.mmTodosArquivosClick(Sender: TObject);
begin
  pMenuFiltroData(ffTODOS);
end;

function TfoPrincipal.OpenTabela: boolean;
var wDataSet : TDataSet;
    wDS : TDataSource;
    wDSAux : TDataSource;
begin
  result := false;
  try
    try
       with DM_NFEDFE do
      begin
        if not Assigned(ObjetoXML) then
           ObjetoXML := TLm_bkpdfe.Create;

        dsBkpdfe.DataSet :=  dao.SelectAll(ObjetoXML);
        dbgNfebkp.Refresh;
       result := true;
      end;
    except
      on E: Exception do
      begin
        showmessage(E.Message + 'Houve um problema na rotina Open da tabela LM_BKPDFE');
      end;
    end;
  finally

  end;
end;

procedure TfoPrincipal.ToolButton1Click(Sender: TObject);
begin
   //carregarDocumetos
   ShowMessage('usuario: '+ tabUsuarios.Usuario);
end;

procedure TfoPrincipal.TrayIconBkpNfeDblClick(Sender: TObject);
begin
//  Self.Visible := True;
//  Self.WindowState := wsNormal;
//  Self.Resizing(wsNormal);
//  Self.BringToFront;
//  TrayIconBkpNfe.Visible := false;
//  TrayIconBkpNfe.Animate := false;;
end;

{ TDBGrid }

//procedure TDBGrid.WMVScroll(var Message: TWMVScroll);
//begin
//  if Message.ScrollCode = SB_THUMBTRACK then
//    Message.ScrollCode := SB_THUMBPOSITION;
//
//  inherited;
//end;

end.
