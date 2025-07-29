inherited vmAlteraSenha: TvmAlteraSenha
  Caption = 'vmAlteraSenha'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited pnl1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblBemVindo: TLabel
      Left = 100
      Top = 39
      Width = 450
      Caption = 'Altera'#231#227'o de Senha'
      ExplicitLeft = 100
      ExplicitTop = 39
      ExplicitWidth = 450
    end
    inherited Label1: TLabel
      Left = 43
      Width = 96
      Caption = 'Senha atual:'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 43
      ExplicitWidth = 96
    end
    inherited Label2: TLabel
      Left = 47
      Width = 94
      Caption = 'Nova senha:'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 47
      ExplicitWidth = 94
    end
    inherited Label3: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    object lblUsuarioLog: TLabel [4]
      Left = 98
      Top = 94
      Width = 127
      Height = 15
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fira Code'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited tUsuario: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tSenha: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited tConfirmaSenha: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
  end
end
