$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
$name = 'UseWUServer'
invoke-command -ComputerName MyServer -ScriptBlock { 
 Get-ItemPropertyValue -Path $using:path -Name $using:name
}

#region remote execution 

$ReServerDBCMD = "SQLsafeCmd.exe ReServer $database F:\Backup\$($Servername_Source)_$($database).safe -DisconnectUsers -Replace -Move $LogicalDataName $DatabaseMDFFiles -Move $LogicalLogName $DatabaseLDFFiles -EncryptedReServerPassword ""y8KSJBbtJUM4WQQJHsbjCRpGDqHYJ31XjcU4V3Za+R4wJ228DpusQJe+5MPTVpOiCn5rZj+l328XI/MEkbrFxA=="" "
$Script = [ScriptBlock]::Create($ReServerDBCMD)
Invoke-Command -ComputerName $Servername_Dest -ScriptBlock $Script


#endregion 