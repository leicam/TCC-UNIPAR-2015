unit untBaixaPedCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.StdCtrls, Datasnap.DBClient,
  Datasnap.Provider;

type
  TfrmBaixaPedCompra = class(TfrmCadastro)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsItemCompra: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    edtCdItem: TEdit;
    edtDsItem: TEdit;
    edtQuantidade: TEdit;
    cdsItemCompra: TClientDataSet;
    dspItemCompra: TDataSetProvider;
    btQtRecebida: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsItemCompraAfterScroll(DataSet: TDataSet);
    procedure btQtRecebidaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vPedido  : integer;
  end;

var
  frmBaixaPedCompra: TfrmBaixaPedCompra;

implementation

{$R *.dfm}

uses untDm, untPedidoCompra;

procedure TfrmBaixaPedCompra.btQtRecebidaClick(Sender: TObject);
var
vQtPedido : Double;
vQtPedAtendia : Double;
begin
  inherited;
    if trim(edtQuantidade.Text) = '0' then
    begin
      ShowMessage('Informe uma quantidade!');
      exit;
    end;

    if trim(edtQuantidade.Text) <> '' then
    begin
      frmPedidoCompra.SQLItemCompra.SQL.Clear;
      frmPedidoCompra.SQLItemCompra.SQL.Text := 'select sum(QT_ITEM) as QT_TOTALITEM from ITEM_COMPRA where CD_PEDIDO =' + IntToStr(vPedido) + 'and CD_MATERIAL =' + edtCdItem.Text;
      frmPedidoCompra.SQLItemCompra.Open;
      vQtPedido := frmPedidoCompra.SQLItemCompra.FieldByName('QT_TOTALITEM').AsFloat;

      frmPedidoCompra.SQLItemCompra.SQL.Clear;
      frmPedidoCompra.SQLItemCompra.SQL.Text := 'select sum(QT_RECEBIDA) as QT_TOTRECEBIDA from ITEM_COMPRA where CD_PEDIDO =' + IntToStr(vPedido)+ 'and CD_MATERIAL =' + edtCdItem.Text;
      frmPedidoCompra.SQLItemCompra.Open;
      vQtPedAtendia := frmPedidoCompra.SQLItemCompra.FieldByName('QT_TOTRECEBIDA').AsFloat;
      frmPedidoCompra.SQLItemCompra.SQL.Clear;

      vQtPedAtendia := vQtPedAtendia + StrToFloat(edtQuantidade.Text);

      if(vQtPedAtendia <= vQtPedido) then
      begin
        dm.sdsComandosSQL.CommandText := 'update ITEM_COMPRA set QT_RECEBIDA = :QT_RECEBIDA where CD_PEDIDO = :CD_PEDIDO and CD_MATERIAL = :CD_MATERIAL';
        dm.sdsComandosSQL.ParamByName('CD_PEDIDO').AsInteger := vPedido;
        dm.sdsComandosSQL.ParamByName('CD_MATERIAL').AsInteger := StrToInt(edtCdItem.Text);
        dm.sdsComandosSQL.ParamByName('QT_RECEBIDA').AsFloat := vQtPedAtendia;
        dm.sdsComandosSQL.ExecSQL();
        dm.cdsItemCompra.Close;
        dm.sdsItemCompra.ParamByName('CD_PEDIDO').AsInteger := vPedido;
        dm.cdsItemCompra.Open;
      end
      else
      begin
        ShowMessage('Quantidade informada maior que a quantidade solicitada!');
        Exit;
      end;

      if vQtPedido = vQtPedAtendia then
      begin
        dm.sdsComandosSQL.CommandText := 'update PEDIDO_COMPRA set IN_STATUS = :IN_STATUS where CD_PEDIDO = :CD_PEDIDO';
        dm.sdsComandosSQL.ParamByName('CD_PEDIDO').AsInteger := vPedido;
        dm .sdsComandosSQL.ParamByName('IN_STATUS').Text := 'ATENDIDO';
        dm.sdsComandosSQL.ExecSQL();
        dm.cdsPedCompra.Close;
        dm.cdsPedCompra.Open;
        frmPedidoCompra.cboStatus.Text := 'ATENDIDO';
        ShowMessage('O pedido está atendido!');
        end
      else
      begin
        dm.sdsComandosSQL.CommandText := 'update PEDIDO_COMPRA set IN_STATUS = :IN_STATUS where CD_PEDIDO = :CD_PEDIDO';
        dm.sdsComandosSQL.ParamByName('CD_PEDIDO').AsInteger := vPedido;
        dm .sdsComandosSQL.ParamByName('IN_STATUS').Text := 'PARCIALMENTE ATEND.';
        dm.sdsComandosSQL.ExecSQL();
        dm.cdsPedCompra.Close;
        dm.cdsPedCompra.Open;
        frmPedidoCompra.cboStatus.Text := 'PARCIALMENTE ATEND.';
      end;

      frmPedidoCompra.edtCdItem.Enabled := False;
      frmPedidoCompra.btItem.Enabled := False;
      frmPedidoCompra.edtQuantidade.Enabled := False;
      frmPedidoCompra.btRemover.Enabled := False;
      frmPedidoCompra.edtDesconto.Enabled := False;

      cdsItemCompra.Close;
      dm.sdsItemCompra.ParamByName('CD_PEDIDO').AsInteger := vPedido;
      cdsItemCompra.Open;

      if trim(frmPedidoCompra.cboStatus.Text) = 'ATENDIDO' then
      begin
        close;
      end;
    end
  else
  begin
      ShowMessage('Quantidade não informada!');
      edtQuantidade.SetFocus;
  end;
end;

procedure TfrmBaixaPedCompra.cdsItemCompraAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edtCdItem.Text := DBGrid1.Columns[1].Field.Text;
  edtDsItem.Text := DBGrid1.Columns[2].Field.Text;
end;

procedure TfrmBaixaPedCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vPedido := 0;
  cdsItemCompra.Close;
end;

procedure TfrmBaixaPedCompra.FormShow(Sender: TObject);
begin
  inherited;
  vPedido := StrToInt(frmPedidoCompra.edtCodigo.Text);
  cdsItemCompra.Close;
  dm.sdsItemCompra.ParamByName('CD_PEDIDO').Text := IntToStr(vPedido);
  cdsItemCompra.Open;
  edtCdItem.Text := DBGrid1.Columns[1].Field.Text;
  edtDsItem.Text := DBGrid1.Columns[2].Field.Text;
  edtQuantidade.Text := '0';
end;

end.
