unit Consulta.GrupoMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Consulta.Principal, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Model.Conexao;

type
  TformConsultaGrupoMat = class(TformConsultaPrincipal)
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaGrupoMat: TformConsultaGrupoMat;

implementation

{$R *.dfm}

procedure TformConsultaGrupoMat.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(Qconsulta);
end;

end.
