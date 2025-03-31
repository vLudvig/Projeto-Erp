unit Consulta.Material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Consulta.Principal, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TformConsultaMaterial = class(TformConsultaPrincipal)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaMaterial: TformConsultaMaterial;

implementation

{$R *.dfm}

end.
