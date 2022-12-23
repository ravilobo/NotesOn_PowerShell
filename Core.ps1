# PowerShell Core 
# http://aka.ms/get-powershell 
# open source 
# built on .net Core 
# on the other hand, windows powershell is built on .Net Framework 
# Import-Module MyModule -useWindowsPowerShell (for older modules)

$iswindows 
$IsMacOS
$IsLinux

# parallel execution 
$nums = (1..10)
measure-command {$nums|ForEach-Object {start-sleep -s 1}}
measure-command {$nums|ForEach-Object -parallel  {start-sleep -s 1} -ThrottleLimit 10}

# ternary operators 
$i = 80
($i -gt 75) ? 'yuhoo' : 'yikes'

# null coalescing 
$ans = $null 
$ans ?? 42

$ans = 52
$ans ?? 42

# passthru
# can be used to do a process that's selected from grid 
get-process | Out-GridView -PassThru | Stop-Process

# send the out-put to clip board 
get-process w* |clip 

# command to install PowerShell chocolette 
# open core in ADMIN mode and run this 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#then run this 
Choco upgrade powershell-core

# list outdated packages 
choco outdated 
