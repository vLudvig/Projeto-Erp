unit fmAlteraSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fmCadUsuario, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Model.cadUsuario;

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
  sqlUpdate : string;
begin
  //inherited;
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
