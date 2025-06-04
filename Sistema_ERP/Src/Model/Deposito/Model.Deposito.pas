unit Model.Deposito;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelDeposito = class(TDataModule)
    QcadDeposito: TFDQuery;
    QconsultaDeposito: TFDQuery;
    DS_QcadDeposito: TDataSource;
    DS_QconsultaDeposito: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelDeposito: TmodelDeposito;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
