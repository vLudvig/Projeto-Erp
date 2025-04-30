object cadastroGeral: TcadastroGeral
  Left = 0
  Top = 0
  Caption = 'Cadastro Geral'
  ClientHeight = 750
  ClientWidth = 1197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 1197
    Height = 660
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 19
      Width = 13
      Height = 15
      Caption = 'Id:'
    end
    object Label2: TLabel
      Left = 56
      Top = 56
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 44
      Top = 104
      Width = 54
      Height = 15
      Caption = 'Descri'#231#227'o:'
    end
    object tId: TEdit
      Left = 44
      Top = 16
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object tCodigo: TEdit
      Left = 104
      Top = 53
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object tDesc: TEdit
      Left = 104
      Top = 101
      Width = 321
      Height = 23
      TabOrder = 2
    end
    object checkAtivo: TCheckBox
      Left = 463
      Top = 56
      Width = 57
      Height = 17
      Caption = 'Ativo'
      TabOrder = 3
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 660
    Width = 1197
    Height = 90
    Align = alBottom
    TabOrder = 1
    object btnIncluir: TButton
      Left = 44
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 175
      Top = 33
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
    end
    object btnConsultar: TButton
      Left = 445
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Consultar'
      TabOrder = 3
    end
    object btnFechar: TButton
      Left = 576
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = btnFecharClick
    end
    object btnConfirmar: TButton
      Left = 44
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Confirmar'
      TabOrder = 5
      OnClick = btnConfirmarClick
    end
    object btnDesistir: TButton
      Left = 175
      Top = 33
      Width = 105
      Height = 33
      Caption = 'Desistir'
      TabOrder = 6
      OnClick = btnDesistirClick
    end
  end
end
