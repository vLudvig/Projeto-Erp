object modelMaterial: TmodelMaterial
  Height = 508
  Width = 672
  object QcadastroMaterial: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from material')
    Left = 352
    Top = 72
    object QcadastroMaterialID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QcadastroMaterialCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      Size = 10
    end
    object QcadastroMaterialDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object QcadastroMaterialQUANTIDADE_ESTOQUE: TFMTBCDField
      DisplayLabel = 'Quantidade em estoque'
      FieldName = 'QUANTIDADE_ESTOQUE'
      Origin = 'QUANTIDADE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object QcadastroMaterialUNIDADE_ESTOQUE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE_ESTOQUE'
      Origin = 'UNIDADE_ESTOQUE'
      Size = 4
    end
    object QcadastroMaterialGRUPO_MATERIAL_ID: TIntegerField
      DisplayLabel = 'Grupo Material'
      FieldName = 'GRUPO_MATERIAL_ID'
      Origin = 'GRUPO_MATERIAL_ID'
    end
    object QcadastroMaterialCATEGORIA_MATERIAL_ID: TIntegerField
      DisplayLabel = 'Categoria Material'
      FieldName = 'CATEGORIA_MATERIAL_ID'
      Origin = 'CATEGORIA_MATERIAL_ID'
    end
    object QcadastroMaterialATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QconsultaMaterial: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from material')
    Left = 352
    Top = 176
    object QconsultaMaterialCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      Size = 10
    end
    object QconsultaMaterialDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object QconsultaMaterialQUANTIDADE_ESTOQUE: TFMTBCDField
      DisplayLabel = 'Quantidade estoque'
      FieldName = 'QUANTIDADE_ESTOQUE'
      Origin = 'QUANTIDADE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object QconsultaMaterialUNIDADE_ESTOQUE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE_ESTOQUE'
      Origin = 'UNIDADE_ESTOQUE'
      Size = 4
    end
    object QconsultaMaterialGRUPO_MATERIAL_ID: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_MATERIAL_ID'
      Origin = 'GRUPO_MATERIAL_ID'
    end
    object QconsultaMaterialCATEGORIA_MATERIAL_ID: TIntegerField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA_MATERIAL_ID'
      Origin = 'CATEGORIA_MATERIAL_ID'
    end
    object QconsultaMaterialATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QconsultaMaterialID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object DS_QcadastroMaterial: TDataSource
    Left = 472
    Top = 72
  end
  object DS_QconsultaMaterial: TDataSource
    DataSet = QconsultaMaterial
    Left = 472
    Top = 176
  end
  object QcoresMaterial: TFDQuery
    Left = 112
    Top = 272
  end
  object QremoveCorMat: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from cor_material')
    Left = 112
    Top = 352
  end
end
