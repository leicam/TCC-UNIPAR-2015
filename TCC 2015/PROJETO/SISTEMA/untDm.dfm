object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 602
  Width = 705
  object banco: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver190.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=19.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver190.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=19.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False'
      'Database=D:\TCC 2015\BANCO\BANCO.FDB')
    Connected = True
    Left = 16
    Top = 8
  end
  object sdsUsuario: TSQLDataSet
    CommandText = 
      'select * from usuario'#13#10'where (US_LOGIN = :LOGIN) and (US_SENHA =' +
      ' :SENHA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end>
    SQLConnection = banco
    Left = 56
    Top = 56
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end>
    ProviderName = 'dspUsuario'
    Left = 304
    Top = 56
    object cdsUsuarioCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Required = True
    end
    object cdsUsuarioUS_LOGIN: TStringField
      FieldName = 'US_LOGIN'
      Size = 50
    end
    object cdsUsuarioUS_SENHA: TStringField
      FieldName = 'US_SENHA'
      Size = 50
    end
    object cdsUsuarioTP_USUARIO: TStringField
      FieldName = 'TP_USUARIO'
      Size = 50
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = sdsUsuario
    UpdateMode = upWhereKeyOnly
    Left = 184
    Top = 56
  end
  object sdsComandosSQL: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 104
    Top = 8
  end
  object sdsCidade: TSQLDataSet
    CommandText = 'select * from CIDADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 56
    Top = 112
    object sdsCidadeCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object sdsCidadeDS_CIDADE: TStringField
      FieldName = 'DS_CIDADE'
      Size = 50
    end
    object sdsCidadeUF_CIDADE: TStringField
      FieldName = 'UF_CIDADE'
      FixedChar = True
      Size = 2
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = sdsCidade
    Left = 184
    Top = 104
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    Left = 304
    Top = 104
    object cdsCidadeCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object cdsCidadeDS_CIDADE: TStringField
      FieldName = 'DS_CIDADE'
      Size = 50
    end
    object cdsCidadeUF_CIDADE: TStringField
      FieldName = 'UF_CIDADE'
      FixedChar = True
      Size = 2
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = sdsCliente
    Left = 184
    Top = 160
  end
  object sdsFornecedor: TSQLDataSet
    CommandText = 'select * from FORNECEDOR order by IN_STATUS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 56
    Top = 216
  end
  object dspFornecedor: TDataSetProvider
    DataSet = sdsFornecedor
    Left = 184
    Top = 216
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 304
    Top = 216
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 304
    Top = 160
    object cdsClienteCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object cdsClienteDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsClienteDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 50
    end
    object cdsClienteDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Size = 50
    end
    object cdsClienteDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 50
    end
    object cdsClienteDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 50
    end
    object cdsClienteDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 150
    end
    object cdsClienteNR_CPF: TStringField
      FieldName = 'NR_CPF'
    end
    object cdsClienteNR_RG: TStringField
      FieldName = 'NR_RG'
    end
    object cdsClienteNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
    end
    object cdsClienteNR_CEP: TStringField
      FieldName = 'NR_CEP'
    end
    object cdsClienteIN_STATUS: TStringField
      FieldName = 'IN_STATUS'
    end
    object cdsClienteCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object cdsClienteDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
  end
  object sdsCliente: TSQLDataSet
    CommandText = 'select * from CLIENTE order by IN_STATUS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 56
    Top = 160
  end
  object sdsMaterial: TSQLDataSet
    CommandText = 'select * from MATERIAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 56
    Top = 272
  end
  object dspMaterial: TDataSetProvider
    DataSet = sdsMaterial
    Left = 184
    Top = 272
  end
  object cdsMaterial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaterial'
    Left = 304
    Top = 272
    object cdsMaterialCD_MATERIAL: TIntegerField
      FieldName = 'CD_MATERIAL'
      Required = True
    end
    object cdsMaterialDS_MATERIAL: TStringField
      FieldName = 'DS_MATERIAL'
      Size = 50
    end
    object cdsMaterialUN_MATERIAL: TStringField
      FieldName = 'UN_MATERIAL'
      Size = 10
    end
    object cdsMaterialVL_MATERIAL: TFMTBCDField
      FieldName = 'VL_MATERIAL'
      Precision = 9
      Size = 2
    end
  end
  object sdsServico: TSQLDataSet
    CommandText = 'select * from SERVICO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 56
    Top = 336
  end
  object dspServico: TDataSetProvider
    DataSet = sdsServico
    Left = 184
    Top = 336
  end
  object cdsServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServico'
    Left = 304
    Top = 336
    object cdsServicoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Required = True
    end
    object cdsServicoDS_SERVICO: TStringField
      FieldName = 'DS_SERVICO'
      Size = 50
    end
    object cdsServicoUN_SERVICO: TStringField
      FieldName = 'UN_SERVICO'
      Size = 10
    end
    object cdsServicoVL_SERVICO: TFMTBCDField
      FieldName = 'VL_SERVICO'
      Precision = 18
      Size = 2
    end
  end
  object sdsCondPgto: TSQLDataSet
    CommandText = 'select * from CONDICAO_PAGAMENTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 48
    Top = 408
  end
  object dspCondPgto: TDataSetProvider
    DataSet = sdsCondPgto
    Left = 184
    Top = 408
  end
  object cdsCondPgto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPgto'
    Left = 304
    Top = 400
    object cdsCondPgtoCD_CONDPGTO: TIntegerField
      FieldName = 'CD_CONDPGTO'
      Required = True
    end
    object cdsCondPgtoDS_CONDPGTO: TStringField
      FieldName = 'DS_CONDPGTO'
      Size = 50
    end
    object cdsCondPgtoNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
  end
  object sdsPedCompra: TSQLDataSet
    CommandText = 
      'select * from PEDIDO_COMPRA P '#13#10'inner join FORNECEDOR F'#13#10'on F.CD' +
      '_FORNECEDOR = P.CD_FORNECEDOR'#13#10'order by P.IN_STATUS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 432
    Top = 64
  end
  object dspPedCompra: TDataSetProvider
    DataSet = sdsPedCompra
    Left = 536
    Top = 64
  end
  object cdsPedCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedCompra'
    Left = 640
    Top = 64
    object cdsPedCompraCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
      Required = True
    end
    object cdsPedCompraDT_PEDIDO: TDateField
      FieldName = 'DT_PEDIDO'
    end
    object cdsPedCompraIN_STATUS: TStringField
      FieldName = 'IN_STATUS'
      FixedChar = True
    end
    object cdsPedCompraVL_BRUTO: TFMTBCDField
      FieldName = 'VL_BRUTO'
      Precision = 18
      Size = 2
    end
    object cdsPedCompraVL_DESCONTO: TFMTBCDField
      FieldName = 'VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsPedCompraVL_LIQUIDO: TFMTBCDField
      FieldName = 'VL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object cdsPedCompraCD_CONDPGTO: TIntegerField
      FieldName = 'CD_CONDPGTO'
      Required = True
    end
    object cdsPedCompraCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Required = True
    end
    object cdsPedCompraCD_FORNECEDOR_1: TIntegerField
      FieldName = 'CD_FORNECEDOR_1'
      Required = True
    end
    object cdsPedCompraDS_FANTASIA: TStringField
      FieldName = 'DS_FANTASIA'
      Size = 50
    end
    object cdsPedCompraDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Size = 50
    end
    object cdsPedCompraDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 50
    end
    object cdsPedCompraDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 50
    end
    object cdsPedCompraDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 150
    end
    object cdsPedCompraNR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
    end
    object cdsPedCompraNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
    end
    object cdsPedCompraNR_CEP: TStringField
      FieldName = 'NR_CEP'
    end
    object cdsPedCompraIN_STATUS_1: TStringField
      FieldName = 'IN_STATUS_1'
    end
    object cdsPedCompraCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object cdsPedCompraNR_IS: TStringField
      FieldName = 'NR_IS'
      FixedChar = True
    end
    object cdsPedCompraDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsPedCompraDS_RAZAOSOCIAL: TStringField
      FieldName = 'DS_RAZAOSOCIAL'
      Size = 50
    end
  end
  object sdsItemCompra: TSQLDataSet
    CommandText = 
      'select * from ITEM_COMPRA I '#13#10'inner join MATERIAL M '#13#10'on M.CD_MA' +
      'TERIAL = I.CD_MATERIAL'#13#10'where I.CD_PEDIDO = :CD_PEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = banco
    Left = 432
    Top = 128
  end
  object dspItemCompra: TDataSetProvider
    DataSet = sdsItemCompra
    Left = 536
    Top = 128
  end
  object cdsItemCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemCompra'
    Left = 640
    Top = 128
    object cdsItemCompraCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
      Required = True
    end
    object cdsItemCompraCD_MATERIAL: TIntegerField
      FieldName = 'CD_MATERIAL'
      Required = True
    end
    object cdsItemCompraQT_ITEM: TFMTBCDField
      FieldName = 'QT_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsItemCompraVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsItemCompraQT_RECEBIDA: TFMTBCDField
      FieldName = 'QT_RECEBIDA'
      Precision = 9
      Size = 2
    end
    object cdsItemCompraCD_MATERIAL_1: TIntegerField
      FieldName = 'CD_MATERIAL_1'
      Required = True
    end
    object cdsItemCompraDS_MATERIAL: TStringField
      FieldName = 'DS_MATERIAL'
      Size = 50
    end
    object cdsItemCompraUN_MATERIAL: TStringField
      FieldName = 'UN_MATERIAL'
      Size = 10
    end
    object cdsItemCompraVL_MATERIAL: TFMTBCDField
      FieldName = 'VL_MATERIAL'
      Precision = 18
      Size = 2
    end
  end
  object sdsContasPagar: TSQLDataSet
    CommandText = 
      'select * from CONTAS_PAGAR C '#13#10'inner join PEDIDO_COMPRA P '#13#10'on P' +
      '.CD_PEDIDO = C.CD_PEDIDO'#13#10'inner join FORNECEDOR F '#13#10'on F.CD_FORN' +
      'ECEDOR = P.CD_FORNECEDOR'#13#10'order by  C.CD_PEDIDO, C.IN_STATUS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 432
    Top = 200
  end
  object dspContasPagar: TDataSetProvider
    DataSet = sdsContasPagar
    Left = 536
    Top = 200
  end
  object cdsContasPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagar'
    Left = 640
    Top = 200
    object cdsContasPagarCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object cdsContasPagarCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
      Required = True
    end
    object cdsContasPagarDT_CONTA: TDateField
      FieldName = 'DT_CONTA'
    end
    object cdsContasPagarDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsContasPagarDT_PAGA: TDateField
      FieldName = 'DT_PAGA'
    end
    object cdsContasPagarIN_STATUS: TStringField
      FieldName = 'IN_STATUS'
      FixedChar = True
    end
    object cdsContasPagarNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object cdsContasPagarVL_PARCELA: TFMTBCDField
      FieldName = 'VL_PARCELA'
      Precision = 18
      Size = 2
    end
    object cdsContasPagarVL_PAGO: TFMTBCDField
      FieldName = 'VL_PAGO'
      Precision = 18
      Size = 2
    end
    object cdsContasPagarCD_PEDIDO_1: TIntegerField
      FieldName = 'CD_PEDIDO_1'
      Required = True
    end
    object cdsContasPagarDT_PEDIDO: TDateField
      FieldName = 'DT_PEDIDO'
    end
    object cdsContasPagarIN_STATUS_1: TStringField
      FieldName = 'IN_STATUS_1'
      FixedChar = True
    end
    object cdsContasPagarVL_BRUTO: TFMTBCDField
      FieldName = 'VL_BRUTO'
      Precision = 18
      Size = 2
    end
    object cdsContasPagarVL_DESCONTO: TFMTBCDField
      FieldName = 'VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsContasPagarVL_LIQUIDO: TFMTBCDField
      FieldName = 'VL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object cdsContasPagarCD_CONDPGTO: TIntegerField
      FieldName = 'CD_CONDPGTO'
      Required = True
    end
    object cdsContasPagarCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Required = True
    end
    object cdsContasPagarCD_FORNECEDOR_1: TIntegerField
      FieldName = 'CD_FORNECEDOR_1'
      Required = True
    end
    object cdsContasPagarDS_FANTASIA: TStringField
      FieldName = 'DS_FANTASIA'
      Size = 50
    end
    object cdsContasPagarDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Size = 50
    end
    object cdsContasPagarDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 50
    end
    object cdsContasPagarDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 50
    end
    object cdsContasPagarDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 150
    end
    object cdsContasPagarNR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
    end
    object cdsContasPagarNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
    end
    object cdsContasPagarNR_CEP: TStringField
      FieldName = 'NR_CEP'
    end
    object cdsContasPagarIN_STATUS_2: TStringField
      FieldName = 'IN_STATUS_2'
    end
    object cdsContasPagarCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object cdsContasPagarNR_IS: TStringField
      FieldName = 'NR_IS'
      FixedChar = True
    end
    object cdsContasPagarDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsContasPagarDS_RAZAOSOCIAL: TStringField
      FieldName = 'DS_RAZAOSOCIAL'
      Size = 50
    end
  end
  object sdsMaterialOrdServico: TSQLDataSet
    CommandText = 
      'select * from ITEM_ORDSERV I '#13#10'inner join MATERIAL M '#13#10'on M.CD_M' +
      'ATERIAL = I.CD_MATERIAL'#13#10'where I.CD_ORDSERV = :CD_ORDSERV'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ORDSERV'
        ParamType = ptInput
      end>
    SQLConnection = banco
    Left = 48
    Top = 536
  end
  object dspMaterialOrdServico: TDataSetProvider
    DataSet = sdsMaterialOrdServico
    Left = 184
    Top = 536
  end
  object cdsMaterialOrdServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaterialOrdServico'
    Left = 304
    Top = 536
    object cdsMaterialOrdServicoCD_ORDSERV: TIntegerField
      FieldName = 'CD_ORDSERV'
      Required = True
    end
    object cdsMaterialOrdServicoCD_MATERIAL: TIntegerField
      FieldName = 'CD_MATERIAL'
      Required = True
    end
    object cdsMaterialOrdServicoQT_ITEM: TFMTBCDField
      FieldName = 'QT_ITEM'
      Precision = 18
      Size = 2
    end
    object cdsMaterialOrdServicoVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsMaterialOrdServicoVL_ITEM: TFMTBCDField
      FieldName = 'VL_ITEM'
      Precision = 18
      Size = 2
    end
    object cdsMaterialOrdServicoCD_MATERIAL_1: TIntegerField
      FieldName = 'CD_MATERIAL_1'
      Required = True
    end
    object cdsMaterialOrdServicoDS_MATERIAL: TStringField
      FieldName = 'DS_MATERIAL'
      Size = 50
    end
    object cdsMaterialOrdServicoUN_MATERIAL: TStringField
      FieldName = 'UN_MATERIAL'
      Size = 10
    end
    object cdsMaterialOrdServicoVL_MATERIAL: TFMTBCDField
      FieldName = 'VL_MATERIAL'
      Precision = 18
      Size = 2
    end
  end
  object sdsOrdemServico: TSQLDataSet
    CommandText = 
      'select * from ORDEM_SERVICO O '#13#10'inner join CLIENTE C'#13#10'on C.CD_CL' +
      'IENTE = O.CD_CLIENTE'#13#10'order by O.CD_ORDSERV, O.IN_STATUS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 432
    Top = 400
  end
  object dspOrdemServico: TDataSetProvider
    DataSet = sdsOrdemServico
    Left = 536
    Top = 400
  end
  object cdsOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdemServico'
    Left = 640
    Top = 400
    object cdsOrdemServicoCD_ORDSERV: TIntegerField
      FieldName = 'CD_ORDSERV'
      Required = True
    end
    object cdsOrdemServicoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsOrdemServicoIN_STATUS: TStringField
      FieldName = 'IN_STATUS'
      FixedChar = True
    end
    object cdsOrdemServicoDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object cdsOrdemServicoDT_PREVINI: TDateField
      FieldName = 'DT_PREVINI'
    end
    object cdsOrdemServicoDT_PREVFIM: TDateField
      FieldName = 'DT_PREVFIM'
    end
    object cdsOrdemServicoVL_BRUTO: TFMTBCDField
      FieldName = 'VL_BRUTO'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVL_DESCONTO: TFMTBCDField
      FieldName = 'VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVL_LIQUIDO: TFMTBCDField
      FieldName = 'VL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object cdsOrdemServicoIN_MTINCLUSO: TStringField
      FieldName = 'IN_MTINCLUSO'
      FixedChar = True
      Size = 10
    end
    object cdsOrdemServicoDT_FIM: TDateField
      FieldName = 'DT_FIM'
    end
    object cdsOrdemServicoCD_CLIENTE_1: TIntegerField
      FieldName = 'CD_CLIENTE_1'
      Required = True
    end
    object cdsOrdemServicoDT_CADASTRO_1: TDateField
      FieldName = 'DT_CADASTRO_1'
    end
    object cdsOrdemServicoDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 50
    end
    object cdsOrdemServicoDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Size = 50
    end
    object cdsOrdemServicoDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 50
    end
    object cdsOrdemServicoDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 50
    end
    object cdsOrdemServicoDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 50
    end
    object cdsOrdemServicoNR_CPF: TStringField
      FieldName = 'NR_CPF'
    end
    object cdsOrdemServicoNR_RG: TStringField
      FieldName = 'NR_RG'
    end
    object cdsOrdemServicoNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
    end
    object cdsOrdemServicoNR_CEP: TStringField
      FieldName = 'NR_CEP'
    end
    object cdsOrdemServicoIN_STATUS_1: TStringField
      FieldName = 'IN_STATUS_1'
    end
    object cdsOrdemServicoCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object cdsOrdemServicoDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
  end
  object sdsServicoOrdServico: TSQLDataSet
    CommandText = 
      'select * from SERVICO_ORDSERV O '#13#10'inner join SERVICO S '#13#10'on S.CD' +
      '_SERVICO = O.CD_SERVICO'#13#10'where O.CD_ORDSERV = :CD_ORDSERV'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_ORDSERV'
        ParamType = ptInput
      end>
    SQLConnection = banco
    Left = 48
    Top = 464
  end
  object dspServicoOrdServico: TDataSetProvider
    DataSet = sdsServicoOrdServico
    Left = 184
    Top = 464
  end
  object cdsServicoOrdServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServicoOrdServico'
    Left = 304
    Top = 464
    object cdsServicoOrdServicoCD_ORDSERV: TIntegerField
      FieldName = 'CD_ORDSERV'
      Required = True
    end
    object cdsServicoOrdServicoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Required = True
    end
    object cdsServicoOrdServicoMT_SERVICO: TFMTBCDField
      FieldName = 'MT_SERVICO'
      Precision = 18
      Size = 2
    end
    object cdsServicoOrdServicoVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsServicoOrdServicoCD_SERVICO_1: TIntegerField
      FieldName = 'CD_SERVICO_1'
      Required = True
    end
    object cdsServicoOrdServicoDS_SERVICO: TStringField
      FieldName = 'DS_SERVICO'
      Size = 50
    end
    object cdsServicoOrdServicoUN_SERVICO: TStringField
      FieldName = 'UN_SERVICO'
      Size = 10
    end
    object cdsServicoOrdServicoVL_SERVICO: TFMTBCDField
      FieldName = 'VL_SERVICO'
      Precision = 18
      Size = 2
    end
  end
  object sdsContasReceber: TSQLDataSet
    CommandText = 
      'select * from CONTAS_RECEBER C '#13#10'inner join ORDEM_SERVICO S '#13#10'on' +
      ' S.CD_ORDSERV = C.CD_ORDSERV'#13#10'inner join CLIENTE E '#13#10'on E.CD_CLI' +
      'ENTE = S.CD_CLIENTE'#13#10'order by C.IN_STATUS, C.CD_CONTA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = banco
    Left = 432
    Top = 272
  end
  object dspContasReceber: TDataSetProvider
    DataSet = sdsContasReceber
    Left = 536
    Top = 272
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasReceber'
    Left = 640
    Top = 272
    object cdsContasReceberCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object cdsContasReceberCD_ORDSERV: TIntegerField
      FieldName = 'CD_ORDSERV'
      Required = True
    end
    object cdsContasReceberDT_CONTA: TDateField
      FieldName = 'DT_CONTA'
    end
    object cdsContasReceberIN_STATUS: TStringField
      FieldName = 'IN_STATUS'
      FixedChar = True
    end
    object cdsContasReceberVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberDT_FINALIZADA: TDateField
      FieldName = 'DT_FINALIZADA'
    end
    object cdsContasReceberVL_TOTALRECEBIDO: TFMTBCDField
      FieldName = 'VL_TOTALRECEBIDO'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberCD_ORDSERV_1: TIntegerField
      FieldName = 'CD_ORDSERV_1'
      Required = True
    end
    object cdsContasReceberDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsContasReceberIN_STATUS_1: TStringField
      FieldName = 'IN_STATUS_1'
      FixedChar = True
    end
    object cdsContasReceberDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object cdsContasReceberDT_PREVINI: TDateField
      FieldName = 'DT_PREVINI'
    end
    object cdsContasReceberDT_PREVFIM: TDateField
      FieldName = 'DT_PREVFIM'
    end
    object cdsContasReceberVL_BRUTO: TFMTBCDField
      FieldName = 'VL_BRUTO'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberVL_DESCONTO: TFMTBCDField
      FieldName = 'VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberVL_LIQUIDO: TFMTBCDField
      FieldName = 'VL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Required = True
    end
    object cdsContasReceberIN_MTINCLUSO: TStringField
      FieldName = 'IN_MTINCLUSO'
      FixedChar = True
      Size = 10
    end
    object cdsContasReceberDT_FIM: TDateField
      FieldName = 'DT_FIM'
    end
    object cdsContasReceberCD_CLIENTE_1: TIntegerField
      FieldName = 'CD_CLIENTE_1'
      Required = True
    end
    object cdsContasReceberDT_CADASTRO_1: TDateField
      FieldName = 'DT_CADASTRO_1'
    end
    object cdsContasReceberDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 50
    end
    object cdsContasReceberDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Size = 50
    end
    object cdsContasReceberDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 50
    end
    object cdsContasReceberDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 50
    end
    object cdsContasReceberDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 50
    end
    object cdsContasReceberNR_CPF: TStringField
      FieldName = 'NR_CPF'
    end
    object cdsContasReceberNR_RG: TStringField
      FieldName = 'NR_RG'
    end
    object cdsContasReceberNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
    end
    object cdsContasReceberNR_CEP: TStringField
      FieldName = 'NR_CEP'
    end
    object cdsContasReceberIN_STATUS_2: TStringField
      FieldName = 'IN_STATUS_2'
    end
    object cdsContasReceberCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object cdsContasReceberDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
  end
  object sdsAmortizacao: TSQLDataSet
    CommandText = 'select * from AMORTIZACAO'#13#10'where CD_CONTA = :CD_CONTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'CD_CONTA'
        ParamType = ptInput
      end>
    SQLConnection = banco
    Left = 432
    Top = 336
  end
  object dspAmortizacao: TDataSetProvider
    DataSet = sdsAmortizacao
    Left = 536
    Top = 336
  end
  object cdsAmortizacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAmortizacao'
    Left = 640
    Top = 336
    object cdsAmortizacaoCD_AMORTIZACAO: TIntegerField
      FieldName = 'CD_AMORTIZACAO'
      Required = True
    end
    object cdsAmortizacaoCD_CONTA: TIntegerField
      FieldName = 'CD_CONTA'
      Required = True
    end
    object cdsAmortizacaoVL_RECEBIDO: TFMTBCDField
      FieldName = 'VL_RECEBIDO'
      Precision = 18
      Size = 2
    end
    object cdsAmortizacaoDT_RECEBIDO: TDateField
      FieldName = 'DT_RECEBIDO'
    end
    object cdsAmortizacaoTP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      Size = 50
    end
  end
end
