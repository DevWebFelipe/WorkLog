object DMConexao: TDMConexao
  Height = 160
  Width = 252
  object conConnection: TFDConnection
    Params.Strings = (
      'Database=WORKLOG_DB'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=PG')
    Left = 112
    Top = 64
  end
end
