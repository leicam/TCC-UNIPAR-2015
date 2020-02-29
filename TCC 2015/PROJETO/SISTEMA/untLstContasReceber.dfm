inherited frmLstContasReceber: TfrmLstContasReceber
  BorderStyle = bsSizeToolWin
  Caption = 'Listagem de contas a receber'
  ClientHeight = 263
  ClientWidth = 780
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 796
  ExplicitHeight = 302
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited btAdicionar: TSpeedButton
      Enabled = False
    end
    inherited btRemover: TSpeedButton
      Enabled = False
    end
    inherited Label1: TLabel
      Left = 464
      ExplicitLeft = 464
    end
    inherited btAlterar: TSpeedButton
      Hint = 'Baixar fatura'
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btAlterarClick
    end
    inherited edtPesquisar: TEdit
      Left = 584
      Top = 11
      Height = 21
      ExplicitLeft = 584
      ExplicitTop = 11
      ExplicitHeight = 21
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 780
    Height = 222
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 778
      Height = 220
      Align = alClient
      DataSource = dsContasReceber
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
          FieldName = 'CD_CONTA'
          Title.Caption = 'Cd. conta'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_ORDSERV'
          Title.Caption = 'Cd. ord. servi'#231'o'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_CLIENTE'
          Title.Caption = 'Cd. cliente'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Nome cliente'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IN_STATUS'
          Title.Caption = 'Status'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TOTAL'
          Title.Caption = 'Vl. total'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TOTALRECEBIDO'
          Title.Caption = 'Vl. recebido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_CONTA'
          Title.Caption = 'Dt. conta'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_FINALIZADA'
          Title.Caption = 'Dt. finalizada'
          Width = 70
          Visible = True
        end>
    end
  end
  object dsContasReceber: TDataSource
    DataSet = dm.cdsContasReceber
    Left = 304
    Top = 96
  end
end
