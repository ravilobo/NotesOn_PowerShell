get-service -name b* -Exclude bits 

# notice on the second line @ not $ !
$p = @{Name = 'b*'; Exclude = 'bits'}
Get-Service @p 