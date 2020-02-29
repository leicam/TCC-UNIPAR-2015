inherited frmLstOrdServico: TfrmLstOrdServico
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem de ordem de servi'#231'o'
  ClientHeight = 280
  ClientWidth = 796
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 812
  ExplicitHeight = 319
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 796
    ExplicitWidth = 796
    inherited btAdicionar: TSpeedButton
      OnClick = btAdicionarClick
    end
    inherited Label1: TLabel
      Left = 538
      ExplicitLeft = 538
    end
    inherited btAlterar: TSpeedButton
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Left = 658
      OnChange = edtPesquisarChange
      ExplicitLeft = 658
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 796
    Height = 239
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 794
      Height = 237
      Align = alClient
      DataSource = dsOrdemServico
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = btAlterarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_ORDSERV'
          Title.Caption = 'Cd. ord. servi'#231'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_CLIENTE'
          Title.Caption = 'Cd. cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Cliente'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IN_STATUS'
          Title.Caption = 'Status'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BRUTO'
          Title.Caption = 'Vl. bruto'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESCONTO'
          Title.Caption = 'Vl. desconto'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_LIQUIDO'
          Title.Caption = 'Vl. liquido'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_CADASTRO'
          Title.Caption = 'Dt. cadastro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_PREVINI'
          Title.Caption = 'Dt. previs'#227'o inicio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_INICIO'
          Title.Caption = 'Dt. inicio'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_PREVFIM'
          Title.Caption = 'Dt. previs'#227'o fim'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_FIM'
          Title.Caption = 'Dt. fim'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IN_MTINCLUSO'
          Title.Caption = 'Material incluso'
          Width = 80
          Visible = True
        end>
    end
  end
  object dsOrdemServico: TDataSource
    DataSet = dm.cdsOrdemServico
    Left = 488
    Top = 112
  end
end
