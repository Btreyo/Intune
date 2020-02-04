# Microsoft Endpoint Manager: Intune
Contains scripts used for the Windows AutoPilot feature

# Get Computer Hardware Hash or Product ID
The AutoPilot-Get-HWHash.ps1 
: validates the script path change if necessary as this is set to: D:/HWID
: calls Get-WindowsAutoPilotInfo.ps1 to collect the hardware hash
: then exports to a .CSV file called "MSProdID-AutoPilot" 
: validates and confirms the file is ready for upload to the Intune portal.

Power on your computer, from OOBE launch CMD by Shift+F10 
    type: powershell
    type: .\AutoPilot-Get-HWHash.ps1
    