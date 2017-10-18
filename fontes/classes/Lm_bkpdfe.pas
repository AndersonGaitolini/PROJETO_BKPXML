unit Lm_bkpdfe;

interface

uses
  Base, System.SysUtils, Atributos, System.Classes,Data.DB, uDMnfebkp,FireDAC.Comp.Client,Vcl.DBGrids,
  Datasnap.DBClient, Datasnap.Provider,Vcl.Forms,Vcl.Dialogs;

type
  TPushXML = (pshNone, pshEnvio1st, pshEnvioSinc);
  TLoadXML = (lxNone,lxXMLEnvio, lxXMLProc, lxXMLRetSai, lxXMLArquivo, lxXMLFull);
  TTipoXML = (txEnvioXML, txRetProcXML, txRetSaiXML, txEnvioXMLArq, txXMLChave, txRetEven);

  [attTabela('LM_BKPDFE')]
  TLm_bkpdfe = class(TTabela)
  private
    FId: Integer;
    FChave: string;
    FIdf_documento: Integer;
    FDataemissao: TDate;
    FDatarecto: TDate;
    FMotivo: string;
    FProtocolocanc: string;
    FProtocolorecto: string;
    FDataalteracao: TDate;
    FTipo: string;
    FEmailsnotificados: string;
    FTipoambiente: string;
    FXmlenvio: TStream;
    FXmlextend: TStream;
    FMotivocanc: string;
    FXmlenviocanc: TStream;
    FXmlextendcanc: TStream;
    FProtocoloaut: string;
    FCampoStream : TStream;
  public
    [attPK]
    property Id: Integer read FId write FId;
    property Chave: string read FChave write FChave;
    property Idf_documento: Integer read FIdf_documento write FIdf_documento;
    property Dataemissao: TDate read FDataemissao write FDataemissao;
    property Datarecto: TDate read FDatarecto write FDatarecto;
    property Motivo: string read FMotivo write FMotivo;
    property Protocolocanc: string read FProtocolocanc write FProtocolocanc;
    property Protocolorecto: string read FProtocolorecto write FProtocolorecto;
    property Dataalteracao: TDate read FDataalteracao write FDataalteracao;
    property Tipo: string read FTipo write FTipo;
    property Emailsnotificados: string read FEmailsnotificados write FEmailsnotificados;
    property Tipoambiente: string read FTipoambiente write FTipoambiente;
    property Xmlenvio: TStream read FXmlenvio write FXmlenvio;
    property Xmlextend: TStream read FXmlextend write FXmlextend;
    property Motivocanc: string read FMotivocanc write FMotivocanc;
    property Xmlenviocanc: TStream read FXmlenviocanc write FXmlenviocanc;
    property Xmlextendcanc: TStream read FXmlextendcanc write FXmlextendcanc;
    property Protocoloaut: string read FProtocoloaut write FProtocoloaut;
    property CampoStream : TStream read FCampoStream write FCampoStream;
  end;


  type
    TFieldFiltros  = (ffID,
                      ffCHAVE,
                      ffIDF_DOCUMENTO,
                      ffDATAEMISSAO,
                      ffDATARECTO,
                      ffMOTIVO,
                      ffPROTOCOLOCANC,
                      ffPROTOCOLORECTO,
                      ffDATAALTERACAO,
                      ffTIPO,
                      ffEMAILSNOTIFICADOS,
                      ffTIPOAMBIENTE,
                      ffXMLENVIO,
                      ffXMLEXTEND,
                      ffMOTIVOCANC,
                      ffXMLENVIOCANC,
                      ffXMLEXTENDCANC,
                      ffPROTOCOLOAUT);

    TOrdenaBy = (obyASCENDENTE, obyDESCEDENTE, obyNone);

  TDaoBkpdfe = class(TObject)
  private
  public
    function fNextId(pObjXML             : TLm_bkpdfe): integer;
    function fTotalArquivos(pTabela      : TLm_bkpdfe): Integer;
    function fCarregaXMLEnvio(pObjXML    : TLm_bkpdfe): Boolean;
    function fCarregaXMLRetorno(pObjXML  : TLm_bkpdfe): Boolean;
    function fFindChaveXML(var pObjXML   : TLm_bkpdfe): Boolean;
    function fConsultaObjXML(var pObjXML : TLm_bkpdfe; pCampos: array of string): Boolean;
    procedure fFiltraOrdena(pFieldNameOrder: TFieldFiltros = ffCHAVE; pUpDown: TOrdenaBy = obyNone;pFieldName: string = ''; pDtINI: TDate = 0; pDtFin: TDate = 0 ; pValue1: string = '';pValue2: string = '');
  end;

  var
   ObjetoXML : TLm_bkpdfe;
   DaoObjetoXML : TDaoBkpdfe;
   FieldFiltros : TFieldFiltros;
   Ordenaby     : TOrdenaBy;

implementation

uses
  uMetodosUteis;

label GOTOUpdate;
{ TDaoBkpdfe }

function TDaoBkpdfe.fCarregaXMLEnvio(pObjXML : TLm_bkpdfe): Boolean;
var wDataSet : TDataSet;
    wChaveAux : string;
    wControle : Integer;
    wSQL : string;
begin
  wDataSet := TDataSet.Create(Application);
  try
    try
      with DM_NFEDFE do
      begin
        if (DaoObjetoXML.fConsultaObjXML(pObjXML,['chave'])) then
        begin
          wControle := Dao.Salvar(pObjXML);
          AddLog('CRUD_ORM','J:\','Update id:'+IntToStr(pObjXML.Id));
        end
        else
        begin
           pObjXML.Id := fNextId(pObjXML);
           wControle:= Dao.Inserir(pObjXML);
           AddLog('CRUD_ORM','J:\','Inseriu id:'+IntToStr(pObjXML.Id));
        end;

        Result := (wControle > 0);
      end;
    except on E: Exception do
           begin
             ShowMessage(e.Message);
           end;
    end;
  finally
   FreeAndNil(wDataSet);
  end;
end;

function TDaoBkpdfe.fCarregaXMLRetorno(pObjXML: TLm_bkpdfe): Boolean;
var wDataSet : TDataSet;
begin
  wDataSet := TDataSet.Create(Application);
  try
    try
      with DM_NFEDFE do
      begin
//      if fConsultaTabXML(ptabXML,['chave']) then
        wDataSet := Dao.ConsultaTab(pObjXML,['chave']);

        if (wDataSet.RecordCount = 1) and
           (wDataSet.FieldByName('chave').AsString = pObjXML.Chave) then
        begin
          pObjXML.Id := wDataSet.FieldByName('id').AsInteger;
          Result := Dao.Salvar(pObjXML,['id','chave','Dataemissao','Datarecto','Tipoambiente','Xmlenvio']) > 0
        end
        else
          Result := Dao.Inserir(pObjXML,['id'],fcIgnore) > 0;
      end;

    except on E: Exception do
    end;
  finally
   FreeAndNil(wDataSet);
  end;
end;

function TDaoBkpdfe.fConsultaObjXML(var pObjXML: TLm_bkpdfe; pCampos: array of string): Boolean;
var wDataSet : TDataSet;
    wStream : TStream;
    i: Integer;
begin
  REsult := False;
  wDataSet := TDataSet.Create(Application);
    try
      with DM_NFEDFE do
      begin
        wDataSet := dao.ConsultaTab(pObjXML, pCampos);
        wDataSet.Close;
        wDataSet.Open;
        wDataSet.Edit;
        with wDataSet do
        if RecordCount = 1 then
        begin
          if (pObjXML.Id < 1) then
            pObjXML.Id := FieldByName('id').AsInteger;

          if (pObjXML.Chave = '') then
            pObjXML.Chave := FieldByName('chave').AsString;

          if (pObjXML.Idf_documento = 0) then
            pObjXML.Idf_documento := FieldByName('Idf_documento').AsInteger;

          if (pObjXML.Dataemissao = 0)then
            pObjXML.Dataemissao := FieldByName('Dataemissao').AsDateTime;

          if (pObjXML.Datarecto = 0) then
            pObjXML.Datarecto := FieldByName('Datarecto').AsDateTime;

          if (pObjXML.Motivo = '') then
            pObjXML.Motivo := FieldByName('Motivo').AsString;

          if (pObjXML.Protocolocanc = '') then
            pObjXML.Protocolocanc := FieldByName('Protocolocanc').AsString;

          if (pObjXML.Protocolorecto = '') then
            pObjXML.Protocolorecto := FieldByName('Protocolorecto').AsString;

          if (pObjXML.Dataalteracao = 0) then
          pObjXML.Dataalteracao := Trunc(Now); //FieldByName('Dataalteracao').AsDateTime;

          if (pObjXML.Tipo = '') then
          pObjXML.Tipo := FieldByName('Tipo').AsString;

          if (pObjXML.Emailsnotificados = '') then
          pObjXML.Emailsnotificados := FieldByName('Emailsnotificados').AsString;

          if (pObjXML.Tipoambiente = '') then
          pObjXML.Tipoambiente := FieldByName('Tipoambiente').AsString;

          if (pObjXML.Motivocanc = '') then
          pObjXML.Motivocanc := FieldByName('Motivocanc').AsString;

          if (pObjXML.Protocoloaut = '') then
          pObjXML.Protocoloaut := FieldByName('Protocoloaut').AsString;

          wStream := wDataSet.CreateBlobStream(wDataSet.FieldByName('CAMPOSTREAM'),bmReadWrite);
          if Assigned(wStream) then
          begin
            if not Assigned(pObjXML.CampoStream) then
              pObjXML.CampoStream :=  wStream;
          end
          else
           wStream := nil;

          wStream := wDataSet.CreateBlobStream(wDataSet.FieldByName('Xmlenvio'),bmReadWrite);
          if Assigned(wStream) then
          begin
            if not Assigned(pObjXML.Xmlenvio) then
              pObjXML.Xmlenvio:=  wStream;
          end
          else
           wStream := nil;

          wStream := wDataSet.CreateBlobStream(wDataSet.FieldByName('Xmlextend'),bmReadWrite);
          if Assigned(wStream) then
          begin
            if not Assigned(pObjXML.Xmlextend) then
              pObjXML.Xmlextend:=  wStream;
          end
          else
           wStream := nil;

          wStream := wDataSet.CreateBlobStream(wDataSet.FieldByName('Xmlenviocanc'),bmReadWrite);
          if Assigned(wStream) then
          begin
            if not Assigned(pObjXML.Xmlenviocanc) then
              pObjXML.Xmlenviocanc :=  wStream;
          end
          else
           wStream := nil;

          wStream := wDataSet.CreateBlobStream(wDataSet.FieldByName('Xmlextendcanc'),bmReadWrite);
          if Assigned(wStream) then
          begin
            if not Assigned(pObjXML.Xmlextendcanc) then
              pObjXML.Xmlextendcanc :=  wStream;
          end
          else
           wStream := nil;

          Result := true;
        end;
      end;
    except on E: Exception do
    end;
end;

function TDaoBkpdfe.fFindChaveXML(var pObjXML: TLm_bkpdfe): Boolean;
var wDataSet : TDataSet;
begin
  wDataSet := TDataSet.Create(Application);
  try
  with DM_NFEDFE do
  begin
    if pObjXML.Chave = '' then
    begin
      Result := False;
      Exit;
    end;

    wDataSet := Dao.ConsultaTab(pObjXML,['Chave']);

    if wDataSet.RecordCount > 0 then
    begin
      if wDataSet.FieldByName('Chave').AsString = pObjXML.Chave then
        Result := True;
    end;

  end;

  finally
    FreeAndNil(wDataSet);
  end;

end;

function TDaoBkpdfe.fNextId(pObjXML: TLm_bkpdfe): integer;
var wDataSet: TDataset;
begin
  if not Assigned(pObjXML) then
    pObjXML := TLm_bkpdfe.Create;

  Result := 0;
  pObjXML.Id := Result;
  wDataSet := TDataSet.Create(Application);
  try
    try
      wDataSet := DM_NFEDFE.dao.ConsultaAll(pObjXML,'id' );
      wDataSet.Close;
      wDataSet.Open;
      wDataSet.last;
      Result := wDataSet.FieldByName('id').AsInteger+1;
    except on E: Exception do
             ShowMessage('Erro no m�todo fNextId '+#10#13+e.Message);
    end;
  finally
    FreeAndNil(wDataSet);
  end;
end;

procedure TDaoBkpdfe.fFiltraOrdena(pFieldNameOrder: TFieldFiltros = ffCHAVE; pUpDown: TOrdenaBy = obyNone ;pFieldName: string = ''; pDtINI: TDate = 0; pDtFin: TDate = 0 ; pValue1: string = '';pValue2: string = '');
var data1STR, data2STR, str1, str2:string;
    wDataSet : TDataSet;
    wUpDown: string;
    wV1Empty, wV2Empty : boolean;
const cAsc = 'Asc'; cdesc = 'desc';


  procedure FiltroData(pFieldOrder:string);
  begin
    try
      with DM_NFEDFE, sqlBkpDfe do
      begin
        DateTimeToString(data1STR, 'yyyy/mm/dd', pDtINI);
        data1STR := QuotedStr(data1STR);
        DateTimeToString(data2STR, 'yyyy/mm/dd', pDtFin);
        data2STR := QuotedStr(data2STR);
        SQL.Clear;
        SQL.Add('Select * from lm_bkpdfe ');
        SQL.Add( 'where ');
        str1 := Format('(%s between %s and %s) ',[pFieldName,data1STR, data2STR]);
        SQL.Add(str1);

        if pUpDown = obyNone then
        begin
          str1 := Format(' order by %s %s',[pFieldOrder, wUpDown]);
          SQL.Add(str1);
        end;

//        if mostraSQL then
//          ShowMessage(SQL.Text);

        sqlBkpDfe.Open;
        wDataSet := sqlBkpDfe;
        dsBkpdfe.DataSet := wDataSet;
        cdsBkpdfe.Close;
        cdsBkpdfe.Open;
        Application.ProcessMessages;
      end;
    except on E: Exception do

    end;
  end;

  procedure Filtro(pFieldOrder:string);
  var wOrdData: Boolean;
      auxFF : TFieldFiltros;
  begin
      auxFF := TConvert<TFieldFiltros>.StrConvertEnum('ff'+pFieldOrder);
      wOrdData := ((auxFF = ffDATARECTO) or (auxFF = ffDATAALTERACAO));
    try
      with DM_NFEDFE, sqlBkpDfe do
      begin
//        if not wOrdData then
//        begin
          DateTimeToString(data1STR, 'yyyy/mm/dd', pDtINI);
          data1STR := QuotedStr(data1STR);
          DateTimeToString(data2STR, 'yyyy/mm/dd', pDtFin);
          data2STR := QuotedStr(data2STR);
//        end;

        SQL.Clear;
        SQL.Add('Select * from lm_bkpdfe ');

//        if wOrdData and (not wV1Empty or not wV2Empty) then
//          SQL.Add( 'where ')
//        else
//        begin
          SQL.Add( 'where ');
          str1 := Format('(DATAALTERACAO between %s and %s) ',[data1STR, data2STR]);
          SQL.Add(str1);
//        end;
//
//        if not wV1Empty and not wV2Empty then
//        begin
//          if pValue1 = pValue2 then
//            str1 := Format('and (%s = %s) ',[pValue1, pValue2])
//          else
//            str1 := Format('and (%s between %s and %s) ',[pFieldOrder, pValue1, pValue2]);
//
//          SQL.Add(str1);
//        end
//        else
//        if wV1Empty and wV2Empty then
//        begin
//          if pValue1 = pValue2 then
//            str1 := Format('%s = %s',[pValue1, pValue2])
//          else
//            str1 := Format('%s between %s and %s ',[pFieldOrder, pValue1, pValue2]);
//
//          SQL.Add(str1);
//        end
//        else
//        if not wV1Empty then
//        begin
//          str1 := Format('(%s = %s)',[pFieldOrder, pValue1]);
//          SQL.Add(str1);
//        end
//        else
//        if not wV2Empty then
//        begin
//          str1 := Format('(%s = %s)',[pFieldOrder, pValue2]);
//          SQL.Add(str1);
//        end;

        if pUpDown <> obyNone then
        begin
          str1 := Format(' order by %s %s',[pFieldOrder, wUpDown]);
          SQL.Add(str1);
        end;

//        if mostraSQL then
//          ShowMessage(SQL.Text);

        sqlBkpDfe.Open;
        wDataSet := sqlBkpDfe;
        dsBkpdfe.DataSet := wDataSet;
        cdsBkpdfe.Close;
        cdsBkpdfe.Open;
        Application.ProcessMessages;
      end;
    except on E: Exception do

    end;
  end;


begin
    wV1Empty := pValue1 = '';
    wV2Empty := pValue2 = '';

    case pUpDown of
      obyASCENDENTE: wUpDown := cAsc;
      obyDESCEDENTE: wUpDown := cdesc;
    end;

    case pFieldNameOrder of
      ffID: begin end;
      ffCHAVE: begin Filtro('CHAVE') end;
      ffIDF_DOCUMENTO: begin Filtro('IDF_DOCUMENTO') end;
      ffDATAEMISSAO: begin FiltroData('DATAEMISSAO') end;
      ffDATARECTO: begin Filtro('DATARECTO') end;
      ffMOTIVO: begin Filtro('MOTIVO') end;
      ffPROTOCOLOCANC: begin Filtro('PROTOCOLOCANC') end;
      ffPROTOCOLORECTO: begin Filtro('PROTOCOLORECTO') end;
      ffDATAALTERACAO: begin Filtro('DATAALTERACAO') end;
      ffTIPO: begin Filtro('TIPO') end;
      ffEMAILSNOTIFICADOS: begin Filtro('EMAILSNOTIFICADOS') end;
      ffTIPOAMBIENTE: begin Filtro('TIPOAMBIENTE') end;
      ffXMLENVIO: begin Filtro('ID') end;
      ffXMLEXTEND: begin Filtro('ID') end;
      ffMOTIVOCANC: begin Filtro('MOTIVOCANC') end;
      ffXMLENVIOCANC: begin Filtro('ID') end;
      ffXMLEXTENDCANC: begin Filtro('ID') end;
      ffPROTOCOLOAUT: begin Filtro('PROTOCOLOAUT') end;

    end;

end;

function TDaoBkpdfe.fTotalArquivos(pTabela: TLm_bkpdfe): Integer;
begin
  if not Assigned(pTabela) then
    Exit;

  Result := 0;
  try
    try
       with DM_NFEDFE do
       begin
         Result := Dao.GetRecordCount(pTabela, ['id']);
       end;
    except on E: Exception do
    end;
  finally
  end;
end;

end.