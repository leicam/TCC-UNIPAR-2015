unit untListagemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListagemServico = class(TfrmListagem)
    DBGrid1: TDBGrid;
    dsServico: TDataSource;
    procedure btAdicionarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPesquisarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update 3 = retorna dados
  end;

var
  frmListagemServico: TfrmListagemServico;

implementation

{$R *.dfm}

uses untDm, untCadastroServico, untOrdemServico;

procedure TfrmListagemServico.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmCadastroServico.ShowModal;
end;

procedure TfrmListagemServico.btAlterarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 2;
  frmCadastroServico.Caption := 'Alterar serviço';
  frmCadastroServico.ShowModal;
end;

procedure TfrmListagemServico.btRemoverClick(Sender: TObject);
begin
  inherited;
  try
     if(MessageDlg('Deseja excluir este serviço?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
     begin
          dm.sdsComandosSQL.CommandText := 'delete from SERVICO where CD_SERVICO = :CODIGO';
          dm.sdsComandosSQL.ParamByName('CODIGO').AsInteger := dm.cdsServico.FieldByName('CD_SERVICO').AsInteger;
          dm.sdsComandosSQL.ExecSQL();
          dm.cdsServico.Close;
          dm.cdsServico.Open;
     end;
     Except
         Application.MessageBox('O serviço está vinculado a um processo!', 0);
     end;

     dm.cdsServico.Close;
     dm.cdsServico.Open;
end;

procedure TfrmListagemServico.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if frmOrdemServico.vOperacao = 1 then
  begin
    frmOrdemServico.edtCdServico.Text := DBGrid1.Columns[0].Field.Text;
    frmOrdemServico.edtDsServico.Text := DBGrid1.Columns[1].Field.Text;
    frmOrdemServico.edtVlServico.Text := DBGrid1.Columns[3].Field.Text;
    frmListagemServico.Close;
  end
  else
  begin
    vOperacao := 2;
    frmCadastroServico.Caption := 'Alterar serviço';
    frmCadastroServico.ShowModal;
  end;

end;

procedure TfrmListagemServico.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsServico.Locate('DS_SERVICO', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsServico.Close;
end;

procedure TfrmListagemServico.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  dm.cdsServico.Open;
end;

end.
