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
    checkEntMn: TCheckBox;
    radioTipoDep: TRadioGroup;
    rdBtnProd: TRadioButton;
    rdBtnMat: TRadioButton;
    DBGrid1: TDBGrid;
    DS_QgridDepos: TDataSource;
    QgridDepos: TFDQuery;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    sqlUpdate: String;

begin
  if (inclusao) and (Trim(tCodigo.Text) <> '') then
  begin
    sqlInsert := 'Insert into deposito(CODIGO, DESCRICAO, ATIVO, TIPO_P_M, NEGATIVO, SAIDA_MN, ENTRADA_MN) ';
    sqlValues := 'Values(:codigo, :descricao, :ativo, :tipoPM, :negativo, :saidaMn, :entradaMn) ';
    if checkAtivo.Checked then depAtivo := 'S';
    if checkQtdeNeg.Checked then permQtdeNeg := 'S';
    if checkSaidaMn.Checked then permSaidaMn := 'S';
    if checkEntMn.Checked then permEntradaMn := 'S';
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
        QgridDepos.Close;
        QgridDepos.open;
      except
        on E: Exception do
          ShowMessage(E.Message);
      end;
    finally
      modoConsulta;
    end;
  end
  else if alteracao then //ao apertar em alterar
  begin
    sqlUpdate := 'Update deposito set DESCRICAO = :descricao , ATIVO = :ativo ' +
      ' NEGATIVO = :negativo , SAIDA_MN = :saidaMn + ENTRADA_MN = :entradaMn where ID = :id';
  end;

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
