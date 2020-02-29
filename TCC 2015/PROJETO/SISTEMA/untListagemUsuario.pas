unit untListagemUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Data.FMTBcd, Data.SqlExpr;

type
  TfrmListagemUsuario = class(TfrmListagem)
    DBGrid1: TDBGrid;
    dsUsuario: TDataSource;
    cdsUsuario: TClientDataSet;
    dspUsuario: TDataSetProvider;
    sdsUsuario: TSQLDataSet;
    procedure edtPesquisarChange(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     vOperacao  : byte;  // 1 = insert 2 = update
  end;

var
  frmListagemUsuario: TfrmListagemUsuario;

implementation

{$R *.dfm}

uses untDm, untCadastroUsuario;

procedure TfrmListagemUsuario.btAdicionarClick(Sender: TObject);
begin
  inherited;
   vOperacao := 1;
   frmCadastroUsuario.ShowModal;
end;

procedure TfrmListagemUsuario.btAlterarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 2;
  frmCadastroUsuario.Caption := 'Alterar usuário';
  frmCadastroUsuario.ShowModal;
end;

procedure TfrmListagemUsuario.edtPesquisarChange(Sender: TObject);
begin
  inherited;
   cdsUsuario.Locate('US_LOGIN', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsUsuario.Close;
end;

procedure TfrmListagemUsuario.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  cdsUsuario.Close;
  sdsUsuario.CommandText := 'select * from USUARIO';
  sdsUsuario.ExecSQL();
  cdsUsuario.Open;
end;

end.
