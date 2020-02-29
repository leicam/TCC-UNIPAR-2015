unit untListagemPedCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListagemPedCompra = class(TfrmListagem)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsPedCompra: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update 3 = retorna dados
  end;

var
  frmListagemPedCompra: TfrmListagemPedCompra;

implementation

{$R *.dfm}

uses untDm, untPedidoCompra;

procedure TfrmListagemPedCompra.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmPedidoCompra.ShowModal;
end;

procedure TfrmListagemPedCompra.btAlterarClick(Sender: TObject);
begin
  inherited;
  if(DBGrid1.Columns[3].Field.Value <> 'ATENDIDO') then
  begin
    vOperacao := 2;
    frmPedidoCompra.Caption := 'Alterar pedido de compra';
    frmPedidoCompra.ShowModal;
  end
  else
  begin
    ShowMessage('Pedido não pode ser alterado!');
  end;
end;

procedure TfrmListagemPedCompra.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsPedCompra.Locate('DS_FANTASIA', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemPedCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsPedCompra.Close;
end;

procedure TfrmListagemPedCompra.FormShow(Sender: TObject);
begin
  inherited;
    dm.cdsPedCompra.Open;
end;

end.
