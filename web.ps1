#stateless 

Invoke-WebRequest
Invoke-RestMethod
New-WebServiceProxy

# Use Invoke-WebRequest to get a response from a website and save it to a variable
Invoke-WebRequest -Method Get -Uri www.mattallford.com
$Result = Invoke-WebRequest -Method Get -Uri www.mattallford.com

# Explore some of the properties of the object that was returned from the web request
$Result.Links
$Result.Links.href

$Result.StatusCode
$Result.StatusDescription

$Result.Headers
$Result.Content

# Use invoke-webrequest to get an RSS feed, which is XML based data
Invoke-WebRequest -Method get -Uri https://www.reddit.com/r/PowerShell/.rss
$Result = Invoke-WebRequest -Method get -Uri https://www.reddit.com/r/PowerShell/.rss


# Invoke-WebRequest can also be used to download files from the endpoint. The example below is downloading the
# PowerShell 7 Windows MSI installer from github, and storing it in C:\Docs on the local machine
Invoke-WebRequest -Uri 'https://github.com/PowerShell/PowerShell/releases/download/v7.0.3/PowerShell-7.0.3-win-x64.msi' -OutFile C:\Docs\PowerShell7.msi


Invoke-RestMethod -Method get -Uri https://devblogs.microsoft.com/powershell/feed/
Invoke-WebRequest -Method get -Uri https://api.github.com/users/ravilobo