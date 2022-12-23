
#region reboot time 
(Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
#endregion 

#region system up time 
[Timespan]::FromMilliseconds([Environment]::TickCount)
#endregion 

#region owner of a process 
# Parameter -IncludeUserName (Powershell v4/v5 - Run as administrator) 
Get-Process -Id 5448 -IncludeUserName | Select-Object -Property UserName

# CIM
Invoke-CimMethod -InputObject $(Get-CimInstance Win32_Process -Filter "ProcessID = '5448'") -MethodName GetOwner

# WMI (Powershell v3)
(Get-WmiObject -Query 'Select * FROM Win32_Process WHERE ProcessID = 5448').GetOwner() | Select-Object -Property Domain, User

$proc = Get-CimInstance Win32_Process  -ComputerName MyServer -Filter "name = 'HaloSource.exe'"
Invoke-CimMethod -InputObject $proc -MethodName GetOwner

#endregion 