inherited frmCadastroMaterial: TfrmCadastroMaterial
  Caption = 'Cadastro de material'
  ClientHeight = 146
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 700
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 0
    Top = 50
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
  object Label11: TLabel [1]
    Left = 0
    Top = 81
    Width = 108
    Height = 24
    Caption = 'Descri'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 405
    Top = 50
    Width = 120
    Height = 24
    Caption = 'Tipo venda:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [3]
    Left = 0
    Top = 113
    Width = 57
    Height = 24
    Caption = 'Valor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
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
    Left = 85
    Top = 51
    Width = 88
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edtDescricao: TEdit
    Left = 114
    Top = 83
    Width = 566
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object cboUnidade: TComboBox
    Left = 531
    Top = 51
    Width = 149
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Items.Strings = (
      'METRO'
      'UNIDADE')
  end
  object edtValor: TEdit
    Left = 63
    Top = 115
    Width = 88
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object dsCidade: TDataSource
    DataSet = dm.cdsMaterial
    Left = 480
    Top = 104
  end
end
