install-module psreadline -Force

#after installing set this
#None: disable the predictive suggestion feature
#History: get predictive suggestions from history only
# beyond sessions!
Set-PSReadLineOption -PredictionSource History

# to get the path where history is Serverd
Get-PSReadLineOption

# Ctrl+ R #search
# F2 gives the list view
# F1 takes to help and Q will take you back

#History is saved here.
# you can manullay delete from here!
# alt+f7 will clear the history for current session
C:\Users\username\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
#history for consol
C:\Users\username\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\Visual Studio Code Host_history.txt

