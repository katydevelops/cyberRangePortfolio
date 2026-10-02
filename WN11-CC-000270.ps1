<#
.SYNOPSIS
    This PowerShell script prevents passwords from being saved in the Remote Desktop Client.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000270
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000270/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000270.ps1
#>

# Passwords must not be saved in the Remote Desktop Client

$createTerminalServices = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Step 1: Create the Terminal Services registry key if it does not exist
if (!(Test-Path $createTerminalServices)) {
    New-Item -Path $createTerminalServices -Force
}

# Step 2: Create DWORD titled "DisablePasswordSaving" and set value to 1
New-ItemProperty `
    -Path $createTerminalServices `
    -Name "DisablePasswordSaving" `
    -PropertyType DWORD `
    -Value 1 `
    -Force

# Step 3: Confirm the configuration is set up and accurate
Get-ItemProperty `
    -Path $createTerminalServices `
    -Name "DisablePasswordSaving"