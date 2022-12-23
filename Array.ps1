$a = 1..10
$a 
$a -is [array]
$a.Count
$a.Length #careful with length property on an array

#contains & in 
#both are same; use the one that makes sense to you
$a = 'Tom', 'harry',1,2,3,'Cat'
$a -contains 'cat'
$a -notcontains 'cat'
'cat' -in $a 
'cat' -notin $a 

# split partial 
$p = "mybackup-file-01-02-1867.bak"
$p.Split('-',2)
$p.Split('-',3)

# join 
$arr = 2,3,4,5
$arr 
-join $arr
$arr -join ','


#index 
(1, 2, 3)[0]
(1, 2, 3)[-1]
(1, 2, 3)[-2]


# Edge cases 
# -------------------------------------------------------------------------------------------------------------
#region Adding values to an array 
<#

When using the $array.Add()-method, you are trying to add the element into the existing array. 
An array is a collection of fixed size, so you will receive an error because it can not be extended.

$array += $element creates a new array with the same elements as old one + the new item, 
and this new larger array replaces the old one in the $array-variable

Reference: 
https://stackoverflow.com/questions/14620290/array-add-vs
#>

# use this: 
$array += "item"
# not 
$array.add('my new item')
#endregion 

#region length/Count 
# interestig array and string behavior 
clear-host 
[String[]] $CustomDatabaseList =@('')
$CustomDatabaseList.count 
$CustomDatabaseList.length 
if ($CustomDatabaseList) {
'not empty'
} else {
 'empty!'
}

[String[]] $CustomDatabaseList ='ServerOps'
$CustomDatabaseList.count 
$CustomDatabaseList.length 

if ($CustomDatabaseList) {
'not empty'
} else {
 'empty!'
}

write-output 'string-------------'

[String] $CustomDatabaseList = ''
$CustomDatabaseList.count 
$CustomDatabaseList.length 

[String] $CustomDatabaseList = 'Hello'
$CustomDatabaseList.count 
$CustomDatabaseList.length 

#endregion 

#region array copy uses references. so be careful 
$a = 1, 2, 3
$b = $a 
$a[1] = 5
$a 
$b 
#endregion 