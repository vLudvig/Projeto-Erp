inherited formCadGrupoMat: TformCadGrupoMat
  Caption = 'Cadastro-Grupo Material'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlCadastro: TPanel
    StyleElements = [seFont, seClient, seBorder]
    DesignSize = (
      1197
      660)
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
    object Label5: TLabel [5]
      Left = 21
      Top = 323
      Width = 109
      Height = 15
      Caption = 'Grupos Cadastrados:'
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
    object groupParams: TGroupBox
      Left = 56
      Top = 176
      Width = 185
      Height = 121
      Caption = 'Configura'#231#245'es'
      TabOrder = 5
      object checkMovEst: TCheckBox
        Left = 19
        Top = 25
        Width = 142
        Height = 17
        Caption = 'Movimenta Estoque'
        TabOrder = 0
      end
      object checkGeraInv: TCheckBox
        Left = 19
        Top = 56
        Width = 126
        Height = 17
        Caption = 'Gera Invent'#225'rio'
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 19
        Top = 88
        Width = 150
        Height = 17
        Caption = 'Ainda em Programa'#231#227'o'
        Enabled = False
        TabOrder = 2
      end
    end
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnConsultar: TButton
      OnClick = btnConsultarClick
    end
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
    object QgrupoMaterialID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QgrupoMaterialCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      Size = 4
    end
    object QgrupoMaterialDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object QgrupoMaterialMOVIMENTA_ESTOQUE: TStringField
      DisplayLabel = 'Movimenta Estoque'
      FieldName = 'MOVIMENTA_ESTOQUE'
      Origin = 'MOVIMENTA_ESTOQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QgrupoMaterialGERA_INVENTARIO: TStringField
      DisplayLabel = 'Gera Invent'#225'rio'
      FieldName = 'GERA_INVENTARIO'
      Origin = 'GERA_INVENTARIO'
      FixedChar = True
      Size = 1
    end
    object QgrupoMaterialATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
