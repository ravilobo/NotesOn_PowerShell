#region pass by reference 
function Add-Ten {
 param([ref]$Param)

 $Param.value = $Param.value + 10

}

$Number = 5
$Number
Add-Ten -param ([ref] $Number)
$Number 
#endregion 

#region check parameter is provided 
$PSBoundParameters.ContainsKey('DateFrom')
# DateFrom is the parameter. Code returns true or false 
#endregion 


#region splatting using hash tables 
$Params = @{
 Path        = ".\source.txt"
 Destination = ".\dest.txt"
}
Copy-Item @Params

#splatting using arrays
$Params = @(
 ".\source.txt",
 ".\dest.txt"
)
Copy-Item @Params
#endregion 

#region alias 
export-modulemember -function isLargeServer

Set-Alias Test-LargeServer  IsLargeServer
export-modulemember -Alias Test-LargeServer

#endregion 

#region alias parameter 
Param (
 [Parameter(Mandatory)][alias('cn', 'pscomputername')][string]$Computername = $env:COMPUTERNAME
)

#endregion 

#region dynamic param option 1
function Get-Foo {
 [CmdletBinding(DefaultParameterSetName = "set1")]
 param (
  [Parameter(ParameterSetName = "set1", Mandatory = $true, Position = 0)]
  #[Parameter(ParameterSetName="set2", Mandatory=$true, Position=0) ]
  [string]$foo1,
  [Parameter(ParameterSetName = "set2", Mandatory = $true)]
  [string]$foo2,
  [Parameter(ParameterSetName = "set2", Mandatory = $false)]
  [string]$bar
 )
 switch ($PSCmdlet.ParameterSetName) {
  "set1" {
   $Output = "Foo is $foo1"
  }
  "set2" {
   if ($bar) { $Output = "Foo is $foo1, Foo2 is $foo2. Bar is $Bar" }
   else { $Output = "Foo is $foo1, Foo2 is $foo2" }
  }
 }
 Write-Host $Output
}

Get-Foo -foo1 "Hello"
Get-Foo "Hello with no argument switch"
Get-Foo "Hello" -foo2 "There is no bar here"
Get-Foo "Hello" -foo2 "There" -bar "Three"
Get-Foo -foo1 "Hello" -bar "No foo2"        # "This Stops for input as foo2 is not specified"
get-foo -foo2 'only 2!'

#endregion 

#region dynamic param option 2
import-module sqlps
function Get-Database {
	<# 
		.SYNOPSIS 
			Dynamic validationset of databases 		
		
	#>	
	#Requires -Version 3.0
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory)][string]$server
		
	)
	
	DynamicParam {
		
		$newparams = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
		$paramattributes = New-Object System.Management.Automation.ParameterAttribute
		$paramattributes.ParameterSetName = "__AllParameterSets"
		$paramattributes.Mandatory = $false
		$systemdbs = @("master", "msdb", "model", "SSIS", "distribution")
		
		$srv = New-Object 'Microsoft.SqlServer.Management.SMO.Server' "$server"
		$dblist = ($srv.Databases).name | Where-Object { $systemdbs -notcontains $_ }
		
		$argumentlist = @()
		
		foreach ($db in $dblist) {
			$argumentlist += [Regex]::Escape($db)
		}
		
		$validationset = New-Object System.Management.Automation.ValidateSetAttribute -ArgumentList $argumentlist
		$combinedattributes = New-Object -Type System.Collections.ObjectModel.Collection[System.Attribute]
		$combinedattributes.Add($paramattributes)
		$combinedattributes.Add($validationset)
		$Databases = New-Object -Type System.Management.Automation.RuntimeDefinedParameter("Databases", [String[]], $combinedattributes)		
		$newparams.Add("Databases", $Databases)		
		return $newparams
		
	}
	
	end {
		
		$UserDb = $psboundparameters.Databases
		
		Write-Host "You picked: $UserDb"
	}
}

Clear-Host 
Get-Database -server MyServer -Databases CoLo 

#endregion 

#region accellerators 

function Test-MrIPAddress {
 [CmdletBinding()]
 param (
  [ipaddress]$IPAddress
 )
 Write-Output $IPAddress
}

Test-MrIPAddress -IPAddress 10.1.1.255
Test-MrIPAddress -IPAddress 10.1.1.256
Test-MrIPAddress -IPAddress 2001:db8::ff00:42:8329
Test-MrIPAddress -IPAddress 2001:db8:::ff00:42:8329



#You might ask, how do I find Type Accelerators? With the following code.
[psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Get |
Sort-Object -Property Value


#endregion 

#region parameter validation 
[Parameter(Mandatory)] [string]$ComputerName = $env:COMPUTERNAME #This will not work with a mandatory parameter
[ValidateNotNullOrEmpty()][string[]]$ComputerName = $env:COMPUTERNAME # use this 


function Test-ValidateScript {
 [CmdletBinding()]
 param (
  [ValidateScript({
    If ($_ -match '^(?!^(PRN|AUX|CLOCK\$|NUL|CON|COM\d|LPT\d|\..*)(\..+)?$)[^\x00-\x1f\\?*:\"";|/]+$') {
     $True
    }
    else {
     Throw "$_ is either not a valid filename or it is not recommended."
    }
   })]
  [string]$FileName
 )
 Write-Output $FileName
}

#Notice the meaningful error message.

Test-ValidateScript -FileName '.con'

#endregion 