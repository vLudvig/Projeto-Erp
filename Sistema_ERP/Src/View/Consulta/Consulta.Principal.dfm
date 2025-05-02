object formConsultaPrincipal: TformConsultaPrincipal
  Left = 0
  Top = 0
  Caption = 'Consulta - Principal'
  ClientHeight = 502
  ClientWidth = 833
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlEdit: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 83
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 38
      Height = 15
      Caption = 'Buscar:'
    end
    object Label2: TLabel
      Left = 568
      Top = 10
      Width = 59
      Height = 15
      Caption = 'Buscar por:'
    end
    object tBusca: TEdit
      Left = 16
      Top = 31
      Width = 385
      Height = 23
      TabOrder = 0
    end
    object cmbBusca: TComboBox
      Left = 568
      Top = 31
      Width = 145
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Descri'#231#227'o'
      Items.Strings = (
        'Descri'#231#227'o'
        'Codigo')
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 83
    Width = 833
    Height = 365
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 831
      Height = 363
      Align = alClient
      DataSource = dataSourceGrid
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 448
    Width = 833
    Height = 54
    Align = alBottom
    TabOrder = 2
    object btnSelecReg: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = btnSelecRegClick
    end
    object btnDesistir: TButton
      Left = 112
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Desistir'
      TabOrder = 1
      OnClick = btnDesistirClick
    end
  end
  object dataSourceGrid: TDataSource
    DataSet = Qconsulta
    Left = 608
    Top = 179
  end
  object Qconsulta: TFDQuery
    Left = 608
    Top = 331
  end
end
