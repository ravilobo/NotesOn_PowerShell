<#
  - help is packaged in modules 

#>

Get-Help #cmdlet 
Help #function
Man #alias 

#run as admin 
# by default runs once a day, unless used -force 
# exceptions are okay! This is expected. 
Update-Help 

mkdir c:\help 
save-help -Module psreadline, sqlserver, smbshare -DestinationPath c:\help -force 
#now you can do this on a not-on-n/w computer
update-help -Module psreadline, sqlserver, smbshare -SourcePath c:\help -force 
