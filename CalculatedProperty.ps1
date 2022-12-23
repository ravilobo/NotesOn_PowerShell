$Object = [PSCustomObject]@{
 'Name'    = 'Test Object'
 'Date'    = Get-Date
 'Number'  = 100
 'Enabled' = $True
 'Extra'   = @('One','Two','Three')
}

$Object

$Object | Select-Object Name,@{
 Name = 'NewDate'
 Expression = { Get-Date $_.Date -Format "MM/dd/yyyy" }
}

# keys 
<#
Name/Label 
Expression 
Alignment – When a tabular output cmdlet is used, this will define how a values are displayed in a column using left, center, or right as the allowed values.
Formatstring – Specifies a format string, which is a .NET formatting string.
Width – For tabular output, defines the maximum width of the column, which must be greater than 0.
Depth – Only used with the Format-Custom cmdlet, this will specify the maximum depth of expansion per property.
Ascending/Descending – Specify the sort order of one or more properties, these are boolean values set to either $True or $False.
#>


Get-Service | Select-Object -First 5 -Property Name
Get-Service | Select-Object -First 5 -Property Name, status 
Get-Service | Select-Object -First 5 -Property @{Name = 'MaiSoGov'; Expression = {$_.Name}}, status 