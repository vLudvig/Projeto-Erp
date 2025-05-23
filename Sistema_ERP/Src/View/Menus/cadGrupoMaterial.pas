unit cadGrupoMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadGeral, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Model.Conexao, Vcl.Grids, Vcl.DBGrids, Model.GrupoMaterial, Consulta.GrupoMat;

type
  TformCadGrupoMat = class(TcadastroGeral)
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    DS_QgrupoMaterial: TDataSource;
    QgrupoMaterial: TFDQuery;
    groupParams: TGroupBox;
    checkMovEst: TCheckBox;
    checkGeraInv: TCheckBox;
    CheckBox3: TCheckBox;
    Label5: TLabel;
    QgrupoMaterialID: TIntegerField;
    QgrupoMaterialCODIGO: TStringField;
    QgrupoMaterialDESCRICAO: TStringField;
    QgrupoMaterialMOVIMENTA_ESTOQUE: TStringField;
    QgrupoMaterialGERA_INVENTARIO: TStringField;
    QgrupoMaterialATIVO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure idGrupo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadGrupoMat: TformCadGrupoMat;

implementation

{$R *.dfm}


procedure TformCadGrupoMat.btnConfirmarClick(Sender: TObject);
var
  sqlInsert: String;
  sqlValues: String;
  grupoAtivo: String;
  grupoInv: String;
  grupoMov: String;
begin
  //inherited;
  if inclusao and (tCodigo.Text <> '') then
  begin
    sqlInsert := 'Insert into grupo_material(CODIGO, DESCRICAO, MOVIMENTA_ESTOQUE, GERA_INVENTARIO, ATIVO) ';
    sqlValues := 'values (:codigo, :descricao, :mov_estoque, :gera_inv, :ativo);';
    if checkAtivo.Checked then grupoAtivo := 'S' else grupoAtivo := 'N';
    if checkGeraInv.Checked then grupoInv := 'S' else grupoInv := 'N';
    if checkMovEst.Checked then grupoMov := 'S' else grupoMov := 'N';
    try
      try
        modelGrupoMaterial.QcadastroGrupo.SQL.Text := sqlInsert + sqlValues;
        modelGrupoMaterial.QcadastroGrupo.ParamByName('codigo').AsString := tCodigo.Text;
        modelGrupoMaterial.QcadastroGrupo.ParamByName('descricao').AsString := tDesc.Text;
        modelGrupoMaterial.QcadastroGrupo.ParamByName('mov_estoque').AsString := grupoMov;
        modelGrupoMaterial.QcadastroGrupo.ParamByName('gera_inv').AsString := grupoInv;
        modelGrupoMaterial.QcadastroGrupo.ParamByName('ativo').AsString := grupoAtivo;
        modelGrupoMaterial.QcadastroGrupo.ExecSQL;

        //Recarrega o Grid principal da tela, atualizando com este novo cadastro
        QgrupoMaterial.Close;
        QgrupoMaterial.Open;
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

  end;
  modoConsulta();
end;

procedure TformCadGrupoMat.btnConsultarClick(Sender: TObject);
begin
  try
    formConsultaGrupoMat := TformConsultaGrupoMat.Create(nil);
    try
      if formConsultaGrupoMat.ShowModal = mrOk then
      begin
        tId.Text := IntToStr(formConsultaGrupoMat.registroSelecionado);
        idGrupo(); // com o ID escrito, pega todos os outros campos;
      end;
    finally
      FreeAndNil(formConsultaGrupoMat);
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao abrir formConsultaCores: ' + E.Message);
  end;

end;

procedure TformCadGrupoMat.FormCreate(Sender: TObject);
begin
  inherited;
  try
    QgrupoMaterial.Open();
    modelGrupoMaterial := TmodelGrupoMaterial.Create(nil);
  except
    on E: Exception do
      ShowMessage('Nao foi possivel verificar cadastros de grupo: ' + E.Message)
  end;
end;

procedure TformCadGrupoMat.idGrupo();
var sqlConsulta: String;
begin
  sqlConsulta := 'Select * from grupo_material where id = :ID';
  modelGrupoMaterial.QconsultaGrupo.SQL.Text := sqlConsulta;
  modelGrupoMaterial.QconsultaGrupo.ParamByName('ID').AsInteger := StrToInt(tId.Text);
  modelGrupoMaterial.QconsultaGrupo.Close();
  modelGrupoMaterial.QconsultaGrupo.Open();

  if not modelGrupoMaterial.QconsultaGrupo.IsEmpty then
  begin
    tCodigo.Text := modelGrupoMaterial.QconsultaGrupo.FieldByName('codigo').AsString;
    tDesc.Text := modelGrupoMaterial.QconsultaGrupo.FieldByName('descricao').AsString;

    //Check Ativo
    if modelGrupoMaterial.QconsultaGrupo.FieldByName('ativo').AsString = 'S' then
      checkAtivo.Checked := true
    else
      checkAtivo.Checked := false;

    //Check Movimenta Estoque
    if modelGrupoMaterial.QconsultaGrupo.FieldByName('movimenta_estoque').AsString = 'S' then
      checkMovEst.Checked := true
    else
      checkMovEst.Checked := false;

    //Check Gera Inventario
    if modelGrupoMaterial.QconsultaGrupo.FieldByName('gera_inventario').AsString = 'S' then
      checkGeraInv.Checked := true
    else
      checkGeraInv.Checked := false;
  end
  else
    ShowMessage('Grupo nao encontrado!');

  modelGrupoMaterial.QconsultaGrupo.Close();
end;

end.
