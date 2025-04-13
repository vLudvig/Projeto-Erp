unit cadMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, model.Material, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Consulta.Material, Model.Conexao;

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
    DBGrid1: TDBGrid;
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
    procedure Button1Click(Sender: TObject);
    procedure idMaterial();
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadastroMaterial: TcadastroMaterial;
  inclusao: boolean;
  modelConexao: TmodelConexao;

implementation

{$R *.dfm}

procedure TcadastroMaterial.abrirTelaMaterial(Sender: TObject);
begin
    modoConsulta();
end;

procedure TcadastroMaterial.modoInclusao();
begin
  inclusao := true;
  checkAtivo.Checked := true;
  pnlCadastro.Enabled := true;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;

//limpa todos os campos do panel de informações do material  
  for var i := 0 to pnlCadastro.ControlCount - 1 do
  begin
    if pnlCadastro.Controls[i] is TEdit then
      TEdit(pnlCadastro.Controls[i]).Text := '';
  end;
  
end;

procedure TcadastroMaterial.modoAlteracao();
begin
  inclusao := false;
  pnlCadastro.Enabled := true;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;
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
end;

procedure TcadastroMaterial.btnAlterarClick(Sender: TObject);
begin
  if tIdMat.Text <> '' then
     modoAlteracao
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
begin
  if inclusao then
  begin
    sqlInsert := 'Insert into material(CODIGO, DESCRICAO, QUANTIDADE_ESTOQUE, UNIDADE_ESTOQUE,ATIVO) ';
    sqlValues := 'values (:codigo, :descricao, :quantidade, :unidade, :ativo);';
    if checkAtivo.Checked then materialAtivo := 'S' else materialAtivo := 'N';

    try
      modelMaterial.QcadastroMaterial.SQL.Text := sqlInsert + sqlValues;
      modelMaterial.QcadastroMaterial.ParamByName('codigo').AsInteger := StrToInt(tCodigoMat.Text); 
      modelMaterial.QcadastroMaterial.ParamByName('descricao').AsString := tDescMat.Text; 
      modelMaterial.QcadastroMaterial.ParamByName('quantidade').AsInteger := 0; 
      modelMaterial.QcadastroMaterial.ParamByName('unidade').AsString := 'MT'; 
      modelMaterial.QcadastroMaterial.ParamByName('ativo').AsString := materialAtivo; 
      modelMaterial.QcadastroMaterial.ExecSQL;
    except
      on E: Exception do
        ShowMessage('Erro ao cadastrar o Material: ' + E.Message);
    end;
  end
  else
  begin

  end;
  modoConsulta();
end;

//Abre a tela de consulta de Material
procedure TcadastroMaterial.btnConsultarClick(Sender: TObject);
begin
  formConsultaMaterial := TformConsultaMaterial.Create(nil);
  try
     if formConsultaMaterial.ShowModal = mrOk then
     begin
       tIdMat.Text :=  IntToStr(formConsultaMaterial.registroSelecionado);//Escreve o ID conforme selecionado na consulta
       idMaterial;//com o ID escrito, pega todos os outros campos;
     end;
  finally
     FreeAndNil(formConsultaMaterial);
  end;
end;

procedure TcadastroMaterial.idMaterial();
var sqlConsulta: String;
begin
  sqlConsulta := 'Select * from material where id = :ID';
  modelMaterial.QconsultaMaterial.SQL.Text := sqlConsulta; 
  modelMaterial.QconsultaMaterial.ParamByName('ID').AsInteger := StrToInt(tIdMat.Text);
  modelMaterial.QconsultaMaterial.Close();
  modelMaterial.QconsultaMaterial.Open();
  
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
end;

procedure TcadastroMaterial.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TcadastroMaterial.FecharTelaMaterial(Sender: TObject);
begin
  inherited;
  FreeAndNil(modelMaterial);
  FreeAndNil(modelConexao);
end;

end.
