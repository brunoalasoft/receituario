object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 417
  Width = 476
  object conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Users\tsuna\Documents\projetobruno\data\BANCO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FIREBIRD')
    LoginPrompt = False
    Left = 72
    Top = 96
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'FIREBIRD'
    VendorLib = 'C:\Users\tsuna\Documents\projetobruno\bin\fbclient.dll'
    Left = 72
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = conexao
    Left = 224
    Top = 192
  end
end
