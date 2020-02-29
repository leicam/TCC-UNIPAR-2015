unit untFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  Tfuncoes = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    function isCPF(CPF: string): boolean;
    function imprimeCPF(CPF: string): string;
    function isCNPJ(CNPJ: string): boolean;
    function imprimeCNPJ(CNPJ: string): string;
    function formataCNPJ(Numero: String): String;
    function formataCNPJ_CPF(Numero: String): String;
    function formataCPF(Numero: String): String;
    function formataCEP(const CEP: string): string;
    function formataTelefone(sTelefone: String): String;
  end;

var
  funcoes: Tfuncoes;

implementation

{$R *.dfm}

//FORMATA CEP
function Tfuncoes.formataCEP(const CEP: string): string;
var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(CEP) do
    if CEP[I] in ['0'..'9'] then
      Result := Result + CEP[I];
  if Length(Result) <> 8 then
   ShowMessage('CEP inválido!')
  else
    Result :=
      Copy(Result, 1, 2) + '.' +
      Copy(Result, 3, 3) + '-' +
      Copy(Result, 6, 3);
end;

//FUNÇÃO FORMATAR CNPJ
Function Tfuncoes.FormataCNPJ(Numero: String): String;
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

//FUNÇÃO FORMATAR CPF
Function Tfuncoes.FormataCPF(Numero: String): String;
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

//FORMATA TELEFONE
function Tfuncoes.formataTelefone(sTelefone: String): String;
var
  s: string;
  tam: Integer;
begin
  s  := Trim((sTelefone));
  tam:= Length(s);

  case tam of
    8: //Ex: 37212121
      begin
        Result:= Copy(s,1,4)+'-'+Copy(s,5,4);
      end;
    10: //Ex: 3237212121 = (32)3721-2121
      begin
        Result:= '('+Copy(s,1,2)+')'+Copy(s,3,4)+'-'+Copy(s,7,4);
      end;
    11: //Ex: 13237212121 = +1(32)3721-2121
      begin
        Result:= '+'+Copy(s,1,1)+'('+Copy(s,2,2)+')'+Copy(s,4,4)+'-'+Copy(s,8,4);
      end;
    12: //Ex: 553237212121 = +55(32)3721-2121
      begin
        Result:= '+'+Copy(s,1,2)+'('+Copy(s,3,2)+')'+Copy(s,5,4)+'-'+Copy(s,9,4);
      end;
    else
      Result:= s;
  end;
end;

//FUNÇÃO PARA DEIXAR EDT NO FORMATO CPF OU CNPJ
Function  Tfuncoes.FormataCNPJ_CPF(Numero: String): String;
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

//FUNÇÃO PARA VALIDAR CNPJ
function Tfuncoes.isCNPJ(CNPJ: string): boolean;
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

function Tfuncoes.imprimeCNPJ(CNPJ: string): string;
begin
{ máscara do CNPJ: 99.999.999.9999-99 }
  imprimeCNPJ := copy(CNPJ, 1, 2) + '.' + copy(CNPJ, 3, 3) + '.' +
    copy(CNPJ, 6, 3) + '.' + copy(CNPJ, 9, 4) + '-' + copy(CNPJ, 13, 2);
end;

function Tfuncoes.imprimeCPF(CPF: string): string;
begin
  imprimeCPF := copy(CPF, 1, 3) + '.' + copy(CPF, 4, 3) + '.' +
    copy(CPF, 7, 3) + '-' + copy(CPF, 10, 2);
end;

//FUNÇÃO PARA VALIDAR CPF
function Tfuncoes.isCPF(CPF: string): boolean;
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

end.
