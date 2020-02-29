inherited frmCadastroCidade: TfrmCadastroCidade
  BorderStyle = bsToolWindow
  Caption = 'Cadastro de cidade'
  ClientHeight = 137
  ClientWidth = 568
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 574
  ExplicitHeight = 166
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 77
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
  object Label2: TLabel [1]
    Left = 8
    Top = 107
    Width = 34
    Height = 24
    Caption = 'UF:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 47
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
  inherited Panel1: TPanel
    Width = 568
    ExplicitWidth = 568
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
    Left = 122
    Top = 47
    Width = 71
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edtDescricao: TEdit
    Left = 122
    Top = 77
    Width = 431
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object cboUf: TComboBox
    Left = 122
    Top = 107
    Width = 71
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object dsCidade: TDataSource
    DataSet = dm.cdsCidade
    Left = 424
  end
end
