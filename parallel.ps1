# works only on ps 7
1..5 | ForEach-Object -Parallel { "Hello $_"; sleep 1; } -ThrottleLimit 5

# option 2
#region
$SchemaAndTable = @{ "SchemaName" = "$schema"; "TableName" = "$table" }
$sb = ''
$servers = Get-Serverlist
$sb = [scriptblock] {
 param ($system,
  $SchemaName,
  $tableName)

 $SQLDropTriggers = " use Serverops
                      go
                      if object_id('[$schemaName].[tr_$($tableName)_replication_update]') is not null
                      drop trigger [$schemaName].[tr_$($tableName)_replication_update]
                      go
                    "

 Invoke-SQLCmd -ServerInstance $system\pos -query $SQLDropTriggers


}

$rtn = Invoke-Async -Set $servers -SetParam system -ScriptBlock $sb -ThreadCount 25 -Params $SchemaAndTable

#endregion


#region Invoke-MultiSQL

$ServerList = Get-ServerList
$Table = "table1"
$Schema = "dbo"

$SQLText = "select count(*) from Serverops.$($schema).$($table)"
$result = Invoke-MultiSQL -ServerList $ServerList -Query $SQLText -ThreadCount 10


$result[1].Runspace[0].HadErrors
$result[1].Runspace | Format-Table
$result[1].Runspace.Streams.Error


#endregion
