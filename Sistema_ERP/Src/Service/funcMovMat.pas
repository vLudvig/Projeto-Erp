unit funcMovMat;

interface

uses
  uReferenciaMaterial, System.SysUtils, Vcl.Dialogs, Model.FuncGeral;

  procedure geraMovSaida(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
  procedure geraMovEntrada(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
  procedure atualizaEstEntra(const Ref: TreferenciaMaterial; const qtde: String);
  procedure atualizaEstSaida(const Ref: TreferenciaMaterial; const qtde: String);
  function existeRefEstoque(const Ref: TreferenciaMaterial): Boolean;
  function grupoMovimentaEst(const Ref: TreferenciaMaterial): Boolean;
  function depositoPermEntraMn(const idDep: Integer): Boolean;
  function depositoPermSaidaMn(const idDep: Integer): Boolean;

  var
    gerou_mov : boolean;

implementation

function depositoPermEntraMn(const idDep: Integer): Boolean;
var
  permite: String;
begin
  modelFuncGeral.QfuncGeral.Close;
  modelFuncGeral.QfuncGeral.SQL.Text := 'select * from deposito where id = :idDep';
  modelFuncGeral.QfuncGeral.ParamByName('idDep').AsInteger := idDep;
  modelFuncGeral.QfuncGeral.Open;

  permite := modelFuncGeral.QfuncGeral.FieldByName('entrada_mn').AsString;

  if permite = 'S' then
    depositoPermEntraMn := true
  else
    depositoPermEntraMn := false;
end;

function depositoPermSaidaMn(const idDep: Integer): Boolean;
var
  permite: String;
begin
  modelFuncGeral.QfuncGeral.Close;
  modelFuncGeral.QfuncGeral.SQL.Text := 'select * from deposito where id = :idDep';
  modelFuncGeral.QfuncGeral.ParamByName('idDep').AsInteger := idDep;
  modelFuncGeral.QfuncGeral.Open;

  permite := modelFuncGeral.QfuncGeral.FieldByName('saida_mn').AsString;

  if permite = 'S' then
    depositoPermSaidaMn := true
  else
    depositoPermSaidaMn := false;
end;

function grupoMovimentaEst(const Ref: TreferenciaMaterial): Boolean;
var
  idGrupo : Integer;
  mov_est : String;

begin
  modelFuncGeral.QfuncGeral.Close;
  modelFuncGeral.QfuncGeral.SQL.Text := 'select * from material where id = :idMat';
  modelFuncGeral.QfuncGeral.ParamByName('idMat').AsInteger := Ref.IdMat;
  modelFuncGeral.QfuncGeral.Open;

  idgrupo := modelFuncGeral.QfuncGeral.FieldByName('grupo_material_id').AsInteger;
  modelFuncGeral.QfuncGeral.Close;

  modelFuncGeral.QfuncGeral.SQL.Text := 'select * from grupo_material where id = :idGrupo';
  modelFuncGeral.QfuncGeral.ParamByName('idGrupo').AsInteger := idGrupo;

  modelFuncGeral.QfuncGeral.Open;
  mov_est := modelFuncGeral.QfuncGeral.FieldByName('movimenta_estoque').AsString;

  if mov_est = 'S' then
    grupoMovimentaEst := true
  else
    grupoMovimentaEst := false;

  modelFuncGeral.QfuncGeral.Close;
end;


//Gera registro de movimentação para tabela mov_material (Em saidas)
procedure geraMovSaida(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
var
  SqlInsert: String;
  SqlValues: String;
  idGrupo: Integer;

begin
  gerou_mov := false;

  if grupoMovimentaEst(Ref) then
  begin
    if ((tp_mov = 'AM') and (depositoPermSaidaMn(Ref.IdDep))) or (tp_mov <> 'AM')   then
    begin
      try
        SqlInsert := 'Insert into mov_material(MATERIAL_ID, COR_ID, DEPOSITO_ID, LOTE, QUANTIDADE, TIPO_MOV, DESCRICAO_MOV, OPERACAO, DT_MOVTO, HORA_MOV) ';
        SqlValues := 'Values(:idMat, :idCor, :idDep, :lote, :qtde, :tipo_mov, :desc_mov, :operacao, :dt_movto, :hora_mov) ';

        modelFuncGeral.QfuncGeral.SQL.Text := SqlInsert + SqlValues;
        modelFuncGeral.QfuncGeral.ParamByName('idMat').asInteger := Ref.idMat;
        modelFuncGeral.QfuncGeral.ParamByName('idCor').asInteger := Ref.idCor;
        modelFuncGeral.QfuncGeral.ParamByName('idDep').asInteger := Ref.idDep;
        modelFuncGeral.QfuncGeral.ParamByName('lote').asString := Ref.Lote;
        modelFuncGeral.QfuncGeral.ParamByName('qtde').AsFloat := StrToFloat(qtde);
        modelFuncGeral.QfuncGeral.ParamByName('tipo_mov').asString := tp_mov;
        modelFuncGeral.QfuncGeral.ParamByName('desc_mov').asString := desc_mov;
        modelFuncGeral.QfuncGeral.ParamByName('operacao').asString := 'S';
        modelFuncGeral.QfuncGeral.ParamByName('dt_movto').asDate := Date;
        modelFuncGeral.QfuncGeral.ParamByName('hora_mov').asDateTime := Now;
        modelFuncGeral.QfuncGeral.ExecSQL;

        //Serve para informar que pode atualizar ESTOQUE
        gerou_mov := true;
      except
        on E: Exception do
          ShowMessage('Erro ao gerar movimento do material(Saida): ' + E.Message);
      end;
    end
    else
      ShowMessage('Depósito não permite saída do Tipo Acerto Manual!');
  end
  else
    ShowMessage('Grupo do Material não permite movimento de estoque!');

end;

//Gera registro de movimentação para tabela mov_material (Em entradas)
procedure geraMovEntrada(const Ref: TreferenciaMaterial; const qtde: String; const tp_mov: String; const desc_mov: String);
var
  SqlInsert: String;
  SqlValues: String;

begin
  gerou_mov := false;

  if grupoMovimentaEst(Ref) then
  begin
    if ((tp_mov = 'AM') and (depositoPermEntraMn(Ref.IdDep))) or (tp_mov <> 'AM')   then
    begin
      try
        SqlInsert := 'Insert into mov_material(MATERIAL_ID, COR_ID, DEPOSITO_ID, LOTE, QUANTIDADE, TIPO_MOV, DESCRICAO_MOV, OPERACAO, DT_MOVTO, HORA_MOV) ';
        SqlValues := 'Values(:idMat, :idCor, :idDep, :lote, :qtde, :tipo_mov, :desc_mov, :operacao, :dt_movto, :hora_mov) ';

        modelFuncGeral.QfuncGeral.SQL.Text := SqlInsert + SqlValues;
        modelFuncGeral.QfuncGeral.ParamByName('idMat').asInteger := Ref.idMat;
        modelFuncGeral.QfuncGeral.ParamByName('idCor').asInteger := Ref.idCor;
        modelFuncGeral.QfuncGeral.ParamByName('idDep').asInteger := Ref.idDep;
        modelFuncGeral.QfuncGeral.ParamByName('lote').asString := Ref.Lote;
        modelFuncGeral.QfuncGeral.ParamByName('qtde').AsFloat := StrToFloat(qtde);
        modelFuncGeral.QfuncGeral.ParamByName('tipo_mov').asString := tp_mov;
        modelFuncGeral.QfuncGeral.ParamByName('desc_mov').asString := desc_mov;
        modelFuncGeral.QfuncGeral.ParamByName('operacao').asString := 'E';
        modelFuncGeral.QfuncGeral.ParamByName('dt_movto').asDate := Date;
        modelFuncGeral.QfuncGeral.ParamByName('hora_mov').asDateTime := Now;
        modelFuncGeral.QfuncGeral.ExecSQL;

        //Serve para informar que pode atualizar ESTOQUE
        gerou_mov := true;
      except
      on E: Exception do
        ShowMessage('Erro ao gerar movimento do material(Entrada): ' + E.Message);
      end;
    end
    else
      ShowMessage('Depósito não permite entrada do Tipo Acerto Manual!');
  end
  else
    ShowMessage('Grupo do Material não permite movimento de estoque!');

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
