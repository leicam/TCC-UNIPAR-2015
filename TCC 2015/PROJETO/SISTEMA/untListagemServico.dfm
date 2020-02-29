inherited frmListagemServico: TfrmListagemServico
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem de servi'#231'o'
  ClientWidth = 601
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 617
  ExplicitHeight = 273
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 601
    ExplicitWidth = 601
    inherited btAdicionar: TSpeedButton
      OnClick = btAdicionarClick
    end
    inherited btRemover: TSpeedButton
      OnClick = btRemoverClick
    end
    inherited btAlterar: TSpeedButton
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Height = 21
      OnChange = edtPesquisarChange
      ExplicitHeight = 21
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 601
    Height = 193
    Align = alClient
    DataSource = dsServico
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
        FieldName = 'CD_SERVICO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_SERVICO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UN_SERVICO'
        Title.Caption = 'Unidade venda'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_SERVICO'
        Title.Caption = 'Valor servi'#231'o'
        Visible = True
      end>
  end
  object dsServico: TDataSource
    DataSet = dm.cdsServico
    Left = 352
    Top = 160
  end
end
