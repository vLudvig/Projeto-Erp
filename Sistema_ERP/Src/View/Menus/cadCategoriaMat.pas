unit cadCategoriaMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadGeral, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Model.Conexao, Model.CategoriaMat, Consulta.CategoriaMat;

type
  TcadCategoriaMaterial = class(TcadastroGeral)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DS_QcategoriaMat: TDataSource;
    QcategoriaMat: TFDQuery;
    QcategoriaMatID: TIntegerField;
    QcategoriaMatCODIGO: TStringField;
    QcategoriaMatDESCRICAO: TStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure idCategoria();//Escreve as informações na tela conforme id consultado
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadCategoriaMaterial: TcadCategoriaMaterial;

implementation

{$R *.dfm}

uses Model.GrupoMaterial;

procedure TcadCategoriaMaterial.btnConfirmarClick(Sender: TObject);
var
  sqlInsert: String;
  sqlValues: String;
  categoriaAtiva: String;
  grupoInv: String;
  grupoMov: String;
begin
  //com valor booleano de inclusão, verifica se deve rodar um insert ou update
  //caso não informado o valor no campo codigo, não permite continuar.
  if inclusao and (Trim(tCodigo.Text) <> '') then
  begin
    sqlInsert := 'Insert into categoria_material(CODIGO, DESCRICAO, ATIVO) ';
    sqlValues := 'values (:codigo, :descricao, :ativo);';
    if checkAtivo.Checked then categoriaAtiva := 'S' else categoriaAtiva := 'N';
    try
      try
        modelCategoriaMat.QcadastroCategoria.SQL.Text := sqlInsert + sqlValues;
        modelCategoriaMat.QcadastroCategoria.ParamByName('codigo').AsString := tCodigo.Text;
        modelCategoriaMat.QcadastroCategoria.ParamByName('descricao').AsString := tDesc.Text;
        modelCategoriaMat.QcadastroCategoria.ParamByName('ativo').AsString := categoriaAtiva;
        modelCategoriaMat.QcadastroCategoria.ExecSQL;

        //Recarrega o Grid principal da tela, atualizando com este novo cadastro
        QcategoriaMat.Close;
        QcategoriaMat.Open;
      except
        on E: Exception do
          ShowMessage('Erro ao cadastrar o Grupo do Material: ' + E.Message);
      end;
    finally
      inclusao := false;
    end;
  end
  else
  begin
    ShowMessage('Informe um código válido para prosseguir!');
  end;
  modoConsulta();
end;

procedure TcadCategoriaMaterial.btnConsultarClick(Sender: TObject);
begin
  try
    formConsultaCategoriaMat := TformConsultaCategoriaMat.Create(nil);
    try
      if formConsultaCategoriaMat.ShowModal = mrOk then
      begin
        tId.Text := IntToStr(formConsultaCategoriaMat.registroSelecionado);
        idCategoria(); // com o ID escrito, pega todos os outros campos;
      end;
    finally
      FreeAndNil(formConsultaCategoriaMat);
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao abrir consulta de categoria de material: '+ sLineBreak + E.Message);
  end;
end;

procedure TcadCategoriaMaterial.FormCreate(Sender: TObject);
begin
  inherited;
  try
    QcategoriaMat.Open();
    modelCategoriaMat := TmodelCategoriaMat.Create(nil);
  except
    on E: Exception do
      ShowMessage('Nao foi possivel verificar cadastros de grupo: ' + E.Message)
  end;
end;

procedure TcadCategoriaMaterial.idCategoria;
var sqlConsulta: String;
begin
  sqlConsulta := 'Select * from categoria_material where id = :ID';
  modelCategoriaMat.QconsultaCategoria.SQL.Text := sqlConsulta;
  modelCategoriaMat.QconsultaCategoria.ParamByName('ID').AsInteger := StrToInt(tId.Text);
  modelCategoriaMat.QconsultaCategoria.Close();
  modelCategoriaMat.QconsultaCategoria.Open();

  if not modelCategoriaMat.QconsultaCategoria.IsEmpty then
  begin
    tCodigo.Text := modelCategoriaMat.QconsultaCategoria.FieldByName('codigo').AsString;
    tDesc.Text := modelCategoriaMat.QconsultaCategoria.FieldByName('descricao').AsString;

    //Check Ativo
    if modelCategoriaMat.QconsultaCategoria.FieldByName('ativo').AsString = 'S' then
      checkAtivo.Checked := true
    else
      checkAtivo.Checked := false;
  end
  else
    ShowMessage('Categoria nao encontrado!');

  modelCategoriaMat.QconsultaCategoria.Close();
end;


end.
