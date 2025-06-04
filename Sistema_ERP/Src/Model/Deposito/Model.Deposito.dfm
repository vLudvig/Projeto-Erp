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
  object DS_QcadDeposito: TDataSource
    Left = 128
    Top = 328
  end
  object DS_QconsultaDeposito: TDataSource
    DataSet = QconsultaDeposito
    Left = 408
    Top = 320
  end
end
