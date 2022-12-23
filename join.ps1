$in = 1, 2, 3
$out = -join $in 
$out 

-join (1, 2, 3)


(Get-PrimaryKeyColumns -Server posrepl3 -Database Serveropsv170 -Schema agreement -table agreement) -join ','

# 1 * 2* 3 * 4 * 5 
$fact = Invoke-Expression (1..5 -join '*')
$fact 

# 1 + 2 + ..
$fact = Invoke-Expression (1..10 -join '+')
$fact 

#join 
$servers = @(
 'server1'
 'server2'
 'server3'
)
$servers -join ','