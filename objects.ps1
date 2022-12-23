#creating a simple object 
function ReturnObject () {
 $value = '' | Select-Object -Property number, color
 $value.Number = 12
 $value.color = 'blue'
 return $value
}
$c = ReturnObject
cls
Write-Host "Values from ReturnObject are $($c.number) and $($c.color)."

# example 2
param (
 [string []] $COMPUTERNAME
)
foreach ($computer in $COMPUTERNAME) {
 $os = Get-CimInstance -computername $computer -ClassName Win32_OperatingSystem
 $cs = Get-CimInstance -computername $computer -ClassName Win32_ComputerSystem
 # hash table 
 $properties = @{ ComputerName = $computer
  SPversion                    = $os.ServicePackMajorVersion
  OSVersion                    = $os.Version
  Model                        = $cs.model 
  mfgr                         = $cs.Manufacturer
 }
 $obj = New-Object -TypeName psobject -Property $properties
 Write-Output $obj 

}
 

