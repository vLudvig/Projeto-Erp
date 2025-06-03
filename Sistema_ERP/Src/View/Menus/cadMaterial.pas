unit cadMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, model.Material, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Consulta.Material, Model.Conexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Consulta.CategoriaMat,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Consulta.Cor, Consulta.GrupoMat;

type
  TcadastroMaterial = class(TForm)
    pnlCadastro: TPanel;
    pnlBotoes: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnConsultar: TButton;
    Label1: TLabel;
    tCodigoMat: TEdit;
    Descrição: TLabel;
    tDescMat: TEdit;
    Label2: TLabel;
    tGrupoMat: TEdit;
    Label3: TLabel;
    tCategoriaMat: TEdit;
    checkAtivo: TCheckBox;
    cbUnidade: TComboBox;
    Label4: TLabel;
    gridCores: TDBGrid;
    Label5: TLabel;
    btnConfirmar: TButton;
    btnDesistir: TButton;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    tIdMat: TEdit;
    lblId: TLabel;
    Button1: TButton;
    DS_Cor_Mat: TDataSource;
    QcorMaterial: TFDQuery;
    QcorMaterialCODIGO: TStringField;
    QcorMaterialDESCRICAO: TStringField;
    QcorMaterialATIVA: TStringField;
    btnAddCor: TButton;
    btnRemovCor: TButton;
    tDescGrupo: TEdit;
    tDescCategoria: TEdit;
    label8: TLabel;
    Label10: TLabel;
    btnConsultaGrupo: TButton;
    btnConsultaCategoria: TButton;
    procedure abrirTelaMaterial(Sender: TObject);
    procedure FecharTelaMaterial(Sender: TObject);
    procedure modoInclusao();
    procedure btnIncluirClick(Sender: TObject);
    procedure modoConsulta();
    procedure modoAlteracao();
    procedure btnDesistirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure idMaterial();
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAddCorClick(Sender: TObject);
    procedure adicionarCor();
    procedure removerCor();
    procedure btnRemovCorClick(Sender: TObject);
    function validaCamposConfirmar(): boolean;
    procedure btnConsultaGrupoClick(Sender: TObject);
    procedure limpaCamposTela();
    procedure tGrupoMatEnter(Sender: TObject);
    procedure tGrupoMatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsultaCategoriaClick(Sender: TObject);
    procedure tCategoriaMatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure descGrupoId();
    procedure descCategId();
    procedure tGrupoMatExit(Sender: TObject);
    procedure tCategoriaMatExit(Sender: TObject);
  private
    colunaSelecionada: String;
  public
    { Public declarations }
  end;

var
  cadastroMaterial: TcadastroMaterial;
  inclusao: boolean;
  alteracao: boolean;
  modelConexao: TmodelConexao;

implementation

{$R *.dfm}

procedure TcadastroMaterial.abrirTelaMaterial(Sender: TObject);
begin
    modoConsulta();
    try
      modelMaterial := TmodelMaterial.Create(nil);
    finally
      //FreeAndNil(modelMaterial);
    end;

end;

procedure TcadastroMaterial.modoInclusao();
begin
    if Assigned(modelMaterial) and Assigned(modelMaterial.QcadastroMaterial) then
    begin
      modelMaterial.QcadastroMaterial.Close;
      modelMaterial.QcadastroMaterial.Open;
    end
    else
    begin
      ShowMessage('Erro: modelMaterial ou QconsultaMaterial não foi instanciado!');
    end;
  inclusao := true;
  checkAtivo.Checked := true;
  pnlCadastro.Enabled := true;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;

  limpaCamposTela;
  
end;

procedure TcadastroMaterial.modoAlteracao();
begin
  inclusao := false;
  pnlCadastro.Enabled := true;
  tCodigoMat.Enabled := false;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;
  alteracao := true;
end;

procedure TcadastroMaterial.modoConsulta();
begin
  pnlCadastro.Enabled := false;
  btnConsultar.Visible := true;
  btnIncluir.Visible := true;
  btnAlterar.Visible := true;
  btnExcluir.Visible := true;
  btnConfirmar.Visible := false;
  btnDesistir.Visible := false;
  inclusao := false;
  alteracao := false;
end;

procedure TcadastroMaterial.limpaCamposTela;
begin
  //limpa todos os campos do panel de informações do material
  for var i := 0 to pnlCadastro.ControlCount - 1 do
  begin
    if pnlCadastro.Controls[i] is TEdit then
      TEdit(pnlCadastro.Controls[i]).Text := '';
  end;
end;

procedure TcadastroMaterial.btnAddCorClick(Sender: TObject);
begin
  if inclusao then
  begin
    ShowMessage('Necessário estar em alteração para adição de cores, impossivel adicionar cores ao incluir material!');
  end
  else
    adicionarCor();
end;

procedure TcadastroMaterial.adicionarCor;
begin
  try
    formConsultaCores := TformConsultaCores.Create(nil);
      try
        if formConsultaCores.ShowModal = mrOk then
        begin
          QcorMaterial.SQL.Text := 'insert into cor_material (cor_id, material_id) '
            + 'Values(:idCor, :idMat)';
          QcorMaterial.ParamByName('idCor').AsInteger := formConsultaCores.registroSelecionado;
          QcorMaterial.ParamByName('idMat').AsInteger := StrToInt(tIdMat.Text);
          QcorMaterial.ExecSQL;
          idMaterial();
        end;
    finally
      FreeAndNil(formConsultaCores);
    end;
    except
      on E: Exception do
        ShowMessage('Erro ao abrir formConsultaCores: ' + E.Message);
    end;
end;

procedure TcadastroMaterial.btnAlterarClick(Sender: TObject);
begin
  if tIdMat.Text <> '' then
     begin
        alteracao := true;
        modoAlteracao;
     end
  else
   ShowMessage('Nenhum material selecionado, impossivel continuar.');

end;

//Grava as Informaçoes da tela na tabela Material e volta para o modo Consulta
//Desabilitando os campos de edição.
procedure TcadastroMaterial.btnConfirmarClick(Sender: TObject);
var
  materialAtivo: String;
  sqlValues: String;
  sqlInsert: String;
  sqlUpdate: String;
begin
  if inclusao and validaCamposConfirmar then
  begin
    sqlInsert := 'Insert into material(CODIGO, DESCRICAO, QUANTIDADE_ESTOQUE, UNIDADE_ESTOQUE, GRUPO_MATERIAL_ID, CATEGORIA_MATERIAL_ID, ATIVO) ';
    sqlValues := 'values (:codigo, :descricao, :quantidade, :unidade, :grupo_material_id, :categoria_material_id, :ativo);';

    if checkAtivo.Checked then materialAtivo := 'S' else materialAtivo := 'N';

    try
      try
        modelMaterial.QcadastroMaterial.SQL.Text := sqlInsert + sqlValues;
        modelMaterial.QcadastroMaterial.ParamByName('codigo').AsString := tCodigoMat.Text;
        modelMaterial.QcadastroMaterial.ParamByName('descricao').AsString := tDescMat.Text;
        modelMaterial.QcadastroMaterial.ParamByName('quantidade').AsInteger := 0;
        modelMaterial.QcadastroMaterial.ParamByName('unidade').AsString := cbUnidade.Text;
        modelMaterial.QcadastroMaterial.ParamByName('ativo').AsString := materialAtivo;
        modelMaterial.QcadastroMaterial.ParamByName('grupo_material_id').AsInteger := StrToInt(tGrupoMat.Text);
        modelMaterial.QcadastroMaterial.ParamByName('categoria_material_id').AsInteger := StrToInt(tCategoriaMat.Text);
        modelMaterial.QcadastroMaterial.ExecSQL;
        modelMaterial.QcadastroMaterial.Close;

        modelMaterial.QconsultaMaterial.Close;
        modelMaterial.QconsultaMaterial.SQL.Text := 'select * from material where codigo = :codigo';
        modelMaterial.QconsultaMaterial.ParamByName('codigo').AsString := tCodigoMat.Text;
        modelMaterial.QconsultaMaterial.Open;
        tIdMat.Text := modelMaterial.QconsultaMaterial.FieldByName('id').AsString;
        modelMaterial.QconsultaMaterial.Close;
      except
        on E: Exception do
          ShowMessage('CADASTRO NÃO EFETUADO!'+ sLineBreak + 'Erro ao cadastrar o Material: ' + E.Message);
      end;
    finally
      limpaCamposTela;
      inclusao := false;
    end;

  end
  else if alteracao and validaCamposConfirmar then
  begin
    sqlUpdate := 'Update material set DESCRICAO = :descricao , UNIDADE_ESTOQUE = :unidade , ' +
        'GRUPO_MATERIAL_ID = :grupo_material_id , CATEGORIA_MATERIAL_ID = :categoria_material_id , ATIVO = :ativo ' +
        'where ID = :id';

    try
      modelMaterial.QcadastroMaterial.SQL.Text := sqlUpdate;
      modelMaterial.QcadastroMaterial.ParamByName('id').AsInteger := StrToInt(tIdMat.Text);
      modelMaterial.QcadastroMaterial.ParamByName('descricao').AsString := tDescMat.Text;
      modelMaterial.QcadastroMaterial.ParamByName('unidade').AsString := cbUnidade.Text;
      modelMaterial.QcadastroMaterial.ParamByName('ativo').AsString := materialAtivo;
      modelMaterial.QcadastroMaterial.ParamByName('grupo_material_id').AsInteger := StrToInt(tGrupoMat.Text);
      modelMaterial.QcadastroMaterial.ParamByName('categoria_material_id').AsInteger := StrToInt(tCategoriaMat.Text);
      modelMaterial.QcadastroMaterial.ExecSQL;
      modelMaterial.QcadastroMaterial.Close;
    finally
      alteracao := false;
    end;

  end
  else
  begin
    ShowMessage('Campo obrigatório não informado ou vazio, cadastro não efetuado!')
  end;

  modoConsulta();
end;

//Abre a tela de consulta de categoria de Material
procedure TcadastroMaterial.btnConsultaCategoriaClick(Sender: TObject);
begin
  formConsultaCategoriaMat := TformConsultaCategoriaMat.Create(nil);
  try
     if formConsultaCategoriaMat.ShowModal = mrOk then
     begin
      try
        tCategoriaMat.Text :=  IntToStr(formConsultaCategoriaMat.registroSelecionado);//Escreve o ID conforme selecionado na consulta
        formConsultaCategoriaMat.Qconsulta.Sql.Text := 'Select * from categoria_material where id = :ID';
        formConsultaCategoriaMat.Qconsulta.ParamByName('ID').AsInteger := StrToInt(tCategoriaMat.Text);
        formConsultaCategoriaMat.Qconsulta.Open;
        tDescCategoria.text := formConsultaCategoriaMat.Qconsulta.FieldByName('descricao').AsString;
      except
        on E: Exception do
           ShowMessage('Não foi possivel carregar esta categoria!')
      end;
     end;
  finally
     FreeAndNil(formConsultaCategoriaMat);
  end;
end;

procedure TcadastroMaterial.descGrupoId;
begin
    try
      try
        formConsultaGrupoMat := TformConsultaGrupoMat.Create(nil);
        formConsultaGrupoMat.Qconsulta.Close;
        formConsultaGrupoMat.Qconsulta.Sql.Text := 'Select * from grupo_material where id = :ID';
        formConsultaGrupoMat.Qconsulta.ParamByName('ID').AsInteger := StrToInt(tGrupoMat.Text);
        formConsultaGrupoMat.Qconsulta.Open;
        tDescGrupo.text := formConsultaGrupoMat.Qconsulta.FieldByName('descricao').AsString;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    finally
        FreeAndNil(formConsultaGrupoMat)
    end;
end;

procedure TcadastroMaterial.descCategId;
begin
    try
      try
        formConsultaCategoriaMat := TformConsultaCategoriaMat.Create(nil);
        formConsultaCategoriaMat.Qconsulta.Close;
        formConsultaCategoriaMat.Qconsulta.Sql.Text := 'Select * from categoria_material where id = :ID';
        formConsultaCategoriaMat.Qconsulta.ParamByName('ID').AsInteger := StrToInt(tCategoriaMat.Text);
        formConsultaCategoriaMat.Qconsulta.Open;
        tDescCategoria.text := formConsultaCategoriaMat.Qconsulta.FieldByName('descricao').AsString;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    finally
        FreeAndNil(formConsultaCategoriaMat)
    end;
end;

procedure TcadastroMaterial.btnConsultaGrupoClick(Sender: TObject);
begin
  formConsultaGrupoMat := TformConsultaGrupoMat.Create(nil);
  try
     if formConsultaGrupoMat.ShowModal = mrOk then
     begin
      try
        tGrupoMat.Text :=  IntToStr(formConsultaGrupoMat.registroSelecionado);//Escreve o ID conforme selecionado na consulta
        formConsultaGrupoMat.Qconsulta.Sql.Text := 'Select * from grupo_material where id = :ID';
        formConsultaGrupoMat.Qconsulta.ParamByName('ID').AsInteger := StrToInt(tGrupoMat.Text);
        formConsultaGrupoMat.Qconsulta.Open;
        tDescGrupo.text := formConsultaGrupoMat.Qconsulta.FieldByName('descricao').AsString;
      except
        on E: Exception do
           ShowMessage('Não foi possivel carregar este grupo!')
      end;
     end;
  finally
     FreeAndNil(formConsultaGrupoMat);
  end;
end;

procedure TcadastroMaterial.btnConsultarClick(Sender: TObject);
begin
  formConsultaMaterial := TformConsultaMaterial.Create(nil);
  try
     if formConsultaMaterial.ShowModal = mrOk then
     begin
       tIdMat.Text :=  IntToStr(formConsultaMaterial.registroSelecionado);//Escreve o ID conforme selecionado na consulta
       idMaterial();//com o ID escrito, pega todos os outros campos;
     end;
  finally
     FreeAndNil(formConsultaMaterial);
  end;
end;

procedure TcadastroMaterial.idMaterial();
var
  sqlConsulta: String;
  sqlConsultaCores: String;
begin
  sqlConsulta := 'Select * from material where id = :ID';
  modelMaterial.QconsultaMaterial.SQL.Text := sqlConsulta;
  modelMaterial.QconsultaMaterial.ParamByName('ID').AsInteger := StrToInt(tIdMat.Text);
  modelMaterial.QconsultaMaterial.Close();
  modelMaterial.QconsultaMaterial.Open();
  sqlConsultaCores := 'select c.codigo, c.descricao, c.ativa from cor c inner join cor_material cm '
      + ' on c.id = cm.cor_id'
      + ' inner join material m'
      + ' on m.id = cm.Material_id'
      + ' where m.id = :idMat';
  QcorMaterial.SQL.Text := sqlConsultaCores;
  QcorMaterial.ParamByName('idMat').AsInteger := StrToInt(tIdMat.Text);
  QcorMaterial.Open();
  
  if not modelMaterial.QconsultaMaterial.IsEmpty then
  begin
    tCodigoMat.Text := modelMaterial.QconsultaMaterial.FieldByName('codigo').AsString;
    tDescMat.Text := modelMaterial.QconsultaMaterial.FieldByName('descricao').AsString;
    cbUnidade.Text := modelMaterial.QconsultaMaterial.FieldByName('UNIDADE_ESTOQUE').AsString;
    tCategoriaMat.Text := modelMaterial.QconsultaMaterial.FieldByName('CATEGORIA_MATERIAL_ID').AsString;
    tGrupoMat.Text := modelMaterial.QconsultaMaterial.FieldByName('GRUPO_MATERIAL_ID').AsString;
    if modelMaterial.QconsultaMaterial.FieldByName('ativo').AsString = 'S' then
      checkAtivo.Checked := true
    else
      checkAtivo.Checked := false;

    if Trim(tGrupoMat.Text) <> '' then descGrupoId();
    if Trim(tCategoriaMat.Text) <> '' then descCategId();
  end
  else
    ShowMessage('Material nao encontrado!');

  modelMaterial.QconsultaMaterial.Close();
end;

procedure TcadastroMaterial.btnDesistirClick(Sender: TObject);
begin
  modoConsulta();
end;

procedure TcadastroMaterial.btnExcluirClick(Sender: TObject);
begin
  if tIdMat.Text <> '' then
  begin
    modelMaterial.QcadastroMaterial.Close;
    modelMaterial.QcadastroMaterial.SQL.Clear;
    modelMaterial.QcadastroMaterial.SQL.Text := 'delete from material where id = :id';
    modelMaterial.QcadastroMaterial.ParamByName('id').AsInteger := StrToInt(tIdMat.Text);
    try
      modelMaterial.QcadastroMaterial.ExecSQL;
      ShowMessage('Material Excluido com sucesso!');
      limpaCamposTela;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir material: ' + E.Message);
    end;
  end
  else
    ShowMessage('Nenhum material selecionado, impossivel continuar.');
end;

procedure TcadastroMaterial.btnIncluirClick(Sender: TObject);
begin
  modoInclusao();
  QcorMaterial.Close;
  QcorMaterial.SQL.Text := 'select c.codigo, c.descricao, c.ativa from cor c '
      + ' where 1=0';
  QcorMaterial.Open;
end;

procedure TcadastroMaterial.btnRemovCorClick(Sender: TObject);
begin
  if inclusao then
    ShowMessage('Impossivel remover cores ao incluir material, necessário estar em alteração!')
  else
    removerCor();
end;

procedure TcadastroMaterial.removerCor;
var
  codCorRemove: String;
  idCorRemove: integer;
begin
  try
     // Captura o código da cor da linha selecionada no grid
    codCorRemove := QcorMaterial.FieldByName('codigo').AsString;

    // Primeiro busca o ID da cor pelo código
    //QcorMaterial.Close; testessss
    modelMaterial.QremoveCorMat.SQL.Text := 'select * from cor where codigo = :codigoCor';
    modelMaterial.QremoveCorMat.ParamByName('codigoCor').AsString := codCorRemove;
    modelMaterial.QremoveCorMat.Open;

    if modelMaterial.QremoveCorMat.IsEmpty then
      raise Exception.Create('Cor não encontrada!');

    idCorRemove := modelMaterial.QremoveCorMat.FieldByName('id').AsInteger;
    modelMaterial.QremoveCorMat.Close;

    // Agora realiza o delete no vínculo cor_material
    modelMaterial.QremoveCorMat.SQL.Text := 'delete from cor_material where material_id = :idMaterial and cor_id = :idCor';
    modelMaterial.QremoveCorMat.ParamByName('idMaterial').AsInteger := StrToInt(tIdMat.Text); // ou tCodigoMat.Text se for ID
    modelMaterial.QremoveCorMat.ParamByName('idCor').AsInteger := idCorRemove;
    modelMaterial.QremoveCorMat.ExecSQL;
    idMaterial();

    ShowMessage('Cor removida com sucesso.');
  except on E: Exception do
    ShowMessage('Erro ao excluir cor do material: ' + E.Message);

  end;
end;

procedure TcadastroMaterial.tCategoriaMatExit(Sender: TObject);
begin
  if Trim(tCategoriaMat.Text) <> '' then descCategId();

end;

procedure TcadastroMaterial.tCategoriaMatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Trim(tCategoriaMat.Text) <> '') then
  begin
    descCategId(); //Escreve a descricao da categoria com ID informado
  end;
end;

procedure TcadastroMaterial.tGrupoMatEnter(Sender: TObject);
begin
  try
    try
      formConsultaGrupoMat.Qconsulta.Close;
      formConsultaGrupoMat.Qconsulta.Sql.Text := 'Select * from grupo_material where id = :ID';
      formConsultaGrupoMat.Qconsulta.ParamByName('ID').AsInteger := StrToInt(tGrupoMat.Text);
      formConsultaGrupoMat.Qconsulta.Open;
      tDescGrupo.text := formConsultaGrupoMat.Qconsulta.FieldByName('descricao').AsString;
    except
     on E: Exception do
      ShowMessage('Grupo não encontrado: ' + E.Message)
    end;
  finally
  end;
end;

procedure TcadastroMaterial.tGrupoMatExit(Sender: TObject);
begin
  if Trim(tGrupoMat.Text) <> '' then descGrupoId();//Escreve a desc do grupo
end;

procedure TcadastroMaterial.tGrupoMatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Trim(tGrupoMat.Text) <> '') then
  begin
    descGrupoId(); //Escreve a descrição do grupo a partir do id informado!
  end;
end;

procedure TcadastroMaterial.btnFecharClick(Sender: TObject);
begin
  if btnIncluir.Visible then
    Self.Close
  else
    ShowMessage('Registro em Alteração, impossível continuar!')
end;

procedure TcadastroMaterial.FecharTelaMaterial(Sender: TObject);
begin
  inherited;
  FreeAndNil(modelMaterial);
  FreeAndNil(modelConexao);
end;

function TcadastroMaterial.validaCamposConfirmar: boolean;
begin
  if (tCodigoMat.Text <> '')
    and (cbUnidade.ItemIndex.ToString <> '') and (tDescMat.Text <> '')
    and ((Trim(tGrupoMat.Text) <> '') and (Trim(tDescGrupo.Text) <> ''))
    and ((Trim(tCategoriaMat.Text) <> '') and (Trim(tDescCategoria.Text) <> '')) then
    validaCamposConfirmar := true
  else
    validaCamposConfirmar := false;
end;

end.
