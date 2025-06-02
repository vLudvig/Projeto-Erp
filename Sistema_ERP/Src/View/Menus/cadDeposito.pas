unit cadDeposito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cadGeral, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TformCadDeposito = class(TcadastroGeral)
    pnlGrid: TPanel;
    grpDep: TGroupBox;
    checkQtdeNeg: TCheckBox;
    checkSaidaMn: TCheckBox;
    CheckBox1: TCheckBox;
    radioTipoDep: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadDeposito: TformCadDeposito;

implementation

{$R *.dfm}

end.
