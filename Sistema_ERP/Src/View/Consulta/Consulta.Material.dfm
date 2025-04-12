inherited formConsultaMaterial: TformConsultaMaterial
  Caption = 'Consulta - Material'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnShow = FormShow
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
      OnKeyDown = tBuscaKeyDown
    end
    inherited cmbBusca: TComboBox
      ItemIndex = 0
      Text = 'Descri'#231#227'o'
      StyleElements = [seFont, seClient, seBorder]
      Items.Strings = (
        'Descri'#231#227'o'
        'Codigo')
    end
  end
  inherited pnlGrid: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited DBGrid1: TDBGrid
      DataSource = dataSourceGrid
      OnCellClick = DBGrid1CellClick
    end
  end
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnSelecReg: TButton
      OnClick = btnSelecRegClick
    end
    inherited btnDesistir: TButton
      OnClick = btnDesistirClick
    end
  end
  inherited dataSourceGrid: TDataSource
    DataSet = modelMaterial.QconsultaMaterial
  end
end
