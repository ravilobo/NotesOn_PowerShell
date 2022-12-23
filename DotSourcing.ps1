<#
 - Dot-Sourcing functions

#>


.\Get-MrComputerName.ps1

# you cannot call the functions of this script 
# as soon as the script end, functions go out of memory 
# they never get loaded into function PSDrive 
# You need Dot Sourcing to load the functions in a script to function PSdrive 

#Try to call the function
Get-MrComputerName

#Check to see if the function exists on the Function PSDrive
Get-ChildItem -Path Function:\Get-MrComputerName

#The function needs to be dot-sourced to load it into the global scope
#The relative path can be used
. .\Get-MrComputerName.ps1

<#
#The fully qualified path can also be used
. C:\Demo\Get-MrComputerName.ps1
#>

#Try to call the function again
Get-MrComputerName

#Show that the function exists on the Function PS Drive
Get-ChildItem -Path Function:\Get-MrComputerName


