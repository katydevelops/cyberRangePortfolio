<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32,768 KB (32 MB).

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-09-30
    Last Modified   : 2026-09-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v1r5/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-AU-000500.ps1
#>

# Application event log must be configured to 32,768 KB or greater

$createEventLog = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog"
$createApplication = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Step 1: Create the EventLog registry key if it does not exist
if (!(Test-Path $createEventLog)) {
    New-Item -Path $createEventLog -Force
}

# Step 2: Create the Application registry key if it does not exist
if (!(Test-Path $createApplication)) {
    New-Item -Path $createApplication -Force
}

# Step 3: Create DWORD titled "MaxSize" and set value to 32,768 KB
New-ItemProperty `
    -Path $createApplication `
    -Name "MaxSize" `
    -PropertyType DWORD `
    -Value 32768 `
    -Force

# Step 4: Confirm the configuration is set up and accurate
Get-ItemProperty `
    -Path $createApplication `
    -Name "MaxSize"