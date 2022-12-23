# SQL server service account 


$server = 'MyServerName'
$server = $server.Split('\')[0]

# SQL server service account 
$serviceName = (get-Service -ComputerName $server |? {($_.name -like 'MSSQLSERVER*') -or ($_.name -like 'MSSQL$*')  }).name
(Get-WmiObject Win32_Service -Filter "Name='$serviceName'" -ComputerName $server).StartName 

# SQL server agent service account 
$serviceName = (get-Service -ComputerName $server |? {($_.name -like 'SQLSERVERAGENT*') -or ($_.name -like 'SQLAgent$*')  }).name
(Get-WmiObject Win32_Service -Filter "Name='$serviceName'" -ComputerName $server).StartName
