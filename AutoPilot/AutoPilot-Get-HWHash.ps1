#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                          
# TITLE:     AutoPilot-Get-HWHash.ps1
# PLATFORM:  Server 2012 R2, 2016, Windows10
# CONFIGMGR: CMCB 1802,1810,1903,1909 Current Branch
# AUTHOR:    Bobbi Trehan-Young
# CREATED:   02/04/2019 15:35
# MODIFIED:  04/02/2020 16:24
# VERSION:   0.1
# COPYRIGHT (c) eTFLConsultancy. All rights reserved.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                          
# PURPOSE:  This script illustrates the following: 
#           Obtains Computer Hardware Hash & exports to a formated .CSV file
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#region -  RUN ONCE 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Set-ExecutionPolicy Unrestricted -Force

#endregion                                                     
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#region -   SCRIPT VARIABLES 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$USBDRIVE = 'D:\'
$FILEPATH = 'HWID'
$FILENAME = 'Autopilot'
$CHECKPATH = Test-Path -IsValid "$($USBDRIVE)$($FILEPATH)"

#endregion                                                     
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#region -   SCRIPT EXECUTES: 
#           - PATH VALIDATION CHECK
#           - COLLECTS HARWARE HASH
#           - WRITES TO CSV FILE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
IF ($($CHECKPATH) -eq $true) {

Write-host 'Script Path Validation Successful' -ForegroundColor Green
Set-Location "$($USBDRIVE)$($FILEPATH)"
Set-ExecutionPolicy RemoteSigned -Force
.\Get-WindowsAutoPilotInfo.ps1 -OutputFile MSProdID-$($FILENAME).csv -Verbose
}

 ELSE {
 Write-Warning "Path validation failed, Verify path location $($USBDRIVE)$($FILEPATH) is correct."
 }

    $FILECHECK = Test-Path -IsValid "$($USBDRIVE)$($FILEPATH)\MSProdID-$($FILENAME).csv"
    
    IF ($($FILECHECK) -eq $true) {
    Write-Host "$($USBDRIVE)$($FILEPATH)\MSProdID-$($FILENAME).csv Exported" -ForegroundColor Green 
    }

     ELSE {
     Write-Warning "CSV export failed, Verify script is correct."
     }
    
#endregion                                                     
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
