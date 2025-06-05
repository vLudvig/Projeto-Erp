unit Consulta.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Model.Conexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    Qconsulta: TFDQuery;
    lblTabela: TLabel;
    procedure btnDesistirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnSelecRegClick(Sender: TObject);
    procedure SelecionaRegistro();
    procedure BuscarDados;
    procedure buscarInfos(condicao: String);
    procedure tBuscaChange(Sender: TObject);

  private
  protected
    procedure ConfiguraConsulta; virtual;
  public
    var
    registroSelecionado: integer;
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

procedure TformConsultaPrincipal.btnSelecRegClick(Sender: TObject);
begin
  SelecionaRegistro();
end;

procedure TformConsultaPrincipal.SelecionaRegistro();
begin
  
  if dataSourceGrid.DataSet.IsEmpty then
    raise Exception.Create('Selecione um Registro');

  registroSelecionado := Qconsulta.FieldByName('ID').AsInteger;
  Qconsulta.Close;
  ModalResult := mrOk;
end;

procedure TformConsultaPrincipal.tBuscaChange(Sender: TObject);
begin
  //inherited;
  BuscarDados;
end;

procedure TformConsultaPrincipal.ConfiguraConsulta();
begin

end;

//Garante que o registro selecionado no grid seja sempre atualizado.
procedure TformConsultaPrincipal.DBGrid1CellClick(Column: TColumn);
begin
  //Qconsulta.RecNo := DBGrid1.DataSource.DataSet.RecNo;    inutil
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

    Qconsulta.Close;
    Qconsulta.Open;
    dataSourceGrid.DataSet := Qconsulta;
    DBGrid1.DataSource := dataSourceGrid;
end;


procedure TformConsultaPrincipal.FormShow(Sender: TObject);
begin
  if not Assigned(Qconsulta.Connection) then
    Qconsulta.Connection := modelConexao.FDConnection1;

  if not modelConexao.FDConnection1.Connected then
    modelConexao.FDConnection1.Connected := True;

  if Assigned(Qconsulta) then
  begin
    Qconsulta.Close;
    Qconsulta.Open;
  end;
end;



procedure TformConsultaPrincipal.BuscarDados;
var Lcondicao: string;
begin
  Lcondicao := '';
  case cmbBusca.ItemIndex of
   0: Lcondicao := ' where descricao like '+ QuotedStr('%' + tBusca.Text + '%');
   1: Lcondicao := ' where codigo like '+ QuotedStr('%' + tBusca.Text + '%');
  end;

  buscarInfos(Lcondicao);

end;

procedure TformConsultaPrincipal.buscarInfos(condicao: string);
begin
  Qconsulta.Close;
  Qconsulta.SQL.Clear;
  Qconsulta.SQL.Add('Select * from ' + lblTabela.Caption);
  Qconsulta.SQL.Add(condicao);
  Qconsulta.Open;
end;
end.
