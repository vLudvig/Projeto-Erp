unit RelMovtoMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao, Consulta.Material, Consulta.Cor,
  Consulta.Deposito, Model.FuncGeral;

type
  TfmRelMovtoMat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    lblCodigo: TLabel;
    lblCor: TLabel;
    lblDep: TLabel;
    lblLote: TLabel;
    lblDesc: TLabel;
    btnConsMat: TSpeedButton;
    btnConsCor: TSpeedButton;
    btnConsDep1: TSpeedButton;
    tCodMat: TEdit;
    tCor: TEdit;
    tDescMat: TEdit;
    tDescCor: TEdit;
    tDep: TEdit;
    tDescDep: TEdit;
    tLote: TEdit;
    tDescMovto: TEdit;
    checkMatAtivo: TCheckBox;
    QconsultaMovto: TFDQuery;
    DS_QconsultaMovto: TDataSource;
    btnCons: TBitBtn;
    btnImprimir: TBitBtn;
    lblTpMov: TLabel;
    cbTpMov: TComboBox;
    procedure btnConsMatClick(Sender: TObject);
    procedure btnConsCorClick(Sender: TObject);
    procedure btnConsDep1Click(Sender: TObject);
    procedure tCodMatExit(Sender: TObject);
    procedure tCorExit(Sender: TObject);
    procedure tDepExit(Sender: TObject);
    procedure btnConsClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    var
      idMat: Integer;
  public
    { Public declarations }
  end;

var
  fmRelMovtoMat: TfmRelMovtoMat;

implementation

{$R *.dfm}

procedure TfmRelMovtoMat.btnConsClick(Sender: TObject);
  var
    SqlConsulta : String;
    tp_mov : String;
begin
    SqlConsulta := 'Select m.codigo as cod_material, m.descricao as material,' +
       ' c.codigo as cod_cor, c.descricao as cor, d.codigo as cod_deposito, d.descricao as deposito, ' +
       ' mm.quantidade, mm.operacao, mm.tipo_mov, mm.descricao_mov, mm.dt_movto, mm.hora_mov from mov_material mm ' +
       ' inner join material m on m.id = mm.material_id ' +
       ' inner join deposito d on d.id = mm.deposito_id ' +
       ' inner join cor c on c.id = mm.cor_id ' +
       ' where 1=1 ';

       // Adiciona condições no select com base em dados informados na tela
    if trim(tCodMat.Text) <> '' then SqlConsulta := SqlConsulta + ' and m.codigo = :codMat ';

    if trim(tCor.Text) <> '' then SqlConsulta := SqlConsulta + ' and c.codigo = :codCor ' ;

    if trim(tDep.Text) <> '' then SqlConsulta := SqlConsulta + ' and d.codigo = :codDep';

    if trim(tLote.Text) <> '' then SqlConsulta := SqlConsulta + ' and mm.lote = :lote ';

    if trim(tDescMovto.Text) <> '' then SqlConsulta := SqlConsulta + ' and mm.descricao_mov like :descMov' ;

    if checkMatAtivo.Checked then SqlConsulta := SqlConsulta + ' and m.ativo = ''S'''
    else SqlConsulta := SqlConsulta + ' and m.ativo <> ''S''';

    if cbTpMov.ItemIndex > 0 then SqlConsulta := SqlConsulta + ' and tipo_mov = :tp_mov' ;


    case cbTpMov.ItemIndex of
      1: tp_mov := 'AM' ;
      2: tp_mov := 'FAC' ;
      3: tp_mov := 'TIN' ;
      4: tp_mov := 'MAL' ;
      5: tp_mov := 'LAV' ;
    end;

    try
      QconsultaMovto.Close;
      QconsultaMovto.Sql.Text := SqlConsulta;

      if trim(tCodMat.Text) <> '' then QconsultaMovto.ParamByName('codMat').AsString := tCodMat.text;

      if trim(tCor.Text) <> '' then QconsultaMovto.ParamByName('codCor').AsString := tCor.text;

      if trim(tDep.Text) <> '' then QconsultaMovto.ParamByName('codDep').AsString := tDep.text;

      if trim(tLote.Text) <> '' then QconsultaMovto.ParamByName('lote').AsString := tLote.text;

      if trim(tDescMovto.Text) <> '' then QconsultaMovto.ParamByName('descMov').AsString := '%' + Trim(tDescMovto.Text) + '%';

      if cbTpMov.ItemIndex > 0 then QconsultaMovto.ParamByName('tp_mov').AsString := tp_mov;

      QconsultaMovto.Open;
    except on E: Exception do
      ShowMessage(E.Message);

    end;

end;

procedure TfmRelMovtoMat.btnConsCorClick(Sender: TObject);
begin
  formConsultaCores := TformConsultaCores.Create(nil);
  try
     //formConsultaCores.Qconsulta.Close;
     //formConsultaCores.Qconsulta.Sql.Text :=
     //   'select c.* from cor c ' +
     //   'inner join cor_material cm on c.id = cm.cor_id ' +
     //   'where cm.material_id = ' + IntToStr(idMat);
     //formConsultaCores.Qconsulta.Open;

     if formConsultaCores.ShowModal = mrOk then
     begin
        //Escreve as informações da cor conforme selecionado na consulta
       tCor.Text := formConsultaCores.codigoSelecionado;
       tDescCor.Text := formConsultaCores.descSelec;
     end;
  finally
     tCor.SetFocus;
     FreeAndNil(formConsultaCores);
  end;
end;

procedure TfmRelMovtoMat.btnConsDep1Click(Sender: TObject);
begin
  formConsultaDep := TformConsultaDep.Create(nil);
  try
     if formConsultaDep.ShowModal = mrOk then
     begin
      //Escreve as informações do deposito conforme selecionado na consulta
       tDep.Text := formConsultaDep.codigoSelecionado;
       tDescDep.Text := formConsultaDep.descSelec;
       //idDep := formConsultaDep.registroSelecionado;
     end;
  finally
     FreeAndNil(formConsultaDep);
  end;
end;

procedure TfmRelMovtoMat.btnConsMatClick(Sender: TObject);
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

procedure TfmRelMovtoMat.btnImprimirClick(Sender: TObject);
begin
  ShowMessage('A impressão só esta disponivel na versão paga do sistema, entre em contato com o administrador!');
end;

procedure TfmRelMovtoMat.tCodMatExit(Sender: TObject);
begin
  if Trim(tCodMat.Text) <> '' then
  begin
    try
      modelFuncGeral.QfuncGeral.Close;
      modelFuncGeral.QfuncGeral.SQL.Text := 'select * from material where codigo = :codigo';
      modelFuncGeral.QfuncGeral.ParamByName('codigo').AsString := tCodMat.Text;
      modelFuncGeral.QfuncGeral.Open;
      tDescMat.Text := modelFuncGeral.QfuncGeral.FieldByName('Descricao').AsString;
      idMat := modelFuncGeral.QfuncGeral.FieldByName('id').AsInteger;
      modelFuncGeral.QfuncGeral.Close;
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

procedure TfmRelMovtoMat.tCorExit(Sender: TObject);
begin
  if Trim(tCor.Text) <> '' then
  begin
    try
      modelFuncGeral.QfuncGeral.Close;
      modelFuncGeral.QfuncGeral.SQL.Text :=
        'select * from cor ' +
        'where codigo = :codigo';

      modelFuncGeral.QfuncGeral.ParamByName('codigo').AsString := tCor.Text;
      modelFuncGeral.QfuncGeral.Open;
      tDescCor.Text := modelFuncGeral.QfuncGeral.FieldByName('Descricao').AsString;
      modelFuncGeral.QfuncGeral.Close;
    except
      on E : Exception do
        ShowMessage('Erro ao encontrar cor ' + E.Message);
    end;
  end
  else
  begin
    tDescCor.Text := '';
  end;
end;

procedure TfmRelMovtoMat.tDepExit(Sender: TObject);
begin
  if Trim(tDep.Text) <> '' then
  begin
    try
      modelFuncGeral.QfuncGeral.Close;
      modelFuncGeral.QfuncGeral.SQL.Text := 'select * from deposito where codigo = :codigo';
      modelFuncGeral.QfuncGeral.ParamByName('codigo').AsString := tDep.Text;
      modelFuncGeral.QfuncGeral.Open;
      tDescDep.Text := modelFuncGeral.QfuncGeral.FieldByName('Descricao').AsString;
      modelFuncGeral.QfuncGeral.Close;
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

end.
