object modelFuncGeral: TmodelFuncGeral
  Height = 480
  Width = 640
  object QfuncGeral: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from estoque_material')
    Left = 136
    Top = 152
  end
end
