<#
.SYNOPSIS
    This PowerShell script disables automatic sign-in of the last interactive user after a system-initiated restart.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-10-02
    Last Modified   : 2026-10-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000325
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000325/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000325.ps1
#>

# Automatically signing in the last interactive user after a system-initiated restart must be disabled

$createWinlogon = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Step 1: Create the System registry key if it does not exist
if (!(Test-Path $createWinlogon)) {
    New-Item -Path $createWinlogon -Force
}

# Step 2: Create DWORD titled "DisableAutomaticRestartSignOn" and set value to 1
New-ItemProperty `
    -Path $createWinlogon `
    -Name "DisableAutomaticRestartSignOn" `
    -PropertyType DWORD `
    -Value 1 `
    -Force

# Step 3: Confirm the configuration is set up and accurate
Get-ItemProperty `
    -Path $createWinlogon `
    -Name "DisableAutomaticRestartSignOn"