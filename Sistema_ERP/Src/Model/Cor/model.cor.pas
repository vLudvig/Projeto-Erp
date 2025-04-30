unit model.cor;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelCor = class(TDataModule)
    QconsultaCor: TFDQuery;
    QcadastroCor: TFDQuery;
    Ds_QconsultaCor: TDataSource;
    DS_QcadastroCor: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelCor: TmodelCor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
