#region FORMAT 
clear-host 
Get-ChildItem C:\Ravi\ps | format-list -Property name # list 
Get-ChildItem C:\Ravi\ps | format-list -Property name, length # list 2 columns 

Get-ChildItem C:\Ravi\ps | format-wide 
Get-ChildItem C:\Ravi\ps | format-wide -Column 3
Get-ChildItem C:\Ravi\ps | format-wide -Column 3 -Property name 
Get-ChildItem C:\Ravi\ps | format-wide  -Property name -AutoSize
 


#endregion 