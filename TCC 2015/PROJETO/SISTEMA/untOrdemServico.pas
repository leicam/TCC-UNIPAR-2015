unit untOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrmOrdemServico = class(TfrmCadastro)
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtCodigo: TEdit;
    cboStatus: TComboBox;
    edtDtCadastro: TEdit;
    edtDtFinalizada: TEdit;
    edtDtPrevFim: TEdit;
    edtCdCliente: TEdit;
    edtDsCliente: TEdit;
    edtCdMaterial: TEdit;
    edtDsMaterial: TEdit;
    edtQuantMaterial: TEdit;
    dbgMaterial: TDBGrid;
    edtCdServico: TEdit;
    edtDsServico: TEdit;
    edtQuantServico: TEdit;
    btRemovMaterial: TSpeedButton;
    btRemovServico: TSpeedButton;
    dbgServico: TDBGrid;
    btCliente: TSpeedButton;
    btMaterial: TSpeedButton;
    btServico: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtDesconto: TEdit;
    edtVlBruto: TEdit;
    edtVlLiquido: TEdit;
    Label14: TLabel;
    cboMatIncluso: TComboBox;
    SQLOrdemServico: TSQLQuery;
    Label15: TLabel;
    edtDtPrevIni: TEdit;
    edtVlMaterial: TEdit;
    dsMaterialOrdServico: TDataSource;
    edtVlServico: TEdit;
    dsServicoOrdServico: TDataSource;
    btAprovaOrcamento: TSpeedButton;
    Label16: TLabel;
    edtDtinicializada: TEdit;
    btInicializaOrdServ: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label6: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    btExtorno: TSpeedButton;
    Label19: TLabel;
    Label24: TLabel;
    edtVlTotMaterial: TEdit;
    edtVlTotServico: TEdit;
    btFinalizaOrdServ: TSpeedButton;
    btImprimir: TSpeedButton;
    SQLImprimir: TSQLQuery;
    procedure FormShow(Sender: TObject);
    procedure edtDtPrevFimKeyPress(Sender: TObject; var Key: Char);
    function formataMascaraData(var Key: char; Sender: TObject):string;
    procedure btSalvarClick(Sender: TObject);
    procedure btClienteClick(Sender: TObject);
    procedure edtCdClienteExit(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btMaterialClick(Sender: TObject);
    procedure btServicoClick(Sender: TObject);
    procedure edtCdMaterialExit(Sender: TObject);
    procedure edtQuantMaterialExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCdServicoExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edtQuantServicoExit(Sender: TObject);
    procedure btRemovMaterialClick(Sender: TObject);
    procedure btRemovServicoClick(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure cboMatInclusoChange(Sender: TObject);
    procedure btAprovaOrcamentoClick(Sender: TObject);
    procedure btInicializaOrdServClick(Sender: TObject);
    procedure edtDtPrevIniExit(Sender: TObject);
    procedure edtDtPrevFimExit(Sender: TObject);
    procedure btExtornoClick(Sender: TObject);
    procedure btFinalizaOrdServClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmOrdemServico: TfrmOrdemServico;

implementation

{$R *.dfm}

uses untPrincipal, untDm, untListagemCliente, untListagemMaterial,
  untListagemServico, untListagemOrdServico, untRelatorio;

procedure TfrmOrdemServico.btAprovaOrcamentoClick(Sender: TObject);
var
vCdOrdServ : String;
begin
  inherited;
  if dbgServico.DataSource.DataSet.IsEmpty then
  begin
    ShowMessage('Ordem de serviço, não possui item(ns) de serviço!');
    Exit;
  end;

  try
    vCdOrdServ := edtCodigo.Text;
    dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  IN_STATUS = :IN_STATUS where CD_ORDSERV = :CD_ORDSERV';
    dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(vCdOrdServ);
    dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'APROVADA';
    dm.sdsComandosSQL.ExecSQL();
    cboStatus.Text := 'APROVADA';
    btAprovaOrcamento.Enabled := False;
  except
    ShowMessage('Ocorreu um erro de processo!');
  end;

  ShowMessage('Ordem de serviço aprovada com sucesso!');
end;

procedure TfrmOrdemServico.btCancelarClick(Sender: TObject);
begin
 inherited;
  frmOrdemServico.Close;
end;

procedure TfrmOrdemServico.btClienteClick(Sender: TObject);
begin
  inherited;
  edtCdCliente.Clear;
  edtDsCliente.Clear;
  vOperacao := 1;
  frmListagemCliente.ShowModal;
end;

procedure TfrmOrdemServico.btExtornoClick(Sender: TObject);
var
vCdOrdServ : string;
begin
  inherited;
  if(trim(cboStatus.Text) = 'ORÇAMENTO') or (Trim(cboStatus.Text) = 'INICIADA') or (Trim(cboStatus.Text) = 'FINALIZADA') then
  begin
      ShowMessage('Status da ordem de serviço não pode ser alterada!');
      Exit;
  end;

  if application.messagebox('Deseja realmente retornar status anterior?', 'Retornar status',mb_yesno+mb_defbutton2)<>idno then
  begin
    try
      if(trim(cboStatus.Text) = 'APROVADA') then
      begin
        vCdOrdServ := edtCodigo.Text;
        dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  IN_STATUS = :IN_STATUS where CD_ORDSERV = :CD_ORDSERV';
        dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(vCdOrdServ);
        dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'ORÇAMENTO';
        dm.sdsComandosSQL.ExecSQL();
        cboMatIncluso.Text := 'ORÇAMENTO';
        btAprovaOrcamento.Enabled := False;
      end
    except
      ShowMessage('Ocorreu um erro de processo!');
    end;
  end;
end;

procedure TfrmOrdemServico.btImprimirClick(Sender: TObject);
var
vPath : String;
begin
  if Trim(edtCodigo.Text) = '' then
  begin
      ShowMessage('Ordem de serviço não cadastrada!');
      Exit;
  end;

  vPath := ExtractFilePath(Application.ExeName);
  frmRelatorio.frxOrdemServico2.LoadFromFile(vPath + 'rptOrdemServico2.fr3');
  frmRelatorio.frxOrdemServico2.ShowReport();

end;

procedure TfrmOrdemServico.btInicializaOrdServClick(Sender: TObject);
begin
  inherited;
  if trim(cboStatus.Text) <> 'APROVADA' then
  begin
   ShowMessage('Status não permite a execução deste processo!');
   Exit;
  end;

  if application.messagebox('Deseja realmente iniciar ordem de serviço, e gerar contas a receber?','Inicia ordem de serviço',mb_yesno+mb_defbutton2)<>idno then
  begin
    try
      SQLOrdemServico.SQL.Text := 'select * from CONTAS_RECEBER where CD_ORDSERV = ' + edtCodigo.Text;
      SQLOrdemServico.Open;
      if  SQLOrdemServico.FieldByName('CD_ORDSERV').Value = null then
      begin
        dm.sdsComandosSQL.CommandText := 'insert into CONTAS_RECEBER values(GEN_ID(GEN_CONTAS_RECEBER_ID,1), :CD_ORDSERV, :DT_CONTA, :IN_STATUS, :VL_TOTAL, null, :VL_TOTALRECEBIDO)';
        dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
        dm.sdsComandosSQL.ParamByName('DT_CONTA').AsDate := Date;
        dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'EM ABERTO';
        dm.sdsComandosSQL.ParamByName('VL_TOTAL').AsFloat := StrToFloat(edtVlLiquido.Text);
        dm.sdsComandosSQL.ParamByName('VL_TOTALRECEBIDO').Text := '0';
        dm.sdsComandosSQL.ExecSQL();

        dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  IN_STATUS = :IN_STATUS, DT_INICIO = :DT_INICIO where CD_ORDSERV = :CD_ORDSERV';
        dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
        dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'INICIADA';
        dm.sdsComandosSQL.ParamByName('DT_INICIO').AsDate := Date;
        dm.sdsComandosSQL.ExecSQL();
        dm.cdsOrdemServico.Close;
        dm.cdsOrdemServico.Open;
        cboStatus.Text := 'INICIADA';
        edtDtinicializada.Text := DateToStr(Date);
      end;
    except
     ShowMessage('Ocorreu um erro de processo!');
     Exit;
    end;
  end;
end;

procedure TfrmOrdemServico.btLimparClick(Sender: TObject);
begin
  inherited;
    edtCodigo.Clear;
    edtDtCadastro.Text := DateToStr(Date);
    cboStatus.Text := 'ORÇAMENTO';
    edtCdCliente.Clear;
    edtDsCliente.Clear;
    edtCdMaterial.Clear;
    edtCdMaterial.Enabled := False;
    edtDsMaterial.Clear;
    edtQuantMaterial.Clear;
    edtQuantMaterial.Enabled := False;
    cboMatIncluso.Text := 'NÃO';
    cboMatIncluso.Enabled := False;
    edtCdServico.Clear;
    edtCdServico.Enabled := False;
    edtDsServico.Clear;
    edtQuantServico.Clear;
    edtQuantServico.Enabled := False;
    edtVlMaterial.Clear;
    edtVlBruto.Clear;
    edtVlLiquido.Clear;
    edtDesconto.Clear;
    edtDesconto.Enabled := False;
    btSalvar.Enabled := True;
    btMaterial.Enabled := False;
    btServico.Enabled := False;
    edtDtPrevFim.Clear;
    edtDtPrevIni.Clear;
    edtDtPrevIni.SetFocus();
end;

procedure TfrmOrdemServico.btMaterialClick(Sender: TObject);
begin
  inherited;
  edtCdMaterial.Clear;
  edtDsMaterial.Clear;
  vOperacao := 1;
  frmListagemMaterial.ShowModal;
end;

procedure TfrmOrdemServico.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtDtPrevIni.Text)='' then
  begin
    ShowMessage('Data prevista de inicio obrigatória!');
    edtDtPrevIni.SetFocus;
    exit;
  end;
  if trim(edtDtPrevFim.Text)='' then
  begin
    ShowMessage('Data prevista de finalização obrigatória!');
    edtDtPrevFim.SetFocus;
    exit;
  end;

  if StrToDate(edtDtPrevIni.Text) > StrToDate(edtDtPrevFim.Text) then
  begin
    ShowMessage('Data de previsão de finalização não pode ser menor que a data de previsão de inicio!');
    edtDtPrevIni.Clear;
    edtDtPrevFim.Clear;
    edtDtPrevIni.SetFocus;
    Exit;
  end;

  if trim(edtDtPrevIni.Text).Length < 9 then
  begin
    ShowMessage('Data informada invalida!');
    edtDtPrevIni.Clear;
    edtDtPrevIni.SetFocus;
    Exit;
  end;

  if trim(edtDtPrevIni.Text).Length < 9 then
  begin
    ShowMessage('Data informada invalida!');
    edtDtPrevFim.Clear;
    edtDtPrevIni.SetFocus;
    Exit;
  end;

  if trim(edtCdCliente.Text)='' then
  begin
    ShowMessage('Cliente não informado!');
    edtCdCliente.SetFocus;
    exit;
  end;

  if (frmPrincipal.vOperacao = 1) or (frmLstOrdServico.vOperacao = 1)then
  begin
    try
      SQLOrdemServico.SQL.Text := 'SELECT GEN_ID(GEN_ORDEM_SERVICO_ID, 1) CD_ORDSERV FROM RDB$DATABASE';
      SQLOrdemServico.Open;
      edtCodigo.Text := IntToStr(SQLOrdemServico.FieldByName('CD_ORDSERV').AsInteger);
      SQLOrdemServico.Close;

      dm.sdsComandosSQL.CommandText := 'insert into ORDEM_SERVICO values(:CD_ORDSERV, :DT_CADASTRO, :IN_STATUS, null, :DT_PREVINI, :DT_PREVFIM, :VL_BRUTO, :VL_DESCONTO, :VL_LIQUIDO, :CD_CLIENTE, :IN_MTINCLUSO, null)';
      dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('DT_CADASTRO').AsDate := StrToDate(edtDtCadastro.Text);
      //dm.sdsComandosSQL.ParamByName('DT_INICIO').AsDate := null;
      dm.sdsComandosSQL.ParamByName('DT_PREVINI').AsDate := StrToDate(edtDtPrevIni.Text);
      dm.sdsComandosSQL.ParamByName('DT_PREVFIM').AsDate := StrToDate(edtDtPrevFim.Text);
      dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := cboStatus.Text;
      dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := 0;
      dm.sdsComandosSQL.ParamByName('VL_DESCONTO').AsFloat := 0;
      dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := 0;
      dm.sdsComandosSQL.ParamByName('CD_CLIENTE').Text := edtCdCliente.Text;
      dm.sdsComandosSQL.ParamByName('IN_MTINCLUSO').Text := cboMatIncluso.Text;
      //dm.sdsComandosSQL.ParamByName('DT_FIM').AsDate := '';
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsPedCompra.Close;
      dm.cdsPedCompra.Open;

      edtVlTotMaterial.Text := '0';
      edtVlTotServico.Text := '0';
      edtDesconto.Text := '0';
      edtVlLiquido.Text := '0';
      edtCdCliente.Enabled := False;
      edtDtPrevIni.Enabled := False;
      edtDtPrevFim.Enabled := False;
      edtCdMaterial.Enabled := True;
      edtCdServico.Enabled := True;
      btMaterial.Enabled := True;
      btServico.Enabled := True;
      edtQuantMaterial.Enabled := True;
      edtQuantServico.Enabled := True;
      cboMatIncluso.Enabled := True;
      btSalvar.Enabled := False;
      btLimpar.Enabled := False;
      edtCdMaterial.SetFocus;
    except
      ShowMessage('Ocorreu um erro de processo');
      Exit;
    end;
  end;

  SQLImprimir.SQL.Text := 'select * from ORDEM_SERVICO O inner join CLIENTE C on C.CD_CLIENTE = O.CD_CLIENTE and O.CD_ORDSERV = ' + edtCodigo.Text;
  SQLImprimir.Open;

  ShowMessage('Ordem de serviço gravada com sucesso!');
end;

procedure TfrmOrdemServico.btServicoClick(Sender: TObject);
begin
  inherited;
  edtCdServico.Clear;
  edtDsServico.Clear;
  vOperacao := 1;
  frmListagemServico.ShowModal;
end;

procedure TfrmOrdemServico.cboMatInclusoChange(Sender: TObject);
var
vVlLiquido : Double;
begin
  inherited;
  if trim(cboMatIncluso.Text) = 'NÃO' then
  begin
      Try
        SQLOrdemServico.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTALSERVICO from SERVICO_ORDSERV where CD_ORDSERV =' + edtCodigo.Text;
        SQLOrdemServico.Open;
        edtVlBruto.Text := FloatToStr(SQLOrdemServico.FieldByName('VL_TOTALSERVICO').AsFloat);

        if StrToFloat(trim(edtVlBruto.Text)) = 0 then
          begin
           edtVlLiquido.Text := FloatToStr(0);
          end
        else
          begin
            vVlLiquido := StrToFloat(edtVlBruto.Text) - ((StrToFloat(edtDesconto.Text)) / 100) * StrToFloat(edtVlBruto.Text);
            edtVlLiquido.Text := FloatToStr(vVlLiquido);
            if StrToFloat(edtVlLiquido.Text) < 0 then
            begin
             ShowMessage('Porcentagem de desconto inválida!');
             edtDesconto.Clear;
             edtDesconto.SetFocus;
             exit;
            end;
        end;

        dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  VL_BRUTO = :VL_BRUTO, VL_DESCONTO = :VL_DESCONTO, VL_LIQUIDO = :VL_LIQUIDO, IN_MTINCLUSO = :IN_MTINCLUSO where CD_ORDSERV = :CD_ORDSERV';
        dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
        dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
        dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
        dm.sdsComandosSQL.ParamByName('VL_DESCONTO').AsFloat := StrToFloat(edtDesconto.Text);
        dm.sdsComandosSQL.ParamByName('IN_MTINCLUSO').Text := 'NÃO';
        dm.sdsComandosSQL.ExecSQL();
      except
        ShowMessage('Ocorreu um erro de processo!');
        Exit;
      End;
  end;

  if trim(cboMatIncluso.Text) = 'SIM' then
  begin
      Try
        SQLOrdemServico.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTAMATERIAL from ITEM_ORDSERV where CD_ORDSERV =' + edtCodigo.Text;
        SQLOrdemServico.Open;
        edtVlBruto.Text := FloatToStr(StrToFloat(edtVlBruto.Text) + SQLOrdemServico.FieldByName('VL_TOTAMATERIAL').AsFloat);
        edtVlLiquido.Text := FloatToStr(StrToFloat(edtVlLiquido.Text) + SQLOrdemServico.FieldByName('VL_TOTAMATERIAL').AsFloat);

        dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  VL_BRUTO = :VL_BRUTO, VL_LIQUIDO = :VL_LIQUIDO, IN_MTINCLUSO = :IN_MTINCLUSO where CD_ORDSERV = :CD_ORDSERV';
        dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
        dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
        dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
        dm.sdsComandosSQL.ParamByName('IN_MTINCLUSO').Text := 'SIM';
        dm.sdsComandosSQL.ExecSQL();
      except
        ShowMessage('Ocorreu um erro de processo!');
        Exit;
      End;
  end;
end;

procedure TfrmOrdemServico.edtCdClienteExit(Sender: TObject);
begin
  inherited;

  if trim(edtCdCliente.Text) <> '' then
  begin
     if StrToFloat(trim(edtCdCliente.Text)) < 0 then
      begin
        ShowMessage('Código informado inválido!');
        Exit;
      end;

     try
      SQLOrdemServico.SQL.Text := 'select * from CLIENTE where CD_CLIENTE = ' + edtCdCliente.Text;
      SQLOrdemServico.Open
     except
       ShowMessage('Clinte não encontrado!');
       edtCdCliente.SetFocus();
       exit;
     end;
     if SQLOrdemServico.FieldByName('CD_CLIENTE').IsNull then
     begin
      ShowMessage('Cliente não encontrado!');
      edtCdCliente.SetFocus;
      Exit;
     end;
     edtCdCliente.Text := SQLOrdemServico.FieldByName('CD_CLIENTE').AsString;
     edtDsCliente.Text := SQLOrdemServico.FieldByName('DS_NOME').AsString;
  end;
end;

procedure TfrmOrdemServico.edtCdMaterialExit(Sender: TObject);
begin
  inherited;
  if trim(edtCdMaterial.Text) <> '' then
  begin
     if StrToFloat(trim(edtCdMaterial.Text)) < 0 then
     begin
       ShowMessage('Código informado inválido!');
       Exit;
     end;

     try
      SQLOrdemServico.SQL.Text := 'select * from MATERIAL where CD_MATERIAL = ' + edtCdMaterial.Text;
      SQLOrdemServico.Open
     except
       ShowMessage('Material não encontrado!');
       edtCdMaterial.SetFocus();
       exit;
     end;
     edtCdMaterial.Text := SQLOrdemServico.FieldByName('CD_MATERIAL').AsString;
     edtDsMaterial.Text := SQLOrdemServico.FieldByName('DS_MATERIAL').AsString;
     edtVlMaterial.Text := SQLOrdemServico.FieldByName('VL_MATERIAL').AsString;
  end;
end;

procedure TfrmOrdemServico.edtCdServicoExit(Sender: TObject);
begin
  inherited;
  if trim(edtCdServico.Text) <> '' then
  begin
     if StrToFloat(trim(edtCdServico.Text)) < 0 then
     begin
      ShowMessage('Código informado inválido!');
      Exit;
     end;

     try
      SQLOrdemServico.SQL.Text := 'select * from SERVICO where CD_SERVICO = ' + edtCdServico.Text;
      SQLOrdemServico.Open
     except
       ShowMessage('Serviço não encontrado!');
       edtCdMaterial.SetFocus();
       exit;
     end;
     edtCdServico.Text := SQLOrdemServico.FieldByName('CD_SERVICO').AsString;
     edtDsServico.Text := SQLOrdemServico.FieldByName('DS_SERVICO').AsString;
     edtVlServico.Text := SQLOrdemServico.FieldByName('VL_SERVICO').AsString;
  end;
end;

procedure TfrmOrdemServico.edtDescontoExit(Sender: TObject);
var
vVlLiquido : Double;
begin
  inherited;
  if trim(edtDesconto.Text) = '' then
  begin
    Exit;
  end;

  if StrToFloat(trim(edtDesconto.Text)) < 0 then
  begin
    ShowMessage('Desconto informado inválido!');
    Exit;
  end;

  try
    vVlLiquido := StrToFloat(edtVlBruto.Text) - ((StrToFloat(edtDesconto.Text) / 100) * StrToFloat(edtVlBruto.Text));
    if vVlLiquido < 0 then
    begin
      ShowMessage('Porcentagem de desconto inválida!');
      edtDesconto.Clear;
      edtDesconto.SetFocus;
      exit;
    end;

    edtVlLiquido.Text := FloatToStr(vVlLiquido);
    dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  VL_BRUTO = :VL_BRUTO, VL_DESCONTO = :VL_DESCONTO, VL_LIQUIDO = :VL_LIQUIDO where CD_ORDSERV = :CD_ORDSERV';
    dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
    dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
    dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
    dm.sdsComandosSQL.ParamByName('VL_DESCONTO').AsFloat := StrToFloat(edtDesconto.Text);
    dm.sdsComandosSQL.ExecSQL();

    SQLOrdemServico.SQL.Text := 'select VL_LIQUIDO from ORDEM_SERVICO where CD_ORDSERV =' + edtCodigo.Text;
    SQLOrdemServico.Open;
    edtVlLiquido.Text := FloatToStr(SQLOrdemServico.FieldByName('VL_LIQUIDO').AsFloat);
    SQLOrdemServico.Close;
  except
    ShowMessage('Ocorreu um erro de processo!');
    Exit;
  end;
  edtDesconto.SetFocus;
end;

procedure TfrmOrdemServico.edtDtPrevFimExit(Sender: TObject);
begin
  inherited;
  if(Trim(edtDtPrevIni.Text) <> '') then
  begin
    if(StrToDate(edtDtPrevFim.Text) < Date) then
    begin
      ShowMessage('Data de previsão inválida!');
      edtDtPrevFim.Clear;
      edtDtPrevFim.SetFocus;
      exit;
    end;

    if(StrToDate(edtDtPrevFim.Text) < StrToDate(edtDtPrevIni.Text)) then
    begin
      ShowMessage('Data de previsão de fim, menor que data de previsão de inicio!');
      edtDtPrevFim.Clear;
      edtDtPrevFim.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmOrdemServico.edtDtPrevFimKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  formataMascaraData(key,sender);
end;

procedure TfrmOrdemServico.edtDtPrevIniExit(Sender: TObject);
begin
  inherited;
  if(Trim(edtDtPrevIni.Text) <> '') then
  begin
    if(StrToDate(edtDtPrevIni.Text) < Date) then
    begin
      ShowMessage('Data de previsão inválida!');
      edtDtPrevIni.Clear;
      edtDtPrevIni.SetFocus;
      exit;
    end;
  end;

end;

procedure TfrmOrdemServico.edtQuantMaterialExit(Sender: TObject);
var
vVlMaterial : Double;
vVlTotal : Double;
vVlLiquido : Double;
begin
  inherited;
  if trim(edtQuantMaterial.Text) <> '' then
  begin
    try
      if StrToFloat(trim(edtQuantMaterial.Text)) < 0 then
      begin
        ShowMessage('Quantidade informada inválida!');
        Exit;
      end;

      SQLOrdemServico.SQL.Text := 'select * from MATERIAL where CD_MATERIAL = ' + edtCdMaterial.Text;
      SQLOrdemServico.Open;
      vVlMaterial := StrToFloat(SQLOrdemServico.FieldByName('VL_MATERIAL').AsString);
      vVlTotal := vVlMaterial * StrToFloat(edtQuantMaterial.Text);

      dm.sdsComandosSQL.CommandText := 'insert into ITEM_ORDSERV values(:CD_ORDSERV, :CD_MATERIAL, :QT_ITEM, :VL_TOTAL, :VL_ITEM)';
      dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('CD_MATERIAL').AsInteger := StrToInt(edtCdMaterial.Text);
      dm.sdsComandosSQL.ParamByName('QT_ITEM').AsFloat := StrToFloat(edtQuantMaterial.Text);
      dm.sdsComandosSQL.ParamByName('VL_TOTAL').AsFloat := vVlTotal;
      dm.sdsComandosSQL.ParamByName('VL_ITEM').AsFloat := vVlMaterial;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsMaterialOrdServico.Close;
      dm.sdsMaterialOrdServico.ParamByName('CD_ORDSERV').Text := edtCodigo.Text;
      dm.cdsMaterialOrdServico.Open;
    except
     ShowMessage('Material já incluso na ordem de serviço!');
     Exit;
    end;
    edtQuantMaterial.Clear;
    edtCdMaterial.SetFocus;
    edtVlTotMaterial.Text := FloatToStr(vVlTotal);
  end;
end;

procedure TfrmOrdemServico.edtQuantServicoExit(Sender: TObject);
var
vVlServico : Double;
vVlTotal : Double;
vVlLiquido : Double;
begin
  inherited;
  if trim(edtQuantServico.Text) <> '' then
  begin
     if StrToFloat(trim(edtQuantServico.Text)) < 0 then
     begin
      ShowMessage('Quantidade informada inválida!');
      Exit;
    end;

    try
      SQLOrdemServico.SQL.Text := 'select * from SERVICO where CD_SERVICO = ' + edtCdServico.Text;
      SQLOrdemServico.Open;
      vVlServico := StrToFloat(SQLOrdemServico.FieldByName('VL_SERVICO').AsString);
      vVlTotal := vVlServico * StrToFloat(edtQuantServico.Text);

      dm.sdsComandosSQL.CommandText := 'insert into SERVICO_ORDSERV values(:CD_ORDSERV, :CD_SERVICO, :MT_SERVICO, :VL_TOTAL)';
      dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('CD_SERVICO').AsInteger := StrToInt(edtCdServico.Text);
      dm.sdsComandosSQL.ParamByName('MT_SERVICO').AsFloat := StrToFloat(edtQuantServico.Text);
      dm.sdsComandosSQL.ParamByName('VL_TOTAL').AsFloat := vVlTotal;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsServicoOrdServico.Close;
      dm.sdsServicoOrdServico.ParamByName('CD_ORDSERV').Text := edtCodigo.Text;
      dm.cdsServicoOrdServico.Open;

      try
        SQLOrdemServico.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTALSERVICO from SERVICO_ORDSERV where CD_ORDSERV =' + edtCodigo.Text;
        SQLOrdemServico.Open;
        edtVlBruto.Text := FloatToStr(SQLOrdemServico.FieldByName('VL_TOTALSERVICO').AsFloat);

        vVlLiquido := StrToFloat(edtVlBruto.Text) - ((StrToFloat(edtDesconto.Text)) / 100) * StrToFloat(edtVlBruto.Text);
        edtVlLiquido.Text := FloatToStr(vVlLiquido);
        if StrToFloat(edtVlLiquido.Text) < 0 then
        begin
          ShowMessage('Porcentagem de desconto inválida!');
          edtDesconto.Clear;
          edtDesconto.SetFocus;
          exit;
        end;

        if(trim(cboMatIncluso.Text) = 'SIM') then
        begin
          Try
            SQLOrdemServico.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTAMATERIAL from ITEM_ORDSERV where CD_ORDSERV =' + edtCodigo.Text;
            SQLOrdemServico.Open;
            edtVlBruto.Text := FloatToStr(StrToFloat(edtVlBruto.Text) + SQLOrdemServico.FieldByName('VL_TOTAMATERIAL').AsFloat);
            edtVlLiquido.Text := FloatToStr(StrToFloat(edtVlLiquido.Text) + SQLOrdemServico.FieldByName('VL_TOTAMATERIAL').AsFloat);

            dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  VL_BRUTO = :VL_BRUTO, VL_LIQUIDO = :VL_LIQUIDO where CD_ORDSERV = :CD_ORDSERV';
            dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
            dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
            dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
            dm.sdsComandosSQL.ExecSQL();
          except
            ShowMessage('Ocorreu um erro de processo!');
            Exit;
          End;
        end;

        dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  VL_BRUTO = :VL_BRUTO, VL_DESCONTO = :VL_DESCONTO, VL_LIQUIDO = :VL_LIQUIDO where CD_ORDSERV = :CD_ORDSERV';
        dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
        dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
        dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
        dm.sdsComandosSQL.ParamByName('VL_DESCONTO').AsFloat := StrToFloat(edtDesconto.Text);
        dm.sdsComandosSQL.ExecSQL();
      except
       ShowMessage('Ocorreu um erro de processo!');
       Exit;
      end;
    except
     ShowMessage('Serviço já incluso na ordem de serviço!');
     Exit;
    end;
    edtQuantServico.Clear;
    edtCdServico.SetFocus;
    edtVlTotServico.Text := FloatToStr(vVlTotal);
  end;
end;

procedure TfrmOrdemServico.btRemovMaterialClick(Sender: TObject);
var
vCdOrdServ : Integer;
vCdmaterial : Integer;
begin
  inherited;
  if application.messagebox('Deseja realmente remover material?','Remover',mb_yesno+mb_defbutton2)<>idno then
  begin
    try
      vCdOrdServ := StrToInt(trim(dbgMaterial.Columns[0].Field.Text));
      vCdMaterial := StrToInt(trim(dbgMaterial.Columns[1].Field.Text));
      dm.sdsComandosSQL.CommandText := 'delete from ITEM_ORDSERV where CD_MATERIAL = :CD_MATERIAL and CD_ORDSERV = :CD_ORDSERV';
      dm.sdsComandosSQL.ParamByName('CD_MATERIAL').AsInteger := vCdMaterial;
      dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := vCdOrdServ;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsMaterialOrdServico.Close;
      dm.sdsMaterialOrdServico.ParamByName('CD_ORDSERV').Text := edtCodigo.Text;
      dm.cdsMaterialOrdServico.Open;
    except
      ShowMessage('Ocorreu um erro de processo!');
      Exit;
    end;
  end;
end;

procedure TfrmOrdemServico.btRemovServicoClick(Sender: TObject);
var
vCdOrdServ : Integer;
vCdServico : Integer;
vVlLiquido : Double;
begin
  inherited;
  if application.messagebox('Deseja realmente remover serviço?','Remover',mb_yesno+mb_defbutton2)<>idno then
  begin
    try
      vCdOrdServ := StrToInt(trim(dbgServico.Columns[0].Field.Text));
      vCdServico := StrToInt(trim(dbgServico.Columns[1].Field.Text));
      dm.sdsComandosSQL.CommandText := 'delete from SERVICO_ORDSERV where CD_SERVICO = :CD_SERVICO and CD_ORDSERV = :CD_ORDSERV';
      dm.sdsComandosSQL.ParamByName('CD_SERVICO').AsInteger := vCdServico;
      dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := vCdOrdServ;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsServicoOrdServico.Close;
      dm.sdsServicoOrdServico.ParamByName('CD_ORDSERV').Text := edtCodigo.Text;
      dm.cdsServicoOrdServico.Open;

      SQLOrdemServico.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTALSERVICO from SERVICO_ORDSERV where CD_ORDSERV =' + edtCodigo.Text;
      SQLOrdemServico.Open;
      edtVlBruto.Text := FloatToStr(SQLOrdemServico.FieldByName('VL_TOTALSERVICO').AsFloat);

      vVlLiquido := StrToFloat(edtVlBruto.Text) - ((StrToFloat(edtDesconto.Text)) / 100) * StrToFloat(edtVlBruto.Text);
      edtVlLiquido.Text := FloatToStr(vVlLiquido);
      if StrToFloat(edtVlLiquido.Text) < 0 then
      begin
        ShowMessage('Porcentagem de desconto inválida!');
        edtDesconto.Clear;
        edtDesconto.SetFocus;
        exit;
      end;

      dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set  VL_BRUTO = :VL_BRUTO, VL_DESCONTO = :VL_DESCONTO, VL_LIQUIDO = :VL_LIQUIDO where CD_ORDSERV = :CD_ORDSERV';
      dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
      dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
      if Trim(edtDesconto.Text) <> '' then
      begin
        dm.sdsComandosSQL.ParamByName('VL_DESCONTO').AsFloat := StrToFloat(edtDesconto.Text);
      end;
      dm.sdsComandosSQL.ExecSQL();
    except
      ShowMessage('Ocorreu um erro de processo!');
      Exit;
    end;
  end;
end;

function TfrmOrdemServico.formataMascaraData(var Key: char;
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

procedure TfrmOrdemServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vOperacao := 0;
  dm.cdsOrdemServico.Close;
  dm.cdsMaterialOrdServico.Close;
  dm.cdsServicoOrdServico.Close;
  if (frmLstOrdServico.vOperacao = 1) or (frmLstOrdServico.vOperacao = 2) then
  begin
     dm.cdsOrdemServico.Open;
  end;
  SQLImprimir.Close;
end;

procedure TfrmOrdemServico.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
  begin
    btLimpar.Click;
  end;

  if Key = vk_f3 then
  begin
    btSalvar.Click;
  end;

  if Key = vk_f11 then
  begin
    btCancelar.Click;
  end;

  if Key = vk_f7 then
  begin
    btAprovaOrcamento.Click;
  end;

  if Key = vk_f9 then
  begin
    btInicializaOrdServ.Click;
  end;

  if Key = vk_f10 then
  begin
    btExtorno.Click;
  end;

  if Key = vk_f1 then
  begin
    btFinalizaOrdServ.Click;
  end;
end;

procedure TfrmOrdemServico.FormShow(Sender: TObject);
begin
  inherited;
  if(frmPrincipal.vOperacao = 1) or (frmLstOrdServico.vOperacao = 1) then
  begin
    edtCodigo.Clear;
    edtCdCliente.Clear;
    edtCdCliente.Enabled := True;
    edtDsCliente.Clear;
    edtCdMaterial.Clear;
    edtCdMaterial.Enabled := False;
    edtDtCadastro.Text := DateToStr(Date);
    cboStatus.Text := 'ORÇAMENTO';
    edtDsMaterial.Clear;
    edtQuantMaterial.Clear;
    edtQuantMaterial.Enabled := False;
    cboMatIncluso.Text := 'NÃO';
    cboMatIncluso.Enabled := False;
    edtCdServico.Clear;
    edtCdServico.Enabled := False;
    edtDsServico.Clear;
    edtQuantServico.Clear;
    edtQuantServico.Enabled := False;
    edtVlMaterial.Clear;
    edtVlBruto.Clear;
    edtVlLiquido.Clear;
    edtDesconto.Clear;
    edtDesconto.Enabled := False;
    btSalvar.Enabled := True;
    btLimpar.Enabled := True;
    btMaterial.Enabled := False;
    btServico.Enabled := False;
    edtDtPrevFim.Clear;
    edtDtPrevFim.Enabled := True;
    edtDtPrevIni.Clear;
    edtDtPrevIni.Enabled := True;
    edtDtinicializada.Clear;
    edtCdCliente.SetFocus();
  end
  else if frmLstOrdServico.vOperacao = 2 then
  begin
    edtCodigo.Text        := trim(dm.cdsOrdemServico.FieldByName('CD_ORDSERV').Text);
    edtDtCadastro.Text    := dm.cdsOrdemServico.FieldByName('DT_CADASTRO').Text;
    cboStatus.Text        := trim(dm.cdsOrdemServico.FieldByName('IN_STATUS').Text);
    edtDtPrevIni.Text     := dm.cdsOrdemServico.FieldByName('DT_PREVINI').Text;
    edtDtPrevFim.Text     := dm.cdsOrdemServico.FieldByName('DT_PREVFIM').Text;
    edtDtFinalizada.Text  := dm.cdsOrdemServico.FieldByName('DT_FIM').Text;
    edtDtinicializada.Text:= dm.cdsOrdemServico.FieldByName('DT_INICIO').Text;
    edtVlBruto.Text       := dm.cdsOrdemServico.FieldByName('VL_BRUTO').Text;
    edtDesconto.Text      := dm.cdsOrdemServico.FieldByName('VL_DESCONTO').Text;
    edtVlLiquido.Text     := dm.cdsOrdemServico.FieldByName('VL_LIQUIDO').Text;
    edtCdCliente.Text     := dm.cdsOrdemServico.FieldByName('CD_CLIENTE').Text;
    cboMatIncluso.Text    := dm.cdsOrdemServico.FieldByName('IN_MTINCLUSO').Text;

    SQLOrdemServico.SQL.Text := 'select * from CLIENTE where CD_CLIENTE = ' + edtCdCliente.Text;
    SQLOrdemServico.Open;
    edtDsCliente.Text := SQLOrdemServico.FieldByName('DS_NOME').Text;

    dm.cdsMaterialOrdServico.Close;
    dm.sdsMaterialOrdServico.ParamByName('CD_ORDSERV').Text := edtCodigo.Text;
    dm.cdsMaterialOrdServico.Open;

    SQLOrdemServico.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTMATERIAL from ITEM_ORDSERV where CD_ORDSERV = ' + edtCodigo.Text;
    SQLOrdemServico.Open;
    edtVlTotMaterial.Text := FloatToStr(SQLOrdemServico.FieldByName('VL_TOTMATERIAL').AsFloat);

    dm.cdsServicoOrdServico.Close;
    dm.sdsServicoOrdServico.ParamByName('CD_ORDSERV').Text := edtCodigo.Text;
    dm.cdsServicoOrdServico.Open;

    SQLOrdemServico.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTSERVICO from SERVICO_ORDSERV where CD_ORDSERV = ' + edtCodigo.Text;
    SQLOrdemServico.Open;
    edtVlTotServico.Text := FloatToStr(SQLOrdemServico.FieldByName('VL_TOTSERVICO').AsFloat);

    if(trim(cboStatus.Text) <> 'ORÇAMENTO') then
    begin
      edtDtPrevIni.Enabled := False;
      edtDtPrevFim.Enabled := False;
      edtCdCliente.Enabled := False;
      edtCdMaterial.Enabled := False;
      edtCdServico.Enabled := False;
      edtQuantMaterial.Enabled := False;
      edtQuantServico.Enabled := False;
      edtDesconto.Enabled := False;
      btCliente.Enabled := False;
      btMaterial.Enabled := False;
      cboMatIncluso.Enabled :=False;
      btServico.Enabled := False;
      btAprovaOrcamento.Enabled := False;
    end
    else
    begin
      edtDtPrevIni.Enabled := False;
      edtDtPrevFim.Enabled := False;
      edtCdCliente.Enabled := False;
      edtCdMaterial.Enabled := True;
      edtCdServico.Enabled := True;
      edtQuantMaterial.Enabled := True;
      edtQuantServico.Enabled := True;
      edtDesconto.Enabled := True;
      cboMatIncluso.Enabled := True;
      btCliente.Enabled := False;
      btMaterial.Enabled := True;
      btServico.Enabled := True;
      btAprovaOrcamento.Enabled := True;
      cboMatIncluso.Enabled := True;
    end;

    SQLImprimir.SQL.Text := 'select * from ORDEM_SERVICO O inner join CLIENTE C on O.CD_ORDSERV = ' + edtCodigo.Text + ' and C.CD_CLIENTE = O.CD_CLIENTE';
    SQLImprimir.Open;

    btSalvar.Enabled := False;
    btLimpar.Enabled := False;
  end;

  dm.cdsCliente.Open;
end;


procedure TfrmOrdemServico.btFinalizaOrdServClick(Sender: TObject);
begin
  inherited;
   try
      if Trim(edtDtFinalizada.Text) <> '' then
      begin
        ShowMessage('Ordem de serviço já está finalizada!');
        Exit;
      end;
      if Trim(cboStatus.Text) <> 'INICIADA' then
      begin
        ShowMessage('Ordem de serviço não foi iniciada!');
        Exit;
      end;

      dm.sdsComandosSQL.CommandText := 'update ORDEM_SERVICO set IN_STATUS = :IN_STATUS,  DT_FIM = :DT_FIM where CD_ORDSERV = :CD_ORDSERV';
      dm.sdsComandosSQL.ParamByName('DT_FIM').AsDate := Date;
      dm.sdsComandosSQL.ParamByName('CD_ORDSERV').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'FINALIZADA';
      dm.sdsComandosSQL.ExecSQL();

      cboStatus.Text := 'FINALIZADA';
   except
      showMessage('Ocorreu um erro de processo!');
   end;

   ShowMessage('Ordem de serviço finalizada com sucesso!');
   frmOrdemServico.Close;
end;

end.
