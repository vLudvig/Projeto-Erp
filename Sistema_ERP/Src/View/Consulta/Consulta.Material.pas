unit Consulta.Material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Consulta.Principal, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, model.Material, Model.Conexao;

type
  TformConsultaMaterial = class(TformConsultaPrincipal)
    procedure FormDestroy(Sender: TObject);
    procedure btnSelecRegClick(Sender: TObject);
    procedure tBuscaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SelecionaRegistro();
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    var
    registroSelecionado: integer;
  end;

var
  formConsultaMaterial: TformConsultaMaterial;
  modelMaterial: TmodelMaterial;
  modelConexao: TmodelConexao;


implementation

{$R *.dfm}

procedure TformConsultaMaterial.btnSelecRegClick(Sender: TObject);
begin
  inherited;
  SelecionaRegistro();
end;

//Salva na variavel registroSelecionado o valor selecionado no grid e fecha a tela
procedure TformConsultaMaterial.SelecionaRegistro();
begin
  if modelMaterial.DS_QconsultaMaterial.DataSet.IsEmpty then
    raise Exception.Create('Selecione um Registro');

  registroSelecionado := modelMaterial.QconsultaMaterial.FieldByName('ID').AsInteger;
  modelMaterial.QconsultaMaterial.Close;
  ModalResult := mrOk;
end;

//Garante que o registro selecionado no grid seja sempre atualizado.
procedure TformConsultaMaterial.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  modelMaterial.QconsultaMaterial.RecNo := DBGrid1.DataSource.DataSet.RecNo;
end;

procedure TformConsultaMaterial.FormShow(Sender: TObject);
begin
  inherited;
  if not Assigned(modelMaterial) then
    modelMaterial := TmodelMaterial.Create(nil);

  if not Assigned(modelMaterial.QconsultaMaterial.Connection) then
    modelMaterial.QconsultaMaterial.Connection := modelConexao.FDConnection1;

  if not modelConexao.FDConnection1.Connected then
    modelConexao.FDConnection1.Connected := True;

  if Assigned(modelMaterial.QconsultaMaterial) then
  begin
    modelMaterial.QconsultaMaterial.Close;
    modelMaterial.QconsultaMaterial.Open;
  end;
end;


procedure TformConsultaMaterial.FormCreate(Sender: TObject);
begin
  inherited;
  modelMaterial := TmodelMaterial.Create(nil);
  if Assigned(modelMaterial) and Assigned(modelMaterial.QconsultaMaterial) then
  begin
    modelMaterial.QconsultaMaterial.Close;
    modelMaterial.QconsultaMaterial.Open;
  end
  else
  begin
    ShowMessage('Erro: modelMaterial ou QconsultaMaterial não foi instanciado!');
  end;
end;

procedure TformConsultaMaterial.tBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case(Key)of
    VK_UP: modelMaterial.DS_QconsultaMaterial.DataSet.Prior;
    VK_DOWN: modelMaterial.DS_QconsultaMaterial.DataSet.Next;
  end;
end;

procedure TformConsultaMaterial.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(modelMaterial) and Assigned(modelMaterial.QconsultaMaterial) then
  begin
    if modelMaterial.QconsultaMaterial.Active then
       modelMaterial.QconsultaMaterial.Close;
  end;
end;

end.
