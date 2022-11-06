object dmConexao: TdmConexao
  Height = 130
  Width = 461
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=PG')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    Connected = True
    LoginPrompt = False
    Transaction = fdTransacao
    Left = 32
    Top = 24
  end
  object fdPostgres: TFDPhysPgDriverLink
    VendorHome = 'C:\Git'
    Left = 144
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 24
  end
  object fdTransacao: TFDTransaction
    Connection = fdConexao
    Left = 377
    Top = 24
  end
end
