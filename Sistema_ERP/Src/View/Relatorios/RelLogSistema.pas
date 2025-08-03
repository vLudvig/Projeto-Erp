unit RelLogSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao;

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
    Edit1: TEdit;
    Label4: TLabel;
    tData: TEdit;
    btnCons: TBitBtn;
    btnImprimir: TBitBtn;
    QconsultLog: TFDQuery;
    gridLog: TDBGrid;
    DS_QconsultLog: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLogSistema: TfmLogSistema;

implementation

{$R *.dfm}

end.
