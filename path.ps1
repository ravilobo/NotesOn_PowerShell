
#updating environment path 
$env:Path
$env:Path -split ';'
[Environment]::GetEnvironmentVariable('Path')
[Environment]::GetEnvironmentVariable('Path', 'Machine')
[System.Environment]::GetEnvironmentVariable('Path', 'Machine')
[System.Environment]::GetEnvironmentVariable('Path', 'user')

$env:psmpdulepath = $env:psmpdulepath + ";C:\MyModules" #only for the current session. You can keep it in $prfile as a more permanent option 
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") + ";c:\tools"

# permanent change 
$currenPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
$newPath = $currenPath + ';c:\MyModules'
[System.Environment]::SetEnvironmentVariable('PsModulePath',$newPath, 'Machine')



#add new folder to existing ps module path 
$env:psmpdulepath += ';c:\myFolder'


Split-Path C:\ravi\ps\00_JoinSplit.ps1
Split-Path C:\ravi\ps\00_JoinSplit.ps1 -IsAbsolute
Split-Path C:\ravi\ps\00_JoinSplit.ps1 -Leaf
Split-Path C:\ravi\ps\00_JoinSplit.ps1 -NoQualifier
Split-Path C:\ravi\ps\00_JoinSplit.ps1 -Parent
Split-Path C:\ravi\ps\00_JoinSplit.ps1 -Qualifier

# This command returns relative paths for the directories at the root of the C: drive.
Resolve-Path -Path "c:\prog*" -Relative
"C:\windows\*" | Resolve-Path
Resolve-Path -Path "windows"
Resolve-Path ~ #tilde character (~) is shorthand notation for the current user's home folder.

# The Convert-Path cmdlet converts a path from a PowerShell path to a PowerShell provider path.
Convert-Path .
Convert-Path HKLM:\Software\Microsoft
Convert-Path ~

Join-Path -Path "c:\path" -ChildPath "childpath"
Join-Path -Path "c:\path\" -ChildPath "\childpath"
Join-Path -Path C:, D:, E:, F: -ChildPath New
Join-Path -Path System -ChildPath *ControlSet* -Resolve
Join-Path a b c d e f g