unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls,
  ShellAPI;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    abaCadastros: TMenuItem;
    Material1: TMenuItem;
    Material2: TMenuItem;
    N1: TMenuItem;
    GrupodeMaterial1: TMenuItem;
    CategoriaMaterial1: TMenuItem;
    CategoriaMaterial2: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    GrupodeProdutos1: TMenuItem;
    amanhos1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    EntradadeMaterial1: TMenuItem;
    EntradadeProdutos1: TMenuItem;
    N6: TMenuItem;
    SadadeMateriais1: TMenuItem;
    SadadeProdutos1: TMenuItem;
    SadadeProdutos2: TMenuItem;
    ransfernciaDepositoProd1: TMenuItem;
    ransfrenciaDepProd1: TMenuItem;
    MovimentaesMat1: TMenuItem;
    MovimentaesMat2: TMenuItem;
    Estoque1: TMenuItem;
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
  cadMaterial, cadCor1;

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

procedure TViewPrincipal.N1Click(Sender: TObject);
begin
  cadCor := TcadCor.Create(nil);
  try
     cadCor.ShowModal;
  finally
     FreeAndNil(cadCor);
  end;
end;

end.
