inherited frmCadastroUsuario: TfrmCadastroUsuario
  Caption = 'Cadastro de usu'#225'rio'
  ClientHeight = 146
  ClientWidth = 542
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 558
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
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
  object Label2: TLabel [1]
    Left = 8
    Top = 87
    Width = 64
    Height = 24
    Caption = 'Login:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 119
    Width = 71
    Height = 24
    Caption = 'Senha:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 193
    Top = 54
    Width = 133
    Height = 24
    Caption = 'Tipo usu'#225'rio:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Width = 542
    ExplicitWidth = 542
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
    Top = 54
    Width = 95
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edtLogin: TEdit
    Left = 93
    Top = 87
    Width = 440
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edtSenha: TEdit
    Left = 93
    Top = 119
    Width = 440
    Height = 21
    TabOrder = 3
  end
  object cboTpUsuario: TComboBox
    Left = 333
    Top = 54
    Width = 200
    Height = 21
    ItemIndex = 0
    TabOrder = 4
    Text = 'ADMINISTRADOR'
    Items.Strings = (
      'ADMINISTRADOR'
      'PADR'#195'O')
  end
  object SQLUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.banco
    Left = 344
  end
end
