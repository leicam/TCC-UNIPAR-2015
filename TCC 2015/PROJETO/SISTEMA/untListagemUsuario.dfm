inherited frmListagemUsuario: TfrmListagemUsuario
  BorderStyle = bsToolWindow
  Caption = 'Listagem de usu'#225'rio'
  ClientHeight = 384
  ClientWidth = 617
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 623
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 617
    ExplicitWidth = 617
    inherited btAdicionar: TSpeedButton
      OnClick = btAdicionarClick
    end
    inherited btRemover: TSpeedButton
      Enabled = False
    end
    inherited Label1: TLabel
      Left = 360
      Top = 6
      ExplicitLeft = 360
      ExplicitTop = 6
    end
    inherited btAlterar: TSpeedButton
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Left = 483
      Top = 6
      Height = 21
      OnChange = edtPesquisarChange
      ExplicitLeft = 483
      ExplicitTop = 6
      ExplicitHeight = 21
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 617
    Height = 343
    Align = alClient
    DataSource = dsUsuario
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = btAlterarClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_USUARIO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_LOGIN'
        Title.Caption = 'Login'
        Width = 420
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_USUARIO'
        Title.Caption = 'Libera'#231#227'o'
        Visible = True
      end>
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 256
    Top = 152
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 192
    Top = 152
  end
  object dspUsuario: TDataSetProvider
    DataSet = sdsUsuario
    Left = 128
    Top = 152
  end
  object sdsUsuario: TSQLDataSet
    CommandText = 'select * from USUARIO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.banco
    Left = 64
    Top = 152
  end
end
