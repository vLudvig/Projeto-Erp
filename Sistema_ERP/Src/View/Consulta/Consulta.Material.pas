unit Consulta.Material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Consulta.Principal, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, model.Material, Model.Conexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TformConsultaMaterial = class(TformConsultaPrincipal)
    QconsultaID: TIntegerField;
    QconsultaDESCRICAO: TStringField;
    QconsultaQUANTIDADE_ESTOQUE: TFMTBCDField;
    QconsultaUNIDADE_ESTOQUE: TStringField;
    QconsultaGRUPO_MATERIAL_ID: TIntegerField;
    QconsultaCATEGORIA_MATERIAL_ID: TIntegerField;
    QconsultaATIVO: TStringField;
    QconsultaCODIGO: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure btnSelecRegClick(Sender: TObject);
    procedure tBuscaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SelecionaRegistro();
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BuscarDados;
    procedure tBuscaChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure buscarMateriais(condicao: String);
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
  SelecionaRegistro();
end;

//Salva na variavel registroSelecionado o valor selecionado no grid e fecha a tela
procedure TformConsultaMaterial.SelecionaRegistro();
begin
  if dataSourceGrid.DataSet.IsEmpty then
    raise Exception.Create('Selecione um Registro');

  registroSelecionado := Qconsulta.FieldByName('ID').AsInteger;
  Qconsulta.Close;
  ModalResult := mrOk;
end;

//Roda depois do FormCreate(é redundante mas funciona)
procedure TformConsultaMaterial.FormShow(Sender: TObject);
begin
  inherited;
  if not Assigned(modelMaterial) then
    modelMaterial := TmodelMaterial.Create(nil);

  if not Assigned(Qconsulta.Connection) then
    Qconsulta.Connection := modelConexao.FDConnection1;

  if not modelConexao.FDConnection1.Connected then
    modelConexao.FDConnection1.Connected := True;

  if Assigned(Qconsulta) then
  begin
    Qconsulta.Close;
    Qconsulta.Open;
  end;
end;

procedure TformConsultaMaterial.FormCreate(Sender: TObject);
begin
  inherited;

  if Assigned(Qconsulta) then
  begin
    Qconsulta.Close;
    Qconsulta.Open;
  end
  else
  begin
    ShowMessage('Erro: Qconsulta não foi instanciado!');
  end;

end;

procedure TformConsultaMaterial.tBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //inherited;
  case(Key)of
    VK_UP: dataSourceGrid.DataSet.Prior;
    VK_DOWN: dataSourceGrid.DataSet.Next;
  end;
end;

procedure TformConsultaMaterial.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(Qconsulta) then
  begin
    if Qconsulta.Active then
       Qconsulta.Close;
  end;
  if Assigned(modelMaterial.QconsultaMaterial) then
  begin
    if modelMaterial.QconsultaMaterial.Active then
       modelMaterial.QconsultaMaterial.Close;
  end;
end;


procedure TformConsultaMaterial.tBuscaChange(Sender: TObject);
begin
  inherited;
  BuscarDados;
end;

procedure TformConsultaMaterial.BuscarDados;
var Lcondicao: string;
begin
  Lcondicao := '';
  case cmbBusca.ItemIndex of
   0: Lcondicao := 'where descricao like '+ QuotedStr('%' + tBusca.Text + '%');
   1: Lcondicao := 'where codigo like '+ QuotedStr('%' + tBusca.Text + '%');
  end;

  buscarMateriais(Lcondicao);

end;

procedure TformConsultaMaterial.buscarMateriais(condicao: string);
begin
  Qconsulta.Close;
  Qconsulta.SQL.Clear;
  Qconsulta.SQL.Add('Select * from material');
  Qconsulta.SQL.Add(condicao);
  Qconsulta.Open;
end;
end.
