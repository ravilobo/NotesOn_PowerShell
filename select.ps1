
# for additional details, look for: calculated property 
Get-Service | Select-Object -First 5 -Property Name
Get-Service | Select-Object -First 5 -Property Name, status 
Get-Service | Select-Object -First 5 -Property @{Name = 'MaiSoGov'; Expression = {$_.Name}}, status 

$testServices = Get-Service | Select-Object -Property Name,Status,DependentServices -First 20
$testServices | Select-Object -ExpandProperty DependentServices
$depServ = $testServices | Select-Object -ExpandProperty DependentServices -Property @{name="Depends On"; expr={$_.Name}}
$depServ | Select-Object -Property Name,Status,"Depends On"

Get-Process explorer 
Get-Process explorer | select-object -ExpandProperty Modules
Get-Process explorer | select-object -ExpandProperty Modules | Format-List
