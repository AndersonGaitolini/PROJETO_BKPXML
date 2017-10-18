unit uRotinas;

interface

uses
 Configuracoes, Lm_bkpdfe,  Winapi.Windows, Winapi.Messages,
 System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
 Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
 Vcl.Buttons, Vcl.ExtCtrls, System.IniFiles,
 Data.SqlExpr, FireDAC.Comp.Client,Vcl.ComCtrls, System.ZLib,uDMnfebkp,
 Xml.XMLDoc,Xml.XMLIntf, uMetodosUteis,Data.DB,System.Zip,System.DateUtils,
 Usuarios;

 type TOperArquivos = (oaReplace, oaAdd, oaDescarta);

procedure pLeituradaNFE;
function fLoadXMLNFe(pTipoXML: TTipoXML; pObjConfig : TConfiguracoes; pChaveNFE: string = ''; pEmail : string = ''): Boolean;
function fCompactar(pPath: string): TFileStream;
function fCompactar2(pStream: TStream):TStream;
function fDescompacartar(pPath: string): boolean;
function fZipFile(FZipFile, AFileName: string; pArqDuplicado : boolean = false): Boolean;
function fZipFileExtrair(FZipFile, APath: string): Boolean;
function fExportaSelecaoXML(pLista: TStringList):boolean;
function fExportaLoteXML(pLista: TStringList):Boolean;
//Metodos da IS
procedure pCompress(const ASrc: string; var vDest: TStream; aEHStringStream: Boolean);
procedure pCompressLote(Files: TStrings; const Filename: String);
function fCompress(const ASrc: string; var vDest: TFileStream; aEHStringStream: Boolean): TStream;
procedure pDecompress(var vXML: TStream; ADest: string); overload;
procedure pEnumFiles(szPath, szAllowedExt: String; iAttributes: Integer;
  Buffer: TStrings; bClear, bIncludePath: Boolean); StdCall;
procedure pDecompressFiles(const Filename, DestDirectory : String);




const

  cEnv_ = 'Env_NFe*.xml';
  cCan_ = 'Can_*.xml';
  cInut_= 'Inut_.xml';
  cRetsai_ = 'Retsai_*.xml';
  cRetEven = 'RetEven_*.xml';
implementation

uses
  uFoPrincipal, Base;


procedure pDecompressFiles(const Filename, DestDirectory : String);
var
  dest,s : String;
  decompr : TDecompressionStream;
  infile, outfile : TFilestream;
  i,l,c : Integer;
begin
  // IncludeTrailingPathDelimiter (D6/D7 only)
  dest := IncludeTrailingPathDelimiter(DestDirectory);

  ForceDirectories(Dest);

  infile := TFileStream.Create(Filename,fmOpenRead);
  try
    { number of files }
    infile.Read(c,SizeOf(c));
    for i := 1 to c do
    begin
      { read filename }
      infile.Read(l,SizeOf(l));
      SetLength(s,l);
      infile.Read(s[1],l);
      { read filesize }
      infile.Read(l,SizeOf(l));
      { decompress the files and store it }
      s := dest+s; //include the path
      outfile := TFileStream.Create(s,fmCreate);
      decompr := TDecompressionStream.Create(infile);
      try
        outfile.CopyFrom(decompr,l);
      finally
        outfile.Free;
        decompr.Free;
      end;
    end;
  finally
    infile.Free;
  end;
end;


procedure pEnumFiles(szPath, szAllowedExt: String; iAttributes: Integer;
  Buffer: TStrings; bClear, bIncludePath: Boolean); StdCall;
var
  res: TSearchRec;
  szBuff: String;
begin
  if (bClear) then Buffer.Clear;
  szPath := IncludeTrailingBackslash(szPath);
  if (FindFirst(szPath + szAllowedExt, iAttributes, res) = 0) then
  begin
    repeat
      szBuff := res.Name;
      if ((szBuff <> '.') and (szBuff <> '..')) then
      if (bIncludePath) then
      Buffer.Add(szPath + szBuff) else
      Buffer.Add(szBuff);
    until FindNext(res) <> 0;
    FindClose(res);
  end;
end;


procedure pCompress(const ASrc: string; var vDest: TStream; aEHStringStream: Boolean);
var
  FileIni: TFileStream;
  Zip:     TCompressionStream;
  tString: TStringStream;
begin
  tString := nil;
  FileIni := nil;

  if aEHStringStream then //Se for no momento do envio, pega da string (mem�ria) e n�o do arquivo f�sico.
    tString := TStringStream.Create(ASrc)
  else
    FileIni := TFileStream.Create(ASrc, fmOpenRead and fmShareExclusive);

  Zip := TCompressionStream.Create(vDest); //clMax,
  try
    try
      if aEHStringStream then
        Zip.CopyFrom(tString, tString.Size)
      else
        Zip.CopyFrom(FileIni, FileIni.Size);
    except
      Raise Exception.Create('N�o foi poss�vel compactar o arquivo');
      abort;
    end;
  finally
    FreeAndNil(tString);
    FreeAndNil(Zip);
    FreeAndNil(FileIni);
  end;
end;

procedure pCompressLote(Files: TStrings; const Filename: String);
var
  infile, outfile, tmpFile : TFileStream;
  compr : TCompressionStream;
  i,l : Integer;
  s : String;
begin
  if Files.Count > 0 then
  begin
    outFile := TFileStream.Create(Filename,fmCreate);
    try
      { the number of files }
      l := Files.Count;
      outfile.Write(l,SizeOf(l));
      for i := 0 to Files.Count-1 do
      begin
        infile := TFileStream.Create(Files[i],fmOpenRead);
        try
          { the original filename }
          s := ExtractFilename(Files[i]);
          l := Length(s);
          outfile.Write(l,SizeOf(l));
          outfile.Write(s[1],l);
          { the original filesize }
          l := infile.Size;
          outfile.Write(l,SizeOf(l));
          { compress and store the file temporary}
          tmpFile := TFileStream.Create('tmp',fmCreate);
          compr := TCompressionStream.Create(clMax,tmpfile);
          try
            compr.CopyFrom(infile,l);
          finally
            compr.Free;
            tmpFile.Free;
          end;
          { append the compressed file to the destination file }
          tmpFile := TFileStream.Create('tmp',fmOpenRead);
          try
            outfile.CopyFrom(tmpFile,0);
          finally
            tmpFile.Free;
          end;
        finally
          infile.Free;
        end;
      end;
    finally
      outfile.Free;
    end;
    DeleteFile('tmp');
  end;
end;

function fCompress(const ASrc: string; var vDest: TFileStream; aEHStringStream: Boolean): TStream;
var
  FileIni: TFileStream;
  Zip:     TCompressionStream;
  tString: TStringStream;
begin
  tString := nil;
  FileIni := nil;

  if aEHStringStream then //Se for no momento do envio, pega da string (mem�ria) e n�o do arquivo f�sico.
    tString := TStringStream.Create(ASrc)
  else
    FileIni := TFileStream.Create(ASrc, fmOpenRead and fmShareExclusive);

  Zip := TCompressionStream.Create(vDest); //clMax,
  try
    try
      if aEHStringStream then
        Zip.CopyFrom(tString, tString.Size)
      else
        Zip.CopyFrom(FileIni, FileIni.Size);

      Result := TStream(Zip);

    except
      Raise Exception.Create('N�o foi poss�vel compactar o arquivo');
      abort;
    end;
  finally
    FreeAndNil(tString);
    FreeAndNil(Zip);
    FreeAndNil(FileIni);
  end;
end;

procedure pDecompress(var vXML: TStream; ADest: string);
var
  FileOut: TFileStream;
  DeZip: TDecompressionStream;
  i: Integer;
  Buf: array[0..1023] of Byte;
begin
  FileOut := TFileStream.Create(ADest, fmCreate or fmShareExclusive);
  DeZip   := TDecompressionStream.Create(vXML);
  DeZip.Position := 0;
  try
    try
      repeat
        i := DeZip.Read(Buf, SizeOf(Buf));
        if i <> 0 then
          FileOut.Write(Buf, i);
      until i <= 0;
    except
      raise Exception.Create('N�o foi poss�vel descompactar o arquivo');
      abort;
    end;
  finally
    DeZip.Free;
    FileOut.Free;
  end;
end;

function fExportaLoteXML(pLista: TStringList):Boolean;
var
  wSLFiles: TStringList;
  wPath : string;
begin
  fOpenPath(wPath, 'Selecione o ')
  wSLFiles := TStringList.Create;
  pEnumFiles('C:\Meu Sistema\BD\', '*', faAnyFile - faDirectory, slFiles, True, True);
  pCompressLote(slFiles, 'c:\Backup1.bkp');

  try

  finally
    slFiles.Free;
  end;

end;

function fExportaSelecaoXML(pLista: TStringList):boolean;
var
  wArrayStream :array of TStream;
  wArrayStreamCan :array[0..1] of TStream;
  wStream : TStream;
  wArq, wDiretorio : String;
  I : integer;
  wSaveXML: TSaveDialog;
begin

//  wStream := TMemoryStream.Create;
  SetLength(wArrayStream, wSLSeleconados.Count);
  for I := 0 to wSLSeleconados.Count - 1 do
  begin
    if DaoObjetoXML.fConsultaObjXML(ObjetoXML, [wSLSeleconados.Names[i]]) then
    begin
      wArrayStream[i] := TMemoryStream.Create;

      if ObjetoXML.Protocolocanc <> '' then
      begin
        wStream := ObjetoXML.Xmlextendcanc;
        if Assigned(wStream) then
        begin
          pDecompress(wStream, '');
          wArrayStreamCan[0] := wStream;
        end;

        wStream := ObjetoXML.Xmlextend;
        if Assigned(wStream) then
        begin
          pDecompress(wStream, wDiretorio);
          wArrayStreamCan[1] := wStream;
        end;
      end
      else
      begin
        wStream := ObjetoXML.Xmlextend;
        if Assigned(wStream) then
        begin
          pDecompress(wStream, wDiretorio);
          wArrayStream[i] := wStream;
        end;
      end;

    end;

  end;

end;

function fZipFileExtrair(FZipFile, APath: string): Boolean;
var
  Zip: TZipFile;
begin
  result := false;
  Zip := TZipFile.Create;
  try
    try
    if fileExists(FZipFile) then
      Zip.Open(FZipFile, zmReadWrite)
    else
      raise exception.Create('N�o encontrei: ' + FZipFile);
    Zip.ExtractAll(APath);
    Zip.Close;
    result := true;
    except on E: Exception do

    end;
  finally
    FreeAndNil(Zip);
  end;
end;

function fZipFile(FZipFile, AFileName: string; pArqDuplicado : boolean = false): Boolean;
var
  Zip: TZipFile;
  i : Integer;
begin
  result := false;
  Zip := TZipFile.Create;
  try
    try
      if fileExists(FZipFile) then
        Zip.Open(FZipFile, zmReadWrite)
      else
        Zip.Open(FZipFile, zmWrite);

      i := Zip.IndexOf(extractFileName(AFileName));
      if (i >= 0) and (pArqDuplicado) or (i < 0) then
        Zip.Add(AFileName, extractFileName(AFileName));

      Zip.Close;
      result := true;
    except on E: Exception do

    end;
  finally
    FreeAndNil(Zip);
  end;
end;

function fCompactar(pPath: string): TFIleStream;
var
FileIni, FileOut: TFileStream;
Zip: TCompressionStream;
begin
  try
    FileIni:=TFileStream.Create(pPath, fmOpenRead and fmShareExclusive);//fmOpenRead);
    FileOut:=TFileStream.Create(pPath, fmCreate and fmShareExclusive);   // fmShareExclusive);
    Zip:=TCompressionStream.Create(clMax, FileOut);
    Zip.CopyFrom(FileIni, FileIni.Size);

    Result := FileIni;
  finally
    Zip.Free;
    FileOut.Free;
    FileIni.Free;
  end;
end;

function fCompactar2(pStream: TStream):TStream;
var
FileIni, FileOut: TFileStream;
Zip: TCompressionStream;
begin
  try
    if not Assigned(pStream) then
      exit;

//    FileIni:=TFileStream.Create(pPath, fmOpenRead and fmShareExclusive);//fmOpenRead);
//    FileOut:=TFileStream.Create(pPath, fmCreate and fmShareExclusive);   // fmShareExclusive);
    Zip:=TCompressionStream.Create(clMax, pStream);
    Zip.CopyFrom(pStream, pStream.Size);
    Result := Zip;
  finally
    Zip.Free;
//    FileOut.Free;
//    FileIni.Free;
  end;
end;

function fDescompacartar(pPath: string): boolean;
var
  FileIni, FileOut: TFileStream;
  DeZip: TDecompressionStream;
  i : Integer;
  Buf: array[0..1023]of Byte;
begin
  try
    FileIni:=TFileStream.Create(pPath, fmOpenRead and fmShareExclusive); //fmShareExclusive);
    FileOut:=TFileStream.Create(pPath, fmCreate and fmShareExclusive);   //fmShareExclusive);
    DeZip:=TDecompressionStream.Create(FileIni);
    repeat
     i:=DeZip.Read(Buf, SizeOf(Buf));

    if i <> 0 then
      FileOut.Write(Buf, i);

    until i <= 0;
  finally
    DeZip.Free;
    FileOut.Free;
    FileIni.free;
  end;
end;

function fLoadXMLNFe(pTipoXML: TTipoXML; pObjConfig : TConfiguracoes; pChaveNFE: string = ''; pEmail : string = ''): Boolean;
var
  wDataSet   : TDataSet;
  wDaoXML    : TDaoBkpdfe;
  ObjetoXML, ObjXMLAux : TLm_bkpdfe;
  wStream    : TStream;
  wFileStream : TFileStream;
  wFRec      : TSearchRec;
  wErro, j: integer;
  XMLArq     : TXMLDocument;
  wArrayObjXML : array of TLm_bkpdfe;
  wNodeXML, wNodeInfNFe: IXMLNode;
  wFileSource, wFileDest: string;
  wXmlName, wZipName,wChaveAux,wPathFile, strAUX: string;
  wXMLEnvio,wOK: boolean;

 function fGetChaveFilename(pFileName : string): string;
  var wPos :Integer;
  begin
    Result := '';
    if (pFileName = '') then
     Exit;

    Result := ExtractFileName(pFileName);
    case pTipoXML of
     txEnvioXML : begin
                    wPos := Pos('Env_NFe',Result);
                    if wPos > 0 then
                      Result := Copy(Result,8,44);
                  end;
     txRetSaiXML : begin
                    wPos := Pos('retsai_NFe',Result);
                    if wPos > 0 then
                      Result := Copy(Result,11,44);
                   end;
     txXMLChave,
     txEnvioXMLArq,
     txRetProcXML : begin
                      wPos := Pos('Env_NFe',Result);
                      if wPos > 0 then
                         Result := Copy(Result,8,44);

                      wPos := Pos('Can_',Result);
                      if wPos > 0 then
                         Result := Copy(Result,5,44);

                      wPos := Pos('Inut_',Result);
                      if wPos > 0 then
                         Result := Copy(Result,6,44);

                      wPos := Pos('retsai_NFe',Result);
                      if wPos > 0 then
                        Result := Copy(Result,11,44);

                    end;
       txRetEven : begin
                     wPos := Pos('reteven_',Result);
                     if wPos > 0 then
                       Result := Copy(Result,9,44);

                   end;
    end;
  end;

  function funcvarXML(xmlNTag : IXMLNode): WideString;
  begin
    if Not (xmlNTag.ChildNodes.First = Nil) Then
      Result := xmlNTag.ChildNodes.First.Text;
  end;

  procedure pXMLEnvioExtend;
  var SLCannotRead : TStringList;
  begin
    J := 0;
    Result := False;
    wChaveAux :='';
    wErro := FindFirst(wPathFile+'\'+ cEnv_, faAnyFile, wFRec);
    wOK := wErro = 0;
    SLCannotRead := TStringList.Create;
    with ObjetoXML do
    while wOK do
    begin
      wXmlName := wFRec.Name;
      ObjetoXML := TLm_bkpdfe.Create;
      Chave := fGetChaveFilename(wXmlName);
      Inc(J,1);
      SetLength(wArrayObjXML, J);

      if Pos('Env_',wXmlName) > 0 then
      begin
        wFileSource := wPathFile+'\'+wXmlName;
        wStream := TMemoryStream.Create;
        wFileStream := TFileStream.Create(wFileSource,0);

        XMLArq.LoadFromStream(wFileStream,xetUTF_8);
        wNodeXML := XMLArq.documentElement;
        wNodeXML := wNodeXML.ChildNodes.First;
        if Assigned(wNodeXML) then
        begin
          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'NFe') then
          wNodeInfNFe := wNodeXML.ChildNodes.First;
          if Assigned(wNodeInfNFe) and (wNodeInfNFe.NodeName = 'infNFe') then
          begin
            Chave := wNodeInfNFe.AttributeNodes.FindNode('Id').text;
            Chave := Copy(Chave,4,44);

            wNodeInfNFe := wNodeInfNFe.ChildNodes.First;
            if Assigned(wNodeInfNFe) and (wNodeInfNFe.NodeName = 'ide') then
            begin
              Idf_documento := StrToInt64Def(funcvarXML(wNodeInfNFe.ChildNodes['nNF']),0);
              Dataemissao := DateXMLToDate(funcvarXML(wNodeInfNFe.ChildNodes['dhEmi']));
              Tipoambiente :=  funcvarXML(wNodeInfNFe.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
              if Tipoambiente = '1' then
                Tipoambiente := 'Produ��o'
              else
              Tipoambiente := 'Homologa��o';
            end;

            Dataalteracao := Today;
          end;

          wNodeXML := wNodeXML.NextSibling; //ChildNodes.First;
          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'protNFe') then
          begin
            wNodeXML := wNodeXML.ChildNodes.First;
            if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infProt') then
            begin
              if Tipoambiente <> '' then
              begin
                Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
                if Tipoambiente = '1' then
                  Tipoambiente := 'Produ��o'
                else
                Tipoambiente := 'Homologa��o';
              end;

              if Chave <> '' then
              begin
                wChaveAux := funcvarXML(wNodeXML.ChildNodes['chNFe']);
                if Chave <> wChaveAux then
                   ShowMessage('Chaves do arquivo XML diferem');
              end;

              Datarecto := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhRecbto']));
              Protocoloaut := funcvarXML(wNodeXML.ChildNodes['nProt']);
              Motivo :=  funcvarXML(wNodeXML.ChildNodes['xMotivo']);
              if Length(Motivo) > 20 then
              Motivo := Copy(Motivo,1,20);
              Dataalteracao := Today;
            end;
          end
          else
          begin
            FileClose(wFileStream.Handle);
            wOK := (FindNext(wFRec)= 0);
            Continue
          end;
        end;
      end;

      FileClose(wFileStream.Handle);
      pCompress(wFileSource, wStream,false);
      Xmlextend := wStream;

      wArrayObjXML[j-1] := ObjetoXML;
      wErro := FindNext(wFRec);
      wOK := (wErro = 0);
    end;

    //Verifica os XML Cancelados Can_0000000000000000.xml


    wOK := FindFirst(wPathFile+'\'+cCan_, faAnyFile, wFRec)=0;
    with ObjetoXML do
    while wOK do
    begin
      wXmlName := wFRec.Name;
      ObjetoXML := TLm_bkpdfe.Create;
      Chave := fGetChaveFilename(wXmlName);

      Inc(J,1);
      SetLength(wArrayObjXML, J);

      if Pos('Can_',wXmlName) > 0 then
      begin
        wFileSource := wPathFile+'\'+wXmlName;
        wStream := TMemoryStream.Create;
        wFileStream := TFileStream.Create(wFileSource,0);
        XMLArq.LoadFromStream(wFileStream);
        wNodeXML := XMLArq.documentElement;
        wNodeXML := wNodeXML.ChildNodes.First;

        if Assigned(wNodeXML) then
        begin
          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'cancNFe') then
          wNodeXML := wNodeXML.ChildNodes.First;

          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infCanc') then
          begin
            Tipoambiente := funcvarXML(wNodeXML.ChildNodes['tpAmb']);
            if Tipoambiente = '1' then
              Tipoambiente := 'Produ��o'
            else
              Tipoambiente := 'Homologa��o';
            Chave := funcvarXML(wNodeXML.ChildNodes['chNFe']);
            Protocolocanc := funcvarXML(wNodeXML.ChildNodes['nProt']);
            Motivocanc := funcvarXML(wNodeXML.ChildNodes['xJust']);
            if Length(Motivocanc)>20 then
              Motivocanc := copy(Motivocanc,1,20);

            Dataalteracao := Today;
          end
        end;
      end;

      wErro := FindNext(wFRec);
      FileClose(wFileStream.Handle);
      pCompress(wFileSource,wStream,false);
      Xmlextendcanc := wStream;

      wOK := (wErro = 0);

      wArrayObjXML[j-1] := ObjetoXML;
    end;
  end;

  procedure pXMLChave(pChave: string);
  var SLCannotRead : TStringList;
  auxS : TStream;
  begin
    if pChave = '' then
    exit;

    J := 0;
    Result := False;
    wChaveAux :='';

    if not FileExists(pChave) then
      exit;

    wXmlName := ExtractFileName(pChave);
    wFileSource := pChave;

    with ObjetoXML do
    if Pos('Env_NFe',wFileSource) > 0 then
    begin

      ObjetoXML := TLm_bkpdfe.Create;
      Chave := fGetChaveFilename(wXmlName);

      Inc(J,1);
      SetLength(wArrayObjXML, J);

      wStream := TMemoryStream.Create;
      wFileStream := TFileStream.Create(wFileSource,0);

      XMLArq.LoadFromStream(wFileStream,xetUTF_8);
      wNodeXML := XMLArq.documentElement;

      if Assigned(wNodeXML) and (wNodeXML.NodeName = 'nfeProc') or (wNodeXML.NodeName = 'NFe') then
      begin
        wNodeXML := wNodeXML.ChildNodes.First;

        if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infNFe') then
        begin
          Chave := wNodeXML.AttributeNodes.FindNode('Id').text;
          Chave := Copy(Chave,4,44);
          wNodeXML := wNodeXML.ChildNodes.First;
          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'ide') then
          begin
            Idf_documento := StrToInt64Def(funcvarXML(wNodeXML.ChildNodes['nNF']),0);
            Dataemissao := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhEmi']));
            Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
            if Tipoambiente = '1' then
              Tipoambiente := 'Produ��o'
            else
            Tipoambiente := 'Homologa��o';
          end;

          FileClose(wFileStream.Handle);
          pCompress(wFileSource, wStream,false);
          Xmlenvio := wStream;
          Dataalteracao := Today;
        end
        else
        begin
          wNodeXML := wNodeXML.NextSibling;
          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'protNFe') then
          begin

            wNodeXML := wNodeXML.ChildNodes.First;
            if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infProt') then
            begin
              Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
              if Tipoambiente = '1' then
                Tipoambiente := 'Produ��o'
              else
              Tipoambiente := 'Homologa��o';

              wChaveAux := funcvarXML(wNodeXML.ChildNodes['chNFe']);
              if Chave <> wChaveAux then
                 exit;

              Datarecto := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhRecbto']));
              Protocoloaut := funcvarXML(wNodeXML.ChildNodes['nProt']);
              Motivo :=  funcvarXML(wNodeXML.ChildNodes['xMotivo']);
              if Length(Motivo) > 20 then
              Motivo := Copy(Motivo,1,20);

              FileClose(wFileStream.Handle);
              pCompress(wFileSource, wStream,false);
              Xmlextend := wStream;
              Dataalteracao := Today;
            end;
          end;
        end;
      end;

//      FileClose(wFileStream.Handle);
//      pCompress(wFileSource, wStream,false);
//      Xmlextend := wStream;

      wArrayObjXML[j-1] := ObjetoXML;
    end;

    //Verifica os XML Cancelados Can_0000000000000000.xml

    with ObjetoXML do
    if Pos('Can_',wFileSource) > 0 then
    begin
//      wXmlName := ExtractFileName(wFileSource);
      ObjetoXML := TLm_bkpdfe.Create;
      Chave := fGetChaveFilename(wXmlName);

      Inc(J,1);
      SetLength(wArrayObjXML, J);

      wStream := TMemoryStream.Create;
      wFileStream := TFileStream.Create(wFileSource,0);
      XMLArq.LoadFromStream(wFileStream);
      wNodeXML := XMLArq.documentElement;
      wNodeXML := wNodeXML.ChildNodes.First;

      if Assigned(wNodeXML) then
      begin  //CAN_ Envio
        if Assigned(wNodeXML) and (wNodeXML.NodeName = 'cancNFe') then
        wNodeXML := wNodeXML.ChildNodes.First;

        if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infCanc') then
        begin
          Tipoambiente := funcvarXML(wNodeXML.ChildNodes['tpAmb']);
          if Tipoambiente = '1' then
            Tipoambiente := 'Produ��o'
          else
            Tipoambiente := 'Homologa��o';
          wChaveAux := funcvarXML(wNodeXML.ChildNodes['chNFe']);
          if wChaveAux <> Chave then
            exit;
          Protocolocanc := funcvarXML(wNodeXML.ChildNodes['nProt']);
          Motivocanc := funcvarXML(wNodeXML.ChildNodes['xJust']);
          if Length(Motivocanc)>20 then
            Motivocanc := copy(Motivocanc,1,20);
          if pEmail <> '' then
            Emailsnotificados := pEmail;

          Dataalteracao := Today;
          FileClose(wFileStream.Handle);
          pCompress(wFileSource,wStream,false);
          Xmlenviocanc := wStream;
        end
        else
        begin   //CAN_ processado
          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'evento') then
            wNodeXML := wNodeXML.NextSibling;

          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'retEvento') then
          begin
            wNodeXML := wNodeXML.ChildNodes.First;
            if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infEvento') then
            begin
              Tipoambiente := funcvarXML(wNodeXML.ChildNodes['tpAmb']);
              if Tipoambiente = '1' then
                Tipoambiente := 'Produ��o'
              else
                Tipoambiente := 'Homologa��o';

              wChaveAux := funcvarXML(wNodeXML.ChildNodes['chNFe']);
              if wChaveAux <> Chave then
                exit;
              Protocolocanc := funcvarXML(wNodeXML.ChildNodes['nProt']);
              Motivocanc := funcvarXML(wNodeXML.ChildNodes['xJust']);
              if Length(Motivocanc)>20 then
                Motivocanc := copy(Motivocanc,1,20);
              if pEmail <> '' then
                Emailsnotificados := pEmail;

              Dataalteracao := Today;
              FileClose(wFileStream.Handle);
              pCompress(wFileSource,wStream,false);
              Xmlextendcanc := wStream;
            end;
          end;
        end;
      end;

      wArrayObjXML[j-1] := ObjetoXML;
    end;

    if Pos('retsai_NFe',wFileSource) > 0 then
    begin
      ShowMessage('retsai_NFe '+(wFileSource));
      Inc(J,1);
      ObjetoXML := TLm_bkpdfe.Create;
      SetLength(wArrayObjXML, J);
      with ObjetoXML do
      begin
//        wXmlName := ExtractFileName(wFileSource);
        Chave := fGetChaveFilename(wXmlName);
        wStream := TMemoryStream.Create;
        wFileStream := TFileStream.Create(wFileSource,0);
        XMLArq.LoadFromStream(wFileStream,xetUTF_8);
        wNodeXML := XMLArq.documentElement;
        wNodeXML.ChildNodes.Count;
        wNodeXML := wNodeXML.ChildNodes.First;
        if Assigned(wNodeXML) then
        begin
          if wNodeXML.NodeName = 'protNFe' then
            wNodeXML := wNodeXML.ChildNodes.First;

          if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infProt') then
          begin
            Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
            if Tipoambiente = '1' then
              Tipoambiente := 'Produ��o'
            else
            Tipoambiente := 'Homologa��o';
            wChaveAux := funcvarXML(wNodeXML.ChildNodes['chNFe']);
            Datarecto := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhRecbto']));
            Protocoloaut := funcvarXML(wNodeXML.ChildNodes['nProt']);
            Motivo :=  funcvarXML(wNodeXML.ChildNodes['xMotivo']);
            if Length(Motivo) > 20 then
            Motivo := Copy(Motivo,1,20);
            Dataalteracao := Today;
          end;
        end;

        FileClose(wFileStream.Handle);
        pCompress(wFileSource, wStream,false);
        Xmlenviocanc := wStream;

        wArrayObjXML[j-1] := ObjetoXML;
      end;
    end;
  end;

  procedure pXMLEnvio;
  begin
    wChaveAux :='';
    J := 0;
    wErro := FindFirst(wPathFile+'\'+ cEnv_, faAnyFile, wFRec);
    wOK := wErro = 0;
    while wOK do
    begin
      ObjetoXML := TLm_bkpdfe.Create;
      Inc(J,1);
      SetLength(wArrayObjXML, J);
      with ObjetoXML do
      begin
        wXmlName := wFRec.Name;
        Chave := fGetChaveFilename(wXmlName);
        if Pos('Env_NFe',wXmlName) > 0 then
        begin
          wFileSource := wPathFile+'\'+wXmlName;
          wStream := TMemoryStream.Create;
          wFileStream := TFileStream.Create(wFileSource,0);
          XMLArq.LoadFromStream(wFileStream,xetUTF_8);
          wNodeXML := XMLArq.documentElement;
          wNodeXML.ChildNodes.Count;

           wNodeXML := wNodeXML.ChildNodes.First;
          if Assigned(wNodeXML) then
          begin
             if Assigned(wNodeXML) and (wNodeXML.NodeName = 'NFe') then
             begin
               wNodeXML := wNodeXML.ChildNodes.First;
               if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infNFe') then
               begin
                 wChaveAux := wNodeXML.Attributes['Id'];
                 wChaveAux := Copy(wChaveAux,4,44);
               end;

               wNodeXML := wNodeXML.ChildNodes.First;
               if Assigned(wNodeXML) and (wNodeXML.NodeName = 'ide') then
               begin
                 Idf_documento := StrToInt64Def(funcvarXML(wNodeXML.ChildNodes['nNF']),0);
                 Dataemissao := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhEmi']));
                 Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
                 if Tipoambiente = '1' then
                   Tipoambiente := 'Produ��o'
                 else
                 Tipoambiente := 'Homologa��o';
                 if Chave <> wChaveAux then
                   ShowMessage('Chaves do arquivo XML diferem');

                 Dataalteracao := Today;
               end;
             end
             else
             begin
               if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infNFe') then
               begin
                 wChaveAux := wNodeXML.Attributes['Id'];
                 wChaveAux := Copy(wChaveAux,4,44);

                 wNodeXML := wNodeXML.ChildNodes.First;
                 if Assigned(wNodeXML) and (wNodeXML.NodeName = 'ide') then
                 begin
                   Idf_documento := StrToInt64Def(funcvarXML(wNodeXML.ChildNodes['nNF']),0); // C�digo sequencial NFe
                   Dataemissao := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhEmi']));
                   Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
                   if Tipoambiente = '1' then
                     Tipoambiente := 'Produ��o'
                   else
                   Tipoambiente := 'Homologa��o';

                   if Chave <> wChaveAux then
                     ShowMessage('Chaves do arquivo XML diferem');
                   Dataalteracao := Today;
                 end;
               end;
             end;
          end;
        end;

        FileClose(wFileStream.Handle);
        pCompress(wFileSource,wStream,False);
        Xmlenvio := wStream;
        wErro := FindNext(wFRec);
        wOK := (wErro = 0);
        wArrayObjXML[j-1] := ObjetoXML;
      end;
    end;
  end;

  procedure pXMLEnvioPelaChave;
  begin
    J := 0;
    wChaveAux :='';
    if not fOpenFileName(['*.xml'],['XML'], wPathFile, 'Aponte o seu XML') then
       Exit;

    with ObjetoXML do
    if Pos('Env_NFe',wPathFile) > 0 then
    begin
      ObjetoXML := TLm_bkpdfe.Create;
      J := J+1;
      SetLength(wArrayObjXML, J);

      Chave := fGetChaveFilename(wPathFile);
      wFileSource := wPathFile;
      wStream := TMemoryStream.Create;
      wFileStream := TFileStream.Create(wFileSource,0);
      XMLArq.LoadFromStream(wFileStream,xetUTF_8);
      wNodeXML := XMLArq.documentElement;
      wNodeXML.ChildNodes.Count;

       wNodeXML := wNodeXML.ChildNodes.First;
      if Assigned(wNodeXML) then
      begin
         if Assigned(wNodeXML) and (wNodeXML.NodeName = 'NFe') then
         begin
           wNodeInfNFe := wNodeXML.ChildNodes.First;
           if Assigned(wNodeInfNFe) and (wNodeInfNFe.NodeName = 'infNFe') then
           begin
             wChaveAux := wNodeInfNFe.Attributes['Id'];
             wChaveAux := Copy(wChaveAux,4,44);
           end;

           wNodeXML := wNodeXML.ChildNodes.First;
           if Assigned(wNodeXML) and (wNodeXML.NodeName = 'ide') then
           begin
             Idf_documento := StrToInt64Def(funcvarXML(wNodeXML.ChildNodes['nNF']),0);
             Dataemissao := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhEmi']));
             Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
             if Tipoambiente = '1' then
               Tipoambiente := 'Produ��o'
             else
             Tipoambiente := 'Homologa��o';
             if Chave <> wChaveAux then
               ShowMessage('Chaves do arquivo XML diferem');

             pCompress(wFileSource, wStream,False);
             Xmlenvio := wStream;
             Dataalteracao := Today;
           end;
         end
         else
         begin
           if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infNFe') then
           begin
             wChaveAux := wNodeXML.Attributes['Id'];
             wChaveAux := Copy(wChaveAux,4,44);

             wNodeXML := wNodeXML.ChildNodes.First;
             if Assigned(wNodeXML) and (wNodeXML.NodeName = 'ide') then
             begin
               Idf_documento := StrToInt64Def(funcvarXML(wNodeXML.ChildNodes['nNF']),0); // C�digo sequencial NFe
               Dataemissao := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhEmi']));
               Tipoambiente :=  funcvarXML(wNodeXML.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
               if Tipoambiente = '1' then
                 Tipoambiente := 'Produ��o'
               else
               Tipoambiente := 'Homologa��o';

               if Chave <> wChaveAux then
                 ShowMessage('Chaves do arquivo XML diferem');

               pCompress(wFileSource, wStream,False);
               Xmlextend := wStream;
               Dataalteracao := Today;
             end;
           end;
         end;
      end;

      FileClose(wFileStream.Handle);
      wArrayObjXML[j-1] := ObjetoXML;
    end;

    with ObjetoXML do
    if Pos('Can_',wPathFile) > 0 then
    begin
      ObjetoXML := TLm_bkpdfe.Create;
      Chave := fGetChaveFilename(wPathFile);
//      if not wDaoXML.fConsultaObjXML(ObjetoXML,['chave']) then
//      begin
//        if (MessageDlg( 'O XML com a chave: '+chave+ ' n�o foi lido ainda.'+#13#13+
//            'Deseja incluir mesmo assim?', mtInformation, [mbYes, mbNo],0) = mrNo)then
//        Exit;
//      end;

      Inc(J,1);
      SetLength(wArrayObjXML, J);

      wFileSource := wPathFile;
      wStream := TMemoryStream.Create;
      wFileStream := TFileStream.Create(wFileSource,0);
      XMLArq.LoadFromStream(wFileStream);
      wNodeXML := XMLArq.documentElement;
      wNodeXML.ChildNodes.Count;
      wNodeXML := wNodeXML.ChildNodes.First;
      if Assigned(wNodeXML) then
      begin
        if Assigned(wNodeXML) and (wNodeXML.NodeName = 'cancNFe') then
        wNodeXML := wNodeXML.ChildNodes.First;

        if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infCanc') then
        begin
          Tipoambiente := funcvarXML(wNodeXML.ChildNodes['tpAmb']);
          if Tipoambiente = '1' then
            Tipoambiente := 'Produ��o'
          else
            Tipoambiente := 'Homologa��o';
          Chave := funcvarXML(wNodeXML.ChildNodes['chNFe']);
          Protocolocanc := funcvarXML(wNodeXML.ChildNodes['nProt']);
          Motivocanc := funcvarXML(wNodeXML.ChildNodes['xJust']);
          if Length(Motivocanc)>20 then
            Motivocanc := copy(Motivocanc,1,20);

          Dataalteracao := Today;
        end
      end;

      FileClose(wFileStream.Handle);
      pCompress(wFileSource, wStream,False);
      Xmlextendcanc := wStream;
      wArrayObjXML[j-1] := ObjetoXML;
    end;

  end;

  procedure pXMLRetorno;
  begin
    J := 0;
    wChaveAux :='';
    wErro := FindFirst(wPathFile+'\'+ cRetsai_, faAnyFile, wFRec);
    wOK := wErro = 0;
    while wOK do
    begin
      Inc(J,1);
      ObjetoXML := TLm_bkpdfe.Create;
      SetLength(wArrayObjXML, J);
      with ObjetoXML do
      begin
        wXmlName := wFRec.Name;
        Chave := fGetChaveFilename(wXmlName);
        if Pos('retsai_NFe',wXmlName) > 0 then
        begin
          wFileSource := wPathFile+'\'+wXmlName;
          wStream := TMemoryStream.Create;
          wFileStream := TFileStream.Create(wFileSource,0);
          XMLArq.LoadFromStream(wFileStream,xetUTF_8);
          wNodeXML := XMLArq.documentElement;
          wNodeXML.ChildNodes.Count;
          wNodeXML := wNodeXML.ChildNodes.First;
          if Assigned(wNodeXML) then
          begin
            if wNodeXML.NodeName = 'protNFe' then
            begin
              wNodeXML := wNodeXML.ChildNodes.First;
              if Assigned(wNodeXML) and (wNodeXML.NodeName = 'infProt') then
              begin
                Tipoambiente :=  funcvarXML(wNodeInfNFe.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
                if Tipoambiente = '1' then
                  Tipoambiente := 'Produ��o'
                else
                Tipoambiente := 'Homologa��o';
                wChaveAux := funcvarXML(wNodeXML.ChildNodes['chNFe']);
                Datarecto := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhRecbto']));
                Protocoloaut := funcvarXML(wNodeXML.ChildNodes['nProt']);
                Motivo :=  funcvarXML(wNodeXML.ChildNodes['xMotivo']);
                if Length(Motivo) > 20 then
                Motivo := Copy(Motivo,1,20);
                Dataalteracao := Today;
              end;
            end
          end;
        end;
        wErro := FindNext(wFRec);

        FileClose(wFileStream.Handle);
        wOK := (wErro = 0);
        wArrayObjXML[j-1] := ObjetoXML;
      end;
    end;
  end;

  procedure pXMLRetEven;
  begin
    J := 0;
    wErro := FindFirst(wPathFile+'\'+ cRetEven, faAnyFile, wFRec);
    wOK := wErro = 0;
    while wOK do
    begin
      ObjetoXML := TLm_bkpdfe.Create;
      Inc(J,1);
      SetLength(wArrayObjXML, J);
      with ObjetoXML do
      begin
        strAUX := '';
        wXmlName := wFRec.Name;

        Chave := fGetChaveFilename(wXmlName);
        if Pos('reteven_',wXmlName) > 0 then
        begin
//          if not wDaoXML.fConsultaObjXML(ObjetoXML,['chave']) then
//          begin
//            ShowMessage('Este xml ainda nao foi adcionado ao banco'+#10#13+wXmlName );
//          end;

          wFileSource := wPathFile+'\'+wXmlName;
          wStream := TMemoryStream.Create;
          wFileStream := TFileStream.Create(wFileSource,0);
          XMLArq.LoadFromStream(wFileStream,xetUTF_8);
          wNodeXML := XMLArq.documentElement;
          wNodeXML.ChildNodes.Count;

          if Assigned(wNodeXML) then
          begin
            if wNodeXML.NodeName = 'infEvento' then
            begin
              wNodeXML := wNodeXML.ChildNodes.First;
              Tipoambiente :=  funcvarXML(wNodeInfNFe.ChildNodes['tpAmb']); // Tipo de Ambiente da Nota Fiscal(Produ��o/Homologa��o)
              if Tipoambiente = '1' then
                Tipoambiente := 'Produ��o'
              else
              Tipoambiente := 'Homologa��o';
              wChaveAux := funcvarXML(wNodeXML.ChildNodes['chNFe']);
              Datarecto := DateXMLToDate(funcvarXML(wNodeXML.ChildNodes['dhRegEvento']));
              Protocolocanc := funcvarXML(wNodeXML.ChildNodes['nProt']);
              Motivocanc :=  funcvarXML(wNodeXML.ChildNodes['xMotivo']);

              if Length(Motivocanc) > 20 then
                Motivocanc := Copy(Motivocanc,1,20);

               Dataalteracao := Today;
            end
          end;
         FileClose(wFileStream.Handle);
        end;

        wErro := FindNext(wFRec);
        pCompress(wFileSource, wStream,False);
        Xmlenviocanc := wStream;
        wOK := (wErro = 0);
        wArrayObjXML[j-1] := ObjetoXML;
      end;
    end;
  end;

  function fCarregaPath:boolean;
  var
  wPathAux: string;
  begin
    wPathAux := '';
    Result := True;
    case pTipoXML of
      txXMLChave,
      txEnvioXML,
      txEnvioXMLArq : wPathAux := pObjConfig.NFePathSend;
      txRetEven,
      txRetSaiXML   : wPathAux := pObjConfig.NFePathReturn;
      txRetProcXML  : wPathAux := pObjConfig.PathRetEnvNFe;
    else
      Result := False;
    end;

    if Result then
      Result :=  DirectoryExists(wPathAux);

    if Result then
      wPathFile := wPathAux;
  end;

 function fGravaXML: boolean;
 var i: Integer;
 begin
   Result := False;
   try
   for I := Low(wArrayObjXML) to High(wArrayObjXML) do
   begin
     if wDaoXML.fCarregaXMLEnvio(wArrayObjXML[I]) then
       wArrayObjXML[i].Free;
   end;
     Result := True;
   finally
     pZapFiles(wPathFile+'\~*.zip')
   end;
 end;

begin
  if not Assigned(pObjConfig) then
    exit;

  XMLArq     := TXMLDocument.Create(Application);
  wDaoXML    := TDaoBkpdfe.Create;
  wDataSet   := TDataSet.Create(Application);
  fCarregaPath;

  try
    try
      case pTipoXML of
        txXMLChave   : pXMLChave(pChaveNFE);
        txRetSaiXML  : pXMLRetorno;
        txEnvioXML   : pXMLEnvio;
        txRetProcXML : pXMLEnvioExtend;
        txRetEven    : pXMLRetEven;
        txEnvioXMLArq: pXMLEnvioPelaChave;
      else
        Exit
      end;

      Result := fGravaXML;
    except on E: Exception do
      ShowMessage('Erro na leitura '+TConvert<TTipoXML>.EnumConvertStr(pTipoXML) + #10#13+
                  'Arquivo: '+ wXmlName+#10#13+
                   E.Message);
    end;

  finally
    FreeAndNil(XMLArq);
    FreeAndNil(wDaoXML);
    FreeAndNil(wDataSet);
    pZapFiles(wPathFile+'\~*.zip');
    pZapFiles(wPathFile+'\~*.xml')
  end;
end;

procedure pLeituradaNFE;
var
  xmlNCab, xmlNItm : IXMLNode;
  widstrRetorno    : WideString;
  xmldoc_nfe       : TXMLDocument;
  opndlg_nfe       : TOpenDialog;

  function funcvarXML(xmlNTag : IXMLNode): WideString;
  begin
    if Not (xmlNTag.ChildNodes.First = Nil) Then
      Result := xmlNTag.ChildNodes.First.Text;
  end;

begin
  xmldoc_nfe := TXMLDocument.Create(Application);
  opndlg_nfe := TOpenDialog.Create(Application);

  //  *** Importar Arquivo XML NFe...
  opndlg_nfe.InitialDir := Application.GetNamePath;
  opndlg_nfe.Filter := 'NFe|*.XML';
  opndlg_nfe.Title  := 'Selecione o arquivo a importar';
  opndlg_nfe.Execute;

  if Not (opndlg_nfe.FileName = '') Then
  Exit;
  // Lendo o arquivo pelas TAGs...
  xmldoc_nfe.LoadFromFile(opndlg_nfe.FileName);
  // Leitura Dados da Nota Fiscal...
  xmlNCab := xmldoc_nfe.DocumentElement.childNodes.First.ChildNodes.FindNode('ide');
  if Not (xmlNCab.ChildNodes.First = Nil) Then
  begin
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['cNF'    ]); // C�digo sequencial NFe
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['nNF'    ]); // N�mero da Nota Fiscal
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['dEmi'   ]); // Data Emiss�o Nota Fiscal
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['verProc']); // Descri��o da Nota Fiscal
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['serie'  ]); // S�rie da Nota Fiscal
  end;
  // Leitura Dados do Fornecedor...
  xmlNCab := xmldoc_nfe.DocumentElement.childNodes.First.ChildNodes.FindNode('emit');
  if Not (xmlNCab.ChildNodes.First = Nil) Then
  begin
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['CNPJ'   ]); // CGC Fornecedor
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['CPF'    ]); // CPF Fornecedor
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['xNome'  ]); // Raz�o Social do Fornecedor
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['xFant'  ]); // Nome Fantasia
    widstrRetorno := funcvarXML(xmlNCab.ChildNodes['IE'     ]); // Inscri��o Estadual
    // Leitura Dados Endere�os do Fornecedor...
    xmlNItm := xmlNCab.ChildNodes['enderEmit'];
    if Not (xmlNItm.ChildNodes.First = Nil) Then
    begin
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['xLgr'   ]); // Logradouro
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['nro'    ]); // N�mero
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['xCpl'   ]); // Complemento
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['xBairro']); // Bairro
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['cMun'   ]); // C�digo Munic�pio IBGE
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['xMun'   ]); // Nome Munic�pio
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['UF'     ]); // Unidade Federa��o
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['CEP'    ]); // CEP
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['cPais'  ]); // C�digo Pais BACEN
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['xPais'  ]); // Nome Pais
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['fone'   ]); // Telefone
    end;
  end;
  // Leitura Dados Totais da Nota Fiscal...
  xmlNCab := xmldoc_nfe.DocumentElement.childNodes.First.ChildNodes.FindNode('total');
  if Not (xmlNCab.ChildNodes.First = Nil) Then
  begin
    xmlNItm := xmlNCab.ChildNodes['ICMSTot'];
    if Not (xmlNItm.ChildNodes.First = Nil) Then
    begin
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['vNF'    ]); // Valor total da Nota Fiscal(2dec,S/M)
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['vProd'  ]); // Valor total da Nota Fiscal(2dec,S/M)
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['vDesc'  ]); // Valor total dos descontos (2dec,S/M)
    end;
  end;
  // Leitura Dados Itens da Nota Fiscal...
  xmlNCab := xmldoc_nfe.DocumentElement.childNodes.First.ChildNodes.FindNode('det');
  While Not (xmlNCab = Nil) Do
  begin
    xmlNCab.ChildNodes.First.ChildNodes.FindNode('det');
    xmlNItm := xmlNCab.ChildNodes['prod'];
    if Not (xmlNItm.ChildNodes.First = Nil) Then
    begin
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['cProd'  ]); // C�digo do produto CFOP
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['xProd'  ]); // Nome do produto
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['uCom'   ]); // Sigla unidade da embalagem
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['qCom'   ]); // Quantidade do produto (4dec,S/M)
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['vUnCom' ]); // Valor unit�rio do produto (4dec,S/M)
      widstrRetorno := funcvarXML(xmlNItm.ChildNodes['vProd'  ]); // Valor total do produto (2dec,S/M)
    end;
    xmlNCab := xmlNCab.NextSibling;
  end;;

end;


end.