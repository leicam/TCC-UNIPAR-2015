inherited frmCadastroFornecedor: TfrmCadastroFornecedor
  Caption = 'Cadastro de fornecedor'
  ClientHeight = 470
  ClientWidth = 615
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 621
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 1
    Top = 240
    Width = 68
    Height = 24
    Caption = 'Bairro:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [1]
    Left = 451
    Top = 240
    Width = 50
    Height = 24
    Caption = 'CEP:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [2]
    Left = 1
    Top = 334
    Width = 130
    Height = 24
    Caption = 'Observa'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [3]
    Left = 1
    Top = 304
    Width = 92
    Height = 24
    Caption = 'Telefone:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [4]
    Left = 1
    Top = 271
    Width = 69
    Height = 24
    Caption = 'E-mail:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel [5]
    Left = 1
    Top = 208
    Width = 104
    Height = 24
    Caption = 'Endere'#231'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [6]
    Left = 1
    Top = 144
    Width = 62
    Height = 24
    Caption = 'CNPJ:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel [7]
    Left = 1
    Top = 79
    Width = 151
    Height = 24
    Caption = 'Nome fantasia:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel [8]
    Left = 1
    Top = 176
    Width = 77
    Height = 24
    Caption = 'Cidade:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel [9]
    Left = 310
    Top = 143
    Width = 191
    Height = 24
    Caption = 'Inscri'#231#227'o estadual:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel [10]
    Left = 1
    Top = 46
    Width = 79
    Height = 24
    Caption = 'C'#243'digo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [11]
    Left = 165
    Top = 46
    Width = 148
    Height = 24
    Caption = 'Data cadastro:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel [12]
    Left = 430
    Top = 46
    Width = 72
    Height = 24
    Caption = 'Status:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton [13]
    Left = 576
    Top = 175
    Width = 31
    Height = 24
    Caption = '>>'
    OnClick = SpeedButton1Click
  end
  object Label14: TLabel [14]
    Left = 1
    Top = 111
    Width = 135
    Height = 24
    Caption = 'Raz'#227'o social:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Width = 615
    ExplicitWidth = 615
    inherited btSalvar: TSpeedButton
      OnClick = btSalvarClick
    end
    inherited btLimpar: TSpeedButton
      OnClick = btLimparClick
    end
    inherited btCancelar: TSpeedButton
      OnClick = btCancelarClick
    end
  end
  object edtCodigo: TEdit
    Left = 86
    Top = 48
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object edtDtCadastro: TEdit
    Left = 319
    Top = 48
    Width = 105
    Height = 21
    Enabled = False
    TabOrder = 12
  end
  object edtFantasia: TEdit
    Left = 158
    Top = 82
    Width = 449
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnKeyPress = edtFantasiaKeyPress
  end
  object edtInsEstadual: TEdit
    Left = 507
    Top = 144
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    OnKeyPress = edtInsEstadualKeyPress
  end
  object edtCnpj: TEdit
    Left = 69
    Top = 144
    Width = 235
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = edtCnpjExit
  end
  object edtCdCidade: TEdit
    Left = 84
    Top = 177
    Width = 40
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    OnExit = edtCdCidadeExit
    OnKeyPress = edtCdCidadeKeyPress
  end
  object edtDsCidade: TEdit
    Left = 130
    Top = 177
    Width = 391
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object edtEndereco: TEdit
    Left = 111
    Top = 209
    Width = 496
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
    OnKeyPress = edtEnderecoKeyPress
  end
  object edtCep: TEdit
    Left = 507
    Top = 241
    Width = 100
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    OnExit = edtCepExit
  end
  object edtBairro: TEdit
    Left = 75
    Top = 241
    Width = 370
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edtEmail: TEdit
    Left = 76
    Top = 272
    Width = 531
    Height = 21
    TabOrder = 9
  end
  object edtTelefone: TEdit
    Left = 99
    Top = 307
    Width = 128
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
    OnExit = edtTelefoneExit
  end
  object cboStatus: TComboBox
    Left = 507
    Top = 48
    Width = 100
    Height = 21
    ItemIndex = 0
    TabOrder = 14
    Text = 'ATIVO'
    Items.Strings = (
      'ATIVO'
      'INATIVO')
  end
  object edtUf: TEdit
    Left = 527
    Top = 177
    Width = 43
    Height = 21
    Enabled = False
    TabOrder = 15
  end
  object Panel2: TPanel
    Left = 0
    Top = 360
    Width = 615
    Height = 110
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 16
    object edtObservacao: TMemo
      Left = 1
      Top = 1
      Width = 613
      Height = 108
      Align = alClient
      Lines.Strings = (
        'edtObservacao')
      TabOrder = 0
    end
  end
  object edtRazaoSocial: TEdit
    Left = 142
    Top = 112
    Width = 465
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = edtFantasiaKeyPress
  end
  object dsFornecedor: TDataSource
    DataSet = dm.cdsFornecedor
    Left = 400
    Top = 311
  end
  object SQLQueryFornecedor: TSQLQuery
    DataSource = dsFornecedor
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.banco
    Left = 496
    Top = 311
  end
end
