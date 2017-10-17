unit Configpadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls,
  FireDAC.Comp.Client,
  Data.DB, Base, atributos,uDMnfebkp,DaoFD;

type
  [attTabela('CONFIGPADRAO')]
  TConfigPadrao = class(TTabela)
  private
    FId: Integer;
    FIdusuario: Integer;
    FDescriconfig: string;
    FNamebd: string;
    FPathbd: string;
    FSenhabd: string;
    FUsuariobd: string;
    FNfepathsend: string;
    FNfepathreturn: string;
    FPathretenvnfe: string;
    FPathretcancnfe: string;
    FPathretinutnfe: string;
    FExtautnfe: string;
    FExtinutnfe: string;
    FExtcancnfe: string;
    FNfcepathsend: string;
    FNfcepathreturn: string;
    FPathretenvnfce: string;
    FPathretcancnfce: string;
    FPathretinutnfce: string;
    FExtautnfce: string;
    FExtinutnfce: string;
    FExtcancnfce: string;
    FNfsepathsend: string;
    FNfsepathreturn: string;
    FPathretenvnfse: string;
    FPathretcancnfse: string;
    FPathretinutnfse: string;
    FExtautnfse: string;
    FExtinutnfse: string;
    FExtcancnfse: string;
  public
    [attPK]
    property Id: Integer read FId write FId;
    property Idusuario: Integer read FIdusuario write FIdusuario;
    property Descriconfig: string read FDescriconfig write FDescriconfig;
    property Namebd: string read FNamebd write FNamebd;
    property Pathbd: string read FPathbd write FPathbd;
    property Senhabd: string read FSenhabd write FSenhabd;
    property Usuariobd: string read FUsuariobd write FUsuariobd;
    property Nfepathsend: string read FNfepathsend write FNfepathsend;
    property Nfepathreturn: string read FNfepathreturn write FNfepathreturn;
    property Pathretenvnfe: string read FPathretenvnfe write FPathretenvnfe;
    property Pathretcancnfe: string read FPathretcancnfe write FPathretcancnfe;
    property Pathretinutnfe: string read FPathretinutnfe write FPathretinutnfe;
    property Extautnfe: string read FExtautnfe write FExtautnfe;
    property Extinutnfe: string read FExtinutnfe write FExtinutnfe;
    property Extcancnfe: string read FExtcancnfe write FExtcancnfe;
    property Nfcepathsend: string read FNfcepathsend write FNfcepathsend;
    property Nfcepathreturn: string read FNfcepathreturn write FNfcepathreturn;
    property Pathretenvnfce: string read FPathretenvnfce write FPathretenvnfce;
    property Pathretcancnfce: string read FPathretcancnfce write FPathretcancnfce;
    property Pathretinutnfce: string read FPathretinutnfce write FPathretinutnfce;
    property Extautnfce: string read FExtautnfce write FExtautnfce;
    property Extinutnfce: string read FExtinutnfce write FExtinutnfce;
    property Extcancnfce: string read FExtcancnfce write FExtcancnfce;
    property Nfsepathsend: string read FNfsepathsend write FNfsepathsend;
    property Nfsepathreturn: string read FNfsepathreturn write FNfsepathreturn;
    property Pathretenvnfse: string read FPathretenvnfse write FPathretenvnfse;
    property Pathretcancnfse: string read FPathretcancnfse write FPathretcancnfse;
    property Pathretinutnfse: string read FPathretinutnfse write FPathretinutnfse;
    property Extautnfse: string read FExtautnfse write FExtautnfse;
    property Extinutnfse: string read FExtinutnfse write FExtinutnfse;
    property Extcancnfse: string read FExtcancnfse write FExtcancnfse;
  end;


  TDaoConfigPadrao = class(TObject)
    private

    public
      function fCarregaConfigPadrao (var pTab: TConfigPadrao; aCampos : array of string): TDataSet;
      function fSalvarConfigPadrao (pTab: TConfigPadrao): Boolean;
      function fInserirConfigPadrao(ptab: TConfigPadrao): Integer;
      function fExcluirConfigPadrao(pTab: TConfigPadrao): Boolean;

    published
  end;

  var
   tabConfigpadrao : TConfigPadrao;
   daoConfigPadrao : TDaoConfigPadrao;
implementation


{ TDaoConfigPadrao }

function TDaoConfigPadrao.fSalvarConfigPadrao(pTab: TConfigPadrao): Boolean;
begin
  try
    if not Assigned(pTab) then
      Result := False;

    with DM_NFEDFE do
    begin
      Dao.StartTransaction;
      try
        Result := Dao.Salvar(pTab) > 0;
        Dao.Commit;
      except on E: Exception do
        begin
          Dao.RollBack;
          ShowMessage('Ocorreu um problema ao executar o m�todo fSalvarConfiguracoes: ' + e.Message);
        end;
      end;
    end;
  finally
    ptab.Free;
  end;
end;

function TDaoConfigPadrao.fExcluirConfigPadrao(pTab: TConfigPadrao): Boolean;
begin
  try
  Result := False;
  with DM_NFEDFE do
  begin
    Dao.StartTransaction;
    try
    Result := (Dao.Excluir(pTab) > 0);
    Dao.Commit;
    except
      on E: Exception do
      begin
        if Dao.InTransaction then
          Dao.RollBack;

        ShowMessage('Ocorreu um problema ao executar o m�todo fExcluirConfigPadrao: ' + e.Message);
      end;
    end;
  end;
  finally
    ptab.Free;
  end;
end;

function TDaoConfigPadrao.fInserirConfigPadrao(ptab: TConfigPadrao): Integer;
var tabAux : TConfigPadrao;
begin
  try
    tabAux := pTab;
    Result := 0;
    with DM_NFEDFE do
     begin
       Dao.StartTransaction;
        try
          Result := Dao.Inserir(tabAux);
          Dao.Commit;
        except
          on E: Exception do
          begin
            if Dao.InTransaction then
              Dao.RollBack;

            ShowMessage('Ocorreu um problema ao executar o m�todo fInserirConfigPadrao: ' + e.Message);
          end;
        end;
     end;
  finally
//    FreeAndNil(tabAux);
  end;

end;

function TDaoConfigPadrao.fCarregaConfigPadrao(var pTab: TConfigPadrao;
  aCampos: array of string): TDataSet;
var
  DatSet : TDataSet;
begin
  DatSet := TDataSet.Create(nil);
  try
    with DM_NFEDFE, pTab do
    begin
      DatSet := DM_NFEDFE.Dao.ConsultaTab(pTab, aCampos);

      if DatSet.RecordCount >= 1 then
      begin
        Fid := DatSet.FieldByName('id').AsInteger;
        FDescriConfig := DatSet.FieldByName('DescriConfig').AsString;
        FIDusuario := DatSet.FieldByName('IDusuario').AsInteger;
        FUsuarioBD := DatSet.FieldByName('UsuarioBD').AsString;
        FSenhaBD := DatSet.FieldByName('SenhaBD').AsString;
        FPathBD := DatSet.FieldByName('PathBD').AsString;
        FNameBD := DatSet.FieldByName('NameBD').AsString;
        FNFePathSend := DatSet.FieldByName('NFePathSend').AsString;
        FNFePathReturn := DatSet.FieldByName('NFePathReturn').AsString;
        FPathRetEnvNFe := DatSet.FieldByName('PathRetEnvNFe').AsString;
        FPathRetCancNFe := DatSet.FieldByName('PathRetCancNFe').AsString;
        FPathRetInutNFe := DatSet.FieldByName('PathRetInutNFe').AsString;
        FExtAutNFe := DatSet.FieldByName('ExtAutNFe').AsString;
        FExtCancNFe := DatSet.FieldByName('ExtCancNFe').AsString;
        FExtInutNFe := DatSet.FieldByName('ExtInutNFe').AsString;
        FNFCePathSend := DatSet.FieldByName('NFCePathSend').AsString;
        FNFCePathReturn := DatSet.FieldByName('NFCePathReturn').AsString;
        FPathRetEnvNFCe := DatSet.FieldByName('PathRetEnvNFCe').AsString;
        FPathRetCancNFCe := DatSet.FieldByName('PathRetCancNFCe').AsString;
        FPathRetInutNFCe := DatSet.FieldByName('PathRetInutNFCe').AsString;
        FExtAutNFCe := DatSet.FieldByName('ExtAutNFCe').AsString;
        FExtCancNFCe := DatSet.FieldByName('ExtCancNFCe').AsString;
        FExtInutNFCe := DatSet.FieldByName('ExtInutNFCe').AsString;
        FNFSePathSend := DatSet.FieldByName('NFSePathSend').AsString;
        FNFSePathReturn := DatSet.FieldByName('NFSePathReturn').AsString;
        FPathRetEnvNFSe := DatSet.FieldByName('PathRetEnvNFSe').AsString;
        FPathRetCancNFSe := DatSet.FieldByName('PathRetCancNFSe').AsString;
        FPathRetInutNFSe := DatSet.FieldByName('PathRetInutNFSe').AsString;
        FExtAutNFSe := DatSet.FieldByName('ExtAutNFSe').AsString;
        FExtCancNFSe := DatSet.FieldByName('ExtCancNFSe').AsString;
        FExtInutNFSe := DatSet.FieldByName('ExtInutNFSe').AsString;
        result := DatSet;
      end
      else
      begin
        ShowMessage('Registro n�o encontrado!');
        result := nil;
        Exit;
      end;
    end;
  finally
   DatSet.Free;
  end;

end;

end.
