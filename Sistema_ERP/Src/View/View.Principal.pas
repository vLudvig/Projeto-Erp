unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, cadCategoriaMat, cadDeposito,
  ShellAPI, Vcl.Imaging.jpeg;

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
    SadadeMateriais1: TMenuItem;
    SadadeProdutos2: TMenuItem;
    ransfrenciaDepProd1: TMenuItem;
    MovimentaesMat1: TMenuItem;
    MovimentaesMat2: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblGit: TLabel;
    procedure lblMouseClick(Sender: TObject);
    procedure lblMouseEnter(Sender: TObject);
    procedure lblMouseLeave(Sender: TObject);
    procedure Material1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Material2Click(Sender: TObject);
    procedure CategoriaMaterial1Click(Sender: TObject);
    procedure CategoriaMaterial2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

uses
  cadMaterial, cadCor1, cadGrupoMaterial;

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

end.
