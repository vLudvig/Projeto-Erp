unit Model.RelatorioMovtoMat;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelRelmovtoMat = class(TDataModule)
    Qconsulta: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelRelmovtoMat: TmodelRelmovtoMat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
