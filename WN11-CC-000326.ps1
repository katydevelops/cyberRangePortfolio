<#
.SYNOPSIS
    This PowerShell script enables PowerShell Script Block Logging on Windows 11.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-10-02
    Last Modified   : 2026-10-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000326/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000326.ps1
#>

# PowerShell Script Block Logging must be enabled on Windows 11
$createScriptBlockLogging = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"

# Step 1: Create the ScriptBlockLogging registry key if it does not exist
if (!(Test-Path $createScriptBlockLogging)) {
    New-Item -Path $createScriptBlockLogging -Force
}

# Step 2: Create DWORD titled "EnableScriptBlockLogging" and set value to 1
New-ItemProperty `
    -Path $createScriptBlockLogging `
    -Name "EnableScriptBlockLogging" `
    -PropertyType DWORD `
    -Value 1 `
    -Force

# Step 3: Confirm the configuration is set up and accurate
Get-ItemProperty `
    -Path $createScriptBlockLogging `
    -Name "EnableScriptBlockLogging"