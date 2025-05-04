unit Model.GrupoMaterial;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelGrupoMaterial = class(TDataModule)
    QcadastroGrupo: TFDQuery;
    QconsultaGrupo: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelGrupoMaterial: TmodelGrupoMaterial;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
