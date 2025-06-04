inherited formConsultaDep: TformConsultaDep
  Caption = 'Consulta - Dep'#243'sito'
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
  end
  inherited Qconsulta: TFDQuery
    Active = True
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from deposito')
    Left = 424
    Top = 299
  end
end
