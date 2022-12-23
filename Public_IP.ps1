Function Get-PublicIP {
 # Gets public IP address
 (Invoke-WebRequest http://ifconfig.me/ip ).Content
}
Get-PublicIP