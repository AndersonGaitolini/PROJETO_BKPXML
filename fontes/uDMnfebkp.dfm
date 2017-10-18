object DM_NFEDFE: TDM_NFEDFE
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 422
  Width = 367
  object conConexaoFD: TFDConnection
    Params.Strings = (
      'CharacterSet=WIN1252'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=D:\Programacao\DELPHI\BASE\7357\BKP\bd\BACKUPXML.FDB'
      'DriverID=FBEmbed')
    LoginPrompt = False
    Left = 20
    Top = 90
  end
  object fdtrTransacao: TFDTransaction
    Connection = conConexaoFD
    Left = 244
    Top = 90
  end
  object fdWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 82
  end
  object fddrfbDriver: TFDPhysFBDriverLink
    DriverID = 'FBEmbed'
    VendorLib = 'E:\BT\7.0\MaxWin\7357\BKP\fb\fbClient.dll'
    Embedded = True
    Left = 164
    Top = 82
  end
  object sqlConfiguracoes: TFDQuery
    Connection = conConexaoFD
    Transaction = fdtrTransacao
    SQL.Strings = (
      'select * from configuracoes')
    Left = 248
    Top = 340
  end
  object dsConfiguracoes: TDataSource
    DataSet = cdsConfiguracoes
    Left = 248
    Top = 272
  end
  object dsBkpdfe: TDataSource
    DataSet = cdsBkpdfe
    Left = 24
    Top = 280
  end
  object cdsBkpdfe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provBkpdfe'
    Left = 24
    Top = 144
    object cdsBkpdfeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBkpdfeCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 300
    end
    object cdsBkpdfeIDF_DOCUMENTO: TIntegerField
      FieldName = 'IDF_DOCUMENTO'
      Origin = 'IDF_DOCUMENTO'
      Required = True
    end
    object cdsBkpdfeDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object cdsBkpdfeDATARECTO: TDateField
      FieldName = 'DATARECTO'
      Origin = 'DATARECTO'
    end
    object cdsBkpdfeMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
    end
    object cdsBkpdfePROTOCOLOCANC: TStringField
      FieldName = 'PROTOCOLOCANC'
      Origin = 'PROTOCOLOCANC'
      Size = 50
    end
    object cdsBkpdfePROTOCOLORECTO: TStringField
      FieldName = 'PROTOCOLORECTO'
      Origin = 'PROTOCOLORECTO'
      Size = 50
    end
    object cdsBkpdfeDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'DATAALTERACAO'
    end
    object cdsBkpdfeTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsBkpdfeEMAILSNOTIFICADOS: TStringField
      FieldName = 'EMAILSNOTIFICADOS'
      Origin = 'EMAILSNOTIFICADOS'
      Size = 150
    end
    object cdsBkpdfeTIPOAMBIENTE: TStringField
      FieldName = 'TIPOAMBIENTE'
      Origin = 'TIPOAMBIENTE'
      Size = 30
    end
    object cdsBkpdfeXMLENVIO: TBlobField
      FieldName = 'XMLENVIO'
      Origin = 'XMLENVIO'
    end
    object cdsBkpdfeXMLEXTEND: TBlobField
      FieldName = 'XMLEXTEND'
      Origin = 'XMLEXTEND'
    end
    object cdsBkpdfeMOTIVOCANC: TStringField
      FieldName = 'MOTIVOCANC'
      Origin = 'MOTIVOCANC'
    end
    object cdsBkpdfeXMLENVIOCANC: TBlobField
      FieldName = 'XMLENVIOCANC'
      Origin = 'XMLENVIOCANC'
    end
    object cdsBkpdfeXMLEXTENDCANC: TBlobField
      FieldName = 'XMLEXTENDCANC'
      Origin = 'XMLEXTENDCANC'
    end
    object cdsBkpdfePROTOCOLOAUT: TStringField
      FieldName = 'PROTOCOLOAUT'
      Origin = 'PROTOCOLOAUT'
      Size = 50
    end
  end
  object provBkpdfe: TDataSetProvider
    DataSet = sqlBkpDfe
    Left = 24
    Top = 212
  end
  object sqlBkpDfe: TFDQuery
    Connection = conConexaoFD
    Transaction = fdtrTransacao
    SQL.Strings = (
      'select * from LM_bkpdfe')
    Left = 24
    Top = 348
  end
  object dsUsuarios: TDataSource
    DataSet = cdsUsuarios
    Left = 136
    Top = 280
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provUsuarios'
    Left = 136
    Top = 144
    object cdsUsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsuariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 30
    end
    object cdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 16
    end
  end
  object provUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Left = 136
    Top = 212
  end
  object sqlUsuarios: TFDQuery
    Connection = conConexaoFD
    Transaction = fdtrTransacao
    SQL.Strings = (
      'select * from usuarios')
    Left = 136
    Top = 348
  end
  object cdsConfiguracoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provConfiguracoes'
    Left = 248
    Top = 136
    object cdsConfiguracoesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConfiguracoesNAMEBD: TStringField
      FieldName = 'NAMEBD'
      Origin = 'NAMEBD'
      Required = True
      Size = 50
    end
    object cdsConfiguracoesPATHBD: TStringField
      FieldName = 'PATHBD'
      Origin = 'PATHBD'
      Required = True
      Size = 255
    end
    object cdsConfiguracoesSENHABD: TStringField
      FieldName = 'SENHABD'
      Origin = 'SENHABD'
      Required = True
      Size = 10
    end
    object cdsConfiguracoesUSUARIOBD: TStringField
      FieldName = 'USUARIOBD'
      Origin = 'USUARIOBD'
      Required = True
      Size = 15
    end
    object cdsConfiguracoesNFEPATHSEND: TStringField
      FieldName = 'NFEPATHSEND'
      Origin = 'NFEPATHSEND'
      Size = 255
    end
    object cdsConfiguracoesNFEPATHRETURN: TStringField
      FieldName = 'NFEPATHRETURN'
      Origin = 'NFEPATHRETURN'
      Size = 255
    end
    object cdsConfiguracoesPATHRETENVNFE: TStringField
      FieldName = 'PATHRETENVNFE'
      Origin = 'PATHRETENVNFE'
      Size = 255
    end
    object cdsConfiguracoesPATHRETCANCNFE: TStringField
      FieldName = 'PATHRETCANCNFE'
      Origin = 'PATHRETCANCNFE'
      Size = 255
    end
    object cdsConfiguracoesPATHRETINUTNFE: TStringField
      FieldName = 'PATHRETINUTNFE'
      Origin = 'PATHRETINUTNFE'
      Size = 255
    end
    object cdsConfiguracoesEXTAUTNFE: TStringField
      FieldName = 'EXTAUTNFE'
      Origin = 'EXTAUTNFE'
      Size = 50
    end
    object cdsConfiguracoesEXTINUTNFE: TStringField
      FieldName = 'EXTINUTNFE'
      Origin = 'EXTINUTNFE'
      Size = 50
    end
    object cdsConfiguracoesEXTCANCNFE: TStringField
      FieldName = 'EXTCANCNFE'
      Origin = 'EXTCANCNFE'
      Size = 50
    end
    object cdsConfiguracoesNFCEPATHSEND: TStringField
      FieldName = 'NFCEPATHSEND'
      Origin = 'NFCEPATHSEND'
      Size = 255
    end
    object cdsConfiguracoesNFCEPATHRETURN: TStringField
      FieldName = 'NFCEPATHRETURN'
      Origin = 'NFCEPATHRETURN'
      Size = 255
    end
    object cdsConfiguracoesPATHRETENVNFCE: TStringField
      FieldName = 'PATHRETENVNFCE'
      Origin = 'PATHRETENVNFCE'
      Size = 255
    end
    object cdsConfiguracoesPATHRETCANCNFCE: TStringField
      FieldName = 'PATHRETCANCNFCE'
      Origin = 'PATHRETCANCNFCE'
      Size = 255
    end
    object cdsConfiguracoesPATHRETINUTNFCE: TStringField
      FieldName = 'PATHRETINUTNFCE'
      Origin = 'PATHRETINUTNFCE'
      Size = 255
    end
    object cdsConfiguracoesEXTAUTNFCE: TStringField
      FieldName = 'EXTAUTNFCE'
      Origin = 'EXTAUTNFCE'
      Size = 50
    end
    object cdsConfiguracoesEXTINUTNFCE: TStringField
      FieldName = 'EXTINUTNFCE'
      Origin = 'EXTINUTNFCE'
      Size = 50
    end
    object cdsConfiguracoesEXTCANCNFCE: TStringField
      FieldName = 'EXTCANCNFCE'
      Origin = 'EXTCANCNFCE'
      Size = 50
    end
    object cdsConfiguracoesNFSEPATHSEND: TStringField
      FieldName = 'NFSEPATHSEND'
      Origin = 'NFSEPATHSEND'
      Size = 255
    end
    object cdsConfiguracoesNFSEPATHRETURN: TStringField
      FieldName = 'NFSEPATHRETURN'
      Origin = 'NFSEPATHRETURN'
      Size = 255
    end
    object cdsConfiguracoesPATHRETENVNFSE: TStringField
      FieldName = 'PATHRETENVNFSE'
      Origin = 'PATHRETENVNFSE'
      Size = 255
    end
    object cdsConfiguracoesPATHRETCANCNFSE: TStringField
      FieldName = 'PATHRETCANCNFSE'
      Origin = 'PATHRETCANCNFSE'
      Size = 255
    end
    object cdsConfiguracoesPATHRETINUTNFSE: TStringField
      FieldName = 'PATHRETINUTNFSE'
      Origin = 'PATHRETINUTNFSE'
      Size = 255
    end
    object cdsConfiguracoesEXTAUTNFSE: TStringField
      FieldName = 'EXTAUTNFSE'
      Origin = 'EXTAUTNFSE'
      Size = 50
    end
    object cdsConfiguracoesEXTINUTNFSE: TStringField
      FieldName = 'EXTINUTNFSE'
      Origin = 'EXTINUTNFSE'
      Size = 50
    end
    object cdsConfiguracoesEXTCANCNFSE: TStringField
      FieldName = 'EXTCANCNFSE'
      Origin = 'EXTCANCNFSE'
      Size = 50
    end
    object cdsConfiguracoesDESCRICONFIG: TStringField
      FieldName = 'DESCRICONFIG'
      Origin = 'DESCRICONFIG'
    end
    object cdsConfiguracoesIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Origin = 'IDUSUARIO'
    end
  end
  object provConfiguracoes: TDataSetProvider
    DataSet = sqlConfiguracoes
    Left = 248
    Top = 204
  end
end