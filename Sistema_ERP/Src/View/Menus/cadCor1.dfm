inherited cadCor: TcadCor
  Caption = 'Cadastro de Cor'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlCadastro: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1197
    ExplicitHeight = 660
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label2: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label3: TLabel
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
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 660
  end
end
