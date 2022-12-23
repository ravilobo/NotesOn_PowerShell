

#region simple loop                     
$Servers = 'F015', 'C0785', 'C0129', 'F1152', 'C0537', 'F931', 'C0035', 'C0012', 'C1964', 'C0078'
$cnt = $Servers.length 
foreach ($i in $Servers) {
 " Now processing $i"   
 $sql = ''
 Invoke-Sqlcmd -ServerInstance 'MyServer'  -query $sql   -ConnectionTimeout 60 -QueryTimeout 10000           

 Write-Warning "more to go $cnt"
 $cnt--
}       
#endregion 

#region advanced loop                    
$Servers = 
$NoofItems = $Servers.length 
$badServers = ''

foreach ($i in $Servers) {
 "now processing: [$i]"

 if (Test-Connection $i -Quiet) {

  #$sql = " "
  #Invoke-Sqlcmd -ServerInstance $i\pos  -query $sql   -ConnectionTimeout 60 -QueryTimeout 10000

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
#endregion 
                    