unit uMetodosUteis;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.IniFiles,
  Data.SqlExpr, FireDAC.Comp.Client,Vcl.ComCtrls,Generics.Collections,TypInfo,System.DateUtils,
  JvBaseDlg, JvSelectDirectory,FireDAC.Phys.FB;

Const
  Threshold2000 : Integer = 2000;

  MinTime = 0;
  MaxTime = 86399;
  BadTime = $FFFFFFFF;

  SecondsInDay = 86400;
  SecondsInHour = 3600;
  SecondsInMinute = 60;
  HoursInDay = 24;
  MinutesInHour = 60;


  type
    TOperacao = (opInserir, opAlterar, opExcluir, opOK, opNil);
    TTipoClass = (tiLabel, tiButton, tiBitBtn, tiEdit, tiPanel, tiComboBox, tiTodos);
    DayType = (Domingo, Segunda, Terca, Quarta, Quinta, Sexta, Sabado);

  TGenerico = 0..255;

   TConvert<T:record> = class
     private

     public
       class procedure PopulateListEnum(AList: TStrings);
       class function StrConvertEnum(const AStr: string):T;
       class function EnumConvertStr(const eEnum:T):string;
     end;

  procedure AddLog(pNameLog,pDirLog, aStr: string);
  procedure setINI(pIniFilePath, prSessao, prSubSessao, prValor:string);
  function getINI(pIniFilePath, prSessao, prSubSessao, prValor:string): string;
  function ConexaoBD(var prCon: TFDConnection; prDriver: TFDPhysFBDriverLink):Boolean;
  function fArqIni(prDir : Boolean= true): string;
  procedure pAtivaCamposForm(pForm: TForm; pEnable: boolean; pLista : array of TTipoClass);
  function fNomePC: string;
  function ExtractName(const Filename: String): String;
  function DateXMLToDate(pDateXML: String): TDate;
  function fOpenFileName(pFilter: array of string;pFilterName: array of string;var prFileName:string;pTitle : string = ''): Boolean;
  function fOpenPath(var pInitialDir: string; pTitle : string = ''): Boolean;
  function fSaveFile(pInitialDir, pFileNAme, pTitle: String; pFilter: array of string = ['All| *.*']): boolean;
  Procedure pZapFiles(pMasc:string);
  procedure pCopyFiles(pFileSource, pFileDest:String; pListErro:Boolean);

  function fSenhaAtual(pData: string):string;
  function fSEsp(Txt: string): string;
  function fSomaDigitos(pValor: LongInt):LongInt;
  function fBinToDec(pValorBin: string): LongInt;
  function fPotencia(pVal, pPot: LongInt): LongInt;
  function fDecToBin(ValorDec: LongInt): string;
  function fInverte(pValor: string; pTipo: Boolean; Pos: LongInt): string;
  function fConsideraPrimeiros(pValor, pNum: LongInt):string;
  function fColocaVerificador(pValor: string; pNum: LongInt):string;
//  function fDesCriptStr(pString : string) : string;
//  function fCripStr(pString : string) : string;
  var
   wOpe : TOperacao = opNil;

implementation

//  { Criptografa uma String }
//  function fCripStr(pString : string) : string;
//  var
//    i   : Integer;
//    ist : string;
//  begin
//     result := '';
//     if pString = '' then
//       Exit;
//
//     pString    := WideUpperCase(pString);
//     ist   :='';
//     for i :=1 to Length(pString) do
//       ist[i] :=  Chr(ord(pString[i])-30-i);
//
//     ist := pString;
//     result   := ist;
//  end;
//
//  { DesCriptografa uma String }
//  function fDesCriptStr(pString : string) : string;
//  var
//    i   : Integer;
//    ist : array of widechar;
//  begin
//     result := '';
//     if pString = '' then
//       Exit;
//     SetLength(ist, Length(pString));
//     pString  := UpperCase(pString);
//     for i:=1 to Length(pString) do
//       ist[i]:= Chr(ord(pString[i])+30+i);
//
//     ist[0] := pString[1];
//     result   := WideCharToString(ist);
//  end;


function fSenhaAtual(pData: string):string;
var
  pNum,
  Bin1,
  Bin2,
  DataStr,
  DataPos: string;
  Data1,
  Data2,
  Data3,
  Data4,
  Data5,
  Data6  : Char;
  x      : Integer;
  Temp,
  Dec1,
  Dec2,
  QuatU,
  DoisP  : LongInt;

begin
  if (fSEsp(pData) = '') or (fSEsp(pData) = '//') then
    DataStr := FormatDateTime('dd/mm/yyyy', now)
  else
  if StrToDate(pData) < now then
  begin
    fSenhaAtual := '0000000';
    Exit;
  end
  else
  DataStr := FormatDateTime('dd/mm/yyyy',StrToDate(pData));

  Data1   := DataStr[1];
  Data2   := DataStr[2];
  Data3   := DataStr[4];
  Data4   := DataStr[5];
  Data5   := DataStr[9];
  Data6   := DataStr[10];

  Val(Data2, Temp, X);

  case Temp of
    1: DataPos := Data3 + Data4 + Data6 + Data5 + Data2 + Data1;
    2: DataPos := Data1 + Data2 + Data6 + Data5 + Data3 + Data4;
    3: DataPos := Data4 + Data3 + Data5 + Data6 + Data1 + Data2;
    4: DataPos := Data3 + Data5 + Data2 + Data1 + Data6 + Data4;
    5: DataPos := Data1 + Data3 + Data5 + Data2 + Data4 + Data6;
    6: DataPos := Data6 + Data4 + Data3 + Data2 + Data5 + Data1;
    7: DataPos := Data2 + Data3 + Data6 + Data5 + Data4 + Data1;
    8: DataPos := Data5 + Data6 + Data2 + Data3 + Data1 + Data4;
    9: DataPos := Data2 + Data6 + Data4 + Data3 + Data1 + Data5;
    0: DataPos := Data5 + Data1 + Data3 + Data4 + Data6 + Data2;
  end;

  Val(Copy(DataPos,3,4), QuatU, X);
  Val(Copy(DataPos,1,2), DoisP, X);
  Val(DataPos, Temp, X);

  QuatU := QuatU + fSomaDigitos(Temp);
  DoisP := DoisP + fSomaDigitos(Temp);

  Dec1 := QuatU * DoisP;

  Bin1 := fDecToBin(Dec1);

  Bin2 := fInverte(Bin1, true, 0);
  Bin2 := fInverte(Bin2, False, 3);

  Dec2 := fBinToDec(Bin1) + fBinToDec(Bin2);

  Dec1 := fSomaDigitos(Dec2);

  Val(Data1 + Data2,Temp,x);
  Dec1 := Dec1 + Temp;

  pNum := fConsideraPrimeiros(Dec2,4) + fConsideraPrimeiros(Dec1,2);

  pNum := fColocaVerificador(pNum, 5);

  fSenhaAtual := pNum;
end;

function fSEsp(Txt: string): string;
var
  i: Integer;
  Aux: string;
begin
  Aux := '';
  for i := 1 to Length(Txt) do
    if Txt[i] <> ' ' then
      Aux := Aux + Txt[i];
  fSEsp := Aux;
end;

function fColocaVerificador(pValor: string; pNum: LongInt):string;
var
  i,
  a,
  x      : Integer;
  Num1,
  Num2,
  Num3,
  Num4,
  Num5,
  Num6,
  Soma,
  Resto  : LongInt;
  Temp,
  VlFinal: string;
begin
  Val(pValor[1],Num1,x);
  Val(pValor[2],Num2,x);
  Val(pValor[3],Num3,x);
  Val(pValor[4],Num4,x);
  Val(pValor[5],Num5,x);
  Val(pValor[6],Num6,x);

  Num1 := Num1 * 9;
  Num2 := Num2 * 8;
  Num3 := Num3 * 7;
  Num4 := Num4 * 6;
  Num5 := Num5 * 5;
  Num6 := Num6 * 4;
  Soma := Num1 + Num2 + Num3 + Num4 + Num5 + Num6;
  Resto:= Soma mod 11;
  Resto:= fSomaDigitos(Resto);

  VlFinal := '';
  a := 0;
  for i := 1 to 7 do
    if i <> pNum then
    begin
      a := a + 1;
      VlFinal := VlFinal + pValor[a];
    end
    else
    begin
      Str(Resto,Temp);
      VlFinal := VlFinal + Temp;
    end;

  fColocaVerificador := VlFinal;
end;

function fConsideraPrimeiros(pValor, pNum: LongInt):string;
var
  i: Integer;
  Numero,
  NumStr: string;
begin
   numero:='';
   Str(pValor,NumStr);

   if Length(NumStr) > pNum then
   begin
     for i := 1 to pNum do
       Numero := Numero + NumStr[i];
   end
   else
   if Length(NumStr) < pNum then
   begin
      Numero := NumStr;
      for i := Length(NumStr) to (pNum - 1) do
        Numero := Numero + '0';
   end
   else
     Str(pValor,Numero);

   fConsideraPrimeiros := Numero;
end;

function fSomaDigitos(pValor: LongInt):LongInt;
var
  ValorS: string;
  i,
  x     : Integer;
  Temp,
  ValorT: LongInt;
begin
  ValorT := 0;
  Str(pValor,ValorS);
  for i := 1 to Length(ValorS) do
  begin
    Val(ValorS[i],Temp,x);
    ValorT := ValorT + Temp;
  end;

  fSomaDigitos := valorT;
end;

function fInverte(pValor: string; pTipo: Boolean; Pos: LongInt): string;
var
  i,
  x      : Integer;
  Temp   : LongInt;
  ValorT : string;

begin
  ValorT := '';

  if pTipo then
    for i := Length(pValor) downto 1 do
      ValorT := ValorT + pValor[i]
  else
    for i := 1 to Length(pValor) do
      if (i + Pos) > Length(pValor) then
      begin
        Val(pValor[i],Temp,x);
        case Temp of
          0: ValorT := ValorT + '1';
          1: ValorT := ValorT + '0';
        end;
      end
      else
        ValorT := ValorT + pValor[i];

    fInverte := ValorT;
end;

function fPotencia(pVal, pPot: LongInt): LongInt;
var
  Nr,
  pValor: LongInt;
begin
  pValor := pVal;
  Nr := pPot;
  if Nr = 0 then
    fPotencia := 1
  else
  begin
    while Nr > 1 do
    begin
        pValor := pValor * pVal;
        Nr := Nr - 1;
    end;
  fPotencia := pValor;
  end;
end;

function fBinToDec(pValorBin: string): LongInt;
var
  ValorStr: string;
  i,
  x       : Integer;
  Temp,
  ValorDec: LongInt;
begin
  ValorStr := pValorBin;
  ValorDec := 0;
  for i := length(ValorStr) downto 1 do
  begin
    Val(ValorStr[i],Temp,x);
    ValorDec := ValorDec + Temp * (fPotencia(2,length(ValorStr)-i));
  end;

  fBinToDec := ValorDec;
end;

function fDecToBin(ValorDec: LongInt): string;
var
  ValorQc: LongInt;
  Resto,
  Temp   : string;
begin
  Resto  := '';
  ValorQc:= ValorDec;

  while ValorQc > 0 do
  begin
    Str(ValorQc mod 2,Temp);
    Resto   := resto + Temp;
    ValorQc := ValorQc div 2;
  end;

  fDecToBin := fInverte(Resto, True, 0);
end;

procedure pCopyFiles(pFileSource, pFileDest:String; pListErro:Boolean);
var wWCSource,wWCDest : array [0..255]  of WideChar;
begin
  StringToWideChar(pFileSource, wWCSource,length(pFileSource)+1);
  StringToWideChar(pFileDest, wWCDest,length(pFileDest)+1);
  CopyFile(wWCSource,wWCDest,pListErro);
end;

Procedure pZapFiles(pMasc:String);
{Apaga arquivos usando mascaras tipo: c:\Temp\*.zip, c:\Temp\*.*
 Obs: Requer o Path dos arquivos a serem deletados}
var Dir : TsearchRec;
    Erro: Integer;
begin
   Erro := FindFirst(pMasc,faArchive,Dir);
   While Erro = 0 do
   begin
      if not (deleteFile(ExtractFilePath(pMasc)+Dir.Name)) then
        AddLog('Cannot delete',ExtractFileDir(Dir.Name),' - '+ ExtractFileName(Dir.Name));
      Erro := FindNext(Dir);
   end;
   FindClose(Dir);
end;

procedure AddLog(pNameLog,pDirLog, aStr: string);
var
 ArqLog: string;
 F :TStringList;
  begin
    F := TStringList.Create;
    try
      try
        ArqLog := pDirLog+'\'+pNameLog+'.log';

        if FileExists(ArqLog) then
         f.LoadFromFile(ArqLog);

        f.Add(Format('[ %s ]: %s', [DateTimeToStr(Now), aStr]));

        f.SaveToFile(ArqLog);
      except on E: Exception do

      end;
    finally
      FreeAndNil(f);
    end;
  end;
function fOpenFileName(pFilter: array of string;pFilterName: array of string;var prFileName:string;pTitle : string = ''): Boolean;
var
  dlgOpenDir : TOpenDialog;
  auxFilter, auxFilterName : string;
  i : Integer;
 begin

  dlgOpenDir := TOpenDialog.Create(Application);
  try
     dlgOpenDir.Filter :='';
     for I := Low(pFilter) to High(pFilter) do
     begin
       dlgOpenDir.Filter := pFilterName[i] + '|' + pFilter[i]+'|';
     end;

     dlgOpenDir.FilterIndex := 0;
     dlgOpenDir.Title := pTitle;
     Result := dlgOpenDir.Execute;

     if Result then
       prFileName := dlgOpenDir.FileName
     else
       prFileName := '';
  finally
    dlgOpenDir.Free;
  end;
end;

function fSaveFile(pInitialDir, pFileName, pTitle: String; pFilter: array of string = ['All| *.*']): boolean;
var  wSaveXML : TSaveDialog;
     I : Integer;

  procedure pMSG(pMsg : Integer);
  begin
    case pMsg of
      0:  begin
            ShowMessage('Diret�rio do '+ ExtractFileName(pFileName) +': '+ExtractFileDir(pFileNAme+' n�o existe!');
          end;

      1: begin
            ShowMessage('Diret�rio: '+pInitialDir+' n�o existe!');
         end;
    end;

    exit;
  end;
begin
  wSaveXML := TSaveDialog.Create(Application);
  try
    for I := Low(pFilter) to High(pFilter) do
      wSaveXML.Filter := pFilter[i]; //'ZIP|*.zip';

  wSaveXML.Title :=  pTitle; //'Salve o arquivo ZIP ';

    if DirectoryExists(ExtractFileDir(pFileName)) then
      wSaveXML.FileName := pFileName
    else
      pMSG(0);

    if  DirectoryExists(pInitialDir) then
      wSaveXML.InitialDir := pInitialDir
    else
     pMsg(1);

    Result :=  wSaveXML.Execute;


  finally
    wSaveXML.Free;
  end;

end;


function fOpenPath(var pInitialDir: string; pTitle : string = ''): Boolean;
var jopdOpenDir : TJvSelectDirectory;
begin
  Result := false;
  jopdOpenDir := TJvSelectDirectory.Create(Application);
  jopdOpenDir.title := pTitle;

  if pInitialDir <> '' then
     if DirectoryExists(pInitialDir) then
        jopdOpenDir.InitialDir := pInitialDir;

  try
     Result := jopdOpenDir.Execute;
     if Result then
       pInitialDir := jopdOpenDir.Directory
     else
       pInitialDir := '';
  finally
    jopdOpenDir.Free;
  end;
end;

function DateXMLToDate(pDateXML: String): TDate;
begin
  Result := 0;
  if pDateXML = '' then
     exit;
            //'aaaa-mm-dd
  Result := StrToDate(Copy(pDateXML,9,2)+'/'+ Copy(pDateXML,6,2)+'/'+Copy(pDateXML,1,4));
end;

function ExtractName(const Filename: String): String;
{Retorna o nome do Arquivo sem extens�o}
var
aExt : String;
aPos : Integer;
begin
aExt := ExtractFileExt(Filename);
Result := ExtractFileName(Filename);
if aExt <> '' then
   begin
   aPos := Pos(aExt,Result);
   if aPos > 0 then
      begin
      Delete(Result,aPos,Length(aExt));
      end;
   end;
end;

function fNomePC: string;
var
buffer: array[0..255] of char;
size: dword;
begin
 size:=256;
 Result :='';

 if GetComputerName(buffer, size) then
   Result := string(buffer);

end;

procedure pAtivaCamposForm(pForm: TForm; pEnable: boolean; pLista : array of TTipoClass);
var i,j : integer;
begin
  if not Assigned(pForm) then
    exit;

  for i:= 0 to pForm.ComponentCount-1 do
  begin

    if pForm.Components[i] is TEdit then
      TEdit (pForm.Components[i]).Enabled := pEnable;

    if pForm.Components[i] is TBitBtn then
      TBitBtn(pForm.Components[i]).Enabled := pEnable;

    if pForm.Components[i] is TButton then
      TBitBtn(pForm.Components[i]).Enabled := pEnable;

    if pForm.Components[i] is TTabSheet then
      TTabSheet(pForm.Components[i]).Enabled := pEnable;
  end;
end;

function ConexaoBD(var prCon: TFDConnection; prDriver: TFDPhysFBDriverLink):Boolean;
var
wPath : string;
wBanco: string;
wFBClient : string;
wUser : string;
wSenha: string;

begin
  try
    Result := False;
//    wUser     := getINI(fArqIni, 'BD', 'USUARIO', '');
//    wSenha    := getINI(fArqIni, 'BD', 'SENHA', '');
//    wPath     := ExtractFileDir(getINI(fArqIni, 'BD', 'ARQUIVO', ''));
//    wFBClient := getINI(fArqIni, 'BD', 'FBCLIENT', '');
//    wBanco    := getINI(fArqIni, 'BD', 'ARQUIVO', '');

//    if not DirectoryExists(wPath) then
//    begin
//      ShowMessage('Diret�rio informado para conexao com o seu banco de dados, N�o Existe'+#10#13+
//                  wPath);
//      Application.Terminate;
//    end;
//
//    if not(FileExists(wFBClient)) then
//    begin
//      ShowMessage('Arquivo FBClient.dll n�o exite!');
//      Application.Terminate;
//    end;
//
//    if not(FileExists(wBanco)) then
//    begin
//      ShowMessage('Banco de dados: '+ExtractFilePath(wBanco)+ ' n�o exite!');
//      Application.Terminate;
//    end;

    prCon.Connected := False;
    prCon.Close;

    prDriver.VendorLib := 'E:\BT\7.0\MaxWin\7357\BKP\fb\fbClient.dll';//wFBClient;
    prCon.Params.Values['User_Name'] := 'sysdba';//wUser;
    prCon.Params.Values['Password']  := 'masterkey';//wSenha;
    prCon.Params.Values['Database']  := 'E:\BT\7.0\MaxWin\7357\BKP\bd\BACKUPXML.FDB'; //wBanco
    prCon.Params.Values['SQLDialect'] := '3';

    prCon.Open;
    Result := prCon.Connected ;
  except
    on E: Exception do
       begin
         ShowMessage('Erro na rotina ConexaoBD: '+ E.Message);
       end;
  end;
end;

procedure setINI(pIniFilePath, prSessao, prSubSessao, prValor:string);
var
  wINI : TIniFile;
begin
  wINI := TIniFile.Create(pIniFilePath);
  try
    wINI.WriteString(prSessao, prSubSessao, prValor);
  finally
    wINI.Free;
  end;
end;

function getINI(pIniFilePath, prSessao, prSubSessao, prValor:string): string;
var
  wINI : TIniFile;
begin
  wINI := TIniFile.Create(pIniFilePath);
  try
    Result := wINI.ReadString(prSessao, prSubSessao, '');
  finally
    wINI.Free;
  end;
end;

function fArqIni(prDir : Boolean= true): string;
begin

  Result := ExtractFileName(ChangeFileExt(Application.ExeName, '.INI'));
  if prDir then
    Result := GetCurrentDir +'\'+Result;

  if not FileExists(Result) then
    setINI(Result,'','','');
end;

{ TConvert }

class procedure TConvert<T>.PopulateListEnum(AList: TStrings);
  var
   i:integer;
   StrTexto:String;
   Enum:Integer;
 begin
   i:=0;
   try
     repeat
       StrTexto:=trim(GetEnumName(TypeInfo(T), i));
       Enum:=GetEnumValue(TypeInfo(T),StrTexto);
       AList.Add(StrTexto);
       inc(i);
       until Enum < 0 ;
       AList.Delete(pred(AList.Count));
   except;
     raise EConvertError.Create(
                'O Par�metro passado n�o corresponde a um Tipo ENUM');
   end;
 end;

class function TConvert<T>.StrConvertEnum(const AStr: string):T;
 var
   P:^T;
   pNum:Integer;
 begin
   try
     pNum:=GetEnumValue(TypeInfo(T),Astr);
      if pNum = -1 then
        abort;
      P:=@pNum;
      result:=P^;
   except
     raise EConvertError.Create('O Par�metro "'+Astr+'" passado n�o '+sLineBreak+
     ' corresponde a um Tipo Enumerado');
   end;
 end;

class function TConvert<T>.EnumConvertStr(const eEnum:T): String;
 var
   P:PInteger;
   pNum:integer;
 begin
   try
     P:=@eEnum;
     pNum:=integer(TGenerico((P^)));
     Result := GetEnumName(TypeInfo(T),pNum);
   except
    raise EConvertError.Create('O Par�metro passado n�o corresponde a '+sLineBreak+
             'um inteiro Ou a um Tipo Enumerado');
   end;
 end;


end.