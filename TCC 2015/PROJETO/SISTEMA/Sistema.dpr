program Sistema;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untLogin in 'untLogin.pas' {frmLogin},
  untDm in 'untDm.pas' {dm: TDataModule},
  untCadastrar in 'untCadastrar.pas' {frmCadastro},
  untCadastroCidade in 'untCadastroCidade.pas' {frmCadastroCidade},
  untListagem in 'untListagem.pas' {frmListagem},
  untListagemCidade in 'untListagemCidade.pas' {frmListagemCidade},
  untCadastroUsuario in 'untCadastroUsuario.pas' {frmCadastroUsuario},
  untListagemUsuario in 'untListagemUsuario.pas' {frmListagemUsuario},
  untCadastroCliente in 'untCadastroCliente.pas' {frmCadastroCliente},
  untListagemCliente in 'untListagemCliente.pas' {frmListagemCliente},
  untCadastroFornecedor in 'untCadastroFornecedor.pas' {frmCadastroFornecedor},
  untListagemFornecedor in 'untListagemFornecedor.pas' {frmListagemFornecedor},
  untListagemMaterial in 'untListagemMaterial.pas' {frmListagemMaterial},
  untCadastroMaterial in 'untCadastroMaterial.pas' {frmCadastroMaterial},
  untListagemServico in 'untListagemServico.pas' {frmListagemServico},
  untCadastroServico in 'untCadastroServico.pas' {frmCadastroServico},
  untPedidoCompra in 'untPedidoCompra.pas' {frmPedidoCompra},
  untCadastroCondPgto in 'untCadastroCondPgto.pas' {frmCadastroCondPgto},
  untListagemCondPgto in 'untListagemCondPgto.pas' {frmListagemCondPgto},
  untListagemPedCompra in 'untListagemPedCompra.pas' {frmListagemPedCompra},
  untBaixaPedCompra in 'untBaixaPedCompra.pas' {frmBaixaPedCompra},
  untLstContasPagar in 'untLstContasPagar.pas' {frmLstContasPagar},
  untBaixaContasPagar in 'untBaixaContasPagar.pas' {frmBaixaContasPagar},
  untFuncoes in 'untFuncoes.pas' {funcoes},
  untOrdemServico in 'untOrdemServico.pas' {frmOrdemServico},
  untListagemOrdServico in 'untListagemOrdServico.pas' {frmLstOrdServico},
  untLstContasReceber in 'untLstContasReceber.pas' {frmLstContasReceber},
  untBaixaFatura in 'untBaixaFatura.pas' {frmBaixaFatura},
  untRptContasReceber in 'untRptContasReceber.pas' {frmRptContasReceber},
  untRelatorio in 'untRelatorio.pas' {frmRelatorio},
  untRptPedCompra in 'untRptPedCompra.pas' {frmRptPedCompra},
  untRptContasPagar in 'untRptContasPagar.pas' {frmRptContasPagar},
  untRptOrdemServico in 'untRptOrdemServico.pas' {frmRptOrdemServico},
  untBackup in 'untBackup.pas' {frmBackup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TfrmCadastroCidade, frmCadastroCidade);
  Application.CreateForm(TfrmListagem, frmListagem);
  Application.CreateForm(TfrmListagemCidade, frmListagemCidade);
  Application.CreateForm(TfrmCadastroUsuario, frmCadastroUsuario);
  Application.CreateForm(TfrmListagemUsuario, frmListagemUsuario);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TfrmListagemCliente, frmListagemCliente);
  Application.CreateForm(TfrmCadastroFornecedor, frmCadastroFornecedor);
  Application.CreateForm(TfrmListagemFornecedor, frmListagemFornecedor);
  Application.CreateForm(TfrmListagemMaterial, frmListagemMaterial);
  Application.CreateForm(TfrmCadastroMaterial, frmCadastroMaterial);
  Application.CreateForm(TfrmListagemServico, frmListagemServico);
  Application.CreateForm(TfrmCadastroServico, frmCadastroServico);
  Application.CreateForm(TfrmPedidoCompra, frmPedidoCompra);
  Application.CreateForm(TfrmCadastroCondPgto, frmCadastroCondPgto);
  Application.CreateForm(TfrmListagemCondPgto, frmListagemCondPgto);
  Application.CreateForm(TfrmListagemPedCompra, frmListagemPedCompra);
  Application.CreateForm(TfrmBaixaPedCompra, frmBaixaPedCompra);
  Application.CreateForm(TfrmLstContasPagar, frmLstContasPagar);
  Application.CreateForm(TfrmBaixaContasPagar, frmBaixaContasPagar);
  Application.CreateForm(Tfuncoes, funcoes);
  Application.CreateForm(TfrmOrdemServico, frmOrdemServico);
  Application.CreateForm(TfrmLstOrdServico, frmLstOrdServico);
  Application.CreateForm(TfrmLstContasReceber, frmLstContasReceber);
  Application.CreateForm(TfrmBaixaFatura, frmBaixaFatura);
  Application.CreateForm(TfrmRptContasReceber, frmRptContasReceber);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.CreateForm(TfrmRptPedCompra, frmRptPedCompra);
  Application.CreateForm(TfrmRptContasPagar, frmRptContasPagar);
  Application.CreateForm(TfrmRptOrdemServico, frmRptOrdemServico);
  Application.CreateForm(TfrmBackup, frmBackup);
  Application.Run;
end.
