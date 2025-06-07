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
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1197
    Height = 750
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 24
    ExplicitTop = 8
    object lblCodigo: TLabel
      Left = 56
      Top = 56
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
    end
    object lblCor: TLabel
      Left = 76
      Top = 95
      Width = 22
      Height = 15
      Caption = 'Cor:'
    end
    object lblDep: TLabel
      Left = 48
      Top = 134
      Width = 50
      Height = 15
      Caption = 'Dep'#243'sito:'
    end
    object lblLote: TLabel
      Left = 72
      Top = 173
      Width = 26
      Height = 15
      Caption = 'Lote:'
    end
    object Label1: TLabel
      Left = 33
      Top = 212
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
      ExplicitTop = 708
      object Button1: TButton
        Left = 44
        Top = 33
        Width = 105
        Height = 33
        Caption = 'Gravar'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 175
        Top = 33
        Width = 105
        Height = 33
        Caption = 'Limpar'
        TabOrder = 1
      end
      object Button3: TButton
        Left = 310
        Top = 33
        Width = 105
        Height = 33
        Caption = 'Fechar'
        TabOrder = 2
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 400
      Width = 1195
      Height = 259
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 408
    end
    object tCodMat: TEdit
      Left = 104
      Top = 53
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object tCor: TEdit
      Left = 104
      Top = 92
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object tDescMat: TEdit
      Left = 231
      Top = 53
      Width = 202
      Height = 23
      TabOrder = 4
    end
    object tDescCor: TEdit
      Left = 231
      Top = 92
      Width = 202
      Height = 23
      TabOrder = 5
    end
    object tDep: TEdit
      Left = 104
      Top = 131
      Width = 121
      Height = 23
      TabOrder = 6
    end
    object tDescDep: TEdit
      Left = 231
      Top = 131
      Width = 202
      Height = 23
      TabOrder = 7
    end
    object tLote: TEdit
      Left = 104
      Top = 170
      Width = 121
      Height = 23
      TabOrder = 8
      Text = '000000'
    end
    object tQtde: TEdit
      Left = 104
      Top = 209
      Width = 46
      Height = 23
      TabOrder = 9
    end
  end
end
