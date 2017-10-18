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
  REST.Backend.BindSource, REST.Backend.PushDevice,System.TypInfo, Vcl.Buttons,uRotinas;

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
    mmExportaXML: TMenuItem;
    mmExportaTodos: TMenuItem;
    mmGeraclasse: TMenuItem;
    ilMenu: TImageList;
    mmConfiguraoconsulta: TMenuItem;
    pnlMenu: TPanel;
    edConfiguracao: TEdit;
    grpFiltroDatas: TGroupBox;
    dtpDataFiltroINI: TDateTimePicker;
    lbDataIni: TLabel;
    lbDataFIm: TLabel;
    dtpDataFiltroFin: TDateTimePicker;
    EvaAlertas: TFDEventAlerter;
    tiTryIcon: TJvTrayIcon;
    pshEventosPush: TPushEvents;
    ProgressBar1: TProgressBar;
    tmrVerifica: TTimer;
    btnProcRetorno: TButton;
    btnProcessaEnvio: TButton;
    btn1: TSpeedButton;
    btn2: TButton;
    btnteste: TButton;
    dlgSaveXML: TSaveDialog;
    btnPelaChave: TButton;
    mmExportaSelecao: TMenuItem;
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
    procedure btn2Click(Sender: TObject);
    procedure btntesteClick(Sender: TObject);
    procedure dbgNfebkpCellClick(Column: TColumn);
    procedure dbgNfebkpDblClick(Sender: TObject);
    procedure btnPelaChaveClick(Sender: TObject);
    procedure pmExportaChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure mmExportaSelecaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  public
    { Public declarations }

  published
    function OpenTabela:boolean;
  end;

var
  foPrincipal : TfoPrincipal;
  LastColunm,AtualColunm,i  : Integer;
  wUpDown : TOrdenaBy;
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

procedure TfoPrincipal.btn2Click(Sender: TObject);
begin
  if fLoadXMLNFe(txRetProcXML,tabConfiguracoes) then
    DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnInserirClick(Sender: TObject);
begin
  if not Assigned(tabConfiguracoes) then
    tabConfiguracoes := TConfiguracoes.Create;
end;

procedure TfoPrincipal.btnPelaChaveClick(Sender: TObject);
var wFilename: string;
begin
  fOpenFileName(['XML | *.*xml'],['XML Arquivo | *.*xml'], wFilename,'Selecione o XML');
  fLoadXMLNFe(txXMLChave,tabConfiguracoes,wFilename);
  pDataFiltro;
  DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
end;

procedure TfoPrincipal.btnProcessaEnvioClick(Sender: TObject);
begin
  if fLoadXMLNFe(txEnvioXML,tabConfiguracoes) then
  begin
   pDataFiltro;
   DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date, '','');
  end;
end;

procedure TfoPrincipal.btnProcRetornoClick(Sender: TObject);
begin
  if fLoadXMLNFe(txRetSaiXML,tabConfiguracoes) then
  begin
    pDataFiltro;
    DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
  end;
end;

procedure TfoPrincipal.btntesteClick(Sender: TObject);
begin
  if fLoadXMLNFe(txEnvioXMLArq,tabConfiguracoes) then
  begin
    pDataFiltro;
    DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date,'','');
  end;
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

procedure TfoPrincipal.pmExportaChange(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  mmExportaSelecao.Caption :=  'Exporta '+IntToStr(dbgNfebkp.SelectedRows.Count)+' XML Selecionados'
end;

procedure TfoPrincipal.cbTipoNFChange(Sender: TObject);
begin
   //
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

procedure TfoPrincipal.mmExportaSelecaoClick(Sender: TObject);
var
	i: Integer;
	aux: string;
  wDataSet : TDataSet;
  wDataSource : TDataSource;

begin
    wDataSet := TDataSet.Create(Application);
    wSLSeleconados := TStringList.Create;
  try
    with DM_NFEDFE do
    begin
      for i := 0 to  dbgNfebkp.SelectedRows.Count - 1 do
      begin
        if dbgNfebkp.SelectedRows.IndexOf(dbgNfebkp.SelectedRows.Items[i]) > -1 then
        begin
          dbgNfebkp.DataSource.DataSet.Bookmark := dbgNfebkp.SelectedRows.Items[i];

          if wSLSeleconados.IndexOf(dbgNfebkp.DataSource.DataSet.FieldByName('chave').AsString) < 0 then
            wSLSeleconados.Add(dbgNfebkp.DataSource.DataSet.FieldByName('chave').AsString);

        end;
        dbgNfebkp.Refresh;
	    end;
    end;

     fExportaSelecaoXML(wSLSeleconados);
  finally
    FreeAndNil(wDataSet);
  end;
//	for i := 0 to  dbgNfebkp.SelectedRows.Count - 1 do
//	begin
//		cdsBkpdfe.GotoBookmark(pointer(dbgNfebkp.SelectedRows.Items[i]));
//		aux := aux + IntToStr(cdsBkpdfe.RecNo) + ' - ' +
//		cdsBkpdfe.FieldByName('idf_documento').AsString + #13;
//	end;
//	ShowMessage('Linhas selecionadas: ' + #13 + aux);

end;

procedure TfoPrincipal.dbgNfebkpTitleClick(Column: TColumn);
var iFirst, iLast: Integer;
    wDataINI, wDataFIN,DtAUX1,DtAUX2 : TDate;
    wValue1, wValue2, wValueAux : string;
    wFieldOrd : TFieldFiltros;
begin
  iFirst := 1;
  iLast := dbgNfebkp.DataSource.DataSet.RecordCount;
  wFieldOrd := TConvert<TFieldFiltros>.StrConvertEnum('ff'+Column.FieldName);
  wDataINI := dtpDataFiltroINI.Date;
  wDataFIN := dtpDataFiltroFIN.Date;

//  DaoObjetoXML.fFiltraOrdena(ffDATAEMISSAO,wUpDown, Column.FieldName,wDataINI, wDataFIN,wValue1,wValue2);

  case Column.Index of

    3,4,8: begin
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

    2: begin
       dbgNfebkp.DataSource.DataSet.First;
       wValueAux := IntToStr(dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsInteger);
       dbgNfebkp.DataSource.DataSet.Last;
       wValue2 := IntToStr(dbgNfebkp.DataSource.DataSet.FieldByName(Column.FieldName).AsInteger);
       end;

    1,5,6,7,9,10,11,14,17:
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

    12,13,15,16:
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

  DaoObjetoXML.fFiltraOrdena(wFieldOrd,wUpDown, Column.FieldName,wDataINI, wDataFIN,'','');

  if wUpDown = obyASCENDENTE then
    wUpDown := obyDESCEDENTE
  else
   wUpDown := obyASCENDENTE;

  if LastColunm >= 0 then
    dbgNfebkp.Columns[LastColunm].Title.Font.Style := [];

  dbgNfebkp.Columns[Column.Index].Title.Font.Style := [fsBold];
  LastColunm := Column.Index;

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
    DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO, obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
end;

procedure TfoPrincipal.dbgNfebkpCellClick(Column: TColumn);
//var wStream : TStream;
//    wFileName : String;
begin
//   if Column.Field.IsBlob then
//   begin
//     if (MessageDlg('Deseja salavar o XML?', mtConfirmation, [mbYes, mbNo],0)= mrNo) then
//       exit;
//     Column.Field.DataSet.Edit;
//     wStream := TMemoryStream.Create;
//     wStream := Column.Field.DataSet.CreateBlobStream(Column.Field, bmReadWrite);
//     pSalveName(Column.FieldName, wFileName);
//     dlgSaveXML.FileName := wFileName;
//     if dlgSaveXML.Execute then
//     begin
//       pDecompress(wStream, dlgSaveXML.FileName);
//     end;
//   end;
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
     dlgSaveXML.Filter := 'XML|*.xml';
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
var wStream : TStream;
    wFileName : String;
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
begin
   DaoObjetoXML.fFiltraOrdena(ffDATAALTERACAO,obyASCENDENTE,'Dataalteracao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);

//   if LoadXML(wLoadXML,tabConfiguracoes.NFePathSend) then
//     DaoObjetoXML.fFiltraOrdena(ffDATAEMISSAO,obyASCENDENTE,'Dataemissao', dtpDataFiltroINI.Date, dtpDataFiltroFin.Date);
end;

procedure TfoPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(wSLSeleconados);
end;

procedure TfoPrincipal.FormCreate(Sender: TObject);
var i:Integer;
    dts : TDataSet;
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
  statPrincipal.Panels[1].Text := '';
  LastColunm := -1;
  wUpDown := obyASCENDENTE;

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