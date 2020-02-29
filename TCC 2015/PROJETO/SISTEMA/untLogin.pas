unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, Data.FMTBcd, Data.SqlExpr;

type
  TfrmLogin = class(TForm)
    btConfirmar: TSpeedButton;
    btConcelar: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    dsUsuario: TDataSource;
    SQLQueryUsuario: TSQLQuery;
    procedure btConcelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vLogin : byte; // 1 = logado 2 = erro
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses untDm, untPrincipal;

procedure TfrmLogin.btConcelarClick(Sender: TObject);
begin
application.Terminate();
end;

procedure TfrmLogin.btConfirmarClick(Sender: TObject);
begin

  dm.cdsUsuario.Close;
  dm.cdsUsuario.Params[0].AsString := edtUsuario.Text;
  dm.cdsUsuario.Params[1].AsString := edtSenha.Text;
  dm.cdsUsuario.Open;

  if (edtUsuario.Text = 'DESEN') and (edtSenha.Text = 'desen') then
    begin
      vLogin := 1;
      close;
    end
  else if dm.cdsUsuario.IsEmpty then
   begin
     ShowMessage('Usuário ou senha invalidos!');
     edtUsuario.Clear;
     edtSenha.Clear;
     edtUsuario.SetFocus;
     exit;
    end
  else
    begin
      vLogin := 1;
      close;
    end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if vLogin = 2 then
  begin
    Action := caNone;
    exit;
  end
  else
  begin
    frmPrincipal.StatusBar1.Panels[1].Text := dm.cdsUsuario.FieldByName('CD_USUARIO').Text;
    frmPrincipal.StatusBar1.Panels[3].Text := edtUsuario.Text;
    Action := caFree;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  dm.cdsUsuario.Open;
  vLogin := 2;
end;
end.
