inherited frmBaixaContasPagar: TfrmBaixaContasPagar
  Caption = 'Baixa de conta a pagar'
  ClientHeight = 233
  ClientWidth = 749
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitWidth = 755
  ExplicitHeight = 262
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 2
    Top = 47
    Width = 67
    Height = 24
    Caption = 'Conta:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [1]
    Left = 174
    Top = 47
    Width = 102
    Height = 24
    Caption = 'Pededido:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 2
    Top = 107
    Width = 136
    Height = 24
    Caption = 'Faturamento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 550
    Top = 47
    Width = 72
    Height = 24
    Caption = 'Status:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [4]
    Left = 303
    Top = 107
    Width = 125
    Height = 24
    Caption = 'Vencimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [5]
    Left = 2
    Top = 137
    Width = 124
    Height = 24
    Caption = 'Fornecedor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel [6]
    Left = 583
    Top = 107
    Width = 58
    Height = 24
    Caption = 'Paga:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [7]
    Left = 382
    Top = 47
    Width = 82
    Height = 24
    Caption = 'Parcela:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel [8]
    Left = 313
    Top = 201
    Width = 115
    Height = 24
    Caption = 'Acr'#233'scimo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel [9]
    Left = 0
    Top = 201
    Width = 82
    Height = 24
    Caption = 'Parcela:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel [10]
    Left = 582
    Top = 201
    Width = 59
    Height = 24
    Caption = 'Pago:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel [11]
    Left = 2
    Top = 77
    Width = 746
    Height = 24
    Caption = 
      'Data------------------------------------------------------------' +
      '----------------------------------------'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel [12]
    Left = 2
    Top = 171
    Width = 750
    Height = 24
    Caption = 
      'Valor-----------------------------------------------------------' +
      '-----------------------------------------'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Width = 749
    ExplicitWidth = 749
    inherited btSalvar: TSpeedButton
      OnClick = btSalvarClick
    end
    inherited btCancelar: TSpeedButton
      OnClick = btCancelarClick
    end
  end
  object edtCdConta: TEdit
    Left = 81
    Top = 47
    Width = 55
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edtCdPed: TEdit
    Left = 282
    Top = 47
    Width = 55
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object edtDtVencimento: TEdit
    Left = 434
    Top = 107
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object edtDtFaturamento: TEdit
    Left = 144
    Top = 107
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object cboStatus: TComboBox
    Left = 628
    Top = 49
    Width = 116
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object edtDtPaga: TEdit
    Left = 647
    Top = 107
    Width = 97
    Height = 21
    TabOrder = 1
    OnKeyPress = edtDtPagaKeyPress
  end
  object edtFornecedor: TEdit
    Left = 132
    Top = 138
    Width = 612
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object edtNrParc: TEdit
    Left = 470
    Top = 47
    Width = 74
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object edtVlParcela: TEdit
    Left = 88
    Top = 203
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object edtAcrescimo: TEdit
    Left = 434
    Top = 203
    Width = 97
    Height = 21
    TabOrder = 2
    OnChange = edtAcrescimoChange
  end
  object edtVlPago: TEdit
    Left = 647
    Top = 203
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 11
  end
end
