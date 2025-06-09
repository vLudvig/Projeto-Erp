unit movEntradaMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Model.Conexao, Consulta.Material, Consulta.Cor, Consulta.Deposito,
  model.Material, model.cor, Model.Deposito;

type
  TformMovEntraMat = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    btnGravar: TButton;
    btnLimpar: TButton;
    btnFechar: TButton;
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
    btnConsMat: TButton;
    btnConsCor: TButton;
    btnConsDep: TButton;
    DBGrid1: TDBGrid;
    Qestoque: TFDQuery;
    DS_Qestoque: TDataSource;
    procedure btnConsMatClick(Sender: TObject);
    procedure btnConsCorClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConsDepClick(Sender: TObject);
    procedure tCodMatChange(Sender: TObject);
  private
    var
      idMat: Integer;
      idDep: Integer;
      idCor: Integer;
  public
    { Public declarations }
  end;

var
  formMovEntraMat: TformMovEntraMat;

implementation

{$R *.dfm}

procedure TformMovEntraMat.btnConsCorClick(Sender: TObject);
begin
  formConsultaCores := TformConsultaCores.Create(nil);
  try
     formConsultaCores.Qconsulta.Close;
     formConsultaCores.Qconsulta.Sql.Text :=
        'select c.* from cor c ' +
        'inner join cor_material cm on c.id = cm.cor_id ' +
        'where cm.material_id = ' + IntToStr(idMat);
     formConsultaCores.Qconsulta.Open;

     if formConsultaCores.ShowModal = mrOk then
     begin
       tCor.Text := formConsultaCores.codigoSelecionado; //Escreve o CODIGO conforme selecionado na consulta
       tDescCor.Text := formConsultaCores.descSelec;
       idCor := formConsultaCores.registroSelecionado;
     end;
  finally
     FreeAndNil(formConsultaCores);
  end;
end;

procedure TformMovEntraMat.btnConsDepClick(Sender: TObject);
begin
  formConsultaDep := TformConsultaDep.Create(nil);
  try
     if formConsultaDep.ShowModal = mrOk then
     begin
       tDep.Text := formConsultaDep.codigoSelecionado;//Escreve o CODIGO conforme selecionado na consulta
       tDescDep.Text := formConsultaDep.descSelec;
       idDep := formConsultaDep.registroSelecionado;
     end;
  finally
     FreeAndNil(formConsultaDep);
  end;
end;

procedure TformMovEntraMat.btnConsMatClick(Sender: TObject);
begin
  formConsultaMaterial := TformConsultaMaterial.Create(nil);
  try
     if formConsultaMaterial.ShowModal = mrOk then
     begin
       tCodMat.Text := formConsultaMaterial.codigoSelecionado;//Escreve o CODIGO conforme selecionado na consulta
       tDescMat.Text := formConsultaMaterial.descSelec;
       idMat := formConsultaMaterial.registroSelecionado;//Armazena o ID do material para consulta da COR
     end;
  finally
     FreeAndNil(formConsultaMaterial);
  end;
end;

procedure TformMovEntraMat.btnFecharClick(Sender: TObject);
begin
  try
     Self.Close;
  except
    on E : Exception do
      ShowMessage(E.Message);
  end;
  Self.Close
end;

end.
