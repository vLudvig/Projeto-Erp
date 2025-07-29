unit Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, System.IniFiles;

type
  TmodelConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure FDPhysFBDriverLink1DriverCreated(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  modelConexao: TmodelConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TmodelConexao.DataModuleCreate(Sender: TObject);
var
  Ini: TIniFile;
  CaminhoINI: string;

begin
  CaminhoINI := 'C:\Projeto-Erp\Sistema_ERP\projetoIni.ini';
  Ini := TIniFile.Create(CaminhoINI);
  try
    FDConnection1.Params.Clear;
    FDConnection1.Params.DriverID := Ini.ReadString('DATABASE', 'DriverID', 'FB');
    FDConnection1.Params.Database := Ini.ReadString('DATABASE', 'Database', '');
    FDConnection1.Params.UserName := Ini.ReadString('DATABASE', 'User_Name', '');
    FDConnection1.Params.Password := Ini.ReadString('DATABASE', 'Password', '');
    FDConnection1.Params.Add('CharacterSet=' + Ini.ReadString('DATABASE', 'CharacterSet', 'UTF8'));
    // Pegar dll especifica
    FDPhysFBDriverLink1.VendorLib := 'C:\Projeto-Erp\Sistema_ERP\fbclient.dll';

    // Testar conexão ou deixar para abrir quando necessário
    FDConnection1.Connected := True;
  finally
    Ini.Free;
  end;
end;

procedure TmodelConexao.FDPhysFBDriverLink1DriverCreated(Sender: TObject);
begin
  FDPhysFBDriverLink1.VendorLib := 'C:\Program Files\Firebird\Firebird_3_0\fbclient.dll';
end;

end.
