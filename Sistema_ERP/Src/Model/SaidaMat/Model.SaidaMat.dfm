object modelSaidaMat: TmodelSaidaMat
  Height = 480
  Width = 640
  object QsaidaMat: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from estoque_material')
    Left = 112
    Top = 192
  end
  object DS_QsaidaMat: TDataSource
    DataSet = QsaidaMat
    Left = 112
    Top = 280
  end
end
