unit untListagemCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TfrmListagemCliente = class(TfrmListagem)
    dsCliente: TDataSource;
    sdsCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    cdsClienteCD_CLIENTE: TIntegerField;
    cdsClienteDT_CADASTRO: TDateField;
    cdsClienteDS_NOME: TStringField;
    cdsClienteDS_ENDERECO: TStringField;
    cdsClienteDS_BAIRRO: TStringField;
    cdsClienteDS_EMAIL: TStringField;
    cdsClienteDS_OBSERVACAO: TStringField;
    cdsClienteNR_CPF: TStringField;
    cdsClienteNR_RG: TStringField;
    cdsClienteNR_TELEFONE: TStringField;
    cdsClienteNR_CEP: TStringField;
    cdsClienteIN_STATUS: TStringField;
    cdsClienteCD_CIDADE: TIntegerField;
    cdsClienteDT_NASCIMENTO: TDateField;
    procedure FormShow(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmListagemCliente: TfrmListagemCliente;

implementation

{$R *.dfm}

uses untDm, untCadastroCliente, untOrdemServico, untPrincipal,
  untRptContasReceber, untRptOrdemServico;

procedure TfrmListagemCliente.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmCadastroCliente.ShowModal;
end;

procedure TfrmListagemCliente.btAlterarClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.vOperacao := 0;
  vOperacao := 2;
  frmCadastroCliente.Caption := 'Alterar cliente';
  frmCadastroCliente.ShowModal;
end;

procedure TfrmListagemCliente.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if frmOrdemServico.vOperacao = 1 then
  begin
    frmOrdemServico.edtCdCliente.Text := DBGrid1.Columns[0].Field.Text;
    frmOrdemServico.edtDsCliente.Text := DBGrid1.Columns[1].Field.Text;
    frmListagemCliente.Close;
    end
  else if frmRptContasReceber.vOperacao = 1 then
  begin
    frmRptContasReceber.edtCdCliente.Text := DBGrid1.Columns[0].Field.Text;
    frmRptContasReceber.edtDsCliente.Text := DBGrid1.Columns[1].Field.Text;
    frmListagemCliente.Close;
    end
  else if frmRptOrdemServico.vOperacao = 1 then
  begin
    frmRptOrdemServico.edtCdCliente.Text := DBGrid1.Columns[0].Field.Text;
    frmRptOrdemServico.edtDsCliente.Text := DBGrid1.Columns[1].Field.Text;
    frmListagemCliente.Close;
    end
  else
  begin
    vOperacao := 2;
    frmCadastroCliente.Caption := 'Alterar cliente';
    frmCadastroCliente.ShowModal;
  end;
end;

procedure TfrmListagemCliente.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  cdsCliente.Locate('DS_NOME', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemCliente.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  cdsCliente.Close;
  sdsCliente.CommandText := 'select * from CLIENTE';
  sdsCliente.ExecSQL();
  cdsCliente.Open;
end;

end.
