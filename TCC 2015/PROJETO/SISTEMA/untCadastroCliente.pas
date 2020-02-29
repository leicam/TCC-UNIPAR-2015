unit untCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Data.FMTBcd, Data.SqlExpr;

type
  TfrmCadastroCliente = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
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
    edtDtCadastro: TEdit;
    edtNome: TEdit;
    edtCpf: TEdit;
    edtCdCidade: TEdit;
    edtDsCidade: TEdit;
    edtTelefone: TEdit;
    edtBairro: TEdit;
    edtEmail: TEdit;
    edtCep: TEdit;
    Label13: TLabel;
    edtRg: TEdit;
    cboStatus: TComboBox;
    dsCliente: TDataSource;
    btListaCid: TSpeedButton;
    SQLQueryCliente: TSQLQuery;
    edtUf: TEdit;
    edtEndereco: TEdit;
    Panel2: TPanel;
    edtObservacao: TMemo;
    Label14: TLabel;
    edtDtNascimento: TEdit;
    procedure btCancelarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCdCidadeExit(Sender: TObject);
    procedure btListaCidClick(Sender: TObject);
    procedure edtCdCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCpfExit(Sender: TObject);
    procedure edtDtNascimentoKeyPress(Sender: TObject; var Key: Char);
    function formataMascaraData(var Key: char; Sender: TObject):string;
    procedure edtCepExit(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure edtDtNascimentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

uses untDm, untPrincipal, untListagemCliente, untListagemCidade, untFuncoes;

procedure TfrmCadastroCliente.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmCadastroCliente.Close;
  dm.cdsCliente.Close;
end;

procedure TfrmCadastroCliente.btLimparClick(Sender: TObject);
begin
  inherited;
    edtDtCadastro.Text := DateToStr(Date);
    edtNome.Clear;
    edtCpf.Clear;
    edtRg.Clear;
    edtCdCidade.Clear;
    edtDsCidade.Clear;
    edtBairro.Clear;
    edtBairro.Clear;
    edtCep.Clear;
    edtEmail.Clear;
    edtTelefone.Clear;
    edtObservacao.Clear;
    edtUf.Clear;
    cboStatus.Text := 'ATIVO';
    edtNome.SetFocus();
end;

procedure TfrmCadastroCliente.btListaCidClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmListagemCidade.ShowModal;
end;

procedure TfrmCadastroCliente.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtDtNascimento.Text)='' then
  begin
    ShowMessage('Campo data nascimento obrigatÛrio!');
    edtDtNascimento.SetFocus;
    exit;
  end;

  if StrToDate(edtDtNascimento.Text) > Date then
  begin
    ShowMessage('Campo data nascimento obrigatÛrio!');
    edtDtNascimento.SetFocus;
    exit;
  end;

  if trim(edtNome.Text)='' then
  begin
    ShowMessage('Campo nome obrigatÛrio!');
    edtNome.SetFocus;
    exit;
  end;

  if trim(edtCpf.Text)='' then
  begin
    ShowMessage('Campo CPF obrigatÛrio!');
    edtCpf.SetFocus;
    exit;
  end;

  if trim(edtRg.Text)='' then
  begin
    ShowMessage('Campo RG obrigatÛrio!');
    edtRg.SetFocus;
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

  try
    if (frmPrincipal.vOperacao = 1) or (frmListagemCliente.vOperacao = 1) then
    begin
      dm.sdsComandosSQL.CommandText := 'insert into CLIENTE values(GEN_ID(GEN_CLIENTE_ID,1), :DT_CADASTRO, :DS_NOME, :DS_ENDERECO, :DS_BAIRRO, :DS_EMAIL, :DS_OBS, :NR_CPF, :NR_RG, :NR_TELEFONE, :NR_CEP, :IN_STATUS, :CD_CIDADE, :DT_NASCIMENTO)';
      dm.sdsComandosSQL.ParamByName('DT_CADASTRO').AsDate := StrToDate(edtDtCadastro.Text);
      dm.sdsComandosSQL.ParamByName('DS_NOME').Text := edtNome.Text;
      dm.sdsComandosSQL.ParamByName('DS_ENDERECO').Text := edtEndereco.Text;
      dm.sdsComandosSQL.ParamByName('DS_BAIRRO').Text := edtBairro.Text;
      dm.sdsComandosSQL.ParamByName('DS_EMAIL').Text := edtEmail.Text;
      dm.sdsComandosSQL.ParamByName('DS_OBS').Text := edtObservacao.Text;
      dm.sdsComandosSQL.ParamByName('NR_CPF').Text := edtCpf.Text;
      dm.sdsComandosSQL.ParamByName('NR_RG').Text := edtRg.Text;
      dm.sdsComandosSQL.ParamByName('NR_TELEFONE').Text := edtTelefone.Text;
      dm.sdsComandosSQL.ParamByName('NR_CEP').Text := edtCep.Text;
      dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := cboStatus.Text;
      dm.sdsComandosSQL.ParamByName('CD_CIDADE').Text := edtCdCidade.Text;
      dm.sdsComandosSQL.ParamByName('DT_NASCIMENTO').AsDate := StrToDate(edtDtNascimento.Text);
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsCliente.Close;
      dm.cdsCliente.Open;
      ShowMessage('Cliente cadastrado com sucesso!');
      close;
    end;

    if frmListagemCliente.vOperacao = 2 then
    begin
      dm.sdsComandosSQL.CommandText := 'update CLIENTE set DT_CADASTRO = :DT_CADASTRO, DS_NOME = :DS_NOME, DS_ENDERECO = :DS_ENDERECO, DS_BAIRRO = :DS_BAIRRO, DS_EMAIL = :DS_EMAIL, DS_OBSERVACAO = :DS_OBS, NR_CPF = :NR_CPF, NR_RG = :NR_RG, '+'NR_TELEFONE = :NR_TELEFONE, NR_CEP = :NR_CEP, IN_STATUS = :IN_STATUS, CD_CIDADE = :CD_CIDADE, DT_NASCIMENTO = :DT_NASCIMENTO where CD_CLIENTE = :CD_CLIENTE';
      dm.sdsComandosSQL.ParamByName('CD_CLIENTE').Text := edtCodigo.Text;
      dm.sdsComandosSQL.ParamByName('DT_CADASTRO').AsDate := StrToDate(edtDtCadastro.Text);
      dm.sdsComandosSQL.ParamByName('DS_NOME').Text := edtNome.Text;
      dm.sdsComandosSQL.ParamByName('DS_ENDERECO').Text := edtEndereco.Text;
      dm.sdsComandosSQL.ParamByName('DS_BAIRRO').Text := edtBairro.Text;
      dm.sdsComandosSQL.ParamByName('DS_EMAIL').Text := edtEmail.Text;
      dm.sdsComandosSQL.ParamByName('DS_OBS').Text := edtObservacao.Text;
      dm.sdsComandosSQL.ParamByName('NR_CPF').Text := edtCpf.Text;
      dm.sdsComandosSQL.ParamByName('NR_RG').Text := edtRg.Text;
      dm.sdsComandosSQL.ParamByName('NR_TELEFONE').Text := edtTelefone.Text;
      dm.sdsComandosSQL.ParamByName('NR_CEP').Text := edtCep.Text;
      dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := cboStatus.Text;
      dm.sdsComandosSQL.ParamByName('CD_CIDADE').Text := edtCdCidade.Text;
      dm.sdsComandosSQL.ParamByName('DT_NASCIMENTO').AsDate := StrToDate(edtDtNascimento.Text);
      dm.sdsComandosSQL.ExecSQL();
      ShowMessage('Cliente alterado com sucesso!');
      dm.cdsCliente.Close;
      dm.cdsCliente.Open;
      close;
    end;
  except
    ShowMessage('Ocorreu um erro de processo!');
    Exit;
  end;
end;

procedure TfrmCadastroCliente.edtCdCidadeExit(Sender: TObject);
begin
  inherited;
  if trim(edtCdCidade.Text) <> '' then
  begin
    try
      SQLQueryCliente.SQL.Text := 'select * from CIDADE where CD_CIDADE = ' + edtCdCidade.Text;
      SQLQueryCliente.Open;

      if SQLQueryCliente.FieldByName('CD_CIDADE').IsNull then
      begin
        ShowMessage('Cidade n„o encontrada!');
        Exit;
      end;
    except
       ShowMessage('Cidade n„o encontrada!');
       edtCdCidade.Clear;
       edtDsCidade.Clear;
       edtCdCidade.SetFocus();
       exit;
    end;
    edtCdCidade.Text := SQLQueryCliente.FieldByName('CD_CIDADE').AsString;
    edtDsCidade.Text := SQLQueryCliente.FieldByName('DS_CIDADE').AsString;
    edtUf.Text := SQLQueryCliente.FieldByName('UF_CIDADE').AsString;
  end;
end;

procedure TfrmCadastroCliente.edtCdCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9']) then Key:=#0;
end;

procedure TfrmCadastroCliente.edtCepExit(Sender: TObject);
begin
  inherited;
  if Trim(edtCep.Text) <> '' then
  begin
    edtCep.Text := funcoes.formataCEP(edtCep.Text);
  end;
end;

procedure TfrmCadastroCliente.edtCpfExit(Sender: TObject);
begin
  inherited;
  if trim(edtCpf.Text) <> '' then
  begin
    if (trim(edtCpf.Text).Length = 14) or (trim(edtCpf.Text).Length = 11) then
    begin
     if (trim(edtCpf.Text).Length = 14)then
     begin
      funcoes.isCNPJ(edtCpf.Text);
      end
     else begin
      funcoes.isCPF(edtCpf.Text);
     end;
     edtCpf.Text := funcoes.FormataCNPJ_CPF(edtCpf.Text);
    end
  else
    begin
     ShowMessage('CPF/CNPJ inv·lido');
     edtCpf.Clear;
     edtCpf.SetFocus;
     Exit;
    end;
  end;
end;



procedure TfrmCadastroCliente.edtDtNascimentoExit(Sender: TObject);
begin
  inherited;
  if Trim(edtDtNascimento.Text) <> '' then
  begin
    if(StrToDate(edtDtNascimento.Text) > Date) then
    begin
       ShowMessage('Data de nascimento inv·lida!');
       edtDtNascimento.Clear;
       edtDtNascimento.SetFocus;
       exit;
    end;
  end;
end;

procedure TfrmCadastroCliente.edtDtNascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  formataMascaraData(key,sender);
end;

procedure TfrmCadastroCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
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
      edtNome.SetFocus;
    end;

  if Key = #22 then Key := #0;

end;

procedure TfrmCadastroCliente.edtTelefoneExit(Sender: TObject);
begin
  inherited;
  edtTelefone.Text := funcoes.formataTelefone(edtTelefone.Text);
end;

function TfrmCadastroCliente.formataMascaraData(var Key: char;
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

procedure TfrmCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.sdsCliente.Close;
  if (frmListagemCliente.vOperacao = 1) or (frmListagemCliente.vOperacao = 2)then
  begin
      frmListagemCliente.cdsCliente.Close;
      frmListagemCliente.cdsCliente.Open;
  end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  inherited;
  if (frmListagemCliente.vOperacao = 1) or (frmPrincipal.vOperacao = 1) then
  begin
    edtCodigo.Clear;
    edtDtNascimento.Clear;
    edtDtCadastro.Text := DateToStr(Date);
    edtNome.Clear;
    edtCpf.Clear;
    edtRg.Clear;
    edtCdCidade.Clear;
    edtDsCidade.Clear;
    edtEndereco.Clear;
    edtBairro.Clear;
    edtBairro.Clear;
    edtCep.Clear;
    edtEmail.Clear;
    edtTelefone.Clear;
    edtObservacao.Clear;
    edtUf.Clear;
    cboStatus.Text := 'ATIVO';
    edtDtNascimento.SetFocus();
  end;
  if frmListagemCliente.vOperacao = 2 then
  begin
    try
      frmCadastroCliente.edtCodigo.Text       := frmListagemCliente.cdsCliente.FieldByName('CD_CLIENTE').Text;
      frmCadastroCliente.edtDtCadastro.Text   := frmListagemCliente.cdsCliente.FieldByName('DT_CADASTRO').Text;
      frmCadastroCliente.edtDtNascimento.Text := frmListagemCliente.cdsCliente.FieldByName('DT_NASCIMENTO').Text;
      frmCadastroCliente.cboStatus.Text       := frmListagemCliente.cdsCliente.FieldByName('IN_STATUS').Text;
      frmCadastroCliente.edtNome.Text         := frmListagemCliente.cdsCliente.FieldByName('DS_NOME').Text;
      frmCadastroCliente.edtCpf.Text          := frmListagemCliente.cdsCliente.FieldByName('NR_CPF').Text;
      frmCadastroCliente.edtRg.Text           := frmListagemCliente.cdsCliente.FieldByName('NR_RG').Text;
      frmCadastroCliente.edtCdCidade.Text     := frmListagemCliente.cdsCliente.FieldByName('CD_CIDADE').Text;
      frmCadastroCliente.edtEndereco.Text     := frmListagemCliente.cdsCliente.FieldByName('DS_ENDERECO').Text;
      frmCadastroCliente.edtBairro.Text       := frmListagemCliente.cdsCliente.FieldByName('DS_BAIRRO').Text;
      frmCadastroCliente.edtCep.Text          := frmListagemCliente.cdsCliente.FieldByName('NR_CEP').Text;
      frmCadastroCliente.edtEmail.Text        := frmListagemCliente.cdsCliente.FieldByName('DS_EMAIL').Text;
      frmCadastroCliente.edtTelefone.Text     := frmListagemCliente.cdsCliente.FieldByName('NR_TELEFONE').Text;
      frmCadastroCliente.edtObservacao.Text   := frmListagemCliente.cdsCliente.FieldByName('DS_OBSERVACAO').Text;

      SQLQueryCliente.SQL.Text := 'select * from CIDADE where CD_CIDADE = ' + edtCdCidade.Text;
      SQLQueryCliente.Open;
      edtCdCidade.Text := SQLQueryCliente.FieldByName('CD_CIDADE').AsString;
      edtDsCidade.Text := SQLQueryCliente.FieldByName('DS_CIDADE').AsString;
      edtUf.Text := SQLQueryCliente.FieldByName('UF_CIDADE').AsString;
      edtDtNascimento.SetFocus();
    except
      ShowMessage('Processo n„o pode ser executado. Selecione a inclus„o de cliente!');
      Exit;
    end;
  end;
   dm.cdsCliente.Open;
end;

end.
