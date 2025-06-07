unit movEntradaMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TformMovEntraMat = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    lblCodigo: TLabel;
    tCodMat: TEdit;
    lblCor: TLabel;
    tCor: TEdit;
    tDescMat: TEdit;
    tDescCor: TEdit;
    lblDep: TLabel;
    tDep: TEdit;
    tDescDep: TEdit;
    lblLote: TLabel;
    tLote: TEdit;
    Label1: TLabel;
    tQtde: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMovEntraMat: TformMovEntraMat;

implementation

{$R *.dfm}

end.
