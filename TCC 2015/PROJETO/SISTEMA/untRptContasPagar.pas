unit untRptContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TfrmRptContasPagar = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCdFornecedor: TEdit;
    edtDsFornecedor: TEdit;
    cboStatus: TComboBox;
    edtDtInicial: TEdit;
    edtDtFinal: TEdit;
    Label4: TLabel;
    btLimpar: TSpeedButton;
    btPesquisar: TSpeedButton;
    btImprimir: TSpeedButton;
    btFornecedor: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    sdsContasPagar: TSQLDataSet;
    dspContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    dsContasPagar: TDataSource;
    cdsContasPagarCD_CONTA: TIntegerField;
    cdsContasPagarCD_PEDIDO: TIntegerField;
    cdsContasPagarDT_CONTA: TDateField;
    cdsContasPagarDT_VENCIMENTO: TDateField;
    cdsContasPagarDT_PAGA: TDateField;
    cdsContasPagarIN_STATUS: TStringField;
    cdsContasPagarNR_PARCELA: TIntegerField;
    cdsContasPagarVL_PARCELA: TFMTBCDField;
    cdsContasPagarVL_PAGO: TFMTBCDField;
    cdsContasPagarDS_FANTASIA: TStringField;
    SQLFornecedor: TSQLQuery;
    function formataMascaraData(var Key: char; Sender: TObject):string;
    procedure edtDtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDtFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtDtFinalExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCdFornecedorExit(Sender: TObject);
    procedure btFornecedorClick(Sender: TObject);
    procedure edtDtInicialExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmRptContasPagar: TfrmRptContasPagar;

implementation

{$R *.dfm}

uses untDm, untListagemFornecedor, untRelatorio;

procedure TfrmRptContasPagar.btFornecedorClick(Sender: TObject);
begin
  edtCdFornecedor.Clear;
  edtDsFornecedor.Clear;
  vOperacao := 1;
  frmListagemFornecedor.ShowModal;
end;

procedure TfrmRptContasPagar.btImprimirClick(Sender: TObject);
var
vPath : string;
begin
 if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    ShowMessage('Não foi realizado filtro para a impressão!');
    Exit;
  end;

  vPath := ExtractFilePath(Application.ExeName);
  frmRelatorio.frxContasPagar.LoadFromFile(vPath + 'rptContasPagar.fr3');
  frmRelatorio.frxContasPagar.ShowReport();
end;

procedure TfrmRptContasPagar.btLimparClick(Sender: TObject);
begin
  edtDtInicial.Clear;
  edtDtFinal.Clear;
  cboStatus.ItemIndex := 0;
  edtCdFornecedor.Clear;
  edtDsFornecedor.Clear;
end;

procedure TfrmRptContasPagar.btPesquisarClick(Sender: TObject);
var
vDsSQL : String;
begin
   if Trim(edtCdFornecedor.Text) <> '' then
   begin
      vDsSQL := ' and (P.CD_FORNECEDOR = :CD_FORNECEDOR) ';
  end;

  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    vDsSQL := vDsSQL + ' and (C.DT_VENCIMENTO between :DT_INICIAL and :DT_FINAL) ';
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
      vDsSQL := vDsSQL + 'and (C.IN_STATUS = :IN_STATUS) ';
  end;

  if(vDsSQL <> '') then
   begin
    vDsSQL := vDsSQL + 'inner join FORNECEDOR F on F.CD_FORNECEDOR = P.CD_FORNECEDOR';
    sdsContasPagar.CommandText := 'select * from CONTAS_PAGAR C inner join PEDIDO_COMPRA P on P.CD_PEDIDO = C.CD_PEDIDO ' + vDsSQL + ' order by  C.CD_PEDIDO, C.IN_STATUS';
   end
  else
  begin
   sdsContasPagar.CommandText := 'select distinct * from CONTAS_PAGAR C inner join PEDIDO_COMPRA P on P.CD_PEDIDO = C.CD_PEDIDO inner join FORNECEDOR F on F.CD_FORNECEDOR = P.CD_FORNECEDOR order by  C.CD_PEDIDO, C.IN_STATUS';
  end;

  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    sdsContasPagar.ParamByName('DT_INICIAL').AsDate := StrToDate(edtDtInicial.Text);
    sdsContasPagar.ParamByName('DT_FINAL').AsDate := StrToDate(edtDtFinal.Text);
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
    sdsContasPagar.ParamByName('IN_STATUS').Text := cboStatus.Text;
  end;

  if Trim(edtCdFornecedor.Text) <> '' then
  begin
    sdsContasPagar.ParamByName('CD_FORNECEDOR').AsInteger := StrToInt(edtCdFornecedor.Text);
  end;

  sdsContasPagar.ExecSQL();
  cdsContasPagar.Close;
  cdsContasPagar.Open;

end;

procedure TfrmRptContasPagar.edtCdFornecedorExit(Sender: TObject);
begin
  if trim(edtCdFornecedor.Text) <> '' then
  begin
     try
      SQLFornecedor.SQL.Text := 'select * from FORNECEDOR where CD_FORNECEDOR = ' + edtCdFornecedor.Text;
      SQLFornecedor.Open
     except
       ShowMessage('Fornecedor não encontrado!');
       edtCdFornecedor.SetFocus();
       exit;
     end;
     edtCdFornecedor.Text := SQLFornecedor.FieldByName('CD_FORNECEDOR').AsString;
     edtDsFornecedor.Text := SQLFornecedor.FieldByName('DS_FANTASIA').AsString;
  end;
end;

procedure TfrmRptContasPagar.edtDtFinalExit(Sender: TObject);
begin
  if Trim(edtDtFinal.Text) <> '' then
  begin
    try
      strtodate(edtDtFinal.Text);
    except
      showmessage('Data Inválida');
    end;

    if((StrToDate(edtDtFinal.Text)) < (StrToDate(edtDtInicial.Text))) then
    begin
       ShowMessage('Data final inválida!');
       edtDtFinal.Clear;
       edtDtFinal.SetFocus;
       exit;
    end;
  end;

  if(Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) = '') then
  begin
    edtDtFinal.Text := DateToStr(Date);
  end;
end;

procedure TfrmRptContasPagar.edtDtFinalKeyPress(Sender: TObject; var Key: Char);
begin
  formataMascaraData(key,sender);
end;

procedure TfrmRptContasPagar.edtDtInicialExit(Sender: TObject);
begin
  if Trim(edtDtFinal.Text) <> '' then
  begin
    try
      strtodate(edtDtInicial.Text);
    except
      showmessage('Data Inválida');
    end;
  end;
end;

procedure TfrmRptContasPagar.edtDtInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  formataMascaraData(key,sender);
end;

function TfrmRptContasPagar.formataMascaraData(var Key: char;
  Sender: TObject): string;
begin
 if not(key in['0'..'9',#8,#13]) then
    key := #0;
  if key <> #8 then
  begin
    if key <> #13 then
       if Length(TCustomEdit(sender).Text) = 10 then
          TCustomEdit(sender).Clear;
    case Length(TCustomEdit(sender).Text) of
      2:begin
        if not (key in ['0'..'9']) then key := #0;
          TCustomEdit(sender).Text     := TCustomEdit(sender).Text + '/';
        TCustomEdit(sender).selstart := Length(TCustomEdit(sender).text);
      end;
      5:begin
        if not (key in ['0'..'9']) then key := #0;
          TCustomEdit(sender).Text     := TCustomEdit(sender).Text + '/';
        TCustomEdit(sender).selstart := Length(TCustomEdit(sender).text);
      end;
      10:begin
        if key <> #13 then
        begin
          TCustomEdit(sender).Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmRptContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
cdsContasPagar.Close;
end;

procedure TfrmRptContasPagar.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = vk_f4 then
  begin
    btPesquisar.Click;
  end;

  if Key = vk_f2 then
  begin
    btLimpar.Click;
  end;
end;

procedure TfrmRptContasPagar.FormShow(Sender: TObject);
begin
  edtDtInicial.Clear;
  edtDtFinal.Clear;
  cboStatus.ItemIndex := 0;
  edtCdFornecedor.Clear;
  edtDsFornecedor.Clear;
  cdsContasPagar.Close;
end;

end.
