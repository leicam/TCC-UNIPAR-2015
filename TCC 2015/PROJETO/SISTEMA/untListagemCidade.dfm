inherited frmListagemCidade: TfrmListagemCidade
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem de cidade'
  ClientHeight = 366
  ClientWidth = 520
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 536
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 520
    ExplicitWidth = 520
    inherited btAdicionar: TSpeedButton
      OnClick = btAdicionarClick
    end
    inherited btRemover: TSpeedButton
      OnClick = btRemoverClick
    end
    inherited Label1: TLabel
      Left = 213
      Top = 12
      ExplicitLeft = 213
      ExplicitTop = 12
    end
    inherited btAlterar: TSpeedButton
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Left = 330
      Top = 12
      Width = 189
      OnChange = edtPesquisarChange
      ExplicitLeft = 330
      ExplicitTop = 12
      ExplicitWidth = 189
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 520
    Height = 325
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridCidade: TDBGrid
      Left = 1
      Top = 1
      Width = 518
      Height = 323
      Align = alClient
      DataSource = dsCidade
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridCidadeDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_CIDADE'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CIDADE'
          Title.Caption = 'Descri'#231#227'o'
          Width = 375
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF_CIDADE'
          Title.Caption = 'UF'
          Width = 60
          Visible = True
        end>
    end
  end
  object dsCidade: TDataSource
    DataSet = dm.cdsCidade
    Left = 296
    Top = 120
  end
end
