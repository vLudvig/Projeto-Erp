program ProjetoErp;

uses
  Vcl.Forms,
  View.Principal in 'Src\View\View.Principal.pas' {ViewPrincipal},
  Model.Conexao in 'Src\Model\Conexao\Model.Conexao.pas' {modelConexao: TDataModule},
  model.Material in 'Src\Model\Material\model.Material.pas' {modelMaterial: TDataModule},
  cadMaterial in 'Src\View\Menus\cadMaterial.pas' {cadastroMaterial},
  Consulta.Principal in 'Src\View\Consulta\Consulta.Principal.pas' {formConsultaPrincipal},
  Consulta.Material in 'Src\View\Consulta\Consulta.Material.pas' {formConsultaMaterial};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Aplicação ERP - vLudvig';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TmodelConexao, modelConexao);
  Application.Run;
end.
