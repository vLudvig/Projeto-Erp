program ProjetoErp;

uses
  Vcl.Forms,
  View.Principal in 'Src\View\View.Principal.pas' {ViewPrincipal},
  Model.Conexao in 'Src\Model\Conexao\Model.Conexao.pas' {modelConexao: TDataModule},
  model.Material in 'Src\Model\Material\model.Material.pas' {modelMaterial: TDataModule},
  cadMaterial in 'Src\View\Menus\cadMaterial.pas' {cadastroMaterial},
  Consulta.Principal in 'Src\View\Consulta\Consulta.Principal.pas' {formConsultaPrincipal},
  Consulta.Material in 'Src\View\Consulta\Consulta.Material.pas' {formConsultaMaterial},
  cadGeral in 'Src\View\Menus\Menu.Heranca\cadGeral.pas' {cadastroGeral},
  cadCor1 in 'Src\View\Menus\cadCor1.pas' {cadCor},
  model.cor in 'Src\Model\Cor\model.cor.pas' {modelCor: TDataModule},
  Consulta.Cor in 'Src\View\Consulta\Consulta.Cor.pas' {formConsultaCores},
  Model.GrupoMaterial in 'Src\Model\GrupoMaterial\Model.GrupoMaterial.pas' {modelGrupoMaterial: TDataModule},
  cadGrupoMaterial in 'Src\View\Menus\cadGrupoMaterial.pas' {formCadGrupoMat},
  Consulta.GrupoMat in 'Src\View\Consulta\Consulta.GrupoMat.pas' {formConsultaGrupoMat},
  cadCategoriaMat in 'Src\View\Menus\cadCategoriaMat.pas' {cadCategoriaMaterial},
  Model.CategoriaMat in 'Src\Model\CategoriaMaterial\Model.CategoriaMat.pas' {modelCategoriaMat: TDataModule},
  Consulta.CategoriaMat in 'Src\View\Consulta\Consulta.CategoriaMat.pas' {formConsultaCategoriaMat},
  cadDeposito in 'Src\View\Menus\cadDeposito.pas' {formCadDeposito},
  Model.Deposito in 'Src\Model\Deposito\Model.Deposito.pas' {modelDeposito: TDataModule},
  Consulta.Deposito in 'Src\View\Consulta\Consulta.Deposito.pas' {formConsultaDep},
  movEntradaMat in 'Src\View\Menus\movEntradaMat.pas' {formMovEntraMat},
  Model.EntradaMat in 'Src\Model\EntradaMat\Model.EntradaMat.pas' {modelEntraMat: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Aplica��o ERP - vLudvig';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TmodelConexao, modelConexao);
  Application.Run;
end.
