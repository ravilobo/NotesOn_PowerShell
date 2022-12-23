$server = 'Server1', 'Server12', 'Server3'

foreach($serv in $server){
    Invoke-Command -ComputerName "$serv" -ScriptBlock {Restart-Computer}
}