unit untCadastroMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB;

type
  TfrmCadastroMaterial = class(TfrmCadastro)
    Label12: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    cboUnidade: TComboBox;
    edtValor: TEdit;
    dsCidade: TDataSource;
    procedure btLimparClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroMaterial: TfrmCadastroMaterial;

implementation

{$R *.dfm}

uses untPrincipal, untDm, untListagemMaterial;

procedure TfrmCadastroMaterial.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmCadastroMaterial.Close;
end;

procedure TfrmCadastroMaterial.btLimparClick(Sender: TObject);
begin
  inherited;
   edtCodigo.Clear;
   edtDescricao.Clear;
   edtValor.Clear;
   cboUnidade.Text := 'METRO';
   edtDescricao.SetFocus;
end;

procedure TfrmCadastroMaterial.btSalvarClick(Sender: TObject);
begin
  inherited;
   if trim(edtDescricao.Text)='' then
  begin
    ShowMessage('Campo descrição obrigatório!');
    edtDescricao.SetFocus;
    exit;
  end;

  if trim(edtValor.Text)='' then
  begin
    ShowMessage('Campo valor obrigatório!');
    edtValor.SetFocus;
    exit;
  end;

  if (frmPrincipal.vOperacao = 1) or (frmListagemMaterial.vOperacao = 1) then
  begin
    dm.sdsComandosSQL.CommandText := 'insert into MATERIAL values(GEN_ID(GEN_MATERIAL_ID,1), :DESCRICAO, :TP_VENDA, :VALOR)';
    dm.sdsComandosSQL.ParamByName('DESCRICAO').Text := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('TP_VENDA').Text  := cboUnidade.Text;
    dm.sdsComandosSQL.ParamByName('VALOR').AsFloat  := StrToFloat(edtValor.Text);
    dm.sdsComandosSQL.ExecSQL();
    dm.cdsMaterial.Close;
    dm.cdsMaterial.Open;
    ShowMessage('Material cadastrado com sucesso!');
    close;
  end;

  if frmListagemMaterial.vOperacao = 2 then
  begin
    dm.sdsComandosSQL.CommandText := 'update MATERIAL set DS_MATERIAL = :DESCRICAO, UN_MATERIAL = :TP_VENDA, VL_MATERIAL = :VALOR where CD_MATERIAL = :CODIGO';
    dm.sdsComandosSQL.ParamByName('CODIGO').Text    := edtCodigo.Text;
    dm.sdsComandosSQL.ParamByName('DESCRICAO').Text := edtDescricao.Text;
    dm.sdsComandosSQL.ParamByName('TP_VENDA').Text  := cboUnidade.Text;
    dm.sdsComandosSQL.ParamByName('VALOR').AsFloat  := StrToFloat(edtValor.Text);
    dm.sdsComandosSQL.ExecSQL();
    ShowMessage('Material alterado com sucesso!');
    dm.cdsMaterial.Close;
    dm.cdsMaterial.Open;
    close;
  end;

end;

procedure TfrmCadastroMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsMaterial.Close;
  if (frmListagemMaterial.vOperacao = 1) or (frmListagemMaterial.vOperacao = 2)then
  begin
    dm.cdsMaterial.Close;
    dm.cdsMaterial.Open;
  end;
end;

procedure TfrmCadastroMaterial.FormShow(Sender: TObject);
begin
  inherited;
  if (frmListagemMaterial.vOperacao = 1) or (frmPrincipal.vOperacao = 1) then
  begin
   edtCodigo.Clear;
   edtDescricao.Clear;
   edtValor.Clear;
   cboUnidade.Text := 'METRO';
  end;
  if frmListagemMaterial.vOperacao = 2 then
  begin
    frmCadastroMaterial.edtCodigo.Text    := dm.cdsMaterial.FieldByName('CD_MATERIAL').Text;
    frmCadastroMaterial.edtDescricao.Text := dm.cdsMaterial.FieldByName('DS_MATERIAl').Text;
    frmCadastroMaterial.cboUnidade.Text   := dm.cdsMaterial.FieldByName('UN_MATERIAL').Text;
    frmCadastroMaterial.edtValor.Text     := dm.cdsMaterial.FieldByName('VL_MATERIAL').Text;
  end;

  dm.cdsMaterial.Open;
end;

end.
