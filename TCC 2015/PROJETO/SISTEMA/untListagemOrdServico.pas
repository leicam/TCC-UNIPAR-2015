unit untListagemOrdServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TfrmLstOrdServico = class(TfrmListagem)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsOrdemServico: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAlterarClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update 3 = retorna dados
  end;

var
  frmLstOrdServico: TfrmLstOrdServico;

implementation

{$R *.dfm}

uses untDm, untOrdemServico, untPrincipal;

procedure TfrmLstOrdServico.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmPrincipal.vOperacao := 0;
  frmOrdemServico.ShowModal;
end;

procedure TfrmLstOrdServico.btAlterarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 2;
  frmPrincipal.vOperacao := 0;
  frmOrdemServico.ShowModal;
end;

procedure TfrmLstOrdServico.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsOrdemServico.Locate('DS_NOME', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmLstOrdServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vOperacao := 0;
  dm.cdsOrdemServico.Close
end;

procedure TfrmLstOrdServico.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  dm.cdsOrdemServico.Open;
end;

end.
