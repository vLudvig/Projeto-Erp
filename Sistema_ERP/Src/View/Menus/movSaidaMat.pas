unit movSaidaMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, movEntradaMat, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.EntradaMat,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Model.SaidaMat,
  funcMovMat, uReferenciaMaterial;

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
var
  SqlUpdate : String;
  refMat : TReferenciaMaterial;
  tp_mov : String;
begin
  btnGravar.Enabled := false;

  //Define o tipo do movimento para funcao de gerar movimento
  case cbTpMov.ItemIndex of
   0: tp_mov := 'AM' ;
   1: tp_mov := 'FAC' ;
   2: tp_mov := 'TIN' ;
   3: tp_mov := 'MAL' ;
   4: tp_mov := 'LAV' ;
  end;

  //Altera atributos de refMat (classe referencia Material)
  refMat.IdMat := idMat;
  refMat.IdCor := IdCor;
  refMat.IdDep := idDep;
  refMat.Lote := tLote.Text;

  //Na saida, nunca criamos um registro de estoque,
  //apenas pode dar saida quando ja teve entrada no estoque(registro que já existe)
  try
     funcMovMat.geraMovSaida(refMat, tQtde.Text, tp_mov, tDescMov.Text);
     funcMovMat.atualizaEstSaida(refMat, tQtde.Text);

    if checkExibMsg.Checked then
      ShowMessage('Movimentação efetuada com sucesso!')

  except
    on E: Exception do
      ShowMessage('Erro ao alterar estoque do material: ' + E.Message);
  end;

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
