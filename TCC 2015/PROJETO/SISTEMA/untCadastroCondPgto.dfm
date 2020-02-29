inherited frmCadastroCondPgto: TfrmCadastroCondPgto
  Caption = 'Cadastro de condi'#231#227'o de pagamento'
  ClientHeight = 118
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 700
  ExplicitHeight = 157
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 8
    Top = 53
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
  object Label1: TLabel [1]
    Left = 8
    Top = 85
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
  object Label2: TLabel [2]
    Left = 395
    Top = 53
    Width = 209
    Height = 24
    Caption = 'N'#250'mero de parcelas:'
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
    Left = 93
    Top = 55
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edtDescricao: TEdit
    Left = 122
    Top = 88
    Width = 554
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edtNrParcelas: TEdit
    Left = 610
    Top = 55
    Width = 66
    Height = 21
    TabOrder = 1
  end
end
