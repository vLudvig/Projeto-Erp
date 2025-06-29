unit RelMovtoMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Conexao, Consulta.Material, Consulta.Cor,
  Consulta.Deposito;

type
  TfmRelMovtoMat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    lblCodigo: TLabel;
    lblCor: TLabel;
    lblDep: TLabel;
    lblLote: TLabel;
    lblDesc: TLabel;
    btnConsMat: TSpeedButton;
    btnConsCor: TSpeedButton;
    btnConsDep1: TSpeedButton;
    tCodMat: TEdit;
    tCor: TEdit;
    tDescMat: TEdit;
    tDescCor: TEdit;
    tDep: TEdit;
    tDescDep: TEdit;
    tLote: TEdit;
    tQtde: TEdit;
    checkMatAtivo: TCheckBox;
    QconsultaMovto: TFDQuery;
    DS_QconsultaMovto: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblTpMov: TLabel;
    cbTpMov: TComboBox;
    procedure btnConsMatClick(Sender: TObject);
    procedure btnConsCorClick(Sender: TObject);
    procedure btnConsDep1Click(Sender: TObject);
  private
    var
      idMat: Integer;
  public
    { Public declarations }
  end;

var
  fmRelMovtoMat: TfmRelMovtoMat;

implementation

{$R *.dfm}

procedure TfmRelMovtoMat.btnConsCorClick(Sender: TObject);
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
        //Escreve as informações da cor conforme selecionado na consulta
       tCor.Text := formConsultaCores.codigoSelecionado;
       tDescCor.Text := formConsultaCores.descSelec;
       //idCor := formConsultaCores.registroSelecionado;
     end;
  finally
     tCor.SetFocus;
     FreeAndNil(formConsultaCores);
  end;
end;

procedure TfmRelMovtoMat.btnConsDep1Click(Sender: TObject);
begin
  formConsultaDep := TformConsultaDep.Create(nil);
  try
     if formConsultaDep.ShowModal = mrOk then
     begin
      //Escreve as informações do deposito conforme selecionado na consulta
       tDep.Text := formConsultaDep.codigoSelecionado;
       tDescDep.Text := formConsultaDep.descSelec;
       //idDep := formConsultaDep.registroSelecionado;
     end;
  finally
     FreeAndNil(formConsultaDep);
  end;
end;

procedure TfmRelMovtoMat.btnConsMatClick(Sender: TObject);
begin
  formConsultaMaterial := TformConsultaMaterial.Create(nil);
  try
     if formConsultaMaterial.ShowModal = mrOk then
     begin
       //Escreve as informações do material conforme selecionado na consulta
       tCodMat.Text := formConsultaMaterial.codigoSelecionado;
       tDescMat.Text := formConsultaMaterial.descSelec;
       idMat := formConsultaMaterial.registroSelecionado;
     end;
  finally
     tCodMat.SetFocus;
     FreeAndNil(formConsultaMaterial);
  end;
end;

end.
