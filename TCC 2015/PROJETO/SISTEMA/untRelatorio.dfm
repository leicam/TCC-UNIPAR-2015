object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 452
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxPedCompra: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42175.886586643500000000
    ReportOptions.LastChange = 42182.600966365740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 32
    Datasets = <
      item
        DataSet = frxDBPedCompra
        DataSetName = 'PedCompra'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object rbTitulo: TfrxReportTitle
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NERV Sistemas')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Top = 34.015770000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Align = baRight
          Left = 638.740570000000000000
          Top = 34.015770000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object mdPedCompra: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 86.929190000000000000
        ParentFont = False
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frxDBPedCompra
        DataSetName = 'PedCompra'
        RowCount = 0
        object Memo3: TfrxMemoView
          Align = baLeft
          Top = 37.795300000000000000
          Width = 83.149606299212600000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vl. bruto:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 158.740208740157500000
          Top = 37.795300000000000000
          Width = 94.488198740000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vl. desconto:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 332.598486220157500000
          Top = 37.795300000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vl. liquido:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baRight
          Left = 427.086890000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Status do pedido:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 162.519790000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Data do pedido:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Width = 83.149606299212600000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cd. pedido:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Fornecedor:')
          ParentFont = False
        end
        object PedCompraCD_PEDIDO: TfrxMemoView
          Left = 83.149660000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_PEDIDO'
          DataSet = frxDBPedCompra
          DataSetName = 'PedCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PedCompra."CD_PEDIDO"]')
          ParentFont = False
        end
        object PedCompraDT_PEDIDO: TfrxMemoView
          Align = baLeft
          Left = 272.126160000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_PEDIDO'
          DataSet = frxDBPedCompra
          DataSetName = 'PedCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PedCompra."DT_PEDIDO"]')
          ParentFont = False
        end
        object PedCompraIN_STATUS: TfrxMemoView
          Align = baRight
          Left = 548.031850000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'IN_STATUS'
          DataSet = frxDBPedCompra
          DataSetName = 'PedCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PedCompra."IN_STATUS"]')
          ParentFont = False
        end
        object PedCompraDS_FANTASIA: TfrxMemoView
          Align = baWidth
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_FANTASIA'
          DataSet = frxDBPedCompra
          DataSetName = 'PedCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PedCompra."DS_FANTASIA"]')
          ParentFont = False
        end
        object PedCompraVL_BRUTO: TfrxMemoView
          Left = 79.370130000000000000
          Top = 37.795300000000000000
          Width = 79.370078740157500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_BRUTO'
          DataSet = frxDBPedCompra
          DataSetName = 'PedCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PedCompra."VL_BRUTO"]')
          ParentFont = False
        end
        object PedCompraVL_LIQUIDO: TfrxMemoView
          Align = baLeft
          Left = 411.968564960157500000
          Top = 37.795300000000000000
          Width = 79.370078740157500000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_LIQUIDO'
          DataSet = frxDBPedCompra
          DataSetName = 'PedCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PedCompra."VL_LIQUIDO"]')
          ParentFont = False
        end
        object PedCompraVL_DESCONTO: TfrxMemoView
          Align = baLeft
          Left = 253.228407480157500000
          Top = 37.795300000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_DESCONTO'
          DataSet = frxDBPedCompra
          DataSetName = 'PedCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PedCompra."VL_DESCONTO"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 52.913420000000000000
        Top = 120.944960000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Relat'#243'rio - Pedido de compra')
          ParentFont = False
        end
      end
    end
  end
  object frxDBPedCompra: TfrxDBDataset
    UserName = 'PedCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CD_PEDIDO=CD_PEDIDO'
      'DT_PEDIDO=DT_PEDIDO'
      'IN_STATUS=IN_STATUS'
      'VL_BRUTO=VL_BRUTO'
      'VL_DESCONTO=VL_DESCONTO'
      'VL_LIQUIDO=VL_LIQUIDO'
      'CD_CONDPGTO=CD_CONDPGTO'
      'CD_FORNECEDOR=CD_FORNECEDOR'
      'DS_FANTASIA=DS_FANTASIA')
    DataSource = frmRptPedCompra.dsPedCompra
    BCDToCurrency = False
    Left = 160
    Top = 32
  end
  object frxDBPedCompra2: TfrxDBDataset
    UserName = 'PedCompra2'
    CloseDataSource = False
    DataSet = frmPedidoCompra.SQLImprimir
    BCDToCurrency = False
    Left = 160
    Top = 104
  end
  object frxDBItemCompra: TfrxDBDataset
    UserName = 'ItemCompra'
    CloseDataSource = False
    DataSource = frmPedidoCompra.dsItemCompra
    BCDToCurrency = False
    Left = 264
    Top = 104
  end
  object frxContasReceber: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42182.481789421300000000
    ReportOptions.LastChange = 42182.601159664350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 176
    Datasets = <
      item
        DataSet = frxDBContasReceber
        DataSetName = 'ContasReceber'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object ReportTitle1: TfrxReportTitle
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NERV Sistemas')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Top = 34.015770000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Align = baRight
          Left = 638.740570000000000000
          Top = 34.015770000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 52.913420000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Relatorio - Contas a receber')
          ParentFont = False
        end
      end
      object mdContasReceber: TfrxMasterData
        Height = 113.385900000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        DataSet = frxDBContasReceber
        DataSetName = 'ContasReceber'
        RowCount = 0
        object ContasReceberCD_ORDSERV: TfrxMemoView
          Left = 298.582870000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_ORDSERV'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Memo.UTF8W = (
            '[ContasReceber."CD_ORDSERV"]')
        end
        object ContasReceberCD_CONTA: TfrxMemoView
          Align = baLeft
          Left = 71.811070000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_CONTA'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Memo.UTF8W = (
            '[ContasReceber."CD_CONTA"]')
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Top = 11.338590000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cd. conta:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 151.181200000000000000
          Top = 11.338590000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cd. ordem de servi'#231'o:')
          ParentFont = False
        end
        object ContasReceberIN_STATUS: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Top = 11.338590000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'IN_STATUS'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasReceber."IN_STATUS"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 506.457020000000000000
          Top = 11.338590000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object ContasReceberDS_NOME: TfrxMemoView
          Align = baWidth
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_NOME'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasReceber."DS_NOME"]')
          ParentFont = False
        end
        object ContasReceberDT_CONTA: TfrxMemoView
          Align = baLeft
          Left = 71.811070000000000000
          Top = 52.913420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_CONTA'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasReceber."DT_CONTA"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. conta:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 151.181200000000000000
          Top = 52.913420000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. finalizada:')
          ParentFont = False
        end
        object ContasReceberDT_FINALIZADA: TfrxMemoView
          Align = baLeft
          Left = 245.669450000000000000
          Top = 52.913420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_FINALIZADA'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasReceber."DT_FINALIZADA"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 264.567100000000000000
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vl. total:')
          ParentFont = False
        end
        object ContasReceberVL_TOTALRECEBIDO: TfrxMemoView
          Align = baRight
          Left = 566.929500000000000000
          Top = 71.811070000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_TOTALRECEBIDO'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasReceber."VL_TOTALRECEBIDO"]')
          ParentFont = False
        end
        object ContasReceberVL_TOTAL: TfrxMemoView
          Align = baRight
          Left = 328.819110000000000000
          Top = 71.811070000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_TOTAL'
          DataSet = frxDBContasReceber
          DataSetName = 'ContasReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasReceber."VL_TOTAL"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baRight
          Left = 480.000310000000000000
          Top = 71.811070000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vl. rebecido:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBContasReceber: TfrxDBDataset
    UserName = 'ContasReceber'
    CloseDataSource = False
    DataSource = frmRptContasReceber.dsContasReceber
    BCDToCurrency = False
    Left = 160
    Top = 176
  end
  object frxContasPagar: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42182.582026169000000000
    ReportOptions.LastChange = 42182.601296516200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 240
    Datasets = <
      item
        DataSet = frxDBContasPagar
        DataSetName = 'ContasPagar'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object ReportTitle1: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NERV Sistemas')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Align = baRight
          Left = 638.740570000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 68.031540000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 11.338590000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Relatorio - Contas a pagar')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 109.606370000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        DataSet = frxDBContasPagar
        DataSetName = 'ContasPagar'
        RowCount = 0
        object ContasPagarCD_CONTA: TfrxMemoView
          Align = baLeft
          Left = 71.811070000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_CONTA'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."CD_CONTA"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cd. conta:')
          ParentFont = False
        end
        object ContasPagarNR_PARCELA: TfrxMemoView
          Align = baLeft
          Left = 385.512060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NR_PARCELA'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."NR_PARCELA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 309.921460000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nr. parcela')
          ParentFont = False
        end
        object ContasPagarCD_PEDIDO: TfrxMemoView
          Align = baLeft
          Left = 230.551330000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_PEDIDO'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."CD_PEDIDO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 151.181200000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cd. pedido:')
          ParentFont = False
        end
        object ContasPagarDS_FANTASIA: TfrxMemoView
          Align = baWidth
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_FANTASIA'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."DS_FANTASIA"]')
          ParentFont = False
        end
        object ContasPagarDT_CONTA: TfrxMemoView
          Align = baLeft
          Left = 71.811070000000000000
          Top = 41.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_CONTA'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."DT_CONTA"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Top = 41.574830000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. conta:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 158.740260000000000000
          Top = 41.574830000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. vencimento:')
          ParentFont = False
        end
        object ContasPagarDT_VENCIMENTO: TfrxMemoView
          Align = baLeft
          Left = 268.346630000000000000
          Top = 41.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_VENCIMENTO'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."DT_VENCIMENTO"]')
          ParentFont = False
        end
        object ContasPagarDT_PAGA: TfrxMemoView
          Align = baLeft
          Left = 411.968770000000000000
          Top = 41.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_PAGA'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."DT_PAGA"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 347.716760000000000000
          Top = 41.574830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. paga:')
          ParentFont = False
        end
        object ContasPagarIN_STATUS: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'IN_STATUS'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."IN_STATUS"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baRight
          Left = 514.016080000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object ContasPagarVL_PARCELA: TfrxMemoView
          Align = baRight
          Left = 347.716760000000000000
          Top = 60.472480000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_PARCELA'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."VL_PARCELA"]')
          ParentFont = False
        end
        object ContasPagarVL_PAGO: TfrxMemoView
          Align = baRight
          Left = 566.929500000000000000
          Top = 60.472480000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_PAGO'
          DataSet = frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ContasPagar."VL_PAGO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 498.897960000000000000
          Top = 60.472480000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vl. pago:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baRight
          Left = 264.567100000000000000
          Top = 60.472480000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vl. parcela:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBContasPagar: TfrxDBDataset
    UserName = 'ContasPagar'
    CloseDataSource = False
    DataSource = frmRptContasPagar.dsContasPagar
    BCDToCurrency = False
    Left = 160
    Top = 240
  end
  object frxOrdemServico: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42183.899460092590000000
    ReportOptions.LastChange = 42184.798611956020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 312
    Datasets = <
      item
        DataSet = frxDBOrdemServico
        DataSetName = 'OrdemServico'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object ReportTitle1: TfrxReportTitle
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NERV Sistemas')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 585.827150000000000000
          Top = 41.574830000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Align = baRight
          Left = 653.858690000000000000
          Top = 41.574830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 60.472480000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Relatorio - Ordem de servi'#231'o')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 249.448980000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = frxDBOrdemServico
        DataSetName = 'OrdemServico'
        RowCount = 0
        object OrdemServicoCD_ORDSERV: TfrxMemoView
          Align = baLeft
          Left = 143.622140000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_ORDSERV'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."CD_ORDSERV"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Top = 15.118120000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cd. ordem de servi'#231'o:')
          ParentFont = False
        end
        object OrdemServicoIN_STATUS: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Top = 15.118120000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'IN_STATUS'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."IN_STATUS"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baRight
          Left = 506.457020000000000000
          Top = 15.118120000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object OrdemServicoDT_CADASTRO: TfrxMemoView
          Align = baLeft
          Left = 68.031540000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_CADASTRO'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."DT_CADASTRO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Top = 79.370130000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cadastro:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 147.401670000000000000
          Top = 79.370130000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Previs'#227'o de inicio:')
          ParentFont = False
        end
        object OrdemServicoDT_PREVINI: TfrxMemoView
          Align = baLeft
          Left = 268.346630000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_PREVINI'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."DT_PREVINI"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Top = 56.692950000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 41.574830000000000000
          Top = 64.252010000000000000
          Width = 676.535870000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 45.354360000000000000
          Top = 132.283550000000000000
          Width = 676.535870000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 347.716760000000000000
          Top = 79.370130000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Previs'#227'o de fim:')
          ParentFont = False
        end
        object OrdemServicoDT_PREVFIM: TfrxMemoView
          Align = baLeft
          Left = 457.323130000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_PREVFIM'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."DT_PREVFIM"]')
          ParentFont = False
        end
        object OrdemServicoDT_FIM: TfrxMemoView
          Align = baLeft
          Left = 457.323130000000000000
          Top = 105.826840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_FIM'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."DT_FIM"]')
          ParentFont = False
        end
        object OrdemServicoDT_INICIO: TfrxMemoView
          Align = baLeft
          Left = 268.346630000000000000
          Top = 105.826840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_INICIO'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."DT_INICIO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 381.732530000000000000
          Top = 105.826840000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Finalizada:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 207.874150000000000000
          Top = 105.826840000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Iniciada:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object OrdemServicoDS_NOME: TfrxMemoView
          Align = baWidth
          Left = 52.913420000000000000
          Top = 37.795300000000000000
          Width = 665.197280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_NOME'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."DS_NOME"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 283.464750000000000000
          Top = 15.118120000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Material incluso:')
          ParentFont = False
        end
        object OrdemServicoIN_MTINCLUSO: TfrxMemoView
          Left = 396.850650000000000000
          Top = 15.118120000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'IN_MTINCLUSO'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."IN_MTINCLUSO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 124.724490000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 22.677180000000000000
          Top = 147.401670000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bruto:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 196.535560000000000000
          Top = 147.401670000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desconto:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Top = 147.401670000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Liquido:')
          ParentFont = False
        end
        object OrdemServicoVL_BRUTO: TfrxMemoView
          Align = baLeft
          Left = 68.031540000000000000
          Top = 147.401670000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_BRUTO'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."VL_BRUTO"]')
          ParentFont = False
        end
        object OrdemServicoVL_DESCONTO: TfrxMemoView
          Left = 268.346630000000000000
          Top = 147.401670000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_DESCONTO'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."VL_DESCONTO"]')
          ParentFont = False
        end
        object OrdemServicoVL_LIQUIDO: TfrxMemoView
          Align = baLeft
          Left = 457.323130000000000000
          Top = 147.401670000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_LIQUIDO'
          DataSet = frxDBOrdemServico
          DataSetName = 'OrdemServico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico."VL_LIQUIDO"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Top = 181.417440000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Top = 3.779530000000000000
          Width = 721.890230000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBOrdemServico: TfrxDBDataset
    UserName = 'OrdemServico'
    CloseDataSource = False
    DataSource = frmRptOrdemServico.dsOrdemServico
    BCDToCurrency = False
    Left = 160
    Top = 312
  end
  object frxPedCompra2: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42183.933494837960000000
    ReportOptions.LastChange = 42183.966951817130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 112
    Datasets = <
      item
        DataSet = frxDBItemCompra
        DataSetName = 'ItemCompra'
      end
      item
        DataSet = frxDBPedCompra2
        DataSetName = 'PedCompra2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object ReportTitle1: TfrxReportTitle
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NERV Sistemas')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 589.606680000000000000
          Top = 45.354360000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Align = baRight
          Left = 653.858690000000000000
          Top = 45.354360000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 52.913420000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Align = baWidth
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Pedido de compra')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 109.606370000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = frxDBPedCompra2
        DataSetName = 'PedCompra2'
        RowCount = 0
        object PedCompra2CD_PEDIDO: TfrxMemoView
          Align = baLeft
          Left = 79.370130000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_PEDIDO'
          DataSet = frxDBPedCompra2
          DataSetName = 'PedCompra2'
          Memo.UTF8W = (
            '[PedCompra2."CD_PEDIDO"]')
        end
        object Memo1: TfrxMemoView
          Align = baLeft
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cd. pedido:')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 253.228510000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data cadastro:')
          ParentFont = False
        end
        object PedCompra2DT_PEDIDO: TfrxMemoView
          Left = 351.496290000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_PEDIDO'
          DataSet = frxDBPedCompra2
          DataSetName = 'PedCompra2'
          Memo.UTF8W = (
            '[PedCompra2."DT_PEDIDO"]')
        end
        object PedCompra2IN_STATUS: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'IN_STATUS'
          DataSet = frxDBPedCompra2
          DataSetName = 'PedCompra2'
          Memo.UTF8W = (
            '[PedCompra2."IN_STATUS"]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 510.236550000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object PedCompra2DS_FANTASIA: TfrxMemoView
          Align = baWidth
          Left = 83.149660000000000000
          Top = 45.354360000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_FANTASIA'
          DataSet = frxDBPedCompra2
          DataSetName = 'PedCompra2'
          Memo.UTF8W = (
            '[PedCompra2."DS_FANTASIA"]')
        end
        object Memo4: TfrxMemoView
          Top = 45.354360000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Top = 71.811070000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Item(ns) pedido de compra')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Top = 90.708720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Cd. material')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 79.370130000000000000
          Top = 90.708720000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 298.582870000000000000
          Top = 90.708720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 377.953000000000000000
          Top = 90.708720000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Quant. recebida')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Left = 483.779840000000000000
          Top = 90.708720000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Unid. venda')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          Left = 566.929500000000000000
          Top = 90.708720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Vl. material')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          Left = 642.520100000000000000
          Top = 90.708720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Vl. total')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        DataSet = frxDBItemCompra
        DataSetName = 'ItemCompra'
        RowCount = 0
        object ItemCompraCD_MATERIAL: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_MATERIAL'
          DataSet = frxDBItemCompra
          DataSetName = 'ItemCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ItemCompra."CD_MATERIAL"]')
          ParentFont = False
        end
        object ItemCompraDS_MATERIAL: TfrxMemoView
          Left = 79.370130000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_MATERIAL'
          DataSet = frxDBItemCompra
          DataSetName = 'ItemCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ItemCompra."DS_MATERIAL"]')
          ParentFont = False
        end
        object ItemCompraQT_ITEM: TfrxMemoView
          Left = 298.582870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'QT_ITEM'
          DataSet = frxDBItemCompra
          DataSetName = 'ItemCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ItemCompra."QT_ITEM"]')
          ParentFont = False
        end
        object ItemCompraQT_RECEBIDA: TfrxMemoView
          Left = 377.953000000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'QT_RECEBIDA'
          DataSet = frxDBItemCompra
          DataSetName = 'ItemCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ItemCompra."QT_RECEBIDA"]')
          ParentFont = False
        end
        object ItemCompraUN_MATERIAL: TfrxMemoView
          Left = 483.779840000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'UN_MATERIAL'
          DataSet = frxDBItemCompra
          DataSetName = 'ItemCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ItemCompra."UN_MATERIAL"]')
          ParentFont = False
        end
        object ItemCompraVL_MATERIAL: TfrxMemoView
          Left = 566.929500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_MATERIAL'
          DataSet = frxDBItemCompra
          DataSetName = 'ItemCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ItemCompra."VL_MATERIAL"]')
          ParentFont = False
        end
        object ItemCompraVL_TOTAL: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_TOTAL'
          DataSet = frxDBItemCompra
          DataSetName = 'ItemCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ItemCompra."VL_TOTAL"]')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 90.708720000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBPedCompra2
        DataSetName = 'PedCompra2'
        RowCount = 0
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Width = 672.756340000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Top = 64.252010000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Top = 37.795300000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bruto:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 321.260050000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desconto:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 589.606726377952800000
          Top = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Liquido:')
          ParentFont = False
        end
        object PedCompra2VL_BRUTO: TfrxMemoView
          Align = baLeft
          Left = 45.354360000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_BRUTO'
          DataSet = frxDBPedCompra2
          DataSetName = 'PedCompra2'
          Memo.UTF8W = (
            '[PedCompra2."VL_BRUTO"]')
        end
        object PedCompra2VL_DESCONTO: TfrxMemoView
          Left = 396.850650000000000000
          Top = 37.795300000000000000
          Width = 71.811023622047240000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_DESCONTO'
          DataSet = frxDBPedCompra2
          DataSetName = 'PedCompra2'
          Memo.UTF8W = (
            '[PedCompra2."VL_DESCONTO"]')
        end
        object PedCompra2VL_LIQUIDO: TfrxMemoView
          Align = baRight
          Left = 646.299676377952800000
          Top = 37.795300000000000000
          Width = 71.811023622047240000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_LIQUIDO'
          DataSet = frxDBPedCompra2
          DataSetName = 'PedCompra2'
          Memo.UTF8W = (
            '[PedCompra2."VL_LIQUIDO"]')
        end
      end
    end
  end
  object frxOrdemServico2: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42184.786250567130000000
    ReportOptions.LastChange = 42184.893000879630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 376
    Datasets = <
      item
        DataSet = frxDBMaterialOrdserv
        DataSetName = 'MaterialOrdserv'
      end
      item
        DataSet = frxDBOrdemServico2
        DataSetName = 'OrdemServico2'
      end
      item
        DataSet = frxDBServicoOrdemServ
        DataSetName = 'ServicoOrdemServ'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object ReportTitle1: TfrxReportTitle
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NERV Sistemas')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 608.504330000000000000
          Top = 45.354360000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Align = baRight
          Left = 665.197280000000000000
          Top = 45.354360000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 34.015770000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Ordem de servi'#231'o')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 154.960730000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDBOrdemServico2
        DataSetName = 'OrdemServico2'
        RowCount = 0
        object OrdemServico2CD_ORDSERV: TfrxMemoView
          Align = baLeft
          Left = 143.622140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_ORDSERV'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."CD_ORDSERV"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cd. ordem de servi'#231'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 45.354360000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object OrdemServico2DT_CADASTRO: TfrxMemoView
          Left = 71.811070000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_CADASTRO'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."DT_CADASTRO"]')
          ParentFont = False
        end
        object OrdemServico2IN_STATUS: TfrxMemoView
          Align = baRight
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'IN_STATUS'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."IN_STATUS"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 510.236550000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 34.015770000000000000
          Top = 52.913420000000000000
          Width = 684.094930000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cadastro:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 411.968770000000000000
          Top = 64.252010000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Iniciada:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 173.858380000000000000
          Top = 64.252010000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Previs'#227'o de inicio:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 188.976500000000000000
          Top = 86.929190000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Previs'#227'o de fim:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 396.850650000000000000
          Top = 86.929190000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Finalizada:')
          ParentFont = False
        end
        object OrdemServico2DT_INICIO: TfrxMemoView
          Left = 472.441250000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_INICIO'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."DT_INICIO"]')
          ParentFont = False
        end
        object OrdemServico2DT_PREVINI: TfrxMemoView
          Left = 294.803340000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_PREVINI'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."DT_PREVINI"]')
          ParentFont = False
        end
        object OrdemServico2DT_PREVFIM: TfrxMemoView
          Left = 294.803340000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_PREVFIM'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."DT_PREVFIM"]')
          ParentFont = False
        end
        object OrdemServico2DT_FIM: TfrxMemoView
          Left = 472.441250000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DT_FIM'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."DT_FIM"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object OrdemServico2DS_NOME: TfrxMemoView
          Align = baWidth
          Left = 56.692950000000000000
          Top = 22.677180000000000000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_NOME'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OrdemServico2."DS_NOME"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 117.165430000000000000
          Width = 714.331170000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        DataSet = frxDBMaterialOrdserv
        DataSetName = 'MaterialOrdserv'
        RowCount = 0
        object MaterialOrdservCD_MATERIAL: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_MATERIAL'
          DataSet = frxDBMaterialOrdserv
          DataSetName = 'MaterialOrdserv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[MaterialOrdserv."CD_MATERIAL"]')
          ParentFont = False
        end
        object MaterialOrdservDS_MATERIAL: TfrxMemoView
          Align = baWidth
          Left = 79.370130000000000000
          Width = 389.291590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_MATERIAL'
          DataSet = frxDBMaterialOrdserv
          DataSetName = 'MaterialOrdserv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[MaterialOrdserv."DS_MATERIAL"]')
          ParentFont = False
        end
        object MaterialOrdservQT_ITEM: TfrxMemoView
          Left = 548.031850000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'QT_ITEM'
          DataSet = frxDBMaterialOrdserv
          DataSetName = 'MaterialOrdserv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[MaterialOrdserv."QT_ITEM"]')
          ParentFont = False
        end
        object MaterialOrdservUN_MATERIAL: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_TOTAL'
          DataSet = frxDBMaterialOrdserv
          DataSetName = 'MaterialOrdserv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[MaterialOrdserv."VL_TOTAL"]')
          ParentFont = False
        end
        object MaterialOrdservUN_MATERIAL1: TfrxMemoView
          Align = baWidth
          Left = 468.661720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'UN_MATERIAL'
          DataSet = frxDBMaterialOrdserv
          DataSetName = 'MaterialOrdserv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[MaterialOrdserv."UN_MATERIAL"]')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 619.842920000000000000
        Width = 718.110700000000000000
        DataSet = frxDBServicoOrdemServ
        DataSetName = 'ServicoOrdemServ'
        RowCount = 0
        object ServicoOrdemServCD_SERVICO: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CD_SERVICO'
          DataSet = frxDBServicoOrdemServ
          DataSetName = 'ServicoOrdemServ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ServicoOrdemServ."CD_SERVICO"]')
          ParentFont = False
        end
        object ServicoOrdemServDS_SERVICO: TfrxMemoView
          Align = baWidth
          Left = 79.370130000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DS_SERVICO'
          DataSet = frxDBServicoOrdemServ
          DataSetName = 'ServicoOrdemServ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ServicoOrdemServ."DS_SERVICO"]')
          ParentFont = False
        end
        object ServicoOrdemServUN_SERVICO: TfrxMemoView
          Left = 480.000310000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'UN_SERVICO'
          DataSet = frxDBServicoOrdemServ
          DataSetName = 'ServicoOrdemServ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ServicoOrdemServ."UN_SERVICO"]')
          ParentFont = False
        end
        object ServicoOrdemServVL_SERVICO: TfrxMemoView
          Left = 559.370440000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_SERVICO'
          DataSet = frxDBServicoOrdemServ
          DataSetName = 'ServicoOrdemServ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ServicoOrdemServ."VL_SERVICO"]')
          ParentFont = False
        end
        object ServicoOrdemServVL_TOTAL: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_TOTAL'
          DataSet = frxDBServicoOrdemServ
          DataSetName = 'ServicoOrdemServ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ServicoOrdemServ."VL_TOTAL"]')
          ParentFont = False
        end
        object ServicoOrdemServVL_SERVICO1: TfrxMemoView
          Left = 400.630180000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_SERVICO'
          DataSet = frxDBServicoOrdemServ
          DataSetName = 'ServicoOrdemServ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ServicoOrdemServ."VL_SERVICO"]')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 105.826840000000000000
        Top = 661.417750000000000000
        Width = 718.110700000000000000
        DataSet = frxDBOrdemServico2
        DataSetName = 'OrdemServico2'
        RowCount = 0
        object OrdemServico2VL_BRUTO: TfrxMemoView
          Left = 49.133890000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_BRUTO'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Memo.UTF8W = (
            '[OrdemServico2."VL_BRUTO"]')
        end
        object OrdemServico2VL_DESCONTO: TfrxMemoView
          Left = 355.275820000000000000
          Top = 56.692950000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_DESCONTO'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Memo.UTF8W = (
            '[OrdemServico2."VL_DESCONTO"]')
        end
        object OrdemServico2VL_LIQUIDO: TfrxMemoView
          Left = 642.520100000000000000
          Top = 56.692950000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VL_LIQUIDO'
          DataSet = frxDBOrdemServico2
          DataSetName = 'OrdemServico2'
          Memo.UTF8W = (
            '[OrdemServico2."VL_LIQUIDO"]')
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 34.015770000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bruto:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 283.464750000000000000
          Top = 56.692950000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desconto:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 582.047620000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Liquido:')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 45.354360000000000000
          Top = 41.574830000000000000
          Width = 672.756340000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 3.779530000000000000
          Top = 86.929190000000000000
          Width = 714.331170000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object Header1: TfrxHeader
        Height = 113.385900000000000000
        Top = 483.779840000000000000
        Width = 718.110700000000000000
        object Memo22: TfrxMemoView
          Align = baWidth
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Servi'#231'o')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 79.370130000000000000
          Top = 94.488250000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 480.000310000000000000
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Unid. venda')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 559.370440000000000000
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baRight
          Left = 638.740570000000000000
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Vl. total')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 400.630180000000000000
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vl. servi'#231'o')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 37.795300000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Material')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 79.370130000000000000
          Top = 18.897650000000000000
          Width = 389.291590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 468.661720000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Unid. venda')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baRight
          Left = 638.740570000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Vl. total')
          ParentFont = False
        end
      end
    end
  end
  object frxDBOrdemServico2: TfrxDBDataset
    UserName = 'OrdemServico2'
    CloseDataSource = False
    DataSet = frmOrdemServico.SQLImprimir
    BCDToCurrency = False
    Left = 160
    Top = 376
  end
  object frxDBMaterialOrdserv: TfrxDBDataset
    UserName = 'MaterialOrdserv'
    CloseDataSource = False
    DataSource = frmOrdemServico.dsMaterialOrdServico
    BCDToCurrency = False
    Left = 280
    Top = 376
  end
  object frxDBServicoOrdemServ: TfrxDBDataset
    UserName = 'ServicoOrdemServ'
    CloseDataSource = False
    DataSource = frmOrdemServico.dsServicoOrdServico
    BCDToCurrency = False
    Left = 400
    Top = 376
  end
end
