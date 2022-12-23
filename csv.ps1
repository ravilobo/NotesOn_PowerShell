Get-Process m* |Export-Csv -Path c:\temp\process.csv
Get-Process m* |Export-Csv -Path c:\temp\process.csv -Delimiter ':'
notepad c:\temp\process.csv
Invoke-Item c:\temp\process.csv
get-content c:\temp\process.csv

#import 
Import-Csv c:\temp\process.csv
Import-Csv c:\temp\process.csv -Delimiter ':'
Import-Csv c:\temp\process.csv

$header = 'FirstName','LastName'
Import-Csv c:\myEmployees.csv -Header $header 

# convert
# this stays in memory 
Get-Process m* |select name, lastname|ConvertTo-Csv 
$csvData = Get-Process m* |select name, lastname|ConvertTo-Csv 
$csvData
$csvData |ConvertFrom-Csv
$csvData