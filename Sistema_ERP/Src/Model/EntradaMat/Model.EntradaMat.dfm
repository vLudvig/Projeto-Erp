object modelEntraMat: TmodelEntraMat
  Height = 480
  Width = 640
  object Qconsulta: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from estoque_material')
    Left = 80
    Top = 168
  end
  object DS_Qconsulta: TDataSource
    DataSet = Qconsulta
    Left = 88
    Top = 240
  end
  object Qcad: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from estoque_material')
    Left = 408
    Top = 184
  end
  object DS_Qcad: TDataSource
    DataSet = Qcad
    Left = 448
    Top = 288
  end
end
