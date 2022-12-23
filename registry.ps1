#region registry edit 

$path = 'HKCU:\Software\BLU'
if (!(Test-Path -Path $path)) {
 New-Item -Path $path
}


$path = 'HKCU:\Software\BLU'
$name = 'UserType'
New-ItemProperty -Path $path -Name $name -PropertyType String -VBLUe '0x789'


$path = 'HKCU:\Software\BLU'
$name = 'UserFullName'
New-ItemProperty -Path $path -Name $name -PropertyType String -VBLUe 'Prashanth R. Lobo'



$path = 'HKCU:\Software\BLU'
$name = 'UserType'
$key = Get-ItemProperty -Path $path -Name $name
$key.UserType 


$path = 'HKCU:\Software\BLU'
$name = 'UserFullName'
$key = Get-ItemProperty -Path $path -Name $name
$key.UserFullName 



$path = 'HKCU:\Software\BLU'
$name = 'UserType'
Set-ItemProperty -Path $path -Name $name -VBLUe '0x849'



$path = 'HKCU:\Software\BLU'
$name = 'UserType'
Remove-ItemProperty -Path $path -Name $name  # -Confirm

$path = 'HKCU:\Software\BLU'
Remove-Item -Path $path #-Confirm

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
$name = 'UseWUServer'
$vBLUe = 0 
Set-ItemProperty -Path $path -Name $name -VBLUe  $vBLUe 

Get-ItemProperty -Path $path -Name $name
Get-ItemPropertyVBLUe -Path $path -Name $name

# remote update 
invoke-command -ComputerName MyServer -ScriptBlock {
 $path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
 $name = 'UseWUServer'
 $vBLUe = 0
 Set-ItemProperty -Path $path -Name $name -VBLUe  $vBLUe 
}
 
 
invoke-command -ComputerName MyServer -ScriptBlock {
 $path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
 $name = 'UseWUServer'
 Get-ItemPropertyVBLUe -Path $path -Name $name
}

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
$name = 'UseWUServer'
invoke-command -ComputerName MyServer -ScriptBlock { 
 Get-ItemPropertyVBLUe -Path $using:path -Name $using:name
}

 
#endregion 

#region REGISTRY 
Clear-Host 
$server = "dix-d-clmdbs-01"

$objReg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $server)
$objRegKey = $objReg.OpenSubKey("SOFTWARE\MICROSOFT\MSSQLSERVER\MSSQLSERVER\SUPERSOCKETNETLIB\TCP" )

$Key = $objRegKey.GetVBLUeNames()

$port = $objRegKey.getvBLUe($key)
$port 

#endregion 



function Test-RegistryEntry ([string] $key, [string] $name) {
 Get-ItemProperty -Path "$key" -Name "$name" -ErrorAction SilentlyContinue | Out-Null;
 return $?;
}

Test-RegistryEntry $path $name 


# test path 
test-path 'HKCU:\Software\BLU'

invoke-command -ComputerName MyServer -ScriptBlock {
 $path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' 
 Test-Path -Path $path 
}
  
$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' 
invoke-command -ComputerName MyServer -ScriptBlock { 
 Test-Path -Path $using:path 
}
  