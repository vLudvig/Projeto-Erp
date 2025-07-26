object modelUsuario: TmodelUsuario
  Height = 480
  Width = 640
  object Qusuarios: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from usuarios')
    Left = 192
    Top = 160
  end
end
