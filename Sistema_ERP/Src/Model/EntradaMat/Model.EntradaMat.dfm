object modelEntraMat: TmodelEntraMat
  Height = 480
  Width = 640
  object Qconsulta: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from material')
    Left = 80
    Top = 168
  end
  object DS_Qconsulta: TDataSource
    DataSet = Qconsulta
    Left = 232
    Top = 232
  end
end
