# PS module ActiveDirectory is needed

# menthod 1 
$username = "MyDBSvc"   # no 'domain name\'
$user = Get-ADUser -Identity $username -Properties LockedOut
if ($user.LockedOut) {
    Write-Output "$username is locked"
}
else {    
    Write-Output "$username is not locked"
}

# menthod 2
net user MyDBSvc /domain 