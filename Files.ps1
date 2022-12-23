# unblock-file C:\demo\03_01_createAKSCluster.ps1

Get-ChildItem D:\PowerShell\ -Filter *archive*
Get-ChildItem -Path D:\Temp -Recurse -Include *.xml
Get-ChildItem D:\PowerShell\ -Recurse # subdirectories
Get-ChildItem D:\PowerShell\ -depth 2
Get-ChildItem D:\PowerShell\ -File # list only files
Get-ChildItem D:\PowerShell\ -Directory -Name -Exclude FTP-101, FTP-102
Get-ChildItem D:\PowerShell\ | where { ! $_.PSIsContainer } # exlude folders 



# How do I output the files being copied in console?
# PassThru will write consol
copy-item 'c:\Source\*.*' -Destination d:\dest -Force -PassThru

#compare 2 files 
$file1 = 'C:\Temp\files1.txt'
$file2 = 'C:\Temp\files2.txt'
'Hello world'|Out-File $file1 
'Hello world'|Out-File $file2 
if ((Get-FileHash $file1).Hash -eq (Get-FileHash $file2).Hash) {
  "The content of these files is same!"
} else {
  "different content!"
}


# rename file 
Rename-Item "c:\xx\xx.sql" "c:\xx\yy.sql" -Force
Rename-Item "c:\xx\xx.sql" -NewName yy.sql

# usually returns array object
# if you want a STRING, use RAW key word
$info = Get-Content $env:windir\windowsupdate.log
$info -is [Array]
True

$info = Get-Content $env:windir\windowsupdate.log -Raw
$info -is [Array]
False

#  for files with spaces
& "C:\My Scripts\Test.ps1"

powershell -noexit c:\tmp\t2.ps1

# find replace  text in files in a folder
set-location c:\temp
$PSFiles = Get-ChildItem . *.ps1 -rec
foreach ($i in $PSFiles) {
    (Get-Content $i.PSPath) |
 Foreach-Object { $_ -replace '-QueryTimeout 99999', '-QueryTimeout 10000' } |
 Set-Content $i.PSPath
}


#text replace in a single file
get-content $file
$file = '\\myserver\D$\PS\Myfile.ps1'

$i = get-item $file
(Get-Content $i.PSPath) |
Foreach-Object { $_ -replace '-QueryTimeout 99999', '-QueryTimeout 10000' } |
Set-Content $i.PSPath

#create a file
md c:\temp\non_existing_folder\non_existing_sub_folder -force
copy-item $from $to -Recurse -Force

New-Item "c:\xx\xx.sql" -type file -Force
New-Item c:\scripts\new_file.txt -type file -force -value "This is text added to the file"
'hello world'|Out-File c:\xx\xx.sql

#remove empty lines of a file
(Get-Content C:\dawn.txt) | where { $_ }

Rename-Item "c:\xx\xx.sql" "c:\xx\yy.sql" -Force
copy-Item "c:\xx\yy.sql" "c:\xx\xy.sql" -Force

rd C:\temp\xx\yy -force
rd 'C:\temp\xx\yy' -Force -Recurse  # deletes the sub folders without alert

Remove-Item  "c:\xx\xy.sql"
Remove-Item c:\scripts\* -exclude *.wav
Remove-Item c:\scripts\* -include .wav, .mp3
Remove-Item c:\scripts\*.vbs -whatif
Remove-Item c:\scripts\* -recurse

Move-Item c:\scripts\test.zip c:\test


#creating a directory
New-Item "c:\xx\bkp" -Force -type directory
New-Item "c:\xx\bkp1" -Force -type container

#test the path
Test-Path c:\scripts\test.txt
Test-Path HKCU:\Software\Microsoft\Windows\CurrentVersion

Add-Content c:\scripts\test.txt "The End"
Add-Content c:\scripts\test.txt "`nThe End"
$A = Get-Date; Add-Content c:\scripts\*.log $A

Get-Content c:\scripts\test.txt | Select-String "Failed" -quiet

Clear-Content c:\scripts\test.xls
Clear-Content c:\scripts\test.doc
Clear-Content c:\scripts\test.*


Get-Process | ConvertTo-Html | Set-Content c:\scripts\test.htm


Import-Csv c:\scripts\test.txt
Import-Csv c:\scripts\test.txt | Where-Object { $_.department -eq "Finance" }

Get-Process | Export-Csv c:\scripts\test.txt
Get-Process | Export-Csv c:\scripts\test.txt -encoding "unicode"
Get-Process | Export-Csv c:\scripts\test.txt -notype

#
Get-Process | Out-File c:\scripts\test.txt
Set-Content c:\scripts\test.txt "This is a test"


# Read
Get-Content C:\Scripts\Test.txt
Get-Content C:\Scripts\Test.txt -raw

# read line 1 to 5
(Get-Content C:\Scripts\Test.txt)[0 .. 4]

or
Get-Content C:\Scripts\Test.txt -totalcount 4

# last 3 rows in the file
(Get-Content C:\Scripts\Test.txt)[-1 .. -3]


Copy-Item -Path C:\boot.ini -Destination C:\boot.bak

#region remove N lines from a file 
#creaet the file 
$file = "C:\temp\file.txt"
Set-Content $file (1..100) -Force
Get-Content $file

# Remove N first lines
$content = Get-Content $file
$content[10..($content.length-1)]|Out-File $file -Force
Get-Content $file

# Remove N last lines
$content = Get-Content $file
$content[0..($content.length-11)]|Out-File $file -Force
Get-Content $file

# Delete everything except the last 10 lines
$content = Get-Content $file
$content[($content.length-11)..($content.length-1)]|Out-File $file -Force
Get-Content $file
#endregion 
