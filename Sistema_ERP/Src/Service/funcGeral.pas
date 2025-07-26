unit funcGeral;

interface

uses
  System.SysUtils, System.Hash;

  function geraCriptografia(const senha: string): string;

implementation


//Devolve senha criptografada.
function geraCriptografia(const senha: string) : string;
begin
  geraCriptografia := THashSHA2.GetHashString(senha);
end;

end.
