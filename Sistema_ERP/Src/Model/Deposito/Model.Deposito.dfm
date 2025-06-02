object modelDeposito: TmodelDeposito
  Height = 480
  Width = 640
  object QcadDeposito: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from deposito')
    Left = 160
    Top = 224
  end
  object QconsultaDeposito: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from deposito')
    Left = 432
    Top = 240
  end
end
