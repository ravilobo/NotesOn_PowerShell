try {

} 

catch {            
 Write-verbose "$($_.Exception.Message)"
 return 0 
} 

finally {
 # works even after catch! 
 # use this to clean up: 
 # connection close
 # turn off global settings 
 # turn off verbose 
}