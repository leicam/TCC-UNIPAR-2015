inherited frmCadastroServico: TfrmCadastroServico
  BorderStyle = bsSizeToolWin
  Caption = 'Cadastro de servi'#231'o'
  ClientHeight = 183
  ClientWidth = 566
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 582
  ExplicitHeight = 222
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 57
    Top = 54
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
    Left = 32
    Top = 84
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
    Left = 8
    Top = 114
    Width = 132
    Height = 24
    Caption = 'Tipo servi'#231'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 83
    Top = 144
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
    Width = 566
    ExplicitWidth = 566
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
    Left = 148
    Top = 57
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edtDescricao: TEdit
    Left = 146
    Top = 90
    Width = 405
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 148
    Top = 144
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object cboTpServ: TComboBox
    Left = 148
    Top = 117
    Width = 95
    Height = 21
    TabOrder = 4
    Items.Strings = (
      'METRO'
      'FIXO')
  end
end
