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
  Vcl.DBCtrls;

type
  TOrdena = (ordCodigo, ordData, ordChave);

  TfoPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    mmArquivo: TMenuItem;
    mmNovo: TMenuItem;
    mniN1: TMenuItem;
    mmSair: TMenuItem;
    mmFerrametas: TMenuItem;
    mmAjuda: TMenuItem;
    mmConfiguracoes: TMenuItem;
    ilPrincipal: TImageList;
    statPrincipal: TStatusBar;
    tmrHora: TTimer;
    dbgNfebkp: TDBGrid;
    pmExporta: TPopupMenu;
    mmExportaTodos: TMenuItem;
    mmGeraclasse: TMenuItem;
    ilMenu: TImageList;
    mmConfiguraoconsulta: TMenuItem;
    pnlMenu: TPanel;
    edConfiguracao: TEdit;
    EvaAlertas: TFDEventAlerter;
    tiTryIcon: TJvTrayIcon;
    pshEventosPush: TPushEvents;
    ProgressBar1: TProgressBar;
    tmrVerifica: TTimer;
    btn1: TSpeedButton;
    dlgSaveXML: TSaveDialog;
    mmExportaSelecao: TMenuItem;
    dbchkCHECKBOX: TDBCheckBox;
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
    mmRemoveSelTodos: TMenuItem;
    pnlControles: TPanel;
    btnEnvioArq: TButton;
    btnEnvioLote: TButton;
    btnEnvioExt: TButton;
    btnXMLEnvioExtLote: TButton;
    btnCanEnvioLote: TButton;
    btnCanEnvioArq: TButton;
    btnCanEnvioExt: TButton;
    btnCanExetendLote: TButton;
    procedure FormCreate(Sender: TObject);
    procedure mniConfigBDClick(Sender: TObject);
    procedure mniReconectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgNfebkpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mmGeraclasseClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure dbgNfebkpTitleClick(Column: TColumn);
    procedure cbTipoNFChange(Sender: TObject);
    procedure mmConfiguraoconsultaClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnProcRetornoClick(Sender: TObject);
    procedure btnProcessaEnvioClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dtpDataFiltroINICloseUp(Sender: TObject);
    procedure dtpDataFiltroFinCloseUp(Sender: TObject);
    procedure dtpDataFiltroINIExit(Sender: TObject);
    procedure statPrincipalDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure dbgNfebkpDblClick(Sender: TObject);
    procedure btnPelaChaveClick(Sender: TObject);
    procedure mmExportaSelecaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgNfebkpColExit(Sender: TObject);
    procedure dbgNfebkpKeyPress(Sender: TObject; var Key: Char);
    procedure dbchkCHECKBOXClick(Sender: TObject);
    procedure dbgNfebkpKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmSelTodosClick(Sender: TObject);
    procedure mmSelTodosExportarClick(Sender: TObject);
    procedure mmExportaTodosClick(Sender: TObject);
    procedure mmRemoveSelTodosClick(Sender: TObject);
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
  private
    { Private declarations }
    procedure fOrdenaGrid(prOrder: Integer);  overload;
    procedure fOrdenaGrid(fieldbyname : string); overload;
    procedure pCarregaConfigUsuario(pIDConfig: Integer);
    procedure fFiltroEmissaoXML;
    procedure pDataFiltro;
    procedure pRetornaFieldFiltros(var pFieldName: String; ffFiltro: TFieldFiltros);
    procedure StatusBarProgress;
    procedure pSalveName(pFieldName: string; var wFileName: string);
    procedure pSelecaoChave(var pLista: TStringList);
    procedure pSelTodasLinhas;
    procedure pDeleteRowsSelectGrid;
    procedure pRemoveSelTodasLinhas;
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
  wSLSeleconados : TStringList;

implementation

uses

uFoConsConfiguracao, uFoConfiguracao, Configuracoes;

{$R *.dfm}

procedure TfoPrincipal.btn1Click(Sender: TObject);
begin
  foConsConfiguracoes := TfoConsConfiguracoes.Create(Application);
try
  with foConsConfiguracoes do
  begin
    Usuarios := tabUsuarios;
    evtTelaUsuarios := etuConsultar;
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
  wFilename := 'Can_';
  fOpenFileName(['XML | *.*xml'],['XML Arquivo | *.*xml'], wFilename,'Selecione o XML de Cancelamento');
  fLoadXMLNFe(tabConfiguracoes,txCan_, False, wFilename);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnCanEnvioExtClick(Sender: TObject);
var wFilename: string;
begin
  wFilename := 'Can_';
  fOpenFileName(['XML | *.*xml'],['XML Arquivo | *.*xml'], wFilename,'Selecione o XML de Cancelamento processado');
  fLoadXMLNFe(tabConfiguracoes,txCan_Ext, False, wFilename);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnCanEnvioLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txCan_Lote, True);
end;

procedure TfoPrincipal.btnCanExetendLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txCan_ExtLote, True);
end;

procedure TfoPrincipal.btnEnvioArqClick(Sender: TObject);
var wFilename: string;
begin
  wFilename := 'Env_Nfe';
  fOpenFileName(['XML | *.*xml'],['XML Arquivo | *.*xml'], wFilename,'Selecione o XML de Envio');
  fLoadXMLNFe(tabConfiguracoes, txNFE_Env, false, wFilename);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnEnvioExtClick(Sender: TObject);
var wFilename: string;
begin
  wFilename := 'Env_Nfe';
  fOpenFileName(['XML | *.*xml'],['XML Arquivo | *.*xml'], wFilename,'Selecione o XML Processado');
  fLoadXMLNFe(tabConfiguracoes,txNFe_EnvExt, False, wFilename);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnEnvioLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txNFE_EnvLote, True);
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

procedure TfoPrincipal.btnXMLEnvioExtLoteClick(Sender: TObject);
begin
  fLoadXMLNFe(tabConfiguracoes,txNFe_EnvExtLote, True);
end;

procedure TfoPrincipal.pCarregaConfigUsuario(pIDConfig: Integer);
begin
 if not Assigned(tabConfiguracoes) then
   tabConfiguracoes := TConfiguracoes.Create;

 tabConfiguracoes.id := pIDConfig;
 daoConfiguracoes.fCarregaConfiguracoes(tabConfiguracoes,['id']);
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
  procedure pRefreshCDS;
  begin
    DM_NFEDFE.cdsBkpdfe.Close;
    DM_NFEDFE.cdsBkpdfe.Open;
  end;

begin
    pSelecaoChave(wSLSeleconados);
    if dbgNfebkp.SelectedRows.Count > 1 then
    begin
      if MessageDlg('Você está prestes a deletar '+ IntToStr(wSLSeleconados.Count) +' arquivos.',
         mtConfirmation, [mbNo, mbYesToAll],0 )= mrYesToAll then
        if fDeleteObjetoXML(wSLSeleconados) then
          pRefreshCDS;
    end
    else
    if dbgNfebkp.SelectedRows.Count = 1 then
    begin
      if MessageDlg('Deseja excluir o  XML '+wSLSeleconados.Strings[0] +'?', mtConfirmation, [mbNo, mbYes],0 ) = mrYes then
        if fDeleteObjetoXML(wSLSeleconados) then
          pRefreshCDS;
    end;
end;

procedure TfoPrincipal.pmExportaPopup(Sender: TObject);
  var wI,wJ : Integer;
      wSTR1,wSTR2 : String;
begin
  wI := dbgNfebkp.SelectedRows.Count;
  wJ := dbgNfebkp.DataSource.DataSet.RecordCount;
  wSTR1 := IntToStr(wI);
  wSTR2 := IntToStr(wJ);
  if wI > 0 then
  begin
    if wI = 1 then
      mmExportaSelecao.Caption :=  'Exporta o XML'
    else
      mmExportaSelecao.Caption :=  'Exporta '+wSTR1+' XML selecionados';

    mmExportaTodos.Caption := 'Exporta todos os XML('+wSTR2+')';

    mmDeletarTodos.Caption := '&Deletar todos('+wSTR2+')';
    mmDelTodosSelecionados.Caption := 'D&eletar todos os selecionados ('+wSTR1+')';

    mmRemoveSelTodos.Caption := '&Remove a seleção ('+ wSTR1 + ')';
  end
end;

procedure TfoPrincipal.pmSelecionarPopup(Sender: TObject);
  var wI,wJ : Integer;
      wSTR1,wSTR2 : String;
begin
  wI := dbgNfebkp.SelectedRows.Count;
  wJ := dbgNfebkp.DataSource.DataSet.RecordCount;
  wSTR1 := IntToStr(wI);
  wSTR2 := IntToStr(wJ);

  if wI < 0 then
  begin
//    dbgNfebkp.PopupMenu := pmSelecionar;
    mmSelTodos.Caption := 'Selecionar &todos ('+wSTR2+')';
    mmSelTodosExportar.Caption := 'Selecionar todos e &exportar ('+wSTR2+')';
  end;
end;

procedure TfoPrincipal.cbTipoNFChange(Sender: TObject);
begin
   //
end;

procedure TfoPrincipal.dbchkCHECKBOXClick(Sender: TObject);
begin
  if dbchkCHECKBOX.Checked then
    dbchkCHECKBOX.Caption := 'true'//dbckCHECKBOX.ValueChecked
  else
    dbchkCHECKBOX.Caption := 'false'//dbckCHECKBOX.ValueUnChecked;
end;

procedure TfoPrincipal.mmConfiguraoconsultaClick(Sender: TObject);
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

procedure TfoPrincipal.mmDeletarTodosClick(Sender: TObject);
begin
  pSelTodasLinhas;
  pSelecaoChave(wSLSeleconados);
  if wSLSeleconados.Count > 1 then
  begin
    if MessageDlg('Você está prestes a deletar todos'+ IntToStr(wSLSeleconados.Count) +' arquivos.',
       mtConfirmation, [mbNo, mbYesToAll],0 )= mrYesToAll then
      fDeleteObjetoXML(wSLSeleconados);
  end;

  DM_NFEDFE.cdsBkpdfe.Close;
  DM_NFEDFE.cdsBkpdfe.Open;
end;

procedure TfoPrincipal.mmDelTodosSelecionadosClick(Sender: TObject);
begin
  pSelecaoChave(wSLSeleconados);
  if wSLSeleconados.Count > 1 then
  begin
    if MessageDlg('Você está prestes a deletar '+ IntToStr(wSLSeleconados.Count) +' arquivos.',
       mtConfirmation, [mbNo, mbYesToAll],0 )= mrYesToAll then
      fDeleteObjetoXML(wSLSeleconados);
  end
  else
  if wSLSeleconados.Count = 1 then
  begin
    if MessageDlg('Deseja excluir o  XML '+wSLSeleconados.Strings[0] +'?', mtConfirmation, [mbNo, mbYes],0 ) = mrYes then
      fDeleteObjetoXML(wSLSeleconados);
  end;

  DM_NFEDFE.cdsBkpdfe.Close;
  DM_NFEDFE.cdsBkpdfe.Open;
end;

procedure TfoPrincipal.mmExportaSelecaoClick(Sender: TObject);
begin
  pSelecaoChave(wSLSeleconados);
  fExportaLoteXML(wSLSeleconados);
end;

procedure TfoPrincipal.mmExportaTodosClick(Sender: TObject);
begin
  pSelTodasLinhas;
  pSelecaoChave(wSLSeleconados);
  fExportaLoteXML(wSLSeleconados);
end;

procedure TfoPrincipal.dbgNfebkpTitleClick(Column: TColumn);
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

end;

procedure TfoPrincipal.dtpDataFiltroFinCloseUp(Sender: TObject);
begin
  fFiltroEmissaoXML;
end;

procedure TfoPrincipal.dtpDataFiltroINICloseUp(Sender: TObject);
begin
  fFiltroEmissaoXML;
end;

procedure TfoPrincipal.dtpDataFiltroINIExit(Sender: TObject);
begin
  fFiltroEmissaoXML;
end;


procedure TfoPrincipal.fFiltroEmissaoXML;
begin
 if dtpDataFiltroINI.Date > dtpDataFiltroFin.Date then
     dtpDataFiltroFin.Date := dtpDataFiltroINI.Date;

  if dtpDataFiltroINI.Date <= dtpDataFiltroFin.Date then
    DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO, wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
end;

procedure TfoPrincipal.dbgNfebkpColExit(Sender: TObject);
begin
   if dbgNfebkp.SelectedField.FieldName = dbchkCHECKBOX.DataField then
     dbchkCHECKBOX.Visible := False
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
//     else
//     if TFileStream(wStream).Size > 0 then
//       ShowMessage('Campo vazio!');

//       ShowMessage('TFileStream(wStream).Size: '+inttostr(TFileStream(wStream).Size));
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
//   const IsChecked1 : array[smallint] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var wStream : TStream;
    wFileName : String;

   DrawState, Check: Integer;
   DrawRect, R: TRect;
begin
  with (Sender as TDBGrid).Canvas do
  begin
    if (gdSelected in State) then
    begin
     Brush.Color := cl3DLight;
     FillRect(Rect);
     Font.Color:= clBlue;
     TextOut(Rect.Left, Rect.Top,Column.Field.AsString);
    end;
  end;
  dbgNfebkp.DefaultDrawColumnCell(Rect, DataCol, Column, State);


   if (gdFocused in State) then
   begin
     if (Column.Field.FieldName = dbchkCHECKBOX.DataField) then
     begin
      dbchkCHECKBOX.Left := Rect.Left + dbgNfebkp.Left + 2;
      dbchkCHECKBOX.Top := Rect.Top + dbgNfebkp.top + 2;
      dbchkCHECKBOX.Width := Rect.Right - Rect.Left;
      dbchkCHECKBOX.Height := Rect.Bottom - Rect.Top;
      dbchkCHECKBOX.Visible := True;
     end
   end
   else
   begin
     if (Column.Field.FieldName = dbchkCHECKBOX.DataField) then
     begin
       DrawRect:=Rect;
       InflateRect(DrawRect,-1,-1);
       DrawState := Column.Field.AsINTEGER;
       dbgNfebkp.Canvas.FillRect(Rect);
       DrawFrameControl(dbgNfebkp.Canvas.Handle, DrawRect,
         DFC_BUTTON, DrawState);
     end;
   end;

{
  //Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
   begin
    dbgNfebkp.Canvas.FillRect(Rect);
    Check := 0;
    if DM_NFEDFE.cdsBkpdfeSELECAO.AsString = 'X' then
      Check := DFCS_CHECKED
    else Check := 0;
    R:=Rect;
    InflateRect(R,-2,-2); //Diminue o tamanho do CheckBox
    DrawFrameControl(dbgNfebkp.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
   end;}
end;

procedure TfoPrincipal.dbgNfebkpKeyPress(Sender: TObject; var Key: Char);
var wOK : Boolean;
    wMR,I : Integer;
begin
  if (key = Chr(9)) then
   Exit;
  if (dbgNfebkp.SelectedField.FieldName = dbchkCHECKBOX.DataField) then
  begin
   dbchkCHECKBOX.SetFocus;
   SendMessage(dbchkCHECKBOX.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TfoPrincipal.dbgNfebkpKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 46 then
  begin
    pDeleteRowsSelectGrid;
  end;
end;

procedure TfoPrincipal.dbgNfebkpMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
  var wI: Integer;
begin
  if Button = mbRight then
  begin
    wI := dbgNfebkp.SelectedRows.Count;
    if wI > 0 then
    begin
      dbgNfebkp.PopupMenu := pmExporta;
    end
    else
    begin
      dbgNfebkp.PopupMenu := pmSelecionar;
    end;
  end;
end;

procedure TfoPrincipal.fOrdenaGrid(fieldbyname: string);
var
wSQL :string;
begin
  try
     with DM_NFEDFE do
    begin
       wSql := 'Select * from lm_bkpdfe ';
       wSql := wSql + 'order by ' + fieldbyname;
       dsBkpdfe.DataSet := dao.ConsultaSql(wSql);
    end;

  except
  on E: Exception do
  begin
    showmessage(E.Message + 'Houve um problema na rotina fOrdenaGrid(fieldbyname)');
  end;
  end;
end;

procedure TfoPrincipal.fOrdenaGrid(prOrder: Integer);
var wOrdem :String;
    wSql : string;
begin
  try
    case prOrder of
     0 : wOrdem := 'ID';
     1 : wOrdem := 'DATAEMISSAO';
     2 : wOrdem := 'CHAVE';
    else
     wOrdem := 'ID';
    end;

     with DM_NFEDFE do
    begin
       wSql := 'Select * from lm_bkpdfe ';
       wSql := wSql + 'order by ' + wOrdem;
       dsBkpdfe.DataSet := dao.ConsultaSql(wSql);
    end;
  except
  on E: Exception do
  begin
    showmessage(E.Message + 'Houve um problema na rotina fOrdenaGrid da tabela M3_DFE');
  end;
  end;
end;

procedure TfoPrincipal.FormActivate(Sender: TObject);
//var wBotãoDir : TNotifyEvent;
begin
  if DM_NFEDFE.cdsBkpdfe.Active then;
  begin
    DM_NFEDFE.cdsBkpdfe.Close;
    DM_NFEDFE.cdsBkpdfe.Open;
    statPrincipal.Panels[0].Text := 'Total de Linhas: '+ IntToStr(DM_NFEDFE.cdsBkpdfe.RecordCount);
    statPrincipal.Panels[1].Text := 'Linhas Selecionadas: '+ IntToStr(dbgNfebkp.SelectedRows.Count);
  end;
//   if LoadXML(wLoadXML,tabConfiguracoes.NFePathSend) then
  DaoObjetoXML.fFiltraOrdena(ffDATAEMISSAO,obyASCENDENTE,'Dataemissao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
end;

procedure TfoPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(wSLSeleconados);
end;

procedure TfoPrincipal.FormCreate(Sender: TObject);
var i:Integer;
    dts : TDataSet;

  procedure pIniciaDBCheckBox;
  begin
    dbchkCHECKBOX.DataSource := DM_NFEDFE.dsBkpdfe;
    dbchkCHECKBOX.DataField := 'CHECKBOX';
    dbchkCHECKBOX.Visible := False;
    dbchkCHECKBOX.Color := dbgNfebkp.Color;
    dbchkCHECKBOX.Caption := '';
    //explicado mais adiante no artigo
  //  dbckCHECKBOX.ValueChecked := 'Yes a Winner!';
  //  dbckCHECKBOX.ValueUnChecked := 'Not this time.';

  end;

begin
  StatusBarProgress;

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

  pCarregaConfigUsuario(i);
  wLoadXML := lxNone;
  wLastColunm := -1;
  wLastOrderBy := obyNone;

  pIniciaDBCheckBox;
  wSLSeleconados := TStringList.Create;

//  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);

end;

procedure TfoPrincipal.FormShow(Sender: TObject);
begin
  if DirectoryExists(tabConfiguracoes.NFePathSend) then
  begin
    mmGeraclasse.Visible := tabUsuarios.Id = 0;
    mmGeraclasse.Enabled := tabUsuarios.Id = 0;
    pDataFiltro;
//    DaoObjetoXML.fFiltraOrdena(ffDATAEMISSAO,obyASCENDENTE,'Dataemissao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
    //     OpenTabela;
  end;
end;

procedure TfoPrincipal.pRetornaFieldFiltros(var pFieldName: String; ffFiltro: TFieldFiltros);
begin
//  if LastColunm > 0 then
//    dbgNfebkp.Columns[LastColunm].Title.Font.Style := [];
//
//  dbgNfebkp.Columns[Column.Index].Title.Font.Style := [fsBold];
//  LastColunm := Column.Index;
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
      dbgNfebkp.Refresh;
    end;
  end;
end;

procedure TfoPrincipal.pSelTodasLinhas;
var
 wlLinha: Integer;
begin
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO, wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
  with dbgNfebkp.DataSource.DataSet do
  begin
    First;
    for wlLinha := 0 to RecordCount - 1 do
    begin
      dbgNfebkp.SelectedRows.CurrentRowSelected := True;
      Next;
    end;
  end;
  dbgNfebkp.SelectedRows.Refresh;
end;


procedure TfoPrincipal.pRemoveSelTodasLinhas;
var
wlLinha: Integer;
begin
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,wLastOrderBy,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
  with dbgNfebkp.DataSource.DataSet do
  begin
    First;
    for wlLinha := 0 to RecordCount - 1 do
    begin
      dbgNfebkp.SelectedRows.CurrentRowSelected := False;
      Next;
    end;
  end;
  dbgNfebkp.SelectedRows.Refresh;
end;

procedure TfoPrincipal.statPrincipalDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = StatusBar.Panels[1] then
  with ProgressBar1 do
  begin
    Top := Rect.Top;
    Left := Rect.Left;
    Width := Rect.Right - Rect.Left - 15;
    Height := Rect.Bottom - Rect.Top;
  end;

end;

procedure TfoPrincipal.StatusBarProgress;
var
 ProgressBarStyle: integer;

begin
    statPrincipal.Panels[3].Style := psOwnerDraw;

  ProgressBar1.Parent := statPrincipal;
  ProgressBarStyle := GetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE, ProgressBarStyle);

  ProgressBar1.Position := 0;
  ProgressBar1.Max := 100;
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

procedure TfoPrincipal.mmRemoveSelTodosClick(Sender: TObject);
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
  pSelecaoChave(wSLSeleconados);
  fExportaLoteXML(wSLSeleconados);
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
        cdsBkpdfe.close;
        cdsBkpdfe.Open;

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

end.
