<#
This link has good info
http://stackoverflow.com/questions/6239647/using-powershell-credentials-without-being-prompted-for-a-password

#>

#create the password 
read-host -assecurestring | convertfrom-securestring | out-file C:\securestring.txt


#map 
#persists retain the drive name even after the session is closed 
#Cannot copy the secure file to different servers
$pass = cat C:\securestring.txt | convertto-securestring                                                            
$mycred = new-object -typename System.Management.Automation.PSCredential -argumentlist 'Mysvc',$pass  
New-PSDrive -Name Z -PSProvider FileSystem -Root \\c0974-bar\c$\Install\SQLSafeBackup -Persist -Credential $mycred 


#here's another way, if you don't mind exposing the password in the script 
$Server  = $env:COMPUTERNAME
$login  = 'MyFavLogin'
$pass   = convertto-securestring -String '*********' -AsPlainText -Force                                                         
$mycred = new-object -typename System.Management.Automation.PSCredential -argumentlist $login,$pass  
New-PSDrive -Name Z -PSProvider FileSystem -Root "\\$server\c`$\Install" -Persist -Credential $mycred 


Remove-PSDrive Z


#old way 
net use \\server\share /user:<domain\username> <password>
