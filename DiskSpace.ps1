# size and freespace for a drive
$server = ''
$drive = 'G'
$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $server -Filter "DeviceID='$($drive):'" |
Select-Object Size, FreeSpace
$size = [Math]::Round($disk.Size / 1gb)
$Freespace = [Math]::Round($disk.FreeSpace / 1gb)
clear-host 
"$server, $drive, $size, $freespace"