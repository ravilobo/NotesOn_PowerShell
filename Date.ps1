Get-Date  '03/04/1976'  # your DAY of birth 


(Get-Date).DayOfWeek           # string 
(get-date).DayOfWeek.value__   # number 


get-date 
[datetime]::now 
get-date -Format g
get-date -Format G

get-date -Format d #8/13/2013
get-date -Format D #Tuesday, August 13, 2013
get-date -Format u #2013-08-13 09:47:21Z

Get-Date -uformat %j #day of the year 
Get-Date -uformat %V #week of the year

Get-Date -format MM.dd.yyyy     #08.13.2013
Get-Date -format "yyyy MMM d"   #2013 Aug 13

(get-date).ToString('MM/dd/yyyy')


$b = Get-Date  '03/04/1976'
$b 
$c = get-date -year 2022 -Month 1 -date 31 
$c 
$c.IsDaylightSavingTime()


New-TimeSpan $(Get-Date) $(Get-Date -month 12 -day 31 -year 2006)





<#

  d    - Represents the day of the month as a number from 1 through 31.
  dd   - Represents the day of the month as a number from 01 through 31.
  ddd  - Represents the abbreviated name of the day of the week.
  h    - Represents the hour as a number from 1 through 12.
  hh   - Represents the hour as a number from 01 through 12.
  H    - Represents the hour as a number from 0 through 23.
  HH   - Represents the hour as a number from 00 through 23.
  m    - Represents the minute as a number from 0 through 59.
  mm   - Represents the minute as a number from 00 through 59.
  M    - Represents the month as a number from 1 through 12.
  MM   - Represents the month as a number from 01 through 12.
  MMM  - Represents three letter abbreviated name of the months.
  s    - Seconds from 1 - 60.
  ss   - Seconds from 01 - 60.
  t    - Represents first character of AM or PM i.e., A or P.
  tt   - AM or PM
  yy   - Two digit number for a year.
  yyyy - Four digit number for a year.
  z, zz, zzz : Represents timezone "-8","-08","-08:00" etc.

#>

 
$DeployWindowTo = get-date -hour 22   -Minute 0 -second 0
$DeployWindowTo


# loop to break after 1 minute
# can be used to break if a process runs longer 
# e.g. break if patching took longer than 6 hours
$GetPatchStartTime = get-date 
while (1 -eq 1) {
 $EndTime = get-date 
 $ts = New-TimeSpan -Start $GetPatchStartTime -End $endTime
 if ($ts.Seconds -gt 30) {     
  'Patching took too long!'
  break 
 }
 Start-Sleep -Seconds 5
}


$a = new-object system.globalization.datetimeformatinfo
$a.DayNames
$a.MonthNames
$a.AbbreviatedDayNames
$a.ShortestDayNames
$a 


#formatting 
[datetime]$d = '12/31/2022 5:10AM'
"{0:d}" -f $d 
"{0:D}" -f $d 
"{0:g}" -f $d 
"{0:f}" -f $d 
"{0:u}" -f $d 
"{0:yyyy-dd-MM}" -f $d 