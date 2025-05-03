object modelConexao: TmodelConexao
  Height = 485
  Width = 693
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projeto-Erp\Sistema_ERP\Base\SISPLANPROJETO.FB3'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 232
    Top = 128
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 224
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 312
    Top = 288
  end
end
