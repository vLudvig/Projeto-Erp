unit Model.FuncGeral;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelFuncGeral = class(TDataModule)
    QfuncGeral: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelFuncGeral: TmodelFuncGeral;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
