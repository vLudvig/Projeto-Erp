unit cadDeposito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadGeral, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Model.Conexao, Model.Deposito;

type
  TformCadDeposito = class(TcadastroGeral)
    pnlGrid: TPanel;
    grpDep: TGroupBox;
    checkQtdeNeg: TCheckBox;
    checkSaidaMn: TCheckBox;
    CheckBox1: TCheckBox;
    radioTipoDep: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBGrid1: TDBGrid;
    DS_QgridDepos: TDataSource;
    QgridDepos: TFDQuery;
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadDeposito: TformCadDeposito;

implementation

{$R *.dfm}

procedure TformCadDeposito.btnConfirmarClick(Sender: TObject);
  var
    depAtivo: String;
    depProd_Mat: String;
    permQtdeNeg: String;
    permSaidaMn: String;
    permEntradaMn: String;
    sqlInsert: String;
    sqlValues: String;

begin
  if (inclusao) and (Trim(tCodigo.Text) <> '') then
  begin
    sqlInsert := 'Insert into deposito(CODIGO, DESCRICAO, ATIVO, TIPO_P_M, NEGATIVO, SAIDA_MN, ENTRADA_MN) ';
    sqlValues := 'Values(:codigo, :descricao, :ativo, :tipoPM, :negativo, :saidaMn, :entradaMn) ';
    modelDeposito.QcadDeposito.SQL.Text := sqlInsert + sqlValues;

  end;


end;

end.
