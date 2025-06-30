unit funcMovMat;

interface

uses
  uReferenciaMaterial, System.SysUtils, Vcl.Dialogs, Model.FuncGeral;

  procedure geraMovSaida(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
  procedure geraMovEntrada(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
  procedure atualizaEstEntra(const Ref: TreferenciaMaterial; const qtde: String);
  procedure atualizaEstSaida(const Ref: TreferenciaMaterial; const qtde: String);
  function existeRefEstoque(const Ref: TreferenciaMaterial): Boolean;

implementation

//Gera registro de movimentação para tabela mov_material (Em saidas)
procedure geraMovSaida(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
var
  SqlInsert: String;
  SqlValues: String;

begin
  try
      SqlInsert := 'Insert into mov_material(MATERIAL_ID, COR_ID, DEPOSITO_ID, LOTE, QUANTIDADE, TIPO_MOV, DESCRICAO_MOV) ';
      SqlValues := 'Values(:idMat, :idCor, :idDep, :lote, :qtde, :tipo_mov, :desc_mov) ';

      modelFuncGeral.QfuncGeral.SQL.Text := SqlInsert + SqlValues;
      modelFuncGeral.QfuncGeral.ParamByName('idMat').asInteger := Ref.idMat;
      modelFuncGeral.QfuncGeral.ParamByName('idCor').asInteger := Ref.idCor;
      modelFuncGeral.QfuncGeral.ParamByName('idDep').asInteger := Ref.idDep;
      modelFuncGeral.QfuncGeral.ParamByName('lote').asString := Ref.Lote;
      modelFuncGeral.QfuncGeral.ParamByName('qtde').AsFloat := StrToFloat(qtde);
      modelFuncGeral.QfuncGeral.ExecSQL;
    except
      on E: Exception do
        ShowMessage('Erro ao gerar estoque do material: ' + E.Message);
    end;

  ShowMessage('')  ;
end;

//Gera registro de movimentação para tabela mov_material (Em entradas)
procedure geraMovEntrada(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
begin
  ShowMessage('')  ;
end;

procedure atualizaEstSaida(const Ref: TreferenciaMaterial; const qtde: String);
var
  SqlUpdate: String;

begin
  //Na saida, nunca criamos um registro de estoque,
  //apenas pode dar saida quando ja teve entrada no estoque(registro que já existe)
  if existeRefEstoque(Ref) then
  begin
    try
      SqlUpdate := 'update estoque_material set QUANTIDADE = QUANTIDADE - :qtde where ' +
        ' material_id = :idMat and Cor_id = :idCor and deposito_id = :idDep and lote = :lote';

      modelFuncGeral.QfuncGeral.SQL.Text := SqlUpdate;
      modelFuncGeral.QfuncGeral.ParamByName('idMat').asInteger := Ref.idMat;
      modelFuncGeral.QfuncGeral.ParamByName('idCor').asInteger := Ref.idCor;
      modelFuncGeral.QfuncGeral.ParamByName('idDep').asInteger := Ref.idDep;
      modelFuncGeral.QfuncGeral.ParamByName('lote').asString := Ref.Lote;
      modelFuncGeral.QfuncGeral.ParamByName('qtde').AsFloat := StrToFloat(qtde);
      modelFuncGeral.QfuncGeral.ExecSQL;
    except
      on E: Exception do
        ShowMessage('Erro ao alterar estoque do material: ' + E.Message);
    end;
  end
  else
    ShowMessage('Impossivel fazer saida de um lote ou deposito que ainda não teve entradas!');
end;

procedure atualizaEstEntra(const Ref: TreferenciaMaterial; const qtde: String);
var
   SqlInsert: String;
   SqlValues:String;
   SqlUpdate: String;

begin
  //Valida se deve gerar um Insert ou Update na Estoque_material
  if not existeRefEstoque(Ref) then
  begin
    try
      SqlInsert := 'Insert into estoque_material(MATERIAL_ID, COR_ID, DEPOSITO_ID, LOTE, QUANTIDADE) ';
      SqlValues := 'Values(:idMat, :idCor, :idDep, :lote, :qtde) ';

      modelFuncGeral.QfuncGeral.SQL.Text := SqlInsert + SqlValues;
      modelFuncGeral.QfuncGeral.ParamByName('idMat').asInteger := Ref.idMat;
      modelFuncGeral.QfuncGeral.ParamByName('idCor').asInteger := Ref.idCor;
      modelFuncGeral.QfuncGeral.ParamByName('idDep').asInteger := Ref.idDep;
      modelFuncGeral.QfuncGeral.ParamByName('lote').asString := Ref.Lote;
      modelFuncGeral.QfuncGeral.ParamByName('qtde').AsFloat := StrToFloat(qtde);
      modelFuncGeral.QfuncGeral.ExecSQL;
    except
      on E: Exception do
        ShowMessage('Erro ao gerar estoque do material: ' + E.Message);
    end;
  end
  else
  begin
    try
      SqlUpdate := 'update estoque_material set QUANTIDADE = QUANTIDADE + :qtde where ' +
        ' material_id = :idMat and Cor_id = :idCor and deposito_id = :idDep and lote = :lote';

      modelFuncGeral.QfuncGeral.SQL.Text := SqlUpdate;
      modelFuncGeral.QfuncGeral.ParamByName('idMat').asInteger := Ref.idMat;
      modelFuncGeral.QfuncGeral.ParamByName('idCor').asInteger := Ref.IdCor;
      modelFuncGeral.QfuncGeral.ParamByName('idDep').asInteger := Ref.idDep;
      modelFuncGeral.QfuncGeral.ParamByName('lote').asString := Ref.Lote;
      modelFuncGeral.QfuncGeral.ParamByName('qtde').AsFloat := StrToFloat(qtde);
      modelFuncGeral.QfuncGeral.ExecSQL;
    except
      on E: Exception do
        ShowMessage('Erro ao alterar estoque do material: ' + E.Message);
    end;
  end;

end;

function existeRefEstoque(const Ref: TreferenciaMaterial): Boolean;
begin
  try
    modelFuncGeral.QfuncGeral.Close;
    modelFuncGeral.QfuncGeral.Sql.Text := 'select * from estoque_material where ' +
      ' material_id = :idMat and cor_id = :idCor and deposito_id = :idDep and lote = :lote';
    modelFuncGeral.QfuncGeral.ParamByName('idMat').AsInteger := Ref.idMat;
    modelFuncGeral.QfuncGeral.ParamByName('idCor').AsInteger := Ref.idCor;
    modelFuncGeral.QfuncGeral.ParamByName('idDep').AsInteger := Ref.idDep;
    modelFuncGeral.QfuncGeral.ParamByName('lote').AsString := Ref.Lote;
    modelFuncGeral.QfuncGeral.Open;

    //Se "IsEmpty" então não existe registro de estoque para a referencia(material, cor, deposito e lote)
    if modelFuncGeral.QfuncGeral.IsEmpty then
      existeRefEstoque := false
    else
      existeRefEstoque := true;

  except
    on E: Exception do
     begin
      ShowMessage(E.Message);
     end;

  end;
end;

end.
