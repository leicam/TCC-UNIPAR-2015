unit untLstContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untListagem, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB;

type
  TfrmLstContasReceber = class(TfrmListagem)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsContasReceber: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    vDsStatus : String;
    { Public declarations }
  end;

var
  frmLstContasReceber: TfrmLstContasReceber;

implementation

{$R *.dfm}

uses untDm, untBaixaFatura;

procedure TfrmLstContasReceber.btAlterarClick(Sender: TObject);
begin
  inherited;
   vDsStatus := DBGrid1.Columns[4].Field.Value;
   frmBaixaFatura.ShowModal;
end;

procedure TfrmLstContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsContasReceber.Open;
end;

procedure TfrmLstContasReceber.FormShow(Sender: TObject);
begin
  inherited;
  dm.cdsContasReceber.Open;
end;

end.
