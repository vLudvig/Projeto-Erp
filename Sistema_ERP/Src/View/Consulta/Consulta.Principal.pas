unit Consulta.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Model.Conexao;

type
  TformConsultaPrincipal = class(TForm)
    pnlEdit: TPanel;
    pnlGrid: TPanel;
    tBusca: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cmbBusca: TComboBox;
    Panel1: TPanel;
    btnSelecReg: TButton;
    btnDesistir: TButton;
    DBGrid1: TDBGrid;
    dataSourceGrid: TDataSource;
    procedure btnDesistirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);

  private
  protected
    procedure ConfiguraConsulta; virtual;
  public
    { Public declarations }
  end;

var
  formConsultaPrincipal: TformConsultaPrincipal;

implementation

{$R *.dfm}

procedure TformConsultaPrincipal.btnDesistirClick(Sender: TObject);
begin
  Self.Close;
  ModalResult := mrCancel;
end;

procedure TformConsultaPrincipal.ConfiguraConsulta();
begin

end;

procedure TformConsultaPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  btnSelecReg.Click;
end;

procedure TformConsultaPrincipal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSelecReg.Click;
end;

procedure TformConsultaPrincipal.FormCreate(Sender: TObject);
begin
   modelConexao := TmodelConexao.Create(nil);
   if Assigned(modelConexao) then
    begin
      // Verifica se a conexão está criada
      if Assigned(modelConexao.FDConnection1) then
      begin
        // Abre a conexão se ainda não estiver aberta
        if not modelConexao.FDConnection1.Connected then
          modelConexao.FDConnection1.Connected := True;
      end;
    end
    else
    begin
      ShowMessage('Erro: modelConexao não foi instanciado!');
      Exit;
    end;
end;



end.
