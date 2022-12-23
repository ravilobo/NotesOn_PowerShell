get-admembers 'DBA AD group'
# search for a group 
Get-ADGroup -Filter { Name -like 'DBA AD group*' } -Properties * | select -property SamAccountName
Get-ADUser -Filter 'Name -like "*lobo*"' | select samaccountname, UserPrincipalName


get-admembers 'DBA AD group_BI_Gateway'
get-admembers 'DBA AD group'
