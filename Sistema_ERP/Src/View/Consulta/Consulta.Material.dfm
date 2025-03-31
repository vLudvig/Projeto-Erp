inherited formConsultaMaterial: TformConsultaMaterial
  Caption = 'Consulta - Material'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlEdit: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 833
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label2: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tBusca: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited ComboBox1: TComboBox
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pnlGrid: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 83
    ExplicitWidth = 833
    ExplicitHeight = 365
  end
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
end
