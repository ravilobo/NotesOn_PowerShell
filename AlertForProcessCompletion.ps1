CLEAR-HOST 
$server = 'aUsvsql6971'
$spid = 68
$message = "Table deletion completed!"

$sql = "
set nocount on 
if object_id('tempdb.dbo.LongRunningSpids') is not null drop table tempdb.dbo.LongRunningSpids
go 

declare @TableDef varchar(max)

exec sp_WhoIsActive 
    @format_output = 0, 
    @return_schema = 1, 
    @schema = @TableDef output

set @TableDef = REPLACE(@TableDef, '<table_name>', 'tempdb.dbo.LongRunningSpids')

exec(@TableDef) 
go

exec sp_WhoIsActive @format_output = 0, @destination_table = 'tempdb.dbo.LongRunningSpids'
go
declare @rc int 
select @rc = count(*) 
from tempdb.dbo.LongRunningSpids where session_id = $spid

if @rc > 0 
select 1 stat
else 
select 0 stat 


"


while (1 -eq 1) {
 $result = Invoke-Sqlcmd -ServerInstance $server  -query $sql   -ConnectionTimeout 60 -QueryTimeout 10000
 $stat = $result.stat
 $stat 
 get-date 
 if ($stat -eq 0) {
  'inside if'
  Post-SlackMessage -message $message -SlackChannel '#my-slack0channel'
  break 
 }
 Start-Sleep -Seconds 600
}
