unit uDMnfebkp;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird,
  Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, Data.DBXInterBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  //ORM
  Base, DaoFD, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM_NFEDFE = class(TDataModule)
    conConexaoFD: TFDConnection;
    fdtrTransacao: TFDTransaction;
    fdWaitCursor: TFDGUIxWaitCursor;
    fddrfbDriver: TFDPhysFBDriverLink;
    sqlConfiguracoes: TFDQuery;
    dsConfiguracoes: TDataSource;
    dsBkpdfe: TDataSource;
    cdsBkpdfe: TClientDataSet;
    provBkpdfe: TDataSetProvider;
    sqlBkpDfe: TFDQuery;
    cdsBkpdfeID: TIntegerField;
    cdsBkpdfeCHAVE: TStringField;
    cdsBkpdfeIDF_DOCUMENTO: TIntegerField;
    cdsBkpdfeDATAEMISSAO: TDateField;
    cdsBkpdfeDATARECTO: TDateField;
    cdsBkpdfeMOTIVO: TStringField;
    cdsBkpdfePROTOCOLOCANC: TStringField;
    cdsBkpdfePROTOCOLORECTO: TStringField;
    cdsBkpdfeDATAALTERACAO: TDateField;
    cdsBkpdfeTIPO: TStringField;
    cdsBkpdfeEMAILSNOTIFICADOS: TStringField;
    cdsBkpdfeTIPOAMBIENTE: TStringField;
    cdsBkpdfeXMLENVIO: TBlobField;
    cdsBkpdfeXMLEXTEND: TBlobField;
    cdsBkpdfeMOTIVOCANC: TStringField;
    cdsBkpdfeXMLENVIOCANC: TBlobField;
    cdsBkpdfeXMLEXTENDCANC: TBlobField;
    cdsBkpdfePROTOCOLOAUT: TStringField;
    dsUsuarios: TDataSource;
    cdsUsuarios: TClientDataSet;
    provUsuarios: TDataSetProvider;
    sqlUsuarios: TFDQuery;
    cdsConfiguracoes: TClientDataSet;
    provConfiguracoes: TDataSetProvider;
    cdsUsuariosID: TIntegerField;
    cdsUsuariosUSUARIO: TStringField;
    cdsUsuariosSENHA: TStringField;
    cdsConfiguracoesID: TIntegerField;
    cdsConfiguracoesNAMEBD: TStringField;
    cdsConfiguracoesPATHBD: TStringField;
    cdsConfiguracoesSENHABD: TStringField;
    cdsConfiguracoesUSUARIOBD: TStringField;
    cdsConfiguracoesNFEPATHSEND: TStringField;
    cdsConfiguracoesNFEPATHRETURN: TStringField;
    cdsConfiguracoesPATHRETENVNFE: TStringField;
    cdsConfiguracoesPATHRETCANCNFE: TStringField;
    cdsConfiguracoesPATHRETINUTNFE: TStringField;
    cdsConfiguracoesEXTAUTNFE: TStringField;
    cdsConfiguracoesEXTINUTNFE: TStringField;
    cdsConfiguracoesEXTCANCNFE: TStringField;
    cdsConfiguracoesNFCEPATHSEND: TStringField;
    cdsConfiguracoesNFCEPATHRETURN: TStringField;
    cdsConfiguracoesPATHRETENVNFCE: TStringField;
    cdsConfiguracoesPATHRETCANCNFCE: TStringField;
    cdsConfiguracoesPATHRETINUTNFCE: TStringField;
    cdsConfiguracoesEXTAUTNFCE: TStringField;
    cdsConfiguracoesEXTINUTNFCE: TStringField;
    cdsConfiguracoesEXTCANCNFCE: TStringField;
    cdsConfiguracoesNFSEPATHSEND: TStringField;
    cdsConfiguracoesNFSEPATHRETURN: TStringField;
    cdsConfiguracoesPATHRETENVNFSE: TStringField;
    cdsConfiguracoesPATHRETCANCNFSE: TStringField;
    cdsConfiguracoesPATHRETINUTNFSE: TStringField;
    cdsConfiguracoesEXTAUTNFSE: TStringField;
    cdsConfiguracoesEXTINUTNFSE: TStringField;
    cdsConfiguracoesEXTCANCNFSE: TStringField;
    cdsConfiguracoesDESCRICONFIG: TStringField;
    cdsConfiguracoesIDUSUARIO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Dao   : TDaoFD;
  end;

var
  DM_NFEDFE: TDM_NFEDFE;

implementation

uses
  ConfigPadrao, Configuracoes, Usuarios, Lm_bkpdfe, uMetodosUteis, dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM_NFEDFE.DataModuleCreate(Sender: TObject);
begin
  Dao := TDaoFD.Create(conConexaoFD, fdtrTransacao);

  tabConfigpadrao := TConfigpadrao.create;
  daoConfigPadrao := TDaoConfigPadrao.Create;

  tabConfiguracoes := TConfiguracoes.Create;
  daoConfiguracoes := TDaoConfiguracoes.Create;

  tabUsuarios  := TUsuarios.Create;
  daoUsuarios := TDaoCadUsuario.create;

  ObjetoXML := TLm_bkpdfe.Create;
  DaoObjetoXML := TDaoBkpdfe.Create;

  ConexaoBD(DM_NFEDFE.conConexaoFD, fddrfbDriver);

end;

end.