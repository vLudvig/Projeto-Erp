unit Model.CategoriaMat;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelCategoriaMat = class(TDataModule)
    QconsultaCategoria: TFDQuery;
    QcadastroCategoria: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelCategoriaMat: TmodelCategoriaMat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
