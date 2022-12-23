
#
[Parameter(Mandatory)][string] $Server, 
[Parameter(Mandatory)] [ValidateSet('Corp','Franch','HS')] [String] $Type,
[ValidateRange(21,65)] [Int]  $age,
[String[]] $CustomDatabaseOBJECTArray = '',
[String[]] $CustomDatabaseSTRINGArray = @(''),
[ValidateSet('Y','N')] [String] $syncServer ='N'

#default parameters 
# this is a hash table!
# can be used in a $profile
$PSDefaultParameterValues.add('Get-publisher:Server','MyServer')
$PSDefaultParameterValues
get-publisher

$PSDefaultParameterValues['Get-publisher:Server'] = 'MyServer'
$PSDefaultParameterValues
get-publisher

#disable 
$PSDefaultParameterValues['disabled'] = $true
$PSDefaultParameterValues.Clear()

