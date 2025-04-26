object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object QconsultaCor: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from cor')
    Left = 216
    Top = 144
  end
  object QcadastroCor: TFDQuery
    Connection = modelConexao.FDConnection1
    SQL.Strings = (
      'select * from cor')
    Left = 376
    Top = 152
  end
  object Ds_QconsultaCor: TDataSource
    DataSet = QconsultaCor
    Left = 360
    Top = 280
  end
  object DS_QcadastroCor: TDataSource
    DataSet = QcadastroCor
    Left = 480
    Top = 280
  end
end
