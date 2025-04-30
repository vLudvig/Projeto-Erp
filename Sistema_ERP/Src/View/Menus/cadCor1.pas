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
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
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
  modelCor.QcadastroCor.Close();
  modelCor.QcadastroCor.Open();
  if inclusao then
  begin
    sqlInsert := 'Insert into cor(CODIGO, DESCRICAO,ATIVA) ';
    sqlValues := 'values (:codigo, :descricao, :ativa);';
    if checkAtivo.Checked then corAtiva := 'S' else corAtiva := 'N';

    try
      modelCor.QcadastroCor.SQL.Text := sqlInsert + sqlValues;
      modelCor.QcadastroCor.ParamByName('codigo').AsInteger := StrToInt(tCodigo.Text);
      modelCor.QcadastroCor.ParamByName('descricao').AsString := tDesc.Text;
      modelCor.QcadastroCor.ParamByName('ativa').AsString := corAtiva;
      modelCor.QcadastroCor.ExecSQL;
      modelCor.QcadastroCor.Close();
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

procedure TcadCor.btnConsultarClick(Sender: TObject);
begin
  inherited;
  try
    formConsultaCores := TformConsultaCores.Create(nil);
  try
    if formConsultaCores.ShowModal = mrOk then
    begin
      tId.Text := IntToStr(formConsultaCores.registroSelecionado);
      // idMaterial(); // com o ID escrito, pega todos os outros campos;
    end;
  finally
    FreeAndNil(formConsultaCores);
  end;
  except
    on E: Exception do
      ShowMessage('Erro ao abrir formConsultaCores: ' + E.Message);
  end;

end;

procedure TcadCor.FormCreate(Sender: TObject);
begin
  inherited;
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

end.
