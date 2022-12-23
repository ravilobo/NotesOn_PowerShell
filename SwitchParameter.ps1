param (
 [switch]$Deploy
)

if ($Deploy) {
 Write-Host "True"
}
else {
 Write-Host "False"
}

# limitation of switches 
<#
I can define a variable like below at the top of a script.
$OutConsole = 'N' 
and use that variable at many places in the script.
Write-log 'Hello World' -WriteToHost $OutConsole
This is helpful in publishing table as well as sql patching scripts.
We can't achieve this with switches. I'll make all 3 as new parameters.
#>