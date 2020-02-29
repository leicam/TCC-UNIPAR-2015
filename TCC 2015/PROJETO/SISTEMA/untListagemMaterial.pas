unit untListagemMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListagemMaterial = class(TfrmListagem)
    DBGrid1: TDBGrid;
    dsMaterial: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAdicionarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vOperacao  : byte;        // 1 = insert 2 = update 3 = retorna dados
  end;

var
  frmListagemMaterial: TfrmListagemMaterial;

implementation

{$R *.dfm}

uses untDm, untCadastroMaterial, untListagemPedCompra, untPedidoCompra,
  untOrdemServico;

procedure TfrmListagemMaterial.btAdicionarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 1;
  frmCadastroMaterial.ShowModal;
end;

procedure TfrmListagemMaterial.btAlterarClick(Sender: TObject);
begin
  inherited;
  vOperacao := 2;
  frmCadastroMaterial.Caption := 'Alterar material';
  frmCadastroMaterial.ShowModal;
end;

procedure TfrmListagemMaterial.btRemoverClick(Sender: TObject);
begin
  inherited;
  try
     if(MessageDlg('Deseja excluir este material?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
     begin
          dm.sdsComandosSQL.CommandText := 'delete from MATERIAL where CD_MATERIAL = :CODIGO';
          dm.sdsComandosSQL.ParamByName('CODIGO').AsInteger := dm.cdsMaterial.FieldByName('CD_MATERIAL').AsInteger;
          dm.sdsComandosSQL.ExecSQL();
          dm.cdsMaterial.Close;
          dm.cdsMaterial.Open;
     end;
     Except
         Application.MessageBox('O material está vinculado a um processo!', 0);
     end;

     dm.cdsMaterial.Close;
     dm.cdsMaterial.Open;
end;

procedure TfrmListagemMaterial.DBGrid1DblClick(Sender: TObject);
var
vCdMaterial : String;
begin
  inherited;
  if frmPedidoCompra.vOperacao = 1 then
  begin
    frmPedidoCompra.edtCdItem.Text := DBGrid1.Columns[0].Field.Text;
    frmPedidoCompra.edtDsItem.Text := DBGrid1.Columns[1].Field.Text;
    frmPedidoCompra.edtUndItem.Text := DBGrid1.Columns[2].Field.Text;
    frmPedidoCompra.edtVlItem.Text := DBGrid1.Columns[3].Field.Text;
    frmListagemMaterial.Close;
  end
  else if frmOrdemServico.vOperacao = 1 then
  begin
    frmOrdemServico.edtCdMaterial.Text := DBGrid1.Columns[0].Field.Text;
    frmOrdemServico.edtDsMaterial.Text := DBGrid1.Columns[1].Field.Text;
    frmOrdemServico.edtVlMaterial.Text := DBGrid1.Columns[3].Field.Text;
    frmListagemMaterial.Close;
  end
  else
  begin
    vOperacao := 2;
    frmCadastroMaterial.Caption := 'Alterar material';
    frmCadastroMaterial.ShowModal;
  end;
end;

procedure TfrmListagemMaterial.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  dm.cdsMaterial.Locate('DS_MATERIAL', edtPesquisar.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmListagemMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vOperacao := 0;
  dm.cdsMaterial.Close;
end;

procedure TfrmListagemMaterial.FormShow(Sender: TObject);
begin
  inherited;
  vOperacao := 0;
  dm.cdsMaterial.Open;
end;

end.
