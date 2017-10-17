unit Atributos;

interface

uses
  Base, Rtti, System.Classes, dialogs;

type
  AttTabela = class(TCustomAttribute)
  private
    FNome: string;
  public
    constructor Create(ANomeTabela: string);
    property Nome: string read FNome write FNome;
  end;

  // Atributos de Chave Primaria e Relacionamentos
  AttPK = class(TCustomAttribute)
  end;

  // Atributos de Valida��o
  AttBaseValidacao = class(TCustomAttribute)
  private
    FMensagemErro: string;
    procedure SetMessagemErro(const Value: string);
  public
    property MessagemErro: string read FMensagemErro write SetMessagemErro;
  end;

  AttNotNull = class(AttBaseValidacao)
  public
    Field1: Integer;
    constructor Create(const ANomeCampo: string);
    function ValidarString(Value: string): Boolean;
    function ValidarInteger(Value: Integer): Boolean;
    function ValidarFloat(Value: Double): Boolean;
    function ValidarData(Value: Double): Boolean;
  end;

  AttMinValue = class(AttBaseValidacao)
  private
    FValorMinimo: Double;
  public
    constructor Create(ValorMinimo: Double; const ANomeCampo: string);
    function Validar(Value: Double): Boolean;
  end;

  AttMaxValue = class(AttBaseValidacao)
  private
    FValorMaximo: Double;
  public
    constructor Create(ValorMaximo: Double; const ANomeCampo: string);
    function Validar(Value: Double): Boolean;
  end;

  // Comandos de atributos
  IAtributos = interface
    function PropExiste(ACampo: string; Prop: TRttiProperty;
      RttiType: TRttiType): Boolean;

    function PegaNomeTab(ATabela: TTabela): string;
    function PegaPks(ATabela: TTabela): TCamposArray;
    function LocalizaCampo(ACampo: string; ACampos: array of string): Boolean;

    procedure ValidaTabela(ATabela: TTabela; ACampos: array of string;
      AFlag: TFlagCampos = fcAdd);

    procedure SetarPropriedade(AObj: TObject; AProp: string; AValor: Variant);
    procedure SetarDadosTabela(AProp: TRttiProperty; ACampo: string;
      ATabela: TTabela; AQry: TObject; AParams: IQueryParams);

    procedure ConfiguraParametro(AProp: TRttiProperty; ACampo: string;
      ATabela: TTabela; AQry: TObject; AParams: IQueryParams);

    procedure LimparCampos(ATabela: TTabela);
  end;

  TAtributos = class(TInterfacedObject, IAtributos)
  public
    class function Get: IAtributos;

    function PropExiste(ACampo: string; Prop: TRttiProperty;
      RttiType: TRttiType): Boolean;

    function PegaNomeTab(ATabela: TTabela): string;
    function PegaPks(ATabela: TTabela): TCamposArray;
    function LocalizaCampo(ACampo: string; ACampos: array of string): Boolean;

    procedure ValidaTabela(ATabela: TTabela; ACampos: array of string;
      AFlag: TFlagCampos = fcAdd);

    procedure SetarPropriedade(AObj: TObject; AProp: string; AValor: Variant);
    procedure SetarDadosTabela(AProp: TRttiProperty; ACampo: string;
      ATabela: TTabela; AQry: TObject; AParams: IQueryParams);

    procedure ConfiguraParametro(AProp: TRttiProperty; ACampo: string;
      ATabela: TTabela; AQry: TObject; AParams: IQueryParams);

    procedure LimparCampos(ATabela: TTabela);
  end;


implementation

uses
  System.TypInfo, System.SysUtils, Forms, Winapi.Windows, System.Variants;

{ DaoBase }

procedure TAtributos.ConfiguraParametro(AProp: TRttiProperty; ACampo: string;
  ATabela: TTabela; AQry: TObject; AParams: IQueryParams);
begin
  case AProp.PropertyType.TypeKind of
    tkInt64, tkInteger: AParams.SetParamInteger(AProp, ACampo, ATabela, AQry);

    tkChar, tkString, tkUString: AParams.SetParamString(AProp, ACampo, ATabela, AQry);

    tkFloat:
      begin
        if CompareText(AProp.PropertyType.Name, 'TDate') = 0 then
         AParams.SetParamDate(AProp, ACampo, ATabela, AQry)
        else
        if CompareText(AProp.PropertyType.Name, 'TDateTime') = 0 then
          AParams.SetParamDateTime(AProp, ACampo, ATabela, AQry)
        else
          AParams.SetParamCurrency(AProp, ACampo, ATabela, AQry);
      end;
    tkVariant: AParams.SetParamVariant(AProp, ACampo, ATabela, AQry);

    tkEnumeration: AParams.SetParamBoolean(AProp, ACampo, ATabela, AQry);

    tkClass : if CompareText(AProp.PropertyType.Name, 'TFileStream') = 0 then
              begin
                AParams.SetParamFileStream(AProp, ACampo, ATabela, AQry);
              end
              else
              if CompareText(AProp.PropertyType.Name, 'TStream') = 0 then
              begin
                AParams.SetParamStream(AProp, ACampo, ATabela, AQry);
              end;
  else
    raise Exception.Create('Tipo de campo n�o conhecido: ' +
      AProp.PropertyType.ToString);
  end;
end;

function TAtributos.PropExiste(ACampo: string; Prop: TRttiProperty;
  RttiType: TRttiType): Boolean;
begin
  Result := False;
  for Prop in RttiType.GetProperties do
  begin
    if CompareText(Prop.Name, ACampo) = 0 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TAtributos.LimparCampos(ATabela: TTabela);
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  PropRtti: TRttiProperty;
begin
  Contexto := TRttiContext.Create;
  try
    TipoRtti := Contexto.GetType(ATabela.ClassType);
    for PropRtti in TipoRtti.GetProperties do
    begin
       case PropRtti.PropertyType.TypeKind of
         tkFloat,
         tkInteger: PropRtti.SetValue(ATabela, 0);
       else
         PropRtti.SetValue(ATabela, '');
       end;
    end;
  finally
    Contexto.free;
  end;
end;

procedure TAtributos.SetarDadosTabela(AProp: TRttiProperty; ACampo: string;
  ATabela: TTabela; AQry: TObject; AParams: IQueryParams);
begin
  case AProp.PropertyType.TypeKind of
    tkInt64, tkInteger:
      begin
        AParams.SetCamposInteger(AProp, ACampo, ATabela, AQry);
      end;
    tkChar, tkString, tkUString:
      begin
        AParams.SetCamposString(AProp, ACampo, ATabela, AQry);
      end;
    tkFloat:
      begin
       if CompareText(AProp.PropertyType.Name, 'TDate') = 0 then
          AParams.SetCamposDate(AProp, ACampo, ATabela, AQry)
        else
        if CompareText(AProp.PropertyType.Name, 'TDateTime') = 0 then
          AParams.SetCamposDateTime(AProp, ACampo, ATabela, AQry)
        else
          AParams.SetCamposCurrency(AProp, ACampo, ATabela, AQry);
      end;
    tkEnumeration:
       begin
        if CompareText(AProp.PropertyType.Name, 'Boolean') = 0 then
          AParams.SetCamposBoolean(AProp, ACampo, ATabela, AQry)
        else
          Exit;
       end;

     tkClass:
       begin
         AParams.SetCamposFileStream(AProp, ACampo, ATabela, AQry);
       end

  else
    raise Exception.Create('Tipo de campo n�o conhecido: ' +
      AProp.PropertyType.ToString);
  end;
end;


procedure TAtributos.SetarPropriedade(AObj: TObject; AProp: string; AValor: Variant);
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  PropRtti: TRttiProperty;
begin
  Contexto := TRttiContext.Create;
  try
    TipoRtti := Contexto.GetType(AObj.ClassType);
    for PropRtti in TipoRtti.GetProperties do
    begin
      if CompareText(PropRtti.Name, AProp) = 0 then
      begin
        PropRtti.SetValue(AObj, System.Variants.VarToStr(AValor));
      end;
    end;
  finally
    Contexto.free;
  end;
end;

function TAtributos.PegaNomeTab(ATabela: TTabela): string;
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  AtribRtti: TCustomAttribute;
begin
  Contexto := TRttiContext.Create();
  TipoRtti := Contexto.GetType(ATabela.ClassType);
  try
    for AtribRtti in TipoRtti.GetAttributes do
      if AtribRtti Is AttTabela then//if AtribRtti Is TNomeTabela then
      begin
        Result := (AtribRtti as AttTabela).Nome;
        if Trim(Result) = '' then
          ShowMessage('O nome da tabela e o nome da classe devem ser os mesmos');

        Break;
      end;
  finally
    Contexto.free;
  end;
end;

function TAtributos.LocalizaCampo(ACampo: string; ACampos: array of string): Boolean;
var
 _Campo: string;
begin
  Result := false;
  for _Campo in ACampos do
  begin
    if LowerCase(ACampo) = LowerCase(_Campo)  then
    begin
      Result := true;
      Break;
    end;
  end;
end;

class function TAtributos.Get: IAtributos;
begin
  Result := TAtributos.Create;
end;

procedure TAtributos.ValidaTabela(ATabela: TTabela; ACampos: array of string;
  AFlag: TFlagCampos);
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  PropRtti: TRttiProperty;
  AtribRtti: TCustomAttribute;
  ListaErros: TStrings;
begin
  try
    if not Assigned(ATabela) then
      raise Exception.Create('Tabela n�o foi passada no par�metro!');

    ListaErros := TStringList.Create;
    try
      Contexto := TRttiContext.Create;
      try
        TipoRtti := Contexto.GetType(ATabela.ClassType);
        for PropRtti in TipoRtti.GetProperties do
        begin
          if Length(ACampos) > 0 then
          begin
            if ((AFlag=fcAdd) and (not LocalizaCampo(PropRtti.Name, ACampos))) or
              ((AFlag=fcIgnore) and (LocalizaCampo(PropRtti.Name, ACampos))) then
              Continue;
          end;

          for AtribRtti in PropRtti.GetAttributes do
          begin
            PropRtti.PropertyType.TypeKind;
            if AtribRtti is AttMinValue then
            begin
              if not AttMinValue(AtribRtti)
                .Validar(PropRtti.GetValue(ATabela).AsExtended) then
                ListaErros.Add(AttBaseValidacao(AtribRtti).MessagemErro);
            end;
            if AtribRtti is AttMaxValue then
            begin
              if not AttMinValue(AtribRtti)
                .Validar(PropRtti.GetValue(ATabela).AsExtended) then
                ListaErros.Add(AttBaseValidacao(AtribRtti).MessagemErro);
            end;

            if AtribRtti is AttNotNull then
            begin
              case PropRtti.PropertyType.TypeKind of
                tkFloat:
                  begin
                    if CompareText(PropRtti.PropertyType.Name, 'TDateTime') = 0
                    then
                    begin
                      if not AttNotNull(AtribRtti)
                        .ValidarData(PropRtti.GetValue(ATabela).AsExtended) then
                        ListaErros.Add(AttBaseValidacao(AtribRtti).MessagemErro);
                    end
                    else
                    begin
                      if not AttNotNull(AtribRtti)
                        .ValidarFloat(PropRtti.GetValue(ATabela).AsExtended) then
                        ListaErros.Add(AttBaseValidacao(AtribRtti).MessagemErro);
                    end;
                  end;
                tkInteger:
                  begin
                    if not AttNotNull(AtribRtti)
                      .ValidarInteger(PropRtti.GetValue(ATabela).AsInteger) then
                      ListaErros.Add(AttBaseValidacao(AtribRtti).MessagemErro);
                  end;
              else
                begin
                  if not AttNotNull(AtribRtti)
                    .ValidarString(PropRtti.GetValue(ATabela).AsString) then
                    ListaErros.Add(AttBaseValidacao(AtribRtti).MessagemErro);
                end;
              end;
            end;
          end;
        end;
      finally
        Contexto.free;
      end;

      if ListaErros.Count > 0 then
        raise Exception.Create(PChar(ListaErros.Text));
    finally
      ListaErros.free;
    end;
  except
    raise;
  end;
end;

function TAtributos.PegaPks(ATabela: TTabela): TCamposArray;
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  PropRtti: TRttiProperty;
  AtribRtti: TCustomAttribute;
  i: Integer;
begin
  Contexto := TRttiContext.Create;
  try
    TipoRtti := Contexto.GetType(ATabela.ClassType);
    i := 0;
    for PropRtti in TipoRtti.GetProperties do
      for AtribRtti in PropRtti.GetAttributes do
        if AtribRtti Is AttPK then
        begin
          SetLength(Result, i + 1);
          Result[i] := PropRtti.Name;
          inc(i);
        end;
  finally
    Contexto.free;
  end;
end;

{ TNomeTabela }

constructor AttTabela.Create(ANomeTabela: string);
begin
  FNome := ANomeTabela;
end;

{ TBaseValidacao }

procedure AttBaseValidacao.SetMessagemErro(const Value: string);
begin
  FMensagemErro := Value;
end;

{ TValidaIntegerMinimo }

constructor AttMinValue.Create(ValorMinimo: Double; const ANomeCampo: string);
begin
  FValorMinimo := ValorMinimo;
  FMensagemErro := 'Campo ' + ANomeCampo + ' com valor inv�lido!';
end;

function AttMinValue.Validar(Value: Double): Boolean;
begin
  Result := Value >= FValorMinimo;
end;

constructor AttMaxValue.Create(ValorMaximo: Double; const ANomeCampo: string);
begin
  FValorMaximo := ValorMaximo;
  FMensagemErro := 'Campo ' + ANomeCampo + ' com valor inv�lido!';
end;

function AttMaxValue.Validar(Value: Double): Boolean;
begin
  Result := Value <= FValorMaximo;
end;

{ TValidaStringNaoNulo }

constructor AttNotNull.Create(const ANomeCampo: string);
begin
  FMensagemErro := 'Campo obrigat�rio n�o informado: ' + ANomeCampo ;
end;

function AttNotNull.ValidarString(Value: string): Boolean;
begin
  Result := not(Value = EmptyStr);
end;

function AttNotNull.ValidarInteger(Value: Integer): Boolean;
begin
  Result := not(Value <= 0);
end;

function AttNotNull.ValidarFloat(Value: Double): Boolean;
begin
  Result := not(Value <= 0);
end;

function AttNotNull.ValidarData(Value: Double): Boolean;
begin
  Result := not(Value = 0);
end;

end.
