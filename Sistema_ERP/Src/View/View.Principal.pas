unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, fmCadUsuario, fmAlteraSenha,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, cadCategoriaMat, cadDeposito, Model.cadUsuario,
  ShellAPI, Vcl.Imaging.jpeg, movEntradaMat, movSaidaMat, RelMovtoMat, RelEstoqueMat, RelLogSistema;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    abaCadastros: TMenuItem;
    Material1: TMenuItem;
    N1: TMenuItem;
    GrupodeMaterial1: TMenuItem;
    CategoriaMaterial1: TMenuItem;
    CategoriaMaterial2: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    EntradadeMaterial1: TMenuItem;
    N6: TMenuItem;
    SaidaDeMateriais1: TMenuItem;
    MovimentaesMat1: TMenuItem;
    MovimentaesMat2: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblGit: TLabel;
    lblBemVindo: TLabel;
    Usurio1: TMenuItem;
    CadastrodeUsurio1: TMenuItem;
    CadastrodeUsurio2: TMenuItem;
    Sistema1: TMenuItem;
    Logs1: TMenuItem;
    procedure lblMouseClick(Sender: TObject);
    procedure lblMouseEnter(Sender: TObject);
    procedure lblMouseLeave(Sender: TObject);
    procedure Material1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Material2Click(Sender: TObject);
    procedure CategoriaMaterial1Click(Sender: TObject);
    procedure CategoriaMaterial2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure EntradadeMaterial1Click(Sender: TObject);
    procedure CarregarImagem;
    procedure FormCreate(Sender: TObject);
    procedure SaidaDeMateriais1Click(Sender: TObject);
    procedure MovimentaesMat2Click(Sender: TObject);
    procedure MovimentaesMat1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CadastrodeUsurio1Click(Sender: TObject);
    procedure CadastrodeUsurio2Click(Sender: TObject);
    procedure Logs1Click(Sender: TObject);
  private
    { Private declarations }
  public
    usuario_logado : string;
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

uses
  cadMaterial, cadCor1, cadGrupoMaterial;

procedure TViewPrincipal.CadastrodeUsurio1Click(Sender: TObject);
begin
  vwCadUsuario := TvwCadUsuario.Create(nil);
  try
    vwCadUsuario.ShowModal;
  finally
    FreeAndNil(vwCadUsuario);
  end;
end;

procedure TViewPrincipal.CadastrodeUsurio2Click(Sender: TObject);
begin
  try
    vmAlteraSenha := TvmAlteraSenha.Create(nil);
    vmAlteraSenha.usuario := usuario_logado;
    vmAlteraSenha.ShowModal;
  finally
    FreeAndNil(vmAlteraSenha);
  end;
end;

procedure TViewPrincipal.CarregarImagem;
begin
  var caminhoImg : String;
  caminhoImg := 'C:\Projeto-Erp\Sistema_ERP\Img\Empresa\logo.png';
  if FileExists(caminhoImg) then
    Image1.Picture.LoadFromFile(caminhoImg);
end;

procedure TViewPrincipal.CategoriaMaterial1Click(Sender: TObject);
begin
  formCadGrupoMat := TformCadGrupoMat.Create(nil);
  try
     formCadGrupoMat.ShowModal;
  finally
     FreeAndNil(formCadGrupoMat);
  end;
end;

procedure TViewPrincipal.CategoriaMaterial2Click(Sender: TObject);
begin
  cadCategoriaMaterial := TcadCategoriaMaterial.Create(nil);
  try
     cadCategoriaMaterial.ShowModal;
  finally
     FreeAndNil(cadCategoriaMaterial);
  end;
end;

procedure TViewPrincipal.EntradadeMaterial1Click(Sender: TObject);
begin
  formMovEntraMat := TformMovEntraMat.Create(nil);
  try
     formMovEntraMat.ShowModal;
  finally
     FreeAndNil(formMovEntraMat);
  end;
end;


procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  CarregarImagem;
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  usuario_logado := modelUsuario.usuario_log;
  lblBemVindo.Caption := 'Bem Vindo, ' + usuario_logado + '!';
end;

procedure TViewPrincipal.lblMouseClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar(Tlabel(Sender).Caption), '', '', SW_SHOWNORMAL)
end;

procedure TViewPrincipal.lblMouseEnter(Sender: TObject);
begin
  Tlabel(Sender).font.Color := clBlue;
end;

procedure TViewPrincipal.lblMouseLeave(Sender: TObject);
begin
  Tlabel(Sender).font.Color := clWindowText;
end;

procedure TViewPrincipal.Logs1Click(Sender: TObject);
begin
  try
    fmLogSistema := TfmLogSistema.Create(nil);
    fmLogSistema.ShowModal;
  finally
    FreeAndNil(fmLogSistema);
  end;
end;

procedure TViewPrincipal.Material1Click(Sender: TObject);
begin
  cadastroMaterial := TcadastroMaterial.Create(nil);
  try
     cadastroMaterial.ShowModal;
  finally
     FreeAndNil(cadastroMaterial);
  end;
end;

procedure TViewPrincipal.Material2Click(Sender: TObject);
begin
  ShowMessage('Tela ainda em Produção, impossivel continuar');
end;

procedure TViewPrincipal.MovimentaesMat1Click(Sender: TObject);
begin
  fmRelEstoqueMat := TfmRelEstoqueMat.Create(nil);
  try
     fmRelEstoqueMat.ShowModal;
  finally
     FreeAndNil(fmRelEstoqueMat);
  end;
end;

procedure TViewPrincipal.MovimentaesMat2Click(Sender: TObject);
begin
  fmRelMovtoMat := TfmRelMovtoMat.Create(nil);
  try
     fmRelMovtoMat.ShowModal;
  finally
     FreeAndNil(fmRelMovtoMat);
  end;
end;

procedure TViewPrincipal.N1Click(Sender: TObject);
begin
  cadCor := TcadCor.Create(nil);
  try
     cadCor.ShowModal;
  finally
     FreeAndNil(cadCor);
  end;
end;

procedure TViewPrincipal.N5Click(Sender: TObject);
begin
  formCadDeposito := TformCadDeposito.Create(nil);
  try
     formCadDeposito.ShowModal;
  finally
     FreeAndNil(formCadDeposito);
  end;
end;

procedure TViewPrincipal.SaidaDeMateriais1Click(Sender: TObject);
begin
  formMovSaidaMat := TformMovSaidaMat.Create(nil);
    try
       formMovSaidaMat.ShowModal;
    finally
       FreeAndNil(formMovSaidaMat);
  end;
end;

end.
