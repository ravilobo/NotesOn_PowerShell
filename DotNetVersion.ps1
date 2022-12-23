
# username and password needs be set to the "$creds" variable 

$servers = 'Server1', 'Server2', 'Server3'
$netinfo = @()
$servcountint = 1
foreach ($server in $servers) {
 Write-Host "$servcountint of $($servers.count): $server" -ForegroundColor Green
 if (Test-Connection -ComputerName $server -Quiet -count 1) {
  $script = Invoke-command -ComputerName $server -Credential $creds -ScriptBlock {
   $Lookup = @{
    378389 = [version]'4.5'
    378675 = [version]'4.5.1'
    378758 = [version]'4.5.1'
    379893 = [version]'4.5.2'
    393295 = [version]'4.6'
    393297 = [version]'4.6'
    394254 = [version]'4.6.1'
    394271 = [version]'4.6.1'
    394802 = [version]'4.6.2'
    394806 = [version]'4.6.2'
    460798 = [version]'4.7'
    460805 = [version]'4.7'
    461308 = [version]'4.7.1'
    461310 = [version]'4.7.1'
    461808 = [version]'4.7.2'
    461814 = [version]'4.7.2'
    528040 = [version]'4.8'
    528049 = [version]'4.8'
    528372 = [version]'4.8'
   }

   $getdotnet = Get-Command dotnet -ErrorAction SilentlyContinue
   if ($null -ne $getdotnet) {
    $netcoreapp = (Get-ChildItem $getdotnet.Path.Replace('dotnet.exe', 'shared\Microsoft.NETCore.App') -WarningAction SilentlyContinue).Name
   }

   Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\full' |
   Get-ItemProperty -name Version, Release -ErrorAction SilentlyContinue |
   Select-Object @{name = "Server"; expression = { $env:COMPUTERNAME } },
   @{name = ".NET Framework"; expression = { $Lookup[$_.Release] } }, 
   @{name = ".NET Core 2"; expression = { $netcoreapp | Where-Object { $_ -like '2.*' } } },
   @{name = ".NET Core 3"; expression = { $netcoreapp | Where-Object { $_ -like '3.*' } } },
   @{name = ".NET 5"; expression = { $netcoreapp | Where-Object { $_ -like '5.*' } } },
   @{name = ".NET 6"; expression = { $netcoreapp | Where-Object { $_ -like '6.*' } } }
  }
  $netinfo += $script
 }
 else {
  write-host "`t'$server' cannot be reached." -ForegroundColor Red
 }
 $servcountint ++
}

$netinfo | Sort-Object server | Select-Object server, '.net framework', '.net core 2', '.net core 3', '.net 5', '.net 6' -ExcludeProperty pscomputername, runspaceid, PSShowComputerName | Format-Table