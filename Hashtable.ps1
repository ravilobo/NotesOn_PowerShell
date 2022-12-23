<#  Hastable 
  - key/value pair 
  - Keys are unique
  - when defined on a single line, semi colon seprates the keys, no need for multiple lines  
  - can be used in spallting 
  - unordered, unless the keyword [ordered] is specified
#>

$user = @{ FirstName = 'John'; LastName = 'Smith'; PhoneNumber = '555-1212' }
$user
$user.LastName
$user['firstname', 'lastname']
$user.keys 

#add values 
$user.date = Get-Date
$user['city'] = 'Seattle'
$user 

#empty hash table 
$newHashTable = @{}
$newHashTable
$newHashTable.one = 1
$newHashTable.two = 2
$newHashTable

$user.remove('city')
$user 
$user.Clear() # clears the entire hash table 

#notice no semi colon
$MultiLineHash = @{
Name  = 'Ravi'
Title = 'Cloud Architect'
Location = 'Cloud'
}


$user = [ordered]@{ FirstName = 'John'; LastName = 'Smith'; PhoneNumber = '555-1212' }
$user

$newHashTable = @{}
$newHashTable['Jan'] = '202201'
$newHashTable['Feb'] = '202202'
$newHashTable['Mar'] = '202203'
$newHashTable
$newHashTable.Jan


#region edge cases

#hash tables and reference 
$foo = @{
 a = 1
 b = 2
 c = 3
}
$foo.a

$bar = $foo 
$bar.a 
$bar.a = 'hi there!'
$foo.a 

#use CLONE if you want to ignore this behavior 
$foo = @{a = 1; b = 2; c = 3 }
$bar = $foo.Clone()
$foo.a = "Hello"
$foo.a
$bar.a
#endregion 



