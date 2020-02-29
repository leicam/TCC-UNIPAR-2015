unit untCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastrar, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrmCadastroUsuario = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    cboTpUsuario: TComboBox;
    SQLUsuario: TSQLQuery;
    procedure btLimparClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vTpUsuario : byte; // 0 = adm 1 = padrão
  end;

var
  frmCadastroUsuario: TfrmCadastroUsuario;

implementation

{$R *.dfm}

uses untPrincipal, untDm, untListagemUsuario, untListagemCidade;

procedure TfrmCadastroUsuario.btCancelarClick(Sender: TObject);
begin
  inherited;
  frmCadastroUsuario.Close;
end;

procedure TfrmCadastroUsuario.btLimparClick(Sender: TObject);
begin
  inherited;
  edtLogin.Clear;
  edtSenha.Clear;
end;

procedure TfrmCadastroUsuario.btSalvarClick(Sender: TObject);
  var vAuxiliar : Integer;
begin
  inherited;
  if trim(edtLogin.Text)='' then
  begin
    ShowMessage('Campo login obrigatório!');
    edtLogin.SetFocus;
    exit;
  end;

  if trim(edtLogin.Text)='DESEN' then
  begin
    ShowMessage('Este login, não pode ser utilizado!');
    edtLogin.SetFocus;
    exit;
  end;

  if trim(edtSenha.Text)='' then
  begin
    ShowMessage('Campo senha obrigatório!');
    edtSenha.SetFocus;
    exit;
  end;

  if trim(cboTpUsuario.Text)='' then
  begin
    ShowMessage('Campo tipo usuário obrigatório!');
    cboTpUsuario.SetFocus;
    exit;
  end;
  frmListagemUsuario.cdsUsuario.Close;
  frmListagemUsuario.sdsUsuario.CommandText := 'select * from USUARIO where US_LOGIN = :USUARIO';
  frmListagemUsuario.sdsUsuario.ParamByName('USUARIO').Text := edtLogin.Text;
  vAuxiliar := frmListagemUsuario.sdsUsuario.ExecSQL();
  frmListagemUsuario.cdsUsuario.Open;

  if frmListagemUsuario.cdsUsuario.IsEmpty then
  begin
     if (frmPrincipal.vOperacao = 1) or (frmListagemUsuario.vOperacao = 1) then
     begin
       dm.sdsComandosSQL.CommandText := 'insert into USUARIO values(GEN_ID(GEN_USUARIO_ID,2), :LOGIN, :SENHA, :TP_USUARIO)';
       dm.sdsComandosSQL.ParamByName('LOGIN').Text      := edtLogin.Text;
       dm.sdsComandosSQL.ParamByName('SENHA').Text      := edtSenha.Text;
       dm.sdsComandosSQL.ParamByName('TP_USUARIO').Text := cboTpUsuario.Text;
       dm.sdsComandosSQL.ExecSQL();
       frmListagemUsuario.cdsUsuario.Close;
       frmListagemUsuario.cdsUsuario.Open;
       ShowMessage('Usuário cadastrado com sucesso!');
       close;
     end
     else
     if frmListagemUsuario.vOperacao = 2 then
     begin
      dm.sdsComandosSQL.CommandText := 'update USUARIO set US_LOGIN = :LOGIN, US_SENHA = :SENHA, TP_USUARIO = :TP_USUARIO where CD_USUARIO = :CODIGO';
      dm.sdsComandosSQL.ParamByName('CODIGO').Text     := edtCodigo.Text;
      dm.sdsComandosSQL.ParamByName('LOGIN').Text      := edtLogin.Text;
      dm.sdsComandosSQL.ParamByName('SENHA').Text      := edtSenha.Text;
      dm.sdsComandosSQL.ParamByName('TP_USUARIO').Text := cboTpUsuario.Text;
      dm.sdsComandosSQL.ExecSQL();
      frmListagemUsuario.cdsUsuario.Close;
      frmListagemUsuario.cdsUsuario.Open;
       ShowMessage('Usuário alterado com sucesso!');
      close;
     end;
  end
  else
    if (frmPrincipal.vOperacao = 1) or (frmListagemUsuario.vOperacao = 1) then
    begin
       ShowMessage('Login de usuário já cadastrado!');
        EdtLogin.Clear;
        edtLogin.SetFocus;
        exit;
    end
    else
    begin
      if frmListagemUsuario.vOperacao = 2 then
        begin
          dm.sdsComandosSQL.CommandText := 'update USUARIO set US_LOGIN = :LOGIN, US_SENHA = :SENHA, TP_USUARIO = :TP_USUARIO where CD_USUARIO = :CODIGO';
          dm.sdsComandosSQL.ParamByName('CODIGO').Text     := edtCodigo.Text;
          dm.sdsComandosSQL.ParamByName('LOGIN').Text      := edtLogin.Text;
          dm.sdsComandosSQL.ParamByName('SENHA').Text      := edtSenha.Text;
          dm.sdsComandosSQL.ParamByName('TP_USUARIO').Text := cboTpUsuario.Text;
          dm.sdsComandosSQL.ExecSQL();
          frmListagemUsuario.cdsUsuario.Close;
          frmListagemUsuario.cdsUsuario.Open;
           ShowMessage('Usuário alterado com sucesso!');
          close;
      end;
    end;
  end;
procedure TfrmCadastroUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmListagemUsuario.cdsUsuario.Close;
  if (frmListagemUsuario.vOperacao = 1) or (frmListagemUsuario.vOperacao = 2)then
  begin
    frmListagemUsuario.cdsUsuario.Close;
    frmListagemUsuario.cdsUsuario.Open;
  end;
end;

procedure TfrmCadastroUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_F2 then btLimpar.Click;
  If Key = VK_F3 then btSalvar.Click;
  If key = VK_F5 then btCancelar.Click;
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
var
vCdUsuario : Integer;
vTpUsuario : String;
begin
  inherited;
  if trim(frmPrincipal.StatusBar1.Panels[3].Text) <> 'DESEN' then
  begin
    vCdUsuario := StrToInt(trim(frmPrincipal.StatusBar1.Panels[1].Text));
    SQLUsuario.SQL.Text := 'select * from USUARIO where CD_USUARIO =' + IntToStr(vCdUsuario);
    SQLUsuario.Open;
    vTpUsuario := SQLUsuario.FieldByName('TP_USUARIO').Text;

    if trim(vTpUsuario) <> 'ADMINISTRADOR' then
    begin
        ShowMessage('Usuário sem permissão de acesso!');
        PostMessage(frmCadastroUsuario.Handle, WM_CLOSE, 0, 0);
    end;
  end;

  if frmListagemUsuario.vOperacao = 1 then
  begin
    edtCodigo.Clear;
    edtLogin.Clear;
    edtSenha.Clear;
    cboTpUsuario.Text := 'ADMINISTRADOR';
  end;
  if frmListagemUsuario.vOperacao = 2 then
  begin
    frmCadastroUsuario.edtCodigo.Text    := frmListagemUsuario.cdsUsuario.FieldByName('CD_USUARIO').Text;
    frmCadastroUsuario.edtLogin.Text     := frmListagemUsuario.cdsUsuario.FieldByName('US_LOGIN').Text;
    frmCadastroUsuario.edtSenha.Text     := frmListagemUsuario.cdsUsuario.FieldByName('US_SENHA').Text;
    frmCadastroUsuario.cboTpUsuario.Text := frmListagemUsuario.cdsUsuario.FieldByName('TP_USUARIO').Text;
  end;
   dm.cdsUsuario.Open;
end;

end.
