<#

- (get-item -path ~).FullName # local user home directory
- get-help Get-ChildItem -online
- In the output 4 or less defaults to a table, else a list
- Null is $null
- dir function: # this is the function drive
- #requires -version 4.0  # makes the code run only on 4 or above
- AllowClobber allows to install modules that have conflicting commands in already installed modules 
- nowClobber will ensure you will not overwrite a file

#>

1..10|Sort-Object -Property {$_%2}

# write-host in an interactive mode 
if ([Environment]::UserInteractive -eq $true) {
 Write-Host "This will show only in interactive mode" -ForegroundColor Green
}

