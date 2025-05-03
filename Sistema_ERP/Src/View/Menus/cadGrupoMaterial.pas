unit cadGrupoMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadGeral, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Model.Conexao, Vcl.Grids, Vcl.DBGrids;

type
  TformCadGrupoMat = class(TcadastroGeral)
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    DS_QgrupoMaterial: TDataSource;
    QgrupoMaterial: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadGrupoMat: TformCadGrupoMat;

implementation

{$R *.dfm}

end.
