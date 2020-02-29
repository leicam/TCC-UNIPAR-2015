unit untListagemFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListagemFornecedor = class(TfrmListagem)
    DBGrid1: TDBGrid;
    sdsFornecedor: TSQLDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    dsFornecedor: TDataSource;
    cdsFornecedorCD_FORNECEDOR: TIntegerField;
    cdsFornecedorDS_FANTASIA: TStringField;
    cdsFornecedorDS_ENDERECO: TStringField;
    cdsFornecedorDS_BAIRRO: TStringField;
    cdsFornecedorDS_EMAIL: TStringField;
    cdsFornecedorDS_OBSERVACAO: TStringField;
    cdsFornecedorNR_CNPJ: TStringField;
    cdsFornecedorNR_TELEFONE: TStringField;
    cdsFornecedorNR_CEP: TStringField;
    cdsFornecedorIN_STATUS: TStringField;
    cdsFornecedorCD_CIDADE: TIntegerField;
    cdsFornecedorNR_IS: TStringField;
    cdsFornecedorDT_CADASTRO: TDateField;
    cdsFornecedorDS_RAZAOSOCIAL: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     vOperacao  : byte;        // 1 = insert 2 = update
  end;

var
  frmListagemFornecedor: TfrmListagemFornecedor;

implementation

{$R *.dfm}

uses untDm, untCadastroFornecedor, untPedidoCompra, untRptPedCompra,
  untRptContasPagar;

procedure TfrmListagemFornecedor.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmCadastroFornecedor.ShowModal;
end;

procedure TfrmListagemFornecedor.btAlterarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 2;
  frmCadastroFornecedor.Caption := 'Alterar fornecedor';
  frmCadastroFornecedor.ShowModal;
end;

procedure TfrmListagemFornecedor.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if frmPedidoCompra.vOperacao = 1 then
   begin
    frmPedidoCompra.SQLFornecedor.SQL.Text := 'select * from FORNECEDOR where CD_FORNECEDOR = ' + IntToStr(DBGrid1.Columns[0].Field.Value);
    frmPedidoCompra.SQLFornecedor.Open;
    frmPedidoCompra.edtCdFornecedor.Text  := frmPedidoCompra.SQLFornecedor.FieldByName('CD_FORNECEDOR').AsString;
    frmPedidoCompra.edtDsFornecedor.Text  := frmPedidoCompra.SQLFornecedor.FieldByName('DS_FANTASIA').AsString;
    frmPedidoCompra.SQLFornecedor.Close;
    frmListagemFornecedor.Close;
   end
  else if frmRptPedCompra.vOperacao = 1 then
   begin
    frmRptPedCompra.SQLFornecedor.SQL.Text := 'select * from FORNECEDOR where CD_FORNECEDOR = ' + IntToStr(DBGrid1.Columns[0].Field.Value);
    frmRptPedCompra.SQLFornecedor.Open;
    frmRptPedCompra.edtCdFornecedor.Text  := frmRptPedCompra.SQLFornecedor.FieldByName('CD_FORNECEDOR').AsString;
    frmRptPedCompra.edtDsFornecedor.Text  := frmRptPedCompra.SQLFornecedor.FieldByName('DS_FANTASIA').AsString;
    frmRptPedCompra.SQLFornecedor.Close;
    frmListagemFornecedor.Close;
   end
  else if frmRptContasPagar.vOperacao = 1 then
   begin
    frmRptContasPagar.SQLFornecedor.SQL.Text := 'select * from FORNECEDOR where CD_FORNECEDOR = ' + IntToStr(DBGrid1.Columns[0].Field.Value);
    frmRptContasPagar.SQLFornecedor.Open;
    frmRptContasPagar.edtCdFornecedor.Text  := frmRptContasPagar.SQLFornecedor.FieldByName('CD_FORNECEDOR').AsString;
    frmRptContasPagar.edtDsFornecedor.Text  := frmRptContasPagar.SQLFornecedor.FieldByName('DS_FANTASIA').AsString;
    frmRptContasPagar.SQLFornecedor.Close;
    frmListagemFornecedor.Close;
   end
  else
   begin
    vOperacao := 2;
    frmCadastroFornecedor.Caption := 'Alterar fornecedor';
    frmCadastroFornecedor.ShowModal;
  end;
end;

procedure TfrmListagemFornecedor.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsFornecedor.Locate('DS_FANTASIA', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsFornecedor.Close;
end;

procedure TfrmListagemFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  cdsFornecedor.Close;
  cdsFornecedor.Open;
end;

end.
