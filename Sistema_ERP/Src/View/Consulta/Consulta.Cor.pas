unit Consulta.Cor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Consulta.Principal, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, model.cor,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TformConsultaCores = class(TformConsultaPrincipal)
  procedure SelecionaRegistro();
    procedure btnSelecRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaCores: TformConsultaCores;

implementation

{$R *.dfm}


procedure TformConsultaCores.btnSelecRegClick(Sender: TObject);
begin
  inherited;
  SelecionaRegistro();
end;

procedure TformConsultaCores.SelecionaRegistro();
begin
  if dataSourceGrid.DataSet.IsEmpty then
    raise Exception.Create('Selecione um Registro');

  Qconsulta.Open;
  registroSelecionado := Qconsulta.FieldByName('ID').AsInteger;
  Qconsulta.Close;
  ModalResult := mrOk;
end;

end.
