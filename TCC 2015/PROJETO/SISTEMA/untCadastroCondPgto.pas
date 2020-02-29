unit untCadastroCondPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmCadastroCondPgto = class(TfrmCadastro)
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtNrParcelas: TEdit;
    procedure btLimparClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCondPgto: TfrmCadastroCondPgto;

implementation

{$R *.dfm}

uses untDm, untPrincipal, untListagemCondPgto;

procedure TfrmCadastroCondPgto.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmCadastroCondPgto.Close;
end;

procedure TfrmCadastroCondPgto.btLimparClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtNrParcelas.Clear;
end;

procedure TfrmCadastroCondPgto.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtDescricao.Text)='' then
  begin
    ShowMessage('Campo descrição obrigatório!');
    edtDescricao.SetFocus;
    exit;
  end;

  if trim(edtNrParcelas.Text)='' then
  begin
    ShowMessage('Campo número de parcelas obrigatório!');
    edtNrParcelas.SetFocus;
    exit;
  end;

  if (frmPrincipal.vOperacao = 1) or (frmListagemCondPgto.vOperacao = 1) then
  begin
    dm.sdsComandosSQL.CommandText := 'insert into CONDICAO_PAGAMENTO values(GEN_ID(GEN_COND_PGTO_ID,1), :DS_CONDPGTO, :NR_PARCELAS)';
    dm.sdsComandosSQL.ParamByName('DS_CONDPGTO').Text := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('NR_PARCELAS').Text := edtNrParcelas.Text;
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
    ShowMessage('Condição de pagamento cadastrado com sucesso!');
    close;
  end;
  if frmListagemCondPgto.vOperacao = 2 then
  begin
    dm.sdsComandosSQL.CommandText := 'update CONDICAO_PAGAMENTO set DS_CONDPGTO = :DS_CONDPGTO, NR_PARCELAS = :NR_PARCELAS where CD_CONDPGTO = :CD_CONDPGTO';
    dm.sdsComandosSQL.ParamByName('CD_CONDPGTO').Text := edtCodigo.Text;
    dm.sdsComandosSQL.ParamByName('DS_CONDPGTO').Text := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('NR_PARCELAS').Text  := edtNrParcelas.Text;
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
    ShowMessage('Condição de pagamento alterada com sucesso!');
    close;
  end;
end;

procedure TfrmCadastroCondPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   dm.sdsCondPgto.Close;
  if (frmListagemCondPgto.vOperacao = 1) or (frmListagemCondPgto.vOperacao = 2)then
  begin
    dm.cdsCondPgto.Close;
    dm.CdsCondPgto.Open;
  end;
end;

procedure TfrmCadastroCondPgto.FormShow(Sender: TObject);
begin
  inherited;
  if (frmListagemCondPgto.vOperacao = 1) or (frmPrincipal.vOperacao = 1) then
  begin
    edtCodigo.Clear;
    edtDescricao.Clear;
    edtNrParcelas.Clear;
  end;
  if frmListagemCondPgto.vOperacao = 2 then
  begin
    frmCadastroCondPgto.edtCodigo.Text     := dm.cdsCondPgto.FieldByName('CD_CONDPGTO').Text;
    frmCadastroCondPgto.edtDescricao.Text  := dm.cdsCondPgto.FieldByName('DS_CONDPGTO').Text;
    frmCadastroCondPgto.edtNrParcelas.Text := dm.cdsCondPgto.FieldByName('NR_PARCELAS').Text;
  end;

  dm.cdsCidade.Open;
end;

end.
