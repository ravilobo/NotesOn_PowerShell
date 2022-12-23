$sb = {get-service|where {$_.status -eq 'Running'}}

# run 
& $sb 

$server = 'MyServer'
invoke-command -computername $server -scriptblock {
 dir c:\
}

# passing a variable
$server = 'MyServer'
$mypath = 'c:\windows'
invoke-command -computername $server -scriptblock {
 Get-ChildItem $using:mypath | select -First 10 | select name
}

# multiple computers
$mypath = 'c:\windows'
invoke-command -scriptblock {
 Get-ChildItem $using:mypath | select -First 3 | select name
} -ComputerName MyServer, 


# passing a variable
$server = 'MyServer'
$mypath = 'c:\windows'
invoke-command -computername $server -scriptblock {
 param($localPath)
 get-childitem $localPath | select -First 10 | select name
} -ArgumentList $mypath

# passing multiple variables
$server = 'MyServer'
$mypath = 'c:\windows'
$myrows = 3
invoke-command -computername $server -scriptblock {
 get-childitem $args[0] | select -First $args[1] | select name
} -ArgumentList $mypath, $myrows


# option 2: passing multiple variables
$server = 'MyServer'
$mypath = 'c:\windows'
$myrows = 3
invoke-command -computername $server -scriptblock {
 param($localPath, $localrows)
 get-childitem $localPath | select -First $localrows | select name
} -ArgumentList $mypath, $myrows





# passing a variable to a remote script
$server = 'MyServer'
$name = 'Curtis'

<#
# content of C:\TEMP\TEST.PS1
Param(
 [string]$name
)

write-Host "Hello there Mr.[$name]!"
#>

invoke-command -computername $server -scriptblock {
 C:\TEMP\TEST.PS1 -NAME $using:name
}


# large script block
$server = 'MyServer'
$LargeScriptBlock = {
$env:COMPUTERNAME
get-childitem c:\ |select -First 3 |select name
}
invoke-command -computername $server -scriptblock $LargeScriptBlock




