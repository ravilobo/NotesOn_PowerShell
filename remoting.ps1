<#
legacy RPC/DCOM 
     -- if you see a -COMPUTERNAME param that is legacy 
WSMan is the standard protocol for remote management using HTTP/HTTPS  
 WinRM service is the windows implementation 
 does not use port 80 or 443
 use port 5985 (HTTP) 5986 (HTTPS)
 WinRM is enabled by default on windows 2012 and above 
#>

Enable-PSRemoting -Force #run as admin 
Enable-PSRemoting -Force -SkipNetworkProfileCheck # or 
Get-Service WinRM
Test-WSMan -ComputerName cmp1 
Enter-PSSession -ComputerName cmp1 # one computer 
Invoke-Command -ComputerName cmp1, cmp2 -ScriptBlock { dir c:\ } # 1:M,  if this fails, check firewall policy for for port 5985 

#or 
Set-WSManQuickConfig #htto 
Set-WSManQuickConfig -UseSSL #https 




# variable scope 
# $using for scope 
$Mypath  = "C:\windows\";
Invoke-Command -ComputerName "MyServer" -ScriptBlock { Get-ChildItem -Path $Using:Mypath  -File } ;


# enables remote session 
$session = new-pssession -computername   
Invoke-command -scriptblock {   } -session $session 
$session | remove-pssession 




<#
-- to enable second hop 
Enable-wsmancredssp

Don Jones 
http://channel9.msdn.com/Events/TechEd/NorthAmerica/2012/WCL403

powershellbooks.com 
secrets of powershell remoting 

By default local admin 
Credentials get deligated (no password clear text/encrypted)

#>

$session = new-pssession -computername   
Invoke-command -ScriptBlock {   } -session $session 
$session | remove-pssession 





Get-psdiagnostics 
Enable-psWSManCombitedTrace 
Get-pssession | remove-pssesssion 
Disconnect-pssession 


#here are the pssession cmdlets
gcm -noun PSSession


Test-WSMan -ComputerName chi-dc03

#create a session
$s = New-PSSession -ComputerName chi-dc03
get-pssession
invoke-command { $x = 123 ; $logs = get-eventlog -list } -session $s
icm { $logs } -session $s

#use sessions for long running tasks
icm { start-job { dir c:\windows -Recurse } } -session $s

#let's disconnect
help Disconnect-PSSession
Disconnect-PSSession -Session $s -IdleTimeoutSec 3000
Get-PSSession

#switch to different powerShell session on the same computer
get-pssession -ComputerName chi-dc03

#if you are running under different credentials than what you
#used to start the session, you will need to specify them.

help Connect-PSSession

$s = connect-pssession -ComputerName chi-dc03
$s
icm { $x } -session $s
icm { get-job } -Session $s

#running a command in a disconnected session
help icm -Parameter InDisconnectedSession
icm { get-wmiobject win32_service | 
 select Name, StartMode, State, StartName } -InDisconnectedSession -computername CHI-DC01

#receiving session results
help Receive-PSSession
get-pssession -ComputerName chi-dc01 | Receive-PSSession

Get-PSSession
Get-PSSession | Remove-PSSession

#check the new help topics
help about_remote* | format-table Name, Synopsis -wrap


# access non domain computer 
Get-Item -Path WSMan:\localhost\Client\TrustedHosts
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value 'MyNonDomanComputer' #trust a non-doman computer 


