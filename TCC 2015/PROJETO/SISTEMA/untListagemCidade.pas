unit untListagemCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TfrmListagemCidade = class(TfrmListagem)
    dsCidade: TDataSource;
    Panel2: TPanel;
    DBGridCidade: TDBGrid;
    procedure btAdicionarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure DBGridCidadeDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     vOperacao  : byte;        // 1 = insert 2 = update 3 = retorna dados
  end;

var
  frmListagemCidade: TfrmListagemCidade;

implementation

{$R *.dfm}

uses untDm, untCadastroCidade, untCadastroCliente, untCadastroFornecedor,
  untPrincipal;

procedure TfrmListagemCidade.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmCadastroCidade.ShowModal;
end;

procedure TfrmListagemCidade.btAlterarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 2;
  frmCadastroCidade.Caption := 'Alterar cidade';
  frmCadastroCidade.ShowModal;
end;

procedure TfrmListagemCidade.btRemoverClick(Sender: TObject);
begin
  inherited;
  try
    if(MessageDlg('Deseja excluir está cidade?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
         dm.sdsComandosSQL.CommandText := 'delete from CIDADE where CD_CIDADE = :CODIGO';
         dm.sdsComandosSQL.ParamByName('CODIGO').AsInteger := dm.cdsCidade.FieldByName('CD_CIDADE').AsInteger;
         dm.sdsComandosSQL.ExecSQL();
         dm.cdsCidade.Close;
         dm.cdsCidade.Open;
    end;
    Except
        Application.MessageBox('A cidade está vinculada a um processo!', 0);
    end;

    dm.cdsCidade.Close;
    dm.cdsCidade.Open;
end;

procedure TfrmListagemCidade.DBGridCidadeDblClick(Sender: TObject);
begin
  inherited;
  if frmCadastroCliente.vOperacao = 1 then
  begin
    frmCadastroCliente.edtCdCidade.Text := DBGridCidade.Fields[0].AsString;
    frmCadastroCliente.edtDsCidade.Text := DBGridCidade.Fields[1].AsString;
    frmCadastroCliente.edtUf.Text := DBGridCidade.Fields[2].AsString;
    frmListagemCidade.Close();
    Exit
  end;
  if(frmCadastroFornecedor.vOperacao = 1) then
  begin
    frmCadastroFornecedor.edtCdCidade.Text := DBGridCidade.Fields[0].AsString;
    frmCadastroFornecedor.edtDsCidade.Text := DBGridCidade.Fields[1].AsString;
    frmCadastroFornecedor.edtUf.Text := DBGridCidade.Fields[2].AsString;
    frmListagemCidade.Close();
    Exit;
  end;

  vOperacao := 2;
  frmCadastroCidade.Caption := 'Alterar cidade';
  frmCadastroCidade.ShowModal;
end;

procedure TfrmListagemCidade.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsCidade.Locate('DS_CIDADE', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsCidade.Close;
end;

procedure TfrmListagemCidade.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  dm.cdsCidade.Open;
end;

end.
