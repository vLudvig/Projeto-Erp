object modelGrupoMaterial: TmodelGrupoMaterial
  Height = 480
  Width = 640
  object QcadastroGrupo: TFDQuery
    Connection = modelConexao.FDConnection1
    Left = 184
    Top = 136
  end
  object QconsultaGrupo: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from grupo_material')
    Left = 464
    Top = 136
  end
end
