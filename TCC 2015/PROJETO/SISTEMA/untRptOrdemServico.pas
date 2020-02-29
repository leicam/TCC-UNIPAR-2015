unit untRptOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmRptOrdemServico = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCdCliente: TEdit;
    cboStatus: TComboBox;
    edtDtInicial: TEdit;
    Label4: TLabel;
    edtDtFinal: TEdit;
    edtDsCliente: TEdit;
    btLimpar: TSpeedButton;
    btPesquisar: TSpeedButton;
    btImprimir: TSpeedButton;
    btFornecedor: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    SQLCliente: TSQLQuery;
    sdsOrdemServico: TSQLDataSet;
    dspOrdemServico: TDataSetProvider;
    cdsOrdemServico: TClientDataSet;
    dsOrdemServico: TDataSource;
    cdsOrdemServicoCD_ORDSERV: TIntegerField;
    cdsOrdemServicoDT_CADASTRO: TDateField;
    cdsOrdemServicoIN_STATUS: TStringField;
    cdsOrdemServicoDT_INICIO: TDateField;
    cdsOrdemServicoDT_PREVINI: TDateField;
    cdsOrdemServicoDT_PREVFIM: TDateField;
    cdsOrdemServicoVL_BRUTO: TFMTBCDField;
    cdsOrdemServicoVL_DESCONTO: TFMTBCDField;
    cdsOrdemServicoVL_LIQUIDO: TFMTBCDField;
    cdsOrdemServicoCD_CLIENTE: TIntegerField;
    cdsOrdemServicoIN_MTINCLUSO: TStringField;
    cdsOrdemServicoDT_FIM: TDateField;
    cdsOrdemServicoDS_NOME: TStringField;
    cdsOrdemServicoDS_ENDERECO: TStringField;
    function formataMascaraData(var Key: char; Sender: TObject):string;
    procedure btLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtDtFinalExit(Sender: TObject);
    procedure edtCdClienteExit(Sender: TObject);
    procedure btFornecedorClick(Sender: TObject);
    procedure edtDtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDtFinalKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmRptOrdemServico: TfrmRptOrdemServico;

implementation

{$R *.dfm}

uses untDm, untListagemCliente, untRelatorio;

procedure TfrmRptOrdemServico.btFornecedorClick(Sender: TObject);
begin
  edtCdCliente.Clear;
  edtDsCliente.Clear;
  vOperacao := 1;
  frmListagemCliente.ShowModal;
end;

procedure TfrmRptOrdemServico.btImprimirClick(Sender: TObject);
var
vPath : String;
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    ShowMessage('Não foi realizado filtro para a impressão!');
    Exit;
  end;

  vPath := ExtractFilePath(Application.ExeName);
  frmRelatorio.frxOrdemServico.LoadFromFile(vPath + 'rptOrdemServico.fr3');
  frmRelatorio.frxOrdemServico.ShowReport();
end;

procedure TfrmRptOrdemServico.btLimparClick(Sender: TObject);
begin
  edtDtInicial.Clear;
  edtDtInicial.Clear;
  edtCdCliente.Clear;
  edtDsCliente.Clear;
  cboStatus.ItemIndex := 0;
end;

procedure TfrmRptOrdemServico.btPesquisarClick(Sender: TObject);
var
vDsSQL : string;
begin
  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    vDsSQL := ' (C.CD_CLIENTE = O.CD_CLIENTE) and (O.DT_PREVINI between :DT_INICIAL and :DT_FINAL) ';
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
    if(trim(vDsSQL) <> '') then
     begin
      vDsSQL := vDsSQL + ' and (O.IN_STATUS = :IN_STATUS) ';
     end
    else
    begin
      vDsSQL := ' (C.CD_CLIENTE = O.CD_CLIENTE) and (O.IN_STATUS = :IN_STATUS) ';
    end;
  end;

  if Trim(edtCdCliente.Text) <> '' then
  begin
    if(trim(vDsSQL) <> '') then
     begin
      vDsSQL := vDsSQL + ' and (O.CD_CLIENTE = :CD_CLIENTE) ';
     end
    else
    begin
      vDsSQL := ' (C.CD_CLIENTE = O.CD_CLIENTE) and O.CD_CLIENTE = :CD_CLIENTE ';
    end;
  end;

  if(vDsSQL <> '') then
   begin
    sdsOrdemServico.CommandText := 'select distinct * from ORDEM_SERVICO O inner join CLIENTE C on ' + vDsSQL + ' order by O.CD_ORDSERV, O.IN_STATUS';
   end
  else
  begin
    sdsOrdemServico.CommandText := 'select * from ORDEM_SERVICO O inner join CLIENTE C on C.CD_CLIENTE = O.CD_CLIENTE order by O.CD_ORDSERV, O.IN_STATUS';
  end;

  if (Trim(edtDtInicial.Text) <> '') and (Trim(edtDtFinal.Text) <> '') then
  begin
    sdsOrdemServico.ParamByName('DT_INICIAL').AsDate := StrToDate(edtDtInicial.Text);
    sdsOrdemServico.ParamByName('DT_FINAL').AsDate := StrToDate(edtDtFinal.Text);
  end;

  if Trim(cboStatus.Text) <> '' then
  begin
    sdsOrdemServico.ParamByName('IN_STATUS').Text := cboStatus.Text;
  end;

  if Trim(edtCdCliente.Text) <> '' then
  begin
    sdsOrdemServico.ParamByName('CD_CLIENTE').AsInteger := StrToInt(edtCdCliente.Text);
  end;

  sdsOrdemServico.ExecSQL();
  cdsOrdemServico.Close;
  cdsOrdemServico.Open;
end;

procedure TfrmRptOrdemServico.edtCdClienteExit(Sender: TObject);
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

procedure TfrmRptOrdemServico.edtDtFinalExit(Sender: TObject);
begin
  if Trim(edtDtFinal.Text) <> '' then
  begin
    try
      if((StrToDate(edtDtFinal.Text)) < (StrToDate(edtDtInicial.Text))) then
      begin
       ShowMessage('Data final inválida!');
       edtDtFinal.Clear;
       edtDtFinal.SetFocus;
       exit;
      end;
    except
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

procedure TfrmRptOrdemServico.edtDtFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  formataMascaraData(key,sender);
end;

procedure TfrmRptOrdemServico.edtDtInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  formataMascaraData(key,sender);
end;

function TfrmRptOrdemServico.formataMascaraData(var Key: char;
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

procedure TfrmRptOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsOrdemServico.Close;
end;

procedure TfrmRptOrdemServico.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmRptOrdemServico.FormShow(Sender: TObject);
begin
  edtDtInicial.Clear;
  edtDtInicial.Clear;
  edtCdCliente.Clear;
  edtDsCliente.Clear;
  cboStatus.ItemIndex := 0;
  cdsOrdemServico.Close;
end;

end.
