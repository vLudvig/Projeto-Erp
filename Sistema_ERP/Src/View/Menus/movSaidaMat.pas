unit movSaidaMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, movEntradaMat, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.EntradaMat,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Model.SaidaMat;

type
  TformMovSaidaMat = class(TformMovEntraMat)
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMovSaidaMat: TformMovSaidaMat;

implementation

{$R *.dfm}

procedure TformMovSaidaMat.btnGravarClick(Sender: TObject);
var SqlUpdate : String;
begin
  btnGravar.Enabled := false;

  //Na saida, nunca criamos um registro de estoque,
  //apenas pode dar saida quando ja teve entrada no estoque(registro que já existe)
  if not geraRegistroEstoque then
  begin
    try
      SqlUpdate := 'update estoque_material set QUANTIDADE = QUANTIDADE - :qtde where ' +
        ' material_id = :idMat and Cor_id = :idCor and deposito_id = :idDep and lote = :lote';
      modelSaidaMat.QsaidaMat.SQL.Text := SqlUpdate;
      modelSaidaMat.QsaidaMat.ParamByName('idMat').asInteger := idMat;
      modelSaidaMat.QsaidaMat.ParamByName('idCor').asInteger := idCor;
      modelSaidaMat.QsaidaMat.ParamByName('idDep').asInteger := idDep;
      modelSaidaMat.QsaidaMat.ParamByName('lote').asString := tLote.Text;
      modelSaidaMat.QsaidaMat.ParamByName('qtde').AsFloat := StrToFloat(tQtde.Text);
      modelSaidaMat.QsaidaMat.ExecSQL;

      if checkExibMsg.Checked then
        ShowMessage('Movimentação efetuada com sucesso!')

    except
      on E: Exception do
        ShowMessage('Erro ao alterar estoque do material: ' + E.Message);
    end;
  end
  else
    ShowMessage('Impossivel fazer saida de um lote ou deposito que ainda não teve entradas!');

  Qestoque.Close;
  Qestoque.Open;
end;

procedure TformMovSaidaMat.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(modelSaidaMat);
end;

procedure TformMovSaidaMat.FormShow(Sender: TObject);
begin
  inherited;
  modelSaidaMat:= TmodelSaidaMat.Create(nil);
end;

end.
