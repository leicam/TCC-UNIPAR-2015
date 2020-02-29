unit untCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untCadastro, Vcl.ImgList,
  acAlphaImageList, Vcl.StdCtrls, sButton, Vcl.ExtCtrls, sPanel, sLabel,
  Vcl.Mask, sEdit, IdBaseComponent, IdComponent, IdTCPConnection, Clipbrd, IdTCPClient,
  IdHTTP;

type
  TfrmCadastroCliente = class(TfrmCadastro)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel16: TsLabel;
    edtId: TsEdit;
    edtNome: TsEdit;
    edtFantasia: TsEdit;
    edtRg: TsEdit;
    edtCpf: TsEdit;
    edtCnpj: TsEdit;
    GroupBox1: TGroupBox;
    sLabel10: TsLabel;
    sLabel18: TsLabel;
    sLabel3: TsLabel;
    edtComplemento: TsEdit;
    edtLogradouro: TsEdit;
    edtMunicipio: TsEdit;
    edtUf: TsEdit;
    sLabel17: TsLabel;
    sLabel11: TsLabel;
    sLabel9: TsLabel;
    edtBairro: TsEdit;
    GroupBox2: TGroupBox;
    sLabel14: TsLabel;
    edtEmail: TsEdit;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sLabel15: TsLabel;
    edtMidia: TsEdit;
    btnPesquisa: TsButton;
    IdHTTP1: TIdHTTP;
    edtCep: TMaskEdit;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    Label1: TLabel;
    edtDtNasc: TMaskEdit;
    Label2: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtCpf1Exit(Sender: TObject);
    procedure edtCnpjExit(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure edtCpfKeyPress(Sender: TObject; var Key: Char);
    procedure edtCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure edtDtNascExit(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    function isCPF(CPF: string): boolean;
    function imprimeCPF(CPF: string): string;
    function isCNPJ(CNPJ: string): boolean;
    function imprimeCNPJ(CNPJ: string): string;
    Function FormataCNPJ(Numero: String): String;
    Function FormataCNPJ_CPF(Numero: String): String;
    Function FormataCPF(Numero: String): String;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

uses untListagemCliente, dm, untAlerta;

//FUNÇÃO FORMATAR CNPJ
Function TfrmCadastroCliente.FormataCNPJ(Numero: String): String;
var
   tmp,resultado: String;
   indx, indx1: integer;
begin
     if Length(Numero) < 12 Then
        begin
        result := '';
        exit;
        end;

     for indx := 1 to Length(Numero) do
         begin
         if Numero[indx] in ['0'..'9'] Then
              resultado := resultado + Numero[indx];
         end;
     if Length(Resultado) < 14 Then
        resultado := StringOfChar('0', 14 - Length(Resultado)) + resultado;
     tmp := Copy(resultado,1,2) + '.';
     tmp := tmp + Copy(resultado,3,3) + '.';
     tmp := tmp + Copy(resultado,6,3) + '/';
     tmp := tmp + Copy(resultado,9,4) + '-' + Copy(resultado,13,2);
     Result := tmp;
end;

Function TfrmCadastroCliente.FormataCNPJ_CPF(Numero: String): String;
var
   indx, tamanho: integer;
   resultado: String;
begin
     for indx := 1 to Length(Numero) do
         begin
         if Numero[indx] in ['0'..'9'] Then
              resultado := resultado + Numero[indx];
         end;

     if (Length(resultado) > 11) Then
        resultado := FormataCNPJ(resultado)
     else
         resultado := FormataCPF(resultado);
     result := resultado;
end;

Function TfrmCadastroCliente.FormataCPF(Numero: String): String;
var
   tmp,resultado: String;
   indx, indx1: integer;
begin
     if Length(Numero) < 10 Then
        begin
        result := '';
        exit;
        end;

     for indx := 1 to Length(Numero) do
         begin
         if Numero[indx] in ['0'..'9'] Then
              resultado := resultado + Numero[indx];
         end;
     if Length(Resultado) < 11 Then
        resultado := StringOfChar('0', 11 - Length(Resultado)) + resultado;
     tmp := Copy(resultado,1,3) + '.';
     tmp := tmp + Copy(resultado,4,3) + '.';
     tmp := tmp + Copy(resultado,7,3) + '-';
     tmp := tmp + Copy(resultado,10,2);
     Result := tmp;
end;


//FUNÇÃO PARA VALIDAR CNPJ
function TfrmCadastroCliente.isCNPJ(CNPJ: string): boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
      (length(CNPJ) <> 14))
     then begin
            isCNPJ := false;
            exit;
          end;

// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
    else str((11-r):1, dig14);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14]))
       then isCNPJ := true
    else isCNPJ := false;
  except
    isCNPJ := false
  end;
end;

function TfrmCadastroCliente.imprimeCNPJ(CNPJ: string): string;
begin
{ máscara do CNPJ: 99.999.999.9999-99 }
  imprimeCNPJ := copy(CNPJ, 1, 2) + '.' + copy(CNPJ, 3, 3) + '.' +
    copy(CNPJ, 6, 3) + '.' + copy(CNPJ, 9, 4) + '-' + copy(CNPJ, 13, 2);
end;

//FUNÇÃO PARA VALIDAR CPF
function TfrmCadastroCliente.isCPF(CPF: string): boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CPF (CPF é um número formado por 11 dígitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then begin
            isCPF := false;
            exit;
          end;

// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-ésimo caractere do CPF em um número
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then isCPF := true
    else isCPF := false;
  except
    isCPF := false
  end;
end;

procedure TfrmCadastroCliente.edtDtNascExit(Sender: TObject);
begin
  inherited;
if edtDtNasc.Text <> '  /  /    ' then
  begin
try

  StrToDate(edtDtNasc.Text);
  if StrToDate(edtDtNasc.Text) > StrToDate(DateToStr(Now)) then
  begin
    edtDtNasc.SetFocus;
    frmAlerta.lbMensagem.Caption := 'Data Inválida';
    frmAlerta.Color := $000080FF;
    frmAlerta.ShowModal;
  end;


except
//on EConvertError do
  edtDtNasc.SetFocus;
  frmAlerta.lbMensagem.Caption := 'Data Inválida';
  frmAlerta.Color := $000080FF;
  frmAlerta.ShowModal;

end;
  end;
end;

procedure TfrmCadastroCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
Const
especiais = '0123456789<>!@#$%¨&*()_-+={}[]?;:,.|/*"çÇ~^´`¨âÂàÀãÃéÉêÊèÈíÍîÎìÌæÆôòûùø£ØƒáÁóúñÑªº¿®½¼ÓßÔÒõÕµþÚÛÙýÝ';//caracteres especiais que sql não aceita
Var
Str : String;
begin
  inherited;
    Str := key;
    if (Pos(Str,especiais)<>0) or (Str = '''') Then
      begin
      key:= #0;
      end
      else if key = #0 then
      begin
        edtId.SetFocus;
      end;
      if Key = #22 then Key := #0;
end;

procedure TfrmCadastroCliente.edtNomeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
 if Button = mbRight then
   Clipboard.AsText := '';
end;

function TfrmCadastroCliente.imprimeCPF(CPF: string): string;
begin
  imprimeCPF := copy(CPF, 1, 3) + '.' + copy(CPF, 4, 3) + '.' +
    copy(CPF, 7, 3) + '-' + copy(CPF, 10, 2);
end;

procedure TfrmCadastroCliente.btnLimparClick(Sender: TObject);
begin
  inherited;
    edtId.Clear;
    edtNome.Clear;
    edtCpf.Clear;
    edtCnpj.Clear;
    edtRg.Clear;
    edtBairro.Clear;
    edtMunicipio.Clear;
    edtCep.Clear;
    edtTelefone.Clear;
    edtCelular.Clear;
    edtEmail.Clear;
    edtMidia.Clear;
    edtFantasia.Clear;
    edtUf.Clear;
    edtComplemento.Clear;
    edtLogradouro.Clear;
    edtNome.SetFocus;
    edtCpf.Enabled := true;
    edtCnpj.Enabled := true;
    edtNome.SetFocus;
    frmListagemCliente.op := 1;

end;

procedure TfrmCadastroCliente.btnPesquisaClick(Sender: TObject);
var
lodados: TStringList;
begin
  inherited;
  //Cria-se uma string List
  lodados:=TStringList.Create;
  //Nesta linha busca-se a informação através da url indicada
  //StrinReplace eh utilizada para substituir os caracteres & por CR
  //UrlDecode eh para eliminar caracteres de código html para acentos
  //&formato=query_string ou xml javascript
  //ele retorna para o componente em qualquer um dos formatos acima

   lodados.text:=stringreplace(idhttp1.URL.URLDecode(idhttp1.Get('http://republicavirtual.com.br/web_cep.php?cep='+edtCep.text+'&formato=query_string')),'&',#13#10,[rfreplaceAll]);
  //lodados vira uma matriz e fazemos o acesso aos dados...
  edtLogradouro.text:=lodados.Values['TIPO_LOGRADOURO']+' '+lodados.Values['LOGRADOURO'];
  edtBairro.text:=lodados.Values['BAIRRO'];
  edtMunicipio.text:=lodados.Values['CIDADE'];
  edtUf.text:=lodados.Values['UF'];

  edtMunicipio.Text := StringReplace(edtMunicipio.Text, '+', ' ',  [rfReplaceAll, rfIgnoreCase]);
  edtLogradouro.Text := StringReplace(edtLogradouro.Text, '+', ' ',  [rfReplaceAll, rfIgnoreCase]);
  edtBairro.Text := StringReplace(edtBairro.Text, '+', ' ',  [rfReplaceAll, rfIgnoreCase]);
end;

procedure TfrmCadastroCliente.btnSalvarClick(Sender: TObject);
var
sql:String;
begin
  inherited;
if (trim(edtNome.Text) <> '') and (trim(edtMunicipio.Text) <> '') and (trim(edtLogradouro.Text) <> '') then
begin
if frmListagemCliente.op=1 then
   begin
dm2.cdsCliente.Last;
     frmListagemCliente.seq := dm2.cdsCliente.FieldByName('id_cliente').AsInteger;
     dm2.banco.StartTransaction(dm2.Transacao);
     sql:='insert into cliente (id_cliente, ds_cliente, cpf, cnpj, rg, bairro, municipio, cep, uf, complemento, logradouro, telefone, celular, email, midiasocial, nomefantasia)'+'values (:id, :nome, :cpf, :cnpj, :rg, :bairro, :municipio, :cep, :uf, :complemento, :logradouro, :telefone, :celular, :email, :midiasocial, :nomefantasia)';
     dm2.sdsComandoSql.CommandText := sql;
     dm2.sdsComandoSql.ParamByName('id').AsInteger := frmListagemCliente.seq+1;
     dm2.sdsComandoSql.ParamByName('nome').Text := edtNome.Text;
     dm2.sdsComandoSql.ParamByName('cpf').Text := edtCpf.Text;
     dm2.sdsComandoSql.ParamByName('cnpj').Text := edtCnpj.Text;
     dm2.sdsComandoSql.ParamByName('rg').Text := edtRg.Text;
     dm2.sdsComandoSql.ParamByName('bairro').Text := edtBairro.Text;
     dm2.sdsComandoSql.ParamByName('municipio').Text := edtMunicipio.Text;
     dm2.sdsComandoSql.ParamByName('cep').Text := edtCep.Text;
     dm2.sdsComandoSql.ParamByName('uf').Text := edtUf.Text;
     dm2.sdsComandoSql.ParamByName('complemento').Text := edtComplemento.Text;
     dm2.sdsComandoSql.ParamByName('logradouro').Text := edtLogradouro.Text;
     dm2.sdsComandoSql.ParamByName('telefone').Text := edtTelefone.Text;
     dm2.sdsComandoSql.ParamByName('celular').Text := edtCelular.Text;
     dm2.sdsComandoSql.ParamByName('email').Text := edtEmail.Text;
     dm2.sdsComandoSql.ParamByName('midiasocial').Text := edtMidia.Text;
     dm2.sdsComandoSql.ParamByName('nomefantasia').Text := edtFantasia.Text;
     dm2.sdsComandoSql.ExecSQL();
     dm2.cdsCliente.Close;
     dm2.cdsCliente.Open;
 //SÓ INSERE DATA DE NASCIMENTO SE A MASCARA FOR DIFERENTE DE VAZIO (DEU TRABALHO PRA PENSAR NISSO --')
     if edtDtNasc.Text <> '  /  /    ' then
     begin
     dm2.sdsComandoSql.CommandText := 'update cliente set dt_nasc = :dt where id_cliente = :id';
     dm2.sdsComandoSql.ParamByName('id').AsInteger := frmListagemCliente.seq+1;
     dm2.sdsComandoSql.ParamByName('dt').AsDate := StrToDate(edtDtNasc.Text);
     dm2.sdsComandoSql.ExecSQL();
     dm2.cdsCliente.Close;
     dm2.cdsCliente.Open;
     end;
 dm2.banco.Commit(dm2.transacao);

      frmAlerta.lbMensagem.Caption := 'Gravação efetuada com sucesso';
      frmAlerta.Color := clGreen;
      frmAlerta.ShowModal;
      edtId.Text := IntToStr(frmListagemCliente.seq+1);
      frmListagemCliente.op:=2;

   end
   else if frmListagemCliente.op=2 then
   begin
   dm2.banco.StartTransaction(dm2.Transacao);

     dm2.sdsComandoSql.CommandText := 'update cliente set ds_cliente = :nome, cpf = :cpf, cnpj = :cnpj, rg = :rg, bairro = :bairro, municipio = :municipio, cep = :cep, uf = :uf,'+'complemento = :complemento, logradouro = :logradouro, telefone = :telefone, celular = :celular, email = :email, midiasocial = :midiasocial, nomefantasia = :nomefantasia where id_cliente = :id';
     dm2.sdsComandoSql.ParamByName('id').Text := edtId.Text;
     dm2.sdsComandoSql.ParamByName('nome').Text := edtNome.Text;
     dm2.sdsComandoSql.ParamByName('cpf').Text := edtCpf.Text;
     dm2.sdsComandoSql.ParamByName('cnpj').Text := edtCnpj.Text;
     dm2.sdsComandoSql.ParamByName('rg').Text := edtRg.Text;
     dm2.sdsComandoSql.ParamByName('bairro').Text := edtBairro.Text;
     dm2.sdsComandoSql.ParamByName('municipio').Text := edtMunicipio.Text;
     dm2.sdsComandoSql.ParamByName('cep').Text := edtCep.Text;
     dm2.sdsComandoSql.ParamByName('uf').Text := edtUf.Text;
     dm2.sdsComandoSql.ParamByName('complemento').Text := edtComplemento.Text;
     dm2.sdsComandoSql.ParamByName('logradouro').Text := edtLogradouro.Text;
     dm2.sdsComandoSql.ParamByName('telefone').Text := edtTelefone.Text;
     dm2.sdsComandoSql.ParamByName('celular').Text := edtCelular.Text;
     dm2.sdsComandoSql.ParamByName('email').Text := edtEmail.Text;
     dm2.sdsComandoSql.ParamByName('midiasocial').Text := edtMidia.Text;
     dm2.sdsComandoSql.ParamByName('nomefantasia').Text := edtFantasia.Text;
     dm2.sdsComandoSql.ExecSQL();
     dm2.cdsCliente.Close;
     dm2.cdsCliente.Open;

     if edtDtNasc.Text <> '  /  /    ' then
     begin
     dm2.sdsComandoSql.CommandText := 'update cliente set dt_nasc = :dt where id_cliente = :id';
     dm2.sdsComandoSql.ParamByName('id').Text := edtId.Text;
     dm2.sdsComandoSql.ParamByName('dt').AsDate := StrToDate(edtDtNasc.Text);
     dm2.sdsComandoSql.ExecSQL();
     dm2.cdsCliente.Close;
     dm2.cdsCliente.Open;
     end;

     dm2.banco.Commit(dm2.transacao);

      frmAlerta.lbMensagem.Caption := 'Gravação efetuada com sucesso';
      frmAlerta.Color := clGreen;
      frmAlerta.ShowModal;
   end;
end
   else
begin
  frmAlerta.lbMensagem.Caption := 'Preencha os campos obrigatórios';
  frmAlerta.Color := $000080FF;
  frmAlerta.ShowModal;
end;
end;

procedure TfrmCadastroCliente.edtCnpjExit(Sender: TObject);
begin
  inherited;
edtCnpj.Text := FormataCNPJ_CPF(edtCnpj.Text);
if Trim(edtCnpj.Text) <> '' then
  begin
  if not dm2.cdsCliente.Locate('cnpj',edtCnpj.Text,[]) then
        begin
          edtCnpj.Text := StringReplace(edtCnpj.Text, '/', '',  [rfReplaceAll, rfIgnoreCase]);
          edtCnpj.Text := StringReplace(edtCnpj.Text, '-', '',  [rfReplaceAll, rfIgnoreCase]);
          edtCnpj.Text := StringReplace(edtCnpj.Text, '.', '',  [rfReplaceAll, rfIgnoreCase]);
          if isCNPJ(edtCnpj.Text) then
          begin
            edtCnpj.Text := FormataCNPJ_CPF(edtCnpj.Text);
            edtCPF.Enabled := false;
          end
          else
            begin
           frmAlerta.lbMensagem.Caption := 'CNPJ '+edtCnpj.Text+' inválido';
           frmAlerta.Color := $000080FF;
           frmAlerta.ShowModal;
           edtCNPJ.SetFocus;
           edtCPF.Enabled := true;
          end;
        end
        else
        begin
            if edtId.Text <> dm2.cdsCliente.FieldByName('id_cliente').Text  then
           begin
           frmAlerta.lbMensagem.Caption := 'CNPJ '+FormataCNPJ_CPF(edtCnpj.Text)+' cadastrado para o cliente '+dm2.cdsCliente.FieldByName('id_cliente').Text;
           frmAlerta.Color := clRed;
           frmAlerta.ShowModal;
           edtCnpj.SetFocus;
           end;
        end;
     end
  else
  begin
    edtCPF.Enabled := true;
  end;
end;

procedure TfrmCadastroCliente.edtCnpjKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if Key = #8 then
      exit;

   if Length(edtCnpj.Text) = 2 then
      begin
         edtCnpj.Text := edtCnpj.Text + '.';
         edtCnpj.Selstart := Length(edtCnpj.text);
      end;

   if Length(edtCnpj.Text) = 6 then
      begin
         edtCnpj.Text := edtCnpj.Text + '.';
         edtCnpj.Selstart := Length(edtCnpj.text);
      end;

   if Length(edtCnpj.Text) = 10 then
      begin
         edtCnpj.Text := edtCnpj.Text + '/';
         edtCnpj.Selstart := Length(edtCnpj.text);
      end;

      if Length(edtCnpj.Text) = 15 then
      begin
         edtCnpj.Text := edtCnpj.Text + '-';
         edtCnpj.Selstart := Length(edtCnpj.text);
      end;
end;

procedure TfrmCadastroCliente.edtCpf1Exit(Sender: TObject);
begin
  inherited;
edtCpf.Text := FormataCNPJ_CPF(edtCpf.Text);
  if Trim(edtCpf.Text) <> '' then
  begin
     if not dm2.cdsCliente.Locate('cpf',edtCpf.Text,[]) then
        begin
          edtCpf.Text := StringReplace(edtCpf.Text, '/', '',  [rfReplaceAll, rfIgnoreCase]);
          edtCpf.Text := StringReplace(edtCpf.Text, '.', '',  [rfReplaceAll, rfIgnoreCase]);
          edtCpf.Text := StringReplace(edtCpf.Text, '-', '',  [rfReplaceAll, rfIgnoreCase]);
          if isCPF(edtCpf.Text) then
            begin
            edtCpf.Text := FormataCNPJ_CPF(edtCpf.Text);
            edtCNPJ.Enabled := false;
            end
              else
              begin
          frmAlerta.lbMensagem.Caption := 'CPF '+edtCpf.Text+' inválido';
          frmAlerta.Color := $000080FF;
          frmAlerta.ShowModal;
          edtCpf.SetFocus;
          edtCNPJ.Enabled := true;
              end;
        end
        else
        begin
        //caso o cpf esteja cadastrado para o usuário aberto na manutenção.
         if edtId.Text <> dm2.cdsCliente.FieldByName('id_cliente').Text  then
           begin
           frmAlerta.lbMensagem.Caption := 'CPF '+edtCpf.Text+' cadastrado para o cliente '+dm2.cdsCliente.FieldByName('id_cliente').Text;
           frmAlerta.Color := clRed;
           frmAlerta.ShowModal;
           edtCpf.SetFocus;
           end;
        end;
  end
  else
  begin
    edtCNPJ.Enabled := true;
  end;
end;

procedure TfrmCadastroCliente.edtCpfExit(Sender: TObject);
begin
  inherited;
 if Trim(edtCpf.Text) <> '' then
  begin
edtCpf.Text := StringReplace(edtCpf.Text, '.', '',  [rfReplaceAll, rfIgnoreCase]);
edtCpf.Text := StringReplace(edtCpf.Text, '-', '',  [rfReplaceAll, rfIgnoreCase]);
if isCPF(edtCpf.Text) then
     begin
     if not dm2.cdsCliente.Locate('cpf',edtCpf.Text,[]) then
        begin
           edtCNPJ.Enabled := false;
           edtCpf.Text := imprimeCPF(edtCpf.Text);
        end
        else
        begin
         if edtId.Text <> dm2.cdsCliente.FieldByName('id_cliente').Text  then
           begin
           frmAlerta.lbMensagem.Caption := 'CPF '+imprimeCPF(edtCpf.Text)+' cadastrado para o cliente '+dm2.cdsCliente.FieldByName('id_cliente').Text;
           frmAlerta.Color := clRed;
           frmAlerta.ShowModal;
           edtCpf.Clear;
           end;
        end;
     end
  else
  begin
  frmAlerta.lbMensagem.Caption := 'CPF '+edtCpf.Text+' inválido';
  frmAlerta.Color := $000080FF;
  frmAlerta.ShowModal;
  edtCpf.Clear;
  edtCNPJ.Enabled := true;
  end;
  end
  else
  begin
    edtCNPJ.Enabled := true;
  end;
end;

procedure TfrmCadastroCliente.edtCpfKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if Key = #8 then
      exit;

   if Length(edtCpf.Text) = 3 then
      begin
         edtCpf.Text := edtCpf.Text + '.';
         edtCpf.Selstart := Length(edtCpf.text);
      end;

   if Length(edtCpf.Text) = 7 then
      begin
         edtCpf.Text := edtCpf.Text + '.';
         edtCpf.Selstart := Length(edtCpf.text);
      end;

   if Length(edtCpf.Text) = 11 then
      begin
         edtCpf.Text := edtCpf.Text + '-';
         edtCpf.Selstart := Length(edtCpf.text);
      end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
var
dtNasc : string;
begin
  inherited;
if frmListagemCliente.op =1 then
   begin
    edtId.clear;
    edtNome.Clear;
    edtCpf.Clear;
    edtCnpj.Clear;
    edtRg.Clear;
    edtBairro.Clear;
    edtMunicipio.Clear;
    edtCep.Clear;
    edtTelefone.Clear;
    edtCelular.Clear;
    edtEmail.Clear;
    edtMidia.Clear;
    edtFantasia.Clear;
    edtUf.Clear;
    edtComplemento.Clear;
    edtLogradouro.Clear;
    edtDtNasc.Clear;
    edtNome.SetFocus;
    edtCpf.Enabled := true;
    edtCnpj.Enabled := true;
   end;
   if frmListagemCliente.op =2 then
   begin
   //VERIFICA SE EXISTE DATA DE NASCIMENTO
    dtNasc := DateToStr(dm2.cdsCliente.FieldByName('dt_nasc').AsDateTime);
    if StrToDate(dtNasc) < 01/01/1900  then
    begin
      edtDtNasc.Clear;
    end
    else
    begin
      edtDtNasc.Text := DateToStr(dm2.cdsCliente.FieldByName('dt_nasc').AsDateTime);
    end;

    edtNome.SetFocus;
    frmCadastroCliente.edtId.Text := dm2.cdsCliente.FieldByName('id_cliente').Text;
    frmCadastroCliente.edtNome.Text := dm2.cdsCliente.FieldByName('ds_cliente').Text;
    frmCadastroCliente.edtCpf.Text := dm2.cdsCliente.FieldByName('cpf').Text;
    frmCadastroCliente.edtCnpj.Text := dm2.cdsCliente.FieldByName('cnpj').Text;
    frmCadastroCliente.edtRg.Text := dm2.cdsCliente.FieldByName('rg').Text;
    frmCadastroCliente.edtBairro.Text := dm2.cdsCliente.FieldByName('bairro').Text;
    frmCadastroCliente.edtMunicipio.Text := dm2.cdsCliente.FieldByName('municipio').Text;
    frmCadastroCliente.edtCep.Text := dm2.cdsCliente.FieldByName('cep').Text;
    frmCadastroCliente.edtTelefone.Text := dm2.cdsCliente.FieldByName('telefone').Text;
    frmCadastroCliente.edtCelular.Text := dm2.cdsCliente.FieldByName('celular').Text;
    frmCadastroCliente.edtEmail.Text := dm2.cdsCliente.FieldByName('email').Text;
    frmCadastroCliente.edtMidia.Text := dm2.cdsCliente.FieldByName('midiasocial').Text;
    frmCadastroCliente.edtFantasia.Text := dm2.cdsCliente.FieldByName('nomefantasia').Text;
    frmCadastroCliente.edtUf.Text := dm2.cdsCliente.FieldByName('uf').Text;
    frmCadastroCliente.edtComplemento.Text := dm2.cdsCliente.FieldByName('complemento').Text;
    frmCadastroCliente.edtLogradouro.Text := dm2.cdsCliente.FieldByName('logradouro').Text;
    if trim(edtCpf.Text) <> '' then
    begin
      edtCnpj.Enabled := false;
      edtCpf.Enabled := true;

    end
    else if trim(edtCnpj.Text) <> '' then
    begin
      edtCpf.Enabled := false;
      edtCnpj.Enabled := true;
    end
    else
      begin
        edtCpf.Enabled := true;
      edtCnpj.Enabled := true;
      end;

   end;
end;
end.
