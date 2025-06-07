inherited formCadDeposito: TformCadDeposito
  Caption = 'Cadastro - Dep'#243'sito'
  StyleElements = [seFont, seClient, seBorder]
  OnDestroy = FormDestroy
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
      Hint = 'Indica Campo Obrigat'#243'rio'
      ParentShowHint = False
      ShowHint = True
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label6: TLabel
      Hint = 'Indica Campo Obrigat'#243'rio'
      ParentShowHint = False
      ShowHint = True
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
    inherited checkAtivo: TCheckBox
      Left = 368
      Top = 52
      ExplicitLeft = 368
      ExplicitTop = 52
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 296
      Width = 1195
      Height = 363
      Align = alBottom
      TabOrder = 4
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 1193
        Height = 361
        Align = alClient
        DataSource = DS_QgridDepos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object grpDep: TGroupBox
      Left = 56
      Top = 161
      Width = 185
      Height = 121
      Caption = 'Configura'#231#245'es'
      TabOrder = 5
      object checkQtdeNeg: TCheckBox
        Left = 16
        Top = 24
        Width = 153
        Height = 17
        Caption = 'Permite Qtde Negativa'
        TabOrder = 0
      end
      object checkSaidaMn: TCheckBox
        Left = 16
        Top = 58
        Width = 153
        Height = 17
        Caption = 'Permite Saida Manual'
        TabOrder = 1
      end
      object checkEntMn: TCheckBox
        Left = 16
        Top = 92
        Width = 153
        Height = 17
        Caption = 'Permite Entrada Manual'
        TabOrder = 2
      end
    end
    object radioTipoDep: TRadioGroup
      Left = 471
      Top = 52
      Width = 130
      Height = 72
      Hint = 'Telas de Produto ainda em desenvolvimento!'
      Caption = 'Tipo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object rdBtnProd: TRadioButton
      Left = 480
      Top = 72
      Width = 113
      Height = 17
      Hint = 'Telas de Produto ainda em desenvolvimento!'
      Caption = 'Produto'
      Enabled = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
    end
    object rdBtnMat: TRadioButton
      Left = 480
      Top = 95
      Width = 113
      Height = 17
      Caption = 'Material'
      Checked = True
      TabOrder = 8
      TabStop = True
    end
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
    inherited btnConsultar: TButton
      OnClick = btnConsultarClick
    end
  end
  object DS_QgridDepos: TDataSource
    DataSet = QgridDepos
    Left = 721
    Top = 408
  end
  object QgridDepos: TFDQuery
    Active = True
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'SELECT * FROM DEPOSITO')
    Left = 497
    Top = 448
    object QgridDeposID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QgridDeposCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object QgridDeposDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object QgridDeposATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object QgridDeposTIPO_P_M: TStringField
      DisplayLabel = 'Prod. ou Mat.'
      FieldName = 'TIPO_P_M'
      Origin = 'TIPO_P_M'
      FixedChar = True
      Size = 1
    end
    object QgridDeposNEGATIVO: TStringField
      DisplayLabel = 'Qtde Negativa'
      FieldName = 'NEGATIVO'
      Origin = 'NEGATIVO'
      FixedChar = True
      Size = 1
    end
    object QgridDeposSAIDA_MN: TStringField
      DisplayLabel = 'Sa'#237'da Manual'
      FieldName = 'SAIDA_MN'
      Origin = 'SAIDA_MN'
      FixedChar = True
      Size = 1
    end
    object QgridDeposENTRADA_MN: TStringField
      DisplayLabel = 'Entrada Manual'
      FieldName = 'ENTRADA_MN'
      Origin = 'ENTRADA_MN'
      FixedChar = True
      Size = 1
    end
  end
end
