inherited formCadGrupoMat: TformCadGrupoMat
  Caption = 'Cadastro Grupo Material'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlCadastro: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label2: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label3: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label4: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label6: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tId: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tCodigo: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tDesc: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    object pnlGrid: TPanel
      Left = 0
      Top = 344
      Width = 1197
      Height = 310
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 4
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 1195
        Height = 308
        Align = alClient
        DataSource = DS_QgrupoMaterial
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  object DS_QgrupoMaterial: TDataSource
    DataSet = QgrupoMaterial
    Left = 920
    Top = 456
  end
  object QgrupoMaterial: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from grupo_material')
    Left = 800
    Top = 464
  end
end
