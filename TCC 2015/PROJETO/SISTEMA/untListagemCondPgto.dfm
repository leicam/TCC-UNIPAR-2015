inherited frmListagemCondPgto: TfrmListagemCondPgto
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem de condi'#231#227'o de pagamento'
  ClientHeight = 353
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 575
  ExplicitHeight = 392
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
      Height = 21
      OnChange = edtPesquisarChange
      ExplicitHeight = 21
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 559
    Height = 312
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 557
      Height = 310
      Align = alClient
      DataSource = dsCondPgto
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_CONDPGTO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CONDPGTO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCELAS'
          Title.Caption = 'N'#250'mero de parcelas'
          Visible = True
        end>
    end
  end
  object dsCondPgto: TDataSource
    DataSet = dm.cdsCondPgto
    Left = 360
    Top = 136
  end
end
