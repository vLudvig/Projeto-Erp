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
    end
    inherited cmbBusca: TComboBox
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pnlGrid: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited DBGrid1: TDBGrid
      OnCellClick = DBGrid1CellClick
    end
  end
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnSelecReg: TButton
      OnClick = btnSelecRegClick
    end
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
  end
end
