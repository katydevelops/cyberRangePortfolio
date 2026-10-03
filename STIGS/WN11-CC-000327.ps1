<#
.SYNOPSIS
    This PowerShell script enables PowerShell Transcription on Windows 11.

.NOTES
    Author          : Katy Senia
    LinkedIn        : linkedin.com/in/katydevelops/
    GitHub          : github.com/katydevelops
    Date Created    : 2026-10-02
    Last Modified   : 2026-10-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000327/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator and execute the script.

    Example:
    PS C:\> .\WN11-CC-000327.ps1
#>

# PowerShell Transcription must be enabled on Windows 11
$createTranscription = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

# Step 1: Create the Transcription registry key if it does not exist
if (!(Test-Path $createTranscription)) {
    New-Item -Path $createTranscription -Force
}

# Step 2: Create DWORD titled "EnableTranscripting" and set value to 1
New-ItemProperty `
    -Path $createTranscription `
    -Name "EnableTranscripting" `
    -PropertyType DWORD `
    -Value 1 `
    -Force

# Step 3: Confirm PowerShell Transcription is enabled
Get-ItemProperty `
    -Path $createTranscription `
    -Name "EnableTranscripting"