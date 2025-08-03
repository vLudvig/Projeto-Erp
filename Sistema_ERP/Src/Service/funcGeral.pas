unit funcGeral;

interface

uses
  System.SysUtils, System.Hash, Model.FuncGeral;

  function geraCriptografia(const senha: string): string;
  procedure gravaLog(const tela: string; const usuario: string; const mensagem: string; const tipoLog: string);

implementation


//Devolve string criptografada.
function geraCriptografia(const senha: string) : string;
begin
  geraCriptografia := THashSHA2.GetHashString(senha);
end;

procedure gravaLog(const tela: string; const usuario: string; const mensagem: string; const tipoLog: string);
var
  sqlInsert: string;
  dtHora : TDateTime;
begin
  try
    modelFuncGeral := TmodelFuncGeral.Create(nil);

    sqlInsert := 'Insert into log (TELA, MENSAGEM, USUARIO, HORA, TIPO_LOG) values (:TELA, :MENSAGEM, :USUARIO, :HORA, :TIPO_LOG)';
    modelFuncGeral.QfuncGeral.Sql.Text := sqlInsert ;

    dtHora := Now; //Pega o horario atual do windows
    modelFuncGeral.QfuncGeral.ParamByName('TELA').AsString := tela;
    modelFuncGeral.QfuncGeral.ParamByName('MENSAGEM').AsString := mensagem;
    modelFuncGeral.QfuncGeral.ParamByName('USUARIO').AsString := usuario;
    modelFuncGeral.QfuncGeral.ParamByName('HORA').AsDateTime := dtHora;
    modelFuncGeral.QfuncGeral.ParamByName('TIPO_LOG').AsString := tipoLog; // AlTERAÇÂO, INCLUSÃO, DELETE, LOGIN

    modelFuncGeral.QfuncGeral.ExecSQL;
  Finally
    FreeAndNil(modelFuncgeral);
  end;
end;

end.
