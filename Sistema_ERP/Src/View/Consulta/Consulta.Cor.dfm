inherited formConsultaCores: TformConsultaCores
  Caption = 'Consulta Cores'
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
  end
  inherited dataSourceGrid: TDataSource
    Left = 648
  end
  inherited Qconsulta: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from cor')
    Left = 600
    Top = 259
    object QconsultaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QconsultaCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object QconsultaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
    end
    object QconsultaATIVA: TStringField
      DisplayLabel = 'Ativa'
      FieldName = 'ATIVA'
      Origin = 'ATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
