inherited formConsultaGrupoMat: TformConsultaGrupoMat
  Caption = 'Consulta Grupo Material'
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
      Width = 80
      Caption = 'grupo_material'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 80
    end
  end
  inherited Qconsulta: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from grupo_material')
    Left = 480
    Top = 307
  end
end
