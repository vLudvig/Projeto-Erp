unit fmCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fmLogin, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Model.cadUsuario, funcGeral;

type
  TvwCadUsuario = class(TvwLogin)
    tConfirmaSenha: TEdit;
    Label3: TLabel;
    btnCacelar: TBitBtn;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCacelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vwCadUsuario: TvwCadUsuario;

implementation
{$R *.dfm}

//rotina fechar tela de cadastro;
procedure TvwCadUsuario.BitBtn1Click(Sender: TObject);
begin
  //inherited;
  try
    if Application.MessageBox('Tem certeza que deseja' +
      ' desistir do cadastro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
      begin
       Self.Close;
      end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

procedure TvwCadUsuario.btnCacelarClick(Sender: TObject);
begin
  //inherited;
  try
    if Application.MessageBox('Tem certeza que deseja' +
      ' desistir do cadastro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
      begin
       Self.Close;
      end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
end;

procedure TvwCadUsuario.btnCadastrarClick(Sender: TObject);
 var
  sqlInsert: string;
  hashSenha: string;

begin
   try
    modelUsuario := TmodelUsuario.Create(nil);

    if Trim(tSenha.Text) = Trim(tConfirmaSenha.Text) then
    begin
      sqlInsert := 'Insert into usuarios (usuario, chave_ac, ativo) values (:usuario, :senha, :ativo)';

      //Utiliza função da service funcGeraSenha para gravar no banco a string cirptografada
      hashSenha := funcGeral.geraCriptografia(Trim(tSenha.Text));

      modelUsuario.Qusuarios.SQL.Text := sqlInsert;
      modelUsuario.Qusuarios.ParamByName('usuario').AsString := tUsuario.Text;
      modelUsuario.Qusuarios.ParamByName('senha').AsString := hashSenha;
      modelUsuario.Qusuarios.ParamByName('ativo').AsString := 'S';

      try
        modelUsuario.Qusuarios.ExecSQL;

        Application.MessageBox('Senha gravada com sucesso!', 'Sucesso');
        self.Close;

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

end;

procedure TvwCadUsuario.FormCreate(Sender: TObject);
begin
  //inherited;

end;

end.
