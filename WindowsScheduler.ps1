Get-ScheduledJob 
Get-ScheduledTask 
Invoke-Command -ComputerName MyServer { Get-ScheduledJob }
Invoke-Command -ComputerName MyServer { Get-Scheduledtask  -TaskPath "\Microsoft\Windows\PowerShell\ScheduledJobs\" }


Get-Scheduledtask  -TaskPath "\Microsoft\Windows\PowerShell\ScheduledJobs\" | select taskname, date, triggers
Get-ScheduledTaskInfo -TaskName '\Microsoft\Windows\PowerShell\ScheduledJobs\InstallUpdates 16Jan2022-04.06.44'

#code to delete older tasks 
$RetentionPeriodinMonths = 4
Get-ScheduledTask -TaskPath "\Microsoft\Windows\PowerShell\ScheduledJobs\" |
Get-ScheduledTaskInfo |  
? { $_.TaskName -like '*InstallUpdates*' -and $_.lastRunTime -le (Get-Date).AddMonths(-$RetentionPeriodinMonths) } |
select TaskName, lastruntime |
Unregister-ScheduledTask -Confirm:$false

