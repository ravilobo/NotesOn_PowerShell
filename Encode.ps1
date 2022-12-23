
$Command = 'get-services' 
$Encoded = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes($command)) 
powershell.exe -encoded $Encoded
powershell.exe -encoded ZwBlAHQALQBwAHUAYgBsAGkAcwBoAGUAcgAgAEMAMAAyADAAMQA=
#decode 
[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('ZwBlAHQALQBwAHUAYgBsAGkAcwBoAGUAcgAgAEMAMAAyADAAMQA='))


$Command = "write-output 'Hello world'"
$Encoded = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes($command)) 
powershell.exe -encoded $Encoded
powershell.exe -encoded dwByAGkAdABlAC0AbwB1AHQAcAB1AHQAIAAnAEgAZQBsAGwAbwAgAHcAbwByAGwAZAAnAA==
#decode 
[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('dwByAGkAdABlAC0AbwB1AHQAcAB1AHQAIAAnAEgAZQBsAGwAbwAgAHcAbwByAGwAZAAnAA=='))