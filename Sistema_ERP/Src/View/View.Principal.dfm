object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'FireBird 3.0 - Projeto Erp'
  ClientHeight = 793
  ClientWidth = 1151
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1151
    Height = 793
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1149
    ExplicitHeight = 785
    DesignSize = (
      1151
      793)
    object Image1: TImage
      Left = 16
      Top = 256
      Width = 578
      Height = 521
      Align = alCustom
      Anchors = [akLeft, akBottom]
      Center = True
    end
    object Panel2: TPanel
      Left = 624
      Top = 512
      Width = 425
      Height = 233
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 504
      object Label1: TLabel
        Left = 24
        Top = 83
        Width = 289
        Height = 40
        AutoSize = False
        Caption = 'Projeto Erp'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 24
        Top = 161
        Width = 100
        Height = 15
        Caption = 'Autor: Vitor Ludvig'
      end
      object lblGit: TLabel
        Left = 24
        Top = 184
        Width = 149
        Height = 15
        Cursor = crHandPoint
        Caption = 'https://github.com/vLudvig'
        OnClick = lblMouseClick
        OnMouseEnter = lblMouseEnter
        OnMouseLeave = lblMouseLeave
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 784
    Top = 16
    object abaCadastros: TMenuItem
      Caption = 'Cadastros'
      object Material1: TMenuItem
        Caption = 'Materiais'
        OnClick = Material1Click
      end
      object N1: TMenuItem
        Caption = 'Cores'
        OnClick = N1Click
      end
      object GrupodeMaterial1: TMenuItem
        Caption = '-'
      end
      object CategoriaMaterial1: TMenuItem
        Caption = 'Grupo de Materiais'
        OnClick = CategoriaMaterial1Click
      end
      object CategoriaMaterial2: TMenuItem
        Caption = 'Categoria de Materiais'
        OnClick = CategoriaMaterial2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = 'Dep'#243'sito'
        OnClick = N5Click
      end
    end
    object Movimentaes1: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object EntradadeMaterial1: TMenuItem
        Caption = 'Entrada de Materiais'
        OnClick = EntradadeMaterial1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object SaidaDeMateriais1: TMenuItem
        Caption = 'Sa'#237'da de Materiais'
        OnClick = SaidaDeMateriais1Click
      end
      object SadadeProdutos2: TMenuItem
        Caption = '-'
      end
      object ransfrenciaDepProd1: TMenuItem
        Caption = 'Transf'#234'rencia Dep. Mat.'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object MovimentaesMat1: TMenuItem
        Caption = 'Estoque'
      end
      object MovimentaesMat2: TMenuItem
        Caption = 'Movimenta'#231#245'es Mat.'
      end
    end
  end
end
