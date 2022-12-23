$Servers = 'Server1', 'Server2'
$inputFile = 'C:\deploy\script.sql'
foreach ($i in $Servers) {
 " Now processing $i"
 Invoke-Sqlcmd -ServerInstance $i\pos  -InputFile $inputFile   -ConnectionTimeout 60 -QueryTimeout 99999           
}       
