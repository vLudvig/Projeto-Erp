object modelCategoriaMat: TmodelCategoriaMat
  Height = 480
  Width = 640
  object QconsultaCategoria: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from categoria_material')
    Left = 152
    Top = 200
  end
  object QcadastroCategoria: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from categoria_material')
    Left = 424
    Top = 200
  end
end
