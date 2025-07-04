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
  Model.EntradaMat in 'Src\Model\EntradaMat\Model.EntradaMat.pas' {modelEntraMat: TDataModule},
  funcMovMat in 'Src\Service\funcMovMat.pas',
  movSaidaMat in 'Src\View\Menus\movSaidaMat.pas' {formMovSaidaMat},
  Model.SaidaMat in 'Src\Model\SaidaMat\Model.SaidaMat.pas' {modelSaidaMat: TDataModule},
  uReferenciaMaterial in 'Src\Service\uReferenciaMaterial.pas',
  Model.FuncGeral in 'Src\Model\FuncGeral\Model.FuncGeral.pas' {modelFuncGeral: TDataModule},
  RelMovtoMat in 'Src\View\Relatorios\RelMovtoMat.pas' {fmRelMovtoMat},
  Model.RelatorioMovtoMat in 'Src\Model\RelatorioMovtoMat\Model.RelatorioMovtoMat.pas' {modelRelmovtoMat: TDataModule},
  RelEstoqueMat in 'Src\View\Relatorios\RelEstoqueMat.pas' {fmRelEstoqueMat},
  funcCadMaterial in 'Src\Service\funcCadMaterial.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Aplicação ERP - vLudvig';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TmodelConexao, modelConexao);
  Application.CreateForm(TmodelFuncGeral, modelFuncGeral);
  Application.CreateForm(TfmRelMovtoMat, fmRelMovtoMat);
  Application.CreateForm(TmodelRelmovtoMat, modelRelmovtoMat);
  Application.CreateForm(TfmRelEstoqueMat, fmRelEstoqueMat);
  Application.Run;
end.
