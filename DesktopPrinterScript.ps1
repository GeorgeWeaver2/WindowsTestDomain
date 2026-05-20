# Paths
$PrinterListFile = "\\DC1\Contoso\Forclients\PrinterList1.csv"
$NetworkRangesFile = "\\DC1\Contoso\Forclients\NetworkList.csv"
$DesktopFolder = "$env:USERPROFILE\Desktop\Printers"
$logfile = "c:\Contoso\PrinterScriptLog.txt"
$MyLocation = $null


#If the log file does not exist "test-path" create it and add a heade
if(-not (Test-Path $logfile)) 
{
    New-Item -ItemType File -Path $logfile 
    Add-Content -Path $logfile -Value "Log file created at $(Get-Date)"
}

# Ensure folder exists
if (-not (Test-Path $DesktopFolder)) {
    New-Item -ItemType Directory -Path $DesktopFolder 
    Add-Content -Path $logfile -Value "Created desktop folder"
}

# Get local IPv4. This command will retur na strong
$MyIP = [System.Version](Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null }).IPv4Address.IPAddress

#updAte log file with the client IP address
Add-Content -Path $logfile -Value "got client ip address $MyIP"


#gets the netowrk ranges file and pputs in and array
 $NetworkRanges = Import-csv -Path $NetworkRangesFile -header "StartIP", "EndIP", "Location"

 #verifying that the netowrk file was processed correctily
Add-Content -Path $logfile -Value  $NetworkRanges

# getsthe tarting , ending nad loation from the netowrk list file
foreach ($line in $NetworkRanges) 
{
   $StartIP = $line.StartIP
   $EndIP = $line.EndIP
   $Location = $line.Location


   If ($MyIP -ge [System.Version]$StartIP  -and $MyIP -le [System.Version]$EndIP)
    {
        $MyLocation = $location;
        break
    }

    Else
    { 
       Add-Content -Path $logfile -Value "No match for IP: $MyIP in range: $StartIP - $EndIP"
    }

}

# Load printer list
$Printers = Import-Csv -Header Location,PrinterName,UNCPath -Path $PrinterListFile

# Filter printers for this location
$LocationPrinters = $Printers | Where-Object { $_.Location -eq $MyLocation }

# Create shortcuts for each printer
foreach ($p in $LocationPrinters) {

    $ShortcutPath = Join-Path $DesktopFolder "$($p.PrinterName).lnk"

    #update log file with the printer name and location
    Add-Content -Path $logfile -Value "Creating shortcut for printer: $($p.PrinterName) at location: $MyLocation"

    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)
    

    # Shortcut runs Add-Printer
    $Shortcut.TargetPath = "powershell.exe"
    $Shortcut.Arguments = "-Command `"Add-Printer -ConnectionName '$($p.UNCPath)'`""
    $Shortcut.IconLocation = "shell32.dll, 0"
    $Shortcut.Save()
}


