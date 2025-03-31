unit Consulta.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TformConsultaPrincipal = class(TForm)
    pnlEdit: TPanel;
    pnlGrid: TPanel;
    DS_busca: TDataSource;
    tBusca: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    btnSelecReg: TButton;
    btnDesistir: TButton;
    DBGrid1: TDBGrid;
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

procedure TformConsultaPrincipal.ConfiguraConsulta();
begin

end;
end.
