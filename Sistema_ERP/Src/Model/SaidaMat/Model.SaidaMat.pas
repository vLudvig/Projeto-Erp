unit Model.SaidaMat;

interface

uses
  System.SysUtils, System.Classes, Model.Conexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TmodelSaidaMat = class(TDataModule)
    QsaidaMat: TFDQuery;
    DS_QsaidaMat: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelSaidaMat: TmodelSaidaMat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
