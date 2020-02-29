unit untCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmCadastroCidade = class(TfrmCadastro)
    dsCidade: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    cboUf: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCidade: TfrmCadastroCidade;

implementation

{$R *.dfm}

uses untDm, untListagemCidade, untPrincipal;

procedure TfrmCadastroCidade.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmCadastroCidade.Close;
end;

procedure TfrmCadastroCidade.btLimparClick(Sender: TObject);
begin
  inherited;
  edtDescricao.Clear;
end;

procedure TfrmCadastroCidade.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtDescricao.Text)='' then
  begin
    ShowMessage('Campo descrição obrigatório!');
    edtDescricao.SetFocus;
    exit;
  end;

  if trim(cboUf.Text)='' then
  begin
    ShowMessage('Campo UF obrigatório!');
    cboUf.SetFocus;
    exit;
  end;

  if (frmPrincipal.vOperacao = 1) or (frmListagemCidade.vOperacao = 1) then
  begin
    dm.sdsComandosSQL.CommandText := 'insert into CIDADE values(GEN_ID(GEN_CIDADE_ID,1), :DESCRICAO, :UF)';
    dm.sdsComandosSQL.ParamByName('DESCRICAO').Text := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('UF').Text        := cboUf.Text;
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
    ShowMessage('Cidade cadastrada com sucesso!');
    close;
  end;

  if frmListagemCidade.vOperacao = 2 then
  begin
    dm.sdsComandosSQL.CommandText := 'update CIDADE set DS_CIDADE = :DESCRICAO, UF_CIDADE = :UF where CD_CIDADE = :CODIGO';
    dm.sdsComandosSQL.ParamByName('CODIGO').Text    := edtCodigo.Text;
    dm.sdsComandosSQL.ParamByName('DESCRICAO').Text := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('UF').Text        := cboUf.Text;
    dm.sdsComandosSQL.ExecSQL();
    ShowMessage('Cidade alterada com sucesso!');
    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
    close;
  end;

end;

procedure TfrmCadastroCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.sdsCidade.Close;
  if (frmListagemCidade.vOperacao = 1) or (frmListagemCidade.vOperacao = 2)then
  begin
    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
  end;
end;

procedure TfrmCadastroCidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_F2 then btLimpar.Click;
  If Key = VK_F3 then btSalvar.Click;
  If key = VK_F5 then btCancelar.Click;
end;

procedure TfrmCadastroCidade.FormShow(Sender: TObject);
begin
  inherited;
  if (frmListagemCidade.vOperacao = 1) or (frmPrincipal.vOperacao = 1) then
  begin
    edtCodigo.Clear;
    edtDescricao.Clear;
  end;
  if frmListagemCidade.vOperacao = 2 then
  begin
    frmCadastroCidade.edtCodigo.Text    := dm.cdsCidade.FieldByName('CD_CIDADE').Text;
    frmCadastroCidade.edtDescricao.Text := dm.cdsCidade.FieldByName('DS_CIDADE').Text;
    frmCadastroCidade.cboUf.Text        := dm.cdsCidade.FieldByName('UF_CIDADE').Text;
  end;

  dm.cdsCidade.Open;
end;

end.
