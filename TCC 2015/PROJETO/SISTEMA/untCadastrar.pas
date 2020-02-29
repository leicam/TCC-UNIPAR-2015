unit untCadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastro = class(TForm)
    Panel1: TPanel;
    btSalvar: TSpeedButton;
    btLimpar: TSpeedButton;
    btCancelar: TSpeedButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.FormKeyUp(Sender: TObject; var Key: Word;
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

  if Key = vk_f11 then
  begin
    btCancelar.Click;
  end;
end;

end.
