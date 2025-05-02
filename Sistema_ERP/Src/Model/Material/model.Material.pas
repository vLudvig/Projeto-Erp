unit model.Material;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

type
  TmodelMaterial = class(TDataModule)
    QcadastroMaterial: TFDQuery;
    QconsultaMaterial: TFDQuery;
    DS_QcadastroMaterial: TDataSource;
    DS_QconsultaMaterial: TDataSource;
    QcadastroMaterialID: TIntegerField;
    QcadastroMaterialDESCRICAO: TStringField;
    QcadastroMaterialQUANTIDADE_ESTOQUE: TFMTBCDField;
    QcadastroMaterialUNIDADE_ESTOQUE: TStringField;
    QcadastroMaterialGRUPO_MATERIAL_ID: TIntegerField;
    QcadastroMaterialCATEGORIA_MATERIAL_ID: TIntegerField;
    QcadastroMaterialATIVO: TStringField;
    QconsultaMaterialID: TIntegerField;
    QconsultaMaterialDESCRICAO: TStringField;
    QconsultaMaterialQUANTIDADE_ESTOQUE: TFMTBCDField;
    QconsultaMaterialUNIDADE_ESTOQUE: TStringField;
    QconsultaMaterialGRUPO_MATERIAL_ID: TIntegerField;
    QconsultaMaterialCATEGORIA_MATERIAL_ID: TIntegerField;
    QconsultaMaterialATIVO: TStringField;
    QcoresMaterial: TFDQuery;
    QcadastroMaterialCODIGO: TStringField;
    QconsultaMaterialCODIGO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modelMaterial: TmodelMaterial;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
