unit untRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet;

type
  TfrmRelatorio = class(TForm)
    frxPedCompra: TfrxReport;
    frxDBPedCompra: TfrxDBDataset;
    frxDBPedCompra2: TfrxDBDataset;
    frxDBItemCompra: TfrxDBDataset;
    frxContasReceber: TfrxReport;
    frxDBContasReceber: TfrxDBDataset;
    frxContasPagar: TfrxReport;
    frxDBContasPagar: TfrxDBDataset;
    frxOrdemServico: TfrxReport;
    frxDBOrdemServico: TfrxDBDataset;
    frxPedCompra2: TfrxReport;
    frxOrdemServico2: TfrxReport;
    frxDBOrdemServico2: TfrxDBDataset;
    frxDBMaterialOrdserv: TfrxDBDataset;
    frxDBServicoOrdemServ: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses untDm, untRptPedCompra, untPedidoCompra, untRptContasReceber,
  untRptContasPagar, untRptOrdemServico, untOrdemServico;

end.
