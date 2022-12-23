<#
when you use ConvertTo-SecureString and ConvertFrom-SecureString without a Key or SecureKey, 
Powershell will use Windows Data Protection API (DPAPI) to encrypt/decrypt your strings.
This means that it will only work for the same user on the same computer.

When you use a Key/SecureKey, the Advanced Encryption Standard encryption algorithm is used.
#>


$pwd = Read-Host "Enter Password" -AsSecureString 
$pwd

# bascis 
Read-Host "Enter Password" -AsSecureString |ConvertFrom-SecureString|Out-File c:\pwd.txt
get-content C:\pwd.txt
get-content C:\pwd.txt|ConvertTo-SecureString
$pwd = get-content C:\pwd.txt|ConvertTo-SecureString
[pscredential]::new('user',$pwd).GetNetworkCredential().Password
[pscredential]::new('muser',$pwd).GetNetworkCredential().Password
[pscredential]::new('fraser',$pwd).GetNetworkCredential().Password
[pscredential]::new('fraser',$pwd).GetNetworkCredential().UserName

# not safe though!
# omg! 
$pw = Read-Host -AsSecureString
[pscredential]::new('user',$pw).GetNetworkCredential().Password

# still hackable 
# :(
$creds = Get-Credential 
$creds.UserName
$creds.Password
$creds.GetNetworkCredential().UserName
$creds.GetNetworkCredential().Password

$creds = Get-Credential -UserName 'MyUser' -Message 'Please enter a secure password!'

# save to disk!
$str2 = ConvertTo-SecureString 'Password2!' -AsPlainText -Force
$str2  |ConvertFrom-SecureString |Out-File c:\pwd.txt
get-content C:\pwd.txt
get-content C:\pwd.txt|ConvertTo-SecureString
$pwd = get-content C:\pwd.txt|ConvertTo-SecureString
[pscredential]::new('fraser',$pwd).GetNetworkCredential().Password

# save to disk with a key
# AES encryption only supports 128-bit (16 bytes), 192-bit (24 bytes) or 256-bit key (32 bytes) lengths
# so we'll need to create or generate an appropriate key

[Byte[]] $key = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
$File = "C:\Password.txt"
$Password = "P@ssword1" | ConvertTo-SecureString -AsPlainText -Force
$Password | ConvertFrom-SecureString -key $key | Out-File $File
Get-Content $File
Get-Content $File | ConvertTo-SecureString -Key $key

#credential object 
$KeyFile = "\\Machine1\SharedPath\AES.key"
$Key = New-Object Byte[] 16   # You can use 16, 24, or 32 for AES
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | out-file $KeyFile

$PasswordFile = "\\Machine1\SharedPath\Password.txt"
$KeyFile = "\\Machine1\SharedPath\AES.key"
$Key = Get-Content $KeyFile
$Password = "P@ssword1" | ConvertTo-SecureString -AsPlainText -Force
$Password | ConvertFrom-SecureString -key $Key | Out-File $PasswordFile

$User = "MyUserName"
$PasswordFile = "\\Machine1\SharedPath\Password.txt"
$KeyFile = "\\Machine1\SharedPath\AES.key"
$key = Get-Content $KeyFile
$MyCredential = New-Object -TypeName System.Management.Automation.PSCredential  -ArgumentList $User, (Get-Content $PasswordFile | ConvertTo-SecureString -Key $key)
$MyCredential

#maaping a drive 
[Byte[]] $key = Get-Content "D:\install\Idera\SQLsafe_License_Key.txt" -Encoding byte
$secpasswd = Get-Content "D:\install\idera\Config.txt" | ConvertTo-SecureString -Key $key
$CredentialObject = New-Object System.Management.Automation.PSCredential ('MySVC', $secpasswd)
$UsedDriveLetterList = Get-PSDrive -PSProvider FileSystem | SELECT name
$UsedDriveLetterList = $UsedDriveLetterList.Name
$AvailableDriveLetterList = $Alphabet | ? {$_ -notin $UsedDriveLetterList}
$DriveLetter = $AvailableDriveLetterList[0]
New-PSDrive -Name "$DriveLetter" -PSProvider "FileSystem" -Root "\\$Workstation\c$\Install" -Credential $CredentialObject -ErrorAction Stop
$TestDriveResult = Get-PSDrive -Name "$DriveLetter" -PSProvider FileSystem -ErrorAction SilentlyContinue | SELECT name
$TestPathResult = Test-Path "${DriveLetter}:\SQLSafebackup"
if ($TestPathResult -eq $false) {        
        New-Item -ItemType Directory -Path "${DriveLetter}:\SQLSafebackup" -Force -ErrorAction SilentlyContinue
    }
Remove-PSDrive -Name "$DriveLetter" -ErrorAction SilentlyContinue

    