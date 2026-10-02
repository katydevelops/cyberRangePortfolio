<#
.SYNOPSIS
    This PowerShell script disables the indexing of encrypted files in Windows Search.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000305
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000305/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000305.ps1
#>

# Indexing of encrypted files must be turned off

$createWindowsSearch = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"

# Step 1: Create the Windows Search registry key if it does not exist
if (!(Test-Path $createWindowsSearch)) {
    New-Item -Path $createWindowsSearch -Force
}

# Step 2: Create DWORD titled "AllowIndexingEncryptedStoresOrItems" and set value to 0
New-ItemProperty `
    -Path $createWindowsSearch `
    -Name "AllowIndexingEncryptedStoresOrItems" `
    -PropertyType DWORD `
    -Value 0 `
    -Force

# Step 3: Confirm the configuration is set up and accurate
Get-ItemProperty `
    -Path $createWindowsSearch `
    -Name "AllowIndexingEncryptedStoresOrItems"