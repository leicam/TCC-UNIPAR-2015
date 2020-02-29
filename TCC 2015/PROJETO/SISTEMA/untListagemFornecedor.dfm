inherited frmListagemFornecedor: TfrmListagemFornecedor
  Caption = 'Listagem de fornecedor'
  ClientHeight = 300
  ClientWidth = 885
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 891
  ExplicitHeight = 329
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 885
    ExplicitWidth = 885
    inherited btAdicionar: TSpeedButton
      OnClick = btAdicionarClick
    end
    inherited Label1: TLabel
      Left = 545
      ExplicitLeft = 545
    end
    inherited btAlterar: TSpeedButton
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Left = 659
      Top = 11
      Width = 222
      OnChange = edtPesquisarChange
      ExplicitLeft = 659
      ExplicitTop = 11
      ExplicitWidth = 222
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 885
    Height = 259
    Align = alClient
    DataSource = dsFornecedor
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_FORNECEDOR'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FANTASIA'
        Title.Caption = 'Nome Fantasia'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_CNPJ'
        Title.Caption = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_IS'
        Title.Caption = 'Inscri'#231#227'o Estadual'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_TELEFONE'
        Title.Caption = 'Telefone'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_STATUS'
        Title.Caption = 'Status'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_BAIRRO'
        Title.Caption = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_EMAIL'
        Title.Caption = 'E-mail'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CADASTRO'
        Title.Caption = 'Data Cadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_OBSERVACAO'
        Title.Caption = 'Observa'#231#227'o'
        Visible = True
      end>
  end
  object sdsFornecedor: TSQLDataSet
    CommandText = 'select * from FORNECEDOR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.banco
    Left = 112
    Top = 128
  end
  object dspFornecedor: TDataSetProvider
    DataSet = sdsFornecedor
    Left = 216
    Top = 128
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 312
    Top = 128
    object cdsFornecedorCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Required = True
    end
    object cdsFornecedorDS_FANTASIA: TStringField
      FieldName = 'DS_FANTASIA'
      Size = 50
    end
    object cdsFornecedorDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Size = 50
    end
    object cdsFornecedorDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 50
    end
    object cdsFornecedorDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 50
    end
    object cdsFornecedorDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 150
    end
    object cdsFornecedorNR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
    end
    object cdsFornecedorNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
    end
    object cdsFornecedorNR_CEP: TStringField
      FieldName = 'NR_CEP'
    end
    object cdsFornecedorIN_STATUS: TStringField
      FieldName = 'IN_STATUS'
    end
    object cdsFornecedorCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Required = True
    end
    object cdsFornecedorNR_IS: TStringField
      FieldName = 'NR_IS'
      FixedChar = True
    end
    object cdsFornecedorDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsFornecedorDS_RAZAOSOCIAL: TStringField
      FieldName = 'DS_RAZAOSOCIAL'
      Size = 50
    end
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 400
    Top = 128
  end
end
