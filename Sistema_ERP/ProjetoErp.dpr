program ProjetoErp;

uses
  Vcl.Forms,
  Vcl.Controls,
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
  fmLogin in 'Src\View\fmLogin.pas' {vwLogin},
  funcGeral in 'Src\Service\funcGeral.pas',
  Model.cadUsuario in 'Src\Model\Usuario\Model.cadUsuario.pas' {modelUsuario: TDataModule},
  fmCadUsuario in 'Src\View\Menus\fmCadUsuario.pas' {vwCadUsuario},
  fmAlteraSenha in 'Src\View\Menus\fmAlteraSenha.pas' {vmAlteraSenha},
  RelLogSistema in 'Src\View\Relatorios\RelLogSistema.pas' {fmLogSistema},
  View.Principal in 'Src\View\View.Principal.pas' {ViewPrincipal};

var
    usuario_log: string;
{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Aplicação ERP - vLudvig';
  Application.CreateForm(TmodelConexao, modelConexao);
  Application.CreateForm(TmodelUsuario, modelUsuario);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  vwLogin  := TvwLogin.Create(nil);

  if vwLogin.ShowModal = mrOk then
  begin
    Application.CreateForm(TViewPrincipal, ViewPrincipal);
    Application.Run;
  end
  else
    Application.Terminate;

end.
