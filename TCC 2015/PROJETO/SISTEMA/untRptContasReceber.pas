unit untRptContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider;

type
  TfrmRptContasReceber = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCdCliente: TEdit;
    cboStatus: TComboBox;
    edtDtInicial: TEdit;
    Label4: TLabel;
    edtDtFinal: TEdit;
    btPesquisar: TSpeedButton;
    btImprimir: TSpeedButton;
    edtDsCliente: TEdit;
    btFornecedor: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    SQLCliente: TSQLQuery;
    sdsContasReceber: TSQLDataSet;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    cdsContasReceberCD_CONTA: TIntegerField;
    cdsContasReceberCD_ORDSERV: TIntegerField;
    cdsContasReceberDT_CONTA: TDateField;
    cdsContasReceberIN_STATUS: TStringField;
    cdsContasReceberVL_TOTAL: TFMTBCDField;
    cdsContasReceberDT_FINALIZADA: TDateField;
    cdsContasReceberVL_TOTALRECEBIDO: TFMTBCDField;
    dsContasReceber: TDataSource;
    cdsContasReceberCD_CLIENTE: TIntegerField;
    cdsContasReceberDS_NOME: TStringField;
    btLimpar: TSpeedButton;
    function formataMascaraData(var Key: char; Sender: TObject):string;
    procedure edtDtInicialExit(Sender: TObject);
    procedure edtDtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDtFinalExit(Sender: TObject);
    procedure edtDtFinalKeyPress(Sender: TObject; var Key: Char);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtCdClienteExit(Sender: TObject);
    procedure btFornecedorDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLimparClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btFornecedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmRptContasReceber: TfrmRptContasReceber;

implementation

{$R *.dfm}

uses untDm, untListagemCliente, untRelatorio;

procedure TfrmRptContasReceber.btFornecedorClick(Sender: TObject);
begin
  edtCdCliente.Clear;
  edtDsCliente.Clear;
  vOperacao := 1;
  frmListagemCliente.ShowModal;
end;

procedure TfrmRptContasReceber.btFornecedorDblClick(Sender: TObject);
begin
  edtCdCliente.Clear;
  edtDsCliente.Clear;
  vOperacao := 1;
  frmListagemCliente.ShowModal;
end;

procedure TfrmRptContasReceber.btImprimirClick(Sender: TObject);
var
vPath : String;
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    ShowMessage('Não foi realizado filtro para a impressão!');
    Exit;
  end;

  vPath := ExtractFilePath(Application.ExeName);
  frmRelatorio.frxContasReceber.LoadFromFile(vPath + 'rptContasReceber.fr3');
  frmRelatorio.frxContasReceber.ShowReport();
end;

procedure TfrmRptContasReceber.btLimparClick(Sender: TObject);
begin
  edtDtInicial.Clear;
  edtDtFinal.Clear;
  cboStatus.ItemIndex := 0;
  edtCdCliente.Clear;
  edtDsCliente.Clear;
end;

procedure TfrmRptContasReceber.btPesquisarClick(Sender: TObject);
var
vDsSQL : String;
begin
   if Trim(edtCdCliente.Text) <> '' then
   begin
      vDsSQL := ' and (S.CD_CLIENTE = :CD_CLIENTE) ';
  end;

  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    vDsSQL := vDsSQL + ' and (C.DT_CONTA between :DT_INICIAL and :DT_FINAL) ';
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
      vDsSQL := vDsSQL + 'and (C.IN_STATUS = :IN_STATUS) ';
  end;

  if(vDsSQL <> '') then
   begin
    vDsSQL := vDsSQL + 'inner join CLIENTE E on (S.CD_CLIENTE = E.CD_CLIENTE)';
    sdsContasReceber.CommandText := 'select distinct * from CONTAS_RECEBER C inner join ORDEM_SERVICO S on C.CD_ORDSERV = S.CD_ORDSERV ' + vDsSQL + ' order by C.IN_STATUS, C.CD_CONTA';
   end
  else
  begin
    sdsContasReceber.CommandText := 'select * from CONTAS_RECEBER C inner join ORDEM_SERVICO S on S.CD_ORDSERV = C.CD_ORDSERV inner join CLIENTE E on E.CD_CLIENTE = S.CD_CLIENTE order by C.IN_STATUS, C.CD_CONTA';
  end;

  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    sdsContasReceber.ParamByName('DT_INICIAL').AsDate := StrToDate(edtDtInicial.Text);
    sdsContasReceber.ParamByName('DT_FINAL').AsDate := StrToDate(edtDtFinal.Text);
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
    sdsContasReceber.ParamByName('IN_STATUS').Text := cboStatus.Text;
  end;

  if Trim(edtCdCliente.Text) <> '' then
  begin
    sdsContasReceber.ParamByName('CD_CLIENTE').AsInteger := StrToInt(edtCdCliente.Text);
  end;

  sdsContasReceber.ExecSQL();
  cdsContasReceber.Close;
  cdsContasReceber.Open;
end;

procedure TfrmRptContasReceber.edtCdClienteExit(Sender: TObject);
begin
 if trim(edtCdCliente.Text) <> '' then
  begin
     try
      SQLCliente.SQL.Text := 'select * from CLIENTE where CD_CLIENTE = ' + edtCdCliente.Text;
      SQLCliente.Open
     except
       ShowMessage('Cliente não encontrado!');
       edtCdCliente.SetFocus();
       exit;
     end;
     edtCdCliente.Text := SQLCliente.FieldByName('CD_CLIENTE').AsString;
     edtDsCliente.Text := SQLCliente.FieldByName('DS_NOME').AsString;
  end
  else
  begin
    edtDsCliente.Clear;
  end;
end;

procedure TfrmRptContasReceber.edtDtFinalExit(Sender: TObject);
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

procedure TfrmRptContasReceber.edtDtFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  formataMascaraData(key,sender);
end;

procedure TfrmRptContasReceber.edtDtInicialExit(Sender: TObject);
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

procedure TfrmRptContasReceber.edtDtInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  formataMascaraData(key,sender);
end;

function TfrmRptContasReceber.formataMascaraData(var Key: char;
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

procedure TfrmRptContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsContasReceber.Close;
end;

procedure TfrmRptContasReceber.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmRptContasReceber.FormShow(Sender: TObject);
begin
  edtDtInicial.Clear;
  edtDtFinal.Clear;
  cboStatus.ItemIndex := 0;
  edtCdCliente.Clear;
  edtDsCliente.Clear;
  cdsContasReceber.Close;
end;

end.
