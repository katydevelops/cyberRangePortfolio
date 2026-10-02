<#
.SYNOPSIS
    This PowerShell script prevents users from changing Windows Installer installation options.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000310
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000310/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000310.ps1
#>

# Users must be prevented from changing installation options

$createInstaller = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Step 1: Create the Installer registry key if it does not exist
if (!(Test-Path $createInstaller)) {
    New-Item -Path $createInstaller -Force
}

# Step 2: Create DWORD titled "EnableUserControl" and set value to 0
New-ItemProperty `
    -Path $createInstaller `
    -Name "EnableUserControl" `
    -PropertyType DWORD `
    -Value 0 `
    -Force

# Step 3: Confirm the configuration is set up and accurate
Get-ItemProperty `
    -Path $createInstaller `
    -Name "EnableUserControl"