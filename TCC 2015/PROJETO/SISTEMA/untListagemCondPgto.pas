unit untListagemCondPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListagemCondPgto = class(TfrmListagem)
    dsCondPgto: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    procedure btAdicionarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update 3 = retorna dados
  end;

var
  frmListagemCondPgto: TfrmListagemCondPgto;

implementation

{$R *.dfm}

uses untDm, untCadastroCondPgto, untPedidoCompra;

procedure TfrmListagemCondPgto.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmCadastroCondPgto.ShowModal;
end;

procedure TfrmListagemCondPgto.btAlterarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 2;
  frmCadastroCondPgto.Caption := 'Alterar condição de pagamento';
  frmCadastroCondPgto.ShowModal;
end;

procedure TfrmListagemCondPgto.btRemoverClick(Sender: TObject);
begin
  inherited;
  try
    if(MessageDlg('Deseja excluir está condição de pagamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
         dm.sdsComandosSQL.CommandText := 'delete from CONDICAO_PAGAMENTO where CD_CONDPGTO = :CODIGO';
         dm.sdsComandosSQL.ParamByName('CODIGO').AsInteger := dm.cdsCondPgto.FieldByName('CD_CONDPGTO').AsInteger;
         dm.sdsComandosSQL.ExecSQL();
         dm.cdsCondPgto.Close;
         dm.cdsCondPgto.Open;
    end;
    Except
        Application.MessageBox('A condição de pagamento está vinculada a um processo!', 0);
    end;

    dm.cdsCondPgto.Close;
    dm.cdsCondPgto.Open;
end;

procedure TfrmListagemCondPgto.DBGrid1DblClick(Sender: TObject);
var
vCdCondPgto : String;
begin
  inherited;
  if frmPedidoCompra.vOperacao = 1 then
  begin
    vCdCondPgto := DBGrid1.Columns[0].Field.Value;
    frmPedidoCompra.SQLCondPgto.SQL.Text := 'select * from CONDICAO_PAGAMENTO where CD_CONDPGTO =' + vCdCondPgto;
    frmPedidoCompra.SQLCondPgto.Open;
    frmPedidoCompra.edtCdCondPgto.Text  := frmPedidoCompra.SQLCondPgto.FieldByName('CD_CONDPGTO').Text;
    frmPedidoCompra.edtDsCondPgto.Text  := frmPedidoCompra.SQLCondPgto.FieldByName('DS_CONDPGTO').AsString;
    frmPedidoCompra.edtNrParcelas.Text  := frmPedidoCompra.SQLCondPgto.FieldByName('NR_PARCELAS').Text;
    frmPedidoCompra.SQLCondPgto.Close;
    frmListagemCondPgto.Close;
    end
  else
  begin
    vOperacao := 2;
    frmCadastroCondPgto.Caption := 'Alterar condição de pagamento';
    frmCadastroCondPgto.ShowModal;
  end;
end;

procedure TfrmListagemCondPgto.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsCondPgto.Locate('DS_CONDPGTO', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemCondPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsCondPgto.Close;
end;

procedure TfrmListagemCondPgto.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  dm.cdsCondPgto.Open;
end;

end.
