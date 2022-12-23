
#the out goes to the console as well as to the variable 
Get-Process ls* |Tee-Object -Variable myVar 
$myVar

Get-Process ls* |Tee -Variable myVar 

#you can also use -outvariable 


# basic variables 
$x
${This is readable variable name with spaces} 

# multiple assignments 
$a = $b = $c = 159

$a 
$b 
$c 

# swapping variables 
$Value1 = 10
$Value2 = 20
$Temp = $Value1
$Value1 = $Value2
$Value2 = $Temp 

$value1
$value2 

$Value1 = 10
$Value2 = 20
$Value1, $Value2 = $Value2, $Value1 

$value1
$value2 

# special variables 
$_      # Contains the current pipeline object, used in script blocks, filters, and the where statement.
$Error  # Contains objects for which an error occurred while being processed in a cmdlet.
$Home   # Specifies the users home directory.
$PsHome # The directory where the Windows PowerShell is installed. This changes depending on where you are Windows PS or PWSH
$PSVersionTable
$PSVersionTable.PSVersion.Major
$profile
$pwd 
$pid # your current ps process id
$PSEdition

#environment variables 
Get-ChildItem env:\
$env:Path
$env:windir
$env:username
$env:COMPUTERNAME
$env:NUMBER_OF_PROCESSORS
$env:HOMEPATH
$env:PROCESSOR_ARCHITECTURE
$env:PSModulePath
$env:KUBECONFIG



#modifying environment variable
$AddThisPath = 'C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules'
[System.Environment]::SetEnvironmentVariable("PSModulePath", $Env:PSModulePath + ";$AddThisPath", "Machine")

# variables psdrive 
dir variable:
del Variable:\x
$x 

$var1
test-path variable:\var1 
del Variable:\var1


# alternate way to define variables 
#-----------------------------------------------------------------------------------------
New-Variable
Set-Variable
Remove-Variable
Get-Variable
Clear-Variable

#RO variable 
New-Variable -Name SSN -Value '567-987-7890' -Option ReadOnly
$SSN

New-Variable -Name pi -Value 3.14 -Option Constant
$pi

Set-Variable -Name SSN -Value '000-000-0000' -Force -PassThru
Set-Variable -Name PI -Value 6.24 -Force -PassThru # You can't do this, being CONSTANT 
Clear-Variable SSN 
$SSN 
Remove-Variable ssn 
