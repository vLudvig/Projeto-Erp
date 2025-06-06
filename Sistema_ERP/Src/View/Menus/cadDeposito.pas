unit cadDeposito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadGeral, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Model.Conexao, Model.Deposito, Consulta.Deposito;

type
  TformCadDeposito = class(TcadastroGeral)
    pnlGrid: TPanel;
    grpDep: TGroupBox;
    checkQtdeNeg: TCheckBox;
    checkSaidaMn: TCheckBox;
    checkEntMn: TCheckBox;
    radioTipoDep: TRadioGroup;
    rdBtnProd: TRadioButton;
    rdBtnMat: TRadioButton;
    DBGrid1: TDBGrid;
    DS_QgridDepos: TDataSource;
    QgridDepos: TFDQuery;
    QgridDeposID: TIntegerField;
    QgridDeposDESCRICAO: TStringField;
    QgridDeposTIPO_P_M: TStringField;
    QgridDeposATIVO: TStringField;
    QgridDeposCODIGO: TStringField;
    QgridDeposNEGATIVO: TStringField;
    QgridDeposSAIDA_MN: TStringField;
    QgridDeposENTRADA_MN: TStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure idDep;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadDeposito: TformCadDeposito;

implementation

{$R *.dfm}

procedure TformCadDeposito.idDep;
 var
    depAtivo: String;
    depProd_Mat: String;
    permQtdeNeg: String;
    permSaidaMn: String;
    permEntradaMn: String;

begin
  modelDeposito.QconsultaDeposito.SQL.Text := 'select * from deposito where ID = :id';
  modelDeposito.QconsultaDeposito.ParamByName('id').AsString := tId.Text;
  modelDeposito.QconsultaDeposito.Close;
  modelDeposito.QconsultaDeposito.Open;
  tCodigo.Text := modelDeposito.QconsultaDeposito.FieldByName('codigo').AsString;
  tDesc.Text := modelDeposito.QconsultaDeposito.FieldByName('descricao').AsString;
  depAtivo := modelDeposito.QconsultaDeposito.FieldByName('ATIVO').AsString;
  depProd_Mat := modelDeposito.QconsultaDeposito.FieldByName('Tipo_P_M').AsString;
  permQtdeNeg := modelDeposito.QconsultaDeposito.FieldByName('NEGATIVO').AsString;
  permSaidaMn := modelDeposito.QconsultaDeposito.FieldByName('SAIDA_MN').AsString;
  permEntradaMn := modelDeposito.QconsultaDeposito.FieldByName('ENTRADA_MN').AsString;

  if depAtivo = 'S' then checkAtivo.Checked := true else checkAtivo.Checked := false;
  grpDep.Enabled := true;
  if permQtdeNeg = 'S' then checkQtdeNeg.Checked := true else checkAtivo.Checked := false;
  if permSaidaMn = 'S' then checkSaidaMn.Checked := true else checkAtivo.Checked := false;
  if permEntradaMn = 'S' then checkEntMn.Checked := true else checkAtivo.Checked := false;
  grpDep.Enabled := false;
end;


procedure TformCadDeposito.btnAlterarClick(Sender: TObject);
begin
  inherited;
  grpDep.Enabled := true;
end;

procedure TformCadDeposito.btnConfirmarClick(Sender: TObject);
    var
    depAtivo: String;
    depProd_Mat: String;
    permQtdeNeg: String;
    permSaidaMn: String;
    permEntradaMn: String;
    sqlInsert: String;
    sqlValues: String;
    sqlUpdate: String;
begin
  if (inclusao) and (validaCamposObrigatorios) then
  begin
    sqlInsert := 'Insert into deposito(CODIGO, DESCRICAO, ATIVO, TIPO_P_M, NEGATIVO, SAIDA_MN, ENTRADA_MN) ';
    sqlValues := 'Values(:codigo, :descricao, :ativo, :tipoPM, :negativo, :saidaMn, :entradaMn) ';
    if checkAtivo.Checked then depAtivo := 'S' else depAtivo := 'N';
    if checkQtdeNeg.Checked then permQtdeNeg := 'S' else permQtdeNeg := 'N';
    if checkSaidaMn.Checked then permSaidaMn := 'S' else permSaidaMn := 'N';
    if checkEntMn.Checked then permEntradaMn := 'S' else permEntradaMn := 'N';
    if rdBtnProd.Checked then depProd_Mat := 'P' else depProd_Mat := 'M';

    try
      try
        modelDeposito.QcadDeposito.SQL.Text := sqlInsert + sqlValues;
        modelDeposito.QcadDeposito.ParamByName('codigo').AsString:= tCodigo.Text;
        modelDeposito.QcadDeposito.ParamByName('descricao').AsString:= tDesc.Text;
        modelDeposito.QcadDeposito.ParamByName('ativo').AsString:= depAtivo;
        modelDeposito.QcadDeposito.ParamByName('tipoPM').AsString:= depProd_Mat;
        modelDeposito.QcadDeposito.ParamByName('negativo').AsString:= permQtdeNeg;
        modelDeposito.QcadDeposito.ParamByName('saidaMn').AsString:= permSaidaMn;
        modelDeposito.QcadDeposito.ParamByName('entradaMn').AsString:= permEntradaMn;
        modelDeposito.QcadDeposito.ExecSQL;

        //Atualiza o Grid para aparecer o novo cadastro;
        QgridDepos.Close;
        QgridDepos.Open;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    finally
      modoConsulta;
    end;
  end
  else if (alteracao) and (validaCamposObrigatorios) then //ao confirmar apos apertar em alterar
  begin
    if checkAtivo.Checked then depAtivo := 'S' else depAtivo := 'N';
    if checkQtdeNeg.Checked then permQtdeNeg := 'S' else permQtdeNeg := 'N';
    if checkSaidaMn.Checked then permSaidaMn := 'S' else permSaidaMn := 'N';
    if checkEntMn.Checked then permEntradaMn := 'S' else permEntradaMn := 'N';
    sqlUpdate := 'Update deposito set DESCRICAO = :descricao , ATIVO = :ativo , ' +
      ' NEGATIVO = :negativo , SAIDA_MN = :saidaMn , ENTRADA_MN = :entradaMn where ID = :id';

    try
      try
        // REVISAR UPDATE - RETORNA ERRO NA EXPRESS�O
        modelDeposito.QcadDeposito.SQL.Text := sqlUpdate;
        modelDeposito.QcadDeposito.ParamByName('descricao').AsString := tDesc.Text;
        modelDeposito.QcadDeposito.ParamByName('ativo').AsString := depAtivo;
        modelDeposito.QcadDeposito.ParamByName('negativo').AsString := permQtdeNeg;
        modelDeposito.QcadDeposito.ParamByName('saidaMn').AsString := permSaidaMn;
        modelDeposito.QcadDeposito.ParamByName('entradaMn').AsString := permEntradaMn;
        modelDeposito.QcadDeposito.ParamByName('id').AsString := tId.Text;
        modelDeposito.QcadDeposito.ExecSQL;

        //Atualiza o Grid para aparecer o novo cadastro;
        QgridDepos.Close;
        QgridDepos.Open;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;

    finally
      modoConsulta;
    end;
  end;

end;

procedure TformCadDeposito.btnConsultarClick(Sender: TObject);
begin
  inherited;
  try
    formConsultaDep := TformConsultaDep.Create(nil);
    try
      if formConsultaDep.ShowModal = mrOk then
      begin
        tId.Text := IntToStr(formConsultaDep.registroSelecionado);
        idDep;
      end;
    finally
      FreeAndNil(formConsultaDep);
    end;
  finally

  end;
end;

procedure TformCadDeposito.btnDesistirClick(Sender: TObject);
begin
  inherited;
  if tId.Text <> '' then
      idDep;

end;

procedure TformCadDeposito.btnExcluirClick(Sender: TObject);
begin
  if Trim(tId.Text) <> '' then
  begin
    try
      modelDeposito.QcadDeposito.SQL.Text := 'delete from deposito where id = :id';
      modelDeposito.QcadDeposito.ParamByName('id').AsInteger := StrToInt(tId.Text);
      modelDeposito.QcadDeposito.ExecSQL;
      ShowMessage('Deposito excluido com sucesso!');
      QgridDepos.Close;
      QgridDepos.Open;
    except
      on E: Exception do
        ShowMessage('Erro ao excluir: ' + E.Message);
    end;
  end
  else
    ShowMessage('Nenhum Dep�sito encontrado, impossivel continuar');


  inherited;
end;

procedure TformCadDeposito.FormCreate(Sender: TObject);
begin
  inherited;
  modelDeposito := TmodelDeposito.Create(nil);

  if(Assigned(QgridDepos)) then
  begin
    QgridDepos.Close;
    QgridDepos.Open;
  end;

end;

procedure TformCadDeposito.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(modelDeposito);
end;



end.
