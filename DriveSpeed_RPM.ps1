$ComputerName = ''

ForEach ($C in $ComputerName)
{
    $Hash = @{
     "ComputerName" = $C
     "namespace" = "root\Microsoft\Windows\Storage" 
     "Class" = "MSFT_PhysicalDisk"
     "ErrorAction" = "Stop"
    }
    
    Try
    {
        Get-WMIObject @Hash |
           Select-Object -Property @{N="ComputerName"; E={$C}},
                @{N="Speed(RPM)";E={$_.SpindleSpeed}}, DeviceID,
                @{N="Supported";E={$True}}
    }
    Catch
    {
        $Obj = New-Object -TypeName PSObject -Property @{
            "ComputerName" = $ComputerName
            "Speed" = $Null
            "DeviceID" = $Null
            "Supported" = $False
        }
        Write-Output $Obj
    }
    
}