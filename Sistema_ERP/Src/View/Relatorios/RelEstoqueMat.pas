unit RelEstoqueMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RelMovtoMat, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, funcGeral;

type
  TfmRelEstoqueMat = class(TfmRelMovtoMat)
    procedure btnConsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRelEstoqueMat: TfmRelEstoqueMat;

implementation

{$R *.dfm}

procedure TfmRelEstoqueMat.btnConsClick(Sender: TObject);
  var
    SqlConsulta : String;
begin
    SqlConsulta := 'Select m.codigo as cod_material, m.descricao as material,' +
       ' c.codigo as cod_cor, c.descricao as cor, d.codigo as cod_deposito, d.descricao as deposito, ' +
       ' est.quantidade, est.lote from estoque_material est ' +
       ' inner join material m on m.id = est.material_id ' +
       ' inner join deposito d on d.id = est.deposito_id ' +
       ' inner join cor c on c.id = est.cor_id ' +
       ' where 1=1 ';

       // Adiciona condições no select com base em dados informados na tela
    if trim(tCodMat.Text) <> '' then SqlConsulta := SqlConsulta + ' and m.codigo = :codMat ';

    if trim(tCor.Text) <> '' then SqlConsulta := SqlConsulta + ' and c.codigo = :codCor ' ;

    if trim(tDep.Text) <> '' then SqlConsulta := SqlConsulta + ' and d.codigo = :codDep';

    if trim(tLote.Text) <> '' then SqlConsulta := SqlConsulta + ' and est.lote = :lote ';

    if checkMatAtivo.Checked then SqlConsulta := SqlConsulta + ' and m.ativo = ''S'''
    else SqlConsulta := SqlConsulta + ' and m.ativo <> ''S''';

    try
      QconsultaMovto.Close;
      QconsultaMovto.Sql.Text := SqlConsulta;

      if trim(tCodMat.Text) <> '' then QconsultaMovto.ParamByName('codMat').AsString := tCodMat.text;

      if trim(tCor.Text) <> '' then QconsultaMovto.ParamByName('codCor').AsString := tCor.text;

      if trim(tDep.Text) <> '' then QconsultaMovto.ParamByName('codDep').AsString := tDep.text;

      if trim(tLote.Text) <> '' then QconsultaMovto.ParamByName('lote').AsString := tLote.text;

      QconsultaMovto.Open;

      //grava log
      mensagem_log := 'Consulta de estoque de material realizada';
      funcGeral.gravaLog(tela, usuario, mensagem_log, 'Consulta');
    except on E: Exception do
      ShowMessage(E.Message);

    end;

end;

procedure TfmRelEstoqueMat.FormCreate(Sender: TObject);
begin
  inherited;
  tela:= 'RelEstoqueMat';
end;

end.
