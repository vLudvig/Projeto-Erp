unit funcGeral;

interface

uses
  uReferenciaMaterial, System.SysUtils, Vcl.Dialogs, Model.FuncGeral;

  procedure geraMovMat(const Ref: TreferenciaMaterial);

implementation

procedure geraMovMat(const Ref: TreferenciaMaterial);
begin


  ShowMessage('Movimenta��o gerada para: ' +
              'Material=' + Ref.IdMat.ToString + ', ' +
              'Cor=' + Ref.IdCor.ToString + ', ' +
              'Dep�sito=' + Ref.IdDep.ToString + ', ' +
              'Lote=' + Ref.Lote);
end;

end.
