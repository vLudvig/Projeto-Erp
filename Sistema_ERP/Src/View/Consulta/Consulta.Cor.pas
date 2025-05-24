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
    QconsultaID: TIntegerField;
    QconsultaDESCRICAO: TStringField;
    QconsultaATIVA: TStringField;
    QconsultaCODIGO: TStringField;
    procedure tBuscaChange(Sender: TObject);
    procedure BuscarDados;
  private
    { Private declarations }
  public
    procedure buscarCores(condicao: String);
  end;

var
  formConsultaCores: TformConsultaCores;

implementation

{$R *.dfm}

procedure TformConsultaCores.tBuscaChange(Sender: TObject);
begin
  inherited;
  BuscarDados;
end;

procedure TformConsultaCores.BuscarDados;
var Lcondicao: string;
begin
  Lcondicao := '';
  case cmbBusca.ItemIndex of
   0: Lcondicao := 'where descricao like '+ QuotedStr('%' + tBusca.Text + '%');
   1: Lcondicao := 'where codigo like '+ QuotedStr('%' + tBusca.Text + '%');
  end;

  buscarCores(Lcondicao);

end;

procedure TformConsultaCores.buscarCores(condicao: string);
begin
  Qconsulta.Close;
  Qconsulta.SQL.Clear;
  Qconsulta.SQL.Add('Select * from cor ');
  Qconsulta.SQL.Add(condicao);
  Qconsulta.Open;
end;

end.
