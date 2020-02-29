unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    menu: TMainMenu;
    Manuteno1: TMenuItem;
    Cidade1: TMenuItem;
    Cadastrar1: TMenuItem;
    Listagem1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor1: TMenuItem;
    Cadastar1: TMenuItem;
    Listagem2: TMenuItem;
    Cadastrar2: TMenuItem;
    Listagem3: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Image1: TImage;
    btCidade: TSpeedButton;
    btCliente: TSpeedButton;
    btFornecedor: TSpeedButton;
    Processo1: TMenuItem;
    OrdemServio1: TMenuItem;
    ContasaPagar1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Usurio1: TMenuItem;
    Cadastrar3: TMenuItem;
    Listagem5: TMenuItem;
    Material1: TMenuItem;
    Cadastro1: TMenuItem;
    Listagem6: TMenuItem;
    Servio1: TMenuItem;
    Cadastro2: TMenuItem;
    Listagem7: TMenuItem;
    PedidodeCompra1: TMenuItem;
    Condpgto1: TMenuItem;
    Cadastro3: TMenuItem;
    Listagem8: TMenuItem;
    L1: TMenuItem;
    Listagem9: TMenuItem;
    Listagemcontasapagar1: TMenuItem;
    Manuteno2: TMenuItem;
    Listagem10: TMenuItem;
    Listagemcontasareceber1: TMenuItem;
    Despesa1: TMenuItem;
    Relatrios1: TMenuItem;
    Pedidodecompra2: TMenuItem;
    Contasareceber2: TMenuItem;
    Contasapagar2: TMenuItem;
    Ordemdeservio1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btCidadeClick(Sender: TObject);
    procedure Cadastrar1Click(Sender: TObject);
    procedure Listagem1Click(Sender: TObject);
    procedure Cadastrar3Click(Sender: TObject);
    procedure Listagem5Click(Sender: TObject);
    procedure Cadastar1Click(Sender: TObject);
    procedure btClienteClick(Sender: TObject);
    procedure Listagem2Click(Sender: TObject);
    procedure btFornecedorClick(Sender: TObject);
    procedure Listagem3Click(Sender: TObject);
    procedure Cadastrar2Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Listagem6Click(Sender: TObject);
    procedure Cadastro2Click(Sender: TObject);
    procedure Listagem7Click(Sender: TObject);
    procedure Cadastro3Click(Sender: TObject);
    procedure Listagem8Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure Listagem9Click(Sender: TObject);
    procedure Listagemcontasapagar1Click(Sender: TObject);
    procedure Manuteno2Click(Sender: TObject);
    procedure Listagem10Click(Sender: TObject);
    procedure Listagemcontasareceber1Click(Sender: TObject);
    procedure Pedidodecompra2Click(Sender: TObject);
    procedure Contasareceber2Click(Sender: TObject);
    procedure Contasapagar2Click(Sender: TObject);
    procedure Ordemdeservio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao : byte; // 1 = insert
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untLogin, untCadastroCidade, untListagemCidade, untCadastroUsuario,
  untListagemUsuario, untDm, untCadastroCliente, untListagemCliente,
  untCadastroFornecedor, untListagemFornecedor, untListagemMaterial,
  untCadastroMaterial, untCadastroServico, untListagemServico, untPedidoCompra,
  untCadastroCondPgto, untListagemCondPgto, untListagemPedCompra,
  untLstContasPagar, untOrdemServico, untListagemOrdServico,
  untLstContasReceber, untRptPedCompra, untRptContasReceber, untRptContasPagar,
  untRptOrdemServico;

procedure TfrmPrincipal.btCidadeClick(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroCidade.ShowModal;
end;

procedure TfrmPrincipal.btClienteClick(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroCliente.ShowModal;
end;

procedure TfrmPrincipal.btFornecedorClick(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroFornecedor.ShowModal;
end;

procedure TfrmPrincipal.Cadastar1Click(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroCliente.ShowModal;
end;

procedure TfrmPrincipal.Cadastrar1Click(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroCidade.ShowModal;
end;

procedure TfrmPrincipal.Cadastrar2Click(Sender: TObject);
begin
  frmCadastroFornecedor.ShowModal;
end;

procedure TfrmPrincipal.Cadastrar3Click(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroUsuario.cboTpUsuario.Text := 'Padrão';
  frmCadastroUsuario.ShowModal;
end;

procedure TfrmPrincipal.Cadastro1Click(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroMaterial.ShowModal;
end;

procedure TfrmPrincipal.Cadastro2Click(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroServico.ShowModal;
end;

procedure TfrmPrincipal.Cadastro3Click(Sender: TObject);
begin
  vOperacao := 1;
  frmCadastroCondPgto.ShowModal;
end;

procedure TfrmPrincipal.Contasapagar2Click(Sender: TObject);
begin
  frmRptContasPagar.ShowModal;
end;

procedure TfrmPrincipal.Contasareceber2Click(Sender: TObject);
begin
  frmRptContasReceber.ShowModal;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  vOperacao := 0;
  frmLogin.ShowModal();
end;

procedure TfrmPrincipal.L1Click(Sender: TObject);
begin
  vOperacao := 1;
  frmPedidoCompra.ShowModal;
end;

procedure TfrmPrincipal.Listagem10Click(Sender: TObject);
begin
frmLstOrdServico.ShowModal;
end;

procedure TfrmPrincipal.Listagem1Click(Sender: TObject);
begin
  frmListagemCidade.ShowModal;
end;

procedure TfrmPrincipal.Listagem2Click(Sender: TObject);
begin
  vOperacao := 0;
  frmListagemCliente.ShowModal;
end;

procedure TfrmPrincipal.Listagem3Click(Sender: TObject);
begin
  frmListagemFornecedor.ShowModal;
end;

procedure TfrmPrincipal.Listagem5Click(Sender: TObject);
begin
  frmListagemUsuario.ShowModal;
end;

procedure TfrmPrincipal.Listagem6Click(Sender: TObject);
begin
  frmListagemMaterial.ShowModal;
end;

procedure TfrmPrincipal.Listagem7Click(Sender: TObject);
begin
  frmListagemServico.ShowModal;
end;

procedure TfrmPrincipal.Listagem8Click(Sender: TObject);
begin
  frmListagemCondPgto.ShowModal;
end;

procedure TfrmPrincipal.Listagem9Click(Sender: TObject);
begin
  frmListagemPedCompra.ShowModal;
end;

procedure TfrmPrincipal.Listagemcontasapagar1Click(Sender: TObject);
begin
  frmLstContasPagar.ShowModal;
end;

procedure TfrmPrincipal.Listagemcontasareceber1Click(Sender: TObject);
begin
frmLstContasReceber.ShowModal;
end;

procedure TfrmPrincipal.Manuteno2Click(Sender: TObject);
begin
vOperacao := 1;
frmOrdemServico.ShowModal;
end;

procedure TfrmPrincipal.Ordemdeservio1Click(Sender: TObject);
begin
frmRptOrdemServico.ShowModal;
end;

procedure TfrmPrincipal.Pedidodecompra2Click(Sender: TObject);
begin
  frmRptPedCompra.ShowModal;
end;

end.
