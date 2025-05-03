inherited cadCor: TcadCor
  Caption = 'Cadastro de Cor'
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
    object Label5: TLabel [4]
      Left = 38
      Top = 101
      Width = 5
      Height = 15
      Caption = '*'
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
      TabOrder = 4
      object gridCores: TDBGrid
        Left = 0
        Top = 0
        Width = 1197
        Height = 310
        DataSource = DS_GridCores
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
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
    inherited btnConsultar: TButton
      OnClick = btnConsultarClick
    end
  end
  object DS_GridCores: TDataSource
    DataSet = Qcores
    Left = 856
    Top = 416
  end
  object Qcores: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from cor')
    Left = 736
    Top = 504
    object QcoresID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QcoresCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object QcoresDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
    end
    object QcoresATIVA: TStringField
      DisplayLabel = 'Ativa'
      FieldName = 'ATIVA'
      Origin = 'ATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
