$scriptStartTime = Get-Date

# NOTE: $PSCommandPath isn't set when running from within VSCode
$scriptDir = Split-Path -parent $PSCommandPath
Write-Output "Script dir is $scriptDir"
Import-Module "$scriptDir\supporting-functions.psm1"

# Configuration
$mlMsiUrl = "https://developer.marklogic.com/XXXdownload/binaries/10.0/MarkLogic-10.0-5.1-amd64.msi?t=rRZgwiFIC0ezWiLQbLUVq.&email=brent_d_hartwig%40hotmail.com"
$gitExeUrl = "https://github.com/git-for-windows/git/releases/download/v2.29.2.windows.2/Git-2.29.2.2-64-bit.exe"
$downloadsDir = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path

# Download and run ML's installer (MSI)
$mlMsiFileName = "$mlMsiUrl" -replace '.*/' -replace '[?].*'
$mlMsiFile = "$downloadsDir\$mlMsiFilename"
Get-URL "MarkLogic" "$mlMsiUrl" "$mlMsiFile"
Invoke-MSI "MarkLogic" "$mlMsiFile"

# TODO: How to complete the ML install / accept license?

# Download and run Git's installer (EXE)
$gitExeFileName = "$gitExeUrl" -replace '.*/' -replace '[?].*'
$gitExeFile = "$downloadsDir\$gitExeFileName"
Get-URL "Git" "$gitExeUrl" "$gitExeFile"
Invoke-EXE "Git" "$gitExeFile"

# Clone repo

# TODO: Run Gradle commands *if* ML is completely installed.

Write-Output "Script completed in $((Get-Date).Subtract($scriptStartTime).Seconds) second(s)"
