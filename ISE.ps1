#region enable ISE on servers
Import-Module ServerManager
Add-WindowsFeature PowerShell-ISE

#endregion

#region ISE OPTIONS
$psise.Options.Zoom = 125
$host.PrivateData.ErrorForegroundColor = 'yellow' # error color
psedit C:\perf.txt
ise C:\perf.txt

#endregion

#region rename a tab
#To rename a tab where you are :
$psise.CurrentPowerShellTab.DisplayName = 'Dev'

#To rename a remote tab, you need to do that from a local one (where the first tab is [0] ):
$psise.PowerShellTabs[1].DisplayName = 'Remote-Server01'
#endregion




# admin mode
# you can add this at the top
#Requires -RunAsAdministrator

# or run this code
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# How to check if the code is running from ISE?
$env:TERM_PROGRAM #vscode
$host.name   # Visual Studio Code Host or Windows PowerShell ISE Host


if ($host.name -ne 'Windows PowerShell ISE Host') {
 write-warning 'Please run this script from PS ISE!'
 return
}
