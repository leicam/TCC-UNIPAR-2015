unit untLstContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLstContasPagar = class(TfrmListagem)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsContasPagar: TDataSource;
    btExtorno: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExtornoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update 3 = retorna dados
  end;

var
  frmLstContasPagar: TfrmLstContasPagar;

implementation

{$R *.dfm}

uses untDm, untBaixaContasPagar;

procedure TfrmLstContasPagar.btAlterarClick(Sender: TObject);
begin
  inherited;
  if(trim(dm.cdsContasPagar.FieldByName('IN_STATUS').Text) = 'EM ABERTO') then
  begin
    frmBaixaContasPagar.ShowModal;
  end
  else
  begin
    ShowMessage('Situação da fatura não permite baixa!');
  end;
end;

procedure TfrmLstContasPagar.btExtornoClick(Sender: TObject);
var
vCdConta : String;
begin
  inherited;
  if application.messagebox('Deseja realmente estornar fatura?','Contas a pagar',mb_yesno+mb_defbutton2)<>idno then
  begin
    try
      vCdConta := DBGrid1.Columns[0].Field.Text;;
      dm.sdsComandosSQL.CommandText := 'update CONTAS_PAGAR set VL_PAGO = null, IN_STATUS = :IN_STATUS, DT_PAGA = null where CD_CONTA = ' + vCdConta;
      dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'EM ABERTO';
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsContasPagar.Close;
      dm.cdsContasPagar.Open;
    except
      ShowMessage('Houve um erro de processo!');
      exit;
    end;
  end;
  ShowMessage('Estorno realizado com sucesso!');
end;

procedure TfrmLstContasPagar.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsContasPagar.Locate('DS_FANTASIA', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmLstContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsContasPagar.Close;
end;

procedure TfrmLstContasPagar.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f5 then
  begin
    btAdicionar.Click;
  end;

  if Key = vk_f8 then
  begin
    btRemover.Click;
  end;

  if Key = vk_f10 then
  begin
    btExtorno.Click;
  end;

  if Key = vk_f12 then
  begin
    btAlterar.Click;
  end;
end;

procedure TfrmLstContasPagar.FormShow(Sender: TObject);
begin
  inherited;
  dm.cdsContasPagar.Open;
  btAdicionar.Enabled := False;
  btRemover.Enabled := False;
end;

end.
