unit untRptPedCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Datasnap.Provider;

type
  TfrmRptPedCompra = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtDtInicial: TEdit;
    edtDtFinal: TEdit;
    Label4: TLabel;
    cboStatus: TComboBox;
    edtCdFornecedor: TEdit;
    edtDsFornecedor: TEdit;
    btFornecedor: TSpeedButton;
    SQLFornecedor: TSQLQuery;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsPedCompra: TDataSource;
    btPesquisar: TSpeedButton;
    sdsPedCompra: TSQLDataSet;
    dspPedCompra: TDataSetProvider;
    cdsPedCompra: TClientDataSet;
    cdsPedCompraCD_PEDIDO: TIntegerField;
    cdsPedCompraDT_PEDIDO: TDateField;
    cdsPedCompraIN_STATUS: TStringField;
    cdsPedCompraVL_BRUTO: TFMTBCDField;
    cdsPedCompraVL_DESCONTO: TFMTBCDField;
    cdsPedCompraVL_LIQUIDO: TFMTBCDField;
    cdsPedCompraDS_FANTASIA: TStringField;
    btImprimir: TSpeedButton;
    btLimpar: TSpeedButton;
    procedure edtCdFornecedorExit(Sender: TObject);
    procedure btFornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDtInicialExit(Sender: TObject);
    procedure edtDtFinalExit(Sender: TObject);
    function formataMascaraData(var Key: char; Sender: TObject):string;
    procedure edtDtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDtFinalKeyPress(Sender: TObject; var Key: Char);
    procedure btPesquisarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmRptPedCompra: TfrmRptPedCompra;

implementation

{$R *.dfm}

uses untDm, untListagemFornecedor, untRelatorio;

procedure TfrmRptPedCompra.btFornecedorClick(Sender: TObject);
begin
  edtCdFornecedor.Clear;
  edtDsFornecedor.Clear;
  vOperacao := 1;
  frmListagemFornecedor.ShowModal;
end;

procedure TfrmRptPedCompra.btImprimirClick(Sender: TObject);
var
vPath : String;
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    ShowMessage('Não foi realizado filtro para a impressão!');
    Exit;
  end;

  vPath := ExtractFilePath(Application.ExeName);
  frmRelatorio.frxPedCompra.LoadFromFile(vPath + 'rptPedCompra.fr3');
  frmRelatorio.frxPedCompra.ShowReport();
end;

procedure TfrmRptPedCompra.btLimparClick(Sender: TObject);
begin
edtDtInicial.Clear;
edtDtFinal.Clear;
cboStatus.ItemIndex := 0;
edtCdFornecedor.Clear;
edtDsFornecedor.Clear;
end;

procedure TfrmRptPedCompra.btPesquisarClick(Sender: TObject);
var
vDsSQL : String;
begin
  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    vDsSQL := ' (P.DT_PEDIDO between :DT_INICIAL and :DT_FINAL) ';
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
    if(trim(vDsSQL) <> '') then
     begin
      vDsSQL := vDsSQL + ' and (P.IN_STATUS = :IN_STATUS) ';
     end
    else
    begin
      vDsSQL := ' P.IN_STATUS = :IN_STATUS ';
    end;
  end;

  if Trim(edtCdFornecedor.Text) <> '' then
  begin
    if(trim(vDsSQL) <> '') then
     begin
      vDsSQL := vDsSQL + ' and (P.CD_FORNECEDOR = :CD_FORNECEDOR) ';
     end
    else
    begin
      vDsSQL := ' P.CD_FORNECEDOR = :CD_FORNECEDOR ';
    end;
  end;

  if(vDsSQL <> '') then
   begin
    sdsPedCompra.CommandText := 'select distinct * from PEDIDO_COMPRA P join FORNECEDOR F on ' + vDsSQL + ' order by P.IN_STATUS';
   end
  else
  begin
    sdsPedCompra.CommandText := 'select * from PEDIDO_COMPRA P inner join FORNECEDOR F on F.CD_FORNECEDOR = P.CD_FORNECEDOR order by P.IN_STATUS';
  end;

  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    sdsPedCompra.ParamByName('DT_INICIAL').AsDate := StrToDate(edtDtInicial.Text);
    sdsPedCompra.ParamByName('DT_FINAL').AsDate := StrToDate(edtDtFinal.Text);
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
    sdsPedCompra.ParamByName('IN_STATUS').Text := cboStatus.Text;
  end;

  if Trim(edtCdFornecedor.Text) <> '' then
  begin
    sdsPedCompra.ParamByName('CD_FORNECEDOR').AsInteger := StrToInt(edtCdFornecedor.Text);
  end;

  sdsPedCompra.ExecSQL();
  cdsPedCompra.Close;
  cdsPedCompra.Open;
end;

procedure TfrmRptPedCompra.edtCdFornecedorExit(Sender: TObject);
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

procedure TfrmRptPedCompra.edtDtFinalExit(Sender: TObject);
begin
  if Trim(edtDtFinal.Text) <> '' then
   begin
    if((StrToDate(edtDtFinal.Text)) > Date) then
      begin
       ShowMessage('Data final inválida!');
       edtDtFinal.Clear;
       edtDtFinal.SetFocus;
       exit;
      end
    else if((StrToDate(edtDtFinal.Text)) < (StrToDate(edtDtInicial.Text))) then
    begin
       ShowMessage('Data final inválida!');
       edtDtFinal.Clear;
       edtDtFinal.SetFocus;
       exit;
    end;
   end;

   if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) = '') then
   begin
       edtDtFinal.Text := DateToStr(Date);
   end;
end;

procedure TfrmRptPedCompra.edtDtFinalKeyPress(Sender: TObject; var Key: Char);
begin
  formataMascaraData(key,sender);
end;

procedure TfrmRptPedCompra.edtDtInicialExit(Sender: TObject);
begin
  if Trim(edtDtInicial.Text) <> '' then
  begin
    if((StrToDate(edtDtInicial.Text)) > Date) then
    begin
       ShowMessage('Data inicial inválida!');
       edtDtInicial.Clear;
       edtDtInicial.SetFocus;
       exit;
    end;
  end;
end;

procedure TfrmRptPedCompra.edtDtInicialKeyPress(Sender: TObject; var Key: Char);
begin
  formataMascaraData(key,sender);
end;

function TfrmRptPedCompra.formataMascaraData(var Key: char;
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

procedure TfrmRptPedCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm.cdsPedCompra.Close;
end;

procedure TfrmRptPedCompra.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmRptPedCompra.FormShow(Sender: TObject);
begin
  edtDtInicial.Clear;
  edtDtFinal.Clear;
  cboStatus.ItemIndex := 0;
  edtCdFornecedor.Clear;
  edtDsFornecedor.Clear;
  dm.cdsPedCompra.Close;
end;

end.
