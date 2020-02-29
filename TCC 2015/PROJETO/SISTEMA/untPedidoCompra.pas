unit untPedidoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrmPedidoCompra = class(TfrmCadastro)
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    edtDtPedCompra: TEdit;
    edtCdCondPgto: TEdit;
    edtDsCondPgto: TEdit;
    btCondPgto: TSpeedButton;
    btFornecedor: TSpeedButton;
    edtCdFornecedor: TEdit;
    edtDsFornecedor: TEdit;
    edtCdItem: TEdit;
    edtDsItem: TEdit;
    btItem: TSpeedButton;
    Label7: TLabel;
    edtQuantidade: TEdit;
    cboStatus: TComboBox;
    SQLCondPgto: TSQLQuery;
    dsPedCompra: TDataSource;
    dsItemCompra: TDataSource;
    dsFornecedor: TDataSource;
    dsCondPgto: TDataSource;
    dsMaterial: TDataSource;
    SQLMaterial: TSQLQuery;
    SQLFornecedor: TSQLQuery;
    edtNrParcelas: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtDesconto: TEdit;
    edtVlBruto: TEdit;
    edtVlLiquido: TEdit;
    SQLPedCompra: TSQLQuery;
    edtVlItem: TEdit;
    SQLItemCompra: TSQLQuery;
    btContagem: TSpeedButton;
    btRemover: TSpeedButton;
    btGeraContPagar: TSpeedButton;
    SQLContasPagar: TSQLQuery;
    dsContasPagar: TDataSource;
    edtUndItem: TEdit;
    btImprimir: TSpeedButton;
    SQLImprimir: TSQLQuery;
    procedure btFornecedorClick(Sender: TObject);
    procedure edtCdFornecedorExit(Sender: TObject);
    procedure edtCdCondPgtoExit(Sender: TObject);
    procedure edtCdItemExit(Sender: TObject);
    procedure btCondPgtoClick(Sender: TObject);
    procedure btItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescontoExit(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btContagemClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btGeraContPagarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmPedidoCompra: TfrmPedidoCompra;

implementation

{$R *.dfm}

uses untListagemFornecedor, untDm, untListagemCondPgto, untListagemMaterial,
  untListagemPedCompra, untPrincipal, untBaixaPedCompra, untRelatorio;

procedure TfrmPedidoCompra.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmPedidoCompra.Close;
end;

procedure TfrmPedidoCompra.btCondPgtoClick(Sender: TObject);
begin
  inherited;
  edtCdCondPgto.Clear;
  edtDsCondPgto.Clear;
  edtNrParcelas.Clear;
  vOperacao := 1;
  frmListagemCondPgto.ShowModal;
end;

procedure TfrmPedidoCompra.btFornecedorClick(Sender: TObject);
begin
  inherited;
  edtCdFornecedor.Clear;
  edtDsFornecedor.Clear;
  vOperacao := 1;
  frmListagemFornecedor.ShowModal;
end;

procedure TfrmPedidoCompra.btImprimirClick(Sender: TObject);
var
vPath : String;
begin
  if Trim(edtCodigo.Text) = '' then
  begin
      ShowMessage('Pedido não cadastrado!');
      Exit;
  end;

  vPath := ExtractFilePath(Application.ExeName);
  frmRelatorio.frxPedCompra2.LoadFromFile(vPath + 'rptPedCompra2.fr3');
  frmRelatorio.frxPedCompra2.ShowReport();
end;

procedure TfrmPedidoCompra.btItemClick(Sender: TObject);
begin
  inherited;
  edtCdItem.Clear;
  edtDsItem.Clear;
  vOperacao := 1;
  frmListagemMaterial.ShowModal;
end;

procedure TfrmPedidoCompra.btLimparClick(Sender: TObject);
begin
  inherited;
    edtCodigo.Clear;
    edtCdCondPgto.Clear;
    edtDtPedCompra.Text := DateToStr(Date);
    edtCdCondPgto.Clear;
    edtDsCondPgto.Clear;
    edtNrParcelas.Clear;
    edtCdFornecedor.Clear;
    edtDsFornecedor.Clear;
    edtCdItem.Clear;
    edtCdItem.Enabled := False;
    edtDsItem.Clear;
    edtVlItem.Clear;
    edtQuantidade.Clear;
    edtQuantidade.Enabled := False;
    btSalvar.Enabled := True;
    cboStatus.Text := 'EM ANDAMENTO';
    edtCdFornecedor.SetFocus();
end;

procedure TfrmPedidoCompra.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtCdFornecedor.Text)='' then
  begin
    ShowMessage('Fornecedor obrigatório!');
    edtCdFornecedor.SetFocus;
    exit;
  end;

  if trim(edtCdCondPgto.Text)='' then
  begin
    ShowMessage('Condição de pagamento obrigatória!');
    edtCdCondPgto.SetFocus;
    exit;
  end;

  if (frmPrincipal.vOperacao = 1) or (frmListagemPedCompra.vOperacao = 1) then
  begin
    SQLPedCompra.SQL.Text := 'SELECT GEN_ID(GEN_PEDCOMPRA_ID, 1) CD_PEDCOMPRA FROM RDB$DATABASE';
    SQLPedCompra.Open;
    edtCodigo.Text := IntToStr(SQLPedCompra.FieldByName('CD_PEDCOMPRA').AsInteger);
    SQLPedCompra.Close;

    dm.sdsComandosSQL.CommandText := 'insert into PEDIDO_COMPRA values(:CD_PEDCOMPRA, :DT_PEDIDO, :IN_STATUS, :VL_BRUTO, :VL_DESCONTO, :VL_LIQUIDO, :CD_CONDPGTO, :CD_FORNECEDOR)';
    dm.sdsComandosSQL.ParamByName('CD_PEDCOMPRA').AsInteger := StrToInt(edtCodigo.Text);
    dm.sdsComandosSQL.ParamByName('DT_PEDIDO').Text := edtDtPedCompra.Text;
    dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := cboStatus.Text;
    dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := 0;
    dm.sdsComandosSQL.ParamByName('VL_DESCONTO').AsFloat := 0;
    dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := 0;
    dm.sdsComandosSQL.ParamByName('CD_CONDPGTO').Text := edtCdCondPgto.Text;
    dm.sdsComandosSQL.ParamByName('CD_FORNECEDOR').Text := edtCdFornecedor.Text;
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsPedCompra.Close;
    dm.cdsPedCompra.Open;

    edtCdItem.Enabled := True;
    btItem.Enabled := True;
    edtQuantidade.Enabled := True;
    btSalvar.Enabled := False;
    edtCdItem.SetFocus;
  end;

  SQLImprimir.SQL.Text := 'select * from PEDIDO_COMPRA P inner join FORNECEDOR F on F.CD_FORNECEDOR = P.CD_FORNECEDOR and P.CD_PEDIDO = ' + edtCodigo.Text;
  SQLImprimir.Open;

  ShowMessage('Pedido salvo com sucesso!');
end;

procedure TfrmPedidoCompra.edtCdCondPgtoExit(Sender: TObject);
begin
  inherited;
  if trim(edtCdCondPgto.Text) <> '' then
  begin
   try
    SQLCondPgto.SQL.Text := 'select * from CONDICAO_PAGAMENTO where CD_CONDPGTO = ' + edtCdCondPgto.Text;
    SQLCondPgto.Open;
   except
    ShowMessage('Condição de pagamento não encontrada!');
    edtCdCondPgto.SetFocus();
    exit;
   end;
   edtCdCondPgto.Text := SQLCondPgto.FieldByName('CD_CONDPGTO').AsString;
   edtDsCondPgto.Text := SQLCondPgto.FieldByName('DS_CONDPGTO').AsString;
   edtNrParcelas.Text := SQLCondPgto.FieldByName('NR_PARCELAS').AsString;
  end;
end;

procedure TfrmPedidoCompra.edtCdFornecedorExit(Sender: TObject);
begin
  inherited;
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

procedure TfrmPedidoCompra.edtCdItemExit(Sender: TObject);
begin
  inherited;
  if trim(edtCdItem.Text) <> '' then
  begin
    try
     SQLMaterial.SQL.Text := 'select * from MATERIAL where CD_MATERIAL = ' + edtCdItem.Text;
     SQLMaterial.Open;
    except
     ShowMessage('Item não encontrado!');
     edtCdItem.SetFocus();
     exit;
    end;

    edtCdItem.Text := SQLMaterial.FieldByName('CD_MATERIAL').AsString;
    edtDsItem.Text := SQLMaterial.FieldByName('DS_MATERIAL').AsString;
    edtUndItem.Text := SQLMaterial.FieldByName('UN_MATERIAL').AsString;
    edtVlItem.Text := SQLMaterial.FieldByName('VL_MATERIAL').AsString;
  end;
end;

procedure TfrmPedidoCompra.edtDescontoExit(Sender: TObject);
var
vVlLiquido : Double;
begin
  inherited;
  try
    vVlLiquido := StrToFloat(edtVlBruto.Text) - ((StrToFloat(edtDesconto.Text) / 100) * StrToFloat(edtVlBruto.Text));
    if vVlLiquido < 0 then
    begin
      ShowMessage('Porcentagem de desconto inválida!');
      edtDesconto.Clear;
      edtDesconto.SetFocus;
      exit;
    end;

    dm.sdsComandosSQL.CommandText := 'update PEDIDO_COMPRA set VL_BRUTO = :VL_BRUTO,VL_DESCONTO = :VL_DESCONTO, VL_LIQUIDO = :VL_LIQUIDO where CD_PEDIDO = :CD_PEDCOMPRA';
    dm.sdsComandosSQL.ParamByName('CD_PEDCOMPRA').AsInteger := StrToInt(edtCodigo.Text);
    dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
    dm.sdsComandosSQL.ParamByName('VL_DESCONTO').AsFloat := StrToFloat(edtDesconto.Text);
    dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := vVlLiquido;
    dm.sdsComandosSQL.ExecSQL();

    SQLPedCompra.SQL.Text := 'select VL_LIQUIDO from PEDIDO_COMPRA where CD_PEDIDO =' + edtCodigo.Text;
    SQLPedCompra.Open;
    edtVlLiquido.Text := FloatToStr(SQLPedCompra.FieldByName('VL_LIQUIDO').AsFloat);
    SQLPedCompra.Close;
  except
    ShowMessage('Ocorreu um erro de processo!');
    Exit;
  end;
end;

procedure TfrmPedidoCompra.edtQuantidadeExit(Sender: TObject);
var
vVlMaterial : Double;
vVlTotal : Double;
vVlLiquido : Double;
begin
  inherited;
  if trim(edtQuantidade.Text) <> '' then
  begin
    try
      SQLMaterial.SQL.Text := 'select * from MATERIAL where CD_MATERIAL = ' + edtCdItem.Text;
      SQLMaterial.Open;
      vVlMaterial := StrToFloat(SQLMaterial.FieldByName('VL_MATERIAL').AsString);
      vVlTotal := vVlMaterial * StrToFloat(edtQuantidade.Text);

      dm.sdsComandosSQL.CommandText := 'insert into ITEM_COMPRA values(:CD_PEDIDO, :CD_MATERIAL, :QT_ITEM, :VL_TOTAL, :QT_RECEBIDA)';
      dm.sdsComandosSQL.ParamByName('CD_PEDIDO').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('CD_MATERIAL').AsInteger := StrToInt(edtCdItem.Text);
      dm.sdsComandosSQL.ParamByName('QT_ITEM').AsFloat := StrToFloat(edtQuantidade.Text);
      dm.sdsComandosSQL.ParamByName('VL_TOTAL').AsFloat := vVlTotal;
      dm.sdsComandosSQL.ParamByName('QT_RECEBIDA').AsFloat := 0;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsItemCompra.Close;
      dm.sdsItemCompra.ParamByName('CD_PEDIDO').Text := edtCodigo.Text;
      dm.cdsItemCompra.Open;

      SQLItemCompra.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTALPED from ITEM_COMPRA where CD_PEDIDO =' + edtCodigo.Text;
      SQLItemCompra.Open;
      edtVlBruto.Text := FloatToStr(SQLItemCompra.FieldByName('VL_TOTALPED').AsFloat);

      vVlLiquido := StrToFloat(edtVlBruto.Text) - ((StrToFloat(edtDesconto.Text)) / 100) * StrToFloat(edtVlBruto.Text);
      edtVlLiquido.Text := FloatToStr(vVlLiquido);
      if StrToFloat(edtVlLiquido.Text) < 0 then
      begin
        ShowMessage('Porcentagem de desconto inválida!');
        edtDesconto.Clear;
        edtDesconto.SetFocus;
        exit;
      end;

      dm.sdsComandosSQL.CommandText := 'update PEDIDO_COMPRA set VL_LIQUIDO = :VL_LIQUIDO, VL_BRUTO = :VL_BRUTO where CD_PEDIDO = :CD_PEDCOMPRA';
      dm.sdsComandosSQL.ParamByName('CD_PEDCOMPRA').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
      dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
      dm.sdsComandosSQL.ExecSQL();
    except
     ShowMessage('Ocorreu um erro de processo!');
     Exit;
    end;
    edtQuantidade.Clear;
    edtCdItem.SetFocus;
  end;
end;

procedure TfrmPedidoCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vOperacao := 0;
  dm.cdsCondPgto.Close;
  dm.cdsFornecedor.Close;
  dm.cdsItemCompra.Close;
  dm.cdsPedCompra.Close;
  SQLImprimir.Close;
  if (frmListagemPedCompra.vOperacao = 1) or (frmListagemPedCompra.vOperacao = 2)then
  begin
    dm.cdsPedCompra.Close;
    dm.cdsPedCompra.Open;
    dm.cdsFornecedor.Close;
    dm.cdsFornecedor.Open;
  end;
end;

procedure TfrmPedidoCompra.FormKeyUp(Sender: TObject; var Key: Word;
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

  if Key = vk_f6 then
  begin
    btContagem.Click;
  end;

  if Key = vk_f9 then
  begin
    btGeraContPagar.Click;
  end;

end;

procedure TfrmPedidoCompra.FormShow(Sender: TObject);
begin
  inherited;
  if (frmListagemPedCompra.vOperacao = 1) or (frmPrincipal.vOperacao = 1) then
  begin
    edtCodigo.Clear;
    edtCdCondPgto.Clear;
    edtDtPedCompra.Text := DateToStr(Date);
    edtCdCondPgto.Clear;
    edtDsCondPgto.Clear;
    edtNrParcelas.Clear;
    edtCdFornecedor.Clear;
    edtDsFornecedor.Clear;
    edtCdItem.Clear;
    edtCdItem.Enabled := False;
    edtDsItem.Clear;
    edtVlItem.Clear;
    edtVlBruto.Clear;
    edtVlLiquido.Clear;
    edtDesconto.Clear;
    edtDesconto.Enabled := True;
    edtQuantidade.Clear;
    edtQuantidade.Enabled := False;
    btSalvar.Enabled := True;
    cboStatus.Text := 'EM ANDAMENTO';
    edtCdFornecedor.Enabled := True;
    btFornecedor.Enabled := True;
    edtCdCondPgto.Enabled := True;
    btCondPgto.Enabled := True;
    btRemover.Enabled := True;
    btLimpar.Enabled := True;
    edtCdFornecedor.SetFocus();
  end;
  if frmListagemPedCompra.vOperacao = 2 then
  begin
    edtCodigo.Text        := dm.cdsPedCompra.FieldByName('CD_PEDIDO').Text;
    edtDtPedCompra.Text   := dm.cdsPedCompra.FieldByName('DT_PEDIDO').Text;
    cboStatus.Text        := trim(dm.cdsPedCompra.FieldByName('IN_STATUS').Text);
    edtCdFornecedor.Text  := dm.cdsPedCompra.FieldByName('CD_FORNECEDOR').Text;
    edtCdCondPgto.Text    := dm.cdsPedCompra.FieldByName('CD_CONDPGTO').Text;
    edtDsFornecedor.Text  := dm.cdsPedCompra.FieldByName('DS_FANTASIA').Text;
    edtDesconto.Text      := dm.cdsPedCompra.FieldByName('VL_DESCONTO').Text;
    edtVlBruto.Text       := dm.cdsPedCompra.FieldByName('VL_BRUTO').Text;
    edtVlLiquido.Text     := dm.cdsPedCompra.FieldByName('VL_LIQUIDO').Text;

    SQLCondPgto.SQL.Text := 'select * from CONDICAO_PAGAMENTO where CD_CONDPGTO = ' + frmPedidoCompra.edtCdCondPgto.Text;
    SQLCondPgto.Open;
    edtDsCondPgto.Text := SQLCondPgto.FieldByName('DS_CONDPGTO').Text;
    edtNrParcelas.Text := SQLCondPgto.FieldByName('NR_PARCELAS').Text;

    dm.cdsItemCompra.Close;
    dm.sdsItemCompra.ParamByName('CD_PEDIDO').Text := edtCodigo.Text;
    dm.cdsItemCompra.Open;

    if(trim(cboStatus.Text) <> 'EM ANDAMENTO') then
    begin
      edtCdFornecedor.Enabled := False;
      btFornecedor.Enabled := False;
      edtCdCondPgto.Enabled := False;
      btCondPgto.Enabled := False;
      edtCdItem.Enabled := False;
      btItem.Enabled := False;
      btRemover.Enabled := False;
      edtQuantidade.Enabled := False;
      edtDesconto.Enabled := False;
      end
    else
    begin
      edtCdFornecedor.Enabled := False;
      btFornecedor.Enabled := False;
      edtCdCondPgto.Enabled := False;
      btCondPgto.Enabled := False;
      edtCdItem.Enabled := True;
      btItem.Enabled := True;
      btRemover.Enabled := True;
      edtQuantidade.Enabled := True;
      edtDesconto.Enabled := True;
    end;
    SQLImprimir.SQL.Text := 'select * from PEDIDO_COMPRA P inner join FORNECEDOR F on F.CD_FORNECEDOR = P.CD_FORNECEDOR and P.CD_PEDIDO = ' + edtCodigo.Text;
    SQLImprimir.Open;

    btSalvar.Enabled := False;
    btLimpar.Enabled := False;
  end;

   dm.cdsCliente.Open;
end;

procedure TfrmPedidoCompra.btContagemClick(Sender: TObject);
begin
  inherited;
  if Trim(edtCodigo.Text) <> '' then
  begin
    frmBaixaPedCompra.ShowModal;
    end
  else
  begin
    ShowMessage('Pedido não cadastrado!');
  end;

end;

procedure TfrmPedidoCompra.btRemoverClick(Sender: TObject);
var
  vCdMaterial : Integer;
  vCdPedido: Integer;
  vVlLiquido : Double;
begin
  vCdPedido:= 0;
  vVlLiquido := 0;
  vCdPedido := DBGrid1.Columns[0].Field.AsInteger;
  vCdMaterial := DBGrid1.Columns[1].Field.AsInteger;

  if (vCdPedido = 0) or (vCdMaterial = 0) then
  begin
    exit;
  end;

  if cboStatus.Text <> 'EM ANDAMENTO' then
  begin
    ShowMessage('Status do pedido não permite a execução deste processo!');
    Exit;
  end;

  if application.messagebox('Deseja realmente remover material?','Remover',mb_yesno+mb_defbutton2)<>idno then
  begin
    dm.sdsComandosSQL.CommandText := 'delete from ITEM_COMPRA where CD_MATERIAL = :CD_MATERIAL and CD_PEDIDO = :CD_PEDIDO';
    dm.sdsComandosSQL.ParamByName('CD_MATERIAL').AsInteger := vCdMaterial;
    dm.sdsComandosSQL.ParamByName('CD_PEDIDO').AsInteger := vCdPedido;
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsItemCompra.Close;
    dm.sdsItemCompra.ParamByName('CD_PEDIDO').Text := edtCodigo.Text;
    dm.cdsItemCompra.Open;

    try
      SQLItemCompra.SQL.Text := 'select sum(VL_TOTAL) as VL_TOTALPED from ITEM_COMPRA where CD_PEDIDO =' + edtCodigo.Text;
      SQLItemCompra.Open;
      edtVlBruto.Text := FloatToStr(SQLItemCompra.FieldByName('VL_TOTALPED').AsFloat);

      vVlLiquido := StrToFloat(edtVlBruto.Text) - ((StrToFloat(edtDesconto.Text)) / 100) * StrToFloat(edtVlBruto.Text);
      edtVlLiquido.Text := FloatToStr(vVlLiquido);
      if StrToFloat(edtVlLiquido.Text) < 0 then
      begin
        ShowMessage('Porcentagem de desconto inválida!');
        edtDesconto.Clear;
        edtDesconto.SetFocus;
        exit;
      end;

      dm.sdsComandosSQL.CommandText := 'update PEDIDO_COMPRA set VL_LIQUIDO = :VL_LIQUIDO, VL_BRUTO = :VL_BRUTO where CD_PEDIDO = :CD_PEDCOMPRA';
      dm.sdsComandosSQL.ParamByName('CD_PEDCOMPRA').AsInteger := StrToInt(edtCodigo.Text);
      dm.sdsComandosSQL.ParamByName('VL_LIQUIDO').AsFloat := StrToFloat(edtVlLiquido.Text);
      dm.sdsComandosSQL.ParamByName('VL_BRUTO').AsFloat := StrToFloat(edtVlBruto.Text);
      dm.sdsComandosSQL.ExecSQL();
    except
     ShowMessage('Ocorreu um erro de processo!');
     Exit;
    end;
  end;
end;

procedure TfrmPedidoCompra.btGeraContPagarClick(Sender: TObject);
var
vContador : Integer;
vNrParcela : Integer;
vVlParcela : Double;
vVlLiquido : Double;
vData : tdatetime;
begin
  inherited;
  try
      if Trim(cboStatus.Text) <> 'ATENDIDO' then
      begin
        ShowMessage('Pedido não está atendido!');
        Exit;
      end;
      SQLContasPagar.SQL.Text := 'select * from CONTAS_PAGAR where CD_PEDIDO = ' + edtCodigo.Text;
      SQLContasPagar.Open;
      if  SQLContasPagar.FieldByName('CD_PEDIDO').Value = null then
      begin
        vContador := 0;
        repeat
          begin
            vContador := vContador + 1;
            vNrParcela :=  StrToInt(edtNrParcelas.Text);
            vData := Date;

            if vNrParcela = 0 then
            begin
               vVlParcela := StrToFloat(edtVlLiquido.Text);
              end
            else
            begin
              vVlParcela := StrToFloat(edtVlLiquido.Text)/StrToFloat(edtNrParcelas.Text);
              vData := vData + (30 * vContador);
            end;

            dm.sdsComandosSQL.CommandText := 'insert into CONTAS_PAGAR values(GEN_ID(GEN_CONTAS_PAGAR_ID,1), :CD_PEDCOMPRA, :DT_CONTA, :DT_VENCIMENTO, null, :IN_STATUS, :NR_PARCELA, :VL_PARCELA, 0)';
            dm.sdsComandosSQL.ParamByName('CD_PEDCOMPRA').AsInteger := StrToInt(edtCodigo.Text);
            dm.sdsComandosSQL.ParamByName('DT_CONTA').AsDate := Date;
            dm.sdsComandosSQL.ParamByName('DT_VENCIMENTO').AsDate := vData;
            //dm.sdsComandosSQL.ParamByName('DT_PAGA').AsDate := null;
            dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'EM ABERTO';
            dm.sdsComandosSQL.ParamByName('NR_PARCELA').AsInteger := vContador;
            dm.sdsComandosSQL.ParamByName('VL_PARCELA').AsFloat := vVlParcela;
            dm.sdsComandosSQL.ExecSQL();
          end;
        until(vContador >= vNrParcela);

        dm.sdsComandosSQL.CommandText := 'update PEDIDO_COMPRA set IN_STATUS = :IN_STATUS where CD_PEDIDO = :CD_PEDCOMPRA';
        dm.sdsComandosSQL.ParamByName('CD_PEDCOMPRA').AsInteger := StrToInt(edtCodigo.Text);
        dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'FINALIZADO';
        dm.sdsComandosSQL.ExecSQL();
        dm.cdsPedCompra.Close;
        dm.cdsPedCompra.Open;
        frmPedidoCompra.cboStatus.Text := 'FINALIZADO';
      end;
    except
     ShowMessage('Ocorreu um erro de processo!');
     Exit;
    end;

    ShowMessage('Contas a pagar gerado com sucesso!');
end;
end.
