object formMovEntraMat: TformMovEntraMat
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#227'o - Entrada Material'
  ClientHeight = 750
  ClientWidth = 1197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1197
    Height = 750
    Align = alClient
    TabOrder = 0
    object lblCodigo: TLabel
      Left = 56
      Top = 58
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
    end
    object lblCor: TLabel
      Left = 76
      Top = 97
      Width = 22
      Height = 15
      Caption = 'Cor:'
    end
    object lblDep: TLabel
      Left = 48
      Top = 136
      Width = 50
      Height = 15
      Caption = 'Dep'#243'sito:'
    end
    object lblLote: TLabel
      Left = 72
      Top = 175
      Width = 26
      Height = 15
      Caption = 'Lote:'
    end
    object Label1: TLabel
      Left = 33
      Top = 214
      Width = 65
      Height = 15
      Caption = 'Quantidade:'
    end
    object Panel1: TPanel
      Left = 1
      Top = 659
      Width = 1195
      Height = 90
      Align = alBottom
      TabOrder = 0
      object btnGravar: TButton
        Left = 44
        Top = 33
        Width = 105
        Height = 33
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 2
        OnClick = btnGravarClick
      end
      object btnLimpar: TButton
        Left = 175
        Top = 33
        Width = 105
        Height = 33
        Caption = 'Limpar'
        TabOrder = 0
        OnClick = btnLimparClick
      end
      object btnFechar: TButton
        Left = 310
        Top = 33
        Width = 105
        Height = 33
        Caption = 'Fechar'
        TabOrder = 1
        OnClick = btnFecharClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 312
      Width = 1195
      Height = 347
      Align = alBottom
      TabOrder = 4
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 1193
        Height = 345
        Align = alClient
        DataSource = DS_Qestoque
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object tCodMat: TEdit
      Left = 104
      Top = 55
      Width = 121
      Height = 23
      TabOrder = 5
      OnExit = tCodMatExit
    end
    object tCor: TEdit
      Left = 104
      Top = 94
      Width = 121
      Height = 23
      TabOrder = 6
      OnExit = tCorExit
    end
    object tDescMat: TEdit
      Left = 231
      Top = 55
      Width = 242
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object tDescCor: TEdit
      Left = 231
      Top = 94
      Width = 242
      Height = 23
      Enabled = False
      TabOrder = 8
    end
    object tDep: TEdit
      Left = 104
      Top = 133
      Width = 121
      Height = 23
      TabOrder = 9
      OnExit = tDepExit
    end
    object tDescDep: TEdit
      Left = 231
      Top = 133
      Width = 242
      Height = 23
      Enabled = False
      TabOrder = 10
    end
    object tLote: TEdit
      Left = 104
      Top = 172
      Width = 121
      Height = 23
      TabOrder = 11
      Text = '000000'
      OnEnter = tLoteEnter
    end
    object tQtde: TEdit
      Left = 104
      Top = 211
      Width = 46
      Height = 23
      TabOrder = 12
      OnKeyPress = tQtdeKeyPress
    end
    object btnConsMat: TButton
      Left = 479
      Top = 54
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsMatClick
    end
    object btnConsCor: TButton
      Left = 479
      Top = 93
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btnConsCorClick
    end
    object btnConsDep: TButton
      Left = 479
      Top = 132
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 3
      OnClick = btnConsDepClick
    end
    object habGrav: TButton
      Left = 104
      Top = 256
      Width = 105
      Height = 33
      Hint = 'Habilita o bot'#227'o respons'#225'vel por gravar movimento'
      Caption = 'Habilitar Gravar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = habGravClick
    end
  end
  object Qestoque: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select '
      
        ' mat.codigo as cod_mat, mat.descricao as desc_Mat, cor.codigo as' +
        ' cod_Cor, '
      ' cor.descricao as desc_Cor, est.quantidade, '
      ' est.lote, dep.codigo as dep_cod, dep.descricao as desc_dep'
      'from estoque_material est'
      'inner join cor_material corMat '
      
        'on corMat.cor_Id = est.cor_id and est.material_id = corMat.mater' +
        'ial_id'
      'inner join material mat '
      'on mat.id = corMat.material_id'
      'inner join cor'
      'on cor.id = corMat.cor_id '
      'inner join deposito dep'
      'on dep.id = est.deposito_id'
      'where est.material_id = :idMAt and est.cor_id = :idCor')
    Left = 553
    Top = 448
    ParamData = <
      item
        Name = 'IDMAT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDCOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DS_Qestoque: TDataSource
    DataSet = Qestoque
    Left = 673
    Top = 456
  end
end
