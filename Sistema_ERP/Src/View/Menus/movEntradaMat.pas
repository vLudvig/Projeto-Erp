unit movEntradaMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Model.Conexao, Consulta.Material, Consulta.Cor, Consulta.Deposito,
  model.Material, model.cor, Model.Deposito, Model.EntradaMat, Vcl.Buttons, funcGeral, uReferenciaMaterial;

type
  TformMovEntraMat = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    btnGravar: TButton;
    btnLimpar: TButton;
    btnFechar: TButton;
    Panel2: TPanel;
    lblCodigo: TLabel;
    tCodMat: TEdit;
    lblCor: TLabel;
    tCor: TEdit;
    tDescMat: TEdit;
    tDescCor: TEdit;
    lblDep: TLabel;
    tDep: TEdit;
    tDescDep: TEdit;
    lblLote: TLabel;
    tLote: TEdit;
    Label1: TLabel;
    tQtde: TEdit;
    DBGrid1: TDBGrid;
    Qestoque: TFDQuery;
    DS_Qestoque: TDataSource;
    habGrav: TButton;
    btnConsMat: TSpeedButton;
    btnConsCor: TSpeedButton;
    btnConsDep1: TSpeedButton;
    QestoqueCOD_MAT: TStringField;
    QestoqueDESC_MAT: TStringField;
    QestoqueCOD_COR: TStringField;
    QestoqueDESC_COR: TStringField;
    QestoqueQUANTIDADE: TFMTBCDField;
    QestoqueLOTE: TStringField;
    QestoqueDEP_COD: TStringField;
    QestoqueDESC_DEP: TStringField;
    checkExibMsg: TCheckBox;
    procedure btnConsMatClick(Sender: TObject);
    procedure btnConsCorClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConsDepClick(Sender: TObject);
    procedure tCodMatExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tCorExit(Sender: TObject);
    procedure tDepExit(Sender: TObject);
    procedure habGravClick(Sender: TObject);
    function geraRegistroEstoque: boolean;
    procedure btnGravarClick(Sender: TObject);
    procedure tQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure limpaCamposTela();
    procedure btnLimparClick(Sender: TObject);
    procedure tLoteEnter(Sender: TObject);
    procedure btnConsMat1Click(Sender: TObject);
    procedure btnConsCor1Click(Sender: TObject);
    procedure btnConsDep1Click(Sender: TObject);
  private

  protected
    var
      idMat: Integer;
      idDep: Integer;
      idCor: Integer;
  public
    { Public declarations }
  end;

var
  formMovEntraMat: TformMovEntraMat;

implementation

{$R *.dfm}

procedure TformMovEntraMat.btnConsCor1Click(Sender: TObject);
begin
  formConsultaCores := TformConsultaCores.Create(nil);
  try
     formConsultaCores.Qconsulta.Close;
     formConsultaCores.Qconsulta.Sql.Text :=
        'select c.* from cor c ' +
        'inner join cor_material cm on c.id = cm.cor_id ' +
        'where cm.material_id = ' + IntToStr(idMat);
     formConsultaCores.Qconsulta.Open;

     if formConsultaCores.ShowModal = mrOk then
     begin
        //Escreve as informações da cor conforme selecionado na consulta
       tCor.Text := formConsultaCores.codigoSelecionado;
       tDescCor.Text := formConsultaCores.descSelec;
       idCor := formConsultaCores.registroSelecionado;
     end;
  finally
     tCor.SetFocus;
     FreeAndNil(formConsultaCores);
  end;
end;

procedure TformMovEntraMat.btnConsCorClick(Sender: TObject);
begin
  formConsultaCores := TformConsultaCores.Create(nil);
  try
     formConsultaCores.Qconsulta.Close;
     formConsultaCores.Qconsulta.Sql.Text :=
        'select c.* from cor c ' +
        'inner join cor_material cm on c.id = cm.cor_id ' +
        'where cm.material_id = ' + IntToStr(idMat);
     formConsultaCores.Qconsulta.Open;

     if formConsultaCores.ShowModal = mrOk then
     begin
        //Escreve as informações da cor conforme selecionado na consulta
       tCor.Text := formConsultaCores.codigoSelecionado;
       tDescCor.Text := formConsultaCores.descSelec;
       idCor := formConsultaCores.registroSelecionado;
     end;
  finally
     tCor.SetFocus;
     FreeAndNil(formConsultaCores);
  end;
end;

procedure TformMovEntraMat.btnConsDep1Click(Sender: TObject);
begin
  formConsultaDep := TformConsultaDep.Create(nil);
  try
     if formConsultaDep.ShowModal = mrOk then
     begin
      //Escreve as informações do deposito conforme selecionado na consulta
       tDep.Text := formConsultaDep.codigoSelecionado;
       tDescDep.Text := formConsultaDep.descSelec;
       idDep := formConsultaDep.registroSelecionado;
     end;
  finally
     FreeAndNil(formConsultaDep);
  end;
end;

procedure TformMovEntraMat.btnConsDepClick(Sender: TObject);
begin
  formConsultaDep := TformConsultaDep.Create(nil);
  try
     if formConsultaDep.ShowModal = mrOk then
     begin
      //Escreve as informações do deposito conforme selecionado na consulta
       tDep.Text := formConsultaDep.codigoSelecionado;
       tDescDep.Text := formConsultaDep.descSelec;
       idDep := formConsultaDep.registroSelecionado;
     end;
  finally
     FreeAndNil(formConsultaDep);
  end;
end;

procedure TformMovEntraMat.btnConsMat1Click(Sender: TObject);
begin
  formConsultaMaterial := TformConsultaMaterial.Create(nil);
  try
     if formConsultaMaterial.ShowModal = mrOk then
     begin
       //Escreve as informações do material conforme selecionado na consulta
       tCodMat.Text := formConsultaMaterial.codigoSelecionado;
       tDescMat.Text := formConsultaMaterial.descSelec;
       idMat := formConsultaMaterial.registroSelecionado;
     end;
  finally
     tCodMat.SetFocus;
     FreeAndNil(formConsultaMaterial);
  end;
end;

procedure TformMovEntraMat.btnConsMatClick(Sender: TObject);
begin
  formConsultaMaterial := TformConsultaMaterial.Create(nil);
  try
     if formConsultaMaterial.ShowModal = mrOk then
     begin
       //Escreve as informações do material conforme selecionado na consulta
       tCodMat.Text := formConsultaMaterial.codigoSelecionado;
       tDescMat.Text := formConsultaMaterial.descSelec;
       idMat := formConsultaMaterial.registroSelecionado;
     end;
  finally
     tCodMat.SetFocus;
     FreeAndNil(formConsultaMaterial);
  end;
end;

procedure TformMovEntraMat.btnFecharClick(Sender: TObject);
begin
  try
     Self.Close;
  except
    on E : Exception do
      ShowMessage(E.Message);
  end;
  Self.Close
end;

procedure TformMovEntraMat.btnGravarClick(Sender: TObject);
  var
    SqlInsert: String;
    SqlValues:String;
    SqlUpdate: String;

begin
  btnGravar.Enabled := false;

  var refMat : TReferenciaMaterial;
  refMat.IdMat := idMat;
  refMat.IdCor:= idCor;
  refMat.IdDep := IdDep;
  refMat.Lote := tLote.Text;

  //Valida se deve gerar um Insert ou Update na Estoque_material
  if geraRegistroEstoque then
  begin
    try
      SqlInsert := 'Insert into estoque_material(MATERIAL_ID, COR_ID, DEPOSITO_ID, LOTE, QUANTIDADE) ';
      SqlValues := 'Values(:idMat, :idCor, :idDep, :lote, :qtde) ';
      modelEntraMat.Qcad.SQL.Text := SqlInsert + SqlValues;
      modelEntraMat.Qcad.ParamByName('idMat').asInteger := idMat;
      modelEntraMat.Qcad.ParamByName('idCor').asInteger := idCor;
      modelEntraMat.Qcad.ParamByName('idDep').asInteger := idDep;
      modelEntraMat.Qcad.ParamByName('lote').asString := tLote.Text;
      modelEntraMat.Qcad.ParamByName('qtde').AsFloat := StrToFloat(tQtde.Text);
      modelEntraMat.Qcad.ExecSQL;

      funcGeral.geraMovMat(refMat);

      if checkExibMsg.Checked then
        ShowMessage('Movimentação efetuada com sucesso!')
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
      modelEntraMat.Qcad.SQL.Text := SqlUpdate;
      modelEntraMat.Qcad.ParamByName('idMat').asInteger := idMat;
      modelEntraMat.Qcad.ParamByName('idCor').asInteger := idCor;
      modelEntraMat.Qcad.ParamByName('idDep').asInteger := idDep;
      modelEntraMat.Qcad.ParamByName('lote').asString := tLote.Text;
      modelEntraMat.Qcad.ParamByName('qtde').AsFloat := StrToFloat(tQtde.Text);
      modelEntraMat.Qcad.ExecSQL;

      funcGeral.geraMovMat(refMat);

      if checkExibMsg.Checked then
        ShowMessage('Movimentação efetuada com sucesso!')
    except
      on E: Exception do
        ShowMessage('Erro ao alterar estoque do material: ' + E.Message);
    end;
  end;

  Qestoque.Close;
  Qestoque.Open;
end;

procedure TformMovEntraMat.btnLimparClick(Sender: TObject);
begin
  limpaCamposTela;
end;

procedure TformMovEntraMat.FormDestroy(Sender: TObject);
begin
  FreeAndNil(modelEntraMat);
end;

procedure TformMovEntraMat.FormShow(Sender: TObject);
begin
  modelEntraMat:= TmodelEntraMat.Create(nil);
end;

procedure TformMovEntraMat.habGravClick(Sender: TObject);
begin
  try
    modelEntraMat.Qconsulta.Close;
    modelEntraMat.Qconsulta.SQL.Text := 'select * from cor_material where cor_id = :idCor and material_id = :idMat';
    modelEntraMat.Qconsulta.ParamByName('idCor').AsInteger := idCor;
    modelEntraMat.Qconsulta.ParamByName('idMat').AsInteger := idMat;
    modelEntraMat.Qconsulta.Open;
    if modelEntraMat.Qconsulta.IsEmpty then
      ShowMessage('Material não possui esta Cor ou Material inválido, impossivel continuar!')
    else
      btnGravar.Enabled := true;
  finally

  end;
end;

procedure TformMovEntraMat.tCodMatExit(Sender: TObject);
begin
  if Trim(tCodMat.Text) <> '' then
  begin
    try
      modelEntraMat.Qconsulta.Close;
      modelEntraMat.Qconsulta.SQL.Text := 'select * from material where codigo = :codigo';
      modelEntraMat.Qconsulta.ParamByName('codigo').AsString := tCodMat.Text;
      modelEntraMat.Qconsulta.Open;
      tDescMat.Text := modelEntraMat.Qconsulta.FieldByName('Descricao').AsString;
      idMat := modelEntraMat.Qconsulta.FieldByName('id').AsInteger;
      modelEntraMat.Qconsulta.Close;
    except
      on E : Exception do
        ShowMessage('Erro ao encontrar material ' + E.Message);
    end;
  end
  else
  begin
    tDescMat.Text := '';
  end;
end;

procedure TformMovEntraMat.tCorExit(Sender: TObject);
begin
  if Trim(tCor.Text) <> '' then
  begin
    try
      modelEntraMat.Qconsulta.Close;
      modelEntraMat.Qconsulta.SQL.Text :=
        'select c.* from cor c ' +
        'inner join cor_material cm on c.id = cm.cor_id ' +
        'where cm.material_id = ' + IntToStr(idMat) + ' and c.codigo = :codigo';

      modelEntraMat.Qconsulta.ParamByName('codigo').AsString := tCor.Text;
      modelEntraMat.Qconsulta.Open;
      tDescCor.Text := modelEntraMat.Qconsulta.FieldByName('Descricao').AsString;
      idCor := modelEntraMat.Qconsulta.FieldByName('id').AsInteger;
      modelEntraMat.Qconsulta.Close;
      try
        Qestoque.Close;
        Qestoque.ParamByName('idMat').AsInteger := idMat;
        Qestoque.ParamByName('idCor').AsInteger := idCor;
      finally
        Qestoque.Open;
      end;

    except
      on E : Exception do
        ShowMessage('Erro ao encontrar cor ' + E.Message);
    end;
  end
  else
  begin
    tDescCor.Text := '';
  end;

  if (Trim(tDescCor.Text) = '') and (Trim(tCor.Text) <> '') then
    ShowMessage('Cor inválida, verifique se essa cor está vinculada ao Material informado!');

end;

procedure TformMovEntraMat.tDepExit(Sender: TObject);
begin
  if Trim(tDep.Text) <> '' then
  begin
    try
      modelEntraMat.Qconsulta.Close;
      modelEntraMat.Qconsulta.SQL.Text := 'select * from deposito where codigo = :codigo';
      modelEntraMat.Qconsulta.ParamByName('codigo').AsString := tDep.Text;
      modelEntraMat.Qconsulta.Open;
      tDescDep.Text := modelEntraMat.Qconsulta.FieldByName('Descricao').AsString;
      modelEntraMat.Qconsulta.Close;
    except
      on E : Exception do
        ShowMessage('Erro ao encontrar deposito ' + E.Message);
    end;
  end
  else
  begin
    tDescDep.Text := '';
  end;
end;

procedure TformMovEntraMat.tLoteEnter(Sender: TObject);
begin
  tLote.Text := '000000';//Lote padrão
end;

procedure TformMovEntraMat.tQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;

  // Impede digitar mais de uma vírgula
  if (Key = ',') and (Pos(',', tQtde.Text) > 0) then
    Key := #0;

  //Tab no campo qtde leva para o habilita gravar -- OBS: Não funciona =(
  if Key = #9 then
  begin
    Key := #0;
    habGrav.SetFocus;
  end;
end;

function TformMovEntraMat.geraRegistroEstoque: Boolean;
begin
  try
    modelEntraMat.Qconsulta.Close;
    modelEntraMat.Qconsulta.Sql.Text := 'select * from estoque_material where ' +
      ' material_id = :idMat and cor_id = :idCor and deposito_id = :idDep and lote = :lote';
    modelEntraMat.Qconsulta.ParamByName('idMat').AsInteger := idMat;
    modelEntraMat.Qconsulta.ParamByName('idCor').AsInteger := idCor;
    modelEntraMat.Qconsulta.ParamByName('idDep').AsInteger := idDep;
    modelEntraMat.Qconsulta.ParamByName('lote').AsString := tLote.Text;
    modelEntraMat.Qconsulta.Open;

    //Se "IsEmpty" então não existe registro de estoque para a referencia(material, cor, deposito e lote)
    if modelEntraMat.Qconsulta.IsEmpty then
      geraRegistroEstoque := true
    else
      geraRegistroEstoque := false;

  except
    on E: Exception do
     begin
      ShowMessage(E.Message);
     end;

  end;
end;

procedure TformMovEntraMat.limpaCamposTela();
begin
  //limpa todos os campos do panel de informações do material
  for var i := 0 to pnlFundo.ControlCount - 1 do
  begin
    if pnlFundo.Controls[i] is TEdit then
      TEdit(pnlFundo.Controls[i]).Text := '';
  end;
end;

end.
