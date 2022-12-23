# write-host in an interactive mode 
if ([Environment]::UserInteractive -eq $true) {
 Write-Host "This will show only in interactive mode" -ForegroundColor Green
}