inherited formConsultaCategoriaMat: TformConsultaCategoriaMat
  Caption = 'Consulta-Categoria Material'
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
      Left = 729
      Width = 97
      Caption = 'categoria_material'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 729
      ExplicitWidth = 97
    end
  end
  inherited Qconsulta: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from categoria_material')
    Left = 576
    Top = 323
  end
end
