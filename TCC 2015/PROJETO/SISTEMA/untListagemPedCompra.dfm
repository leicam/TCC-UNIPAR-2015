inherited frmListagemPedCompra: TfrmListagemPedCompra
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem pedido compra'
  ClientHeight = 356
  ClientWidth = 1005
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 1021
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1005
    ExplicitWidth = 1005
    inherited btAdicionar: TSpeedButton
      OnClick = btAdicionarClick
    end
    inherited btRemover: TSpeedButton
      Enabled = False
    end
    inherited Label1: TLabel
      Left = 577
      ExplicitLeft = 577
    end
    inherited btAlterar: TSpeedButton
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Left = 692
      OnChange = edtPesquisarChange
      ExplicitLeft = 692
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1005
    Height = 315
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1003
      Height = 313
      Align = alClient
      DataSource = dsPedCompra
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
          FieldName = 'CD_PEDIDO'
          Title.Caption = 'Cd. pedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_FORNECEDOR'
          Title.Caption = 'Cd. fornecedor'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_FANTASIA'
          Title.Caption = 'Nome fantasia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IN_STATUS'
          Title.Caption = 'Status'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_BRUTO'
          Title.Caption = 'Valor bruto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DESCONTO'
          Title.Caption = 'Valor desconto'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_LIQUIDO'
          Title.Caption = 'Valor liquido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_PEDIDO'
          Title.Caption = 'Data'
          Visible = True
        end>
    end
  end
  object dsPedCompra: TDataSource
    DataSet = dm.cdsPedCompra
    Left = 448
    Top = 128
  end
end
