unit untBaixaFatura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls, Data.FMTBcd,
  Data.SqlExpr;

type
  TfrmBaixaFatura = class(TfrmCadastro)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsAmortizacao: TDataSource;
    Label3: TLabel;
    Label1: TLabel;
    edtVlBaixar: TEdit;
    cboTpDocumento: TComboBox;
    SQLAmortizacao: TSQLQuery;
    Label2: TLabel;
    edtCdConta: TEdit;
    Label4: TLabel;
    edtVlTotal: TEdit;
    Label5: TLabel;
    edtVlRestante: TEdit;
    btExtorno: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btExtornoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vCdConta : String;
    vVlTotal : Double;
    vVlTotalRecebido : Double;
  end;

var
  frmBaixaFatura: TfrmBaixaFatura;

implementation

{$R *.dfm}

uses untDm, untLstContasReceber;

procedure TfrmBaixaFatura.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmBaixaFatura.Close;
end;

procedure TfrmBaixaFatura.btExtornoClick(Sender: TObject);
var
vVlEstornar : Double;
vCdAmortizacao :String;
vCdConta : String;
begin
  inherited;
  vCdConta := DBGrid1.Columns[0].Field.Text;
  vCdAmortizacao := DBGrid1.Columns[1].Field.Text;
  vVlEstornar := StrToFloat(DBGrid1.Columns[2].Field.Text);

  if vCdAmortizacao = '' then
  begin
    ShowMessage('Processo não permitido!');
    Exit;
  end;

  if application.messagebox('Deseja realmente estornar valor?','Contas a receber',mb_yesno+mb_defbutton2)<>idno then
  begin
    try

      SQLAmortizacao.SQL.Text := 'select sum(VL_RECEBIDO) as VL_TOTALRECEBIDO from AMORTIZACAO where CD_CONTA = ' + vCdConta;
      SQLAmortizacao.Open;
      vVlTotalRecebido := SQLAmortizacao.FieldByName('VL_TOTALRECEBIDO').AsFloat;
      vVlTotalRecebido := vVlTotalRecebido - vVlEstornar;

      dm.sdsComandosSQL.CommandText := 'update CONTAS_RECEBER set  VL_TOTALRECEBIDO = :VL_TOTALRECEBIDO where CD_CONTA =' + vCdConta;
      dm.sdsComandosSQL.ParamByName('VL_TOTALRECEBIDO').AsFloat := vVlTotalRecebido;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsContasReceber.Close;
      dm.cdsContasReceber.Open;

      dm.sdsComandosSQL.CommandText := 'delete from AMORTIZACAO where CD_AMORTIZACAO = ' + vCdAmortizacao + 'and CD_CONTA = ' + vCdConta;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsAmortizacao.Close;
      dm.sdsAmortizacao.ParamByName('CD_CONTA').Text := edtCdConta.Text;
      dm.cdsAmortizacao.Open;

      SQLAmortizacao.SQL.Text := 'select sum(VL_RECEBIDO) as VL_TOTALRECEBIDO from AMORTIZACAO where CD_CONTA = ' + vCdConta;
      SQLAmortizacao.Open;
      vVlTotalRecebido := SQLAmortizacao.FieldByName('VL_TOTALRECEBIDO').AsFloat;

      edtVlRestante.Text := FloatToStr(vVlTotal - vVlTotalRecebido);

      if vVlTotalRecebido <> vVlTotal then
      begin
        dm.sdsComandosSQL.CommandText := 'update CONTAS_RECEBER set  IN_STATUS = :IN_STATUS, DT_FINALIZADA = :DT_FINALIZADA where CD_CONTA =' + edtCdConta.Text;
        dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'EM ABERTO';
        dm.sdsComandosSQL.ParamByName('DT_FINALIZADA').AsDate := Date;
        dm.sdsComandosSQL.ExecSQL();
        dm.cdsContasReceber.Close;
        dm.cdsContasReceber.Open;

        btSalvar.Enabled := True;
        edtVlBaixar.Enabled := True;
        end
      else begin
        edtVlBaixar.SetFocus;
      end;
    except
      ShowMessage('Ocorreu um erro de processo!');
      Exit;
    end;
  end;
  ShowMessage('Estorno realizado com sucesso!');
  edtVlBaixar.Clear;
end;

procedure TfrmBaixaFatura.btLimparClick(Sender: TObject);
begin
  inherited;
  edtVlBaixar.Clear;
  edtVlBaixar.SetFocus;
end;

procedure TfrmBaixaFatura.btSalvarClick(Sender: TObject);
begin
  inherited;
  if trim(edtVlBaixar.Text) = '' then
  begin
    ShowMessage('Valor a baixar não informado!');
    Exit;
  end;
  if StrToFloat(trim(edtVlBaixar.Text)) < 0 then
  begin
    ShowMessage('Valor informado inválido!');
    edtVlBaixar.Clear;
    edtVlBaixar.SetFocus;
    Exit;
  end;

  if application.messagebox('Deseja realmente baixar valor?','Contas a receber',mb_yesno+mb_defbutton2)<>idno then
  begin
    try
      SQLAmortizacao.SQL.Text := 'select sum(VL_RECEBIDO) as VL_TOTALRECEBIDO from AMORTIZACAO where CD_CONTA = ' + vCdConta;
      SQLAmortizacao.Open;
      vVlTotalRecebido := SQLAmortizacao.FieldByName('VL_TOTALRECEBIDO').AsFloat;
      vVlTotalRecebido := vVlTotalRecebido + StrToFloat(edtVlBaixar.Text);

      if vVlTotalRecebido > vVlTotal then //vVlTotal é uma variavel utilizada em todo o codigo
      begin
        ShowMessage('Valor informado para a baixa inválido!');
        edtVlBaixar.Clear;
        edtVlBaixar.SetFocus;
        Exit;
      end;

      dm.sdsComandosSQL.CommandText := 'update CONTAS_RECEBER set  VL_TOTALRECEBIDO = :VL_TOTALRECEBIDO where CD_CONTA =' + edtCdConta.Text;
      dm.sdsComandosSQL.ParamByName('VL_TOTALRECEBIDO').AsFloat := vVlTotalRecebido;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsContasReceber.Close;
      dm.cdsContasReceber.Open;

      dm.sdsComandosSQL.CommandText := 'insert into AMORTIZACAO values (GEN_ID(GEN_AMORTIZACAO_ID,1), :CD_CONTA, :VL_RECEBIDO, :DT_RECEBIDO, :TP_DOCUMENTO)';
      dm.sdsComandosSQL.ParamByName('CD_CONTA').AsInteger := StrToInt(Trim(vCdConta));
      dm.sdsComandosSQL.ParamByName('VL_RECEBIDO').AsFloat := StrToFloat(edtVlBaixar.Text);
      dm.sdsComandosSQL.ParamByName('DT_RECEBIDO').AsDate := Date;
      dm.sdsComandosSQL.ParamByName('TP_DOCUMENTO').Text := cboTpDocumento.Text;
      dm.sdsComandosSQL.ExecSQL();
      dm.cdsAmortizacao.Close;
      dm.sdsAmortizacao.ParamByName('CD_CONTA').Text := edtCdConta.Text;
      dm.cdsAmortizacao.Open;

      SQLAmortizacao.SQL.Text := 'select sum(VL_RECEBIDO) as VL_TOTALRECEBIDO from AMORTIZACAO where CD_CONTA = ' + vCdConta;
      SQLAmortizacao.Open;
      vVlTotalRecebido := SQLAmortizacao.FieldByName('VL_TOTALRECEBIDO').AsFloat;

      edtVlRestante.Text := FloatToStr(vVlTotal - vVlTotalRecebido);

      if vVlTotalRecebido = vVlTotal then
      begin
        dm.sdsComandosSQL.CommandText := 'update CONTAS_RECEBER set  IN_STATUS = :IN_STATUS, DT_FINALIZADA = :DT_FINALIZADA where CD_CONTA =' + edtCdConta.Text;
        dm.sdsComandosSQL.ParamByName('IN_STATUS').Text := 'FINALIZADA';
        dm.sdsComandosSQL.ParamByName('DT_FINALIZADA').AsDate := Date;
        dm.sdsComandosSQL.ExecSQL();
        dm.cdsContasReceber.Close;
        dm.cdsContasReceber.Open;

        btSalvar.Enabled := False;
        edtVlBaixar.Enabled := False;
        end
      else begin
        edtVlBaixar.SetFocus;
      end;
    except
      ShowMessage('Ocorreu um erro de processo!');
    end;
  end;

  ShowMessage('Valor baixado com sucesso!');
  edtVlBaixar.Clear;
end;

procedure TfrmBaixaFatura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  edtCdConta.Clear;
  edtVlBaixar.Clear;
  dm.cdsAmortizacao.Close;
  dm.cdsContasReceber.Close;
  dm.cdsContasReceber.Open;
end;

procedure TfrmBaixaFatura.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
  begin
    btLimpar.Click;
  end;

  if Key = vk_f3 then
  begin
    btSalvar.Click;
  end;

  if Key = vk_f10 then
  begin
    btExtorno.Click;
  end;

  if Key = vk_f11 then
  begin
    btCancelar.Click;
  end;
end;

procedure TfrmBaixaFatura.FormShow(Sender: TObject);
begin
  inherited;
  vCdConta := frmLstContasReceber.DBGrid1.Columns[0].Field.Value;
  vVlTotal := frmLstContasReceber.DBGrid1.Columns[5].Field.Value;
  edtCdConta.Text := vCdConta;
  edtVlTotal.Text := FloatToStr(vVlTotal);

  SQLAmortizacao.SQL.Text := 'select sum(VL_RECEBIDO) as VL_TOTALRECEBIDO from AMORTIZACAO where CD_CONTA = ' + vCdConta;
  SQLAmortizacao.Open;
  vVlTotalRecebido := SQLAmortizacao.FieldByName('VL_TOTALRECEBIDO').AsFloat;

  edtVlRestante.Text := FloatToStr(vVlTotal - vVlTotalRecebido);

  dm.cdsAmortizacao.Close;
  dm.sdsAmortizacao.ParamByName('CD_CONTA').Text := edtCdConta.Text;
  dm.cdsAmortizacao.Open;

  if trim(frmLstContasReceber.vDsStatus) <> 'EM ABERTO' then
  begin
    btSalvar.Enabled := False;
    edtVlBaixar.Enabled := False;
  end;
end;

end.
