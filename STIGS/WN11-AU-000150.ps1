<#
.SYNOPSIS
    This PowerShell script enables Success auditing for Security System Extension events.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-09-30
    Last Modified   : 2026-09-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000150
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-AU-000150/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-AU-000150.ps1
#>

# Security System Extension events must be configured to audit successes

# Step 1: Enable Success auditing for Security System Extension
auditpol /set /subcategory:"Security System Extension" /success:enable

# Step 2: Confirm Success auditing is enabled
auditpol /get /subcategory:"Security System Extension"