<#
.SYNOPSIS
    This PowerShell script disables AutoPlay for non-volume devices.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-09-30
    Last Modified   : 2026-09-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000180
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000180/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000180.ps1
#>

# AutoPlay must be disabled for non-volume devices

$createAutoPlay = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"

# Step 1: Create the Explorer registry key if it does not exist
if (!(Test-Path $createAutoPlay)) {
    New-Item -Path $createAutoPlay -Force
}

# Step 2: Create DWORD titled "NoAutoplayfornonVolume" and set value to 1
New-ItemProperty `
    -Path $createAutoPlay `
    -Name "NoAutoplayfornonVolume" `
    -PropertyType DWORD `
    -Value 1 `
    -Force

# Step 3: Confirm the configuration is set up and accurate
Get-ItemProperty `
    -Path $createAutoPlay `
    -Name "NoAutoplayfornonVolume"