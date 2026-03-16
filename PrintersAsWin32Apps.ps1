 <#This script gets the path for all printer objects on the print server, creeates a 1 line install (same as the location), 
 and changes them to a windows 32app so that each pritner can be installed as its own "win32" software app. 

 ITs manually creating software to avoid the print 
#>

$Printerlist1 = "PrinterList1.txt"
$Printerlist2 = "PrinterList2.txt"
$PrintServer1= "\\PrintServer1"
$PrintServer2= "\\PrintServer2"

#creaets outpit file
$OutputFolder = "PrinterScripts"


# for each loop that create a install script for each printer
foreach ($Printer in Get-Content $PrinterList1) 
{

 #gets printer path
    $PrinterPath = "$PrintServer1\$PrinterName"

    #creating the install Script  for each printer
    $FileName = "$printername.ps1"

    #adds printerpath to the script
    $Textforscript = @"
            Add-Printer -ConnectionName $PrinterPath
            "@

   $PS01Counter++
}

# for each loop that create a install script for each printer in pritner 12
foreach ($Printer in Get-Content $PrinterList1) 
{

 #gets printer path
    $PrinterPath = "\\Ps02\$PrinterName"

    #scriot for each pritner


    #adds printerpatht to scrip
    $Textforscript = @"
 Add-Printer -ConnectionName $PrinterPath
"@

$PS01Counter++
