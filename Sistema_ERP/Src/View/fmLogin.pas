unit fmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Model.cadUsuario,
  funcGeral;

type
  TvwLogin = class(TForm)
    pnl1: TPanel;
    lblBemVindo: TLabel;
    Label1: TLabel;
    tUsuario: TEdit;
    tSenha: TEdit;
    Label2: TLabel;
    btnCadastrar: TBitBtn;
    BitBtn1: TBitBtn;
    btnConfirmar: TBitBtn;
    ballonCaracter: TBalloonHint;
    procedure btnCadastrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vwLogin: TvwLogin;

implementation
  uses
    fmCadUsuario;
{$R *.dfm}

procedure TvwLogin.BitBtn1Click(Sender: TObject);
begin
  try
    if Application.MessageBox('Tem certeza que deseja' +
      ' fechar o sistema?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
      begin
       Application.Terminate;
      end;

  finally

  end;
end;

procedure TvwLogin.btnCadastrarClick(Sender: TObject);
begin
  vwCadUsuario := TvwCadUsuario.Create(nil);
  try
    vwCadUsuario.ShowModal;
  finally
    FreeAndNil(vwCadUsuario);
  end;
end;

//Confirma se a senha e usuário estao corretos
procedure TvwLogin.btnConfirmarClick(Sender: TObject);
var
  sqlConsulta : string;
begin
  sqlConsulta:= 'select * from usuarios where chave_ac = :senha and usuario = :usuario';

  try
    modelUsuario := TmodelUsuario.Create(nil);
    modelUsuario.Qusuarios.Close();
    modelUsuario.Qusuarios.sql.Text := sqlConsulta;
    modelUsuario.Qusuarios.ParamByName('senha').AsString := funcGeral.geraCriptografia(tSenha.Text);
    modelUsuario.Qusuarios.ParamByName('usuario').AsString := tUsuario.text;

    modelUsuario.Qusuarios.Open();

    if modelUsuario.Qusuarios.Fields[0].AsInteger > 0 then
    begin
      //Application.MessageBox('Usuário válido!', 'Sucesso');
      ModalResult := mrOk;
    end
    else
    begin
      Application.MessageBox('Usuário inválido!','Atenção');
    end;
  except on
    E: Exception do
      ShowMessage('Erro ao validar usuário: ' + E.Message);
  end;
end;

procedure TvwLogin.FormCreate(Sender: TObject);
begin
  try
    modelUsuario := TmodelUsuario.Create(nil);
  except on E: Exception do
    showMessage('Erro ao abrir tela: ' + E.Message);
  end;

end;

procedure TvwLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(modelUsuario);
end;

procedure TvwLogin.tUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['A'..'Z', 'a'..'z', '.', '0'..'9', #8]) then
  begin
    Key:= #0;
    ballonCaracter.Style := bhsStandard;
    ballonCaracter.Title := 'Caractere Inválido';
    ballonCaracter.Description := 'caracteres inválidos: [*, &, !, # ...]'   ;
    ballonCaracter.ShowHint(tUsuario.ClientToScreen(Point (0, tUsuario.Height)));
  end
  else
    ballonCaracter.HideHint;
end;

end.
