unit RelLogSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao, Vcl.ComCtrls;

type
  TfmLogSistema = class(TForm)
    Panel1: TPanel;
    pnlDados: TPanel;
    tTela: TEdit;
    lblTela: TLabel;
    Label1: TLabel;
    tUsuario: TEdit;
    Label2: TLabel;
    cbTipoLog: TComboBox;
    Label3: TLabel;
    tDescricao: TEdit;
    Label4: TLabel;
    btnCons: TBitBtn;
    btnImprimir: TBitBtn;
    QconsultLog: TFDQuery;
    gridLog: TDBGrid;
    DS_QconsultLog: TDataSource;
    tDataDe: TDateTimePicker;
    lblDate: TLabel;
    tDataAte: TDateTimePicker;
    procedure btnConsClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLogSistema: TfmLogSistema;

implementation

{$R *.dfm}

procedure TfmLogSistema.btnConsClick(Sender: TObject);
var
  sqlConsulta : string;
  dataFormatDe: string;
  dataFormatAte : string;
  tipo_log : string;
begin
  sqlConsulta := 'select * from log where Hora > :horaDe and Hora < :horaAte';
  //Formatação de data para funcionar query corretamente.
  dataFormatDe := FormatDateTime('yyyy/mm/dd', tDataDe.Date);
  dataFormatAte := FormatDateTime('yyyy/mm/dd', tDataAte.Date);

  //Adiciona filtros no sqlConsulta
  if Trim(tTela.Text) <> '' then sqlConsulta := sqlConsulta + ' and tela = :tela';
  if Trim(tUsuario.Text) <> '' then sqlConsulta := sqlConsulta + ' and usuario = :usuario';
  if Trim(tDescricao.Text) <> '' then sqlConsulta := sqlConsulta + ' and mensagem like :descricao';

  case cbTipoLog.ItemIndex of
    1: tipo_log := 'Alteração';
    2: tipo_log := 'Inclusão';
    3: tipo_log := 'Delete';
    4: tipo_log := 'Login';
    5: tipo_log := 'Consulta';
  end;

  if cbTipoLog.ItemIndex > 0 then
    sqlConsulta := sqlConsulta + ' and tipo_log = :tipo_log';

  try
    QconsultLog.Close;
    QconsultLog.Sql.Text := sqlConsulta;
    QconsultLog.ParamByName('horaDe').AsString := dataFormatDe;
    QconsultLog.ParamByName('horaAte').AsString := dataFormatAte;

    //Adiciona os parametros da na query
    if cbTipoLog.ItemIndex > 0 then
      QconsultLog.ParamByName('tipo_log').AsString := tipo_log;

    if Trim(tTela.Text) <> '' then
      QconsultLog.ParamByName('tela').AsString := Trim(tTela.Text);

    if Trim(tUsuario.Text) <> '' then
      QconsultLog.ParamByName('usuario').AsString := Trim(tUsuario.Text);

    if Trim(tDescricao.Text) <> '' then
      QconsultLog.ParamByName('descricao').AsString := '%'+ tDescricao.Text +'%';

    QconsultLog.Open;
  except on E: Exception do
    ShowMessage(E.Message);

  end;

end;

procedure TfmLogSistema.btnImprimirClick(Sender: TObject);
begin
    ShowMessage('A impressão só esta disponivel na versão paga do sistema, entre em contato com o administrador!');
end;

end.
