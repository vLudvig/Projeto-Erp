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
begin
  btnGravar.Enabled := false;

  refMat.IdMat := idMat;
  refMat.IdCor := IdCor;
  refMat.IdDep := idDep;
  refMat.Lote := tLote.Text;

  //Na saida, nunca criamos um registro de estoque,
  //apenas pode dar saida quando ja teve entrada no estoque(registro que já existe)
  try
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
