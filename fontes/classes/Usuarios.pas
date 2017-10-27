unit Usuarios;

interface

uses
  Base, Atributos,Data.DB,Vcl.Dialogs,uDMnfebkp, System.SysUtils,uMetodosUteis;

 type
   TEventoTelaUsuario = (etuSalvar, etuInserir, etuEditar, etuDeletar, etuConsultar);

  [attTabela('USUARIOS')]
  TUsuarios = class(TTabela)
  private
    FId: Integer;
    FUsuario: string;
    FSenha: string;
    FConfigSalva: Integer;
  public
    [attPK]
    property Id: Integer read FId write FId;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
    property ConfigSalva: Integer read FConfigSalva write FConfigSalva;
  end;

   TDaoLogin = class(TObject)
   public
     function fLogar(var prUsuario : TUsuarios): Boolean;
   private

   end;

   TDaoCadUsuario = class(TTabela)
   public
     function fInserir(pTab: TUsuarios): Integer;
     function fSalvar(pTab: TUsuarios): Boolean;
     function fExcluir(pTab : TUsuarios): Boolean;
     function fBuscar(pTab: TUsuarios): TDataSet;

   private

   end;

   var
    tabUsuarios : TUsuarios;
    daoUsuarios : TDaoCadUsuario;
    daoLogin    : TDaoLogin;
    evtTelaUsuarios : TEventoTelaUsuario;

implementation
{ TDaoLogin }
function TDaoCadUsuario.fSalvar(pTab: TUsuarios): Boolean;
begin
  try
  Result := False;
  with DM_NFEDFE do
  begin
    Dao.StartTransaction;
    try
      Result := Dao.Salvar(pTab,['id','ConfigSalva']) > 0;
      Dao.Commit;
    except on E: Exception do
      begin
        Dao.RollBack;
        ShowMessage('Ocorreu um problema ao executar opera��o: ' + e.Message);
      end;
    end;
  end;
  finally

  end;

end;

function TDaoCadUsuario.fBuscar(pTab: TUsuarios): TDataSet;
var Registros : Integer;
  wDataSet : TDataSet;
begin
  wDataSet := TDataSet.Create(nil);
  try
      Registros := DM_NFEDFE.Dao.Buscar(pTab);
      if Registros > 0 then
      begin
         Result := wDataSet;
      end
      else
      ShowMessage('Registro n�o encontrado!');
  finally
  end;
end;

function TDaoCadUsuario.fExcluir(pTab: TUsuarios): Boolean;
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

            ShowMessage('Ocorreu um problema ao executar opera��o: ' + e.Message);
          end;
        end;
     end;
  finally
    ptab.Free;
  end;
end;

function TDaoCadUsuario.fInserir(ptab: TUsuarios): Integer;
begin
  try
    Result := 0;
    with DM_NFEDFE do
     begin
       Dao.StartTransaction;
        try
          Result := Dao.Inserir(pTab);
          Dao.Commit;
        except
          on E: Exception do
          begin
            if Dao.InTransaction then
              Dao.RollBack;

            ShowMessage('Ocorreu um problema ao executar opera��o: ' + e.Message);
          end;
        end;
     end;
  finally
    ptab.Free;
  end;
end;

function TDaoLogin.fLogar(var prUsuario: TUsuarios): Boolean;
var wID : integer;
    wSenhaDia : String;
begin
  Result := false;


  with DM_NFEDFE.sqlUsuarios, prUsuario do
  begin
    wSenhaDia := fSenhaAtual('');
    Result := CompareStr(wSenhaDia, Senha) = 0;

    if Result then
      exit;

    if DM_NFEDFE.Dao.GetRecordCount(prUsuario, ['id']) < 0 then
        exit;

    Close;
    SQL.Clear;
    SQL.Add('Select * from usuarios');
    SQL.Add('where (usuario = :pusuario) and (Senha = :pSenha)');
    ParamByName('pusuario').AsString := Trim(Usuario);
    ParamByName('pSenha').AsString := Trim(Senha);
    open;

    Result := (RecordCount = 1);

    with prUsuario do
    if Result then
    begin
      Id := FieldByName('id').AsInteger;
      Usuario := FieldByName('Usuario').AsString;
      Senha  := FieldByName('Senha').AsString;
      ConfigSalva := FieldByName('ConfigSalva').AsInteger;
    end;

    wId := DM_NFEDFE.sqlUsuarios.FieldByName('id').AsInteger;
  end;
end;

end.
