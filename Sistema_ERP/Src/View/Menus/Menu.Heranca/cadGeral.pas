unit cadGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TcadastroGeral = class(TForm)
    pnlCadastro: TPanel;
    pnlBotoes: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnConsultar: TButton;
    btnFechar: TButton;
    Label1: TLabel;
    tId: TEdit;
    tCodigo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    tDesc: TEdit;
    checkAtivo: TCheckBox;
    btnConfirmar: TButton;
    btnDesistir: TButton;
    Label4: TLabel;
    Label6: TLabel;
    procedure modoInclusao();
    procedure modoConsulta();
    procedure modoAlteracao();
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    function validaCamposObrigatorios() : boolean;
    procedure limpaCamposTela;
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadastroGeral: TcadastroGeral;
  inclusao: boolean;
  alteracao: boolean;

implementation

{$R *.dfm}

procedure TcadastroGeral.modoInclusao();
begin
  inclusao := true;
  checkAtivo.Checked := true;
  //pnlCadastro.Enabled := true;
  //Ativa todos os campos do panel de informações do material
  for var i := 0 to pnlCadastro.ControlCount - 1 do
  begin
    if (pnlCadastro.Controls[i] is TEdit) or
    (pnlCadastro.Controls[i] is TCheckBox) or
    (pnlCadastro.Controls[i] is TGroupBox) then
      TEdit(pnlCadastro.Controls[i]).Enabled := true;
  end;
  tId.Enabled:= false;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;

//limpa todos os campos do panel de informações
  for var i := 0 to pnlCadastro.ControlCount - 1 do
  begin
    if pnlCadastro.Controls[i] is TEdit then
      TEdit(pnlCadastro.Controls[i]).Text := '';
  end;

end;

procedure TcadastroGeral.modoConsulta();
begin
  //pnlCadastro.Enabled := false;
  //desativa todos os campos do panel de informações (menos o grid)
  for var i := 0 to pnlCadastro.ControlCount - 1 do
  begin
    if (pnlCadastro.Controls[i] is TEdit) or
    (pnlCadastro.Controls[i] is TCheckBox) or
    (pnlCadastro.Controls[i] is TGroupBox) then
      TEdit(pnlCadastro.Controls[i]).Enabled := false;
  end;

  btnConsultar.Visible := true;
  btnIncluir.Visible := true;
  btnAlterar.Visible := true;
  btnExcluir.Visible := true;
  btnConfirmar.Visible := false;
  btnDesistir.Visible := false;
  inclusao := false;
  alteracao := false;
end;

procedure TcadastroGeral.modoAlteracao();
begin

  //Ativa todos os componentes.
  for var i := 0 to pnlCadastro.ControlCount - 1 do
  begin
    if (pnlCadastro.Controls[i] is TEdit) or
    (pnlCadastro.Controls[i] is TCheckBox) or
    (pnlCadastro.Controls[i] is TGroupBox) then
      TEdit(pnlCadastro.Controls[i]).Enabled := true;
  end;

  inclusao := false;
  alteracao := true;
  tDesc.Enabled := true;
  pnlCadastro.Enabled := true;
  btnConsultar.Visible := false;
  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;
  btnConfirmar.Visible := True;
  btnDesistir.Visible := True;
end;

procedure TcadastroGeral.btnAlterarClick(Sender: TObject);
begin
  if tId.Text <> '' then
     modoAlteracao
  else
   ShowMessage('Nenhum material selecionado, impossivel continuar.');
end;

procedure TcadastroGeral.btnConfirmarClick(Sender: TObject);
 
begin
  //modoConsulta();
end;

procedure TcadastroGeral.btnDesistirClick(Sender: TObject);
begin
  modoConsulta();
end;

procedure TcadastroGeral.btnExcluirClick(Sender: TObject);
begin
  limpaCamposTela;
end;

procedure TcadastroGeral.btnFecharClick(Sender: TObject);
begin
  if btnIncluir.Visible then
    Self.Close
  else
    ShowMessage('Registro em Alteração, impossível continuar!')
end;

procedure TcadastroGeral.btnIncluirClick(Sender: TObject);
begin
  modoInclusao();
end;

procedure TcadastroGeral.FormCreate(Sender: TObject);
begin
  modoConsulta();
end;

function TcadastroGeral.validaCamposObrigatorios : boolean;
begin
  if (Trim(tCodigo.Text) <> '') and (Trim(tDesc.Text) <> '') then
    validaCamposObrigatorios := true
  else
    validaCamposObrigatorios := false;
end;

procedure TcadastroGeral.limpaCamposTela;
begin
  //limpa todos os campos do panel de informações do material
  for var i := 0 to pnlCadastro.ControlCount - 1 do
  begin
    if pnlCadastro.Controls[i] is TEdit then
      TEdit(pnlCadastro.Controls[i]).Text := '';
  end;
end;

end.
