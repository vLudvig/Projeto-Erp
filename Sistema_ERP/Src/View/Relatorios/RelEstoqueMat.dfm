inherited fmRelEstoqueMat: TfmRelEstoqueMat
  Caption = 'Relat'#243'rio - Estoque Material'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited Panel2: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblDesc: TLabel
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblCodigo: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblCor: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblDep: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblLote: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblTpMov: TLabel
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tCodMat: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tCor: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tDep: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tDescCor: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tDescDep: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tDescMat: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tLote: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tDescMovto: TEdit
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited cbTpMov: TComboBox
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited QconsultaMovto: TFDQuery
    SQL.Strings = (
      'select * from estoque_material where 1 = 1')
  end
end
