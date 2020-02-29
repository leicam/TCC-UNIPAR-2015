unit untListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmListagem = class(TForm)
    Panel1: TPanel;
    btAdicionar: TSpeedButton;
    btRemover: TSpeedButton;
    Label1: TLabel;
    edtPesquisar: TEdit;
    btAlterar: TSpeedButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagem: TfrmListagem;

implementation

{$R *.dfm}

procedure TfrmListagem.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
  begin
    btAdicionar.Click;
  end;

  if Key = vk_f8 then
  begin
    btRemover.Click;
  end;

  if Key = vk_f12 then
  begin
    btAlterar.Click;
  end;
end;

end.
