inherited frmCadastroCliente: TfrmCadastroCliente
  Left = 37
  Caption = 'Cadastro de cliente'
  ClientHeight = 478
  ClientWidth = 614
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 620
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 1
    Top = 47
    Width = 151
    Height = 24
    Caption = 'C'#243'digo cliente:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 1
    Top = 112
    Width = 157
    Height = 24
    Caption = 'Nome/Fantasia:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 1
    Top = 77
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
  object Label4: TLabel [3]
    Left = 1
    Top = 209
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
  object Label5: TLabel [4]
    Left = 1
    Top = 243
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
  object Label6: TLabel [5]
    Left = 389
    Top = 144
    Width = 75
    Height = 24
    Caption = 'RG/I.E.:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel [6]
    Left = 1
    Top = 144
    Width = 110
    Height = 24
    Caption = 'CPF/CNPJ:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [7]
    Left = 1
    Top = 273
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
  object Label9: TLabel [8]
    Left = 0
    Top = 305
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
  object Label10: TLabel [9]
    Left = 454
    Top = 243
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
  object Label11: TLabel [10]
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
  object Label12: TLabel [11]
    Left = 431
    Top = 47
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
  object Label13: TLabel [12]
    Left = 1
    Top = 338
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
  object btListaCid: TSpeedButton [13]
    Left = 576
    Top = 176
    Width = 33
    Height = 25
    Caption = '>>'
    OnClick = btListaCidClick
  end
  object Label14: TLabel [14]
    Left = 326
    Top = 77
    Width = 177
    Height = 24
    Caption = 'Data nascimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Width = 614
    ExplicitWidth = 614
    inherited btSalvar: TSpeedButton
      ParentShowHint = False
      OnClick = btSalvarClick
    end
    inherited btLimpar: TSpeedButton
      ParentShowHint = False
      OnClick = btLimparClick
    end
    inherited btCancelar: TSpeedButton
      ParentShowHint = False
      OnClick = btCancelarClick
    end
  end
  object edtCodigo: TEdit
    Left = 161
    Top = 48
    Width = 60
    Height = 21
    Enabled = False
    TabOrder = 12
  end
  object edtDtCadastro: TEdit
    Left = 158
    Top = 78
    Width = 97
    Height = 21
    Enabled = False
    MaxLength = 10
    TabOrder = 13
  end
  object edtNome: TEdit
    Left = 166
    Top = 112
    Width = 442
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = edtNomeKeyPress
  end
  object edtCpf: TEdit
    Left = 119
    Top = 145
    Width = 264
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = edtCpfExit
  end
  object edtCdCidade: TEdit
    Left = 88
    Top = 177
    Width = 40
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    OnExit = edtCdCidadeExit
    OnKeyPress = edtCdCidadeKeyPress
  end
  object edtDsCidade: TEdit
    Left = 133
    Top = 177
    Width = 382
    Height = 21
    Enabled = False
    TabOrder = 14
  end
  object edtTelefone: TEdit
    Left = 102
    Top = 305
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
    OnExit = edtTelefoneExit
  end
  object edtBairro: TEdit
    Left = 78
    Top = 243
    Width = 370
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
  end
  object edtEmail: TEdit
    Left = 79
    Top = 274
    Width = 528
    Height = 21
    TabOrder = 9
  end
  object edtCep: TEdit
    Left = 510
    Top = 243
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    OnExit = edtCepExit
  end
  object edtRg: TEdit
    Left = 467
    Top = 145
    Width = 141
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object cboStatus: TComboBox
    Left = 509
    Top = 50
    Width = 99
    Height = 21
    AutoComplete = False
    ItemIndex = 0
    TabOrder = 11
    Text = 'ATIVO'
    Items.Strings = (
      'ATIVO'
      'INATIVO')
  end
  object edtUf: TEdit
    Left = 521
    Top = 177
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 15
  end
  object edtEndereco: TEdit
    Left = 114
    Top = 209
    Width = 492
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object Panel2: TPanel
    Left = 0
    Top = 367
    Width = 614
    Height = 111
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 16
    object edtObservacao: TMemo
      Left = 1
      Top = 1
      Width = 612
      Height = 109
      Align = alClient
      Lines.Strings = (
        'edtObservacao')
      MaxLength = 150
      TabOrder = 0
    end
  end
  object edtDtNascimento: TEdit
    Left = 509
    Top = 78
    Width = 99
    Height = 21
    MaxLength = 10
    TabOrder = 1
    OnExit = edtDtNascimentoExit
    OnKeyPress = edtDtNascimentoKeyPress
  end
  object dsCliente: TDataSource
    DataSet = dm.cdsCliente
    Left = 432
    Top = 313
  end
  object SQLQueryCliente: TSQLQuery
    DataSource = dsCliente
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.banco
    Left = 504
    Top = 313
  end
end
