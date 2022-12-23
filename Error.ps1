# error color 
$host.PrivateData.ErrorForegroundColor = 'yellow'

# -ErrorAction stop is needed to pass the control to catch block 
Invoke-Sqlcmd -ServerInstance $server -query $sql -ConnectionTimeout 60 -QueryTimeout 10000 -ErrorAction stop 

# finally will execute no matter what
# it's a good place to keep clean-up code 
Try {

}
catch {

}
Finally {
 'This will execute no matter what!'
}