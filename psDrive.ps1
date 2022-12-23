Get-PSDrive
Get-PSProvider
Get-PSProvider -PSProvider FileSystem
Get-PSDrive -PSProvider Registry
#note this is a name!!! (not a drive letter)
#this could be useful to create a custom name in your code without fear of conflicting someone elses drive
New-PSDrive -Name MyRepo -PSProvider FileSystem -Root 'C:\Ravi\Languages' 
New-PSDrive -Name MyRepo -PSProvider FileSystem -Root 'C:\Ravi\Languages' -Scope Global # when other scripts needs to access the drive 
set-location MyRepo: 
remove-PSDrive -Name MyRepo
remove-PSDrive K, L, M

<#
persistent drive 
    use the -Persist keyword 
    can be accessed by other PS sessions 
    however get disconnected after reboot 
    to survive reboots, create the drive in profile
    needs a drive letter A-Z (not name!)
    cannot map a local folder!
#>


#region map drive
# save to disk with a key
# AES encryption only supports 128-bit (16 bytes), 192-bit (24 bytes) or 256-bit key (32 bytes) lengths
# so we'll need to create or generate an appropriate key
# note: without a key, the config file becomes specific to a computer! 
# you won't be able to use it on any other system 

# create config file 
[Byte[]] $key = (1, 5, 8, 1,7, 1, 3, 0, 1, 11, 55, 88, 65, 32, 78, 86)
$File = 'C:\Mysecure.cfg'
$Password = 'StrongPwd' | ConvertTo-SecureString -AsPlainText -Force
$Password | ConvertFrom-SecureString -key $key | Out-File $File

<#
Get-Content $File
Get-Content $File | ConvertTo-SecureString -Key $key
$pw = Get-Content $File | ConvertTo-SecureString -Key $key
[pscredential]::new('user',$pw).GetNetworkCredential().Password
#>

# map drive
[Byte[]] $key = (1, 5, 8, 1,7, 1, 3, 0, 1, 11, 55, 88, 65, 32, 78, 86)
$File = 'C:\Mysecure.cfg'
$pw = Get-Content $File | ConvertTo-SecureString -Key $key
#$PWord= [pscredential]::new('user',$pw).GetNetworkCredential().Password
$user = 'domain\user'
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PW

$RemoteDrive = 'MyDrive'
$MERemoteLocation = "\\server\S$\Backups\MyFolder" # remember no \ at th end of the path!!!!! 
if ((Get-PSDrive).Name -notcontains $RemoteDrive){
New-PSDrive -Name $RemoteDrive -PSProvider FileSystem -Root $MERemoteLocation -Credential $cred 
} else {
 Write-Host "$RemoteDrive drive alreadey exists!"
}

Remove-PSDrive $RemoteDrive
Get-PSDrive
#endregion 

#region other alternatives 
# remember no \ at th end of the path!!!!! 
$NetworkPath = "\\server\S$\SQLBackups"
$User = "domain\login"
$PWord = "########"
New-SMBMapping -LocalPath "K:" -RemotePath $NetworkPath -UserName $User -Password $PWord

net use H: \\server\S$\SQLBackups /user:domain\login @$%^^&& 
net use H: \\server\S$\SQLBackups /user:domain\login *

#endregion 

#region function drive
function Get-MrPSVersion {
 $PSVersionTable.PSVersion
}

Get-MrPSVersion

#Once loaded into memory, you can see the functions on the Function PSDrive.
Get-ChildItem -Path Function:\Get-*Version

<#
    You could close and reopen PowerShell if you want to remove functions from your
    current session. A simpler alternative is to remove them from the Function PSDrive.
#>

Get-ChildItem -Path Function:\Get-*Version | Remove-Item
# This will also remove the function loaded as a part of a module 

#Verify that they were indeed removed.

Get-ChildItem -Path Function:\Get-*Version

#If the functions were loaded as part of a module, simply unload the module to remove them.

Get-ChildItem -Path Function:\Return*
Remove-Module -Name MyModule
Get-ChildItem -Path Function:\Return*
#endregion 