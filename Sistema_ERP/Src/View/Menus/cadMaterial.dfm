object cadastroMaterial: TcadastroMaterial
  Left = 20
  Top = 0
  Caption = 'Cadastro De Material'
  ClientHeight = 750
  ClientWidth = 1197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = abrirTelaMaterial
  OnDestroy = FecharTelaMaterial
  TextHeight = 15
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 1197
    Height = 660
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 56
      Top = 56
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
    end
    object Descrição: TLabel
      Left = 44
      Top = 104
      Width = 54
      Height = 15
      Caption = 'Descri'#231#227'o:'
    end
    object Label2: TLabel
      Left = 62
      Top = 152
      Width = 36
      Height = 15
      Caption = 'Grupo:'
    end
    object Label3: TLabel
      Left = 44
      Top = 200
      Width = 54
      Height = 15
      Caption = 'Categoria:'
    end
    object Label4: TLabel
      Left = 274
      Top = 56
      Width = 47
      Height = 15
      Caption = 'Unidade:'
    end
    object Label5: TLabel
      Left = 65
      Top = 307
      Width = 33
      Height = 15
      Caption = 'Cores:'
    end
    object Label6: TLabel
      Left = 696
      Top = 35
      Width = 110
      Height = 15
      Caption = 'Imagem do Material:'
    end
    object Label7: TLabel
      Left = 696
      Top = 367
      Width = 119
      Height = 15
      Caption = 'Imagem 2 do Material:'
    end
    object lblId: TLabel
      Left = 25
      Top = 19
      Width = 13
      Height = 15
      Caption = 'Id:'
    end
    object tCodigoMat: TEdit
      Left = 104
      Top = 53
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object tDescMat: TEdit
      Left = 104
      Top = 101
      Width = 321
      Height = 23
      TabOrder = 1
    end
    object tGrupoMat: TEdit
      Left = 104
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object tCategoriaMat: TEdit
      Left = 104
      Top = 197
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object checkAtivo: TCheckBox
      Left = 463
      Top = 56
      Width = 57
      Height = 17
      Caption = 'Ativo'
      TabOrder = 4
    end
    object cbUnidade: TComboBox
      Left = 327
      Top = 53
      Width = 97
      Height = 23
      TabOrder = 5
      Items.Strings = (
        'MT'
        'KG'
        'UN'
        'TN'
        'MM'
        'GR')
    end
    object gridCores: TDBGrid
      Left = 56
      Top = 328
      Width = 297
      Height = 297
      DataSource = DS_Cor_Mat
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 688
      Top = 56
      Width = 297
      Height = 289
      Cursor = crHandPoint
      Caption = 'Anexar'
      TabOrder = 7
    end
    object Panel2: TPanel
      Left = 688
      Top = 388
      Width = 225
      Height = 205
      Cursor = crHandPoint
      Caption = 'Anexar'
      TabOrder = 8
    end
    object tIdMat: TEdit
      Left = 44
      Top = 16
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 9
    end
    object btnAddCor: TButton
      Left = 56
      Top = 629
      Width = 98
      Height = 25
      Caption = 'Adicionar Cor'
      TabOrder = 10
      OnClick = btnAddCorClick
    end
    object btnRemovCor: TButton
      Left = 160
      Top = 629
      Width = 98
      Height = 25
      Caption = 'Remover Cor'
      TabOrder = 11
      OnClick = btnRemovCorClick
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 660
    Width = 1197
    Height = 90
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
    object btnIncluir: TButton
      Left = 44
      Top = 32
      Width = 105
      Height = 33
      Caption = 'Incluir'
      ImageIndex = 1
      ImageName = 'imgIncluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 175
      Top = 32
      Width = 105
      Height = 33
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 310
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnConsultar: TButton
      Left = 445
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Consultar'
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object btnConfirmar: TButton
      Left = 44
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Confirmar'
      TabOrder = 4
      OnClick = btnConfirmarClick
    end
    object btnDesistir: TButton
      Left = 175
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Desisitr'
      TabOrder = 5
      OnClick = btnDesistirClick
    end
    object Button1: TButton
      Left = 576
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Fechar'
      TabOrder = 6
      OnClick = btnFecharClick
    end
  end
  object DS_Cor_Mat: TDataSource
    DataSet = QcorMaterial
    Left = 272
    Top = 408
  end
  object QcorMaterial: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select c.codigo, c.descricao, c.ativa from cor c'
      'inner join cor_material cm'
      'on c.id = cm.cor_id'
      'inner join material m'
      'on m.id = cm.Material_id'
      'where m.id = :idMat')
    Left = 256
    Top = 520
    ParamData = <
      item
        Name = 'IDMAT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QcorMaterialCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object QcorMaterialDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
    end
    object QcorMaterialATIVA: TStringField
      DisplayLabel = 'Ativa'
      FieldName = 'ATIVA'
      Origin = 'ATIVA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
