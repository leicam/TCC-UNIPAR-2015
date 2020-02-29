unit untBaixaContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmBaixaContasPagar = class(TfrmCadastro)
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCdConta: TEdit;
    edtCdPed: TEdit;
    edtDtVencimento: TEdit;
    edtDtFaturamento: TEdit;
    cboStatus: TComboBox;
    edtDtPaga: TEdit;
    edtFornecedor: TEdit;
    Label8: TLabel;
    edtNrParc: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtVlParcela: TEdit;
    edtAcrescimo: TEdit;
    edtVlPago: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtAcrescimoChange(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edtDtPagaKeyPress(Sender: TObject; var Key: Char);
    function formataMascaraData(var Key: char; Sender: TObject):string;
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaContasPagar: TfrmBaixaContasPagar;

implementation

{$R *.dfm}

uses untLstContasPagar, untDm;

procedure TfrmBaixaContasPagar.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmBaixaContasPagar.Close;
end;

procedure TfrmBaixaContasPagar.btSalvarClick(Sender: TObject);
begin
  inherited;
  if Trim(edtDtPaga.Text) = '' then
  begin
    ShowMessage('Obrigatorio informar data paga!');
    edtDtPaga.SetFocus;
    Exit;
  end;

  if StrToDate(trim(edtDtPaga.Text)) > Date then
  begin
    ShowMessage('Data paga não pode ser maior que a data atual!');
    edtDtPaga.SetFocus;
    Exit;
  end;
  if application.messagebox('Deseja realmente baixar fatura?','Contas a pagar',mb_yesno+mb_defbutton2)<>idno then
  begin
    try
      dm.sdsComandosSQL.CommandText := 'update CONTAS_PAGAR set VL_PAGO = :VL_PAGO, IN_STATUS = :IN_STATUS, DT_PAGA = :DT_PAGA where CD_CONTA = :CD_CONTA';
      dm.sdsComandosSQL.ParamByName('VL_PAGO').AsFloat := StrToFloat(edtVlPago.Text);
      dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'PAGA';
      dm.sdsComandosSQL.ParamByName('DT_PAGA').AsDate := StrToDate(edtDtPaga.Text);
      dm.sdsComandosSQL.ParamByName('CD_CONTA').AsInteger := StrToInt(edtCdConta.Text);
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsContasPagar.Close;
      dm.cdsContasPagar.Open;
      frmBaixaContasPagar.Close;
    except
      ShowMessage('Houve um erro de processo!');
      exit;
    end;
  end;

  ShowMessage('Fatura baixada com sucesso!');
  close;
end;

procedure TfrmBaixaContasPagar.edtAcrescimoChange(Sender: TObject);
begin
  inherited;
  try
    if trim(edtAcrescimo.Text) <> '' then
    begin
      edtVlPago.Text :=  FloatToStr(StrToFloat(edtVlParcela.Text) + StrToFloat(edtAcrescimo.Text));
    end;
  except
    ShowMessage('Valor informado inválido!');
    edtAcrescimo.Clear;
    edtVlPago.Text := edtVlParcela.Text;
    edtAcrescimo.SetFocus;
  end;

end;

procedure TfrmBaixaContasPagar.edtDtPagaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  formataMascaraData(key,sender);
end;

function TfrmBaixaContasPagar.formataMascaraData(var Key: char;
  Sender: TObject): string;
begin
if not(key in['0'..'9',#8,#13]) then
    key := #0;
  if key <> #8 then
  begin
    if key <> #13 then
       if Length(TCustomEdit(sender).Text) = 10 then
          TCustomEdit(sender).Clear;
    case Length(TCustomEdit(sender).Text) of
      2:begin
        if not (key in ['0'..'9']) then key := #0;
          TCustomEdit(sender).Text     := TCustomEdit(sender).Text + '/';
        TCustomEdit(sender).selstart := Length(TCustomEdit(sender).text);
      end;
      5:begin
        if not (key in ['0'..'9']) then key := #0;
          TCustomEdit(sender).Text     := TCustomEdit(sender).Text + '/';
        TCustomEdit(sender).selstart := Length(TCustomEdit(sender).text);
      end;
      10:begin
        if key <> #13 then
        begin
          TCustomEdit(sender).Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmBaixaContasPagar.FormShow(Sender: TObject);
begin
  inherited;
  btLimpar.Enabled := False;
  edtCdConta.Text       := dm.cdsContasPagar.FieldByName('CD_CONTA').Text;
  edtCdPed.Text         := dm.cdsContasPagar.FieldByName('CD_PEDIDO').Text;
  edtNrParc.Text        := dm.cdsContasPagar.FieldByName('NR_PARCELA').Text;
  edtDtFaturamento.Text := dm.cdsContasPagar.FieldByName('DT_CONTA').Text;
  edtDtVencimento.Text  := dm.cdsContasPagar.FieldByName('DT_VENCIMENTO').Text;
  edtFornecedor.Text    := dm.cdsContasPagar.FieldByName('DS_FANTASIA').Text;
  cboStatus.Text        := dm.cdsContasPagar.FieldByName('IN_STATUS').Text;
  edtVlParcela.Text     := dm.cdsContasPagar.FieldByName('VL_PARCELA').Text;
  edtVlPago.Text        := dm.cdsContasPagar.FieldByName('VL_PARCELA').Text;
  edtDtPaga.Text        := DateToStr(Date);
end;

end.
