unit cadMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, model.Material, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TcadastroMaterial = class(TForm)
    pnlCadastro: TPanel;
    pnlBotoes: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnConsultar: TButton;
    Label1: TLabel;
    tCodigoMat: TEdit;
    Descrição: TLabel;
    tDescMat: TEdit;
    Label2: TLabel;
    tGrupoMat: TEdit;
    Label3: TLabel;
    tCategoriaMat: TEdit;
    checkAtivo: TCheckBox;
    cbUnidade: TComboBox;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    btnConfirmar: TButton;
    btnDesistir: TButton;
    Panel1: TPanel;
    Label6: TLabel;
    procedure abrirTelaMaterial(Sender: TObject);
    procedure FecharTelaMaterial(Sender: TObject);
    procedure modoInclusao();
    procedure btnIncluirClick(Sender: TObject);
    procedure modoConsulta();
    procedure modoAlteracao();
    procedure btnDesistirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadastroMaterial: TcadastroMaterial;

implementation

{$R *.dfm}

procedure TcadastroMaterial.abrirTelaMaterial(Sender: TObject);
begin
  inherited;
  if(modelMaterial = nil)then
    modelMaterial := TmodelMaterial.Create(nil);

    modoConsulta();
end;

procedure TcadastroMaterial.modoInclusao();
begin
  pnlCadastro.Enabled := true;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;
end;

procedure TcadastroMaterial.modoAlteracao();
begin
  pnlCadastro.Enabled := true;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;
end;

procedure TcadastroMaterial.modoConsulta();
begin
  pnlCadastro.Enabled := false;
  btnConsultar.Visible := true;
  btnIncluir.Visible := true;
  btnAlterar.Visible := true;
  btnExcluir.Visible := true;
  btnConfirmar.Visible := false;
  btnDesistir.Visible := false;
end;

procedure TcadastroMaterial.btnAlterarClick(Sender: TObject);
begin
  modoAlteracao;
end;

procedure TcadastroMaterial.btnConfirmarClick(Sender: TObject);
begin
  modoConsulta();
  inherited;
end;

procedure TcadastroMaterial.btnDesistirClick(Sender: TObject);
begin
  modoConsulta();
end;

procedure TcadastroMaterial.btnIncluirClick(Sender: TObject);
begin
  modoInclusao();
end;

procedure TcadastroMaterial.FecharTelaMaterial(Sender: TObject);
begin
  inherited;
  FreeAndNil(modelMaterial);
end;

end.
