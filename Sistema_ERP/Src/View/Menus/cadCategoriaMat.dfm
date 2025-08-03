inherited cadCategoriaMaterial: TcadCategoriaMaterial
  Caption = 'Cadastro - Categoria Material'
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
    object Panel1: TPanel
      Left = 1
      Top = 216
      Width = 1195
      Height = 443
      Align = alBottom
      TabOrder = 4
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 1193
        Height = 441
        Align = alClient
        DataSource = DS_QcategoriaMat
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
    inherited btnConsultar: TButton
      OnClick = btnConsultarClick
    end
  end
  object DS_QcategoriaMat: TDataSource
    DataSet = QcategoriaMat
    Left = 817
    Top = 416
  end
  object QcategoriaMat: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from categoria_material')
    Left = 673
    Top = 448
    object QcategoriaMatID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QcategoriaMatCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      Size = 4
    end
    object QcategoriaMatDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
  end
end
