unit cadCor1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadGeral, Vcl.StdCtrls, Vcl.ExtCtrls, model.cor,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Consulta.Cor, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Model.Conexao,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TcadCor = class(TcadastroGeral)
    pnlGrid: TPanel;
    gridCores: TDBGrid;
    DS_GridCores: TDataSource;
    Qcores: TFDQuery;
    QcoresID: TIntegerField;
    QcoresDESCRICAO: TStringField;
    QcoresATIVA: TStringField;
    QcoresCODIGO: TStringField;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure idCor();
    procedure btnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadCor: TcadCor;

implementation

{$R *.dfm}

uses Consulta.Material;

procedure TcadCor.btnConfirmarClick(Sender: TObject);
var
  corAtiva: String;
  sqlValues: String;
  sqlInsert: String;

begin
  inherited;
  if inclusao and (tCodigo.Text <> '') then
  begin
    sqlInsert := 'Insert into cor(CODIGO, DESCRICAO,ATIVA) ';
    sqlValues := 'values (:codigo, :descricao, :ativa);';
    if checkAtivo.Checked then corAtiva := 'S' else corAtiva := 'N';

    try
      modelCor.QcadastroCor.SQL.Text := sqlInsert + sqlValues;
      modelCor.QcadastroCor.ParamByName('codigo').AsString := tCodigo.Text;
      modelCor.QcadastroCor.ParamByName('descricao').AsString := tDesc.Text;
      modelCor.QcadastroCor.ParamByName('ativa').AsString := corAtiva;
      modelCor.QcadastroCor.ExecSQL;
      //modelCor.QcadastroCor.Close();
      Qcores.Close;
      Qcores.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao cadastrar a Cor: ' + E.Message);
    end;
  end
  else
  begin

  end;
  modoConsulta();
end;

procedure TcadCor.btnConsultarClick(Sender: TObject);
begin
  inherited;
  try
    formConsultaCores := TformConsultaCores.Create(nil);
  try
    if formConsultaCores.ShowModal = mrOk then
    begin
      tId.Text := IntToStr(formConsultaCores.registroSelecionado);
      idCor(); // com o ID escrito, pega todos os outros campos;
    end;
  finally
    FreeAndNil(formConsultaCores);
  end;
  except
    on E: Exception do
      ShowMessage('Erro ao abrir formConsultaCores: ' + E.Message);
  end;

end;

procedure TcadCor.btnExcluirClick(Sender: TObject);
begin
  if tId.Text <> '' then
  begin
    modelCor.QcadastroCor.Close;
    modelCor.QcadastroCor.SQL.Clear;
    modelCor.QcadastroCor.SQL.Text := 'delete from material where id = :id';
    modelCor.QcadastroCor.ParamByName('id').AsInteger := StrToInt(tId.Text);
    try
      modelMaterial.QcadastroMaterial.ExecSQL;
      ShowMessage('Cor Excluida com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao excluir cor: ' + E.Message);
    end;
  end
  else
    ShowMessage('Nenhuma cor selecionada, impossivel continuar.');

  inherited;//limpa campos da tela
end;

procedure TcadCor.FormCreate(Sender: TObject);
begin
  inherited;
  modelCor := TmodelCor.Create(nil);
  //gridCores.Enabled := true;

    if Assigned(Qcores) then
    begin
      Qcores.Close;
      Qcores.Open;
    end
    else
    begin
      ShowMessage('Erro: Qcores não foi instanciado!');
    end;
end;

procedure TcadCor.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(modelCor);
end;

procedure TcadCor.idCor();
var sqlConsulta: String;
begin
  sqlConsulta := 'Select * from cor where id = :ID';
  modelCor.QconsultaCor.SQL.Text := sqlConsulta;
  modelCor.QconsultaCor.ParamByName('ID').AsInteger := StrToInt(tId.Text);
  modelCor.QconsultaCor.Close();
  modelCor.QconsultaCor.Open();

  if not modelCor.QconsultaCor.IsEmpty then
  begin
    tCodigo.Text := modelCor.QconsultaCor.FieldByName('codigo').AsString;
    tDesc.Text := modelCor.QconsultaCor.FieldByName('descricao').AsString;
    if modelCor.QconsultaCor.FieldByName('ativa').AsString = 'S' then
      checkAtivo.Checked := true
    else
      checkAtivo.Checked := false;
  end
  else
    ShowMessage('Material nao encontrado!');

  modelCor.QconsultaCor.Close();
end;

end.
