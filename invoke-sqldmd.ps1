Invoke-Sqlcmd -ServerInstance $server -query $sql -ConnectionTimeout 60 -QueryTimeout 10000

# when you are fetching a very long resultset use -MaxCharLength value 
Invoke-Sqlcmd -ServerInstance $server -query $SQLScript -ConnectionTimeout 60 -QueryTimeout 10000 -ErrorAction stop -MaxCharLength 50000

# -ErrorAction stop will transfer the control to CATCH block
Invoke-Sqlcmd -ServerInstance $server -query $sql -ConnectionTimeout 60 -QueryTimeout 10000 -ErrorAction stop

# reading from AOG secondary
Invoke-Sqlcmd -ConnectionString "Data Source=$SQLServer;Initial Catalog=$db;Integrated Security=True;ApplicationIntent=ReadOnly" -Query $q1
