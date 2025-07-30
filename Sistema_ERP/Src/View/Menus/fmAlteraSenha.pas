unit fmAlteraSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fmCadUsuario, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Model.cadUsuario, funcGeral;

type
  TvmAlteraSenha = class(TvwCadUsuario)
    lblUsuarioLog: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vmAlteraSenha: TvmAlteraSenha;

implementation

{$R *.dfm}

procedure TvmAlteraSenha.btnCadastrarClick(Sender: TObject);
var
  sqlConsulta: string;
  sqlUpdate : string;
  hashSenhaAtual: string;
  hashNovaSenha: string;
begin
  //inherited;
  try
    modelUsuario := TmodelUsuario.Create(nil);

    if Trim(tSenha.Text) = Trim(tConfirmaSenha.Text) then
    begin
      sqlConsulta := 'select chave_ac from usuarios where usuario = :usuario';
      sqlUpdate := 'update usuarios set chave_ac = :novaSenha where usuario = :usuario';

      // transforma os valores da senha para criptografia e valida com o que esta no banco
      hashNovaSenha := funcGeral.geraCriptografia(Trim(tSenha.Text));
      hashSenhaAtual := funcGeral.geraCriptografia(Trim(tUsuario.Text));

      modelUsuario.Qusuarios.SQL.Text := sqlConsulta;
      modelUsuario.Qusuarios.ParamByName('usuario').AsString := usuario;


      try
        modelUsuario.Qusuarios.Open;

        if modelUsuario.Qusuarios.FieldByName('chave_ac').AsString = hashSenhaAtual then
        begin
          modelUsuario.Qusuarios.Close;
          modelUsuario.Qusuarios.SQL.Text := sqlUpdate;
          modelUsuario.Qusuarios.ParamByName('usuario').AsString := usuario;
          modelUsuario.Qusuarios.ParamByName('novaSenha').AsString := hashNovaSenha;

          modelUsuario.Qusuarios.ExecSQL;

          ShowMessage('Senha alterada com sucesso!');
          self.Close;
        end
        else
          ShowMessage('Senha atual não confere, impossivel continuar!');
      except on E: Exception do
        ShowMessage('Erro ao gravar dados do usuário: ' + E.Message);
      end;

    end
    else
    begin
      Application.MessageBox('A confirmação da senha não confere!', 'Atenção', MB_ICONEXCLAMATION);
    end;
  finally
    //FreeAndNil(modelUsuario);
  end;

  sqlUpdate := 'select * from usuarios where usuario = :usuario'

end;

procedure TvmAlteraSenha.FormShow(Sender: TObject);
begin
  inherited;
  try
    lblUsuarioLog.Caption := 'Usuário: ' + usuario;
  finally

  end;
end;

end.
