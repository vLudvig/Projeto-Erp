unit Model.EntradaMat;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelEntraMat = class(TDataModule)
    Qconsulta: TFDQuery;
    DS_Qconsulta: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelEntraMat: TmodelEntraMat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
