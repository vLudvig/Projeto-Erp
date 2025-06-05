inherited formConsultaMaterial: TformConsultaMaterial
  Caption = 'Consulta - Material'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlEdit: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label2: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tBusca: TEdit
      StyleElements = [seFont, seClient, seBorder]
      OnChange = tBuscaChange
      OnKeyDown = tBuscaKeyDown
    end
    inherited cmbBusca: TComboBox
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pnlGrid: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblTabela: TLabel
      Left = 769
      Width = 43
      Caption = 'material'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 769
      ExplicitWidth = 43
    end
  end
  inherited dataSourceGrid: TDataSource
    Left = 632
    Top = 139
  end
  inherited Qconsulta: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from material')
    object QconsultaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QconsultaCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      Size = 10
    end
    object QconsultaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object QconsultaQUANTIDADE_ESTOQUE: TFMTBCDField
      DisplayLabel = 'Quant. Estoque'
      FieldName = 'QUANTIDADE_ESTOQUE'
      Origin = 'QUANTIDADE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object QconsultaUNIDADE_ESTOQUE: TStringField
      DisplayLabel = 'Unid. Estoque'
      FieldName = 'UNIDADE_ESTOQUE'
      Origin = 'UNIDADE_ESTOQUE'
      Size = 4
    end
    object QconsultaGRUPO_MATERIAL_ID: TIntegerField
      DisplayLabel = 'Grupo Material'
      FieldName = 'GRUPO_MATERIAL_ID'
      Origin = 'GRUPO_MATERIAL_ID'
    end
    object QconsultaCATEGORIA_MATERIAL_ID: TIntegerField
      DisplayLabel = 'Categoria Material'
      FieldName = 'CATEGORIA_MATERIAL_ID'
      Origin = 'CATEGORIA_MATERIAL_ID'
    end
    object QconsultaATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
