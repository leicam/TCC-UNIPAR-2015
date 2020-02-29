unit untCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Data.FMTBcd, Data.SqlExpr;

type
  TfrmCadastroFornecedor = class(TfrmCadastro)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtDtCadastro: TEdit;
    Label13: TLabel;
    edtFantasia: TEdit;
    edtInsEstadual: TEdit;
    edtCnpj: TEdit;
    edtCdCidade: TEdit;
    edtDsCidade: TEdit;
    edtEndereco: TEdit;
    edtCep: TEdit;
    edtBairro: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    cboStatus: TComboBox;
    dsFornecedor: TDataSource;
    SQLQueryFornecedor: TSQLQuery;
    SpeedButton1: TSpeedButton;
    edtUf: TEdit;
    Panel2: TPanel;
    edtObservacao: TMemo;
    Label14: TLabel;
    edtRazaoSocial: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edtCdCidadeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edtInsEstadualKeyPress(Sender: TObject; var Key: Char);
    procedure edtCdCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtFantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCnpjExit(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmCadastroFornecedor: TfrmCadastroFornecedor;

implementation

{$R *.dfm}

uses untDm, untPrincipal, untListagemCidade, untListagemFornecedor, untFuncoes;

procedure TfrmCadastroFornecedor.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmCadastroFornecedor.Close;
  dm.cdsFornecedor.Close;
end;

procedure TfrmCadastroFornecedor.btLimparClick(Sender: TObject);
begin
  inherited;
   edtDtCadastro.Text := DateToStr(Date);
   edtFantasia.Clear;
   edtCnpj.Clear;
   edtInsEstadual.Clear;
   edtCdCidade.Clear;
   edtDsCidade.Clear;
   edtEndereco.Clear;
   edtBairro.Clear;
   edtCep.Clear;
   edtEmail.Clear;
   edtTelefone.Clear;
   edtObservacao.Clear;
   cboStatus.Text := 'ATIVO';
   edtFantasia.SetFocus;
end;

procedure TfrmCadastroFornecedor.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtFantasia.Text)='' then
  begin
    ShowMessage('Campo nome fantasia obrigatÛrio!');
    edtFantasia.SetFocus;
    exit;
  end;

  if trim(edtRazaoSocial.Text)='' then
  begin
    ShowMessage('Campo raz„o social obrigatÛrio!');
    edtRazaoSocial.SetFocus;
    exit;
  end;

  if trim(edtCnpj.Text)='' then
  begin
    ShowMessage('Campo CNPJ obrigatÛrio!');
    edtCnpj.SetFocus;
    exit;
  end;

  if trim(edtInsEstadual.Text)='' then
  begin
    ShowMessage('Campo inscriÁ„o estadual obrigatÛrio!');
    edtInsEstadual.SetFocus;
    exit;
  end;

  if trim(edtCdCidade.Text)='' then
  begin
    ShowMessage('Campo cidade obrigatÛrio!');
    edtCdCidade.SetFocus;
    exit;
  end;

  if trim(edtEndereco.Text)='' then
  begin
    ShowMessage('Campo endereÁo obrigatÛrio!');
    edtEndereco.SetFocus;
    exit;
  end;

  if trim(edtBairro.Text)='' then
  begin
    ShowMessage('Campo bairro obrigatÛrio!');
    edtBairro.SetFocus;
    exit;
  end;

  if trim(edtCep.Text)='' then
  begin
    ShowMessage('Campo CEP obrigatÛrio!');
    edtCep.SetFocus;
    exit;
  end;

  if (frmPrincipal.vOperacao = 1) or (frmListagemFornecedor.vOperacao = 1) then
  begin
    dm.sdsComandosSQL.CommandText := 'insert into FORNECEDOR values(GEN_ID(GEN_FORNECEDOR_ID,1), :DS_FANTASIA, :DS_ENDERECO, :DS_BAIRRO, :DS_EMAIL, :DS_OBS, :NR_CNPJ, :NR_TELEFONE, :NR_CEP, :IN_STATUS, :CD_CIDADE, :NR_IS, :DT_CADASTRO, :DS_RAZAOSOCIAL)';
    dm.sdsComandosSQL.ParamByName('DT_CADASTRO').AsDate := StrToDate(edtDtCadastro.Text);
    dm.sdsComandosSQL.ParamByName('DS_FANTASIA').Text := edtFantasia.Text;
    dm.sdsComandosSQL.ParamByName('DS_ENDERECO').Text := edtEndereco.Text;
    dm.sdsComandosSQL.ParamByName('DS_BAIRRO').Text := edtBairro.Text;
    dm.sdsComandosSQL.ParamByName('DS_EMAIL').Text := edtEmail.Text;
    dm.sdsComandosSQL.ParamByName('DS_OBS').Text := edtObservacao.Text;
    dm.sdsComandosSQL.ParamByName('NR_CNPJ').Text := edtCnpj.Text;
    dm.sdsComandosSQL.ParamByName('NR_IS').Text := edtInsEstadual.Text;
    dm.sdsComandosSQL.ParamByName('NR_TELEFONE').Text := edtTelefone.Text;
    dm.sdsComandosSQL.ParamByName('NR_CEP').Text := edtCep.Text;
    dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := cboStatus.Text;
    dm.sdsComandosSQL.ParamByName('CD_CIDADE').Text := edtCdCidade.Text;
    dm.sdsComandosSQL.ParamByName('DS_RAZAOSOCIAL').Text := edtRazaoSocial.Text;
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
    ShowMessage('Fornecedor cadastrado com sucesso!');
    close;
  end;
  if frmListagemFornecedor.vOperacao = 2 then
  begin
    dm.sdsComandosSQL.CommandText := 'update FORNECEDOR set DS_FANTASIA = :DS_FANTASIA, DS_ENDERECO = :DS_ENDERECO, DS_BAIRRO = :DS_BAIRRO,'+' DS_EMAIL = :DS_EMAIL, DS_OBSERVACAO = :DS_OBS, NR_CNPJ = :NR_CNPJ, NR_TELEFONE = :NR_TELEFONE, NR_CEP = :NR_CEP, IN_STATUS = :IN_STATUS, CD_CIDADE = :CD_CIDADE, NR_IS = :NR_IS, DT_CADASTRO = :DT_CADASTRO where CD_FORNECEDOR = :CD_FORNECEDOR';
    dm.sdsComandosSQL.ParamByName('CD_FORNECEDOR').AsInteger := StrToInt(edtCodigo.Text);
    dm.sdsComandosSQL.ParamByName('DT_CADASTRO').AsDate := StrToDate(edtDtCadastro.Text);
    dm.sdsComandosSQL.ParamByName('DS_FANTASIA').Text := edtFantasia.Text;
    dm.sdsComandosSQL.ParamByName('DS_ENDERECO').Text := edtEndereco.Text;
    dm.sdsComandosSQL.ParamByName('DS_BAIRRO').Text := edtBairro.Text;
    dm.sdsComandosSQL.ParamByName('DS_EMAIL').Text := edtEmail.Text;
    dm.sdsComandosSQL.ParamByName('DS_OBS').Text := edtObservacao.Text;
    dm.sdsComandosSQL.ParamByName('NR_CNPJ').Text := edtCnpj.Text;
    dm.sdsComandosSQL.ParamByName('NR_IS').Text := edtInsEstadual.Text;
    dm.sdsComandosSQL.ParamByName('NR_TELEFONE').Text := edtTelefone.Text;
    dm.sdsComandosSQL.ParamByName('NR_CEP').Text := edtCep.Text;
    dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := cboStatus.Text;
    dm.sdsComandosSQL.ParamByName('CD_CIDADE').AsInteger := StrToInt(edtCdCidade.Text);
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
    ShowMessage('Fornecedor alterado com sucesso!');
    close;
  end;
end;

procedure TfrmCadastroFornecedor.edtCdCidadeExit(Sender: TObject);
begin
  inherited;
  if Trim(edtCdCidade.Text) <> '' then
  begin
    try
       SQLQueryFornecedor.SQL.Text := 'select * from CIDADE where CD_CIDADE = ' + edtCdCidade.Text;
       SQLQueryFornecedor.Open
    except
       ShowMessage('Cidade n„o encontrada!');
       edtCdCidade.SetFocus();
       exit;
    end;

    edtCdCidade.Text := SQLQueryFornecedor.FieldByName('CD_CIDADE').AsString;
    edtDsCidade.Text := SQLQueryFornecedor.FieldByName('DS_CIDADE').AsString;
    edtUf.Text := SQLQueryFornecedor.FieldByName('UF_CIDADE').AsString;
  end;
end;

procedure TfrmCadastroFornecedor.edtCdCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TfrmCadastroFornecedor.edtCepExit(Sender: TObject);
begin
  inherited;
  if(Trim(edtCep.Text) <> '') then
  begin
    edtCep.Text := funcoes.formataCEP(edtCep.Text);
  end;
end;

procedure TfrmCadastroFornecedor.edtCnpjExit(Sender: TObject);
begin
  inherited;
   if trim(edtCnpj.Text) <> '' then
  begin
    if (trim(edtCnpj.Text).Length = 14) or (trim(edtCnpj.Text).Length = 11) then
    begin
     if (trim(edtCnpj.Text).Length = 14)then
     begin
      funcoes.isCNPJ(edtCnpj.Text);
      end
     else begin
      funcoes.isCPF(edtCnpj.Text);
     end;
     edtCnpj.Text := funcoes.FormataCNPJ_CPF(edtCnpj.Text);
    end
  else
  begin
    ShowMessage('CPF/CNPJ inv·lido');
    edtCnpj.Clear;
    edtCnpj.SetFocus;
    Exit;
  end;
  end;
end;

procedure TfrmCadastroFornecedor.edtEnderecoKeyPress(Sender: TObject;
  var Key: Char);
Const especiais: String = '<>!@#$%®&*()_-+={}[]?;:,.|/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
Var  Str : String;

begin
  inherited;
  Str := key;
  if (Pos(Str,especiais)<>0) or (Str = '''') Then
    begin
     key:= #0;
    end
  else if key = #0 then
    begin
      edtEndereco.SetFocus;
    end;

  if Key = #22 then Key := #0;

end;

procedure TfrmCadastroFornecedor.edtFantasiaKeyPress(Sender: TObject;
  var Key: Char);
Const especiais: String = '0123456789<>!@#$%®&*()_-+={}[]?;:,.|/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
Var  Str : String;

begin
  inherited;
  Str := key;
  if (Pos(Str,especiais)<>0) or (Str = '''') Then
    begin
     key:= #0;
    end
  else if key = #0 then
    begin
      edtFantasia.SetFocus;
    end;

  if Key = #22 then Key := #0;
end;

procedure TfrmCadastroFornecedor.edtInsEstadualKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TfrmCadastroFornecedor.edtTelefoneExit(Sender: TObject);
begin
  inherited;
  edtTelefone.Text := funcoes.formataTelefone(edtTelefone.Text);
end;

procedure TfrmCadastroFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.sdsFornecedor.Close;
  if (frmListagemFornecedor.vOperacao = 1) or (frmListagemFornecedor.vOperacao = 2)then
  begin
    frmListagemFornecedor.cdsFornecedor.Close;
    frmListagemFornecedor.cdsFornecedor.Open;
  end;
end;

procedure TfrmCadastroFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  if (frmListagemFornecedor.vOperacao = 1) or (frmPrincipal.vOperacao = 1) then
    begin
    edtDtCadastro.Text := DateToStr(Date);
    edtFantasia.Clear;
    edtCnpj.Clear;
    edtInsEstadual.Clear;
    edtCdCidade.Clear;
    edtDsCidade.Clear;
    edtEndereco.Clear;
    edtBairro.Clear;
    edtCep.Clear;
    edtEmail.Clear;
    edtTelefone.Clear;
    edtObservacao.Clear;
    cboStatus.Text := 'ATIVO';
  end;
  if frmListagemFornecedor.vOperacao = 2 then
  begin
    try
      frmCadastroFornecedor.edtCodigo.Text        := frmListagemFornecedor.cdsFornecedor.FieldByName('CD_FORNECEDOR').Text;
      frmCadastroFornecedor.edtDtCadastro.Text    := frmListagemFornecedor.cdsFornecedor.FieldByName('DT_CADASTRO').Text;
      frmCadastroFornecedor.cboStatus.Text        := frmListagemFornecedor.cdsFornecedor.FieldByName('IN_STATUS').Text;
      frmCadastroFornecedor.edtFantasia.Text      := frmListagemFornecedor.cdsFornecedor.FieldByName('DS_FANTASIA').Text;
      frmCadastroFornecedor.edtCnpj.Text          := frmListagemFornecedor.cdsFornecedor.FieldByName('NR_CNPJ').Text;
      frmCadastroFornecedor.edtInsEstadual.Text   := frmListagemFornecedor.cdsFornecedor.FieldByName('NR_IS').Text;
      frmCadastroFornecedor.edtCdCidade.Text      := frmListagemFornecedor.cdsFornecedor.FieldByName('CD_CIDADE').Text;
      frmCadastroFornecedor.edtEndereco.Text      := frmListagemFornecedor.cdsFornecedor.FieldByName('DS_ENDERECO').Text;
      frmCadastroFornecedor.edtBairro.Text        := frmListagemFornecedor.cdsFornecedor.FieldByName('DS_BAIRRO').Text;
      frmCadastroFornecedor.edtCep.Text           := frmListagemFornecedor.cdsFornecedor.FieldByName('NR_CEP').Text;
      frmCadastroFornecedor.edtEmail.Text         := frmListagemFornecedor.cdsFornecedor.FieldByName('DS_EMAIL').Text;
      frmCadastroFornecedor.edtTelefone.Text      := frmListagemFornecedor.cdsFornecedor.FieldByName('NR_TELEFONE').Text;
      frmCadastroFornecedor.edtObservacao.Text    := frmListagemFornecedor.cdsFornecedor.FieldByName('DS_OBSERVACAO').Text;
      frmCadastroFornecedor.edtRazaoSocial.Text   := frmListagemFornecedor.cdsFornecedor.FieldByName('DS_RAZAOSOCIAL').Text;

      SQLQueryFornecedor.SQL.Text := 'select * from CIDADE where CD_CIDADE = ' + edtCdCidade.Text;
      SQLQueryFornecedor.Open;
      edtCdCidade.Text  := SQLQueryFornecedor.FieldByName('CD_CIDADE').AsString;
      edtDsCidade.Text  := SQLQueryFornecedor.FieldByName('DS_CIDADE').AsString;
      edtUf.Text        := SQLQueryFornecedor.FieldByName('UF_CIDADE').AsString;
      edtFantasia.SetFocus();
    except
      ShowMessage('Processo n„o pode ser executado. Selecione a inclus„o de fornecedor!');
      Exit;
    end;
  end;
  dm.cdsFornecedor.Open;
end;

procedure TfrmCadastroFornecedor.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmListagemCidade.ShowModal;
end;

end.
