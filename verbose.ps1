$VerbosePreference = 'Continue' #do this for debugging 
Write-Verbose 'Now you see me!'

$VerbosePreference = 'SilentlyContinue' #revert, post debugging 
Write-Verbose 'Now you do not!'


# when you want to turn off verbose for a commandlet inside a function 
# and global verbose setting is ON 
# use the below syntax to turn verbose for a particular commandlet 
-verbose:$false 