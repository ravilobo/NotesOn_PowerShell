
# split anomaly 
$backupFileName = 'MyServer_XYZ_mydb_SAP_202210230100.safe'
($backupFileName -Split 'Full')[0] 
$backupFileName.Split('Full')[0]

$s = 'powershell'
$s[0]
$s[3..6]

#replace 
#replace method is case sensitive, operator is not!
'Humour my Neighbours favourite colour!' -Replace 'our', 'or'
'abcdef' -replace 'dEf', 'xyz'
'abcdef' -replace 'dEf', 'xyz' -replace 'cx', '-'
'Hello World'.Replace('World', 'PowerShell')
'Hello World'.Replace('world', 'PowerShell') #fails, incorrect case
'Hello World'.Replace('world', 'PowerShell','OrdinalIgnoreCase') #supposed to work!
'Hello World'-Replace 'world', 'PowerShell' # works!

'Hello World'.Remove(3)
'Hello World'.Remove(5)
'Hello World'.Remove(7)
'Hello World'.Remove(2, 3)
'Hello World'.Remove(5, 3)
'hello world'.Substring(0, 4)

#join 
$servers = @(
 'server1'
 'server2'
 'server3'
)
$servers -join ','


"abc", "def" -Contains "def" #true 
"Windows", "PowerShell" -Contains "Shell" # false 
"Windows", "PowerShell" -match "Shell" # PowerShell 

-Contains is actually a collection operator. It is true if the collection contains the object. It is not limited to strings.
-match and -imatch are regular expression string matchers, and set automatic variables to use with captures.

"12-18" -Match "-"
"12-18".Contains("-")
"12-18" -like "*-*"
"12-18" -split "" -contains "-"

# formatting 
$s = get-service bits 
"{0} is {1}" -f $s.name, $s.status 

"{0:f}" -f 1234.5678
"{0:f0}" -f 1234.5678
"{0:f3}" -f 1234.5678
"{0:n3}" -f 1234.5678 # comma
"{0:p}" -f (45/100) # percentage
"{0:c}" -f 10.56

# reverse a string 
$MyStr = 'hello world'
([regex]::Matches($MyStr, '.', 'RightToLeft') | ForEach-Object { $_.value }) -join ''