
$Servers = 'server1', 'server2', 'server2'

$NoofItems = $Servers.length 
$badServers = ''
$inputFile = 'C:\ravi\workbench\20171206_ArchivalServer\script.sql'

foreach ($i in $Servers) {
 "now processing: [$i]"
 if (Test-Connection $i -Quiet) {
  Invoke-Sqlcmd -ServerInstance $i\pos  -InputFile $inputFile   -ConnectionTimeout 60 -QueryTimeout 10000           
  $NoofItems-- 
  write-host "Pending count $noofitems" -ForegroundColor Green 
 }
 else {
  write-host "Server [$i] is not on network!" -ForegroundColor Red 
  $badServers = $badServers + $i + ','   
 }

}                                        

$badServers = $badServers.TrimEnd(',')                    
if ($badServers.Length -gt 0) {
 write-host "Servers NOT on network: [$badServers]" -ForegroundColor Red 
}                    
       
