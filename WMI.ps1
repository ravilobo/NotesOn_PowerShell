<#
WMI 
uses legacy protocols: rpc/dcom 
local repo for system info 
managed by winmgmt service 
can be queries with a sql-like syntax 
#>

Get-WmiObject -classname win32_service -ComputerName srv1 
gwmi win32_share
whoami

Get-WmiObject Win32_Processor -ComputerName "dix-t-lsudbs-03"
Get-WmiObject Win32_SMBIOSMemory -ComputerName "dix-t-lsudbs-03"
Get-WMIObject Win32_Volume -computer "dix-q-accdbs-01"
Get-WmiObject Win32_DiskDrive -ComputerName "dix-t-lsudbs-03"

#do the filtering on the server 
Get-WmiObject -Query "select * from win32_process where name = 'lsass.exe'" -ComputerName srv1,srv2 |select name, workingsizeset
Get-WmiObject win32_process -Filter "name='lsass.exe'" -ComputerName srv1,srv2 |select name, workingsizeset
#you can use a local user like this 
Get-WmiObject win32_process -Filter "name='lsass.exe'" -ComputerName srv1,srv2 -credential bar\localuser 

#utility 
#uset to query wmi objects 
# to test connectivity 
wbemtest 

# list of win32 classes
Get-WmiObject -List | Where-Object { $_.name -like "win32*" }

#RAM
[int]$RAM = (Get-WmiObject Win32_ComputerSystem -ComputerName "MyServer").TotalPhysicalMemory/1GB
$RAM

#block size
Get-WMIObject Win32_Volume -computer "MyServer"  | select  blocksize, caption, capacity | Out-GridView




