<#
.SYNOPSIS
    This PowerShell script disables the Windows Secondary Logon service.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-09-30
    Last Modified   : 2026-09-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000175
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-00-000175/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-00-000175.ps1
#>

# Secondary Logon service must be disabled on Windows 11

# Step 1: Set the Secondary Logon service startup type to Disabled
Set-Service `
    -Name "seclogon" `
    -StartupType Disabled

# Step 2: Confirm the Secondary Logon service startup type is Disabled
Get-Service `
    -Name "seclogon" |
Select-Object Name, Status, StartType