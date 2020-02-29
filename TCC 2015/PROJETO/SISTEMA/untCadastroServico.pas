unit untCadastroServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmCadastroServico = class(TfrmCadastro)
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtValor: TEdit;
    cboTpServ: TComboBox;
    procedure btCancelarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroServico: TfrmCadastroServico;

implementation

{$R *.dfm}

uses untDm, untPrincipal, untListagemServico;

procedure TfrmCadastroServico.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmCadastroServico.Close;
end;

procedure TfrmCadastroServico.btLimparClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtValor.Clear;
  cboTpServ.Text := 'METRO';
end;

procedure TfrmCadastroServico.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtDescricao.Text)='' then
  begin
    ShowMessage('Campo descrição obrigatório!');
    edtDescricao.SetFocus;
    exit;
  end;

  if trim(edtValor.Text)='' then
  begin
    ShowMessage('Campo valor obrigatório!');
    edtValor.SetFocus;
    exit;
  end;

  if (frmPrincipal.vOperacao = 1) or (frmListagemServico.vOperacao = 1) then
  begin
    dm.sdsComandosSQL.CommandText := 'insert into SERVICO values(GEN_ID(GEN_SERVICO_ID,1), :DESCRICAO, :TP_SERVICO, :VALOR)';
    dm.sdsComandosSQL.ParamByName('DESCRICAO').Text   := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('TP_SERVICO').Text  := cboTpServ.Text;
    dm.sdsComandosSQL.ParamByName('VALOR').AsFloat    := StrToFloat(edtValor.Text);
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsServico.Close;
    dm.cdsServico.Open;
    ShowMessage('Serviço cadastrado com sucesso!');
    close;
  end;

  if frmListagemServico.vOperacao = 2 then
  begin
    dm.sdsComandosSQL.CommandText := 'update SERVICO set DS_SERVICO = :DESCRICAO, UN_SERVICO = :TP_SERVICO, VL_SERVICO = :VALOR where CD_SERVICO = :CODIGO';
    dm.sdsComandosSQL.ParamByName('CODIGO').Text      := edtCodigo.Text;
    dm.sdsComandosSQL.ParamByName('DESCRICAO').Text   := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('TP_SERVICO').Text  := cboTpServ.Text;
    dm.sdsComandosSQL.ParamByName('VALOR').AsFloat    := StrToFloat(edtValor.Text);
    dm.sdsComandosSQL.ExecSQL();
    ShowMessage('Serviço alterado com sucesso!');
    dm.cdsServico.Close;
    dm.cdsServico.Open;
    close;
  end;

end;

procedure TfrmCadastroServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.sdsServico.Close;
  if (frmListagemServico.vOperacao = 1) or (frmListagemServico.vOperacao = 2)then
  begin
    dm.sdsServico.Open;
  end;
end;

procedure TfrmCadastroServico.FormShow(Sender: TObject);
begin
  inherited;
  if (frmListagemServico.vOperacao = 1) or (frmPrincipal.vOperacao = 1) then
    begin
    edtCodigo.Clear;
    edtDescricao.Clear;
    edtValor.Clear;
    cboTpServ.Text := 'METRO';
  end;
  if frmListagemServico.vOperacao = 2 then
  begin
    frmCadastroServico.edtCodigo.Text     := dm.cdsServico.FieldByName('CD_SERVICO').Text;
    frmCadastroServico.edtDescricao.Text  := dm.cdsServico.FieldByName('DS_SERVICO').Text;
    frmCadastroServico.cboTpServ.Text     := dm.cdsServico.FieldByName('UN_SERVICO').Text;
    frmCadastroServico.edtValor.Text      := dm.cdsServico.FieldByName('VL_SERVICO').Text;
  end;

  dm.cdsServico.Open;
end;

end.
