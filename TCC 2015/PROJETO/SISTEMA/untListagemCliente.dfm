inherited frmListagemCliente: TfrmListagemCliente
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem de cliente'
  ClientHeight = 389
  ClientWidth = 900
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitWidth = 916
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 900
    ExplicitWidth = 900
    inherited btAdicionar: TSpeedButton
      OnClick = btAdicionarClick
    end
    inherited Label1: TLabel
      Left = 583
      Top = 5
      ExplicitLeft = 583
      ExplicitTop = 5
    end
    inherited btAlterar: TSpeedButton
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Left = 705
      Width = 185
      CharCase = ecUpperCase
      OnChange = edtPesquisarChange
      ExplicitLeft = 705
      ExplicitWidth = 185
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 900
    Height = 348
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 898
      Height = 346
      Align = alClient
      DataSource = dsCliente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_CLIENTE'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Nome'
          Width = 315
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_CPF'
          Title.Caption = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_RG'
          Title.Caption = 'RG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IN_STATUS'
          Title.Caption = 'Status'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_CADASTRO'
          Title.Caption = 'Data de cadastro'
          Visible = True
        end>
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 416
    Top = 144
  end
  object sdsCliente: TSQLDataSet
    CommandText = 'select * from CLIENTE'#13#10'order by CD_CLIENTE, IN_STATUS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.banco
    Left = 208
    Top = 144
  end
  object dspCliente: TDataSetProvider
    DataSet = sdsCliente
    Left = 280
    Top = 144
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 352
    Top = 144
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
end
