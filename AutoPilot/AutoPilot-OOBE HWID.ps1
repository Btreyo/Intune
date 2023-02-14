#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                          
# TITLE:     AutoPilot-Get-HWHash.ps1
# PLATFORM:  Server 2012 R2, 2016, Windows10
# CONFIGMGR: CMCB 1802,1810,1903,1909 Current Branch
# AUTHOR:    Bobbi Trehan-Young
# CREATED:   02/04/2019 15:35
# MODIFIED:  21/04/2022 16:24
# VERSION:   0.1
# COPYRIGHT (c) eTFLConsultancy. All rights reserved.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                                          
# PURPOSE:  This script illustrates the following: 
#           Obtains Computer Hardware Hash & exports to a formated .CSV file
#           - PATH VALIDATION CHECK
#           - COLLECTS HARWARE HASH
#           - IMPORTS TO INTUNE DURING OOBE (Shift+F10 at the sign-in prompt)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#region -  RUN ONCE 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#PowerShell.exe -ExecutionPolicy Bypass
#endregion                                                     
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#region -   SCRIPT VARIABLES 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$USBDRIVE = 'D:\'
$FILEPATH = 'HWID'
$CHECKPATH = Test-Path -IsValid "$($USBDRIVE)$($FILEPATH)"

#endregion                                                     
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#region -   SCRIPT EXECUTES: 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
IF ($($CHECKPATH) -eq $true) {

Write-host 'Script Path Validation Successful' -ForegroundColor Green
Set-Location "$($USBDRIVE)$($FILEPATH)"

Write-Information "Initialising..."
Install-Script -name Get-WindowsAutopilotInfo -Force
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
Get-WindowsAutoPilotInfo -Online
Write-Information "Process Complete..."

}

ELSE { Write-Warning "Completed with errors" 
}
#endregion                                                     
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
