
clea-host 
$data = "FName, LName, SSN" 
$data += "`nJohn, Smith, 567-678-8909"
$data += "`nTim, Little, 523-534-1452"
$data += "`nRay, Kim, 458-865-5896"
$data += "`nJohn, Doe, 567-785-8899"
$data 

$rs = ConvertFrom-csv -InputObject $data
$rs|?{$_.LName -eq 'Doe'}


#region Custom object 
$contacts = [PSCustomObject]@{
FirstName = 'John'
LastName = 'Smith'
Phone = '567-678-8909'
},
[PSCustomObject]@{
FirstName = 'Tim'
LastName = 'Little'
Phone = '523-534-1452'
}
$contacts
$contacts.FirstName
$contacts | ? {$_.LastName -eq 'Smith'}
#endregion

 #region PS table
 $table = New-Object system.Data.DataTable 'DataTable'
 $newcol = New-Object system.Data.DataColumn FirstName,([string]); $table.columns.add($newcol)
 $newcol = New-Object system.Data.DataColumn LastName,([string]); $table.columns.add($newcol)
 $newcol = New-Object system.Data.DataColumn Phone,([string]); $table.columns.add($newcol)
    

 # Get data from csv
 $file = "C:\temp\data.csv" 
 $users = Import-CSV $file -delimiter "," 
 $users | ForEach-Object {
     $row = $table.NewRow()
     $row.FirstName= ($_.FirstName)
     $row.LastName= ($_.LastName)
     $row.Phone= ($_.Phone)
     $table.Rows.Add($row)
     }
    
 # Get the data out
 $table.FirstName[0]
 #endregion 