inherited frmListagemMaterial: TfrmListagemMaterial
  Caption = 'Listagem de material'
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 575
  ExplicitHeight = 273
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
      OnChange = edtPesquisarChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 559
    Height = 193
    Align = alClient
    DataSource = dsMaterial
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
        FieldName = 'CD_MATERIAL'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_MATERIAL'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UN_MATERIAL'
        Title.Caption = 'Unidade venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_MATERIAL'
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
  object dsMaterial: TDataSource
    DataSet = dm.cdsMaterial
    Left = 456
    Top = 152
  end
end
