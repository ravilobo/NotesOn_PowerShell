clear-host 
function Get-RemoteExecutionPolicy ($MachineName)
{
$regKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $MachineName)
$PSRegKey= $regKey.OpenSubKey("SOFTWARE\\Microsoft\\Powershell\\1\\ShellIds\\Microsoft.PowerShell")
$strPolicy = ($PSRegKey.getvalue("ExecutionPolicy")).tostring()

Return $strPolicy
}

Get-RemoteExecutionPolicy MyServer