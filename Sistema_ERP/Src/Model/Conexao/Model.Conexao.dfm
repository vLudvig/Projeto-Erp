object modelConexao: TmodelConexao
  Height = 485
  Width = 693
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\ProjetoSisplan\Sisplan\Base\SISPLANPROJETO.FB3'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 192
    Top = 168
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
