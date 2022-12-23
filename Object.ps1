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
