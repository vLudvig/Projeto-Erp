inherited formCadDeposito: TformCadDeposito
  Caption = 'Cadastro - Dep'#243'sito'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlCadastro: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = -8
    ExplicitTop = -6
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
        Top = 56
        Width = 153
        Height = 17
        Caption = 'Permite Saida Manual'
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
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
      Caption = 'Tipo'
      TabOrder = 6
    end
    object RadioButton1: TRadioButton
      Left = 480
      Top = 72
      Width = 113
      Height = 17
      Caption = 'Produto'
      TabOrder = 7
    end
    object RadioButton2: TRadioButton
      Left = 480
      Top = 95
      Width = 113
      Height = 17
      Caption = 'Material'
      TabOrder = 8
    end
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
end
